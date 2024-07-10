import {
  Transaction,
  Output,
  OutPoint,
} from "metashrew-as/assembly/blockdata/transaction";
import {
  RUNESTONE_TAG,
  OP_RETURN,
  PROTOBURN_TAG,
  PROTOSTONE_TAG,
  CHUNK_TAG,
} from "./constants";
import { PROTOCOLS_TO_INDEX } from "./tables/protorune";
import { readULEB128ToU128 } from "../leb128";
import { u128 } from "as-bignum/assembly";

class TagOutput {
  runestone: Map<string, i32> = new Map<string, i32>();
  protoburn: Array<i32> = new Array<i32>();
  chunks: Set<i32> = new Set<i32>();
  protostone: Map<string, Array<i32>> = new Map<string, Array<i32>>();
  runestoneOrder: Array<u128> = new Array<u128>();
  payloadSkip: Map<u32, u32> = new Map<u32, u32>();
}

@final
export class RunesTransaction extends Transaction {
  tags: TagOutput = changetype<TagOutput>(0);
  /*
  processes and stores whether the tag corresponds to a runestone, a protostone or a chunk
  also stores the order of the runestones that are parsed in the order of outpoints encountered - so this uses more memory but saves on time to process instead of sorting the runestone map values

  stores runestones in a map of <protocol_id, outpoint>
  the protocol_id is serialized to a hexstring as im not sure if a u128/ArrayBuffer can be used to index a Map in assemblyscript

  */
  processRunestones(): void {
    const output = new TagOutput();
    for (let i = 0; i < this.outs.length; i++) {
      const op = load<u16>(this.outs[i].script.start);
      let tag = u128.from(0);
      let len = 0;
      len = <u32>readULEB128ToU128(this.outs[i].script, tag);
      switch (op) {
        case RUNESTONE_TAG:
          if (!output.runestone.has(u128.Zero.toString())) {
            output.runestone.set(u128.Zero.toString(), i);
            output.runestoneOrder.push(u128.Zero);
            output.payloadSkip.set(i, 2);
          }
          break;
        case PROTOBURN_TAG:
          output.protoburn.push(i);
          output.payloadSkip.set(i, 2);
          break;
        case PROTOSTONE_TAG:
          len = <u32>readULEB128ToU128(this.outs[i].script.shrinkFront(2), tag);
          if (PROTOCOLS_TO_INDEX.has(tag)) {
            if (output.protostone.has(tag.toString())) {
              const ary = output.protostone.get(tag.toString());
              ary.push(i);
              output.protostone.set(tag.toString(), ary);
            } else {
              const ary = new Array<i32>();
              ary.push(i);
              output.protostone.set(tag.toString(), ary);
            }
            output.payloadSkip.set(i, len + 2);
          }
          break;
        case CHUNK_TAG:
          output.chunks.add(i);
          output.payloadSkip.set(i, 2);
          break;
        default:
          const tagStr = tag.toString();
          if (output.runestone.has(tagStr) && PROTOCOLS_TO_INDEX.has(tag)) {
            output.runestone.set(tagStr, i);
            output.runestoneOrder.push(tag);
            output.payloadSkip.set(i, len);
          }
          break;
      }
    }
    this.tags = output;
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
