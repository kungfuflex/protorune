"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.buildDefaultBlock = exports.buildCoinbaseToAddress = exports.buildTransaction = exports.buildInput = exports.buildCoinbase = void 0;
//@ts-ignore
const bitcoinjs = require("bitcoinjs-lib");
const general_1 = require("./general");
const buildCoinbase = (outputs) => {
    const tx = new bitcoinjs.Transaction();
    tx.ins.push({
        hash: (0, general_1.buildBytes32)(),
        index: bitcoinjs.Transaction.DEFAULT_SEQUENCE,
        script: general_1.EMPTY_BUFFER,
        sequence: bitcoinjs.Transaction.DEFAULT_SEQUENCE,
        witness: general_1.EMPTY_WITNESS,
    });
    outputs.forEach((v) => tx.outs.push(v));
    return tx;
};
exports.buildCoinbase = buildCoinbase;
const buildInput = (o) => {
    return {
        ...o,
        script: general_1.EMPTY_BUFFER,
        sequence: bitcoinjs.Transaction.DEFAULT_SEQUENCE,
        witness: general_1.EMPTY_WITNESS,
    };
};
exports.buildInput = buildInput;
const buildTransaction = (ins, outs) => {
    const tx = new bitcoinjs.Transaction();
    ins.forEach((v) => tx.ins.push(v));
    outs.forEach((v) => tx.outs.push(v));
    return tx;
};
exports.buildTransaction = buildTransaction;
const buildCoinbaseToAddress = (address) => (0, exports.buildCoinbase)([
    {
        script: bitcoinjs.payments.p2pkh({
            address: address,
            network: bitcoinjs.networks.bitcoin,
        }).output,
        value: 625000000,
    },
]);
exports.buildCoinbaseToAddress = buildCoinbaseToAddress;
const buildDefaultBlock = () => {
    const block = new bitcoinjs.Block();
    block.prevHash = (0, general_1.buildBytes32)();
    block.merkleRoot = (0, general_1.buildBytes32)();
    block.witnessCommit = (0, general_1.buildBytes32)();
    block.transactions = [];
    return block;
};
exports.buildDefaultBlock = buildDefaultBlock;
//# sourceMappingURL=block-helpers.js.map