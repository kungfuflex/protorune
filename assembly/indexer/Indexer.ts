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

        const balancesByOutput = new Map<u32, BalanceSheet>();
        const hasMinted = message.mint(height, changetype<usize>(balanceSheet));
        const hasEtched = message.etch(
          <u64>height,
          <u32>i,
          changetype<usize>(balanceSheet)
        );

        if (hasMinted || hasEtched) {
          const unallocatedTo = message.fields.has(Field.POINTER)
            ? fieldTo<u32>(message.fields.get(Field.POINTER))
            : <u32>tx.defaultOutput();
          if (balancesByOutput.has(unallocatedTo)) {
            balanceSheet.pipe(balancesByOutput.get(unallocatedTo));
          } else {
            balancesByOutput.set(unallocatedTo, balanceSheet);
          }
        }
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

          balanceSheet.decrease(runeId, amount);
          outputBalanceSheet.increase(runeId, amount);
        }

        const runesToOutputs = balancesByOutput.keys();

        for (let x = 0; x < runesToOutputs.length; x++) {
          const sheet = balancesByOutput.get(runesToOutputs[x]);
          sheet.save(
            OUTPOINT_TO_RUNES.select(
              OutPoint.from(txid, runesToOutputs[x]).toArrayBuffer()
            )
          );
        }
      }
    }
  }
}
