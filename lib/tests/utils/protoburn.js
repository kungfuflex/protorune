"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.constructProtostoneTx = exports.constructProtoburnTransaction = void 0;
const protostone_1 = require("../../src.ts/protostone");
const block_helpers_1 = require("metashrew-runes/lib/tests/utils/block-helpers");
//@ts-ignore
const bitcoinjs = require("bitcoinjs-lib");
const general_1 = require("metashrew-runes/lib/tests/utils/general");
const runestone_protostone_upgrade_1 = require("../../src.ts/runestone_protostone_upgrade");
/**
 * Outputs
 *  - [0]: runestone with protostones inside
 *  - [1-n): outputs (regular p2pkh) defined by outputs
 *  - (n, m): these are pointers that don't actually exist, but are used to target the specific protostone by edicts
 *
 *
 * @param inputs
 * @param edicts
 * @param outputIndexToReceiveProtorunes which output receives protorunes
 * @param outputs p2pkh outputs
 * @param protocolTag
 * @param block
 * @param runeTransferPointer which ouput receives leftover runes
 * @returns
 */
const constructProtoburnTransaction = (inputs, edicts, outputIndexToReceiveProtorunes, outputs, protocolTag, block, runeTransferPointer) => {
    const protoburn = protostone_1.ProtoStone.burn({
        protocolTag: protocolTag,
        pointer: outputIndexToReceiveProtorunes,
    });
    return (0, exports.constructProtostoneTx)(inputs, outputs, edicts, [protoburn], block, runeTransferPointer);
};
exports.constructProtoburnTransaction = constructProtoburnTransaction;
/**
 * Outputs
 *  - [0]: runestone with protostones inside
 *  - [1-n): outputs (regular p2pkh) defined by outputs
 *  - (n, m): these are pointers that don't actually exist, but are used to target the specific protostone by edicts
 *
 *
 * @param inputs
 * @param edicts
 * @param outputIndexToReceiveProtorunes which output receives protorunes
 * @param outputs p2pkh outputs
 * @param protocolTag
 * @param block
 * @param runeTransferPointer which ouput receives leftover runes
 * @returns
 */
const constructProtostoneTx = (inputs, outputs, edicts, protostones, block, runeTransferPointer) => {
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
    const runestone = (0, runestone_protostone_upgrade_1.encodeRunestoneProtostone)({
        edicts: edicts,
        pointer: runeTransferPointer, // default output for leftover runes, default goes to the protoburn
        protostones: protostones,
    }).encodedRunestone;
    const transaction = (0, block_helpers_1.buildTransaction)([...blockInputs], [
        {
            script: runestone,
            value: 0,
        },
        ...blockOutputs,
    ]);
    block.transactions?.push(transaction);
    return block;
};
exports.constructProtostoneTx = constructProtostoneTx;
//# sourceMappingURL=protoburn.js.map