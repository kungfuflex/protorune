"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.ProtoBurn = void 0;
const protorune_1 = require("./proto/protorune");
const constants_1 = require("@magiceden-oss/runestone-lib/dist/src/constants");
const script_1 = require("@magiceden-oss/runestone-lib/dist/src/script");
class ProtoBurn {
    constructor(obj) {
        this.protocolTag = obj.protocolTag;
        this.pointer = obj.pointer;
    }
    encipher() {
        const stack = [];
        const payload = Buffer.from(protorune_1.ProtoBurn.toBinary(this));
        stack.push(constants_1.OP_RETURN);
        stack.push(constants_1.OP_RETURN);
        for (let i = 0; i < payload.length; i += constants_1.MAX_SCRIPT_ELEMENT_SIZE) {
            stack.push(payload.subarray(i, i + constants_1.MAX_SCRIPT_ELEMENT_SIZE));
        }
        return script_1.script.compile(stack);
    }
}
exports.ProtoBurn = ProtoBurn;
//# sourceMappingURL=protoburn.js.map