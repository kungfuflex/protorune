import { HEIGHT_TO_TRANSACTION_IDS } from "./constants";
import { toArrayBuffer } from "../utils";
import { u128 } from "as-bignum/assembly";
import { console } from "metashrew-as/assembly/utils/logging";

export class RuneId {
  public block: u64;
  public tx: u32;
  constructor(block: u64, tx: u32) {
    this.block = block;
    this.tx = tx;
  }
  txid(): ArrayBuffer {
    return HEIGHT_TO_TRANSACTION_IDS.selectValue<u32>(<u32>block)
      .selectIndex(this.tx)
      .get();
  }
  toU128(): u128 {
    return new u128(this.block, <u64>this.tx);
  }
  toBytes(): ArrayBuffer {
    return toArrayBuffer(this.toU128());
  }
  inspect(): string {
    return this.block.toString() + ":" + this.tx.toString();
  }
  static fromBytes(ary: ArrayBuffer): RuneId {
    const _ary = Uint8Array.wrap(ary);

    const parsed = _ary.reduce<Array<u8>>((acc, c, i, init) => {
      acc[i] = c;
      return acc;
    }, new Array<u8>(_ary.byteLength));
    console.log(parsed.length.toString());
    const block = u128.fromBytes(parsed.slice(0, 16)).toU64();
    const tx = u128.fromBytes(parsed.slice(16)).toU32();
    return new RuneId(block, tx);
  }
  static fromU128(v: u128): RuneId {
    const block = v.hi;
    const tx = <u32>v.lo;
    return new RuneId(block, tx);
  }
}
