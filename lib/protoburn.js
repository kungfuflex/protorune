"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.encodeProtoburn = encodeProtoburn;
const protostone_1 = require("./protostone");
const runestone_lib_1 = require("@magiceden-oss/runestone-lib");
const transaction_1 = require("./utils/transaction");
async function encodeProtoburn(runes, protocolTag, address, output) {
    const runestone = (0, runestone_lib_1.encodeRunestone)({
        edicts: runes.map((r) => ({ ...r, output: 1 })),
        pointer: 2,
    }).encodedRunestone;
    const protoburn = protostone_1.ProtoStone.burn({ protocolTag, pointer: 2 }).encipher();
    const outs = [
        {
            script: runestone,
            value: 0,
        },
        {
            script: protoburn,
            value: 0,
        },
        {
            address,
            //@TODO: change so that it correctly gets the value to be sent
            value: 1,
        },
    ];
    return (0, transaction_1.buildRunesTransaction)(outs, address, output);
}
//# sourceMappingURL=protoburn.js.map