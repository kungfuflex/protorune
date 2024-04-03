import { Box } from "metashrew-as/assembly/utils/box"
import { _flush, input, get, set } from "metashrew-as/assembly/indexer/index";
import { IndexPointer } from "metashrew-as/assembly/indexer/tables";
import { scriptParse } from "metashrew-as/assembly/utils/yabsp";
import { Block } from "metashrew-as/assembly/blockdata/block";
import { parsePrimitive } from "metashrew-as/assembly/utils/utils";
import { Transaction, Output } from "metashrew-as/assembly/blockdata/transaction";
import { console } from "metashrew-as/assembly/utils/logging";
import { toRLP, RLPItem } from "metashrew-as/assembly/utils/rlp";
import { BST } from "metashrew-as/assembly/indexer/bst";
import { readULEB128ToU128 } from "./leb128";
import { u256, u128 } from "as-bignum/assembly";

const HEIGHT_TO_BLOCKHASH = IndexPointer.for("/blockhash/byheight/");
const BLOCKHASH_TO_HEIGHT = IndexPointer.for("/height/byblockhash/");

function rangeLength<K>(bst: BST<K>, key: K): K {
  return bst.seekGreater(key) - key;
}

function min<T>(a: T, b: T): T {
  if (a > b) return b;
  return a;
}

function flatten<T>(ary: Array<Array<T>>): Array<T> {
  const result: Array<T> = new Array<T>(0);
  for (let i = 0; i < ary.length; i++) {
    for (let j = 0; j < ary[i].length; j++) {
      result.push(ary[i][j]);
    }
  }
  return result;
}

@final
class RunesTransaction extends Transaction {
  runestoneOutputIndex(): i32 {
    for (let i = 0; i < this.outs.length; i++) {
      if (load<u16>(this.outs[i].script.start) === RUNESTONE_TAG) return i;
    }
    return -1;
  }
  runestoneOutput(): Output | null {
    const i = this.runestoneOutputIndex();
    if (i === -1) return null;
    else return this.outs[i];
  }
  static from(tx: Transaction): RunesTransaction {
    return changetype<RunesTransaction>(tx);
  }
  outpoint(vout: i32): ArrayBuffer {
    return OutPoint.from(this.txid(), <u32>vout);;
  }
}

@final
class RunesBlock extends Block {
  saveTransactions(index: IndexPointer): void {
    for (let i: i32 = 0; i < this.transactions.length; i++) {
      index.append(this.getTransaction(i).txid());
    }
  }
  @inline
  static from(block: Block): RunesBlock {
    return changetype<RunesBlock>(block);
  }
  @inline
  getTransaction(index: i32): RunesTransaction {
    return changetype<RunesTransaction>(this.transactions[index]);
  }
}

const RUNESTONE_TAG: u16 = 0x5f6a;

@final
@unmanaged
class Tag {
  static BODY: u64 = 0;
  static FLAGS: u64 = 2;
  static RUNE: u64 = 4;
  static PREMINE: u64 = 6;
  static CAP: u64 = 8;
  static AMOUNT: u64 = 10;
  static HEIGHTSTART: u64 = 12;
  static HEIGHTEND: u64 = 14;
  static OFFSETSTART: u64 = 16;
  static OFFSETEND: u64 = 18;
  static MINT: u64 = 20;
  static POINTER: u64 = 22;
  static CENOTAPH: u64 = 126;
  static DIVISIBILITY: u64 = 1;
  static SPACERS: u64 = 3;
  static SYMBOL: u64 = 5;
  static NOP: u64 = 127;
  constructor() {}
}

@final
@unmanaged
class Flag {
  static ETCHING: u64 = 0;
  static TERMS: u64 = 1;
  static CENOTAPH: u64 = 127;
  constructor() {}
}


class RunestoneMessage {
  public fields: Map<u64, Array<u128>>;
  public edicts: Array<StaticArray<u128>>;
  constructor(fields: Map<u64, Array<u128>>, edicts: Array<StaticArray<u128>>) {
    this.fields = fields;
    this.edicts = edicts;
  }
  getFlag(position: u8): bool {
    const flags = this.fields.get(Tag.FLAGS);
    return (flags & (u128.from(1) << u128.from(position))) != 0;
  }
  isEtching(): bool {
    return this.getFlag(Flags.ETCHING);
  }
  static parse(data: ArrayBuffer): RunestoneMessage {
  const input = Box.from(data);
  let fields = new Map<u64, Array<u128>>();
  let edicts = new Array<StaticArray<u128>>(0);
  while (input.len > 0) {
    const fieldKeyHeap = u128.from(0);
    input.shrinkFront(readULEB128ToU128(input, fieldKeyHeap));
    const fieldKey = fieldKeyHeap.toU64();
    if (fieldKey === 0) {
      while (input.len > 0) {
        const edict = new StaticArray<u128>(4);
        for (let i = 0; i < 4; i++) {
          const edictInt = u128.from(0);
          input.shrinkFront(readULEB128ToU128(input, edictInt));
	  edict[i] = edictInt;
	}
	edicts.push(edict);
      }
    } else {
      const value = u128.from(0);
      input.shrinkFront(readULEB128ToU128(input, value));
      let field: Array<u128> = changetype<Array<u128>>(0);
      if (!fields.has(fieldKey)) {
        field = new Array<u128>(0);
	fields.set(fieldKey, field);
      } else {
        field = fields.get(fieldKey);
      }
      field.push(value);
    }
  }
  return new RunestoneMessage(fields, edicts);
}
}

function fromU128Pair(lo: u128, hi: u128): u256 {
  return new u256(lo.lo, lo.hi, hi.lo, hi.hi);
}

class Edict {
  public block: u128;
  public transactionIndex: u128;
  public amount: u128;
  public output: u128;
  constructor(block: u128, transactionIndex: u128, amount: u128, output: u128) {
    this.block = block;
    this.transactionIndex = transactionIndex;
    this.amount = amount;
    this.output = output;
  }
  static zero(): Edict {
    return new Edict(u128.from(0), u128.from(0), u128.from(0), u128.from(0));
  }
  static diff(previous: Edict, values: StaticArray<u128>): Edict {
    return new Edict(previous.block + values[0], values[0] == 0 ? values[1] : previous.transactionIndex + values[1], values[2], values[3]);
  }
  static fromDeltaSeries(deltas: Array<StaticArray<u128>>): Array<Edict> {
    let last = Edict.zero();
    const result = new Array<Edict>(0);
    deltas.sort((a: StaticArray<u128>, b: StaticArray<u128>): i32 => {
      const left = fromU128Pair(a[0], a[1]);
      const right = fromU128Pair(b[0], b[1]);
      if (left < right) return -1;
      else if (left == right) return 0;
      else return 1;
    });
    for (let i: i32 = 0; i < deltas.length; i++) {
      last = Edict.diff(last, deltas[i]);
      result.push(last);
    }
    return result;
  }
}

function stripNullRight(data: ArrayBuffer): ArrayBuffer {
  const box = Box.from(data);
  while (box.len > 0) {
    if (load<u8>(box.start + box.len - <usize>1) === 0x00) {
      box.len--;
    }
    else break;
  }
  return box.toArrayBuffer();
}

function isEqualArrayBuffer(a: ArrayBuffer, b: ArrayBuffer): bool {
  if (a.byteLength !== b.byteLength) return false;
  for (let i = 0; i < a.byteLength; i++) {
    if (load<u8>(changetype<usize>(a) + i) !== load<u8>(changetype<usize>(b) + i)) return false;
  }
  return true;
}

class RuneId {
  constructor(block: u64, tx: u32) {
    this.block = block;
    this.tx = tx;
  }
  txid() {
    return HEIGHT_TO_TRANSACTION_IDS.selectValue<u32>(<u32>block).selectIndex(this.tx).get();
  }
  toU128() {
    return new u128(<u64>this.tx, this.block);
  }
  toBytes() {
    return this.toU128().toBytes();
  }
  static fromBytes(ary: ArrayBuffer) {
    const v = u128.fromBytesLE(ary)
    return RuneId.fromU128(v);
  }
  static fromU128(v: u128): RuneId {
    const block = v.hi;
    const tx = <u32>v.lo;
    return new RuneId(block, tx);
  }
}

class BalanceSheet {
  public runes: Array<ArrayBuffer>;
  public balances: Array<u128>;
  public index: Map<string, i32>
  constructor() {
    this.index = new Map<string, i32>();
  }
  @inline
  getIndex(rune: ArrayBuffer): i32 {
    if (this.has(rune)) return this.index.get(changetype<string>(rune));
    return -1;
  }
  @inline
  has(rune: ArrayBuffer): boolean {
    return this.index.has(changetype<string>(rune));
  }
  get(rune: ArrayBuffer): u128 {
    const i = this.getIndex(rune);
    if (i !== -1) return this.balances[i];
    return u128.from(0);
  }
  set(rune: ArrayBuffer, v: u128): void {
    if (this.has(rune)) {
      const i = this.getIndex(rune);
      const record = this.balances[i];
      this.balances[i] = this.balances[i] + record;
    } else {
      this.index.set(changetype<string>(rune), this.runes.length);
      this.runes.push(rune);
      this.balances.push(v);
    }
  }
  increase(rune: ArrayBuffer, v: u128): void {
    let record = this.get(rune);
    this.set(rune, v + record);
  }
  decrease(rune: ArrayBuffer, v: u128): boolean {
    const record = this.get(rune);
    if (record < v) return false;
    this.set(rune, record - v);
    return true;
  }
  pipe(b: BalanceSheet): void {
    for (let i = 0; i < this.runes.length; i++) {
      b.increase(this.runes[i], this.balances[i]);
    }
  }
  static merge(a: BalanceSheet, b: BalanceSheet): BalanceSheet {
    const balanceSheet = new BalanceSheet();
    a.pipe(balanceSheet);
    b.pipe(balanceSheet);
  }
  save(ptr: IndexPointer): void {
    const runesPtr = ptr.keyword("/runes").
    const balancesPtr = ptr.keyword("/balances");
    for (let i = 0; i < this.runes.length; i++) {
      runesPtr.append(this.runes[i]);
      balancesPtr.append(Box.from(changetype<ArrayBuffer>(this.balances[i].toBytes())).toArrayBuffer());
    }
  }
  static load(ptr: IndexPointer): BalanceSheet {
     const runesPtr = ptr.keyword("/runes");
     const balancesPtr = ptr.keyword("/balances");
     const length = runesPtr.lengthKey().getValue<u32>();
     const result = new BalanceSheet();
     for (let i: u32 = 0; i < length; i++) {
       result.set(runesPtr.selectIndex(i).get(), u128.fromBytesLE(balancesPtr.selectIndex(i).get()));
     }
     return result;
  }
}


class Index {
  static indexOutpoints(tx: RunesTransaction, txid: ArrayBuffer, height: u32): void {
    for (let i: i32 = 0; i < tx.outs.length; i++) {
      OUTPOINT_TO_HEIGHT.select(OutPoint.from(txid, <u32>i).toArrayBuffer()).setValue<u32>(height);
    }
  }
  static findCommitment(tx: RunesTransaction, name: ArrayBuffer, height: u32): ArrayBuffer {
    for (let i = 0; i < tx.ins.length; i++) {
      const input = tx.ins[i];
      if (changetype<usize>(input.witness) !== 0) {
        const tapscript = input.witness.tapscript();
	if (changetype<usize>(tapscript) !== 0) {
          const components = scriptParse(tapscript);
	  if (components.length > 1 && intoString(components[0]) === "OP_RETURN" && components[1].start !== usize.MAX_VALUE) { // check that there is 1 data push
            const previousOutpoint = tx.ins[i].previousOutpoint();
	    if (height - OUTPOINT_TO_HEIGHT.select(previousOutpoint).getValue<u32>() >= 6) { // check the commitment has at least 6 confirmations
              let commitment = components[i].toArrayBuffer();
              if (isEqualArrayBuffer(name, commitment)) return commitment
	    }
	  }
	}
      }
    }
    return changetype<ArrayBuffer>(0);
  }
  static indexBlock(height: u32, _block: Block): void {
    const block = changetype<RunesBlock>(block);
    HEIGHT_TO_BLOCKHASH.selectValue<u32>(height).set(block.blockhash());
    BLOCKHASH_TO_HEIGHT.select(block.blockhash()).setValue<u32>(height);
    block.saveTransactions(HEIGHT_TO_TRANSACTION_IDS.selectValue<u32>(height));
    for (let i: i32 = 0; i < block.transactions.length; i++) {
      const tx = block.getTransaction(i);
      const txid = tx.txid();
      Index.indexOutpoints(tx, txid, height);
      const index = tx.runestoneOutputIndex();
      if (runestoneOutputIndex !== -1) {
        const runestoneOutput = tx.outs[runestoneOutputIndex];
	const outpoint = tx.outpoint(runestoneOutputIndex);
        const parsed = scriptParse(runestoneOutput.script).slice(2);
        if (parsed.findIndex((v: Box, i: i32, ary: Array<Box>) => {
          return v.start === usize.MAX_VALUE;
	}) !== -1) continue; // non-data push: cenotaph
	const payload = Box.concat(parsed);
	const message = RunestoneMessage.parse(payload);
	const edicts = Edict.fromDeltaSeries(message.edicts);
	if (message.isEtching()) {
          const name = stripNullRight(Box.from(changetype<ArrayBuffer>(message.fields.get(Fields.RUNE).toBytes())).toArrayBuffer());
	  if (ETCHING_TO_RUNE_ID.select(name).get() || !Index.findCommitment(tx, name, height)) continue; // already taken / commitment not found
	  const runeId = new RuneId(<u64>height, <u32>i).toBytes();
	  RUNE_ID_TO_ETCHING.select(runeId).set(name);
	  ETCHING_TO_RUNE_ID.select(name).set(runeId);
	  DIVISIBILITY.keyword(name).setValue<u8>(message.fields.get(Fields.DIVISIBILITY).toU8());
          if (message.fields.has(Fields.PREMINE)) PREMINE.keyword(name).set(Box.from(changetype<ArrayBuffer>(message.fields.get(Fields.PREMINE).toBytes())).toArrayBuffer()); // use Box to copy to cache
	  MINTS_REMAINING.keyword(name).set(Box.from(changetype<ArrayBuffer>(message.fields.get(Fields.CAP).toBytes())).toArrayBuffer());
	  if (message.getFlag(Flag.TERMS)) {
            if (message.fields.has(Fields.AMOUNT)) AMOUNT.keyword(name).set(Box.from(changetype<ArrayBuffer>(message.fields.get(Fields.AMOUNT).toBytes())).toArrayBuffer());
            if (message.fields.has(Fields.CAP)) CAP.keyword(name).set(Box.from(changetype<ArrayBuffer>(message.fields.get(Fields.CAP).toBytes()).toArrayBuffer()));
	    if (message.fields.has(Fields.HEIGHTSTART)) HEIGHTSTART.keyword(name).setValue<u64>(message.fields.get(Fields.HEIGHTSTART).toU64());
	    if (message.fields.has(Fields.HEIGHTEND)) HEIGHTEND.keyword(name).setValue<u64>(message.fields.get(Fields.HEIGHTEND).toU64());
	    if (message.fields.has(Fields.OFFSETSTART)) OFFSETSTART.keyword(name).setValue<u64>(message.fields.get(Fields.OFFSETSTART).toU64());
	    if (message.fields.has(Fields.OFFSETEND)) OFFSETEND.keyword(name).setValue<u64>(message.fields.get(Fields.OFFSETEND).toU64());
	  }
	  if (message.fields.has(Fields.SPACERS)) SPACERS.keyword(name).setValue<u32>(message.fields.get(Fields.SPACERS).toU32());
	  if (message.fields.has(Fields.SYMBOL)) SYMBOL.keyword(name).setValue<u8>(message.fields.get(Fields.SYMBOL).toU8());
	}
      }
    }
  }
}


export function _start(): void {
  const data = input();
  const box = Box.from(data);
  const height = parsePrimitive<u32>(box);
  const block = new Block(box);
  Index.indexBlock(height, block);
  _flush();
}
