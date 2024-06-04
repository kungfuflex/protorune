import { IndexPointer } from "metashrew-as/assembly/indexer/tables";
import { Block } from "metashrew-as/assembly/blockdata/block";
import { RunesTransaction } from "./RunesTransaction";
import { console } from "metashrew-as/assembly/utils/logging";
import { encodeHexFromBuffer } from "metashrew-as/assembly/utils/hex";
import { HEIGHT_TO_TRANSACTION_IDS } from "./constants";

@final
export class RunesBlock extends Block {
  saveTransactions(height: u32): void {
    const ptr = HEIGHT_TO_TRANSACTION_IDS.selectValue<u32>(height);
    console.log(String.UTF8.decode(changetype<ArrayBuffer>(ptr)));
    for (let i: i32 = 0; i < this.transactions.length; i++) {
      ptr.append(this.getTransaction(i).txid());
      if (i == 0) {
        console.log(encodeHexFromBuffer(this.getTransaction(i).txid()));
      }
    }
  }
  @inline
  static from(block: Block): RunesBlock {
    return changetype<RunesBlock>(block);
  }
  @inline
  getTransaction(index: i32): RunesTransaction {
    return changetype<RunesTransaction>(this.transactions[index]);
  }
}
