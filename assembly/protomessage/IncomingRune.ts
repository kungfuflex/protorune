import { RuneId } from "../indexer/RuneId";
import { u128 } from "as-bignum/assembly";

export class IncomingRune {
  runeId: RuneId;
  amount: u128;
  constructor(runeId: RuneId, amount_lo: u64, amount_hi: u64) {
    this.runeId = runeId;
    this.amount = new u128(amount_lo, amount_hi);
  }

  refundAll(): void {}
  refund(value: u128): void {}
  forward(value: u128): void {}
  forwardAll(): void {}
  deposit(value: u128): void {}
  depositAll(): void {}
}
