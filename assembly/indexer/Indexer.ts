import { Box } from "metashrew-as/assembly/utils/box";
import { RunesBlock } from "./RunesBlock";
import { RunestoneMessage } from "./RunestoneMessage";
import { ProtoruneMessage } from "./ProtoruneMessage";
import { RunesTransaction } from "./RunesTransaction";
import { Block } from "metashrew-as/assembly/blockdata/block";
import { scriptParse } from "metashrew-as/assembly/utils/yabsp";
import { console } from "metashrew-as/assembly/utils/logging";
import {
  OUTPOINT_TO_HEIGHT,
  HEIGHT_TO_BLOCKHASH,
  BLOCKHASH_TO_HEIGHT,
  GENESIS,
} from "./constants";
import { OutPoint, Output } from "metashrew-as/assembly/blockdata/transaction";
import { stripNullRight } from "../utils";
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
    if (!tx.tags.runestone.has(zero)) return;
    const runestoneOutputIndex = tx.tags.runestone.get(zero);
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
    const parsed = scriptParse(output.script).slice(skip);
    if (
      parsed.findIndex((v: Box, i: i32, ary: Array<Box>) => {
        return v.start === usize.MAX_VALUE;
      }) !== -1
    )
      return new ArrayBuffer(0);
    return Box.concat(parsed);
  }

  static processMessage<T extends RunestoneMessage>(
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
      if (changetype<usize>(payload) == 0) return new Map<u32, BalanceSheet>();
      const message = ProtoruneMessage.parseProtocol(payload, protocol);
      if (changetype<usize>(message) === 0) return new Map<u32, BalanceSheet>();

      //process message here
      changetype<T>(message).process(tx, txid, <u32>height, txindex);
    }
    return new Map<u32, BalanceSheet>();
  }
  static parseProtosplit(
    tx: RunesTransaction,
    startOutpoint: u32,
    message: ArrayBuffer,
  ): ArrayBuffer {
    const isChunk = tx.tags.chunks.has(startOutpoint);
    let payload = new ArrayBuffer(0);
    if (isChunk) {
      payload = Box.concat(scriptParse(tx.outs[startOutpoint].script).slice(2));
      if (payload.byteLength == 0) return message;
      return Box.concat([Box.from(message), Box.from(payload)]);
    }
    payload = Index.getMessagePayload(
      tx.outs[startOutpoint],
      tx.tags.payloadSkip.get(startOutpoint),
    );
    if (changetype<usize>(payload) == 0) return message;
    const protostone = ProtoStone.parse(payload);
    if (changetype<usize>(protostone) == 0) return message;
    const splits = protostone.splits();
    if (splits.length > 0) {
      for (let i = 0; i < splits.length; i++) {
        return Index.parseProtosplit(tx, splits[i], message);
      }
    }
    return message;
  }
  static processRunesTransaction<
    T extends RunestoneMessage,
    C extends MessageContext,
  >(
    block: Block,
    tx: RunesTransaction,
    txid: ArrayBuffer,
    height: u32,
    i: u32,
    protocol: u128,
  ): void {
    const p = protocol.toString();
    if (height >= GENESIS && tx.tags.runestone.has(p)) {
      const sheets = Index.processMessage<T>(
        height,
        tx,
        txid,
        i,
        tx.tags.runestone.get(p),
        protocol,
      );
      if (protocol > u128.Zero) {
        const protoMessages: Map<string, ProtoMessage> = new Map<
          string,
          ProtoMessage
        >();

        // parse protostones
        const protostoneKeys = tx.tags.protostone.keys();
        for (let m = 0; m < protostoneKeys.length; m++) {
          if (protostoneKeys[m] != p) continue;
          if (!tx.tags.protostone.has(p)) continue;
          const outs = tx.tags.protostone.get(p);
          for (let o = 0; o < outs.length; o++) {
            const index = outs[o];
            const out = tx.outs[index];
            const payload = Index.getMessagePayload(
              out,
              tx.tags.payloadSkip.get(index),
            );
            if (changetype<usize>(payload) == 0) continue;
            const protostone = ProtoStone.parse(payload);
            if (protostone.isMessage()) {
              protoMessages.set(
                protostoneKeys[m],
                ProtoMessage.from(protostone, index, sheets),
              );
            } else if (protostone.isSplit()) {
              let message = Index.parseProtosplit(
                tx,
                outs[o],
                new ArrayBuffer(0),
              );

              const protostone = ProtoStone.parse(message);
              if (!protostone.isMessage()) continue;
              protoMessages.set(
                p,
                ProtoMessage.from(protostone, outs[o], sheets),
              );
            }
          }
        }

        // process protomessage
        const protoMessageTypes = protoMessages.keys();
        for (let m = 0; m < protoMessageTypes.length; m++) {
          const message = protoMessages.get(protoMessageTypes[m]);
          message.handle<C>(tx, block, height, i);
        }
      }
    }
  }
  static processProtocol<C extends MessageContext>(
    block: Block,
    tx: RunesTransaction,
    txid: ArrayBuffer,
    height: u32,
    i: u32,
    protocol: u128,
  ): void {
    Index.processRunesTransaction<ProtoruneMessage, C>(
      block,
      tx,
      txid,
      height,
      i,
      protocol,
    );
  }
  static processRunes(
    block: Block,
    tx: RunesTransaction,
    txid: ArrayBuffer,
    height: u32,
    i: u32,
  ): void {
    Index.processRunesTransaction<RunestoneMessage, MessageContext>(
      block,
      tx,
      txid,
      height,
      i,
      u128.Zero,
    );
  }
  static indexBlock(height: u32, _block: Block): void {
    if (height == GENESIS) {
      RunestoneMessage.etchGenesisRune();
    }
    const block = changetype<RunesBlock>(_block);
    console.log("METASHREW_RUNES_LOG::indexing block: " + height.toString());
    HEIGHT_TO_BLOCKHASH.selectValue<u32>(height).set(block.blockhash());
    BLOCKHASH_TO_HEIGHT.select(block.blockhash()).setValue<u32>(height);
    block.saveTransactions(height);
    for (let i: i32 = 0; i < block.transactions.length; i++) {
      const tx = block.getTransaction(i);
      const txid = tx.txid();
      tx.processRunestones();
      Index.indexOutpoints(tx, txid, height);
      for (let r = 0; r < tx.tags.runestoneOrder.length; r++) {
        if (tx.tags.runestoneOrder[r] == u128.Zero) {
          Index.processRunes(_block, tx, txid, height, i);
        } else if (
          tx.tags.runestoneOrder[r] == MessageContext.initialiseProtocol()
        ) {
          Index.processProtocol<MessageContext>(
            block,
            tx,
            txid,
            height,
            i,
            tx.tags.runestoneOrder[r],
          );
        }
      }
    }
  }
}
