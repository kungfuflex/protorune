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
const HASH_TO_CHILDREN = String.UTF8.encode("/block/children");

const TRANSACTION_BY_ID = String.UTF8.encode("/tx/byid");
const OUTPOINT_TO_VALUE = String.UTF8.encode("/outpoint/tovalue");
const HEIGHT_TO_INSCRIPTION_ID = String.UTF8.encode("/inscription/byheight");
const SAT_RANGE_BY_OUTPOINT = String.UTF8.encode("/satrange/byoutpoint");
const OUTPOINT_TO_ORDINALS_RANGE = String.UTF8.encode("/ordinals/byoutpoint");

class Index {
  static keyFor(table: ArrayBuffer, key: ArrayBuffer): ArrayBuffer {
    return Box.concat([Box.from(table), Box.from(key)]);
  }

  static indexBlock(height: u32, block: Block): void {
    // index height to hash
    set(Index.keyFor(HEIGHT_TO_HASH, primitiveToBuffer<u32>(height)), block.blockhash());
    set(Index.keyFor(HASH_TO_HEIGHT, block.blockhash()), primitiveToBuffer<u32>(height));

    let child = block.header.prevBlock.toArrayBuffer();
    set(Index.keyFor(HASH_TO_CHILDREN, block.blockhash()), child);
  }

  static indexTransactions(): void {

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
  Index.indexRanges(height, block);
  Index.indexBlock(height, block);
  _flush();
}

