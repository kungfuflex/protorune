"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.encodeProtoburn = encodeProtoburn;
const protostone_1 = require("./protostone");
const runestone_protostone_upgrade_1 = require("./runestone_protostone_upgrade");
const transaction_1 = require("./utils/transaction");
async function encodeProtoburn(runes, protocolTag, address, output) {
    // outputs and their meanings:
    //  - output 0: runestone
    //  - output 1: UTXO of address
    //  - output 2: virtual output -- represents the protoburn on our protoburn protocol
    // all runes will go to output 2 -- performing the protoburn
    // all unused runes will be refunded to pointer 1 and retained by the runes protocol
    // the protostone will burn all runes onto the pointer 1 UTXO
    const runestone = (0, runestone_protostone_upgrade_1.encodeRunestoneProtostone)({
        edicts: runes.map((r) => ({ ...r, output: 2 })),
        pointer: 3,
        protostones: [protostone_1.ProtoStone.burn({ protocolTag, pointer: 1 })],
    }).encodedRunestone;
    const outs = [
        {
            script: runestone,
            value: 0,
        },
    ];
    return (0, transaction_1.buildRunesTransaction)(outs, address, output);
}
//# sourceMappingURL=protoburn.js.map