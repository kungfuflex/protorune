import { IndexPointer } from "metashrew-as/assembly/indexer/tables";
import { Box } from "metashrew-as/assembly/utils/box";
import { u256, u128 } from "as-bignum/assembly";
import { fromArrayBuffer } from "../utils";
import { RuneId } from "./RuneId";

export class BalanceSheet {
  public runes: Array<ArrayBuffer>;
  public balances: Array<u128>;
  public index: Map<string, i32>;
  constructor() {
    this.index = new Map<string, i32>();
    this.balances = new Array<u128>(0);
    this.runes = new Array<ArrayBuffer>(0);
  }
  inspect(): string {
    let base = "runes: [\n";
    for (let i = 0; i < this.runes.length; i++) {
      base += "  " + RuneId.fromBytesU128(this.runes[i]).inspect() + "\n";
    }

    base += "]\nbalances: [\n";
    for (let i = 0; i < this.balances.length; i++)
      base += "  " + this.balances[i].toString() + "\n";
    base += "]";

    return base;
  }
  static fromPairs(
    runes: Array<ArrayBuffer>,
    balances: Array<u128>
  ): BalanceSheet {
    const balanceSheet = new BalanceSheet();
    for (let i = 0; i < runes.length; i++) {
      balanceSheet.set(runes[i], balances[i]);
    }
    return balanceSheet;
  }
  @inline
  getIndex(rune: ArrayBuffer): i32 {
    if (this.has(rune)) return this.index.get(changetype<string>(rune));
    return -1;
  }
  @inline
  has(rune: ArrayBuffer): boolean {
    return this.index.has(changetype<string>(rune));
  }
  get(rune: ArrayBuffer): u128 {
    const i = this.getIndex(rune);
    if (i !== -1) return this.balances[i];
    return u128.from(0);
  }
  set(rune: ArrayBuffer, v: u128): void {
    if (this.has(rune)) {
      const i = this.getIndex(rune);
      const record = this.balances[i];
      this.balances[i] = this.balances[i] + record;
    } else {
      this.index.set(changetype<string>(rune), this.runes.length);
      this.runes.push(rune);
      this.balances.push(v);
    }
  }
  increase(rune: ArrayBuffer, v: u128): void {
    let record = this.get(rune);
    this.set(rune, v + record);
  }
  decrease(rune: ArrayBuffer, v: u128): boolean {
    const record = this.get(rune);
    if (record < v) return false;
    this.set(rune, record - v);
    return true;
  }
  pipe(b: BalanceSheet): void {
    for (let i = 0; i < this.runes.length; i++) {
      b.increase(this.runes[i], this.balances[i]);
    }
  }
  static merge(a: BalanceSheet, b: BalanceSheet): BalanceSheet {
    const balanceSheet = new BalanceSheet();
    a.pipe(balanceSheet);
    b.pipe(balanceSheet);
    return balanceSheet;
  }
  static concat(ary: Array<BalanceSheet>): BalanceSheet {
    return ary.reduce<BalanceSheet>(
      (r: BalanceSheet, v: BalanceSheet, i: i32, ary: Array<BalanceSheet>) => {
        return BalanceSheet.merge(r, v);
      },
      new BalanceSheet()
    );
  }
  save(ptr: IndexPointer): void {
    const runesPtr = ptr.keyword("/runes");
    const balancesPtr = ptr.keyword("/balances");
    for (let i = 0; i < this.runes.length; i++) {
      if (this.balances[i] != u128.from(0)) {
        runesPtr.append(this.runes[i]);

        const buf = changetype<Uint8Array>(this.balances[i].toBytes()).buffer;
        balancesPtr.append(buf);
      }
    }
  }
  static load(ptr: IndexPointer): BalanceSheet {
    const runesPtr = ptr.keyword("/runes");
    const balancesPtr = ptr.keyword("/balances");
    const length = runesPtr.lengthKey().getValue<u32>();
    const result = new BalanceSheet();

    for (let i: u32 = 0; i < length; i++) {
      result.set(
        runesPtr.selectIndex(i).get(),
        fromArrayBuffer(balancesPtr.selectIndex(i).get())
      );
    }
    return result;
  }
}
