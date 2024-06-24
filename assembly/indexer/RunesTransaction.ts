import {
  Transaction,
  Output,
  OutPoint,
} from "metashrew-as/assembly/blockdata/transaction";
import { RUNESTONE_TAG, OP_RETURN } from "./constants";

class TagOutput {
  runestone: i32;
  constructor() {
    this.runestone = -1;
  }
}

@final
export class RunesTransaction extends Transaction {
  tags: TagOutput;
  processRunestones(): void {
    const output = new TagOutput();
    for (let i = 0; i < this.outs.length; i++) {
      const op = load<u16>(this.outs[i].script.start);
      const next = load<u8>(this.outs[i].script.start + sizeof<u16>());
      switch (op) {
        case RUNESTONE_TAG:
          if (output.runestone == -1) output.runestone = i;
          break;
      }
    }
    this.tags = output;
  }

  runestoneOutputIndex(): i32 {
    for (let i = 0; i < this.outs.length; i++) {
      if (load<u16>(this.outs[i].script.start) === RUNESTONE_TAG) return i;
    }
    return -1;
  }

  protoburnOutputIndex(): i32 {
    for (let i = 0; i < this.outs.length; i++)
      if (load<u16>(this.outs[i].script.start) === PROTOBURN_TAG) return i;
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
