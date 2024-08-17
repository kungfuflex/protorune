import { u128 } from "as-bignum/assembly";
import { RuneId } from "metashrew-runes/assembly/indexer/RuneId";
import { readULEB128ToU128 } from "metashrew-runes/assembly/leb128.ts";
import { toLEB128, concatByteArrayTruncateZeros, logArrayBuffer } from "../utils";
import { Box } from "metashrew-as/assembly/utils/box";
import { console } from "metashrew-as/assembly/utils/logging";

export class ProtoruneRuneId extends RuneId {
  static readonly MAX_LEB_SIZE_BYTES: u32 = 31;
  decode(): Array<u128> {
    const fieldData = new Array<u128>(2);
    fieldData[0] = u128.shr(this.block, 8);
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
    console.log("this.Max " + this.MAX_LEB_SIZE_BYTES.toString())
    if (<u32>data.byteLength > this.MAX_LEB_SIZE_BYTES) return result;

    // adds left padding of 0 bytes until the data is 31 bytes
    const padded = new ArrayBuffer(32);
    if (data.byteLength <= 16) {
      memory.copy(
        changetype<usize>(padded) + <usize>(32 - data.byteLength),
        changetype<usize>(data),
        data.byteLength,
      );
    } else {
      memory.copy(
        changetype<usize>(padded) + <usize>(16),
        changetype<usize>(data) + <usize>(data.byteLength - 16),
        16,
      );
      memory.copy(
        changetype<usize>(padded) + <usize>(31 - data.byteLength),
        changetype<usize>(data),
        data.byteLength - 16,
      );
    }

    const blockArray = Uint8Array.wrap(Box.from(padded).shrinkBack(16).toArrayBuffer())
    blockArray[15] = 0x7f
    result.block = u128.fromBytes(
      blockArray,
      true // bigEndian is true, since we pushed the bytes to the highest memory addresses, we only want those to be processed, and the 0s should be higher significance so the encoded values are increasing in size and not so huge
    ); // left shift is to ensure that the high byte is 0, which will take the value of 0x7f so the block number is nonzero
    console.log("block " + result.block.toString())
    result.tx = u128.fromBytes(
      Uint8Array.wrap(Box.from(padded).shrinkFront(16).toArrayBuffer()),
      true
    );
    console.log("tx " + result.tx.toString())
    return result;
  }
  static from(v: RuneId): ProtoruneRuneId {
    return changetype<ProtoruneRuneId>(v);
  }
}
