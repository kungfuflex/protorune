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
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.tweakPubkey = exports.DEFAULT = exports.node = void 0;
const bitcoin = __importStar(require("bitcoinjs-lib"));
const ecc = __importStar(require("tiny-secp256k1"));
const bip32_1 = __importDefault(require("bip32"));
const bip39 = __importStar(require("bip39"));
bitcoin.initEccLib(ecc);
const INDEX = process.env.SEED_INDEX;
const bip32 = (0, bip32_1.default)(ecc);
const mnemonic = process.env.PRIVATE_KEY;
const seed = bip39.mnemonicToSeedSync(mnemonic.trim());
exports.node = bip32.fromSeed(seed);
exports.DEFAULT = exports.node.derivePath(`m/86'/0'/0'/0/${INDEX}`);
const tweakPubkey = (pubKey) => pubKey.length === 32 ? pubKey : pubKey.slice(1, 33);
exports.tweakPubkey = tweakPubkey;
//# sourceMappingURL=wallet.js.map