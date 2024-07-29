import { Box } from "metashrew-as/assembly/utils/box";
import { RunesBlock } from "metashrew-runes/assembly/indexer/RunesBlock";
import { RunestoneMessage } from "metashrew-runes/assembly/indexer/RunestoneMessage";
import { ProtoruneMessage } from "./ProtoruneMessage";
import { RunesTransaction } from "metashrew-runes/assembly/indexer/RunesTransaction";
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
import { u128ToHex, checkForNonDataPush, stripNullRight } from "metashrew-runes/assembly/utils";
import { ProtoMessage, MessageContext } from "./protomessage";
import { BalanceSheet } from "./BalanceSheet";
import { ProtoStone } from "./ProtoStone";
import { u128 } from "as-bignum/assembly";
import { RunesIndex } from "metashrew-runes/assembly/indexer";

import { ProtoBurn } from "./ProtoBurn";

class ProtoMessageReduce {
  public accumulated: Array<ProtoMessage>;
  public voutStart: u32;
  constructor(voutStart: u32) {
    this.voutStart = voutStart;
    this.accumulated = new Array<ProtoMessage>();
  }
  static from(voutStart: u32): ProtoMessageReduce  {
    return new ProtoMessageReduce(voutStart);
  }
}

export class ProtostoneTable {
  public list: Array<ProtoStone>;
  public voutStart: u32;
  constructor(v: Array<ProtoStone>, voutStart: u32) {
    this.list = v;
    this.voutStart = voutStart;
  }
  static from(ary: Array<u128>, voutStart: u32): ProtostoneTable {
    const list = ProtoStone.parseFromFieldData(ary);
    return new ProtostoneTable(list, voutStart);
  }
  burns(): Array<ProtoBurn> {
    return this.list
      .filter((v: ProtoStone) => v.protocol_tag === u128.from(13) && v.isBurn())
      .map(
        (v: ProtoStone) =>
          new ProtoBurn([
            v.fields.get(ProtoruneField.BURN)[0],
            v.fields.get(ProtoruneField.POINTER)[0],
          ]),
      );
  }
  messages(): Array<ProtoMessage> {
    return this.list.reduce(
      (
        r: ProtoMessageReduce,
        v: ProtoStone,
        i: i32,
        ary: Array<ProtoStone>,
      ) => {
        if (v.isMessage()) {
          r.accumulated.push(ProtoMessage.from(v, r.voutStart + i));
        }
        return r;
      },
      ProtoMessageReduce.from(this.voutStart),
    );
  }
  flat(): Array<ProtoStone> {
    return this.list;
  }
}

export class ProtoruneRunestoneMessage extends RunestoneMessage {
  protostones(voutStart: u32): ProtostoneTable {
    if (!this.fields.has(Field.PROTOCOL))
      ProtostoneTable.from(new Array<ProtoStone>(), voutStart);
    return ProtostoneTable.from(
      ProtoStone.parseFromFieldData(this.fields.get(Field.PROTOCOL)),
      voutStart,
    );
  }
  static from(v: RunestoneMessage): ProtoruneRunestoneMessage {
    return changetype<ProtoruneRunestoneMessage>(v);
  }
}

class BurnCycle {
  public max: i32;
  public cycles: Map<string, i32>;
  constructor(max: i32) {
    this.max = max;
    this.cycles = new Map<string, i32>();
  }
  next(rune: ArrayBuffer): i32 {
    if (!this.cycles.has(changetype<string>(rune))) {
      this.cycles.set(changetype<string>(rune), 0);
    }
    const cycle = this.cycles.get(changetype<string>(rune));
    this.cycles.set(changetype<string>(rune), (cycle + 1) % this.max);
    return cycle;
  }
  peek(rune: ArrayBuffer): i32 {
    if (!this.cycles.has(changetype<string>(rune))) {
      this.cycles.set(changetype<string>(rune), 0);
    }
    return this.cycles.get(changetype<string>(rune));
  }
}

export class Protorune<T extends MessageContext> extends RunesIndex {
  public block: RunesBlock;
  processRunestone(
    block: RunesBlock,
    tx: RunesTransaction,
    txid: ArrayBuffer,
    height: u32,
    i: u32,
  ): RunestoneMessage {
    const unallocatedTo = this.fields.has(Field.POINTER)
      ? fieldTo<u32>(this.fields.get(Field.POINTER))
      : <u32>tx.defaultOutput();
    const runestone = tx.runestone();
    if (changetype<usize>(runestone) === 0)
      return changetype<RunestoneMessage>(0);
    const balancesByOutput = runestone.process(tx, txid, height, i);
    const protoruneRunestoneMessage = ProtoruneRunestoneMessage.from(runestone);
    const protostones = protoruneRunestoneMessage.protostones(
      tx.outs.length + 1,
    );
    const burns = protostones.burns();
    const messages = protostones.messages();
    const runestoneOutputIndex = tx.runestoneOutputIndex();
    const edicts = Edict.fromDeltaSeries(runestone.edicts);
    if (burns.length > 0) {
      this.processProtoburns(unallocatedTo, balancesByOutput, txid, runestoneOutputIndex, runestone, burns);
    }
    this.processMessages(
      messages,
      block,
      height,
      tx,
      txid,
      i
    );
    return runestone;
  }
  processProtoburns(
    unallocatedTo: u32,
    balanceByOutput: Map<u32, BalanceSheet>,
    txid: ArrayBuffer,
    runestoneOutputIndex: i32,
    runestone: ProtoruneRunestoneMessage,
    burns: Array<ProtoBurn>,
  ): void {
      const runestoneBalanceSheet = new BalanceSheet();
      (balancesByOutput.has(runestoneOutputIndex) ? balancesByOutput.get(runestoneOutputIndex) : new BalanceSheet()).pipe(runestoneBalanceSheet);
      const burns: Array<Edict> = new Array<Edict>(0);
      const burnSheets = new Array<BalanceSheet>(0);
      const cycles = new BurnCycle(burns.length);
      for (let i = 0; i < burns.length; i++) {
        burnSheets[i] = new BalanceSheet();
      }
      for (let i = 0; i < edicts.length; i++) {
        if (edicts[i].output === u128.from(runestoneOutputIndex)) {
          const rune = edicts[i].runeId().toBytes();
          const cycle = cycles.peek(rune);
          const remaining = runestoneBalanceSheet.get(rune);
          const toApply = min(remaining, edicts[i].amount);
	  if (toApply.isZero()) continue;
	  cycles.next(rune);
          runestoneBalanceSheet.decrease(rune, toApply);
	  burnSheets[cycle].increase(rune, toApply);
        }
      }
      if (runestoneOutputIndex === unallocatedTo) {
        for (let i = 0; i < runestoneBalanceSheet.runes.length; i++) {
          const rune = runestoneBalanceSheet.runes[i];
          const cycle = cycles.peek(rune);
          const toApply = runestoneBalanceSheet.get(rune);
	  if (toApply.isZero()) continue;
	  cycles.next(rune);
	  runestoneBalanceSheet.decrease(rune, toApply);
	  burnSheets[cycle].increase(rune, toApply);
        }
      }
      for (let i = 0; i < burns.length; i++) {
        burns[i].process(burnSheets[i], OutPoint.from(txid, burns[i].pointer).toArrayBuffer());
      }
  }
  processMessages(
    messages: Array<ProtoMessage>,
    block: RunesBlock,
    height: u64,
    tx: RunesTransaction,
    txid: ArrayBuffer,
    txindex: u32
  ): void {
    for (let i = 0; i < messages.length; i++) {
      const message = messages[i];
      message.handle<T>(tx, block, height, txindex);
    }
  }
  initializeSubprotocols(): void {
    changetype<T>(0).initializeProtocol();
  }
  indexBlock(height: u32, _block: Block): void {
    this.initializeSubprotocols();
    super.indexBlock(height, block);
  }
}

export class DefaultProtorune extends Protorune<MessageContext> {}
