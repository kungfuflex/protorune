"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.decodeWalletOutput = decodeWalletOutput;
exports.encodeWalletInput = encodeWalletInput;
const metashrew_runes_1 = require("./proto/metashrew-runes");
const outpoint_1 = require("./outpoint");
const outpoint_2 = require("./outpoint");
function decodeWalletOutput(hex) {
    const wo = metashrew_runes_1.WalletResponse.fromBinary(Uint8Array.from(Buffer.from(hex, "hex")));
    return {
        outpoints: wo.outpoints.map((op) => (0, outpoint_1.decodeOutpointViewBase)(op)),
        balanceSheet: (0, outpoint_2.decodeRunes)(wo.balances),
    };
}
function encodeWalletInput(address) {
    const input = {
        wallet: Uint8Array.from(Buffer.from(address, "utf-8")),
    };
    return "0x" + Buffer.from(metashrew_runes_1.WalletRequest.toBinary(input)).toString("hex");
}
//# sourceMappingURL=wallet.js.map