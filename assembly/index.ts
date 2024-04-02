import { Box, RCBox } from "metashrew-as/assembly/utils/box"
import { _flush, input, get, set } from "metashrew-as/assembly/indexer/index";
import { IndexPointer } from "metashrew-as/assembly/indexer/tables";
import { parseBytes, parsePrimitive, concat, primitiveToBuffer } from "metashrew-as/assembly/utils/utils";
import { scriptParse } from "metashrew-as/assembly/utils/yabsp";
import { Block } from "metashrew-as/assembly/blockdata/block";
import { Transaction, Input, Output, OutPoint } from "metashrew-as/assembly/blockdata/transaction";
import { console } from "metashrew-as/assembly/utils/logging";
import { toRLP, RLPItem } from "metashrew-as/assembly/utils/rlp";
import { encodeHexFromBuffer, encodeHex } from "metashrew-as/assembly/utils/hex";
import { Inscription } from "metashrew-as/assembly/blockdata/inscription";
import { subsidy } from "metashrew-as/assembly/utils/ordinals";
import { Height } from "metashrew-as/assembly/blockdata/height";
import { Sat, SatPoint } from "metashrew-as/assembly/blockdata/sat";
import { BST } from "metashrew-as/assembly/indexer/bst";

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

function decodeU128Sequence(input: Box, output: VarIntOutput): void {
  const values = new StaticArray<u8>(8);
  const result = new Array<VarIntOutput>(0);
  let bytes = new Array<u8>(input.len);
  while (input.len > 0) {
    const thisByte = load<u8>(input.start);
    bytes.push(thisByte);
    input.shrinkFront(1);
    if (thisByte & 0x80 === 0) {
      
    }
  }

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
