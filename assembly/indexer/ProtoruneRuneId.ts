import { u128 } from "as-bignum/assembly";
import { RuneId } from "metashrew-runes/assembly/indexer/RuneId";
import { readULEB128ToU128 } from "metashrew-runes/assembly/leb128.ts";
import { concatByteArray } from "../utils";

export class ProtoruneRuneId extends RuneId {
  decode(): Array<u128> {
    const fieldData = new Array<u128>(2);
    fieldData[0] = this.block;
    fieldData[1] = this.tx;
    const input = Box.from(concatByteArray(fieldData));
    const result: Array<u128> = new Array<u128>();
    while (input.len > 0) {
      const current = u128.from(0);
      let size = readULEB128ToU128(input, current);
      if (size === usize.MAX_VALUE) return changetype<Array<u128>>(0); //can choose to continue or return
      input.shrinkFront(size);
      result.push(current);
    }
    return result;
  }
  static encode(ary: Array<u128>): ProtoruneRuneId {}
  static from(v: RuneId): ProtoruneRuneId {
    return changetype<ProtoruneRuneId>(v);
  }
}
