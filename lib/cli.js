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
const yargs_1 = __importDefault(require("yargs"));
const protoburn_1 = require("./protoburn");
const wallet_1 = require("./utils/wallet");
const bitcoin = __importStar(require("bitcoinjs-lib"));
const ecc = __importStar(require("tiny-secp256k1"));
const transaction_1 = require("./utils/transaction");
const node_util_1 = require("node:util");
bitcoin.initEccLib(ecc);
function getAddress(node, network) {
    return bitcoin.payments.p2tr({
        internalPubkey: (0, wallet_1.tweakPubkey)(node.publicKey),
        network,
    });
}
yargs_1.default
    .scriptName("protorune")
    .usage("$0 <cmd> [args]")
    .command("gen-protoburn [protocol_id] [runeid] [amount]", "generate protoburn tx", (yargs) => {
    yargs.positional("protocol_id", {
        type: "string",
        describe: "subprotocol id for the protorune",
    });
    yargs.positional("runeid", {
        type: "string",
        describe: "has to be of the format `height:txindex`",
    });
    yargs.positional("amount", {
        type: "string",
        describe: "amount of protorunes to be burned",
    });
}, async function (argv) {
    const protocol_id = argv.protocol_id;
    const runeid = argv.runeid;
    const amount = argv.amount;
    const { address, output } = getAddress(wallet_1.DEFAULT, bitcoin.networks.bitcoin);
    const protoburn = await (0, protoburn_1.encodeProtoburn)([
        {
            amount: BigInt(amount),
            id: runeid.split(":").reduce(({ block }, d) => ({
                block: block == BigInt(0) ? BigInt(d) : block,
                tx: block > BigInt(0) ? parseInt(d) : 0,
            }), { block: BigInt(0), tx: 0 }),
        },
    ], BigInt(protocol_id), address, output);
    const burnTx = protoburn.extractTransaction().toHex();
    console.log((0, node_util_1.inspect)(await (0, transaction_1.decodeRawTx)(burnTx), false, 5, true));
})
    .help().argv;
//# sourceMappingURL=cli.js.map