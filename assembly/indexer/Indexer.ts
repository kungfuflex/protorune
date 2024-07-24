import { Box } from "metashrew-as/assembly/utils/box";
import { RunesBlock } from "./RunesBlock";
import { RunestoneMessage } from "./RunestoneMessage";
import { ProtoruneMessage } from "./ProtoruneMessage";
import { RunesTransaction } from "./RunesTransaction";
import { Block } from "metashrew-as/assembly/blockdata/block";
import { Field } from "./fields/RunestoneField";
import { scriptParse } from "metashrew-as/assembly/utils/yabsp";
import { console } from "metashrew-as/assembly/utils/logging";
import {
  OUTPOINT_TO_HEIGHT,
  HEIGHT_TO_BLOCKHASH,
  BLOCKHASH_TO_HEIGHT,
  GENESIS,
} from "./constants";
import { OutPoint, Output } from "metashrew-as/assembly/blockdata/transaction";
import { u128ToHex, checkForNonDataPush, stripNullRight } from "../utils";
import { ProtoMessage, MessageContext } from "./protomessage";
import { BalanceSheet } from "./BalanceSheet";
import { ProtoStone } from "./ProtoStone";
import { u128 } from "as-bignum/assembly";

export class Index {
  static indexOutpoints(
    tx: RunesTransaction,
    txid: ArrayBuffer,
    height: u32,
  ): void {
    for (let i: i32 = 0; i < tx.outs.length; i++) {
      OUTPOINT_TO_HEIGHT.select(
        OutPoint.from(txid, <u32>i).toArrayBuffer(),
      ).setValue<u32>(height);
    }
  }
  static findCommitment(
    name: ArrayBuffer,
    tx: RunesTransaction,
    height: u32,
  ): bool {
    for (let i = 0; i < tx.ins.length; i++) {
      const input = tx.ins[i];
      // check that there is 1 data push
      const inscription = input.inscription();

      if (changetype<usize>(inscription) === 0 || inscription == null) continue;
      const commitment = inscription.field(0);
      if (!commitment) continue;
      const previousOutpoint = tx.ins[i].previousOutput().toArrayBuffer();
      const previousOutpointHeight =
        OUTPOINT_TO_HEIGHT.select(previousOutpoint).getValue<u32>();
      if (height - previousOutpointHeight >= 6) return true;
    }
    return false;
  }
  static inspectTransaction(
    name: ArrayBuffer,
    height: u32,
    _block: Block,
    txindex: u32,
  ): void {
    const block = changetype<RunesBlock>(_block);
    const tx = block.getTransaction(txindex);
    tx.processRunestones();

    const zero = u128.Zero.toString();
    if (tx.runestoneIndex == -1) return;
    const runestoneOutputIndex = tx.runestoneIndex;
    const runestoneOutput = tx.outs[runestoneOutputIndex];
    const parsed = scriptParse(runestoneOutput.script).slice(2);
    if (
      parsed.findIndex((v: Box, i: i32, ary: Array<Box>) => {
        return v.start === usize.MAX_VALUE;
      }) !== -1
    )
      return;
    const payload = Box.concat(parsed);
    const message = RunestoneMessage.parse(payload);
    if (changetype<usize>(message) === 0) return;
    const commitment = Index.findCommitment(stripNullRight(name), tx, height);
    /*
    if (commitment) console.log("no commitment");
    else console.log("commitment found");
   */
  }

  static getMessagePayload(output: Output, skip: u32 = 2): ArrayBuffer {
    /*
    scriptParse(output.script).forEach((v: Box, i: i32, ary: Array<Box>) => {
      if (changetype<usize>(v) === 0) console.log("null");
      else if (v.len === 0) console.log("start: " + v.start.toString(10));
      else if (v.start === 0) console.log("len: " + v.len.toString(10));
      else console.log(v.toHexString());
    });
   */
    const parsed = scriptParse(output.script).slice(skip);
    return checkForNonDataPush(parsed);
  }

  static processRunestone<T extends RunestoneMessage>(
    height: u64,
    tx: RunesTransaction,
    txid: ArrayBuffer,
    txindex: u32,
    outputIndex: i32,
    protocol: u128,
  ): Map<u32, BalanceSheet> {
    if (outputIndex > -1) {
      const runestoneOutput = tx.outs[outputIndex];
      const payload = Index.getMessagePayload(runestoneOutput);
      console.log(Box.from(payload).toHexString());
      if (changetype<usize>(payload) == 0) return new Map<u32, BalanceSheet>();
      const message = ProtoruneMessage.parseProtocol(payload, protocol);
      if (changetype<usize>(message) === 0) return new Map<u32, BalanceSheet>();

      //process message here
      message.process(tx, txid, <u32>height, txindex);
    }
    return new Map<u32, BalanceSheet>();
  }

  static processMessages<T extends MessageContext>(
    block: RunesBlock,
    height: u64,
    tx: RunesTransaction,
    txid: ArrayBuffer,
    txIdx: u32,
    p: string,
  ): void {
    const protoMessages: Map<string, ProtoMessage[]> = tx.protomessages;
    console.log(
      "GOT num protomessages keys " + protoMessages.keys().length.toString(),
    );

    // process protomessage
    const protoMessageTypes = protoMessages.keys();
    for (let m = 0; m < protoMessageTypes.length; m++) {
      const messages = protoMessages.get(protoMessageTypes[m]);
      for (let msgIdx = 0; msgIdx < messages.length; msgIdx++) {
        const message = messages[msgIdx];
        message.handle<T>(tx, block, height, txIdx);
      }
    }
  }
  static initializeSubprotocols(): void {
    MessageContext.initialiseProtocol();
  }
  static indexBlock(height: u32, _block: Block): void {
    Index.initializeSubprotocols();
    if (height == GENESIS) {
      RunestoneMessage.etchGenesisRune();
    }
    const block = changetype<RunesBlock>(_block);
    console.log("METASHREW_RUNES_LOG::indexing block: " + height.toString());
    HEIGHT_TO_BLOCKHASH.selectValue<u32>(height).set(block.blockhash());
    BLOCKHASH_TO_HEIGHT.select(block.blockhash()).setValue<u32>(height);
    block.saveTransactions(height);
    for (let txIdx: i32 = 0; txIdx < block.transactions.length; txIdx++) {
      const tx = block.getTransaction(txIdx);
      const txid = tx.txid();
      tx.processRunestones();
      console.log("processed runestones");
      Index.indexOutpoints(tx, txid, height);
      const outputIndex = tx.runestoneIndex;
      console.log("runestoneIndex " + outputIndex.toString(10));
      console.log("process single runestone message");
      Index.processRunestone<RunestoneMessage>(
        height,
        tx,
        txid,
        txIdx,
        outputIndex,
        u128.Zero,
      );
      console.log("processed runestone");
      Index.processMessages<MessageContext>(
        block,
        height,
        tx,
        txid,
        txIdx,
        MessageContext.protocol_tag().toString(),
      );
    }
  }
}
