"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.transferRuneMultiple = exports.transferRune = exports.initCompleteBlockWithRuneEtching = exports.runesbyaddress = void 0;
//@ts-ignore
const bitcoinjs = require("bitcoinjs-lib");
const runestone_lib_1 = require("@magiceden-oss/runestone-lib");
const metashrew_test_1 = require("metashrew-test");
const rpc_1 = require("../../src.ts/rpc");
const block_helpers_1 = require("./block-helpers");
const general_1 = require("./general");
const runesbyaddress = async (program, address) => {
    const cloned = program; // just mutate it
    const result = await rpc_1.MetashrewRunes.prototype.runesbyaddress.call({
        async _call({ input }) {
            cloned.setBlock(input);
            const ptr = await cloned.run("runesbyaddress");
            return (0, metashrew_test_1.readArrayBufferAsHex)(cloned.memory, ptr);
        },
    }, { address });
    return result;
};
exports.runesbyaddress = runesbyaddress;
const initCompleteBlockWithRuneEtching = (outputs, pointer, divisibility = 8, premineAmount = 2100000005000000n, runeName = "GENESIS•RUNE•FR", symbol = "G", block) => {
    let coinbase;
    if (block == undefined) {
        block = (0, block_helpers_1.buildDefaultBlock)();
        coinbase = (0, block_helpers_1.buildCoinbaseToAddress)(general_1.TEST_BTC_ADDRESS1);
        block.transactions?.push(coinbase);
    }
    else {
        coinbase = block.transactions?.at(0);
    }
    const runesGenesis = (0, runestone_lib_1.encodeRunestone)({
        etching: {
            divisibility: divisibility,
            premine: premineAmount,
            runeName: runeName,
            symbol: symbol,
        },
        pointer: pointer,
    }).encodedRunestone;
    const transaction = (0, block_helpers_1.buildTransaction)([
        {
            hash: coinbase.getHash(),
            index: 0,
            witness: general_1.EMPTY_WITNESS,
            script: general_1.EMPTY_BUFFER,
        },
    ], [
        {
            script: runesGenesis,
            value: 0,
        },
        ...outputs,
    ]);
    block.transactions?.push(transaction);
    return block;
};
exports.initCompleteBlockWithRuneEtching = initCompleteBlockWithRuneEtching;
const transferRune = (inputs, runeId, runeTransferAmount, outputIndexToReceiveRunes, outputs, outputRunePointer = 1, // default output for leftover runes
block) => {
    if (block == undefined) {
        block = (0, block_helpers_1.buildDefaultBlock)();
        const coinbase = (0, block_helpers_1.buildCoinbaseToAddress)(general_1.TEST_BTC_ADDRESS1);
        block.transactions?.push(coinbase);
    }
    const blockInputs = inputs.map((input) => {
        return {
            hash: input.inputTxHash,
            index: input.inputTxOutputIndex,
            witness: general_1.EMPTY_WITNESS,
            script: general_1.EMPTY_BUFFER,
        };
    });
    const blockOutputs = outputs.map((output) => {
        return {
            script: bitcoinjs.payments.p2pkh({
                address: output.address,
                network: bitcoinjs.networks.bitcoin,
            }).output,
            value: output.btcAmount,
        };
    });
    const edicts = [
        {
            id: runeId,
            amount: runeTransferAmount,
            output: outputIndexToReceiveRunes,
        },
    ];
    const runesTransfer = (0, runestone_lib_1.encodeRunestone)({
        edicts: edicts,
        pointer: outputRunePointer,
    }).encodedRunestone;
    const transaction = (0, block_helpers_1.buildTransaction)([...blockInputs], [
        {
            script: runesTransfer,
            value: 0,
        },
        ...blockOutputs,
    ]);
    block.transactions?.push(transaction);
    return block;
};
exports.transferRune = transferRune;
const transferRuneMultiple = (inputs, runeId, runeTransferAmount, outputIndexToReceiveRunes, outputs, outputRunePointer, // default output for leftover runes
block) => {
    if (block == undefined) {
        block = (0, block_helpers_1.buildDefaultBlock)();
        const coinbase = (0, block_helpers_1.buildCoinbaseToAddress)(general_1.TEST_BTC_ADDRESS1);
        block.transactions?.push(coinbase);
    }
    const blockInputs = inputs.map((input) => {
        return {
            hash: input.inputTxHash,
            index: input.inputTxOutputIndex,
            witness: general_1.EMPTY_WITNESS,
            script: general_1.EMPTY_BUFFER,
        };
    });
    const blockOutputs = outputs.map((output) => {
        return {
            script: bitcoinjs.payments.p2pkh({
                address: output.address,
                network: bitcoinjs.networks.bitcoin,
            }).output,
            value: output.btcAmount,
        };
    });
    const edicts = runeId.map((d, i) => ({
        id: d,
        amount: runeTransferAmount[i],
        output: outputIndexToReceiveRunes[i],
    }));
    const runesTransfer = (0, runestone_lib_1.encodeRunestone)({
        edicts: edicts,
        pointer: outputRunePointer,
    }).encodedRunestone;
    const transaction = (0, block_helpers_1.buildTransaction)([...blockInputs], [
        {
            script: runesTransfer,
            value: 0,
        },
        ...blockOutputs,
    ]);
    block.transactions?.push(transaction);
    return block;
};
exports.transferRuneMultiple = transferRuneMultiple;
//# sourceMappingURL=rune-helpers.js.map