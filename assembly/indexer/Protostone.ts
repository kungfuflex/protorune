import { u128 } from "as-bignum/assembly";
import { ProtoruneField } from "./fields/ProtoruneField";
import { ProtoruneTable } from "./tables/protorune";
import { Box } from "metashrew-as/assembly/utils/box";
import { reverse } from "metashrew-as/assembly/utils/utils";
import { readULEB128ToU128 } from "metashrew-runes/assembly/leb128";
import { BalanceSheet } from "metashrew-runes/assembly/indexer/BalanceSheet";
import {
  Input,
  OutPoint,
  Output,
} from "metashrew-as/assembly/blockdata/transaction";
import { RunesTransaction } from "metashrew-runes/assembly/indexer/RunesTransaction";
import { RunestoneMessage } from "metashrew-runes/assembly/indexer/RunestoneMessage";
import { ProtoMessage } from "./protomessage";
import { Protoburn } from "./Protoburn";
import {
  u128ToHex,
  fieldToU128,
  toArrayBuffer,
  fieldToArrayBuffer,
  toPrimitive,
  fieldTo,
} from "metashrew-runes/assembly/utils";
import { fieldToArrayBuffer15Bytes } from "../utils";
import { console } from "metashrew-as/assembly/utils/logging";
import { PROTOCOL_FIELD } from "../constants";
import { Edict } from "metashrew-runes/assembly/indexer/Edict";
import { Field } from "metashrew-runes/assembly/indexer/Field";
import { encodeHexFromBuffer } from "metashrew-as/assembly/utils";
import { concatByteArray15BytesPerU128, byteLengthForNVarInts } from "../utils";
import { ProtoruneRuneId } from "./ProtoruneRuneId";
import { RuneId } from "metashrew-runes/assembly/indexer/RuneId";

function logProtoruneField(ary: Array<u128>): void {
  console.log(Box.from(concatByteArray15BytesPerU128(ary)).toHexString());
}

class BalanceSheetReduce {
  public table: ProtoruneTable;
  public sheets: Array<BalanceSheet>;
  constructor(table: ProtoruneTable) {
    this.table = table;
    this.sheets = new Array<BalanceSheet>(0);
  }
  concat(): BalanceSheet {
    return BalanceSheet.concat(this.sheets);
  }
}

export class ProtoMessageReduce {
  public accumulated: Array<ProtoMessage>;
  public voutStart: u32;
  constructor(voutStart: u32) {
    this.voutStart = voutStart;
    this.accumulated = new Array<ProtoMessage>();
  }
  static from(voutStart: u32): ProtoMessageReduce {
    return new ProtoMessageReduce(voutStart);
  }
}

export class ProtostoneTable {
  public list: Array<Protostone>;
  public voutStart: u32;
  constructor(v: Array<Protostone>, voutStart: u32) {
    this.list = v;
    this.voutStart = voutStart;
  }
  static from(
    ary: Array<u128>,
    voutStart: u32,
    unallocatedTo: u32,
  ): ProtostoneTable {
    const list = Protostone.parseFromFieldData(ary, unallocatedTo);
    return new ProtostoneTable(list, voutStart);
  }
  burns(): Array<Protoburn> {
    return this.list
      .filter((v: Protostone) => v.protocolTag === u128.from(13) && v.isBurn())
      .map(
        (v: Protostone) =>
          new Protoburn([
            v.fields.get(ProtoruneField.BURN)[0],
            v.fields.get(ProtoruneField.POINTER)[0]
	  ].concat(v.fields.has(ProtoruneField.FROM) ? v.fields.get(ProtoruneField.FROM) : []))
      );
  }
  messages(): Array<ProtoMessage> {
    return this.list.reduce(
      (
        r: ProtoMessageReduce,
        v: Protostone,
        i: i32,
        ary: Array<Protostone>,
      ) => {
        if (v.isMessage()) {
          r.accumulated.push(ProtoMessage.from(v, r.voutStart + i));
        }
        return r;
      },
      ProtoMessageReduce.from(this.voutStart),
    ).accumulated;
  }
  flat(): Array<Protostone> {
    return this.list;
  }
}

export class Protostone extends RunestoneMessage {
  public fields: Map<u64, Array<u128>>;
  public edicts: Array<StaticArray<u128>>;
  public nextIndex: i32 = -1;
  public protocolTag: u128 = u128.Zero;
  public table: ProtoruneTable;
  public etchEnabled: bool = false;
  public openMint: bool = false;
  constructor(
    fields: Map<u64, Array<u128>>,
    edicts: Array<StaticArray<u128>>,
    protocolTag: u128,
    unallocatedTo: u32,
  ) {
    super(fields, edicts, unallocatedTo);
    this.fields = fields;
    this.edicts = edicts;
    this.protocolTag = protocolTag;
    this.table = ProtoruneTable.for(protocolTag);
  }
  protostones(voutStart: u32): ProtostoneTable {
    if (!this.fields.has(PROTOCOL_FIELD))
      return ProtostoneTable.from(
        new Array<u128>(),
        voutStart,
        this.unallocatedTo,
      );
    return ProtostoneTable.from(
      this.fields.get(PROTOCOL_FIELD),
      voutStart,
      this.unallocatedTo,
    );
  }
  static from(v: RunestoneMessage): Protostone {
    return changetype<Protostone>(v);
  }
  inspect(): string {
    let result = "Protostone {\n";
    let fieldInts = this.fields.keys();
    for (let i = 0; i < fieldInts.length; i++) {
      result += "  " + fieldInts[i].toString(10) + ": [\n";
      const ary = this.fields.get(fieldInts[i]);
      for (let j = 0; j < ary.length; j++) {
        result += "    " + u128ToHex(ary[j]) + ",\n";
      }
      result += "  ]\n";
    }
    result += "}\n";
    // result += "  edicts: [";
    // for (let i = 0; i < this.edicts.length; i++) {
    //   result += "    ";
    //   for (let j = 0; j < this.edicts[i].length; j++) {
    //     result += u128ToHex(this.edicts[i][j]);
    //   }
    //   if (i !== this.edicts.length - 1) result += ", ";
    // }
    // result += "]\n}";
    return result;
  }

  buildRuneIdForMint(bytes: ArrayBuffer): ArrayBuffer {
    return ProtoruneRuneId.fromBytes(bytes).toBytes();
  }

  buildRuneId(height: u64, tx: u32): ArrayBuffer {
    return new ProtoruneRuneId(height, tx).toBytes();
  }

  getReservedNameFor(height: u64, tx: u32): ArrayBuffer {
    //@TODO: override this
    return super.getReservedNameFor(height, tx);
  }

  mint(height: u32, balanceSheet: BalanceSheet): bool {
    if (!this.openMint) return this.openMint;
    return super.mint(height, balanceSheet);
  }
  etch(
    height: u64,
    tx: u32,
    initialBalanceSheet: BalanceSheet,
    transaction: RunesTransaction,
  ): bool {
    if (!this.etchEnabled) return this.etchEnabled;
    const res = super.etch(height, tx, initialBalanceSheet, transaction);
    this.table.INTERNAL_MINT.select(
      new RuneId(height, tx).toBytes(),
    ).setValue<bool>(true);
    return res;
  }
  isMessage(): bool {
    return this.fields.has(ProtoruneField.MESSAGE);
  }
  toMessage(vout: u32): ProtoMessage {
    return ProtoMessage.from(this, vout);
  }
  isBurn(): bool {
    return this.fields.has(ProtoruneField.BURN);
  }
  toBurn(): Protoburn {
    return new Protoburn([
      this.fields.get(ProtoruneField.BURN)[0],
      this.fields.get(ProtoruneField.POINTER)[0],
    ]);
  }
  isSplit(): bool {
    return this.fields.has(ProtoruneField.SPLIT);
  }
  chunk(): ArrayBuffer {
    const chunks = this.fields.get(ProtoruneField.CHUNK);
    if (chunks.length == 0) return new ArrayBuffer(0);
    return fieldToArrayBuffer(chunks);
  }

  splits(): Array<u32> {
    const splits = this.fields.get(ProtoruneField.SPLIT);

    if (splits.length > 0) {
      return splits.map<u32>((d) => d.toU32());
    }
    return changetype<Array<u32>>(0);
  }

  static parseFromFieldData(
    fieldData: Array<u128>,
    unallocatedTo: u32,
  ): Array<Protostone> {
    const input = Box.from(concatByteArray15BytesPerU128(fieldData));
    const result: Array<Protostone> = new Array<Protostone>();
    while (input.len > 0) {
      const protocolTag = u128.from(0);
      let size = readULEB128ToU128(input, protocolTag);
      if (protocolTag.isZero()) {
        // For the very last u128, not all bytes may be used (due to LEB format)
        //console.log("Found protocol id 0, breaking...");
        break;
      }
      if (size === usize.MAX_VALUE) return changetype<Protostone[]>(0); //can choose to continue or return
      input.shrinkFront(size);

      const len = u128.from(0); //assuming len is encoded as the number of bytes needed to read
      size = readULEB128ToU128(input, len);
      if (size === usize.MAX_VALUE) return changetype<Protostone[]>(0); //can choose to continue or return
      input.shrinkFront(size);
      const byteLength = byteLengthForNVarInts(input, len.lo);
      const protostone = Protostone.parseIntoProtostone(
        input.sliceTo(input.start + byteLength),
        protocolTag,
        unallocatedTo,
      );
      result.push(protostone);
      input.shrinkFront(<u32>byteLength);
    }
    return result;
  }
  saveBalanceSheet(
    sheet: BalanceSheet,
    txid: ArrayBuffer,
    output: u32,
    isCenotaph: bool,
  ): void {
    sheet.save(
      this.table.OUTPOINT_TO_RUNES.select(
        OutPoint.from(txid, output).toArrayBuffer(),
      ),
      isCenotaph,
    );
  }
  loadBalanceSheet(tx: RunesTransaction): BalanceSheet {
    return tx.ins
      .reduce<BalanceSheetReduce>(
        (r: BalanceSheetReduce, v: Input, i: i32, ary: Array<Input>) => {
          r.sheets.push(
            BalanceSheet.load(
              r.table.OUTPOINT_TO_RUNES.select(
                v.previousOutput().toArrayBuffer(),
              ),
            ),
          );
          return r;
        },
        new BalanceSheetReduce(this.table),
      )
      .concat();
  }
  static parseIntoProtostone(
    input: Box,
    protocolTag: u128,
    unallocatedTo: u32,
  ): Protostone {
    // console.log("Inside protostone.parse" + input.toHexString());
    let fields = new Map<u64, Array<u128>>();
    let edicts = new Array<StaticArray<u128>>(0);
    while (input.len > 0) {
      const fieldKeyHeap = u128.from(0);
      const size = readULEB128ToU128(input, fieldKeyHeap);
      if (size === usize.MAX_VALUE) return changetype<Protostone>(0);
      input.shrinkFront(size);
      const fieldKey = fieldKeyHeap.lo;
      // console.log("GOT FIELDKEY " + fieldKey.toString());
      if (fieldKey === 0) {
        while (input.len > 0) {
          const edict = new StaticArray<u128>(4);
          for (let i = 0; i < 4; i++) {
            const edictInt = u128.from(0);
            const size = readULEB128ToU128(input, edictInt);
            if (usize.MAX_VALUE === size) return changetype<Protostone>(0);
            input.shrinkFront(size);
            edict[i] = edictInt;
          }
          edicts.push(edict);
        }
      } else {
        const value = u128.from(0);
        const size = readULEB128ToU128(input, value);
        if (usize.MAX_VALUE === size) return changetype<Protostone>(0);
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
    return new Protostone(fields, edicts, protocolTag, unallocatedTo);
  }

  processEdict(
    balancesByOutput: Map<u32, BalanceSheet>,
    balanceSheet: BalanceSheet,
    edict: Edict,
    outputs: Array<Output>,
  ): bool {
    if (edict.block.isZero() && !edict.transactionIndex.isZero()) {
      return true;
    }
    const runeId = edict.runeId().toBytes();

    const edictOutput = toPrimitive<u32>(edict.output);
    if (edictOutput == outputs.length) {
      if (edict.amount.isZero()) {
        const numNonOpReturnOuts: u128 = this.numNonOpReturnOutputs(outputs);
        if (!numNonOpReturnOuts.isZero()) {
          const amountSplit = u128.div(
            balanceSheet.get(runeId),
            numNonOpReturnOuts,
          );
          const amountSplitPlus1 = amountSplit.preInc();
          const numRemainder = u128.rem(
            balanceSheet.get(runeId),
            numNonOpReturnOuts,
          );
          let extraCounter: u64 = 0;
          for (let i = 0; i < outputs.length; i++) {
            if (this.isNonOpReturnOutput(outputs[i])) {
              if (extraCounter < numRemainder.lo) {
                this.updateBalancesForEdict(
                  balancesByOutput,
                  balanceSheet,
                  amountSplitPlus1,
                  i,
                  runeId,
                );
                extraCounter++;
              } else {
                this.updateBalancesForEdict(
                  balancesByOutput,
                  balanceSheet,
                  amountSplit,
                  i,
                  runeId,
                );
              }
            }
          }
        }
      } else {
        for (let i = 0; i < outputs.length; i++) {
          if (this.isNonOpReturnOutput(outputs[i])) {
            this.updateBalancesForEdict(
              balancesByOutput,
              balanceSheet,
              edict.amount,
              i,
              runeId,
            );
          }
        }
      }

      return false;
    } else {
      this.updateBalancesForEdict(
        balancesByOutput,
        balanceSheet,
        edict.amount,
        edictOutput,
        runeId,
      );
      return false;
    }
  }
}
