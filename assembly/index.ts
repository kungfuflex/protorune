import { Box, RCBox } from "metashrew-as/assembly/utils/box"
import { _flush, input, get, set } from "metashrew-as/assembly/indexer/index";
import { IndexPointer } from "metashrew-as/assembly/indexer/tables";
import { parseBytes, parsePrimitive, concat, primitiveToBuffer } from "metashrew-as/assembly/utils/utils";
import { Block } from "metashrew-as/assembly/blockdata/block";
import { Transaction, Input, Output, OutPoint } from "metashrew-as/assembly/blockdata/transaction";
import { Table, Node } from "./tables";
import { console } from "metashrew-as/assembly/utils/logging";
import { toRLP, RLPItem } from "metashrew-as/assembly/utils/rlp";
import { encodeHexFromBuffer, encodeHex } from "metashrew-as/assembly/utils/hex";
import { Inscription } from "metashrew-as/assembly/blockdata/inscription";
import { subsidy } from "metashrew-as/assembly/utils/ordinals";
import { Height } from "metashrew-as/assembly/blockdata/height";
import { Sat, SatPoint } from "metashrew-as/assembly/blockdata/sat";
import { JUBILEE_HEIGHT } from "./constants";
import { BST } from "metashrew-as/assembly/indexer/bst";


import {
  CONTENT_TYPE_TO_COUNT,
  HOME_INSCRIPTIONS,
  ID_TO_SEQUENCE_NUMBER,
  INSCRIPTION_NUMBER_TO_SEQUENCE_NUMBER,
  OUTPOINT_TO_VALUE,
	TRANSACTION_ID_TO_TRANSACTION,
	SAT_TO_SEQUENCE_NUMBER,
		SATPOINT_TO_SEQUENCE_NUMBER,
		SEQUENCE_NUMBER_TO_CHILDREN,
		SEQUENCE_NUMBER_TO_ENTRY,
		SEQUENCE_NUMBER_TO_SATPOINT,
		VALUE_CACHE,
		OUTPOINT_TO_SATRANGES,
		INSCRIPTION_TO_SATPOINT,
		SATPOINT_TO_INSCRIPTION,
		SAT_TO_SATPOINT,
		OUTPOINT_TO_VALUE
} from "./tables";

// TODO: implement `toBuffer`
class BoxedTuple<T, U> {
  _0: T;
  _1: U;
}

class Flotsam {
  public offset: u64;
  public inscriptionId: ArrayBuffer;
  public origin: SatPoint;
  constructor(offset: u64, inscriptionId: ArrayBuffer, origin: SatPoint) {
    this.offset = offset;
    this.inscriptionId = inscriptionId;
    this.origin = origin;
  }
}

const SAT_TO_OUTPOINT = BST.at<u64>(IndexPointer.wrap(String.UTF8.encode("/outpoint/bysatrange")));
const  OUTPOINT_TO_SAT = IndexPointer.wrap(String.UTF8.encode("/sat/by/outpoint"));
const HEIGHT_TO_BLOCKHASH = IndexPointer.wrap(String.UTF8.encode("/blockhash/byheight"));
const BLOCKHASH_TO_HEIGHT = IndexPointer.wrap(String.UTF8.encode("/height/byblockhash"));
const STARTING_SAT = IndexPointer.wrap(String.UTF8.encode("/startingsat"));

function rangeLength<K>(bst: BST<K>, key: K): K {
  return bst.seekGreater(key) - key;
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


class Index {
  static keyFor(table: ArrayBuffer, key: ArrayBuffer): ArrayBuffer {
    return Box.concat([Box.from(table), Box.from(key)]);
  }

  static indexTransactionInscriptions(
    tx: Transaction,
    txid: ArrayBuffer,
    height: u32
  ): void {
    const jubilant = height >= JUBILEE_HEIGHT;
    const totalOutputValue = tx.outs.reduce<u64>((r: u64, v: Output, i: i32, ary: Array<Output>): u64 => {
      return r + v.value;
    }, <u64>0);
    let floatingInscriptions = new Array<Flotsam>();
    let idCounter = 0;
    let inscribedOffsets = new Array<u64>();
    let totalInputValue: u64 = 0;


    let inscriptions = tx.parseInscriptions();
    if (inscriptions.length == 0) { return }

    for ( let i = 0; i < tx.ins.length; i++ ) {
      let input = tx.ins[i];
      let prevout = input.previousOutput();

      if (prevout.isNull()) {
        totalInputValue += new Height(height).subsidy();
        continue;
      }


      // find existing inscriptions on inputs
      let currentInscriptions: Array<Node> = Index.inscriptionsOnOutput(prevout);

      for (let i = 0; i < currentInscriptions.length; i++) {
        let inscription = currentInscriptions[i];
        let oldSatpoint = new SatPoint(prevout, parsePrimitive<u32>(Box.from(currentInscriptions[i].key)));
        let oldInscriptionId = currentInscriptions[i].value;
      }
    }

    // TODO: handle inscripion transfers
    // `get` inscriptions on previousOutput's 
  }

  static indexBlock(height: u32, block: Block): void {
    HEIGHT_TO_BLOCKHASH.keyword("/").select(primitiveToBuffer<u32>(height)).set(block.blockhash());
    BLOCKHASH_TO_HEIGHT.keyword("/").select(block.blockhash()).set(primitiveToBuffer<u32>(height));
    let startingSat = STARTING_SAT.getValue<u64>();
    let satNumber = startingSat;
    const coinbase = block.coinbase();
    for (let i: i32 = 0; i < coinbase.outs.length; i++) {
      const outpoint = OutPoint.from(coinbase.txid(), <u32>i).toArrayBuffer();
      SAT_TO_OUTPOINT.set(satNumber, outpoint);
      OUTPOINT_TO_SAT.keyword("/").select(outpoint).setValue<u64>(satNumber);
      satNumber += coinbase.outs[i].value;
    }
    STARTING_SAT.setValue<u64>(satNumber);
    for (let i: i32 = 1; i < block.transactions.length; i++) {
      const tx = block.transactions[i];
      const satsByInput = new Array<Array<u64>>(block.transactions[i].ins.length);
      for (let j: i32 = 0; j < satsByInput.length; j++) {
        let satsForInput = satsByInput[j] = OUTPOINT_TO_SAT.keyword("/").select(OutPoint.from(block.transactions[i].ins[j].hash.toArrayBuffer(), block.transactions[i].ins[j].index).toArrayBuffer()).getListValues<u64>();
	for (let k: i32 = 0; k < satsForInput.length; k++) {
          SAT_TO_OUTPOINT.nullify(satsForInput[k]);
	}
      }

      const sats = flatten<u64>(satsByInput);
      let position = 0;
      const distances = new Array<u64>(sats.length);
      for (let satIndex: i32 = 0; satIndex < sats.length; satIndex++) {
        distances[satIndex] = max(rangeLength<u64>(SAT_TO_OUTPOINT, sats[satIndex]), startingSat - sats[satIndex]);
      }
      const txid = tx.txid();
      for (let j: i32 = 0; j < tx.outs.length; j++) {
        let remaining: u64 = tx.outs[j].value;
        const outpoint = OutPoint.from(txid, j).toArrayBuffer();
	const outpointIndexPointer = OUTPOINT_TO_SAT.keyword("/").select(outpoint);
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
    }
  }

  static indexTransactions(
    txid: ArrayBuffer,
    tx: Transaction,
    height: u32,
    inputOrdinalsRange: Array<Array<u64>>,
  ): void {
    // transaction outputs
    Index.indexTransactionInscriptions(tx, txid, height);
    for (let i = 0; i < tx.outs.length; i++) {
      let key = OutPoint.from(txid, i).toBuffer();
      let ordinals: Array<ArrayBuffer> = [];
      let output = tx.outs[i];

      let remaining = output.value;
      while (remaining > 0) {
        if (inputOrdinalsRange.length == 0) {
          break;
        } 
        let range = inputOrdinalsRange.shift();

        // ordinal to satpoint

        if (!(new Sat(range[0])).isCommon()) {
          SAT_TO_SATPOINT.set(
            primitiveToBuffer<u64>(range[0]),
            (new SatPoint(
              OutPoint.from(txid, i),
              <u64>(output.value - remaining)
            )).toBuffer()
          );
        }

        let count = range[1] - range[0];
        let assigned: Array<u64> = new Array();
        if (count > remaining) {
          let middle = range[0] + remaining;
          inputOrdinalsRange.unshift([middle, range[1]]);
          assigned = [range[0], middle];
        } else {
          assigned = range;
        }

        let start = primitiveToBuffer<u64>(assigned[0]);
        let end = primitiveToBuffer<u64>(assigned[1]);
        let ordinalRange = concat([start, end]);
        ordinals.push(ordinalRange);
        remaining -= assigned[1] - assigned[0];
      }

      ordinals.unshift(
        primitiveToBuffer<u32>(<u32>ordinals.length)
      );
      let ords = concat(ordinals);

      OUTPOINT_TO_SATRANGES.set(key, ords);
      OUTPOINT_TO_VALUE.set(key, primitiveToBuffer<u64>(output.value));
    }
  }

  static inscriptionsOnOutput(outpoint: OutPoint): Array<Node> {
    return SATPOINT_TO_INSCRIPTION.fromLinkedList(outpoint.toBuffer());
  }

}

function emptyBuffer(a: ArrayBuffer): boolean {
  return a.byteLength == 0;
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
