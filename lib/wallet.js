"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.encodeProtorunesWalletInput = encodeProtorunesWalletInput;
exports.encodeRuntimeInput = encodeRuntimeInput;
exports.decodeRuntimeOutput = decodeRuntimeOutput;
const protorune_1 = require("./proto/protorune");
const utils_1 = require("./utils");
function numberToBytes(num) {
    const buf = Buffer.from(num.toString(), "utf-8");
    const bytes = Uint8Array.from(buf);
    return bytes;
}
function encodeProtorunesWalletInput(address, protocol_tag) {
    const input = {
        wallet: Uint8Array.from(Buffer.from(address, "utf-8")),
        protocolTag: numberToBytes(protocol_tag),
    };
    return ("0x" + Buffer.from(protorune_1.ProtorunesWalletRequest.toBinary(input)).toString("hex"));
}
function encodeRuntimeInput(protocol_tag, runeid) {
    const input = {
        protocolTag: numberToBytes(protocol_tag),
        rune: runeid,
    };
    return "0x" + Buffer.from(protorune_1.RuntimeInput.toBinary(input)).toString("hex");
}
function decodeRuntimeOutput(hex) {
    const runtime = protorune_1.Runtime.fromBinary(Uint8Array.from(Buffer.from((0, utils_1.stripHexPrefix)(hex), "hex")));
    const balance = BigInt("0x" + Buffer.from(runtime.balance).toString("hex"));
    return {
        balance,
    };
}
//# sourceMappingURL=wallet.js.map