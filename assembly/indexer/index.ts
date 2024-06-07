import { BalanceSheet } from "./BalanceSheet";
import { Box } from "metashrew-as/assembly/utils/box";
import { Edict } from "./Edict";
import { RuneId } from "./RuneId";
import { RunesBlock } from "./RunesBlock";
import { RunestoneMessage } from "./RunestoneMessage";
import { RunesTransaction } from "./RunesTransaction";
import { Block } from "metashrew-as/assembly/blockdata/block";
import { IndexPointer } from "metashrew-as/assembly/indexer/tables";
import { console } from "metashrew-as/assembly/utils/logging";
import { intoString, scriptParse } from "metashrew-as/assembly/utils/yabsp";
import { Flag } from "./Flag";
import { Field } from "./Field";
import { u256, u128 } from "as-bignum/assembly";
import { Script } from "metashrew-as/assembly/utils/yabsp";
import { Address } from "metashrew-as/assembly/blockdata/address";
import { console } from "metashrew-as/assembly/utils/logging";
import {
  fieldTo,
  toPrimitive,
  fieldToArrayBuffer,
  fieldToName,
  toArrayBuffer,
  stripNullRight,
  fromArrayBuffer,
  inspectEdicts,
  min,
  fieldToU128,
} from "../utils";
import {
  OUTPOINT_TO_RUNES,
  OUTPOINT_TO_HEIGHT,
  HEIGHT_TO_BLOCKHASH,
  BLOCKHASH_TO_HEIGHT,
  HEIGHT_TO_TRANSACTION_IDS,
  GENESIS,
  RUNE_ID_TO_ETCHING,
  MINTS_REMAINING,
  HEIGHTSTART,
  HEIGHTEND,
  OFFSETSTART,
  OFFSETEND,
  RUNE_ID_TO_HEIGHT,
  ETCHING_TO_RUNE_ID,
  DIVISIBILITY,
  PREMINE,
  SYMBOL,
  CAP,
  AMOUNT,
  SPACERS,
} from "./constants";
import {
  Transaction,
  Input,
  Output,
  OutPoint,
} from "metashrew-as/assembly/blockdata/transaction";
import { encodeHexFromBuffer } from "metashrew-as/assembly/utils/hex";
import { trap } from "../";

export class Index {
  static indexOutpoints(
    tx: RunesTransaction,
    txid: ArrayBuffer,
    height: u32
  ): void {
    for (let i: i32 = 0; i < tx.outs.length; i++) {
      OUTPOINT_TO_HEIGHT.select(
        OutPoint.from(txid, <u32>i).toArrayBuffer()
      ).setValue<u32>(height);
    }
  }
  static findCommitment(
    tx: RunesTransaction,
    name: ArrayBuffer,
    height: u32
  ): ArrayBuffer {
    for (let i = 0; i < tx.ins.length; i++) {
      const input = tx.ins[i];
      // check that there is 1 data push
      const inscription = input.inscription();
      if (changetype<usize>(inscription) === 0) continue;
      const commitment = inscription.body();
      if (!commitment) continue;
      const previousOutpoint = tx.ins[i].previousOutput().toArrayBuffer();
      if (
        height - OUTPOINT_TO_HEIGHT.select(previousOutpoint).getValue<u32>() >=
        6
      ) {
        // check the commitment has at least 6 confirmations
        if (isEqualArrayBuffer(name, commitment)) return commitment;
      }
    }
    return changetype<ArrayBuffer>(0);
  }
  static indexBlock(height: u32, _block: Block): void {
    const block = changetype<RunesBlock>(_block);
    console.log("METASHREW_RUNES_LOG::indexing block: " + height.toString());
    HEIGHT_TO_BLOCKHASH.selectValue<u32>(height).set(block.blockhash());
    BLOCKHASH_TO_HEIGHT.select(block.blockhash()).setValue<u32>(height);
    block.saveTransactions(height);
    for (let i: i32 = 0; i < block.transactions.length; i++) {
      const tx = block.getTransaction(i);
      const txid = tx.txid();
      Index.indexOutpoints(tx, txid, height);
      const runestoneOutputIndex = tx.runestoneOutputIndex();
      if (height >= GENESIS && runestoneOutputIndex !== -1) {
        const runestoneOutput = tx.outs[runestoneOutputIndex];
        const outpoint = tx.outpoint(runestoneOutputIndex);
        const parsed = scriptParse(runestoneOutput.script).slice(2);
        if (
          parsed.findIndex((v: Box, i: i32, ary: Array<Box>) => {
            return v.start === usize.MAX_VALUE;
          }) !== -1
        )
          continue; // non-data push: cenotaph
        const payload = Box.concat(parsed);
        const message = RunestoneMessage.parse(payload);
        if (changetype<usize>(message) === 0) continue;
        const edicts = Edict.fromDeltaSeries(message.edicts);
        let etchingBalanceSheet = changetype<BalanceSheet>(0);
        let balanceSheet = BalanceSheet.concat(
          tx.ins.map<BalanceSheet>((v: Input, i: i32, ary: Array<Input>) =>
            BalanceSheet.load(
              OUTPOINT_TO_RUNES.select(v.previousOutput().toArrayBuffer())
            )
          )
        );
        let mintTo = message.mintTo();

        if (changetype<usize>(mintTo) != 0 && mintTo.byteLength == 32) {
          mintTo = RuneId.fromBytes(mintTo).toBytes();
          const name = RUNE_ID_TO_ETCHING.select(mintTo).get();

          const remaining = fromArrayBuffer(MINTS_REMAINING.select(name).get());
          if (!remaining.isZero()) {
            if (height == 840003 && i == 4807) {
              console.log(
                fromArrayBuffer(AMOUNT.select(name).get(), true).toString()
              );
              console.log(fromArrayBuffer(name).toString());
              trap();
            }
            const heightStart = HEIGHTSTART.select(name).getValue<u64>();
            const heightEnd = HEIGHTEND.select(name).getValue<u64>();
            const offsetStart = OFFSETSTART.select(name).getValue<u64>();
            const offsetEnd = OFFSETEND.select(name).getValue<u64>();
            const etchingHeight =
              RUNE_ID_TO_HEIGHT.select(mintTo).getValue<u32>();
            if (
              (heightStart === 0 || height >= heightStart) &&
              (heightEnd === 0 || height < heightEnd) &&
              (offsetStart === 0 || height >= offsetStart + etchingHeight) &&
              (offsetEnd === 0 || height < etchingHeight + offsetEnd)
            ) {
              MINTS_REMAINING.select(name).set(
                toArrayBuffer(remaining - u128.from(1))
              );
              balanceSheet.increase(
                mintTo,
                fromArrayBuffer(AMOUNT.select(name).get())
              );
            }
          }
        }
        if (message.isEtching()) {
          const name = fieldToArrayBuffer(message.fields.get(Field.RUNE));
          // if (
          //   ETCHING_TO_RUNE_ID.select(name).get().byteLength !== 0 ||
          //   !Index.findCommitment(tx, name, height)
          // )
          //   continue; // already taken / commitment not foun
          const runeId = new RuneId(<u64>height, <u32>i).toBytes();
          const ar = Uint8Array.wrap(runeId);
          RUNE_ID_TO_ETCHING.select(runeId).set(name);
          ETCHING_TO_RUNE_ID.select(name).set(runeId);
          RUNE_ID_TO_HEIGHT.select(runeId).setValue<u32>(height);
          if (message.fields.has(Field.DIVISIBILITY))
            DIVISIBILITY.select(name).setValue<u8>(
              fieldTo<u8>(message.fields.get(Field.DIVISIBILITY))
            );
          if (message.fields.has(Field.PREMINE)) {
            const premine = fieldToU128(message.fields.get(Field.PREMINE));
            BalanceSheet.fromPairs([runeId], [premine]).pipe(balanceSheet);
            PREMINE.select(name).set(toArrayBuffer(premine));
          }
          if (message.getFlag(Flag.TERMS)) {
            if (message.fields.has(Field.AMOUNT))
              AMOUNT.select(name).set(
                toArrayBuffer(fieldToU128(message.fields.get(Field.AMOUNT)))
              );

            if (height == 840000 && i == 22) {
              console.log(
                fieldToU128(message.fields.get(Field.AMOUNT)).toString()
              );
              console.log(fromArrayBuffer(name).toString());
              console.log(
                fromArrayBuffer(AMOUNT.select(name).get(), true).toString()
              );
            }
            if (message.fields.has(Field.CAP)) {
              CAP.select(name).set(
                toArrayBuffer(fieldToU128(message.fields.get(Field.CAP)))
              );
              MINTS_REMAINING.select(name).set(
                fieldToArrayBuffer(message.fields.get(Field.CAP))
              );
            }
            if (message.fields.has(Field.HEIGHTSTART))
              HEIGHTSTART.select(name).setValue<u64>(
                fieldTo<u64>(message.fields.get(Field.HEIGHTSTART))
              );
            if (message.fields.has(Field.HEIGHTEND))
              HEIGHTEND.select(name).setValue<u64>(
                fieldTo<u64>(message.fields.get(Field.HEIGHTEND))
              );
            if (message.fields.has(Field.OFFSETSTART))
              OFFSETSTART.select(name).setValue<u64>(
                fieldTo<u64>(message.fields.get(Field.OFFSETSTART))
              );
            if (message.fields.has(Field.OFFSETEND))
              OFFSETEND.select(name).setValue<u64>(
                fieldTo<u64>(message.fields.get(Field.OFFSETEND))
              );
          }
          if (message.fields.has(Field.SPACERS))
            SPACERS.select(name).setValue<u32>(
              fieldTo<u32>(message.fields.get(Field.SPACERS))
            );
          if (message.fields.has(Field.SYMBOL))
            SYMBOL.select(name).setValue<u8>(
              fieldTo<u8>(message.fields.get(Field.SYMBOL))
            );
        }
        const balancesByOutput = new Map<u32, BalanceSheet>();
        for (let e = 0; e < edicts.length; e++) {
          const edict = edicts[e];
          const edictOutput = toPrimitive<u32>(edict.output);
          const runeId = edict.runeId().toBytes();
          let outputBalanceSheet = changetype<BalanceSheet>(0);
          if (!balancesByOutput.has(edictOutput)) {
            balancesByOutput.set(
              edictOutput,
              (outputBalanceSheet = new BalanceSheet())
            );
          } else outputBalanceSheet = balancesByOutput.get(edictOutput);
          const amount = min(edict.amount, balanceSheet.get(runeId));

          if (height == 840013 && i == 3952) {
            console.log(amount.toString());
          }
          balanceSheet.decrease(runeId, amount);
          outputBalanceSheet.increase(runeId, amount);
        }
        const unallocatedTo = message.fields.has(Field.POINTER)
          ? fieldTo<u32>(message.fields.get(Field.POINTER))
          : <u32>tx.defaultOutput();

        if (balancesByOutput.has(unallocatedTo)) {
          balanceSheet.pipe(balancesByOutput.get(unallocatedTo));
        } else {
          balancesByOutput.set(unallocatedTo, balanceSheet);
        }
        const runesToOutputs = balancesByOutput.keys();

        for (let x = 0; x < runesToOutputs.length; x++) {
          const sheet = balancesByOutput.get(runesToOutputs[x]);
          if (height == 840013 && i == 3952) console.log(sheet.inspect());
          sheet.save(
            OUTPOINT_TO_RUNES.select(
              OutPoint.from(txid, runesToOutputs[x]).toArrayBuffer()
            ),
            height == 840013 && i == 3952
          );
        }
        if (height == 840013 && i == 3952) {
          console.log(inspectEdicts(edicts));
          trap();
        }
      }
    }
  }
}
