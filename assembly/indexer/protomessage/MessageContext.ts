import { Block, OutPoint, Transaction } from "metashrew-as/assembly/blockdata";
import { IncomingRune } from "./IncomingRune";
import { AtomicTransaction } from "metashrew-as/assembly/indexer/atomic";
import { RuneId } from "../RuneId";
import { BalanceSheet } from "../BalanceSheet";
import { PROTORUNE_TABLE, PROTOCOLS_TO_INDEX } from "../tables/protorune";
import { u128 } from "as-bignum/assembly";
import { console } from "metashrew-as/assembly/utils/logging";

export class MessageContext {
  runtime: AtomicTransaction = new AtomicTransaction();
  public runes: Array<IncomingRune> = new Array<IncomingRune>();
  transaction: Transaction = changetype<Transaction>(0);
  block: Block = changetype<Block>(0);
  height: u64 = 0;
  outpoint: OutPoint = changetype<OutPoint>(0);
  pointer: OutPoint = changetype<OutPoint>(0);
  refund_pointer: OutPoint = changetype<OutPoint>(0);
  calldata: ArrayBuffer = new ArrayBuffer(0);
  txid: ArrayBuffer;
  baseSheet: BalanceSheet;
  runeIdToIndex: Map<ArrayBuffer, i32> = new Map<ArrayBuffer, i32>();
  table: PROTORUNE_TABLE;
  sheets: Map<u32, BalanceSheet>;
  txindex: u32;

  constructor(
    transaction: Transaction,
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
    const table = PROTORUNE_TABLE.for(MessageContext.protocol_tag());
    this.txid = txid;
    this.table = table;
    this.sheets = new Map<u32, BalanceSheet>();
    const sheet = BalanceSheet.load(
      table.OUTPOINT_TO_RUNES.select(outpoint.toArrayBuffer()),
    );
    this.baseSheet = new BalanceSheet();
    this.sheets.set(index, sheet);
    this.sheets.set(
      pointer,
      BalanceSheet.load(
        table.OUTPOINT_TO_RUNES.select(pointerOutpoint.toArrayBuffer()),
      ),
    );
    this.sheets.set(
      refund_pointer,
      BalanceSheet.load(
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
  static initialiseProtocol(): u128 {
    const tag = MessageContext.protocol_tag();
    PROTOCOLS_TO_INDEX.add(tag);
    return tag;
  }
  checkBalances(): bool {
    const checkingSheet = BalanceSheet.loadFromAtomicTx(
      this.table.OUTPOINT_TO_RUNES.select(this.refund_pointer.toArrayBuffer()),
      this.runtime,
    );
    BalanceSheet.loadFromAtomicTx(
      this.table.OUTPOINT_TO_RUNES.select(this.pointer.toArrayBuffer()),
      this.runtime,
    ).pipe(checkingSheet);
    BalanceSheet.loadFromAtomicTx(
      this.table.OUTPOINT_TO_RUNES.select(this.outpoint.toArrayBuffer()),
      this.runtime,
    ).pipe(checkingSheet);
    if (this.baseSheet.runes.length != checkingSheet.runes.length) return false;
    for (let i = 0; i < this.baseSheet.runes.length; i++) {
      if (
        this.baseSheet.get(this.baseSheet.runes[i]) !=
        checkingSheet.get(this.baseSheet.runes[i])
      )
        return false;
    }
    return true;
  }

  run(): void {
    if (this.sheets.has(this.pointer.index)) {
      const sheet = this.sheets.get(this.pointer.index);
      console.log("pointer sheet");
      console.log(sheet.inspect());
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
      : new BalanceSheet();
    console.log("refund pointer sheet");
    if (this.sheets.has(this.outpoint.index)) {
      this.sheets.get(this.outpoint.index).pipe(sheet);
    }
    console.log(sheet.inspect());
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

    if (!this.checkBalances()) {
      this.runtime.rollback();
    }
    this.runtime.commit();
  }

  handle(): bool {
    return false;
  }
  static protocol_tag(): u128 {
    //change value here
    return new u128(0, 64);
  }
}
