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
import { readULEB128ToU64 } from "./leb128";

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
  runestoneOutput(): Output | null {
    for (let i = 0; i < this.outs.length; i++) {
      if (load<u16>(this.outs[i].script.start) === RUNESTONE_TAG) return this.outs[i];
    }
    return null;
  }
  static from(tx: Transaction): RunesTransaction {
    return changetype<RunesTransaction>(tx);
  }
}

const RUNESTONE_TAG: u16 = 0x5f6a;

class VarIntOutput {
  public high: u64;
  public low: u64;
  constructor() {
    this.high = 0;
    this.low = 0;
  }
}

function toBits(words: Array<u8>): StaticArray<u8> {
  words.forEach((v: u8, i: i32, ary: Array<u8>) => {
    ary[i] = ary[i] & 0x7f;
  });
  const result = new StaticArray<u8>(16);
  const bits = words.length*7;
  const offset = 16 - words.length;
  for (let i = 128 - words.length*7; i < words; i++) {
    store<u8>(changetype<usize>(result) + i, <u8>i);
  }
}

class HeapU64 {
  public value: u64;
  constructor(v: u64) {
    this.value = v;
  }
  get(): u64 {
    return this.value;
  }
}

class RunestoneMessage {
  public fields: Map<u64, Array<u64>>;
  public edicts: Array<StaticArray<u64>>;
  constructor(fields: Map<u64, Array<u64>>, edicts: Array<StaticArray<u64>>) {
    this.fields = fields;
    this.edicts = edicts;
  }
}

function parseRunestoneMessage(data: ArrayBuffer): RunestoneMessage {
  const input = Box.from(data);
  let fields = new Map<u64, Array<u64>>();
  let edicts = new Array<StaticArray<u64>>(0);
  while (input.len > 0) {
    const fieldKeyHeap = new HeapU64(0);
    input.shrinkFront(readULEB128ToU64(input, changetype<usize>(fieldKeyHeap)));
    const fieldKey = fieldKeyHeap.get();
    if (fieldKey === 0) {
      while (input.len > 0) {
        const edict = new StaticArray<u64>(4);
        for (let i = 0; i < 4; i++) {
          const edictInt = new HeapU64(0);
          input.shrinkFront(readULEB128ToU64(input, changetype<usize>(edictInt)));
	  edict[i] = edictInt.get();
	}
	edicts.push(edict);
      }
    } else {
      const value = new HeapU64(0);
      input.shrinkFront(readULEB128ToU64(input, changetype<usize>(value)));
      let field: Array<u64> = changetype<Array<u64>>(0);
      if (!fields.has(fieldKey)) {
        field = new Array<u64>(0);
	fields.set(fieldKey, field);
      } else {
        field = fields.get(fieldKey);
      }
      field.push(value.get());
    }
  }
  return new RunestoneMessage(fields, edicts);
}

class Index {
  static indexBlock(height: u32, block: Block): void {
    HEIGHT_TO_BLOCKHASH.selectValue<u32>(height).set(block.blockhash());
    BLOCKHASH_TO_HEIGHT.select(block.blockhash()).setValue<u32>(height);
    for (let i: i32 = 0; i < block.transactions.length; i++) {
      const tx = RunesTransaction.from(block.transactions[i]);
      const runestoneOutput = tx.runestoneOutput();
      if (runestoneOutput !== null) {
        const parsed = scriptParse(runestoneOutput.script).slice(2);
        if (parsed.findIndex((v: Box, i: i32, ary: Array<Box>) => {
          return v.start === usize.MAX_VALUE;
	}) !== -1) continue; // non-data push: cenotaph
	const payload = Box.concat(parsed);
	const message = parseRunestoneMessage(payload);
	console.log(message.edicts.length.toString(10));

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
