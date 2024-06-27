"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.ProtoRunestone = void 0;
const constants_1 = require("@magiceden-oss/runestone-lib/dist/src/constants");
const tag_1 = require("@magiceden-oss/runestone-lib/dist/src/tag");
const integer_1 = require("@magiceden-oss/runestone-lib/dist/src/integer");
const runeid_1 = require("@magiceden-oss/runestone-lib/dist/src/runeid");
const script_1 = require("@magiceden-oss/runestone-lib/dist/src/script");
class ProtoRunestone {
    constructor(pointer, edicts) {
        this.pointer = pointer;
        this.edicts = edicts;
    }
    encipher() {
        const payloads = [];
        payloads.push(tag_1.Tag.encodeOptionInt(tag_1.Tag.POINTER, this.pointer.map(integer_1.u128)));
        if (this.edicts.length) {
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
        const stack = [];
        stack.push(constants_1.OP_RETURN);
        stack.push(script_1.opcodes.OP_2DROP);
        const payload = Buffer.concat(payloads);
        for (let i = 0; i < payload.length; i += constants_1.MAX_SCRIPT_ELEMENT_SIZE) {
            stack.push(payload.subarray(i, i + constants_1.MAX_SCRIPT_ELEMENT_SIZE));
        }
        return script_1.script.compile(stack);
    }
}
exports.ProtoRunestone = ProtoRunestone;
//# sourceMappingURL=protorunestone.js.map