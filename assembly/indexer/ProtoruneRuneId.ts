import { u128 } from "as-bignum/assembly";
import { RuneId } from "metashrew-runes/assembly/indexer/RuneId";
import { readULEB128ToU128 } from "metashrew-runes/assembly/leb128.ts";
import { toLEB128, concatByteArray, logArrayBuffer } from "../utils";
import { Box } from "metashrew-as/assembly/utils/box";
import { console } from "metashrew-as/assembly/utils/logging";

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
  static encode(ary: Array<u128>): ProtoruneRuneId {
    const data = Box.concat(
      ary.map<Box>((v: u128, i: i32, ary: Array<u128>) =>
        Box.from(toLEB128(v)),
      ),
    );
    if (data.byteLength > 32) return changetype<ProtoruneRuneId>(0);

    // adds left padding of 0 bytes until the data is 32 bytes
    const padded = new ArrayBuffer(32);
    memory.copy(
      changetype<usize>(padded) + <usize>(32 - data.byteLength),
      changetype<usize>(data),
      32 - data.byteLength,
    );
    const result = new ProtoruneRuneId(0, 0);
    result.block = u128.fromBytes(
      Uint8Array.wrap(Box.from(padded).shrinkBack(16).toArrayBuffer()),
    );
    result.tx = u128.fromBytes(
      Uint8Array.wrap(Box.from(padded).shrinkFront(16).toArrayBuffer()),
    );
    return result;
  }
  static from(v: RuneId): ProtoruneRuneId {
    return changetype<ProtoruneRuneId>(v);
  }
}
