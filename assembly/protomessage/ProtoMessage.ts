import { Block } from "metashrew-as/assembly/blockdata";
import { RunesTransaction } from "../indexer/RunesTransaction";
import { protorune } from "../proto/protorune";
import { MessageContext } from "./MessageContext";

export class ProtoMessage {
  static handle<T>(
    message: protorune.ProtoMessage,
    tx: RunesTransaction,
    block: Block,
    height: u64,
    i: u32,
  ): void {
    const context = new MessageContext(message, tx, block, height, i);
    //@ts-ignore
    changetype<T>(context).handle();
  }
}
