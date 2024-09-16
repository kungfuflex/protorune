import { AtomicTransaction } from "metashrew-as/assembly/indexer/atomic";
import { RuneId } from "metashrew-runes/assembly/indexer/RuneId";
import { u128 } from "as-bignum/assembly";
import { MessageContext } from "./MessageContext";
import { ProtoruneTable } from "../tables/protorune";
import { fromArrayBuffer, toArrayBuffer } from "metashrew-runes/assembly/utils";
import { console } from "metashrew-as/assembly/utils";
import { encodeHexFromBuffer } from "metashrew-as/assembly/utils/hex";
import { logArrayBuffer } from "../../utils";

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
  /**
   * Refunds an amount from the pointer. If nothing has been forwarded,
   * (ie this context pointer balance is 0), then returns false
   * @param value amount to refund
   * @returns true if refund value successful, false if not refunded
   */
  refund(value: u128): bool {
    const refundPtr = this.table.OUTPOINT_TO_RUNES.select(
      this.context.refund_pointer.toArrayBuffer(),
    ).keyword("/balances");
    const ptr = this.table.OUTPOINT_TO_RUNES.select(
      this.context.pointer.toArrayBuffer(),
    ).keyword("/balances");
    console.log(this.pointer_index.toString());
    if (this.pointer_index == -1) return false;
    const pointerIndex = ptr.selectIndex(this.pointer_index).unwrap();
    const currentValue = fromArrayBuffer(
      this.context.runtime.get(pointerIndex),
    );

    console.log(currentValue.toString() + " vs " + value.toString());
    if (
      value > currentValue ||
      currentValue + value > this.initialAmount - this.depositAmount
    )
      return false;
    const newValue: u128 = currentValue - value;
    if (newValue > u128.Zero) {
      this.context.runtime.set(pointerIndex, toArrayBuffer(newValue));
    } else {
      this.context.runtime.set(pointerIndex, new ArrayBuffer(0));
    }
    let toSet: ArrayBuffer;
    toSet = refundPtr.selectIndex(this.refund_pointer_index).unwrap();
    this.amount += value;
    this.context.runtime.set(toSet, toArrayBuffer(this.amount));
    console.log(value.toString());
    return true;
  }
  /**
   * Refunds an amount from the RUNTIME Balance. If nothing has been deposited,
   * (ie this RUNTIME is 0), then returns false
   * @param value amount to refund
   * @returns true if refund value successful, false if not refunded
   */
  refundDeposit(value: u128): bool {
    if (this.refund_pointer_index == -1) return false;
    const refundPtr = this.table.OUTPOINT_TO_RUNES.select(
      this.context.refund_pointer.toArrayBuffer(),
    ).keyword("/balances");
    const runePtr = this.table.OUTPOINT_TO_RUNES.select(
      this.context.refund_pointer.toArrayBuffer(),
    )
      .keyword("/runes")
      .selectIndex(this.refund_pointer_index)
      .unwrap();
    const runeId = this.context.runtime.get(runePtr);
    const currentValue = this.context.runtimeBalance.get(runeId);
    if (value > currentValue) return false;
    this.context.runtimeBalance.decrease(runeId, value);
    let toSet: ArrayBuffer;
    toSet = refundPtr.selectIndex(this.refund_pointer_index).unwrap();
    this.amount += value;
    this.depositAmount -= value;
    this.context.runtime.set(toSet, toArrayBuffer(this.amount));
    return true;
  }
  forward(value: u128): bool {
    const refundPtr = this.table.OUTPOINT_TO_RUNES.select(
      this.context.refund_pointer.toArrayBuffer(),
    ).keyword("/balances");
    const refundRunesPtr = this.table.OUTPOINT_TO_RUNES.select(
      this.context.refund_pointer.toArrayBuffer(),
    ).keyword("/runes");
    const ptr = this.table.OUTPOINT_TO_RUNES.select(
      this.context.pointer.toArrayBuffer(),
    ).keyword("/balances");
    const runePtr = this.table.OUTPOINT_TO_RUNES.select(
      this.context.pointer.toArrayBuffer(),
    ).keyword("/runes");
    if (this.refund_pointer_index == -1) return false;
    const refundIndex = refundPtr
      .selectIndex(this.refund_pointer_index)
      .unwrap();
    const runeName = this.context.runtime.get(
      refundRunesPtr.selectIndex(this.refund_pointer_index).unwrap(),
    );
    const currentValue = fromArrayBuffer(this.context.runtime.get(refundIndex));
    if (value > this.amount || value > currentValue) return false;
    const newValue: u128 = currentValue - value;
    if (newValue > u128.Zero) {
      this.context.runtime.set(refundIndex, toArrayBuffer(newValue));
    } else {
      this.context.runtime.set(refundIndex, new ArrayBuffer(0));
    }
    let toSet: ArrayBuffer;
    if (this.pointer_index == -1) {
      this.pointer_index = ptr.length();
      toSet = this.context.runtime.extendIndexPointerList(ptr);
      this.context.runtime.set(
        this.context.runtime.extendIndexPointerList(runePtr),
        runeName,
      );
    } else {
      toSet = ptr.selectIndex(this.pointer_index).unwrap();
    }
    this.context.runtime.set(toSet, toArrayBuffer(value));
    this.amount = this.amount - value;
    console.log(value.toString());
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
    const refundIndex = refundPtr
      .selectIndex(this.refund_pointer_index)
      .unwrap();
    const runeId = this.context.runtime.get(
      runePtr.selectIndex(this.refund_pointer_index).unwrap(),
    );
    const currentValue = fromArrayBuffer(this.context.runtime.get(refundIndex));
    if (value > this.amount || value > currentValue) return false;
    const newValue: u128 = currentValue - value;
    if (newValue > u128.Zero) {
      this.context.runtime.set(refundIndex, toArrayBuffer(newValue));
    } else {
      this.context.runtime.set(refundIndex, new ArrayBuffer(0));
    }
    this.context.runtimeBalance.increase(runeId, value);
    this.amount = this.amount - value;
    this.depositAmount += value;
    return true;
  }
  depositAll(): bool {
    return this.deposit(this.amount);
  }
}
