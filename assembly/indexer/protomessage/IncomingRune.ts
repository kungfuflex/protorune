import { AtomicTransaction } from "metashrew-as/assembly/indexer/atomic";
import { RuneId } from "../indexer/RuneId";
import { u128 } from "as-bignum/assembly";
import { MessageContext } from "./MessageContext";
import { OUTPOINT_TO_RUNES } from "../indexer/constants/protorune";
import { fromArrayBuffer, toArrayBuffer } from "../utils";

export class IncomingRune {
  runeId: RuneId;
  amount: u128;
  initialAmount: u128;
  pointer_index: i32 = -1;
  refund_pointer_index: i32 = -1;
  runtime: AtomicTransaction = new AtomicTransaction();
  context: MessageContext = changetype<MessageContext>(0);
  constructor(context: MessageContext, runeId: RuneId, amount: u128) {
    this.context = context;
    this.runeId = runeId;
    this.initialAmount = amount;
    this.amount = new u128(amount.lo, amount.hi);
  }

  refundAll(): bool {
    return this.refund(this.initialAmount - this.amount);
  }
  refund(value: u128): bool {
    const refundPtr = OUTPOINT_TO_RUNES.select(
      this.context.refund_pointer.toArrayBuffer(),
    ).keyword("/balances");
    const ptr = OUTPOINT_TO_RUNES.select(
      this.context.pointer.toArrayBuffer(),
    ).keyword("/balances");
    if (this.pointer_index == -1) return false;
    const index = ptr.selectIndex(this.pointer_index).unwrap();
    const currentValue = fromArrayBuffer(this.context.runtime.get(index));
    if (value > currentValue || currentValue + value > this.initialAmount)
      return false;
    const newValue: u128 = currentValue - value;
    if (newValue > 0) {
      this.context.runtime.set(index, toArrayBuffer(newValue));
    } else {
      this.context.runtime.set(index, new ArrayBuffer(0));
    }
    let toSet: ArrayBuffer;
    toSet = refundPtr.selectIndex(this.refund_pointer_index).unwrap();
    this.amount += value;
    this.context.runtime.set(toSet, toArrayBuffer(value));
    return true;
  }
  forward(value: u128): bool {
    const refundPtr = OUTPOINT_TO_RUNES.select(
      this.context.refund_pointer.toArrayBuffer(),
    ).keyword("/balances");
    const ptr = OUTPOINT_TO_RUNES.select(
      this.context.pointer.toArrayBuffer(),
    ).keyword("/balances");
    if (this.refund_pointer_index == -1) return false;
    const index = refundPtr.selectIndex(this.refund_pointer_index).unwrap();
    const currentValue = fromArrayBuffer(this.context.runtime.get(index));
    if (value > this.amount || value > currentValue) return false;
    const newValue: u128 = currentValue - value;
    if (newValue > 0) {
      this.context.runtime.set(index, toArrayBuffer(newValue));
    } else {
      this.context.runtime.set(index, new ArrayBuffer(0));
    }
    let toSet: ArrayBuffer;
    if (this.pointer_index == -1) {
      this.pointer_index = ptr.length();
      toSet = this.context.runtime.extendIndexPointerList(ptr);
    } else {
      toSet = ptr.selectIndex(this.pointer_index).unwrap();
    }
    this.context.runtime.set(toSet, toArrayBuffer(value));
    this.amount = this.amount - value;
    return true;
  }
  forwardAll(): void {
    this.forward(this.amount);
  }
  deposit(value: u128): void {}
  depositAll(): void {}
}
