import { u128 } from "as-bignum/assembly";
import { Field } from "./fields/ProtoruneField";
import { Box } from "metashrew-as/assembly/utils/box";
import { readULEB128ToU128 } from "../leb128";
import { u128ToHex, fieldToU128, fieldToArrayBuffer } from "../utils";
import { Flag } from "./flags/ProtoruneFlag";

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
    const box = Box.from(fieldToArrayBuffer(fieldData));
    let ptr: usize = 0;
    const arr = new Array<u128>();
    const result: Array<ProtoStone> = new Array<ProtoStone>();
    while (box.len > 0) {
      box.shrinkFront(ptr);
      let u = u128.from(0);
      ptr = readULEB128ToU128(box, u);
      arr.push(u);
    }
    let start = 0;
    while (start < arr.length - 3) {
      const protocol_id = arr[start];
      const len = <u32>arr[start + 1].lo;

      const bytes = fieldToArrayBuffer(arr.slice(start + 2, start + 2 + len));
      const protostone = ProtoStone.parse(bytes);
      protostone.protocol_id = protocol_id;
      result.push(protostone);
      start += len + 2;
    }

    return result;
  }

  static parse(data: ArrayBuffer): ProtoStone {
    const input = Box.from(data);
    let fields = new Map<u64, Array<u128>>();
    let edicts = new Array<StaticArray<u128>>(0);
    while (input.len > 0) {
      const fieldKeyHeap = u128.from(0);
      const size = readULEB128ToU128(input, fieldKeyHeap);
      if (size === usize.MAX_VALUE) return changetype<ProtoStone>(0);
      input.shrinkFront(size);
      const fieldKey = fieldKeyHeap.lo;
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
