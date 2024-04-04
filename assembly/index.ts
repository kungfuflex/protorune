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

const RUNESTONE_TAG: u16 = 0x5f6a;
const OP_RETURN: u8 = 0x6a;

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

class RunestoneMessage {
  public fields: Map<u64, Array<u128>>;
  public edicts: Array<StaticArray<u128>>;
  constructor(fields: Map<u64, Array<u128>>, edicts: Array<StaticArray<u128>>) {
    this.fields = fields;
    this.edicts = edicts;
  }
  getFlag(position: u64): bool {
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
      input.shrinkFront(readULEB128ToU128(input, fieldKeyHeap));
      const fieldKey = fieldKeyHeap.lo;
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
  return data[0];
}

function toArrayBuffer(data: u128): ArrayBuffer {
  return Box.from(changetype<ArrayBuffer>(data.toBytes())).toArrayBuffer();
}

function fieldToArrayBuffer(data: Array<u128>): ArrayBuffer {
  return Box.concat(
    data.map((v: u128, i: i32, ary: Array<u128>) => Box.from(toArrayBuffer(v))),
  );
}

function fromBox(data: Box): u128 {
  return u128.fromBytesLE(changetype<u8[]>(data.toArrayBuffer()));
}

function fromArrayBuffer(data: ArrayBuffer): u128 {
  return u128.fromBytesLE(changetype<u8[]>(data));
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
      if (changetype<usize>(input.witness) !== 0) {
        const tapscript = input.witness.tapscript();
        if (changetype<usize>(tapscript) !== 0) {
          const components = scriptParse(tapscript);
          if (
            components.length > 1 &&
            intoString(components[0]) === "OP_RETURN" &&
            components[1].start !== usize.MAX_VALUE
          ) {
            // check that there is 1 data push
            const previousOutpoint = tx.ins[i].previousOutput().toArrayBuffer();
            if (
              height -
                OUTPOINT_TO_HEIGHT.select(previousOutpoint).getValue<u32>() >=
              6
            ) {
              // check the commitment has at least 6 confirmations
              let commitment = components[i].toArrayBuffer();
              if (isEqualArrayBuffer(name, commitment)) return commitment;
            }
          }
        }
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
      if (runestoneOutputIndex !== -1) {
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
          if (
            ETCHING_TO_RUNE_ID.select(name).get() ||
            !Index.findCommitment(tx, name, height)
          )
            continue; // already taken / commitment not found
          const runeId = new RuneId(<u64>height, <u32>i).toBytes();
          RUNE_ID_TO_ETCHING.select(runeId).set(name);
          ETCHING_TO_RUNE_ID.select(name).set(runeId);
          RUNE_ID_TO_HEIGHT.select(runeId).setValue<u32>(height);
          DIVISIBILITY.select(name).setValue<u8>(
            fieldTo<u8>(message.fields.get(Field.DIVISIBILITY)),
          );
          if (message.fields.has(Field.PREMINE)) {
            const premine = fieldToU128(message.fields.get(Field.PREMINE));
            BalanceSheet.fromPairs([runeId], [premine]).pipe(balanceSheet);
            PREMINE.select(name).set(toArrayBuffer(premine));
          }
          MINTS_REMAINING.select(name).set(
            fieldToArrayBuffer(message.fields.get(Field.CAP)),
          );
          if (message.getFlag(Flag.TERMS)) {
            if (message.fields.has(Field.AMOUNT))
              AMOUNT.select(name).set(
                toArrayBuffer(fieldToU128(message.fields.get(Field.AMOUNT))),
              );
            if (message.fields.has(Field.CAP))
              CAP.select(name).set(
                toArrayBuffer(fieldToU128(message.fields.get(Field.CAP))),
              );
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
