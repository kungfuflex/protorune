import { Box } from "metashrew-as/assembly/utils/box";
import { _flush, input, get, set } from "metashrew-as/assembly/indexer/index";
import { IndexPointer } from "metashrew-as/assembly/indexer/tables";
import { intoString, scriptParse } from "metashrew-as/assembly/utils/yabsp";
import { Block } from "metashrew-as/assembly/blockdata/block";
import { parsePrimitive } from "metashrew-as/assembly/utils/utils";
import {
  Transaction,
  Input,
  Output,
  OutPoint
} from "metashrew-as/assembly/blockdata/transaction";
import { console } from "metashrew-as/assembly/utils/logging";
import { toRLP, RLPItem } from "metashrew-as/assembly/utils/rlp";
import { BST } from "metashrew-as/assembly/indexer/bst";
import { readULEB128ToU128 } from "./leb128";
import { u256, u128 } from "as-bignum/assembly";

export function trap(): void { unreachable(); }

const HEIGHT_TO_BLOCKHASH = IndexPointer.for("/blockhash/byheight/");
const BLOCKHASH_TO_HEIGHT = IndexPointer.for("/height/byblockhash/");
const OUTPOINT_TO_RUNES = IndexPointer.for("/height/byblockhash/");
const OUTPOINT_TO_HEIGHT = IndexPointer.for("/height/byoutpoint/");
const HEIGHT_TO_TRANSACTION_IDS = IndexPointer.for("/transactionids/byheight");

const SYMBOL = IndexPointer.for("/runes/symbol/");
const CAP = IndexPointer.for("/runes/cap/");
const SPACERS = IndexPointer.for("/runes/spaces/");
const OFFSETEND = IndexPointer.for("/runes/offset/end/");
const OFFSETSTART = IndexPointer.for("/runes/offset/start/");
const HEIGHTSTART = IndexPointer.for("/runes/height/start/");
const HEIGHTEND = IndexPointer.for("/runes/height/end/");
const AMOUNT = IndexPointer.for("/runes/amount/");
const MINTS_REMAINING = IndexPointer.for("/runes/mints-remaining/");
const PREMINE = IndexPointer.for("/runes/premine/");
const DIVISIBILITY = IndexPointer.for("/runes/divisibility/");
const RUNE_ID_TO_HEIGHT = IndexPointer.for("/height/byruneid/");
const RUNE_ID_TO_ETCHING = IndexPointer.for("/etching/byruneid/");
const ETCHING_TO_RUNE_ID = IndexPointer.for("/runeid/byetching/");



function min<T>(a: T, b: T): T {
  if (a > b) return b;
  return a;
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
  defaultOutput(): i32 {
    for (let i = 0; i < this.outs.length; i++) {
      if (load<u8>(this.outs[i].script.start) !== OP_RETURN) return i;
    }
    return -1;
  }
  static from(tx: Transaction): RunesTransaction {
    return changetype<RunesTransaction>(tx);
  }
  outpoint(vout: i32): ArrayBuffer {
    return OutPoint.from(this.txid(), <u32>vout).toArrayBuffer();
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

const RUNESTONE_TAG: u16 = 0x5d6a;
const OP_RETURN: u8 = 0x6a;

const GENESIS: u32 = 840000;

@final
@unmanaged
class Field {
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

function padLeft(v: string, n: i32): string {
  let result = "";
  for (let i: i32 = 0; i < n - v.length; i++) {
    result += "0";
  }
  return result + v;
}

function u128ToHex(v: u128): string {
  return padLeft(v.hi.toString(16), 16) + padLeft(v.lo.toString(16), 16);
}

class RunestoneMessage {
  public fields: Map<u64, Array<u128>>;
  public edicts: Array<StaticArray<u128>>;
  constructor(fields: Map<u64, Array<u128>>, edicts: Array<StaticArray<u128>>) {
    this.fields = fields;
    this.edicts = edicts;
  }
  inspect(): string {
    let result = "RunestoneMessage {\n";
    let fieldInts = this.fields.keys();
    for (let i = 0; i < fieldInts.length; i++) {
      result += "  " + fieldInts[i].toString(10) + ": [\n";
      const ary = this.fields.get(fieldInts[i]);
      for (let j = 0; j < ary.length; j++) {
        result += "    " + u128ToHex(ary[j]) + ",\n"
      }
      result += "  ]\n";
    }
    result += "  edicts: [";
    for (let i = 0; i < this.edicts.length; i++) {
      result += "    ";
      for (let j = 0; j < this.edicts[i].length; j++) {
        result += u128ToHex(this.edicts[i][j]); 
      }
      if (i !== this.edicts.length - 1) result += ", ";
    }
    result += "]\n}";
    return result;
  }
  getFlag(position: u64): bool {
    if (!this.fields.has(Field.FLAGS)) return false;
    const flags = fieldToU128(this.fields.get(Field.FLAGS));
    return !u128.and(flags, u128.from(1) << <i32>position).isZero();
  }
  isEtching(): bool {
    return this.getFlag(Flag.ETCHING);
  }
  mintTo(): ArrayBuffer {
    if (!this.fields.has(Field.MINT)) return changetype<ArrayBuffer>(0);
    return fieldToArrayBuffer(this.fields.get(Field.MINT));
  }
  static parse(data: ArrayBuffer): RunestoneMessage {
    const input = Box.from(data);
    let fields = new Map<u64, Array<u128>>();
    let edicts = new Array<StaticArray<u128>>(0);
    while (input.len > 0) {
      const fieldKeyHeap = u128.from(0);
      const size = readULEB128ToU128(input, fieldKeyHeap);
      if (size === usize.MAX_VALUE) return changetype<RunestoneMessage>(0);
      input.shrinkFront(size);
      const fieldKey = fieldKeyHeap.lo;
      if (fieldKey === 0) {
        while (input.len > 0) {
          const edict = new StaticArray<u128>(4);
          for (let i = 0; i < 4; i++) {
            const edictInt = u128.from(0);
	    const size = readULEB128ToU128(input, edictInt);
	    if (usize.MAX_VALUE === size) return changetype<RunestoneMessage>(0);
            input.shrinkFront(size);
            edict[i] = edictInt;
          }
          edicts.push(edict);
        }
      } else {
        const value = u128.from(0);
	const size = readULEB128ToU128(input, value);
	if (usize.MAX_VALUE === size) return changetype<RunestoneMessage>(0);
        input.shrinkFront(size);
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
  runeId(): RuneId {
    return new RuneId(this.block.lo, <u32>this.transactionIndex.lo);
  }
  static zero(): Edict {
    return new Edict(u128.from(0), u128.from(0), u128.from(0), u128.from(0));
  }
  static diff(previous: Edict, values: StaticArray<u128>): Edict {
    return new Edict(
      previous.block + values[0],
      values[0].isZero() ? values[1] : previous.transactionIndex + values[1],
      values[2],
      values[3],
    );
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
  toString(): string {
    return "Edict {\n  block: 0x" + u128ToHex(this.block) + ",  \ntransactionIndex: 0x" + u128ToHex(this.transactionIndex) + ",  \namount: 0x" + u128ToHex(this.amount) + ",  output: " + u128ToHex(this.output) + "}";
  }
}

function stripNullRight(data: ArrayBuffer): ArrayBuffer {
  const box = Box.from(data);
  while (box.len > 0) {
    if (load<u8>(box.start + box.len - <usize>1) === 0x00) {
      box.len--;
    } else break;
  }
  return box.toArrayBuffer();
}

function isEqualArrayBuffer(a: ArrayBuffer, b: ArrayBuffer): bool {
  if (a.byteLength !== b.byteLength) return false;
  for (let i = 0; i < a.byteLength; i++) {
    if (
      load<u8>(changetype<usize>(a) + i) !== load<u8>(changetype<usize>(b) + i)
    )
      return false;
  }
  return true;
}

class RuneId {
  public block: u64;
  public tx: u32;
  constructor(block: u64, tx: u32) {
    this.block = block;
    this.tx = tx;
  }
  txid(): ArrayBuffer {
    return HEIGHT_TO_TRANSACTION_IDS.selectValue<u32>(<u32>block)
      .selectIndex(this.tx)
      .get();
  }
  toU128(): u128 {
    return new u128(<u64>this.tx, this.block);
  }
  toBytes(): ArrayBuffer {
    return toArrayBuffer(this.toU128());
  }
  static fromBytes(ary: ArrayBuffer): RuneId {
    const v = u128.fromBytesLE(ary);
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
  public index: Map<string, i32>;
  constructor() {
    this.index = new Map<string, i32>();
    this.balances = new Array<u128>(0);
    this.runes = new Array<ArrayBuffer>(0);
  }
  static fromPairs(runes: Array<ArrayBuffer>, balances: Array<u128>): BalanceSheet {
    const balanceSheet = new BalanceSheet();
    for (let i = 0; i < runes.length; i++) {
      balanceSheet.set(runes[i], balances[i]);
    }
    return balanceSheet;
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
    return balanceSheet;
  }
  static concat(ary: Array<BalanceSheet>): BalanceSheet {
    return ary.reduce<BalanceSheet>(
      (r: BalanceSheet, v: BalanceSheet, i: i32, ary: Array<BalanceSheet>) => {
        return BalanceSheet.merge(r, v);
      },
      new BalanceSheet(),
    );
  }
  save(ptr: IndexPointer): void {
    const runesPtr = ptr.keyword("/runes");
    const balancesPtr = ptr.keyword("/balances");
    for (let i = 0; i < this.runes.length; i++) {
      if (this.balances[i] == u128.from(0)) {
        runesPtr.append(this.runes[i]);
        balancesPtr.append(
          Box.from(
            changetype<ArrayBuffer>(this.balances[i].toBytes()),
          ).toArrayBuffer(),
        );
      }
    }
  }
  static load(ptr: IndexPointer): BalanceSheet {
    const runesPtr = ptr.keyword("/runes");
    const balancesPtr = ptr.keyword("/balances");
    const length = runesPtr.lengthKey().getValue<u32>();
    const result = new BalanceSheet();

    for (let i: u32 = 0; i < length; i++) {
      result.set(
        runesPtr.selectIndex(i).get(),
        fromArrayBuffer(balancesPtr.selectIndex(i).get()),
      );
    }
    return result;
  }
}

function toPrimitive<T>(v: u128): T {
  return <T>v.lo;
}

function fieldTo<T>(data: Array<u128>): T {
  return toPrimitive<T>(data[0]);
}

function fieldToU128(data: Array<u128>): u128 {
  if (data.length === 0) return u128.from(0);
  return data[0];
}

function toArrayBuffer(data: u128): ArrayBuffer {
  return Box.from(changetype<ArrayBuffer>(data.toStaticBytes())).toArrayBuffer();
}

function fieldToArrayBuffer(data: Array<u128>): ArrayBuffer {
  return Box.concat(
    data.map((v: u128, i: i32, ary: Array<u128>) => Box.from(toArrayBuffer(v))),
  );
}

function fromBox(data: Box): u128 {
  return u128.fromBytesLE(changetype<u8[]>(Uint8Array.wrap(data.toArrayBuffer())));
}

function fromArrayBuffer(data: ArrayBuffer): u128 {
  if (data.byteLength === 0) return u128.from(0);
  const result = u128.fromBytesLE(changetype<u8[]>(Uint8Array.wrap((data))));
  return result;
}

class Index {
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
    tx: RunesTransaction,
    name: ArrayBuffer,
    height: u32,
  ): ArrayBuffer {
    for (let i = 0; i < tx.ins.length; i++) {
      const input = tx.ins[i];
      // check that there is 1 data push
      const inscription = input.inscription();
      if (changetype<usize>(inscription) === 0) continue;
      const commitment = inscription.body();
      if (!commitment) continue;
      const previousOutpoint = tx.ins[i].previousOutput().toArrayBuffer();
      if (
        height -
        OUTPOINT_TO_HEIGHT.select(previousOutpoint).getValue<u32>() >= 6) {
        // check the commitment has at least 6 confirmations
        if (isEqualArrayBuffer(name, commitment)) return commitment;
      }
    }
    return changetype<ArrayBuffer>(0);
  }
  static indexBlock(height: u32, _block: Block): void {
    const block = changetype<RunesBlock>(_block);
    HEIGHT_TO_BLOCKHASH.selectValue<u32>(height).set(block.blockhash());
    BLOCKHASH_TO_HEIGHT.select(block.blockhash()).setValue<u32>(height);
    block.saveTransactions(HEIGHT_TO_TRANSACTION_IDS.selectValue<u32>(height));
    for (let i: i32 = 0; i < block.transactions.length; i++) {
      const tx = block.getTransaction(i);
      const txid = tx.txid();
      Index.indexOutpoints(tx, txid, height);
      const runestoneOutputIndex = tx.runestoneOutputIndex();
      if (height >= GENESIS && runestoneOutputIndex !== -1) {
        const runestoneOutput = tx.outs[runestoneOutputIndex];
        const outpoint = tx.outpoint(runestoneOutputIndex);
        const parsed = scriptParse(runestoneOutput.script).slice(2);
        if (
          parsed.findIndex((v: Box, i: i32, ary: Array<Box>) => {
            return v.start === usize.MAX_VALUE;
          }) !== -1
        )
          continue; // non-data push: cenotaph
        const payload = Box.concat(parsed);
        const message = RunestoneMessage.parse(payload);
	if (changetype<usize>(message) === 0) continue;
        const edicts = Edict.fromDeltaSeries(message.edicts);
        let etchingBalanceSheet = changetype<BalanceSheet>(0);
        let balanceSheet = BalanceSheet.concat(
          tx.ins.map<BalanceSheet>((v: Input, i: i32, ary: Array<Input>) =>
            BalanceSheet.load(
              OUTPOINT_TO_RUNES.select(v.previousOutput().toArrayBuffer()),
            ),
          ),
        );
        const mintTo = message.mintTo();
        if (changetype<usize>(mintTo) !== 0) {
          const name = RUNE_ID_TO_ETCHING.select(mintTo).get();
          const remaining = fromArrayBuffer(MINTS_REMAINING.select(name).get());
          if (!remaining.isZero()) {
            const heightStart = HEIGHTSTART.select(name).getValue<u64>();
            const heightEnd = HEIGHTEND.select(name).getValue<u64>();
            const offsetStart = OFFSETSTART.select(name).getValue<u64>();
            const offsetEnd = OFFSETEND.select(name).getValue<u64>();
            const etchingHeight =
              RUNE_ID_TO_HEIGHT.select(mintTo).getValue<u32>();
            if (
              (heightStart === 0 || height >= heightStart) &&
              (heightEnd === 0 || height < heightEnd) &&
              (offsetStart === 0 || height >= offsetStart + etchingHeight) &&
              (offsetEnd === 0 || height < etchingHeight + offsetEnd)
            ) {
              MINTS_REMAINING.select(name).set(toArrayBuffer(remaining - u128.from(1)));
              balanceSheet.increase(
                mintTo,
                fromArrayBuffer(AMOUNT.select(name).get()),
              );
            }
          }
        }
        if (message.isEtching()) {
          const name = stripNullRight(
            fieldToArrayBuffer(message.fields.get(Field.RUNE)),
          );
	  /*
          if (
            ETCHING_TO_RUNE_ID.select(name).get().byteLength !== 0 ||
            !Index.findCommitment(tx, name, height)
          )
            continue; // already taken / commitment not foun
	   */
          const runeId = new RuneId(<u64>height, <u32>i).toBytes();
          RUNE_ID_TO_ETCHING.select(runeId).set(name);
          ETCHING_TO_RUNE_ID.select(name).set(runeId);
          RUNE_ID_TO_HEIGHT.select(runeId).setValue<u32>(height);
          if (message.fields.has(Field.DIVISIBILITY)) DIVISIBILITY.select(name).setValue<u8>(
            fieldTo<u8>(message.fields.get(Field.DIVISIBILITY)),
          );
          if (message.fields.has(Field.PREMINE)) {
            const premine = fieldToU128(message.fields.get(Field.PREMINE));
            BalanceSheet.fromPairs([runeId], [premine]).pipe(balanceSheet);
            PREMINE.select(name).set(toArrayBuffer(premine));
          }
          if (message.getFlag(Flag.TERMS)) {
            if (message.fields.has(Field.AMOUNT))
              AMOUNT.select(name).set(
                toArrayBuffer(fieldToU128(message.fields.get(Field.AMOUNT))),
              );
            if (message.fields.has(Field.CAP)) {
              CAP.select(name).set(
                toArrayBuffer(fieldToU128(message.fields.get(Field.CAP))),
              );
	      MINTS_REMAINING.select(name).set(
	        fieldToArrayBuffer(message.fields.get(Field.CAP)),
	      );
	    }
            if (message.fields.has(Field.HEIGHTSTART))
              HEIGHTSTART.select(name).setValue<u64>(
                fieldTo<u64>(message.fields.get(Field.HEIGHTSTART)),
              );
            if (message.fields.has(Field.HEIGHTEND))
              HEIGHTEND.select(name).setValue<u64>(
                fieldTo<u64>(message.fields.get(Field.HEIGHTEND)),
              );
            if (message.fields.has(Field.OFFSETSTART))
              OFFSETSTART.select(name).setValue<u64>(
                fieldTo<u64>(message.fields.get(Field.OFFSETSTART)),
              );
            if (message.fields.has(Field.OFFSETEND))
              OFFSETEND.select(name).setValue<u64>(
                fieldTo<u64>(message.fields.get(Field.OFFSETEND)),
              );
          }
          if (message.fields.has(Field.SPACERS))
            SPACERS.select(name).setValue<u32>(
              fieldTo<u32>(message.fields.get(Field.SPACERS)),
            );
          if (message.fields.has(Field.SYMBOL))
            SYMBOL.select(name).setValue<u8>(
              fieldTo<u8>(message.fields.get(Field.SYMBOL)),
            );
        }
        const balancesByOutput = new Map<u32, BalanceSheet>();
        for (let i = 0; i < edicts.length; i++) {
          const edict = edicts[i];
	  const edictOutput = toPrimitive<u32>(edict.output);
          const runeId = edict.runeId().toBytes();
          let outputBalanceSheet = changetype<BalanceSheet>(0);
          if (!balancesByOutput.has(edictOutput)) {
            balancesByOutput.set(
              edictOutput,
              (outputBalanceSheet = new BalanceSheet()),
            );
          } else outputBalanceSheet = balancesByOutput.get(edictOutput);
          const amount = min(edict.amount, balanceSheet.get(runeId));
          balanceSheet.decrease(runeId, amount);
          outputBalanceSheet.increase(runeId, amount);
        }
        const unallocatedTo = message.fields.has(Field.POINTER)
          ? fieldTo<u32>(message.fields.get(Field.POINTER))
          : <u32>tx.defaultOutput();
        if (balancesByOutput.has(unallocatedTo)) {
          balanceSheet.pipe(balancesByOutput.get(unallocatedTo));
        } else {
          balancesByOutput.set(unallocatedTo, balanceSheet);
        }
        const runesToOutputs = balancesByOutput.keys();
        for (let i = 0; i < runesToOutputs.length; i++) {
          balancesByOutput
            .get(runesToOutputs[i])
            .save(
              OUTPOINT_TO_RUNES.select(
                OutPoint.from(txid, runesToOutputs[i]).toArrayBuffer(),
              ),
            );
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

function decodeHex(hex: string): ArrayBuffer {
  const result = new ArrayBuffer(hex.length / 2);
  for (let i = 0; i < hex.length; i += 2) {
    store<u8>(changetype<usize>(result) + (i / 2), <u8>parseInt(hex.substring(i, i + 2), 16));
  }
  return result;
}

function testTransaction(hex: string): void {
  const block = new Block(Box.from(decodeHex("0100000000000000000000000000000000000000000000000000000000000000000000003ba3edfd7a7b12b27ac72c3e67768f617fc81bc3888a51323a9fb8aa4b1e5e4a29ab5f49ffff001d1dac2b7c0101000000010000000000000000000000000000000000000000000000000000000000000000ffffffff4d04ffff001d0104455468652054696d65732030332f4a616e2f32303039204368616e63656c6c6f72206f6e206272696e6b206f66207365636f6e64206261696c6f757420666f722062616e6b73ffffffff0100f2052a01000000434104678afdb0fe5548271967f1a67130b7105cd6a828e03909a67962e0ea1f61deb649f6bc3f4cef38c4f35504e51ec112de5c384df7ba0b8d578a4c702b6bf11d5fac00000000")));
  block.transactions = new Array<Transaction>(1);
  block.transactions[0] = new Transaction(Box.from(decodeHex(hex)));
  Index.indexBlock(0, block);
  _flush();
}

export function test_indexEtching(): void {
  testTransaction('0200000000010281763d607e7599dde732fa2c3e7b53ff4c3d097ce89287fc276d8dfe9e886492020000000005000000df9c57a83f900c09faae93686bdf662d9ccb5eab22c9b3184a071664eb18e8650000000000050000000578030000000000002251201a020509bff496a0eef4b9444f804e24c9394a043e8e71965baa200abbc4d09578030000000000002251208f442570a0db90e5b3455573212c8edf9425cb05bd6194e70766aa17c49b3c0c1027000000000000225120e3a2c44155e80bbb791f0121893392b02f804aa07360a22b18861b9b8dd135e100000000000000001f6a5d1c020104c4a1a8e18bbd8af58c830103880805c8530680a4ca9d4e1602204e00000000000022512000b9665e3d564a99f0f20d7829f58f2a43e0a60cc40921d8b32d1985c0b7b4e70140436f259ca43dcb558885856e9fe3bedee5bdec75b714a79c5445ed3bb56dc414baf209ad40ee43a80115c4c763911597b34e9c1a49bfc9d52eb344bd8b1764c50340251d46d96914b732154ca9c1278529e3ca14714770e6a07a2c6d5f5b9d51f9b6e63101a2c875d42a8446fa2f66aac279e25fad797447d670eb7cc111c9e06b0d8120ed247313597e5eadc95a09e6c34643fd4f6edd4dad046cc155d5609c05a81611ac0063036f726401032181763d607e7599dde732fa2c3e7b53ff4c3d097ce89287fc276d8dfe9e88649201010b2064ec82c41727c6dba0d9d61559436a657ae62cdb94462056c297331e868004d40102027803010d09c4102abce829ea8c416821c0ed247313597e5eadc95a09e6c34643fd4f6edd4dad046cc155d5609c05a816113fd10c00');
}

export function test_genesisTransaction(): void {
  testTransaction('020000000001017fb9cc941aa0ca3aaf339783564d2d29ec3254a9128f5d49ad3eeb002aeb40ec0000000000000000000242342a6b000000002251203b8b3ab1453eb47e2d4903b963776680e30863df3625d3e74292338ae7928da10000000000000000246a5d21020704b5e1d8e1c8eeb788a30705a02d039f3e01020680dc9afd2808c7e8430a640340924b2624416402a52ed7cf4eba6b2c535d2def8e649a74ed97aaca5ec54881ef3b34da68bb13d76d6b420e60297a9247cb081d1e59cb2c260b1509cff25d4b3158204c04e894d5357840e324b24c959ca6a5082035f6ffae12f331202bc84bf4612eac0063036f7264010b2047f22ed15d3082f5e9a005864528e4f991ade841a9c5846e2c118425878b6be1010d09b530368c74df10a3036821c04c04e894d5357840e324b24c959ca6a5082035f6ffae12f331202bc84bf4612e00000000');
}

export function test_secondTransaction(): void {
  testTransaction('020000000001018e50641896e8da6a06b096f786bf9c6229ff765518826d6cf7af4d35ba6415280000000000fdffffff032602000000000000225120b5d8055f4a796325e5df348da2681bc5e43379eeff85cd1257dd05865037b5f92602000000000000225120b5d8055f4a796325e5df348da2681bc5e43379eeff85cd1257dd05865037b5f900000000000000001d6a5d1a020504f5bba1a9d3ffbbc705010205a14d068090848e8f3d16010340f89aa2e43e20e358ccc7e72e58085c109a13aaabf35929259b988a7f9e987c0ffdaa6bc68c1287d16c4a70d5d7a04f114e661a6ccd671c662532fdfd660f85b05c205bb63e7141d4aed9be467c4b415dc79339e9e170f66f7db82f8e6bcda7531945ac0063036f7264010b20988e7e6ab89f58c6c28759e9bfe772fe99c32aa5bddd94e7bcf5241f9c8f8b1401020100010d08f55d2835fdef8e05006821c05bb63e7141d4aed9be467c4b415dc79339e9e170f66f7db82f8e6bcda753194500000000');
}

export function test_oneFortyEight(): void {
  testTransaction('010000000001019337eda3b74a0cb2c13df69ae1839584ecf4e02bbaced178587deb1b19f1a4320100000000ffffffff0424f01e00000000002251205c444f03854dfdb7e686b4d5d2f289512715a01eba0639816c5dba83760bcc27d1ba0400000000002251201d5a7d213f1a680691e6e62de1c4342e8a694c52e1a804388d1d154e33b46bac0000000000000000056a5d0216033da5380000000000225120428a80ac40e2416988bd95d597f430e869d0db2d6445ea2d70ee0ecf6c096bf801407f96013bffd621af1c1dc70a100b21d651ad20f575d4ef8e7adc18b776049e55c12d0940fa34576a34ecfc0b624038e11e44442f0f0751b376994d087e31111a00000000');
}

export function test_fifteen(): void {
  testTransaction('020000000001015f21185c7ac9d64aac3e8068c81439ec707f71ba20fa3637858a119571227b110200000000fdffffff020000000000000000096a5d0614c0a23314012202000000000000225120644e2e837226f025142ba9ba21b9d875b72d7627d9978a08d00ec63bf93d0a0e0140271d0d7b282a585b8611c564c8647e7ed4e876821395b4b944531a3a0a042e93d06fccc0ae90c36f6e96cfdfdf6c9f83ea4fa10bdce79c6c15580c91078e619d00000000');
}
