import { u128 } from "as-bignum/assembly";
import { RuneId } from "metashrew-runes/assembly/indexer/RuneId";
import { readULEB128ToU128 } from "metashrew-runes/assembly/leb128.ts";
import { toLEB128, concatByteArrayTruncateZeros, logArrayBuffer } from "../utils";
import { Box } from "metashrew-as/assembly/utils/box";
import { console } from "metashrew-as/assembly/utils/logging";

export class ProtoruneRuneId extends RuneId {
  decode(): Array<u128> {
    const fieldData = new Array<u128>(2);
    fieldData[0] = this.block;
    fieldData[1] = this.tx;
    const input = Box.from(concatByteArrayTruncateZeros(fieldData));
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
  // ary should have the string identifier for the protorune first, then the data that should be encoded
  // Ex: ["OYL", RuneBlock1, RuneTx1, RuneBlock2, RuneTx2]. Guarantees that the padded bits can be ignored and the first data byte is nonzero (must be a string)
  // Important note: collisions with existing RuneIds are not explicitly handled. Authors of subprotocols should ensure that the ProtoruneRuneId scheme does not conflict with existing rune ids.
  // Do note that a collision would be extremely unlikely: it would require 14 bytes of pure 0s input as data, in order for txIndex to be valid, and then the data needs to be higher than 840,000 for the block.
  static encode(ary: Array<u128>): ProtoruneRuneId {
    const data = Box.concat(
      ary.map<Box>((v: u128, i: i32, ary: Array<u128>) =>
        Box.from(toLEB128(v)),
      ),
    );
    const result = new ProtoruneRuneId(0, 0);
    if (data.byteLength > 32) return result;

    // adds left padding of 0 bytes until the data is 32 bytes
    const padded = new ArrayBuffer(32);
    memory.copy(
      changetype<usize>(padded) + <usize>(32 - data.byteLength),
      changetype<usize>(data),
      data.byteLength,
    );
    result.block = u128.fromBytes(
      Uint8Array.wrap(Box.from(padded).shrinkBack(16).toArrayBuffer()),
      true // bigEndian is true, since we pushed the bytes to the highest memory addresses, we only want those to be processed, and the 0s should be higher significance so the encoded values are increasing in size and not so huge
    );
    result.tx = u128.fromBytes(
      Uint8Array.wrap(Box.from(padded).shrinkFront(16).toArrayBuffer()),
      true
    );
    return result;
  }
  static from(v: RuneId): ProtoruneRuneId {
    return changetype<ProtoruneRuneId>(v);
  }
}
