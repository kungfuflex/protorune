import { u128 } from "as-bignum/assembly";
import { Field } from "./fields/ProtoruneField";
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
  fieldToName,
} from "../utils";
import { Flag } from "./flags/ProtoruneFlag";
import { RuneId } from "./RuneId";
import { Edict } from "./Edict";
import {
  SPACERS,
  RUNE_ID_TO_ETCHING,
  ETCHING_TO_RUNE_ID,
  RUNE_ID_TO_HEIGHT,
  DIVISIBILITY,
  SYMBOL,
  ETCHINGS,
  OUTPOINT_TO_RUNES,
  GENESIS,
  HEIGHT_INTERVAL,
  MINIMUM_NAME,
  TWENTY_SIX,
  RESERVED_NAME,
} from "./constants";
import { BalanceSheet } from "./BalanceSheet";
import { RunesTransaction } from "./RunesTransaction";
import { Input, OutPoint } from "metashrew-as/assembly/blockdata/transaction";

export class ProtoStone {
  public fields: Map<u64, Array<u128>>;
  public edicts: Array<StaticArray<u128>>;
  constructor(fields: Map<u64, Array<u128>>, edicts: Array<StaticArray<u128>>) {
    this.fields = fields;
    this.edicts = edicts;
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
  isEtching(): bool {
    return this.getFlag(Flag.ETCHING);
  }
  splits(): Array<u32> {
    const splits = this.fields.get(Field.SPLIT);

    if (splits.length > 0) {
      return splits.map<u32>((d) => d.toU32());
    }
    return changetype<Array<u32>>(0);
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