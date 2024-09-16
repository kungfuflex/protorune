import { Block, OutPoint } from "metashrew-as/assembly/blockdata";
import { IncomingRune } from "./IncomingRune";
import { AtomicTransaction } from "metashrew-as/assembly/indexer/atomic";
import { RuneId } from "metashrew-runes/assembly/indexer/RuneId";
import { ProtoruneBalanceSheet } from "../ProtoruneBalanceSheet";
import { ProtoruneTable, PROTOCOLS_TO_INDEX } from "../tables/protorune";
import { u128 } from "as-bignum/assembly";
import { RunesTransaction } from "metashrew-runes/assembly/indexer/RunesTransaction";
import { console } from "metashrew-as/assembly/utils";

export class MessageContext {
  runtime: AtomicTransaction = new AtomicTransaction();
  public runes: Array<IncomingRune> = new Array<IncomingRune>();
  transaction: RunesTransaction = changetype<RunesTransaction>(0);
  block: Block = changetype<Block>(0);
  height: u64 = 0;
  outpoint: OutPoint = changetype<OutPoint>(0);
  pointer: OutPoint = changetype<OutPoint>(0);
  refund_pointer: OutPoint = changetype<OutPoint>(0);
  calldata: ArrayBuffer = new ArrayBuffer(0);
  txid: ArrayBuffer;
  baseSheet: ProtoruneBalanceSheet;
  runeIdToIndex: Map<ArrayBuffer, i32> = new Map<ArrayBuffer, i32>();
  table: ProtoruneTable;
  sheets: Map<u32, ProtoruneBalanceSheet>;
  txindex: u32;
  runtimeBalance: ProtoruneBalanceSheet;

  constructor(
    protocolTag: u128,
    transaction: RunesTransaction,
    block: Block,
    height: u64,
    txindex: u32,
    index: u32,
    pointer: u32,
    refund_pointer: u32,
    calldata: ArrayBuffer,
  ) {
    this.txindex = txindex;
    this.transaction = transaction;
    this.block = block;
    this.height = height;
    const txid = transaction.txid();
    const outpoint = OutPoint.from(txid, index);
    this.outpoint = outpoint;
    const pointerOutpoint = OutPoint.from(txid, pointer);
    this.pointer = pointerOutpoint;
    const refundPointerOutpoint = OutPoint.from(txid, refund_pointer);
    this.refund_pointer = refundPointerOutpoint;
    this.calldata = calldata;
    this.txid = txid;
    this.baseSheet = new ProtoruneBalanceSheet();
    this.sheets = new Map<u32, ProtoruneBalanceSheet>();
    const table = ProtoruneTable.for(protocolTag);
    this.table = table;
    this.runtimeBalance = ProtoruneBalanceSheet.load(table.RUNTIME_BALANCE);
    const sheet = ProtoruneBalanceSheet.load(
      table.OUTPOINT_TO_RUNES.select(outpoint.toArrayBuffer()),
    );
    console.log(sheet.inspect());
    this.sheets.set(index, sheet);
    this.sheets.set(
      pointer,
      ProtoruneBalanceSheet.load(
        table.OUTPOINT_TO_RUNES.select(pointerOutpoint.toArrayBuffer()),
      ),
    );
    this.sheets.set(
      refund_pointer,
      ProtoruneBalanceSheet.load(
        table.OUTPOINT_TO_RUNES.select(refundPointerOutpoint.toArrayBuffer()),
      ),
    );
    for (let i = 0; i < sheet.runes.length; i++) {
      const runeId = RuneId.fromBytesU128(sheet.runes[i]);
      this.runeIdToIndex.set(sheet.runes[i], i);
      const rune = new IncomingRune(
        this,
        runeId,
        sheet.balances[i],
        this.table,
      );
      this.runes.push(rune);
    }
  }
  initializeProtocol<T extends MessageContext>(): u128 {
    const tag = changetype<T>(0).protocolTag();
    PROTOCOLS_TO_INDEX.add(tag);
    return tag;
  }
  checkBalances(): bool {
    const checkingSheet = ProtoruneBalanceSheet.loadFromAtomicTx(
      this.table.OUTPOINT_TO_RUNES.select(this.refund_pointer.toArrayBuffer()),
      this.runtime,
    );
    console.log("refund sheet");
    console.log(checkingSheet.inspect());
    const forwardSheet = ProtoruneBalanceSheet.loadFromAtomicTx(
      this.table.OUTPOINT_TO_RUNES.select(this.pointer.toArrayBuffer()),
      this.runtime,
    );
    console.log("forward sheet");
    console.log(forwardSheet.inspect());
    forwardSheet.pipe(checkingSheet);
    const outpointSheet = ProtoruneBalanceSheet.loadFromAtomicTx(
      this.table.OUTPOINT_TO_RUNES.select(this.outpoint.toArrayBuffer()),
      this.runtime,
    );
    outpointSheet.pipe(checkingSheet);
    this.runtimeBalance.pipe(checkingSheet);
    console.log("runtime balance");
    console.log(this.runtimeBalance.inspect());
    if (this.baseSheet.runes.length != checkingSheet.runes.length) return false;
    for (let i = 0; i < this.baseSheet.runes.length; i++) {
      if (
        this.baseSheet.get(this.baseSheet.runes[i]) !=
        checkingSheet.get(this.baseSheet.runes[i])
      ) {
        console.log(
          (
            this.baseSheet.get(this.baseSheet.runes[i]) -
            checkingSheet.get(this.baseSheet.runes[i])
          ).toString(),
        );
        console.log("context invalid");
        return false;
      }
    }
    return true;
  }

  run(): void {
    if (this.sheets.has(this.pointer.index)) {
      const sheet = this.sheets.get(this.pointer.index);
      for (let i = 0; i < sheet.runes.length; i++) {
        if (this.runeIdToIndex.has(sheet.runes[i])) {
          this.runes[this.runeIdToIndex.get(sheet.runes[i])].pointer_index = i;
        }
      }
      sheet.saveToAtomicTx(
        this.table.OUTPOINT_TO_RUNES.select(this.pointer.toArrayBuffer()),
        this.runtime,
      );
      sheet.pipe(this.baseSheet);
    }

    const sheet = this.sheets.has(this.refund_pointer.index)
      ? this.sheets.get(this.refund_pointer.index)
      : new ProtoruneBalanceSheet();
    if (this.sheets.has(this.outpoint.index)) {
      this.sheets.get(this.outpoint.index).pipe(sheet);
    }
    for (let i = 0; i < sheet.runes.length; i++) {
      if (this.runeIdToIndex.has(sheet.runes[i])) {
        this.runes[
          this.runeIdToIndex.get(sheet.runes[i])
        ].refund_pointer_index = i;
      }
    }
    sheet.saveToAtomicTx(
      this.table.OUTPOINT_TO_RUNES.select(this.refund_pointer.toArrayBuffer()),
      this.runtime,
    );
    sheet.pipe(this.baseSheet);

    this.runtime.checkpoint();
    const result = this.handle();
    if (!result) {
      this.runtime.rollback();
    }
    const balanceCheck = this.checkBalances();
    if (!balanceCheck) {
      this.runtime.rollback();
    }
    this.runtime.checkpoint();
    this.runtimeBalance.clearAndSave(this.table.RUNTIME_BALANCE);
    this.runtime.commit();
  }

  handle(): bool {
    return false;
  }
  protocolTag(): u128 {
    //change value here
    return new u128(0, 64);
  }
}
