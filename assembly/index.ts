import { Box, RCBox } from "metashrew-as/assembly/utils/box"
import { _flush, input, get, set } from "metashrew-as/assembly/indexer/index";
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
		BLOCKHASH_TO_HEIGHT,
		HEIGHT_TO_BLOCKHASH,
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
    // open tables



    // set height to hash index
    

    let coinbase_inputs = new Array<Array<u64>>();

    let h = new Height(height);
    // if block subsidy is greater than 0, add range to coinbase input
    if (h.subsidy() > 0) {
      let start: Sat = h.startingSat();
      coinbase_inputs.push([<u64>(start.n()), <u64>(start.n() + h.subsidy())]);
    }

    for (let tx_offset = 1; tx_offset < block.transactions.length; tx_offset++) {
      let tx = block.transactions[tx_offset];
      let inputOrdinalsRange = new Array<Array<u64>>();

      for (let i = 0; i < tx.ins.length; i++) {
        let input = tx.ins[i];
        // encode key from transaction outpoint
        let previousOutpoint: ArrayBuffer = input.previousOutput().toBuffer();

        let response = OUTPOINT_TO_SATRANGES.get(previousOutpoint);
        let satRange = Box.from(response);
        let numOfOrdinals = parsePrimitive<u32>(satRange);
        for ( let i = 0; i < <i32>numOfOrdinals; i++ ) {
          let start = parsePrimitive<u64>(satRange);
          let end = parsePrimitive<u64>(satRange);
          inputOrdinalsRange.push([start, end])
        }
      }

      Index.indexTransactions(
        tx.txid(),
        tx,
	height,
        inputOrdinalsRange
      );

      for (let i = 0; i < inputOrdinalsRange.length; i++) {
        coinbase_inputs.push(inputOrdinalsRange[i]);
      }

//      Index.indexTransactionInscription(tx, tx.txid(), height); 
    }

    let coinbase = block.coinbase();
    if (coinbase == null) {return};

    Index.indexTransactions(
      coinbase.txid(),
      coinbase,
      height,
      coinbase_inputs
    );

    HEIGHT_TO_BLOCKHASH.set(primitiveToBuffer<u32>(height), block.blockhash());
    BLOCKHASH_TO_HEIGHT.set(block.blockhash(), primitiveToBuffer<u32>(height));
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
