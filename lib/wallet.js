"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.encodeProtorunesWalletInput = encodeProtorunesWalletInput;
const protorune_1 = require("./proto/protorune");
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
//# sourceMappingURL=wallet.js.map