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

  static indexBlock(height: u32, block: Block): void {
    HEIGHT_TO_BLOCKHASH.selectValue<u32>(height).set(block.blockhash());
    BLOCKHASH_TO_HEIGHT.select(block.blockhash()).setValue<u32>(height);
    let startingSat = STARTING_SAT.getValue<u64>();
    let satNumber = startingSat;
    const coinbase = block.coinbase();
    for (let i: i32 = 0; i < coinbase.outs.length; i++) {
      const outpoint = OutPoint.from(coinbase.txid(), <u32>i).toArrayBuffer();
      SAT_TO_OUTPOINT.set(satNumber, outpoint);
      OUTPOINT_TO_SAT.select(outpoint).appendValue<u64>(satNumber);
      satNumber += coinbase.outs[i].value;
    }
    STARTING_SAT.setValue<u64>(satNumber);
    for (let i: i32 = 1; i < block.transactions.length; i++) {
      const tx = block.transactions[i];
      const satsByInput = new Array<Array<u64>>(block.transactions[i].ins.length);
      for (let j: i32 = 0; j < satsByInput.length; j++) {
        const outpoint = block.transactions[i].ins[j].previousOutput().toArrayBuffer();
        satsByInput[j] = OUTPOINT_TO_SAT.select(outpoint).getListValues<u64>();
      }
      const sats = flatten<u64>(satsByInput);
      let position = 0;
      const distances = new Array<u64>(sats.length);
      for (let satIndex: i32 = 0; satIndex < sats.length; satIndex++) {
        distances[satIndex] = min(rangeLength<u64>(SAT_TO_OUTPOINT, sats[satIndex]), startingSat - sats[satIndex]);
      }
      for (let j: i32 = 0; j < satsByInput.length; j++) {
        const outpoint = block.transactions[i].ins[j].previousOutput().toArrayBuffer();
        let satsForInput = satsByInput[j] = OUTPOINT_TO_SAT.select(outpoint).getListValues<u64>();
	for (let k: i32 = 0; k < satsForInput.length; k++) {
          SAT_TO_OUTPOINT.nullify(satsForInput[k]);
	}
      }
      const txid = tx.txid();
      for (let j: i32 = 0; j < tx.outs.length; j++) {
        let remaining: u64 = tx.outs[j].value;
        const outpoint = OutPoint.from(txid, j).toArrayBuffer();
	const outpointIndexPointer = OUTPOINT_TO_SAT.select(outpoint);
        while (remaining > 0) {
          SAT_TO_OUTPOINT.set(sats[position], outpoint);
	  outpointIndexPointer.appendValue<u64>(sats[position]);
	  if (distances[position] < remaining) {
	    remaining -= distances[position];
            position++;
	  } else {
            sats[position] += <u64>remaining;
	    distances[position] -= <u64>remaining;
	    remaining = 0;
	  }
	}
      }
      Index.indexTransactionInscriptions(tx, txid, height);
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
