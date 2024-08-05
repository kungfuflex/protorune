import { u128 } from "as-bignum/assembly";
import { RuneId as RuneIdBase } from "metashrew-runes/assembly/indexer/RuneId";

export class RuneIdHi extends RuneIdBase {
  toBytes(): ArrayBuffer {
    let bytes = this.block.toBytes(true);
    bytes = bytes.concat(this.tx.toBytes(true));
    return changetype<Uint8Array>(bytes).buffer;
  }

  static fromHiBytes(ary: ArrayBuffer): RuneIdHi {
    const parsed = changetype<Array<u8>>(Uint8Array.wrap(ary));
    const block = u128.fromBytes(parsed.slice(0, 16), true).toU64();
    const tx = u128.fromBytes(parsed.slice(16, 32), true).toU32();

    return new RuneIdHi(block, tx);
  }
}
