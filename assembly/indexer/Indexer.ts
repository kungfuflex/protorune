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
import { PROTOCOL_TAG } from "./constants/protorune";
import { OutPoint } from "metashrew-as/assembly/blockdata/transaction";
import { protorune } from "../proto/protorune";
import { stripNullRight } from "../utils";
import { encodeHexFromBuffer } from "metashrew-as/assembly/utils";
import { ProtoMessage, MessageContext } from "../protomessage";

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

    const runestoneOutputIndex = tx.tags.runestone;
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

  static processMessage<T>(
    height: u64,
    tx: RunesTransaction,
    txid: ArrayBuffer,
    txindex: u32,
    outputIndex: i32,
  ): void {
    if (outputIndex > -1) {
      const runestoneOutput = tx.outs[outputIndex];
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

      //process message here
      //@ts-ignore
      changetype<T>(message).process(tx, txid, <u32>height, txindex);
    }
  }
  static processRunesTransaction(
    _block: Block,
    tx: RunesTransaction,
    txid: ArrayBuffer,
    height: u32,
    i: u32,
  ): void {
      tx.processRunestones();
      if (height >= GENESIS) {
        let protoMessage: Map<u16, protorune.ProtoMessage> = new Map<
          u16,
          protorune.ProtoMessage
        >();

        Index.processMessage<RunestoneMessage>(
          height,
          tx,
          txid,
          i,
          tx.tags.runestone,
        );

        Index.processMessage<ProtoruneMessage>(
          height,
          tx,
          txid,
          i,
          tx.tags.protorunestone,
        );

        // parse protomessages
        const protomessageKeys = tx.tags.protomessage.keys();
        for (let m = 0; m < protomessageKeys.length; m++) {
          const out = tx.outs[tx.tags.protomessage[protomessageKeys[m]]];
          const parsed = scriptParse(out.script).slice(2);
          const message = protorune.ProtoMessage.decode(Box.concat(parsed));
          switch (protomessageKeys[m]) {
            case PROTOCOL_TAG:
              ProtoMessage.handle<MessageContext>(
                message,
                tx,
                _block,
                height,
                i,
              );
              break;
          }
        }

        //parse protosplit
        const protosplitKeys = tx.tags.protosplits.keys();
        for (let k = 0; k < protosplitKeys.length; k++) {
          const outs = tx.tags.protosplits.get(protosplitKeys[k]);
          for (let o = 0; o < outs.length; o++) {}
          //parse only one protocols protosplit message
          break;
        }

        // process protomessage
      }
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
      Index.indexOutpoints(tx, txid, height);
      Index.processRunesTransaction(_block, tx, txid, height, i);
    }
  }
}
