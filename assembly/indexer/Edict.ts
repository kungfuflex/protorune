import { u128 } from "as-bignum/assembly";
import { fromU128Pair } from "../utils";
import { RuneId } from "./RuneId";

export class Edict {
  public block: u128;
  public transactionIndex: u128;
  public amount: u128;
  public output: u128;
  constructor(block: u128, transactionIndex: u128, amount: u128, output: u128) {
    this.block = block;
    this.transactionIndex = transactionIndex;
    this.amount = amount;
    this.output = output;
  }
  runeId(): RuneId {
    return new RuneId(this.block.lo, <u32>this.transactionIndex.lo);
  }
  static zero(): Edict {
    return new Edict(u128.from(0), u128.from(0), u128.from(0), u128.from(0));
  }
  static diff(previous: Edict, values: StaticArray<u128>): Edict {
    return new Edict(
      previous.block + values[0],
      values[0].isZero() ? values[1] : previous.transactionIndex + values[1],
      values[2],
      values[3],
    );
  }
  static fromDeltaSeries(deltas: Array<StaticArray<u128>>): Array<Edict> {
    let last = Edict.zero();
    const result = new Array<Edict>(0);
    deltas.sort((a: StaticArray<u128>, b: StaticArray<u128>): i32 => {
      const left = fromU128Pair(a[0], a[1]);
      const right = fromU128Pair(b[0], b[1]);
      if (left < right) return -1;
      else if (left == right) return 0;
      else return 1;
    });
    for (let i: i32 = 0; i < deltas.length; i++) {
      last = Edict.diff(last, deltas[i]);
      result.push(last);
    }
    return result;
  }
  toString(): string {
    return (
      "Edict {\n" +
      "   runeId: " +
      this.runeId().inspect() +
      ",\n  amount: " +
      this.amount.toString() +
      ",\n  output: " +
      this.output.toString() +
      "\n}"
    );
  }
}
