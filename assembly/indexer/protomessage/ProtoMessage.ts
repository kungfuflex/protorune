import { Block } from "metashrew-as/assembly/blockdata";
import { RunesTransaction } from "../RunesTransaction";
import { MessageContext } from "./MessageContext";
import { BalanceSheet } from "../BalanceSheet";
import { ProtoStone } from "../ProtoStone";
import { Field } from "../fields/ProtoruneField";
import { fieldTo, fieldToArrayBuffer } from "../../utils";

export class ProtoMessage {
  outpoint: u32;
  sheets: Map<u32, BalanceSheet>;
  calldata: ArrayBuffer;
  pointer: u32;
  refund_pointer: u32;
  constructor(
    outpoint: u32,
    sheets: Map<u32, BalanceSheet>,
    pointer: u32,
    refund_pointer: u32,
    calldata: ArrayBuffer,
  ) {
    this.outpoint = outpoint;
    this.sheets = sheets;
    this.pointer = pointer;
    this.refund_pointer = refund_pointer;
    this.calldata = calldata;
  }
  handle<T extends MessageContext>(
    tx: RunesTransaction,
    block: Block,
    height: u64,
    i: u32,
  ): void {
    const context = new MessageContext(
      tx,
      block,
      height,
      i,
      this.sheets,
      this.pointer,
      this.refund_pointer,
      this.calldata,
    );

    changetype<T>(context).run();
  }
  static from(
    protostone: ProtoStone,
    outpoint: u32,
    sheets: Map<u32, BalanceSheet>,
  ): ProtoMessage {
    if (
      !protostone.fields.has(Field.MESSAGE) ||
      !protostone.fields.has(Field.POINTER) ||
      !protostone.fields.has(Field.REFUND)
    )
      return changetype<ProtoMessage>(0);

    let calldata: ArrayBuffer = fieldToArrayBuffer(
      protostone.fields.get(Field.MESSAGE),
    );
    return new ProtoMessage(
      outpoint,
      sheets,
      fieldTo<u32>(protostone.fields.get(Field.POINTER)),
      fieldTo<u32>(protostone.fields.get(Field.REFUND)),
      calldata,
    );
  }
}
