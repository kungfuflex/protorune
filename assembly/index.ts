import { Box } from "metashrew-as/assembly/utils/box"
import { _flush, input, get, set } from "metashrew-as/assembly/indexer/index";
import { parsePrimitive } from "metashrew-as/assembly/utils/utils";
import { Block } from "metashrew-as/assembly/blockdata/block";
import { Transaction, Input, Output, OutPoint } from "metashrew-as/assembly/blockdata/transaction";
import { console } from "metashrew-as/assembly/utils/logging";
import { toRLP, RLPItem } from "metashrew-as/assembly/utils/rlp";
import { encodeHexFromBuffer, encodeHex } from "metashrew-as/assembly/utils/hex";
import { Inscription } from "metashrew-as/assembly/blockdata/inscription";

String.UTF8.encode("/inscription/bytxid/")

// - [ ] sat indexes
// - [ ] satpoint indexes
// - [ ] tx indexes
// - [ ] inscription indexes

class Index {
  
  static indexBlock(block: Block): void {
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
  Index.indexBlock(block);
  _flush();
}

/// View Functions:
export function blockcount(): void {

}
