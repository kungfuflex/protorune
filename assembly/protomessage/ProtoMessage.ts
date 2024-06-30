import { Block } from "metashrew-as/assembly/blockdata";
import { RunesTransaction } from "../indexer/RunesTransaction";
import { protorune } from "../proto/protorune";
import { MessageContext } from "./MessageContext";
import { BalanceSheet } from "../indexer/BalanceSheet";

export class ProtoMessage {
  message: protorune.ProtoMessage;
  outpoint: u32;
  sheets: Map<u32, BalanceSheet>;
  constructor(
    message: protorune.ProtoMessage,
    outpoint: u32,
    sheets: Map<u32, BalanceSheet>,
  ) {
    this.message = message;
    this.outpoint = outpoint;
    this.sheets = sheets;
  }
  handle<T extends MessageContext>(
    tx: RunesTransaction,
    block: Block,
    height: u64,
    i: u32,
  ) {
    const context = new MessageContext(
      this.message,
      tx,
      block,
      height,
      i,
      this.sheets,
    );

    changetype<T>(context).run();
  }
}
