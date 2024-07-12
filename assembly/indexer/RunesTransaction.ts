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
import { Box, console, scriptParse } from "metashrew-as/assembly/utils";
import { checkForNonDataPush } from "../utils";

class TagOutput {
  runestone: Map<string, i32> = new Map<string, i32>();
  protoburn: Array<i32> = new Array<i32>();
  chunks: Set<i32> = new Set<i32>();
  protostone: Map<string, Array<i32>> = new Map<string, Array<i32>>();
  runestoneOrder: Array<u128> = new Array<u128>();
  parsedScripts: Map<u32, ArrayBuffer> = new Map<u32, ArrayBuffer>();

  inspect(): string {
    let log: string = "\nINSPECTING TX TAGS\n";

    log += "  runestones: ";
    const runestones = this.runestone.keys();
    for (let i = 0; i < runestones.length; i++) {
      log +=
        runestones[i] +
        ":" +
        this.runestone.get(runestones[i]).toString() +
        ", ";
    }
    log += "\n  protoburns: ";
    for (let i = 0; i < this.protoburn.length; i++) {
      log += this.protoburn[i].toString() + ", ";
    }
    log += "\n  chunks: ";
    const chunks = this.chunks.values();
    for (let i = 0; i < chunks.length; i++) {
      log += chunks[i].toString() + ", ";
    }
    log += "\n  protostones: ";
    const protostones = this.protostone.keys();
    for (let i = 0; i < protostones.length; i++) {
      log += "\n    " + protostones[i] + ":\n      [";
      const ary = this.protostone.get(protostones[i]);
      for (let j = 0; j < ary.length; j++) {
        log += ary[j].toString() + ", ";
      }
      log += "]";
    }
    log += "\n  runestone in order: ";
    for (let i = 0; i < this.runestoneOrder.length; i++) {
      log += this.runestoneOrder[i].toString() + ", ";
    }
    return log;
  }
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
      let script: Box = changetype<Box>(0);
      let skip: usize = 0;
      let tag: u128 = changetype<u128>(0);
      switch (op) {
        case RUNESTONE_TAG:
          if (!output.runestone.has(u128.Zero.toString())) {
            output.runestone.set(u128.Zero.toString(), i);
            output.runestoneOrder.push(u128.Zero);
          }
          break;
        case PROTOBURN_TAG:
          output.protoburn.push(i);
          break;
        case PROTOSTONE_TAG:
          console.log("protostone detected");
          script = Box.from(
            checkForNonDataPush(scriptParse(this.outs[i].script).slice(2)),
          );
          if (changetype<usize>(script) == 0) continue;
          tag = u128.from(0);
          skip = readULEB128ToU128(script, tag);
          if (tag == u128.Zero) continue;
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
            output.parsedScripts.set(
              i,
              script.shrinkFront(skip).toArrayBuffer(),
            );
          }
          break;
        case CHUNK_TAG:
          output.chunks.add(i);
          break;
        default:
          script = Box.from(
            checkForNonDataPush(scriptParse(this.outs[i].script)),
          );
          if (changetype<usize>(script) == 0) continue;
          tag = u128.from(0);
          skip = readULEB128ToU128(script, tag);
          if (tag == u128.Zero) continue;
          const tagStr = tag.toString();
          if (output.runestone.has(tagStr) && PROTOCOLS_TO_INDEX.has(tag)) {
            output.runestone.set(tagStr, i);
            output.runestoneOrder.push(tag);
            output.parsedScripts.set(
              i,
              script.shrinkFront(skip).toArrayBuffer(),
            );
          }
          break;
      }
    }
    this.tags = output;
    console.log(output.inspect());
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
