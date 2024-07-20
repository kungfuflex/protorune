import { u128, u32, u64 } from "@magiceden-oss/runestone-lib/dist/src/integer";
import { Tag } from "./tag";
import { Some, Option } from "@magiceden-oss/runestone-lib/dist/src/monads";
import { RuneId } from "@magiceden-oss/runestone-lib/dist/src/runeid";
import { Edict } from "@magiceden-oss/runestone-lib/dist/src/edict";

export type ProtoBurn = {
  pointer: Option<u32>;
};

export type ProtoMessage = {
  calldata: u128[];
  pointer: Option<u32>;
  refundPointer: Option<u32>;
};

export class ProtoStone {
  burn?: ProtoBurn;
  message?: ProtoMessage;
  protocolTag: u128;

  edicts?: Edict[];

  constructor({
    burn,
    message,
    protocolTag,
    edicts,
  }: {
    protocolTag: bigint;
    burn?: { pointer: number };
    message?: {
      calldata: Buffer;

      pointer: number;
      refundPointer: number;
    };
    edicts?: Edict[];
  }) {
    this.protocolTag = u128(protocolTag);
    this.edicts = edicts;
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
  }

  // Enciphering a protostone doesn't make sense, removed this functionality

  // encipher() {
  //   const stack: (Buffer | number)[] = [];
  //   let payloads: Buffer[] = [];
  //   stack.push(OP_RETURN);
  //   if (this.burn) {
  //     payloads.push(
  //       Tag.encodeOptionInt(Tag.POINTER, this.burn.pointer.map(u128)),
  //     );
  //     payloads.push(
  //       Tag.encodeOptionInt(Tag.BURN, Some<u128>(this.protocolTag)),
  //     );
  //     stack.push(opcodes.OP_14);
  //   } else if (this.message) {
  //     payloads.push(u128.encodeVarInt(this.protocolTag));
  //     payloads.push(
  //       Tag.encodeOptionInt(Tag.POINTER, this.message.pointer.map(u128)),
  //     );
  //     payloads.push(
  //       Tag.encodeOptionInt(Tag.REFUND, this.message.refundPointer.map(u128)),
  //     );
  //     payloads.push(Tag.encode(Tag.MESSAGE, this.message.calldata));
  //     stack.push(opcodes.OP_16);
  //   } else if (this.split) {
  //     payloads.push(Tag.encode(Tag.SPLIT, this.split.order.map(u128)));
  //     stack.push(opcodes.OP_16);
  //   } else if (this.chunk) {
  //     payloads.push(this.chunk);
  //     stack.push(opcodes.OP_15);
  //   }
  //   const payload = Buffer.concat(payloads);
  //   for (let i = 0; i < payload.length; i += MAX_SCRIPT_ELEMENT_SIZE) {
  //     stack.push(payload.subarray(i, i + MAX_SCRIPT_ELEMENT_SIZE));
  //   }

  //   return script.compile(stack);
  // }

  encipher_payloads(): Buffer {
    let payloads: Buffer[] = [];

    if (this.burn) {
      payloads.push(
        Tag.encodeOptionInt(Tag.POINTER, this.burn.pointer.map(u128)),
      );
      payloads.push(
        Tag.encodeOptionInt(Tag.BURN, Some<u128>(this.protocolTag)),
      );
    } else if (this.message) {
      payloads.push(u128.encodeVarInt(this.protocolTag));
      payloads.push(
        Tag.encodeOptionInt(Tag.POINTER, this.message.pointer.map(u128)),
      );
      payloads.push(
        Tag.encodeOptionInt(Tag.REFUND, this.message.refundPointer.map(u128)),
      );
      payloads.push(Tag.encode(Tag.MESSAGE, this.message.calldata));
    }
    if (this.edicts) {
      payloads.push(u128.encodeVarInt(u128(Tag.BODY)));

      const edicts = [...this.edicts].sort((x, y) =>
        Number(x.id.block - y.id.block || x.id.tx - y.id.tx),
      );

      let previous = new RuneId(u64(0), u32(0));
      for (const edict of edicts) {
        const [block, tx] = previous.delta(edict.id).unwrap();

        payloads.push(u128.encodeVarInt(block));
        payloads.push(u128.encodeVarInt(tx));
        payloads.push(u128.encodeVarInt(edict.amount));
        payloads.push(u128.encodeVarInt(u128(edict.output)));
        previous = edict.id;
      }
    }

    // pushing the protocol_id and len first as per the spec
    const length_payload = Buffer.concat(payloads).length;
    payloads.unshift(
      u128.encodeVarInt(this.protocolTag),
      u128.encodeVarInt(u128(length_payload)),
    );
    return Buffer.concat(payloads);
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
