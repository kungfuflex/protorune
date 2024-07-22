import { u128 } from "as-bignum/assembly";
import { Field } from "./fields";
import { Field as ProtoruneField } from "./fields/ProtoruneField";
import { Box } from "metashrew-as/assembly/utils/box";
import { readULEB128ToU128 } from "../leb128";
import {
  u128ToHex,
  fieldToArrayBuffer,
  fieldToU128,
  fieldTo,
  toArrayBuffer,
  fromArrayBuffer,
  toPrimitive,
  min,
  nameToArrayBuffer,
  getReservedNameFor,
} from "../utils";
import { Flag } from "./flags";
import { RuneId } from "./RuneId";
import { Edict } from "./Edict";
import { console } from "metashrew-as/assembly/utils/logging";
import {
  AMOUNT,
  SPACERS,
  RUNE_ID_TO_ETCHING,
  ETCHING_TO_RUNE_ID,
  RUNE_ID_TO_HEIGHT,
  DIVISIBILITY,
  PREMINE,
  MINTS_REMAINING,
  HEIGHTSTART,
  HEIGHTEND,
  OFFSETSTART,
  OFFSETEND,
  SYMBOL,
  CAP,
  ETCHINGS,
  OUTPOINT_TO_RUNES,
  GENESIS,
  HEIGHT_INTERVAL,
  MINIMUM_NAME,
  TWENTY_SIX,
  RESERVED_NAME,
  MAX_BYTES_LEB128_INT,
} from "./constants";
import { PROTOCOLS_TO_INDEX, PROTORUNE_TABLE } from "./tables/protorune";
import { BalanceSheet } from "./BalanceSheet";
import { RunesTransaction } from "./RunesTransaction";
import { Input, OutPoint } from "metashrew-as/assembly/blockdata/transaction";
import { SUBSIDY_HALVING_INTERVAL } from "metashrew-as/assembly/utils";
import { ProtoBurn } from "./ProtoBurn";
import { ProtoStone } from "./ProtoStone";
import { Index } from "./Indexer";
import { ProtoruneMessage } from "./ProtoruneMessage";
import { ProtoMessage } from "./protomessage";

export class RunestoneMessage {
  public fields: Map<u64, Array<u128>>;
  public edicts: Array<StaticArray<u128>>;
  protoBurns: Map<u32, ProtoBurn>;
  table: PROTORUNE_TABLE;
  constructor(
    fields: Map<u64, Array<u128>>,
    edicts: Array<StaticArray<u128>>,
    table: PROTORUNE_TABLE,
  ) {
    this.fields = fields;
    this.edicts = edicts;
    this.protoBurns = new Map<u32, ProtoBurn>();
    this.table = table;
  }
  inspect(): string {
    let result = "RunestoneMessage {\n";
    let fieldInts = this.fields.keys();
    for (let i = 0; i < fieldInts.length; i++) {
      result += "  " + fieldInts[i].toString(10) + ": [\n";
      const ary = this.fields.get(fieldInts[i]);
      for (let j = 0; j < ary.length; j++) {
        result += "    " + u128ToHex(ary[j]) + ",\n";
      }
      result += "  ]\n";
    }
    result += "  edicts: [";
    for (let i = 0; i < this.edicts.length; i++) {
      result += "    ";
      for (let j = 0; j < this.edicts[i].length; j++) {
        result += u128ToHex(this.edicts[i][j]);
      }
      if (i !== this.edicts.length - 1) result += ", ";
    }
    result += "]\n}";
    return result;
  }
  getFlag(position: u64): bool {
    if (!this.fields.has(Field.FLAGS)) return false;
    const flags = fieldToU128(this.fields.get(Field.FLAGS));
    return !u128.and(flags, u128.from(1) << (<i32>position)).isZero();
  }
  isEtching(): bool {
    return this.getFlag(Flag.ETCHING);
  }
  static parseProtocol(data: ArrayBuffer, protocol: u128): RunestoneMessage {
    return RunestoneMessage.parse(data);
  }
  mintTo(): ArrayBuffer {
    if (!this.fields.has(Field.MINT)) return changetype<ArrayBuffer>(0);
    return fieldToArrayBuffer(this.fields.get(Field.MINT));
  }
  static parse(data: ArrayBuffer): RunestoneMessage {
    const input = Box.from(data);
    let fields = new Map<u64, Array<u128>>();
    let edicts = new Array<StaticArray<u128>>(0);
    while (input.len > 0) {
      const fieldKeyHeap = u128.from(0);
      const size = readULEB128ToU128(input, fieldKeyHeap);
      if (size > MAX_BYTES_LEB128_INT) return changetype<RunestoneMessage>(0);
      input.shrinkFront(size);
      const fieldKey = fieldKeyHeap.lo;
      if (fieldKey > 22 && fieldKey % 2 == 0)
        return changetype<RunestoneMessage>(0); // cenotaph
      if (fieldKey === 0) {
        while (input.len > 0) {
          const edict = new StaticArray<u128>(4);
          for (let i = 0; i < 4; i++) {
            const edictInt = u128.from(0);
            const size = readULEB128ToU128(input, edictInt);
            if (size > MAX_BYTES_LEB128_INT)
              return changetype<RunestoneMessage>(0);
            input.shrinkFront(size);
            edict[i] = edictInt;
          }
          edicts.push(edict);
        }
      } else {
        const value = u128.from(0);
        const size = readULEB128ToU128(input, value);
        if (size > MAX_BYTES_LEB128_INT) return changetype<RunestoneMessage>(0);
        input.shrinkFront(size);
        let field: Array<u128> = changetype<Array<u128>>(0);
        if (!fields.has(fieldKey)) {
          field = new Array<u128>(0);
          fields.set(fieldKey, field);
        } else {
          field = fields.get(fieldKey);
        }
        field.push(value);
      }
    }
    return new RunestoneMessage(fields, edicts, changetype<PROTORUNE_TABLE>(0));
  }

  mint(height: u32, balanceSheet: BalanceSheet): bool {
    let mintTo = this.mintTo();
    if (changetype<usize>(mintTo) !== 0 && mintTo.byteLength == 32) {
      mintTo = RuneId.fromBytes(mintTo).toBytes();
      const name = RUNE_ID_TO_ETCHING.select(mintTo).get();
      const remaining = fromArrayBuffer(MINTS_REMAINING.select(name).get());
      if (!remaining.isZero()) {
        const heightStart = HEIGHTSTART.select(name).getValue<u64>();
        const heightEnd = HEIGHTEND.select(name).getValue<u64>();
        const offsetStart = OFFSETSTART.select(name).getValue<u64>();
        const offsetEnd = OFFSETEND.select(name).getValue<u64>();
        const etchingHeight = RUNE_ID_TO_HEIGHT.select(mintTo).getValue<u32>();
        if (
          (heightStart === 0 || height >= heightStart) &&
          (heightEnd === 0 || height < heightEnd) &&
          (offsetStart === 0 || height >= offsetStart + etchingHeight) &&
          (offsetEnd === 0 || height < etchingHeight + offsetEnd)
        ) {
          MINTS_REMAINING.select(name).set(
            toArrayBuffer(remaining - u128.from(1)),
          );
          balanceSheet.increase(
            mintTo,
            fromArrayBuffer(AMOUNT.select(name).get()),
          );
          return true;
        }
      }
    }
    return false;
  }
  static etchGenesisRune(): void {
    const name = nameToArrayBuffer("UNCOMMONGOODS");
    const spacers = 128;
    const runeId = new RuneId(1, 0).toBytes();
    ETCHING_TO_RUNE_ID.select(name).set(runeId);
    RUNE_ID_TO_ETCHING.select(runeId).set(name);
    RUNE_ID_TO_HEIGHT.select(runeId).setValue<u32>(GENESIS);
    DIVISIBILITY.select(name).setValue<u8>(1);
    AMOUNT.select(name).set(toArrayBuffer(u128.from(1)));
    CAP.select(name).set(toArrayBuffer(u128.Max));
    MINTS_REMAINING.select(name).set(toArrayBuffer(u128.Max));
    OFFSETEND.select(name).setValue<u64>(SUBSIDY_HALVING_INTERVAL);
    SPACERS.select(name).setValue<u32>(128);
    SYMBOL.select(name).setValue<u8>(<u8>"\u{29C9}".charCodeAt(0));
    ETCHINGS.append(name);
  }
  etch(
    height: u64,
    tx: u32,
    initialBalanceSheet: BalanceSheet,
    transaction: RunesTransaction,
  ): bool {
    if (!this.isEtching()) return false;
    let name: ArrayBuffer;
    let nameU128: u128;
    if (this.fields.has(Field.RUNE)) nameU128 = this.fields.get(Field.RUNE)[0];
    else nameU128 = getReservedNameFor(height, tx);
    let interval: i64 = (height - GENESIS) / HEIGHT_INTERVAL;
    let minimum_name = MINIMUM_NAME;
    if (interval > 0)
      while (interval > 0) {
        minimum_name = --minimum_name / TWENTY_SIX;
        interval--;
      }
    if (nameU128 < minimum_name || nameU128 >= RESERVED_NAME) return false;
    name = toArrayBuffer(nameU128);
    if (ETCHING_TO_RUNE_ID.select(name).get().byteLength !== 0) return false; // already taken / commitment not foun
    const runeId = new RuneId(height, tx).toBytes();
    RUNE_ID_TO_ETCHING.select(runeId).set(name);
    ETCHING_TO_RUNE_ID.select(name).set(runeId);
    RUNE_ID_TO_HEIGHT.select(runeId).setValue<u32>(<u32>height);
    if (this.fields.has(Field.DIVISIBILITY))
      DIVISIBILITY.select(name).setValue<u8>(
        fieldTo<u8>(this.fields.get(Field.DIVISIBILITY)),
      );
    if (this.fields.has(Field.PREMINE)) {
      const premine = fieldToU128(this.fields.get(Field.PREMINE));
      BalanceSheet.fromPairs([runeId], [premine]).pipe(initialBalanceSheet);
      PREMINE.select(name).set(toArrayBuffer(premine));
    }
    if (this.getFlag(Flag.TERMS)) {
      if (this.fields.has(Field.AMOUNT))
        AMOUNT.select(name).set(
          toArrayBuffer(fieldToU128(this.fields.get(Field.AMOUNT))),
        );

      if (this.fields.has(Field.CAP)) {
        CAP.select(name).set(
          toArrayBuffer(fieldToU128(this.fields.get(Field.CAP))),
        );
        MINTS_REMAINING.select(name).set(
          fieldToArrayBuffer(this.fields.get(Field.CAP)),
        );
      }
      if (this.fields.has(Field.HEIGHTSTART))
        HEIGHTSTART.select(name).setValue<u64>(
          fieldTo<u64>(this.fields.get(Field.HEIGHTSTART)),
        );
      if (this.fields.has(Field.HEIGHTEND))
        HEIGHTEND.select(name).setValue<u64>(
          fieldTo<u64>(this.fields.get(Field.HEIGHTEND)),
        );
      if (this.fields.has(Field.OFFSETSTART))
        OFFSETSTART.select(name).setValue<u64>(
          fieldTo<u64>(this.fields.get(Field.OFFSETSTART)),
        );
      if (this.fields.has(Field.OFFSETEND))
        OFFSETEND.select(name).setValue<u64>(
          fieldTo<u64>(this.fields.get(Field.OFFSETEND)),
        );
    }
    if (this.fields.has(Field.SPACERS))
      SPACERS.select(name).setValue<u32>(
        fieldTo<u32>(this.fields.get(Field.SPACERS)),
      );
    if (this.fields.has(Field.SYMBOL))
      SYMBOL.select(name).setValue<u8>(
        fieldTo<u8>(this.fields.get(Field.SYMBOL)),
      );
    ETCHINGS.append(name);
    return true;
  }

  processEdicts(
    balancesByOutput: Map<u32, BalanceSheet>,
    balanceSheet: BalanceSheet,
    txid: ArrayBuffer,
  ): bool {
    let isCenotaph: bool = false;
    const edicts = Edict.fromDeltaSeries(this.edicts);
    for (let e = 0; e < edicts.length; e++) {
      const edict = edicts[e];
      const edictOutput = toPrimitive<u32>(edict.output);
      const runeId = edict.runeId().toBytes();
      let outputBalanceSheet = changetype<BalanceSheet>(0);
      if (!balancesByOutput.has(edictOutput)) {
        balancesByOutput.set(
          edictOutput,
          (outputBalanceSheet = new BalanceSheet()),
        );
      } else outputBalanceSheet = balancesByOutput.get(edictOutput);
      const amount = min(edict.amount, balanceSheet.get(runeId));

      const canDecrease = balanceSheet.decrease(runeId, amount);
      if (!canDecrease) isCenotaph = true;
      outputBalanceSheet.increase(runeId, amount);
    }
    return isCenotaph;
  }
  process(
    tx: RunesTransaction,
    txid: ArrayBuffer,
    height: u32,
    txindex: u32,
  ): Map<u32, BalanceSheet> {
    // collect all protoburns
    let balanceSheet = BalanceSheet.concat(
      tx.ins.map<BalanceSheet>((v: Input, i: i32, ary: Array<Input>) =>
        BalanceSheet.load(
          OUTPOINT_TO_RUNES.select(v.previousOutput().toArrayBuffer()),
        ),
      ),
    );
    const balancesByOutput = new Map<u32, BalanceSheet>();

    this.mint(height, balanceSheet);
    this.etch(<u64>height, <u32>txindex, balanceSheet, tx);

    const messages = new Array<ProtoruneMessage>();
    const protomessages: Map<string, Array<ProtoMessage>> = new Map<
      string,
      Array<ProtoMessage>
    >();
    // process all protostones here
    if (this.fields.has(Field.PROTORUNE)) {
      const protostones = ProtoStone.parseFromFieldData(
        this.fields.get(Field.PROTORUNE),
      );
      for (
        let protostoneIdx = 0;
        protostoneIdx < protostones.length;
        protostoneIdx++
      ) {
        const protostone = protostones[protostoneIdx];

        if (PROTOCOLS_TO_INDEX.has(protostone.protocol_id)) {
          if (protostone.isBurn()) {
            console.log("FOUND BURN");
            const protoburn = new ProtoBurn([
              protostone.fields.get(ProtoruneField.BURN)[0],
              protostone.fields.get(ProtoruneField.POINTER)[0],
            ]);
            this.protoBurns.set(tx.outs.length + protostoneIdx, protoburn);
          }
          if (protostone.isMessage()) {
            console.log("FOUND message");
            const str = protostone.protocol_id.toString();
            let ary: Array<ProtoMessage> = new Array<ProtoMessage>();
            if (protomessages.has(str)) {
              ary = protomessages.get(str);
            }
            ary.push(ProtoMessage.from(protostone, tx.runestoneIndex));
            protomessages.set(str, ary);
          }
          if (protostone.edicts.length > 0) {
            messages.push(ProtoruneMessage.fromProtoStone(protostone));
          }
        }
      }
    }

    tx.protomessages = protomessages;

    const unallocatedTo = this.fields.has(Field.POINTER)
      ? fieldTo<u32>(this.fields.get(Field.POINTER))
      : <u32>tx.defaultOutput();

    const isCenotaph = this.processEdicts(balancesByOutput, balanceSheet, txid);
    if (balancesByOutput.has(unallocatedTo)) {
      balanceSheet.pipe(balancesByOutput.get(unallocatedTo));
    } else {
      balancesByOutput.set(unallocatedTo, balanceSheet);
    }
    const allOutputs = balancesByOutput.keys();

    // process protostone edicts
    for (let m = 0; m < messages.length; m++) {
      messages[m].process(tx, txid, height, m);
    }

    // process protoburns
    for (let x = 0; x < allOutputs.length; x++) {
      const output = allOutputs[x];
      const sheet = balancesByOutput.get(output);
      sheet.save(
        OUTPOINT_TO_RUNES.select(OutPoint.from(txid, output).toArrayBuffer()),
        isCenotaph,
      );
      // save protoburns to index
      if (this.protoBurns.has(output) && !isCenotaph) {
        const protoBurn = this.protoBurns.get(output);
        protoBurn.process(
          sheet,
          OutPoint.from(txid, protoBurn.pointer).toArrayBuffer(),
        );
      }
    }
    return balancesByOutput;
  }
}
