import { u128 } from "as-bignum/assembly";
import { ProtoruneField } from "./fields/ProtoruneField";
import { ProtoruneTable } from "./tables/protorune";
import { Box } from "metashrew-as/assembly/utils/box";
import { reverse } from "metashrew-as/assembly/utils/utils";
import { readULEB128ToU128 } from "metashrew-runes/assembly/leb128";
import { BalanceSheet } from "metashrew-runes/assembly/indexer/BalanceSheet";
import { Input, OutPoint } from "metashrew-as/assembly/blockdata/transaction";
import { RunesTransaction } from "metashrew-runes/assembly/indexer/RunesTransaction";
import { RunestoneMessage } from "metashrew-runes/assembly/indexer/RunestoneMessage";
import {
  u128ToHex,
  fieldToU128,
  toArrayBuffer,
  fieldToArrayBuffer
} from "metashrew-runes/assembly/utils";
import {
  fieldToArrayBuffer15Bytes
} from "../utils";
import { Flag } from "./flags/ProtoruneFlag";
import { console } from "metashrew-as/assembly/utils/logging";

function logProtoruneField(ary: Array<u128>): void {
  console.log(Box.from(concatByteArray(ary)).toHexString());
}

function alignArrayBuffer(v: ArrayBuffer): Box {
  const box = Box.from(v);
  while (box.len !== 0) {
    if (load<u8>(box.start) === 0) box.shrinkFront(1);
    else break;
  }
  return box;
}

function alignU128ToArrayBuffer(v: u128): Box {
  return alignArrayBuffer(reverse(toArrayBuffer(v)));
}

function snapTo15Bytes(v: Box): Box {
  const box = v.sliceFrom(0);
  box.shrinkFront(1);
  return box;
}

function concatByteArray(v: Array<u128>): ArrayBuffer {
  return Box.concat(v.map<Box>((v, i, ary) => i === ary.length - 1 ? alignU128ToArrayBuffer(v) : snapTo15Bytes(Box.from(reverse(toArrayBuffer(v))))));
}

function byteLengthForNVarInts(input: Box, n: u64): usize {
  const clone = input.sliceFrom(0);
  const start = clone.start;
  for (let i: i32 = 0; i < <i32>n; i++) {
    clone.shrinkFront(readULEB128ToU128(clone, u128.from(0)));
  }
  return clone.start - start;
}

class BalanceSheetReduce {
  public table: ProtoruneTable;
  public sheets: Array<BalanceSheet>
  constructor(table: ProtoruneTable) {
    this.table = table;
    this.sheets = new Array<BalanceSheet>(0);
  }
  concat(): BalanceSheet {
    return BalanceSheet.concat(this.sheets);
  }
}

export class Protostone extends RunestoneMessage {
  public fields: Map<u64, Array<u128>>;
  public edicts: Array<StaticArray<u128>>;
  public nextIndex: i32 = -1;
  public protocolTag: u128 = u128.Zero;
  public table: ProtoruneTable;
  constructor(fields: Map<u64, Array<u128>>, edicts: Array<StaticArray<u128>>, protocolTag: u128) {
    super(fields, edicts);
    this.fields = fields;
    this.edicts = edicts;
    this.protocolTag = protocolTag;
    this.table = ProtoruneTable.for(protocolTag);
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
  mint(height: u32, balanceSheet: BalanceSheet): bool {
    return false;
  }
  etch(
    height: u64,
    tx: u32,
    initialBalanceSheet: BalanceSheet,
    transaction: RunesTransaction,
  ): bool {
    return false;
  }
  getFlag(position: u64): bool {
    if (!this.fields.has(ProtoruneField.FLAGS)) return false;
    const flags = fieldToU128(this.fields.get(ProtoruneField.FLAGS));
    return !u128.and(flags, u128.from(1) << (<i32>position)).isZero();
  }
  isMessage(): bool {
    return this.fields.has(ProtoruneField.MESSAGE);
  }
  isBurn(): bool {
    return this.fields.has(ProtoruneField.BURN);
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

  static parseFromFieldData(fieldData: Array<u128>): Array<Protostone> {
    const input = Box.from(concatByteArray(fieldData));
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
      const protostone = Protostone.parse(input.sliceTo(input.start + byteLength), protocolTag);
      result.push(protostone);
      input.shrinkFront(<u32>byteLength);
    }
    return result;
  }
  saveBalanceSheet(
    sheet: BalanceSheet,
    txid: ArrayBuffer,
    output: u32,
    isCenotaph: bool
  ): void {
    sheet.save(
      this.table.OUTPOINT_TO_RUNES.select(
        OutPoint.from(txid, output).toArrayBuffer(),
      ),
      isCenotaph
    );
  }
  loadBalanceSheet(tx: RunesTransaction): BalanceSheet {
    return tx.ins.reduce<BalanceSheetReduce>((r: BalanceSheetReduce, v: Input, i: i32, ary: Array<Input>) => {
      r.sheets.push(BalanceSheet.load(
        r.table.OUTPOINT_TO_RUNES.select(v.previousOutput().toArrayBuffer())
      ));
      return r;
    }, new BalanceSheetReduce(this.table)).concat();
  }
  static parse(input: Box, protocolTag: u128): Protostone {
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
    return new Protostone(fields, edicts, protocolTag);
  }
}
