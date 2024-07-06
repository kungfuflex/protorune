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
  PROTOSPLIT_TAG,
} from "./constants";
import { PROTOCOLS_TO_INDEX } from "./tables/protorune";

class TagOutput {
  runestone: Map<u16, i32> = new Map<u16, i32>();
  protoburn: Array<i32> = new Array<i32>();
  protomessage: Map<u16, i32> = new Map<u16, i32>();
  protosplits: Map<u16, Array<i32>> = new Map<u16, Array<i32>>();
  runestoneOrder: Array<u16> = new Array<u16>();
}

@final
export class RunesTransaction extends Transaction {
  tags: TagOutput = changetype<TagOutput>(0);
  processRunestones(): void {
    const output = new TagOutput();
    for (let i = 0; i < this.outs.length; i++) {
      const op = load<u16>(this.outs[i].script.start);
      const next = load<u8>(this.outs[i].script.start + sizeof<u16>() * 2);
      const next2 = load<u16>(this.outs[i].script.start + sizeof<u16>());
      switch (op) {
        case RUNESTONE_TAG:
          if (!output.runestone.has(0)) {
            output.runestone.set(0, i);
            output.runestoneOrder.push(0);
          }
          break;
        case PROTOBURN_TAG:
          output.protoburn.push(i);
          break;
        case PROTOMESSAGE_TAG:
          if (PROTOCOLS_TO_INDEX.has(next2) && next == 0)
            if (!output.protomessage.has(next2))
              output.protomessage.set(next2, i);

          break;
        case PROTOSPLIT_TAG:
          if (PROTOCOLS_TO_INDEX.has(next2)) {
            if (output.protosplits.has(next2)) {
              const ary = output.protosplits.get(next2);
              ary.push(i);
              output.protosplits.set(next2, ary);
            } else {
              const ary = new Array<i32>();
              ary.push(i);
              output.protosplits.set(next2, ary);
            }
          }
          break;
        default:
          if (!output.runestone.has(op) && PROTOCOLS_TO_INDEX.has(op)) {
            output.runestone.set(op, i);
            output.runestoneOrder.push(op);
          }
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
