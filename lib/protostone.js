"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.ProtoStone = void 0;
const integer_1 = require("@magiceden-oss/runestone-lib/dist/src/integer");
const tag_1 = require("./tag");
const monads_1 = require("@magiceden-oss/runestone-lib/dist/src/monads");
const runeid_1 = require("@magiceden-oss/runestone-lib/dist/src/runeid");
class ProtoStone {
    constructor({ burn, message, protocolTag, edicts, }) {
        this.protocolTag = (0, integer_1.u128)(protocolTag);
        this.edicts = edicts;
        if (burn) {
            this.burn = {
                pointer: (0, monads_1.Some)((0, integer_1.u32)(burn.pointer)),
            };
        }
        if (message) {
            const ary = Uint8Array.from(message.calldata);
            const res = [];
            for (let i = 0; i < ary.byteLength; i += 8) {
                const last = i + 8;
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
            payloads.push(tag_1.Tag.encodeOptionInt(tag_1.Tag.BURN, (0, monads_1.Some)(this.protocolTag)));
        }
        else if (this.message) {
            payloads.push(integer_1.u128.encodeVarInt(this.protocolTag));
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
        const length_payload = Buffer.concat(payloads).length;
        payloads.unshift(integer_1.u128.encodeVarInt(this.protocolTag), integer_1.u128.encodeVarInt((0, integer_1.u128)(length_payload)));
        return Buffer.concat(payloads);
    }
    static burn({ protocolTag, ...burn }) {
        return new ProtoStone({ burn, protocolTag });
    }
    static message({ protocolTag, ...message }) {
        return new ProtoStone({ message, protocolTag });
    }
}
exports.ProtoStone = ProtoStone;
//# sourceMappingURL=protostone.js.map