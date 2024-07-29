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
import { readULEB128ToU128 } from "metashrew-runes/assembly/leb128";
import { u128 } from "as-bignum/assembly";
import { Box, console, scriptParse } from "metashrew-as/assembly/utils";
import { checkForNonDataPush } from "../utils";
import { ProtoStone } from "./ProtoStone";
import { ProtoMessage } from "./protomessage";

@final
export class RunesTransaction extends Transaction {
  runestoneIndex: i32 = -1;
  protomessages: Map<string, Array<ProtoMessage>> = new Map<
    string,
    Array<ProtoMessage>
  >();
  processRunestones(): void {
    for (let i = 0; i < this.outs.length; i++) {
      const op = load<u16>(this.outs[i].script.start);
      if (op == RUNESTONE_TAG) this.runestoneIndex = i;
    }
  }

  runestoneOutput(): i32 {
    return this.runestoneIndex;
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
