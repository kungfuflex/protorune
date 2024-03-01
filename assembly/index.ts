import { Box } from "metashrew-as/assembly/utils/box"
import { _flush, input, get, set } from "metashrew-as/assembly/indexer/index";
import { parsePrimitive } from "metashrew-as/assembly/utils/utils";
import { Block } from "metashrew-as/assembly/blockdata/block";
import { Transaction, Input, Output, OutPoint } from "metashrew-as/assembly/blockdata/transaction";
import { console } from "metashrew-as/assembly/utils/logging";
import { toRLP, RLPItem } from "metashrew-as/assembly/utils/rlp";
import { encodeHexFromBuffer, encodeHex } from "metashrew-as/assembly/utils/hex";
import { Inscription } from "metashrew-as/assembly/blockdata/inscription";

const HEIGHT_TO_BLOCK_HEADER = String.UTF8.encode("/block/byheight");
const TRANSACTION_BY_ID = String.UTF8.encode("/tx/byid");
const OUTPOINT_TO_VALUE = String.UTF8.encode("/outpoint/tovalue");
const HEIGHT_TO_INSCRIPTION_ID = String.UTF8.encode("/inscription/byheight");

// - [ ] sat indexes
// - [ ] satpoint indexes
// - [ ] tx indexes
// - [ ] inscription indexes
// - [x] index block header by height
// - [x] index transaction by transaction id
// - [ ] index inscription by height

class Index {
  static keyFor(table: ArrayBuffer, key: ArrayBuffer): ArrayBuffer {
    return Box.concat([Box.from(table), Box.from(key)]);
  }

  static indexTransaction(tx: Transaction): void {
      // index transaction by transaction id
      set(Index.keyFor(TRANSACTION_BY_ID, block.transactions[i].txid()), block.transactions[i].bytes.toArrayBuffer());

      // index transaction outputs
      tx.outs.forEach((output: Output, tx_offset) => {

      })
  }
  
  static indexBlock(block: Block, height: u32): void {
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
  Index.indexBlock(block, height);
  _flush();
}

/// View Functions:
export function blockcount(): void {

}
