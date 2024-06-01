import { HEIGHT_TO_TRANSACTION_IDS } from "./constants";
import { toArrayBuffer } from "../utils";
import { u128 } from "as-bignum/assembly";

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
    return new u128(<u64>this.tx, this.block);
  }
  toBytes(): ArrayBuffer {
    return toArrayBuffer(this.toU128());
  }
  static fromBytes(ary: ArrayBuffer): RuneId {
    const v = u128.fromBytesLE(ary);
    return RuneId.fromU128(v);
  }
  static fromU128(v: u128): RuneId {
    const block = v.hi;
    const tx = <u32>v.lo;
    return new RuneId(block, tx);
  }
}
