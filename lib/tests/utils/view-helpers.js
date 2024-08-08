"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.runtime = exports.protorunesbyaddress = void 0;
const metashrew_test_1 = require("metashrew-test");
const rpc_1 = require("../../src.ts/rpc");
const protorunesbyaddress = async (program, address, protocolTag) => {
    const cloned = program; // just mutate it
    const result = await rpc_1.ProtorunesRpc.prototype.protorunesbyaddress.call({
        async _call({ input }) {
            cloned.setBlock(input);
            const ptr = await cloned.run("protorunesbyaddress");
            return (0, metashrew_test_1.readArrayBufferAsHex)(cloned.memory, ptr);
        },
    }, { address, protocolTag });
    return result;
};
exports.protorunesbyaddress = protorunesbyaddress;
const runtime = async (program, protocolTag, runeId) => {
    const cloned = program; // just mutate it
    const result = await rpc_1.ProtorunesRpc.prototype.runtime.call({
        async _call({ input }) {
            cloned.setBlock(input);
            const ptr = await cloned.run("runtime");
            return (0, metashrew_test_1.readArrayBufferAsHex)(cloned.memory, ptr);
        },
    }, { protocolTag });
    return result;
};
exports.runtime = runtime;
//# sourceMappingURL=view-helpers.js.map