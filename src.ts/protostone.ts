import { u128, u32, u64 } from "@magiceden-oss/runestone-lib/dist/src/integer";
import { Tag } from "./tag";
import { Some, Option } from "@magiceden-oss/runestone-lib/dist/src/monads";
import { RuneId } from "@magiceden-oss/runestone-lib/dist/src/runeid";
import { Edict } from "@magiceden-oss/runestone-lib/dist/src/edict";
import leb128 from "leb128";

export type ProtoBurn = {
  pointer: Option<u32>;
  from?: Array<u32>;
};

export type ProtoMessage = {
  calldata: u128[];
  pointer: Option<u32>;
  refundPointer: Option<u32>;
};

export const padLeft = (s) => (s.length % 2 === 1 ? "0" + s : s);

export const toBuffer = (n) => Buffer.from(padLeft(n.toString(16)), "hex");

export function readULEB128(v) {
  const decoded = leb128.unsigned.decode(v);
  const { length } = leb128.unsigned.encode(
    Buffer.from(
      ((s) => (s.length % 2 === 1 ? "0" + s : s))(BigInt(decoded).toString(16)),
      "hex",
    ),
  );
  return {
    value: decoded,
    tail: ((b) => (b.length === 0 ? null : b))(v.slice(length)),
  };
}

export function decodeList(v) {
  let tail = v;
  const result = [];
  while (tail) {
    const decoded = readULEB128(tail);
    tail = decoded.tail;
    result.push(BigInt(decoded.value));
  }
  return result;
}

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
    burn?: {
      pointer: number;
      from?: Array<u32>;
    };
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
        from: burn.from
      };
    }
    if (message && message.calldata) {
      const ary = Uint8Array.from(message.calldata);
      const res: u128[] = [];

      for (let i = 0; i < ary.byteLength; i += 16) {
        const last = i + 16;
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

  encipher_payloads(): Buffer[] {
    let payloads: Buffer[] = [];
    if (this.burn) {
      payloads.push(
        Tag.encodeOptionInt(Tag.POINTER, this.burn.pointer.map(u128)),
      );
      if (this.burn.from) {
        payloads.push(
          Tag.encode(Tag.FROM, this.burn.from.map(u128)),
        );
      }

      payloads.push(
        Tag.encodeOptionInt(Tag.BURN, Some<u128>(this.protocolTag)),
      );
    } else if (this.message) {
      // payloads.push(u128.encodeVarInt(this.protocolTag));
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
    const length_payload = payloads.reduce(
      (r, v) => r + decodeList(v).length,
      0,
    );
    const prefix = [
      toBuffer(
        payloads.reduce((r, v) => r || decodeList(v)[0] === 83n, false)
          ? u128(13)
          : u128(this.protocolTag),
      ),
      toBuffer(u128(length_payload)),
    ];
    const result = prefix.concat(
      payloads.reduce(
        (r, v) => r.concat(decodeList(v).map((v) => toBuffer(v))),
        prefix.slice(2),
      ),
    );
    return result;
  }

  static burn({
    protocolTag,
    edicts,
    ...burn
  }: {
    protocolTag: bigint;
    pointer: number;
    from?: Array<u32>;
    edicts?: Edict[];
  }): ProtoStone {
    return new ProtoStone({ burn, protocolTag, edicts });
  }

  static message({
    protocolTag,
    edicts,
    ...message
  }: {
    calldata: Buffer;
    protocolTag: bigint;
    pointer: number;
    refundPointer: number;
    edicts?: Edict[];
  }): ProtoStone {
    return new ProtoStone({ message, protocolTag, edicts });
  }

  static edicts({
    protocolTag,
    edicts,
  }: {
    edicts?: Edict[];
    protocolTag: bigint;
  }): ProtoStone {
    return new ProtoStone({ edicts, protocolTag });
  }
}
