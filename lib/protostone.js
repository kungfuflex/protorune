"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.ProtoStone = void 0;
const constants_1 = require("@magiceden-oss/runestone-lib/dist/src/constants");
const script_1 = require("@magiceden-oss/runestone-lib/dist/src/script");
const integer_1 = require("@magiceden-oss/runestone-lib/dist/src/integer");
const tag_1 = require("./tag");
const monads_1 = require("@magiceden-oss/runestone-lib/dist/src/monads");
class ProtoStone {
    constructor({ burn, message, protocolTag, split, chunk, }) {
        this.protocolTag = (0, integer_1.u128)(protocolTag);
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
        if (split) {
            this.split = {
                order: split.order.map(integer_1.u32),
            };
        }
        if (chunk) {
            this.chunk = chunk;
        }
    }
    encipher() {
        const stack = [];
        let payloads = [];
        stack.push(constants_1.OP_RETURN);
        if (this.burn) {
            payloads.push(tag_1.Tag.encodeOptionInt(tag_1.Tag.POINTER, this.burn.pointer.map(integer_1.u128)));
            payloads.push(tag_1.Tag.encodeOptionInt(tag_1.Tag.BURN, (0, monads_1.Some)(this.protocolTag)));
            stack.push(script_1.opcodes.OP_14);
        }
        else if (this.message) {
            payloads.push(integer_1.u128.encodeVarInt(this.protocolTag));
            payloads.push(tag_1.Tag.encodeOptionInt(tag_1.Tag.POINTER, this.message.pointer.map(integer_1.u128)));
            payloads.push(tag_1.Tag.encodeOptionInt(tag_1.Tag.REFUND, this.message.refundPointer.map(integer_1.u128)));
            payloads.push(tag_1.Tag.encode(tag_1.Tag.MESSAGE, this.message.calldata));
            stack.push(script_1.opcodes.OP_16);
        }
        else if (this.split) {
            payloads.push(tag_1.Tag.encode(tag_1.Tag.SPLIT, this.split.order.map(integer_1.u128)));
            stack.push(script_1.opcodes.OP_16);
        }
        else if (this.chunk) {
            payloads.push(this.chunk);
            stack.push(script_1.opcodes.OP_15);
        }
        const payload = Buffer.concat(payloads);
        for (let i = 0; i < payload.length; i += constants_1.MAX_SCRIPT_ELEMENT_SIZE) {
            stack.push(payload.subarray(i, i + constants_1.MAX_SCRIPT_ELEMENT_SIZE));
        }
        return script_1.script.compile(stack);
    }
    static burn({ protocolTag, ...burn }) {
        return new ProtoStone({ burn, protocolTag });
    }
    static split({ protocolTag, ...split }) {
        return new ProtoStone({ split, protocolTag });
    }
    static chunk(chunk) {
        return new ProtoStone({ protocolTag: BigInt(0), chunk });
    }
    static message({ protocolTag, ...message }) {
        return new ProtoStone({ message, protocolTag });
    }
}
exports.ProtoStone = ProtoStone;
//# sourceMappingURL=protostone.js.map