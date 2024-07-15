import {
  MAX_SCRIPT_ELEMENT_SIZE,
  OP_RETURN,
} from "@magiceden-oss/runestone-lib/dist/src/constants";
import { script, opcodes } from "@magiceden-oss/runestone-lib/dist/src/script";
import { u128, u32 } from "@magiceden-oss/runestone-lib/dist/src/integer";
import { Tag } from "./tag";
import { Some, Option } from "@magiceden-oss/runestone-lib/dist/src/monads";
import { chunk } from "lodash";
import clone from "clone";

export type ProtoBurn = {
  pointer: Option<u32>;
};

export type ProtoMessage = {
  calldata: u128[];
  pointer: Option<u32>;
  refundPointer: Option<u32>;
};

export type ProtoSplit = {
  order: u32[];
};

export type Chunk = Buffer;

export type SplitResult = {
  protostone: ProtoStone;
  chunks: ProtoStone[];
};

export function protosplit(input: ProtoStone, voutStart: number): SplitResult {
  const chunks = chunk(Array.from(Buffer.concat(input.message.calldata.map((v) => u128.encodeVarInt(v)))), 79).map((v) => ProtoStone.chunk(Buffer.from(v)));
  const protostone = clone(input);
  protostone.split = {
    order: Array(chunks.length).fill(0).map((_, i) => u32(i + voutStart))
  };
  protostone.message.calldata = [];
  return {
    protostone,
    chunks
  };
}

export class ProtoStone {
  burn?: ProtoBurn;
  message?: ProtoMessage;
  split?: ProtoSplit;
  chunk?: Chunk;
  protocolTag: u128;

  constructor({
    burn,
    message,
    protocolTag,
    split,
    chunk,
  }: {
    protocolTag: bigint;
    burn?: { pointer: number };
    message?: {
      calldata: Buffer;

      pointer: number;
      refundPointer: number;
    };
    split?: {
      order: number[];
    };
    chunk?: Buffer;
  }) {
    this.protocolTag = u128(protocolTag);
    if (burn) {
      this.burn = {
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
        pointer: Some<u32>(u32(message.pointer)),
        refundPointer: Some<u32>(u32(message.refundPointer)),
      };
    }
    if (split) {
      this.split = {
        order: split.order.map(u32),
      };
    }
    if (chunk) {
      this.chunk = chunk;
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
        Tag.encodeOptionInt(Tag.BURN, Some<u128>(this.protocolTag)),
      );
      stack.push(opcodes.OP_14);
    } else if (this.message) {
      payloads.push(u128.encodeVarInt(this.protocolTag));
      payloads.push(
        Tag.encodeOptionInt(Tag.POINTER, this.message.pointer.map(u128)),
      );
      payloads.push(
        Tag.encodeOptionInt(Tag.REFUND, this.message.refundPointer.map(u128)),
      );
      payloads.push(Tag.encode(Tag.MESSAGE, this.message.calldata));
      stack.push(opcodes.OP_16);
    } else if (this.split) {
      payloads.push(Tag.encode(Tag.SPLIT, this.split.order.map(u128)));
      stack.push(opcodes.OP_16);
    } else if (this.chunk) {
      payloads.push(this.chunk);
      stack.push(opcodes.OP_15);
    }
    const payload = Buffer.concat(payloads);
    for (let i = 0; i < payload.length; i += MAX_SCRIPT_ELEMENT_SIZE) {
      stack.push(payload.subarray(i, i + MAX_SCRIPT_ELEMENT_SIZE));
    }

    return script.compile(stack);
  }

  static burn({
    protocolTag,
    ...burn
  }: {
    protocolTag: bigint;
    pointer: number;
  }): ProtoStone {
    return new ProtoStone({ burn, protocolTag });
  }

  static split({
    protocolTag,
    ...split
  }: {
    protocolTag: bigint;
    order: number[];
  }): ProtoStone {
    return new ProtoStone({ split, protocolTag });
  }
  protosplit(voutStart: number): ReturnType<typeof protosplit> {
    return protosplit(this, voutStart);
  }

  static chunk(chunk: Buffer): ProtoStone {
    return new ProtoStone({ protocolTag: BigInt(0), chunk });
  }

  static message({
    protocolTag,
    ...message
  }: {
    calldata: Buffer;
    protocolTag: bigint;
    pointer: number;
    refundPointer: number;
  }): ProtoStone {
    return new ProtoStone({ message, protocolTag });
  }
}
