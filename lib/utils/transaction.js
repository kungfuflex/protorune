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
exports.decodeRawTx = decodeRawTx;
exports.getFeeEstimates = getFeeEstimates;
exports.getVSize = getVSize;
exports.getInputsFor = getInputsFor;
exports.buildRunesTransaction = buildRunesTransaction;
const bitcoin = __importStar(require("bitcoinjs-lib"));
const wallet_1 = require("./wallet");
const sandshrew_1 = require("./sandshrew");
const DEFAULT_AMOUNT = 2000;
async function decodeRawTx(tx) {
    return await (0, sandshrew_1.rpcCall)("btc_decoderawtransaction", [tx]);
}
async function getFeeEstimates() {
    return await (0, sandshrew_1.rpcCall)("esplora_fee-estimates", []);
}
async function getVSize(tx) {
    return (await (0, sandshrew_1.rpcCall)("btc_decoderawtransaction", [tx])).vsize;
}
//@TODO: should fetch a list of spendable outpoints for the specified address
async function getInputsFor(address, amount) {
    const utxos = await (0, sandshrew_1.rpcCall)("esplora_address::utxo", [address]);
    const inputs = utxos.reduce((a, d) => {
        if (a.total < amount) {
            const tx = {
                ...d,
                txid: Buffer.from(d.txid, "hex").reverse().toString("hex"),
            };
            if (tx.txid ==
                "eb2fa5fad4a7f054c6c039ff934c7a6a8d18313ddb9b8c9ed1e0bc01d3dc9572" &&
                tx.vout == 2) {
                return {
                    result: [tx, ...a.result],
                    total: (a.total += d.value),
                };
            }
            return {
                result: [...a.result, tx],
                total: (a.total += d.value),
            };
        }
        return a;
    }, { result: [], total: 0 }).result;
    return { inputs, utxos };
}
async function buildRunesTransaction(outputs, address, output) {
    const { inputs, utxos } = await getInputsFor(address, DEFAULT_AMOUNT);
    let tx = new bitcoin.Psbt();
    outputs.map((o) => (o.script ? (tx = tx.addOutput(o)) : null));
    let currentIndex = inputs.length;
    const nodeXOnlyPubkey = (0, wallet_1.tweakPubkey)(wallet_1.DEFAULT.publicKey);
    const pair = wallet_1.DEFAULT.tweak(bitcoin.crypto.taggedHash("TapTweak", nodeXOnlyPubkey));
    tx.locktime = 6;
    let currentTotal = inputs.reduce((a, d, i) => {
        tx = tx.addInput({
            hash: Buffer.from(d.txid, "hex"),
            index: d.vout,
            witnessUtxo: {
                value: d.value,
                script: output,
            },
            tapInternalKey: nodeXOnlyPubkey,
        });
        return a + d.value;
    }, 0);
    let baseTx = tx.clone();
    tx.signAllInputs(pair);
    tx.finalizeAllInputs();
    //locktime - 6 blocks
    let vsize = await getVSize(tx.extractTransaction(true).toHex());
    const feeRate = (await getFeeEstimates())["1"];
    let fee = vsize * feeRate;
    while (fee > currentTotal) {
        if (currentIndex > utxos.length)
            throw new Error("wallet does not have enough spendable btc");
        const v = utxos[currentIndex];
        tx = baseTx.clone();
        tx = tx.addInput({
            hash: Buffer.from(v.txid, "hex"),
            index: v.vout,
            witnessUtxo: {
                value: v.value,
                script: output,
            },
            tapInternalKey: nodeXOnlyPubkey,
        });
        baseTx = tx.clone();
        tx = tx.signAllInputs(pair);
        tx.finalizeAllInputs();
        currentIndex++;
        currentTotal += v.value;
        vsize = await getVSize(tx.extractTransaction(true).toHex());
        fee = vsize * feeRate;
    }
    tx = baseTx.clone();
    tx = tx.addOutput({
        script: bitcoin.payments.p2tr({
            address,
            network: bitcoin.networks.bitcoin,
        }).output || Buffer.from(""),
        value: 546,
    });
    tx = tx.addOutput({
        script: bitcoin.payments.p2tr({
            address,
            network: bitcoin.networks.bitcoin,
        }).output || Buffer.from(""),
        value: 546,
    });
    const buf = ((v) => {
        v.writeUint32BE(2);
        return v.reverse();
    })(Buffer.alloc(20));
    tx = tx.addOutput({
        script: bitcoin.payments.p2sh({
            hash: buf,
            network: bitcoin.networks.bitcoin,
        }).output || Buffer.from(""),
        value: 546,
    });
    tx = tx.addOutput({
        script: bitcoin.payments.p2tr({
            address,
            network: bitcoin.networks.bitcoin,
        }).output || Buffer.from(""),
        value: currentTotal - Math.ceil(fee) - 546 * 3,
    });
    console.log("total inputs: ", currentTotal, ", fee: ", fee);
    tx.signAllInputs(pair);
    tx.finalizeAllInputs();
    return tx;
}
//# sourceMappingURL=transaction.js.map