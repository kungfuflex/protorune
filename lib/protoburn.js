"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.ProtoBurn = void 0;
const constants_1 = require("@magiceden-oss/runestone-lib/dist/src/constants");
const script_1 = require("@magiceden-oss/runestone-lib/dist/src/script");
const integer_1 = require("@magiceden-oss/runestone-lib/dist/src/integer");
const tag_1 = require("./tag");
const monads_1 = require("@magiceden-oss/runestone-lib/dist/src/monads");
class ProtoBurn {
    constructor(obj) {
        this.protocolTag = (0, monads_1.Some)((0, integer_1.u128)(obj.protocolTag));
        this.pointer = (0, monads_1.Some)((0, integer_1.u32)(obj.pointer));
    }
    encipher() {
        const stack = [];
        let payloads = [];
        payloads.push(tag_1.Tag.encodeOptionInt(tag_1.Tag.POINTER, this.pointer.map(integer_1.u128)));
        payloads.push(tag_1.Tag.encodeOptionInt(tag_1.Tag.BURN, this.protocolTag.map(integer_1.u128)));
        stack.push(constants_1.OP_RETURN);
        stack.push(constants_1.OP_RETURN);
        const payload = Buffer.concat(payloads);
        for (let i = 0; i < payload.length; i += constants_1.MAX_SCRIPT_ELEMENT_SIZE) {
            stack.push(payload.subarray(i, i + constants_1.MAX_SCRIPT_ELEMENT_SIZE));
        }
        return script_1.script.compile(stack);
    }
}
exports.ProtoBurn = ProtoBurn;
//# sourceMappingURL=protoburn.js.map