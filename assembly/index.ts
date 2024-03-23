import { Box, RCBox } from "metashrew-as/assembly/utils/box"
import { _flush, input, get, set } from "metashrew-as/assembly/indexer/index";
import { parsePrimitive, concat, primitiveToBuffer } from "metashrew-as/assembly/utils/utils";
import { Block } from "metashrew-as/assembly/blockdata/block";
import { Transaction, Input, Output, OutPoint } from "metashrew-as/assembly/blockdata/transaction";
import { console } from "metashrew-as/assembly/utils/logging";
import { toRLP, RLPItem } from "metashrew-as/assembly/utils/rlp";
import { encodeHexFromBuffer, encodeHex } from "metashrew-as/assembly/utils/hex";
import { Inscription } from "metashrew-as/assembly/blockdata/inscription";
import { subsidy } from "metashrew-as/assembly/utils/ordinals";
import { Height } from "metashrew-as/assembly/blockdata/height";
import { Sat, SatPoint } from "metashrew-as/assembly/blockdata/sat";

const HEIGHT_TO_BLOCKHASH = String.UTF8.encode("/block/byheight");
const BLOCKHASH_TO_HEIGHT = String.UTF8.encode("/height/byhash");
const SAT_TO_SATPOINT = String.UTF8.encode("/satpoint/byordinal");
const SAT_TO_INSCRIPTION_ID = String.UTF8.encode("/inscription/byordinal");
const INSCRIPTION_TO_SATPOINT = String.UTF8.encode("/satpoint/byinscription");
const SATPOINT_TO_INSCRIPTION = String.UTF8.encode("/inscription/bysatpoint");
const OUTPOINT_TO_SATRANGE = String.UTF8.encode("/sat/byoutpoint");
const OUTPOINT_TO_VALUE = String.UTF8.encode("/outpoint/tovalue");
const SEQUENCE_TO_INSCRIPTION_ID = String.UTF8.encode("/inscription/bysequence");


class Table {
  keyPrefix: ArrayBuffer;

  constructor(name: ArrayBuffer) {
    this.keyPrefix = name;
  }

  static open(name: ArrayBuffer): Table {
    return new Table(name);
  }

  public insert(key: ArrayBuffer, value: ArrayBuffer): void {
    set(Index.keyFor(this.keyPrefix, key), value);
  }

  public remove(key: ArrayBuffer): void {
    set(Index.keyFor(this.keyPrefix, key), new ArrayBuffer(0));
  }

  public get(key: ArrayBuffer): ArrayBuffer {
    return get(Index.keyFor(this.keyPrefix, key));
  }

  private __indexRow(): void {
    // get currLen
    let currLen = get(Index.keyFor(this.keyPrefix, String.UTF8.encode("len")));
    set(Index.keyFor(this.keyPrefix, String.UTF8.encode("len")), )
  }

  
}

// TODO: implement `toBuffer`
class BoxedTuple<T, U> {
  _0: T;
  _1: U;
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
    let inscriptionToSatpoint = Table.open(INSCRIPTION_TO_SATPOINT);
    let satpointToInscription = Table.open(SATPOINT_TO_INSCRIPTION);


    let floatingInscriptions = new Array();
    let idCounter = 0;
    let inscribedOffsets = new Array<Offset>();
    let totalInputValue: u64 = 0;
    let totalOutputValue: u64 = tx.outs.reduce<u64>((acc, output) => <u64>acc + output.value, <u64>0);


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
      let currentInscriptions: Array<ArrayBuffer> = Index.viewInscriptionsOnOutput(prevout);

      for (let i = 0; i < currentInscriptions.length; i++) {
        let inscription = currentInscriptions[i];
        let oldSatpoint = inscription._0;
        let oldInscriptionId = inscription._1;
      }
    }

    // TODO: handle inscripion transfers
    // `get` inscriptions on previousOutput's 
  }

  static indexBlock(height: u32, block: Block): void {
    // open tables
    let hashToHeight = Table.open(BLOCKHASH_TO_HEIGHT);
    let heightToHash = Table.open(HEIGHT_TO_BLOCKHASH);
    let satToSatpoint = Table.open(SAT_TO_SATPOINT);
    let outpointToSatRanges = Table.open(OUTPOINT_TO_SATRANGE);
    let outpointToValue = Table.open(OUTPOINT_TO_VALUE);



    // insert height to hash index
    

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

        let response = outpointToSatRanges.get(previousOutpoint);
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
        satToSatpoint,
        outpointToSatRanges,
        outpointToValue,
        inputOrdinalsRange
      );

      for (let i = 0; i < inputOrdinalsRange.length; i++) {
        coinbase_inputs.push(inputOrdinalsRange[i]);
      }

      Index.indexInscription(tx, tx.txid(), height); 
    }

    let coinbase = block.coinbase();
    if (coinbase == null) {return};

    Index.indexTransactions(
      coinbase.txid(),
      coinbase,
      satToSatpoint,
      outpointToSatRanges,
      outpointToValue,
      coinbase_inputs
    );

    heightToHash.insert(primitiveToBuffer<u32>(height), block.blockhash());
    hashToHeight.insert(block.blockhash(), primitiveToBuffer<u32>(height));
  }

  static indexInscription(
    tx: Transaction,
    txid: ArrayBuffer,
    height: u32
  ): void {
    let sequenceToInscriptionId = Table.open(SEQUENCE_TO_INSCRIPTION_ID);
    
  }

  static indexTransactions(
    txid: ArrayBuffer,
    tx: Transaction,
    satToSatpoint: Table,
    outpointToSatRanges: Table,
    outpointToValue: Table,
    inputOrdinalsRange: Array<Array<u64>>,
  ): void {
    // transaction outputs
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
          satToSatpoint.insert(
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

      outpointToSatRanges.insert(key, ords);
      outpointToValue.insert(key, primitiveToBuffer<u64>(output.value));
    }
  }

  // *type - view function
  // *description - view inscriptions on a given outpoint (txid, index)
  static viewInscriptionsOnOutput(outpoint: OutPoint): Array<ArrayBuffer> {
    let satpointToInscription = Table.open(SATPOINT_TO_INSCRIPTION);
    let inscriptions = new Array<ArrayBuffer>(); 
    for (let i = 0; i < u64.MAX_VALUE; i++) {
      let sp = new SatPoint(outpoint, i);
      let inscription = satpointToInscription.get(sp.toBuffer());
      if (emptyBuffer(inscription)) { continue }
      inscriptions.push(inscription);
    }
    return inscriptions;
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

