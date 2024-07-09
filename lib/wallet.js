"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.encodeProtorunesWalletInput = encodeProtorunesWalletInput;
const protorune_1 = require("./proto/protorune");
function numberToBytes(num) {
    // Create an ArrayBuffer with a size of 8 bytes (64 bits)
    const buffer = new ArrayBuffer(8);
    // Create a DataView to manipulate the ArrayBuffer
    const dataView = new DataView(buffer);
    // Set the number as a 64-bit float at the beginning of the buffer
    dataView.setFloat64(0, num, true); // true for little-endian
    // Create a Uint8Array from the ArrayBuffer
    const bytes = new Uint8Array(buffer);
    return bytes;
}
function encodeProtorunesWalletInput(address, protocol_tag) {
    const input = {
        wallet: Uint8Array.from(Buffer.from(address, "utf-8")),
        protocolTag: numberToBytes(protocol_tag)
    };
    return "0x" + Buffer.from(protorune_1.ProtorunesWalletRequest.toBinary(input)).toString("hex");
}
//# sourceMappingURL=wallet.js.map