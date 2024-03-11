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
import { Sat } from "metashrew-as/assembly/blockdata/sat";

const HEIGHT_TO_HASH = String.UTF8.encode("/block/byheight");
const HASH_TO_HEIGHT = String.UTF8.encode("/block/byhash");
const ORDINAL_TO_SATPOINT = String.UTF8.encode("/satpoint/byordinal");
const ORDINAL_TO_INSCRIPTION_ID = String.UTF8.encode("/inscription/byordinal");

const TRANSACTION_BY_ID = String.UTF8.encode("/tx/byid");
const OUTPOINT_TO_VALUE = String.UTF8.encode("/outpoint/tovalue");
const HEIGHT_TO_INSCRIPTION_ID = String.UTF8.encode("/inscription/byheight");
const SAT_RANGE_BY_OUTPOINT = String.UTF8.encode("/satrange/byoutpoint");
const OUTPOINT_TO_ORDINALS_RANGE = String.UTF8.encode("/ordinals/byoutpoint");

class Table {
  keyPrefix: ArrayBuffer;

  constructor(name: ArrayBuffer) {
    this.keyPrefix = name;
  }

  static open(name: ArrayBuffer): Table {
    return new Table(name);
  }

  insert(key: ArrayBuffer, value: ArrayBuffer): void {
    set(Index.keyFor(this.keyPrefix, key), value);
  }

  get(key: ArrayBuffer): ArrayBuffer {
    return get(Index.keyFor(this.keyPrefix, key));
  }
}


class Index {
  static keyFor(table: ArrayBuffer, key: ArrayBuffer): ArrayBuffer {
    return Box.concat([Box.from(table), Box.from(key)]);
  }

  static indexBlock(height: u32, block: Block): void {
    // open tables
    let heightToHash = Table.open(HEIGHT_TO_HASH);
    let ordinalToOutpoint = Table.open(ORDINAL_TO_SATPOINT);
    let ordinalToInscription = Table.open(ORDINAL_TO_INSCRIPTION_ID);

    // insert height to hash index
    heightToHash.insert(primitiveToBuffer<u32>(height), block.blockhash());

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
        let key: ArrayBuffer = input.previousOutput().toBuffer();

        let response = get(Index.keyFor(OUTPOINT_TO_ORDINALS_RANGE, key));
        let ordinalRanges = Box.from(response);
        let numOfOrdinals = parsePrimitive<u32>(ordinalRanges);
        for ( let i = 0; i < <i32>numOfOrdinals; i++ ) {
          let start = parsePrimitive<u64>(ordinalRanges);
          let end = parsePrimitive<u64>(ordinalRanges);
          inputOrdinalsRange.push([start, end])
        }
      }

      Index.indexTransactions(
        tx.txid(),
        tx,
        ordinalToOutpoint,
        ordinalToInscription,
        inputOrdinalsRange
      );

      for (let i = 0; i < inputOrdinalsRange.length; i++) {
        coinbase_inputs.push(inputOrdinalsRange[i]);
      }
    }

    let coinbase = block.coinbase();
    if (coinbase == null) {return};

    Index.indexTransactions(
      coinbase.txid(),
      coinbase,
      ordinalToOutpoint,
      ordinalToInscription,
      coinbase_inputs
    );

  }

  static indexTransactions(
    txid: ArrayBuffer,
    tx: Transaction,
    ordinalToSatpoint: Table,
    ordinalToInscription: Table,
    inputOrdinalsRange: Array<Array<u64>>,
  ): void {
    let outpointToOrdinalsRange = Table.open(OUTPOINT_TO_ORDINALS_RANGE);
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
      outpointToOrdinalsRange.insert(key, ords);
    }
  }

  static indexRanges(height: u32, block: Block): void {
    let h = new Height(height);

    let coinbase_inputs = new Array<Array<u64>>();

    // if block subsidy is greater than 0, add range to coinbase input
    if (h.subsidy() > 0) {
      let start: Sat = h.startingSat();
      coinbase_inputs.push([<u64>(start.n()), <u64>(start.n() + h.subsidy())]);
    }

    // iterate over transaction excluding coinbase
    for (let tx_offset = 1; tx_offset < block.transactions.length; tx_offset++) {

      let tx = block.transactions[tx_offset];
      let inputOrdinalsRange = new Array<Array<u64>>();

      // transaction inputs
      for (let i = 0; i < tx.ins.length; i++) {
        let input = tx.ins[i];
        // encode key from transaction outpoint
        let key: ArrayBuffer = input.previousOutput().toBuffer();

        let response = get(Index.keyFor(OUTPOINT_TO_ORDINALS_RANGE, key));
        let ordinalRanges = Box.from(response);
        let numOfOrdinals = parsePrimitive<u32>(ordinalRanges);
        for ( let i = 0; i < <i32>numOfOrdinals; i++ ) {
          let start = parsePrimitive<u64>(ordinalRanges);
          let end = parsePrimitive<u64>(ordinalRanges);
          inputOrdinalsRange.push([start, end])
        }
      }

      // transaction outputs
      for (let i = 0; i < tx.outs.length; i++) {

        let ordinals: Array<ArrayBuffer> = [];
        let output = tx.outs[i];

        let key = OutPoint.from(tx.txid(), i).toBuffer();

        let remaining = output.value;
        while (remaining > 0) {
          if (inputOrdinalsRange.length == 0) {
            break;
          } 

          let range = inputOrdinalsRange.shift();
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

        let numOrdinals = primitiveToBuffer<u32>(<u32>ordinals.length)
        ordinals.unshift(numOrdinals);
        let ords = concat(ordinals);
        set(Index.keyFor(OUTPOINT_TO_ORDINALS_RANGE, key), ords); 
      }

      for (let i = 0; i < inputOrdinalsRange.length; i++){
        coinbase_inputs.push(inputOrdinalsRange[i]);
      }
    }

    // coinbase transaction 
    // handle if coinbase is null error
    let coinbase = block.coinbase();
    if (coinbase == null) {
      return;
    }

    for (let vout = 0; vout < coinbase.outs.length; vout++) {
      let output = coinbase.outs[vout];
      let ordinals: Array<ArrayBuffer> = [];
      let key = OutPoint.from(coinbase.txid(), <u32>vout).toBuffer();
      let remaining = output.value;

      while (remaining > 0) {
        if (coinbase_inputs.length == 0) {
          break;
        }
        let range = coinbase_inputs.shift();
        let count = range[1] - range[0];
        let assigned: Array<u64> = new Array();
        if (count > remaining) {
          let middle = range[0] + remaining;
          coinbase_inputs.unshift([middle, range[1]]);
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
      
      
      let numOrdinals = primitiveToBuffer<u32>(<u32>ordinals.length)
      ordinals.unshift(numOrdinals);
      let ords = concat(ordinals);
      set(Index.keyFor(OUTPOINT_TO_ORDINALS_RANGE, key), ords); 
    }
  }
}


export function _start(): void {
  const data = input();
  const box = Box.from(data);
  const height = parsePrimitive<u32>(box);
  const block = new Block(box);
  // Index.indexRanges(height, block);
  Index.indexBlock(height, block);
  _flush();
}

