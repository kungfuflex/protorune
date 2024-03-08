import { Box, RCBox } from "metashrew-as/assembly/utils/box"
import { _flush, input, get, set } from "metashrew-as/assembly/indexer/index";
import { parsePrimitive } from "metashrew-as/assembly/utils/utils";
import { Block } from "metashrew-as/assembly/blockdata/block";
import { Transaction, Input, Output, OutPoint } from "metashrew-as/assembly/blockdata/transaction";
import { console } from "metashrew-as/assembly/utils/logging";
import { toRLP, RLPItem } from "metashrew-as/assembly/utils/rlp";
import { encodeHexFromBuffer, encodeHex } from "metashrew-as/assembly/utils/hex";
import { Inscription } from "metashrew-as/assembly/blockdata/inscription";
import { subsidy } from "metashrew-as/assembly/utils/ordinals";
import { Height } from "metashrew-as/assembly/blockdata/height";
import { Sat } from "metashrew-as/assembly/blockdata/sat";

const HEIGHT_TO_BLOCK_HEADER = String.UTF8.encode("/block/byheight");
const TRANSACTION_BY_ID = String.UTF8.encode("/tx/byid");
const OUTPOINT_TO_VALUE = String.UTF8.encode("/outpoint/tovalue");
const HEIGHT_TO_INSCRIPTION_ID = String.UTF8.encode("/inscription/byheight");
const SAT_RANGE_BY_OUTPOINT = String.UTF8.encode("/satrange/byoutpoint");
const OUTPOINT_TO_ORDINALS_RANGE = String.UTF8.encode("/ordinals/byoutpoint");

class Index {
  static keyFor(table: ArrayBuffer, key: ArrayBuffer): ArrayBuffer {
    return Box.concat([Box.from(table), Box.from(key)]);
  }

  static getOrdinalsRanges(key: ArrayBuffer): Box {
    return Box.from(get(Index.keyFor(SAT_RANGE_BY_OUTPOINT, key)));
  }


  static indexRanges(height: u32, block: Block): void {
    console.log(`Block ${height.toString(10)} with ${block.transactions.length.toString(10)} transactions`);
    let h = new Height(height);

    // declare coinbase inputs and set subsidy inputs
    let coinbase_inputs = new Array<Array<u64>>();

    if (h.subsidy() > 0) {
      let start: Sat = h.startingSat();
      coinbase_inputs.push([<u64>(start.n()), <u64>(start.n() + h.subsidy())]);
      console.log("coinbase input " );
    }

    for (let tx_offset = 1; tx_offset < block.transactions.length; tx_offset++) {
      console.log(`Indexing transaction ${tx_offset.toString(10)}`);
      let tx = block.transactions[tx_offset];

      let inputOrdinalsRange = new Array<Array<u64>>();

      // enumerate transaction inputs
      for (let i = 0; i < tx.ins.length; i++) {
        let input = tx.ins[i];
        // encode key from transaction outpoint
        let key: ArrayBuffer = input.previousOutput().toBuffer();

        let response = Box.from(get(Index.keyFor(SAT_RANGE_BY_OUTPOINT, key)));
        if (!response.isEmpty()) {
          let start = parsePrimitive<u64>(response);
          let end = parsePrimitive<u64>(response);
          inputOrdinalsRange.push([start, end])
        }
      }

      // for (let vout = 0; vout < tx.outs.length; vout++) {
      //   let remaining = tx.outs[vout].value;
      //
      //   while (remaining > 0) {
      //     if (inputOrdinalsRange.length == 0) {
      //       break;
      //     }
      //
      //     let range = inputOrdinalsRange.shift();
      //
      //   }
      // }

    }

    // index ordinals range of coinbase transactions
    let coinbase = block.coinbase();

    if (coinbase == null) {
      console.log("Error: Coinbase Transaction is Null")
      return;
    }
    else {
      console.log("Coinbase Transaction is not null");
    }

    for (let vout = 0; vout < coinbase.outs.length; vout++) {
      let output = coinbase.outs[vout];
      let ordinals: Array<ArrayBuffer> = [];

      let remaining = output.value;

      while (remaining > 0) {
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

        // store ordinals ranges
        let r1 = new ArrayBuffer(4);
        let r2 = new ArrayBuffer(4);
        store<u64>(changetype<usize>(r1), assigned[0]);
        store<u64>(changetype<usize>(r2), assigned[1]);
        ordinals.push(r1);
        ordinals.push(r2);

        remaining -= assigned[1] - assigned[0];
      }
      
      for (let i = 0; i < ordinals.length; i++) {
        let val = parsePrimitive<u64>(Box.from(ordinals[i]));
        console.log("value: " + val.toString(10))
      }

    }
    
  }
  
  static indexBlock(block: Block, height: u32): void {
    console.log(`indexing block ${height.toString(10)}`);
    // index block header by height
    set(Index.keyFor(HEIGHT_TO_BLOCK_HEADER, String.UTF8.encode(height.toString())), block.header.bytes.toArrayBuffer());

    for (let i = 0; i < block.transactions.length; i++) {

      for (let k = 0; k < block.transactions[i].ins.length; k++) {
        let _input = block.transactions[i].ins[k];
        let outpoint = _input.previousOutput();
        if ( outpoint.isNull() ) {
          continue;
        } 

        let inscription = _input.inscription()
        if (inscription == null) {
          continue;
        }

        console.log("contains inscription");

      }
    }
  }
}


export function _start(): void {
  const data = input();
  const box = Box.from(data);
  const height = parsePrimitive<u32>(box);
  const block = new Block(box);
  // console.log("got block " + height.toString(10));
  Index.indexRanges(height, block);
  _flush();
}

/// View Functions:
export function blockcount(): void {

}
