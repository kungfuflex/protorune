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

export type ProtoMesage = {};

export type ProtoSplit = {};

export type Chunk = {};

export class ProtoStone {
  burn?: ProtoBurn;

  constructor({
    burn,
  }: {
    burn?: { protocolTag: bigint; pointer: number };
    chunk?: {};
    message?: {};
    split?: {};
  }) {
    if (burn) {
      this.burn = {
        protocolTag: Some<u128>(u128(burn.protocolTag)),
        pointer: Some<u32>(u32(burn.pointer)),
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
}
