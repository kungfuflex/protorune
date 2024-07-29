import { u128 } from "as-bignum/assembly";
import { Field } from "./fields/ProtoruneField";
import { Box } from "metashrew-as/assembly/utils/box";
import { reverse } from "metashrew-as/assembly/utils/utils";
import { readULEB128ToU128 } from "metashrew-runes/assembly/leb128";
import {
  u128ToHex,
  fieldToU128,
  toArrayBuffer,
  fieldToArrayBuffer,
  fieldToArrayBuffer15Bytes,
  fieldToArrayBuffer15Bytes,
} from "metashrew-runes/assembly/utils";
import { Flag } from "./flags/ProtoruneFlag";
import { console } from "metashrew-as/assembly/utils/logging";

function logField(ary: Array<u128>): void {
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

export class ProtoStone {
  public fields: Map<u64, Array<u128>>;
  public edicts: Array<StaticArray<u128>>;
  public nextIndex: i32 = -1;
  public protocol_id: u128 = u128.Zero;
  constructor(fields: Map<u64, Array<u128>>, edicts: Array<StaticArray<u128>>) {
    this.fields = fields;
    this.edicts = edicts;
  }
  inspect(): string {
    let result = "ProtoStone {\n";
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
  getFlag(position: u64): bool {
    if (!this.fields.has(Field.FLAGS)) return false;
    const flags = fieldToU128(this.fields.get(Field.FLAGS));
    return !u128.and(flags, u128.from(1) << (<i32>position)).isZero();
  }
  isMessage(): bool {
    return this.fields.has(Field.MESSAGE);
  }
  isBurn(): bool {
    return this.fields.has(Field.BURN);
  }
  isSplit(): bool {
    return this.fields.has(Field.SPLIT);
  }
  chunk(): ArrayBuffer {
    const chunks = this.fields.get(Field.CHUNK);
    if (chunks.length == 0) return new ArrayBuffer(0);
    return fieldToArrayBuffer(chunks);
  }

  splits(): Array<u32> {
    const splits = this.fields.get(Field.SPLIT);

    if (splits.length > 0) {
      return splits.map<u32>((d) => d.toU32());
    }
    return changetype<Array<u32>>(0);
  }

  static parseFromFieldData(fieldData: Array<u128>): Array<ProtoStone> {
    const input = Box.from(concatByteArray(fieldData));
    const result: Array<ProtoStone> = new Array<ProtoStone>();
    while (input.len > 0) {
      const protocol_id = u128.from(0);
      let size = readULEB128ToU128(input, protocol_id);
      if (protocol_id.isZero() === 0) {
        // For the very last u128, not all bytes may be used (due to LEB format)
        //console.log("Found protocol id 0, breaking...");
        break;
      }
      if (size === usize.MAX_VALUE) return changetype<ProtoStone[]>(0); //can choose to continue or return
      input.shrinkFront(size);

      const len = u128.from(0); //assuming len is encoded as the number of bytes needed to read
      size = readULEB128ToU128(input, len);
      if (size === usize.MAX_VALUE) return changetype<ProtoStone[]>(0); //can choose to continue or return
      input.shrinkFront(size);
      const byteLength = byteLengthForNVarInts(input, len.lo);
      const protostone = ProtoStone.parse(input.sliceTo(input.start + byteLength));
      protostone.protocol_id = protocol_id;
      result.push(protostone);
      input.shrinkFront(<u32>byteLength);
    }
    return result;
  }

  static parse(input: Box): ProtoStone {
    // console.log("Inside protostone.parse" + input.toHexString());
    let fields = new Map<u64, Array<u128>>();
    let edicts = new Array<StaticArray<u128>>(0);
    while (input.len > 0) {
      const fieldKeyHeap = u128.from(0);
      const size = readULEB128ToU128(input, fieldKeyHeap);
      if (size === usize.MAX_VALUE) return changetype<ProtoStone>(0);
      input.shrinkFront(size);
      const fieldKey = fieldKeyHeap.lo;
      // console.log("GOT FIELDKEY " + fieldKey.toString());
      if (fieldKey === 0) {
        while (input.len > 0) {
          const edict = new StaticArray<u128>(4);
          for (let i = 0; i < 4; i++) {
            const edictInt = u128.from(0);
            const size = readULEB128ToU128(input, edictInt);
            if (usize.MAX_VALUE === size) return changetype<ProtoStone>(0);
            input.shrinkFront(size);
            edict[i] = edictInt;
          }
          edicts.push(edict);
        }
      } else {
        const value = u128.from(0);
        const size = readULEB128ToU128(input, value);
        if (usize.MAX_VALUE === size) return changetype<ProtoStone>(0);
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
    return new ProtoStone(fields, edicts);
  }
}
