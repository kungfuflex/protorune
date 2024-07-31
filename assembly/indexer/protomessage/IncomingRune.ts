import { AtomicTransaction } from "metashrew-as/assembly/indexer/atomic";
import { RuneId } from "metashrew-runes/assembly/indexer/RuneId";
import { u128 } from "as-bignum/assembly";
import { MessageContext } from "./MessageContext";
import { ProtoruneTable } from "../tables/protorune";
import { fromArrayBuffer, toArrayBuffer } from "metashrew-runes/assembly/utils";
import { console } from "metashrew-as/assembly/utils";
import { encodeHexFromBuffer } from "metashrew-as/assembly/utils/hex";

export class IncomingRune {
  runeId: RuneId;
  amount: u128;
  depositAmount: u128;
  initialAmount: u128;
  pointer_index: i32 = -1;
  refund_pointer_index: i32 = -1;
  outpoint_index: i32 = -1;
  runtime: AtomicTransaction = new AtomicTransaction();
  context: MessageContext = changetype<MessageContext>(0);
  table: ProtoruneTable;
  constructor(
    context: MessageContext,
    runeId: RuneId,
    amount: u128,
    table: ProtoruneTable,
  ) {
    this.context = context;
    this.runeId = runeId;
    this.initialAmount = amount;
    this.amount = new u128(amount.lo, amount.hi);
    this.depositAmount = new u128(0, 0);
    this.table = table;
  }

  refundAll(): bool {
    return (
      this.refund(this.initialAmount - this.amount) &&
      this.refundDeposit(this.depositAmount)
    );
  }
  refund(value: u128): bool {
    const refundPtr = this.table.OUTPOINT_TO_RUNES.select(
      this.context.refund_pointer.toArrayBuffer(),
    ).keyword("/balances");
    const ptr = this.table.OUTPOINT_TO_RUNES.select(
      this.context.pointer.toArrayBuffer(),
    ).keyword("/balances");
    if (this.pointer_index == -1) return false;
    const index = ptr.selectIndex(this.pointer_index).unwrap();
    const currentValue = fromArrayBuffer(this.context.runtime.get(index));
    if (value > currentValue || currentValue + value > this.initialAmount)
      return false;
    const newValue: u128 = currentValue - value;
    if (newValue > u128.Zero) {
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
  refundDeposit(value: u128): bool {
    if (this.refund_pointer_index == -1) return false;
    const refundPtr = this.table.OUTPOINT_TO_RUNES.select(
      this.context.refund_pointer.toArrayBuffer(),
    )
      .keyword("/balances")
      .selectIndex(this.refund_pointer_index);
    const runePtr = this.table.OUTPOINT_TO_RUNES.select(
      this.context.refund_pointer.toArrayBuffer(),
    )
      .keyword("/runes")
      .selectIndex(this.refund_pointer_index)
      .unwrap();
    const runeId = this.context.runtime.get(runePtr);
    const ptr = this.table.RUNTIME_BALANCE.select(runeId);
    const currentValue = this.context.runtime.has(ptr.unwrap())
      ? fromArrayBuffer(this.context.runtime.get(ptr.unwrap()))
      : u128.Zero;
    if (value > currentValue || currentValue + value > this.initialAmount)
      return false;
    const newValue: u128 = currentValue - value;
    if (newValue > u128.Zero) {
      this.context.runtime.set(ptr.unwrap(), toArrayBuffer(newValue));
    } else {
      this.context.runtime.set(ptr.unwrap(), new ArrayBuffer(0));
    }
    let toSet: ArrayBuffer;
    toSet = refundPtr.selectIndex(this.refund_pointer_index).unwrap();
    this.amount += value;
    this.depositAmount -= value;
    this.context.runtime.set(toSet, toArrayBuffer(value));
    return true;
  }
  forward(value: u128): bool {
    const refundPtr = this.table.OUTPOINT_TO_RUNES.select(
      this.context.refund_pointer.toArrayBuffer(),
    ).keyword("/balances");
    const ptr = this.table.OUTPOINT_TO_RUNES.select(
      this.context.pointer.toArrayBuffer(),
    ).keyword("/balances");
    if (this.refund_pointer_index == -1) return false;
    const index = refundPtr.selectIndex(this.refund_pointer_index).unwrap();
    const currentValue = fromArrayBuffer(this.context.runtime.get(index));
    if (value > this.amount || value > currentValue) return false;
    const newValue: u128 = currentValue - value;
    if (newValue > u128.Zero) {
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
  deposit(value: u128): bool {
    const refundPtr = this.table.OUTPOINT_TO_RUNES.select(
      this.context.refund_pointer.toArrayBuffer(),
    ).keyword("/balances");
    const runePtr = this.table.OUTPOINT_TO_RUNES.select(
      this.context.refund_pointer.toArrayBuffer(),
    ).keyword("/runes");
    if (this.refund_pointer_index == -1) return false;
    const index = refundPtr.selectIndex(this.refund_pointer_index).unwrap();
    const runeId = this.context.runtime.get(
      runePtr.selectIndex(this.refund_pointer_index).unwrap(),
    );
    const currentValue = fromArrayBuffer(this.context.runtime.get(index));
    if (value > this.amount || value > currentValue) return false;
    const newValue: u128 = currentValue - value;
    if (newValue > u128.Zero) {
      this.context.runtime.set(index, toArrayBuffer(newValue));
    } else {
      this.context.runtime.set(index, new ArrayBuffer(0));
    }
    let toSet = this.context.table.RUNTIME_BALANCE.select(runeId);
    const balance = this.context.runtime.has(toSet.unwrap())
      ? fromArrayBuffer(this.context.runtime.get(toSet.unwrap()))
      : fromArrayBuffer(toSet.get());
    this.context.runtime.set(toSet.unwrap(), toArrayBuffer(balance + value));
    this.amount = this.amount - value;
    this.depositAmount += value;
    return true;
  }
  depositAll(): bool {
    return this.deposit(this.amount);
  }
}
