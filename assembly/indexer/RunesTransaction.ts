import {
  Transaction,
  Output,
  OutPoint,
} from "metashrew-as/assembly/blockdata/transaction";
import {
  RUNESTONE_TAG,
  OP_RETURN,
  PROTOBURN_TAG,
  PROTOMESSAGE_TAG,
  PROTOCOLS_TO_INDEX,
} from "./constants";

class TagOutput {
  runestone: i32;
  protoburn: Array<i32>;
  protomessage: Array<i32>;
  protorunestone: i32;
  constructor() {
    this.runestone = -1;
    this.protoburn = new Array<i32>();
    this.protomessage = new Array<i32>();
    this.protorunestone = -1;
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
        case PROTOBURN_TAG:
          output.protoburn.push(i);
          break;
        case PROTOMESSAGE_TAG:
          if (next == 0) output.protomessage.push(i);
          break;
        default:
          if (output.protorunestone == -1 && PROTOCOLS_TO_INDEX.has(op))
            output.protorunestone = i;
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
