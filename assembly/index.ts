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


class Index {
  static indexBlock(height: u32, block: Block): void {
    HEIGHT_TO_BLOCKHASH.selectValue<u32>(height).set(block.blockhash());
    BLOCKHASH_TO_HEIGHT.select(block.blockhash()).setValue<u32>(height);
    for (let i: i32 = 0; i < block.transactions.length; i++) {
      const tx = RunesTransaction.from(block.transactions[i]);
      const txid = tx.txid();

      const runestoneOutput = tx.runestoneOutput();
      if (runestoneOutput !== null) {
        const parsed = scriptParse(runestoneOutput.script).slice(2);
        if (parsed.findIndex((v: Box, i: i32, ary: Array<Box>) => {
          return v.start === usize.MAX_VALUE;
	}) !== -1) continue; // non-data push: cenotaph
	const payload = Box.concat(parsed);
	const message = RunestoneMessage.parse(payload);
	const edicts = Edict.fromDeltaSeries(message.edicts);
	if (message.isEtching()) {
          const name = message.fields.get(Fields.RUNE).toString();
          ETCHING_TO_TXID.keyword(name).set(txid);
          PREMINE.keyword(name).set(changetype<ArrayBuffer>(message.fields.get(Fields.PREMINE).toBytes()));
	  CAP.keyword(name).set(changetype<ArrayBuffer>(message.fields.get(Fields.PREMINE).toBytes()));


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
