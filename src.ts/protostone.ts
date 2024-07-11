import {
  MAX_SCRIPT_ELEMENT_SIZE,
  OP_RETURN,
} from "@magiceden-oss/runestone-lib/dist/src/constants";
import { script, opcodes } from "@magiceden-oss/runestone-lib/dist/src/script";
import { u128, u32 } from "@magiceden-oss/runestone-lib/dist/src/integer";
import { Tag } from "./tag";
import { Some, Option } from "@magiceden-oss/runestone-lib/dist/src/monads";

export type ProtoBurn = {
  protocolTag: Option<u128>;
  pointer: Option<u32>;
};

export type ProtoMessage = {
  calldata: u128[];
  pointer: Option<u32>;
  refundPointer: Option<u32>;
  protocolTag: u128;
};

export type ProtoSplit = {};

export type Chunk = {};

export class ProtoStone {
  burn?: ProtoBurn;
  message?: ProtoMessage;
  split?: ProtoSplit;

  constructor({
    burn,
    message,
  }: {
    burn?: { protocolTag: bigint; pointer: number };
    message?: {
      calldata: Buffer;
      protocolTag: bigint;
      pointer: number;
      refundPointer: number;
    };
  }) {
    if (burn) {
      this.burn = {
        protocolTag: Some<u128>(u128(burn.protocolTag)),
        pointer: Some<u32>(u32(burn.pointer)),
      };
    }
    if (message) {
      const ary = Uint8Array.from(message.calldata);
      const res: u128[] = [];

      for (let i = 0; i < ary.byteLength; i += 8) {
        const last = i + 8;
        res.push(
          u128(
            BigInt(
              `0x${Buffer.from(ary.slice(i, last > ary.byteLength ? ary.byteLength : last)).toString("hex")}`,
            ),
          ),
        );
      }
      this.message = {
        calldata: res,
        protocolTag: u128(message.protocolTag),
        pointer: Some<u32>(u32(message.pointer)),
        refundPointer: Some<u32>(u32(message.refundPointer)),
      };
    }
  }

  encipher() {
    const stack: (Buffer | number)[] = [];
    let payloads: Buffer[] = [];
    stack.push(OP_RETURN);
    if (this.burn) {
      payloads.push(
        Tag.encodeOptionInt(Tag.POINTER, this.burn.pointer.map(u128)),
      );
      payloads.push(
        Tag.encodeOptionInt(Tag.BURN, this.burn.protocolTag.map(u128)),
      );
      stack.push(opcodes.OP_14);
    } else if (this.message) {
      payloads.push(u128.encodeVarInt(this.message.protocolTag));
      payloads.push(
        Tag.encodeOptionInt(Tag.POINTER, this.message.pointer.map(u128)),
      );
      payloads.push(
        Tag.encodeOptionInt(Tag.REFUND, this.message.refundPointer.map(u128)),
      );
      payloads.push(Tag.encode(Tag.MESSAGE, this.message.calldata));
      stack.push(opcodes.OP_16);
    }
    const payload = Buffer.concat(payloads);
    for (let i = 0; i < payload.length; i += MAX_SCRIPT_ELEMENT_SIZE) {
      stack.push(payload.subarray(i, i + MAX_SCRIPT_ELEMENT_SIZE));
    }

    return script.compile(stack);
  }

  static burn(burn: { protocolTag: bigint; pointer: number }): ProtoStone {
    return new ProtoStone({ burn });
  }

  static message(message: {
    calldata: Buffer;
    protocolTag: bigint;
    pointer: number;
    refundPointer: number;
  }): ProtoStone {
    return new ProtoStone({ message });
  }
}
