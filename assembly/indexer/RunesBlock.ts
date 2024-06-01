import { IndexPointer } from "metashrew-as/assembly/indexer/tables";
import { Block } from "metashrew-as/assembly/blockdata/block";
import { RunesTransaction } from "./RunesTransaction";

@final
export class RunesBlock extends Block {
  saveTransactions(index: IndexPointer): void {
    for (let i: i32 = 0; i < this.transactions.length; i++) {
      index.append(this.getTransaction(i).txid());
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
