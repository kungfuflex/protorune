import {
  Transaction,
  Input,
  Output,
  OutPoint,
} from "metashrew-as/assembly/blockdata/transaction";
import { RUNESTONE_TAG, OP_RETURN } from "./constants";

@final
export class RunesTransaction extends Transaction {
  runestoneOutputIndex(): i32 {
    for (let i = 0; i < this.outs.length; i++) {
      if (load<u16>(this.outs[i].script.start) === RUNESTONE_TAG) return i;
    }
    return -1;
  }
  runestoneOutput(): Output | null {
    const i = this.runestoneOutputIndex();
    if (i === -1) return null;
    else return this.outs[i];
  }
  defaultOutput(): i32 {
    for (let i = 0; i < this.outs.length; i++) {
      if (load<u8>(this.outs[i].script.start) !== OP_RETURN) return i;
    }
    return -1;
  }
  static from(tx: Transaction): RunesTransaction {
    return changetype<RunesTransaction>(tx);
  }
  outpoint(vout: i32): ArrayBuffer {
    return OutPoint.from(this.txid(), <u32>vout).toArrayBuffer();
  }
}
