"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.ProtoStone = exports.toBuffer = exports.padLeft = void 0;
exports.readULEB128 = readULEB128;
exports.decodeList = decodeList;
const integer_1 = require("@magiceden-oss/runestone-lib/dist/src/integer");
const tag_1 = require("./tag");
const monads_1 = require("@magiceden-oss/runestone-lib/dist/src/monads");
const runeid_1 = require("@magiceden-oss/runestone-lib/dist/src/runeid");
const leb128_1 = __importDefault(require("leb128"));
const padLeft = (s) => (s.length % 2 === 1 ? "0" + s : s);
exports.padLeft = padLeft;
const toBuffer = (n) => Buffer.from((0, exports.padLeft)(n.toString(16)), "hex");
exports.toBuffer = toBuffer;
function readULEB128(v) {
    const decoded = leb128_1.default.unsigned.decode(v);
    const { length } = leb128_1.default.unsigned.encode(Buffer.from(((s) => (s.length % 2 === 1 ? "0" + s : s))(BigInt(decoded).toString(16)), "hex"));
    return {
        value: decoded,
        tail: ((b) => (b.length === 0 ? null : b))(v.slice(length)),
    };
}
function decodeList(v) {
    let tail = v;
    const result = [];
    while (tail) {
        const decoded = readULEB128(tail);
        tail = decoded.tail;
        result.push(BigInt(decoded.value));
    }
    return result;
}
class ProtoStone {
    constructor({ burn, message, protocolTag, edicts, }) {
        this.protocolTag = (0, integer_1.u128)(protocolTag);
        this.edicts = edicts;
        if (burn) {
            this.burn = {
                pointer: (0, monads_1.Some)((0, integer_1.u32)(burn.pointer)),
                from: burn.from
            };
        }
        if (message && message.calldata) {
            const ary = Uint8Array.from(message.calldata);
            const res = [];
            for (let i = 0; i < ary.byteLength; i += 16) {
                const last = i + 16;
                res.push((0, integer_1.u128)(BigInt(`0x${Buffer.from(ary.slice(i, last > ary.byteLength ? ary.byteLength : last)).toString("hex")}`)));
            }
            this.message = {
                calldata: res,
                pointer: (0, monads_1.Some)((0, integer_1.u32)(message.pointer)),
                refundPointer: (0, monads_1.Some)((0, integer_1.u32)(message.refundPointer)),
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
    encipher_payloads() {
        let payloads = [];
        if (this.burn) {
            payloads.push(tag_1.Tag.encodeOptionInt(tag_1.Tag.POINTER, this.burn.pointer.map(integer_1.u128)));
            if (this.burn.from) {
                payloads.push(tag_1.Tag.encode(tag_1.Tag.FROM, this.burn.from.map(integer_1.u128)));
            }
            payloads.push(tag_1.Tag.encodeOptionInt(tag_1.Tag.BURN, (0, monads_1.Some)(this.protocolTag)));
        }
        else if (this.message) {
            // payloads.push(u128.encodeVarInt(this.protocolTag));
            payloads.push(tag_1.Tag.encodeOptionInt(tag_1.Tag.POINTER, this.message.pointer.map(integer_1.u128)));
            payloads.push(tag_1.Tag.encodeOptionInt(tag_1.Tag.REFUND, this.message.refundPointer.map(integer_1.u128)));
            payloads.push(tag_1.Tag.encode(tag_1.Tag.MESSAGE, this.message.calldata));
        }
        if (this.edicts) {
            payloads.push(integer_1.u128.encodeVarInt((0, integer_1.u128)(tag_1.Tag.BODY)));
            const edicts = [...this.edicts].sort((x, y) => Number(x.id.block - y.id.block || x.id.tx - y.id.tx));
            let previous = new runeid_1.RuneId((0, integer_1.u64)(0), (0, integer_1.u32)(0));
            for (const edict of edicts) {
                const [block, tx] = previous.delta(edict.id).unwrap();
                payloads.push(integer_1.u128.encodeVarInt(block));
                payloads.push(integer_1.u128.encodeVarInt(tx));
                payloads.push(integer_1.u128.encodeVarInt(edict.amount));
                payloads.push(integer_1.u128.encodeVarInt((0, integer_1.u128)(edict.output)));
                previous = edict.id;
            }
        }
        // pushing the protocol_id and len first as per the spec
        const length_payload = payloads.reduce((r, v) => r + decodeList(v).length, 0);
        const prefix = [
            (0, exports.toBuffer)(payloads.reduce((r, v) => r || decodeList(v)[0] === 83n, false)
                ? (0, integer_1.u128)(13)
                : (0, integer_1.u128)(this.protocolTag)),
            (0, exports.toBuffer)((0, integer_1.u128)(length_payload)),
        ];
        const result = prefix.concat(payloads.reduce((r, v) => r.concat(decodeList(v).map((v) => (0, exports.toBuffer)(v))), prefix.slice(2)));
        return result;
    }
    static burn({ protocolTag, edicts, ...burn }) {
        return new ProtoStone({ burn, protocolTag, edicts });
    }
    static message({ protocolTag, edicts, ...message }) {
        return new ProtoStone({ message, protocolTag, edicts });
    }
    static edicts({ protocolTag, edicts, }) {
        return new ProtoStone({ edicts, protocolTag });
    }
}
exports.ProtoStone = ProtoStone;
//# sourceMappingURL=protostone.js.map