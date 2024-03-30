import { Box, RCBox } from "metashrew-as/assembly/utils/box"
import { _flush, input, get, set } from "metashrew-as/assembly/indexer/index";
import { IndexPointer } from "metashrew-as/assembly/indexer/tables";
import { parseBytes, parsePrimitive, concat, primitiveToBuffer } from "metashrew-as/assembly/utils/utils";
import { Block } from "metashrew-as/assembly/blockdata/block";
import { Transaction, Input, Output, OutPoint } from "metashrew-as/assembly/blockdata/transaction";
import { console } from "metashrew-as/assembly/utils/logging";
import { toRLP, RLPItem } from "metashrew-as/assembly/utils/rlp";
import { encodeHexFromBuffer, encodeHex } from "metashrew-as/assembly/utils/hex";
import { Inscription } from "metashrew-as/assembly/blockdata/inscription";
import { subsidy } from "metashrew-as/assembly/utils/ordinals";
import { Height } from "metashrew-as/assembly/blockdata/height";
import { Sat, SatPoint } from "metashrew-as/assembly/blockdata/sat";
import { JUBILEE_HEIGHT } from "./constants";
import { BST } from "metashrew-as/assembly/indexer/bst";

const SAT_TO_OUTPOINT = BST.at<u64>(IndexPointer.for("/outpoint/bysatrange/"));
const OUTPOINT_TO_SAT = IndexPointer.for("/sat/by/outpoint/");
const OUTPOINT_TO_VALUE = IndexPointer.for("/value/byoutpoint/");
const OUTPOINT_TO_SEQUENCE_NUMBERS = IndexPointer.for("/sequencenumbers/byoutpoint");
const HEIGHT_TO_BLOCKHASH = IndexPointer.for("/blockhash/byheight/");
const BLOCKHASH_TO_HEIGHT = IndexPointer.for("/height/byblockhash/");
const STARTING_SAT = IndexPointer.for("/startingsat");
const INSCRIPTION_ID_TO_INSCRIPTION = IndexPointer.for("/inscription/byid/");
const SATPOINT_TO_INSCRIPTION_ID = IndexPointer.for("/inscriptionid/bysatpoint");
const SATPOINT_TO_SAT = IndexPointer.for("/sat/bysatpoint");
const INSCRIPTION_ID_TO_SATPOINT = IndexPointer.for("/satpoint/byinscriptionid/");
const INSCRIPTION_ID_TO_BLOCKHEIGHT = IndexPointer.for("/height/byinscription/");
const HEIGHT_TO_INSCRIPTION_IDS = IndexPointer.for("/inscriptionids/byheight/")
const NEXT_SEQUENCE_NUMBER = IndexPointer.for("/nextsequence");
const SEQUENCE_NUMBER_TO_INSCRIPTION_ID = IndexPointer.for("/inscriptionid/bysequence/");
const INSCRIPTION_ID_TO_SEQUENCE_NUMBER = IndexPointer.for("/sequence/byinscriptionid/");


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


function toID(satpoint: ArrayBuffer, index: u32): ArrayBuffer {
  return Box.concat([ Box.from(satpoint), Box.from(primitiveToBuffer<u32>(index)) ]);
}

class SatRanges {
  public sats: Array<u64>;
  public distances: Array<u64>;
  constructor(sats: Array<u64>, distances: Array<u64>) {
    this.sats = sats;
    this.distances = distances;
  }
  static fromSats(sats: Array<u64>): SatRanges {
    const distances = new Array<u64>(sats.length);
    for (let i = 0; i < sats.length; i++) {
      distances[i] = min(rangeLength<u64>(SAT_TO_OUTPOINT, sats[i]), STARTING_SAT.getValue<u64>());
    }
    return new SatRanges(sats, distances);
  }
  static fromInputs(inputs: Array<Input>): SatRanges {
    return SatRanges.fromSats(flatten(inputs.map<Array<u64>>((v: Input) => OUTPOINT_TO_SAT.select(v.previousOutput().toArrayBuffer()).getListValues<u64>())));
  }
}

class SatSource {
  public ranges: SatRanges;
  public pointer: i32;
  public offset: u64
  constructor(ranges: SatRanges) {
    this.ranges = ranges;
  }
  static fromInputs(inputs: Array<Input>): SatSource {
    return new SatSource(SatRanges.fromInputs(inputs));
  }
  consumed(): boolean {
    return this.pointer >= this.ranges.sats.length || this.pointer === this.ranges.sats.length - 1 && this.offset >= this.ranges.distances[this.ranges.distances.length - 1];
  }
  static range(sat: u64, distance: u64): SatSource {
    const sats = new Array<u64>(1);
    sats[0] = sat;
    const distances = new Array<u64>(1);
    distances[0] = distance;
    return new SatSource(new SatRanges(sats, distances));
  }

}

class SatSink {
  public target: Transaction;
  public pointer: i32;
  public offset: u64;
  constructor(target: Transaction) {
    this.target = target;
  }
  filled(): boolean {
     return this.pointer >= this.target.outs.length || this.pointer === this.target.outs.length - 1 && this.offset >= this.target.outs[this.target.outs.length - 1].value
  }
  currentOutpoint(): ArrayBuffer {
    return OutPoint.from(this.target.txid(), this.pointer).toArrayBuffer();
  }
  consume(source: SatSource): void {
    while (!source.consumed() && !this.filled()) {
      const sourceRemaining = source.ranges.distances[source.pointer] - source.offset;
      const targetRemaining = this.target.outs[this.pointer].value - this.offset;
      const outpoint = this.currentOutpoint();
      const sat = source.ranges.sats[source.pointer] + source.offset;
      SAT_TO_OUTPOINT.set(sat, outpoint);
      OUTPOINT_TO_SAT.select(outpoint).appendValue<u64>(sat);
      if (targetRemaining < sourceRemaining) {
        this.pointer++;
	this.offset = 0;
	source.offset += targetRemaining;
      } else if (sourceRemaining < targetRemaining) {
        source.pointer++;
	source.offset = 0;
	this.offset += sourceRemaining;
      } else {
        source.offset = 0;
	source.pointer++;
	this.offset = 0;
	this.pointer++;
      }
    }
  }
  static fromTransaction(tx: Transaction): SatSink {
    return new SatSink(tx);
  }
}


class Index {
  static indexTransactionInscriptions(
    tx: Transaction,
    txid: ArrayBuffer,
    height: u32
  ): void {
    const jubilant = height >= JUBILEE_HEIGHT;
    let total = 0;
    let offset: u64 = 0;
    let outputIndex: i32 = 0;
    for (let i = 0; i < tx.ins.length; i++) {
      const inscription = tx.ins[i].inscription();
      if (inscription !== null) {
        const sequenceNumber = NEXT_SEQUENCE_NUMBER.getValue<u64>();
	const outpoint = OutPoint.from(txid, <u32>outputIndex).toArrayBuffer();
	const satpoint = SatPoint.from(outpoint, <u64>offset).toArrayBuffer();
	offset++;
	if (offset >= tx.outs[outputIndex].value) {
          outputIndex++;
	  offset = 0;
	}
	const sat = OUTPOINT_TO_SAT.selectIndex(0).getValue<u64>();
	const inscriptionId = toID(satpoint, 0);
	SATPOINT_TO_SAT.select(satpoint).setValue<u64>(sat);
	SATPOINT_TO_INSCRIPTION_ID.select(satpoint).set(inscriptionId);
	INSCRIPTION_ID_TO_SATPOINT.select(inscriptionId).set(satpoint);
        INSCRIPTION_ID_TO_BLOCKHEIGHT.select(inscriptionId).setValue<u32>(height);
	HEIGHT_TO_INSCRIPTION_IDS.selectValue<u32>(height).append(inscriptionId);
	SEQUENCE_NUMBER_TO_INSCRIPTION_ID.selectValue<u64>(sequenceNumber).set(inscriptionId);
	INSCRIPTION_ID_TO_SEQUENCE_NUMBER.select(inscriptionId).setValue<u64>(sequenceNumber);
	INSCRIPTION_ID_TO_INSCRIPTION.select(inscriptionId).set(inscription.toArrayBuffer());
	OUTPOINT_TO_SEQUENCE_NUMBERS.select(outpoint).appendValue<u64>(sequenceNumber);
      } else {
        const previousOutput = tx.ins[i].previousOutput().toArrayBuffer();
        const inscriptionsForOutpoint = OUTPOINT_TO_SEQUENCE_NUMBERS.select(previousOutput).getListValues<u64>();
        for (let j = 0; j < inscriptionsForOutpoint.length; j++) {
          const inscriptionId = SEQUENCE_NUMBER_TO_INSCRIPTION_ID.selectValue<u64>(inscriptionsForOutpoint[j]).get();
	  const outpoint = OutPoint.from(txid, <u32>outputIndex).toArrayBuffer();
          const satpoint = SatPoint.from(outpoint, <u64>offset).toArrayBuffer();
	  SATPOINT_TO_INSCRIPTION_ID.select(satpoint).set(inscriptionId);
	  INSCRIPTION_ID_TO_SATPOINT.select(inscriptionId).set(satpoint);
          offset++;
	  if (offset >= tx.outs[outputIndex].value) {
            outputIndex++;
	    offset = 0;
          }
	}
      }
    }
  }

  static totalOutputs(tx: Transaction): u64 {
    let total: u64 = 0;
    for (let i: i32 = 0; i < tx.outs.length; i++) {
      total += tx.outs[i].value;
    }
    return total;
  }
  static totalInputs(tx: Transaction): u64 {
    let total: u64 = 0;
    for (let i: i32 = 0; i < tx.ins.length; i++) {
      total += OUTPOINT_TO_VALUE.select(tx.ins[i].previousOutput().toArrayBuffer()).getValue<u64>();
    }
    return total;
  }
  static transactionFeesForBlock(block: Block): u64 {
    let total: u64 = 0;
    for (let i: i32 = 1; i < block.transactions.length; i++) {
      const tx = block.transactions[i];
      total += (Index.totalInputs(tx) - Index.totalOutputs(tx));
      
    }
    return total;
  }
  static indexOutputValuesForTransaction(tx: Transaction): void {
    const txid = tx.txid();
    for (let i = 0; i < tx.outs.length; i++) {
      OUTPOINT_TO_VALUE.select(OutPoint.from(txid, i).toArrayBuffer()).setValue(tx.outs[i].value);
    }
  }
  static indexOutputValuesForBlock(block: Block): void {
    for (let i = 0; i < block.transactions.length; i++) {
      Index.indexOutputValuesForTransaction(block.transactions[i]);
    }
  }
  static indexBlock(height: u32, block: Block): void {
    HEIGHT_TO_BLOCKHASH.selectValue<u32>(height).set(block.blockhash());
    BLOCKHASH_TO_HEIGHT.select(block.blockhash()).setValue<u32>(height);
    Index.indexOutputValuesForBlock(block);
    const coinbase = block.coinbase();
    let startingSat = STARTING_SAT.getValue<u64>();
    const reward = Index.totalOutputs(coinbase) - Index.transactionFeesForBlock(block);
    STARTING_SAT.setValue<u64>(startingSat + reward);
    const coinbaseSource = SatSource.range(startingSat, reward);
    const coinbaseSink = SatSink.fromTransaction(coinbase);
    coinbaseSink.consume(coinbaseSource);

    for (let i: i32 = 1; i < block.transactions.length; i++) {
      const tx = block.transactions[i];
      const transactionSink = SatSink.fromTransaction(tx);
      const transactionSource = SatSource.fromInputs(tx.ins);
      transactionSink.consume(transactionSource);
      const txid = tx.txid();
      if (!transactionSource.consumed()) coinbaseSink.consume(transactionSource);
//      Index.indexTransactionInscriptions(tx, txid, height);
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

export function sat(): ArrayBuffer {
  const point = new Sat(parsePrimitive<u64>(Box.from(input())));
  return toRLP(RLPItem.fromList([
    RLPItem.fromValue(<usize> point.n()),
    RLPItem.fromArrayBuffer(String.UTF8.encode(point.height().n().toString(10) + "." + point.third().toString(10))),
    RLPItem.fromValue(<usize> point.height().n()),
    RLPItem.fromValue(<usize> point.cycle()),
    RLPItem.fromValue(<usize> point.epoch().n()),
    RLPItem.fromValue(<usize> point.period()),
    RLPItem.fromValue(<usize> point.third()),
  ]));
}

export function inscription(): ArrayBuffer {
  const data = input();
  return data;
}

export function content(): ArrayBuffer {
  const data = input();
  return data;
}

export function inscriptionsfrom(): ArrayBuffer {
  const data = input();
  return data;
}

export function inscriptionsforblock(): ArrayBuffer {
  const height = parsePrimitive<u32>(Box.from(input()));
  return new ArrayBuffer(0);
}

export function output(): ArrayBuffer {
  const data = Box.from(input());
  const outpoint = parseBytes(data, 32);
  const vout = parsePrimitive<u32>(data);
  return new ArrayBuffer(0);
}
