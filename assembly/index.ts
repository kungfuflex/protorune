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

  static indexRanges(height: u32, block: Block): void {
    console.log(`Block ${height.toString(10)} with ${block.transactions.length.toString(10)} transactions`);
    let h = new Height(height);

    // declare coinbase inputs and set subsidy inputs
    let coinbase_inputs = new Array<Array<u64>>();

    if (h.subsidy() > 0) {
      let start: Sat = h.startingSat();
      coinbase_inputs.push([<u64>(start.n()), <u64>(start.n() + h.subsidy())]);
    }

    for (let tx_offset = 1; tx_offset < block.transactions.length; tx_offset++) {

      let tx = block.transactions[tx_offset];
      console.log("locktime" + tx.locktime.toString(10));
      let inputOrdinalsRange = new Array<Array<u64>>();

      console.log("Indexing transaction " + tx_offset.toString(10) + " : " + encodeHexFromBuffer(tx.txid()))
      // enumerate transaction inputs
      for (let i = 0; i < tx.ins.length; i++) {
        let input = tx.ins[i];
        // encode key from transaction outpoint
        let key: ArrayBuffer = input.previousOutput().toBuffer();
        console.log("\tINPUT -> TxOffset: " + tx_offset.toString(10) + " Input: " + i.toString(10) + " Previous Outpoint: " + encodeHexFromBuffer(key));

        let response = get(Index.keyFor(OUTPOINT_TO_ORDINALS_RANGE, key));
        let ordinalRanges = Box.from(response);
        let numOfOrdinals = parsePrimitive<u32>(ordinalRanges);
        console.log("spending ranges" + numOfOrdinals.toString(10));
        for ( let i = 0; i < <i32>numOfOrdinals; i++ ) {
          let start = parsePrimitive<u64>(ordinalRanges);
          let end = parsePrimitive<u64>(ordinalRanges);
          console.log("\t\tSats: " + start.toString(10) + " - " + end.toString(10));
          inputOrdinalsRange.push([start, end])
        }
      }

      // enumerate transaction outputs
      for (let i = 0; i < tx.outs.length; i++) {
        let ordinals: Array<ArrayBuffer> = [];
        let output = tx.outs[i];

        let key = OutPoint.from(tx.txid(), i).toBuffer();
        console.log("\tOUTPUT -> TxOffset: " + tx_offset.toString(10) + " Output: " + i.toString(10) + " Outpoint: " + encodeHexFromBuffer(key));
        
        let remaining = output.value;
        while (remaining > 0) {
          if (inputOrdinalsRange.length == 0) {
            console.log("Found transaction with outputs but no inputs");
            break;
          } else {
            console.log("Found transaction with outputs and inputs");
          }
          let range = inputOrdinalsRange.shift();

          let count = range[1] - range[0];
          console.log("count: " + count.toString(10));


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

      // extend coinbase output with fees
      for (let i = 0; i < inputOrdinalsRange.length; i++){
        coinbase_inputs.push(inputOrdinalsRange[i]);
      }
    }

    // index ordinals range of coinbase transactions
    let coinbase = block.coinbase();

    if (coinbase == null) {
      return;
    }
    else {
    }


    for (let vout = 0; vout < coinbase.outs.length; vout++) {
      let output = coinbase.outs[vout];
      let ordinals: Array<ArrayBuffer> = [];

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

      let key = OutPoint.from(coinbase.txid(), <u32>vout).toBuffer();
      console.log("\tCoinbase Transaction: " + encodeHexFromBuffer(key));

      set(Index.keyFor(OUTPOINT_TO_ORDINALS_RANGE, key), ords); 
      // test
      // let data = get(Index.keyFor(OUTPOINT_TO_ORDINALS_RANGE, key));
      // let ordBox = Box.from(data)
      // let numOfOrdinals = parsePrimitive<u32>(ordBox);
      // for ( let i = 0; i < <i32>numOfOrdinals; i++ ) {
      //   let start = parsePrimitive<u64>(ordBox);
      //   let end = parsePrimitive<u64>(ordBox);
      //   console.log(start.toString(10) + " - " + end.toString(10));
      // }

    }
    
  }
  
}


export function _start(): void {
  const data = input();
  const box = Box.from(data);
  const height = parsePrimitive<u32>(box);
  const block = new Block(box);
  Index.indexRanges(height, block);
  _flush();
}

