import { Block, OutPoint, Transaction } from "metashrew-as/assembly/blockdata";
import { IncomingRune } from "./IncomingRune";
import { AtomicTransaction } from "metashrew-as/assembly/indexer/atomic";
import { protorune } from "../../proto/protorune";
import { RuneId } from "../RuneId";
import { BalanceSheet } from "../BalanceSheet";
import { OUTPOINT_TO_RUNES } from "../constants/protorune";

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
  sheets: Map<u32, BalanceSheet>;
  txid: ArrayBuffer;
  baseSheet: BalanceSheet;
  runeIdToIndex: Map<ArrayBuffer, i32> = new Map<ArrayBuffer, i32>();

  constructor(
    message: protorune.ProtoMessage,
    transaction: Transaction,
    block: Block,
    height: u64,
    index: u32,
    sheets: Map<u32, BalanceSheet>,
  ) {
    this.sheets = sheets;
    this.baseSheet = new BalanceSheet();
    this.transaction = transaction;
    this.block = block;
    this.height = height;
    this.txid = transaction.txid();
    this.outpoint = OutPoint.from(this.txid, index);
    this.pointer = OutPoint.from(this.txid, message.pointer);
    this.refund_pointer = OutPoint.from(this.txid, message.refund_pointer);
    this.calldata = changetype<Uint8Array>(message.calldata).buffer;
    if (sheets.has(index)) {
      const sheet = sheets.get(index);
      for (let i = 0; i < sheet.runes.length; i++) {
        const runeId = RuneId.fromBytesU128(sheet.runes[i]);
        this.runeIdToIndex.set(sheet.runes[i], i);
        const rune = new IncomingRune(this, runeId, sheet.balances[i]);
        this.runes.push(rune);
        this.baseSheet.pipe(sheet);
      }
    }
  }

  checkBalances(): bool {
    const checkingSheet = BalanceSheet.loadFromAtomicTx(
      OUTPOINT_TO_RUNES.select(this.refund_pointer.toArrayBuffer()),
      this.runtime,
    );
    checkingSheet.pipe(
      BalanceSheet.loadFromAtomicTx(
        OUTPOINT_TO_RUNES.select(this.pointer.toArrayBuffer()),
        this.runtime,
      ),
    );
    checkingSheet.pipe(
      BalanceSheet.loadFromAtomicTx(
        OUTPOINT_TO_RUNES.select(this.outpoint.toArrayBuffer()),
        this.runtime,
      ),
    );
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
      for (let i = 0; i < sheet.runes.length; i++) {
        if (this.runeIdToIndex.has(sheet.runes[i])) {
          this.runes[this.runeIdToIndex.get(sheet.runes[i])].pointer_index = i;
        }
      }
      sheet.saveToAtomicTx(
        OUTPOINT_TO_RUNES.select(this.pointer.toArrayBuffer()),
        this.runtime,
      );
      this.baseSheet.pipe(sheet);
    }
    if (this.sheets.has(this.refund_pointer.index)) {
      const sheet = this.sheets.get(this.refund_pointer.index);
      sheet.pipe(
        this.sheets.has(this.outpoint.index)
          ? this.sheets.get(this.outpoint.index)
          : new BalanceSheet(),
      );
      for (let i = 0; i < sheet.runes.length; i++) {
        if (this.runeIdToIndex.has(sheet.runes[i])) {
          this.runes[
            this.runeIdToIndex.get(sheet.runes[i])
          ].refund_pointer_index = i;
        }
      }
      sheet.saveToAtomicTx(
        OUTPOINT_TO_RUNES.select(this.refund_pointer.toArrayBuffer()),
        this.runtime,
      );
      this.baseSheet.pipe(sheet);
    }
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
}
