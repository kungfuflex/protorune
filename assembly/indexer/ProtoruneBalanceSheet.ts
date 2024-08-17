import { IndexPointer } from "metashrew-as/assembly/indexer/tables";
import { AtomicTransaction } from "metashrew-as/assembly/indexer/atomic";
import { u128 } from "as-bignum/assembly";
import { fromArrayBuffer } from "metashrew-runes/assembly/utils";
import { RuneId } from "metashrew-runes/assembly/indexer/RuneId";
import { BalanceSheet } from "metashrew-runes/assembly/indexer/BalanceSheet";
import { console } from "metashrew-as/assembly/utils";
import { encodeHexFromBuffer } from "metashrew-as/assembly/utils/hex";

export class ProtoruneBalanceSheet extends BalanceSheet {
  static fromPairs(
    runes: Array<ArrayBuffer>,
    balances: Array<u128>,
  ): ProtoruneBalanceSheet {
    return ProtoruneBalanceSheet.from(BalanceSheet.fromPairs(runes, balances));
  }
  static merge(
    a: ProtoruneBalanceSheet,
    b: ProtoruneBalanceSheet,
  ): ProtoruneBalanceSheet {
    return ProtoruneBalanceSheet.from(
      BalanceSheet.merge(
        changetype<BalanceSheet>(a),
        changetype<BalanceSheet>(b),
      ),
    );
  }
  static concat(ary: Array<ProtoruneBalanceSheet>): ProtoruneBalanceSheet {
    return ProtoruneBalanceSheet.from(
      BalanceSheet.concat(
        ary.map<BalanceSheet>(
          (
            v: ProtoruneBalanceSheet,
            i: i32,
            ary: Array<ProtoruneBalanceSheet>,
          ) => changetype<BalanceSheet>(v),
        ),
      ),
    );
  }
  saveToAtomicTx(ptr: IndexPointer, tx: AtomicTransaction): void {
    const runesPtr = ptr.keyword("/runes");
    const balancesPtr = ptr.keyword("/balances");

    for (let i = 0; i < this.runes.length; i++) {
      tx.appendIndexPointerList(runesPtr, this.runes[i]);

      const buf = changetype<Uint8Array>(this.balances[i].toBytes()).buffer;
      tx.appendIndexPointerList(balancesPtr, buf);
    }
  }

  static loadFromAtomicTx(
    ptr: IndexPointer,
    tx: AtomicTransaction,
    inspect: bool = false,
  ): ProtoruneBalanceSheet {
    const runesPtr = ptr.keyword("/runes");
    const balancesPtr = ptr.keyword("/balances");

    const length = tx.getValue<u32>(runesPtr.lengthKey().unwrap());
    const result = new ProtoruneBalanceSheet();

    for (let i: u32 = 0; i < length; i++) {
      result.set(
        tx.get(runesPtr.selectIndex(i).unwrap()),
        fromArrayBuffer(tx.get(balancesPtr.selectIndex(i).unwrap())),
      );
    }
    return result;
  }

  clearAndSave(ptr: IndexPointer): void {
    const runesPtr = ptr.keyword("/runes").lengthKey();
    const balancesPtr = ptr.keyword("/balances").lengthKey();

    runesPtr.setValue<u32>(0);
    balancesPtr.setValue<u32>(0);
    this.save(ptr);
  }

  save(ptr: IndexPointer, isCenotaph: bool = false): void {
    const runesPtr = ptr.keyword("/runes");
    const balancesPtr = ptr.keyword("/balances");

    for (let i = 0; i < this.runes.length; i++) {
      if (this.balances[i] != u128.Zero && !isCenotaph) {
        runesPtr.append(this.runes[i]);

        const buf = changetype<Uint8Array>(this.balances[i].toBytes()).buffer;
        balancesPtr.append(buf);
      }
    }
  }
  saveIndex(i: u32, ptr: IndexPointer, isCenotaph: bool = false): void {
    const runesPtr = ptr.keyword("/runes");
    const balancesPtr = ptr.keyword("/balances");

    if (this.balances[i] != u128.Zero && !isCenotaph) {
      runesPtr.append(this.runes[i]);

      const buf = changetype<Uint8Array>(this.balances[i].toBytes()).buffer;
      balancesPtr.append(buf);
    }
  }
  static load(ptr: IndexPointer): ProtoruneBalanceSheet {
    return ProtoruneBalanceSheet.from(BalanceSheet.load(ptr));
  }
  static from(v: BalanceSheet): ProtoruneBalanceSheet {
    return changetype<ProtoruneBalanceSheet>(v);
  }
}
