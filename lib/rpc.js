"use strict";
var __createBinding = (this && this.__createBinding) || (Object.create ? (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    var desc = Object.getOwnPropertyDescriptor(m, k);
    if (!desc || ("get" in desc ? !m.__esModule : desc.writable || desc.configurable)) {
      desc = { enumerable: true, get: function() { return m[k]; } };
    }
    Object.defineProperty(o, k2, desc);
}) : (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    o[k2] = m[k];
}));
var __setModuleDefault = (this && this.__setModuleDefault) || (Object.create ? (function(o, v) {
    Object.defineProperty(o, "default", { enumerable: true, value: v });
}) : function(o, v) {
    o["default"] = v;
});
var __importStar = (this && this.__importStar) || function (mod) {
    if (mod && mod.__esModule) return mod;
    var result = {};
    if (mod != null) for (var k in mod) if (k !== "default" && Object.prototype.hasOwnProperty.call(mod, k)) __createBinding(result, mod, k);
    __setModuleDefault(result, mod);
    return result;
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.ProtorunesRpc = void 0;
const protowallet = __importStar(require("./wallet"));
const wallet = __importStar(require("metashrew-runes/lib/src.ts/wallet"));
const rpc_1 = require("metashrew-runes/lib/src.ts/rpc");
const addHexPrefix = (s) => (s.substr(0, 2) === "0x" ? s : "0x" + s);
let id = 0;
class ProtorunesRpc extends rpc_1.MetashrewRunes {
    async protorunesbyaddress({ address, protocolTag }) {
        const buffer = protowallet.encodeProtorunesWalletInput(address, protocolTag);
        const byteString = await this._call({
            method: "protorunesbyaddress",
            input: buffer,
        });
        const decoded = wallet.decodeWalletOutput(byteString);
        return decoded;
    }
    async runtime({ protocolTag }) {
        const buffer = protowallet.encodeRuntimeInput(protocolTag);
        const byteString = await this._call({
            method: "protorunesbyaddress",
            input: buffer,
        });
        const decoded = protowallet.decodeRuntimeOutput(byteString);
        return decoded;
    }
}
exports.ProtorunesRpc = ProtorunesRpc;
//# sourceMappingURL=rpc.js.map