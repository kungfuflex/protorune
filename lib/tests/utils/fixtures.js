"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.createProtoruneFixture = createProtoruneFixture;
//@ts-ignore
const bitcoinjs = require("bitcoinjs-lib");
const general_1 = require("metashrew-runes/lib/tests/utils/general");
const rune_helpers_1 = require("metashrew-runes/lib/tests/utils/rune-helpers");
const protoburn_1 = require("./protoburn");
// const TEST_PROTOCOL_TAG = parseInt("0x112233445566778899aabbccddeeff10", 16);
async function createProtoruneFixture(omitBurn = false, premineAmount = 2100000005000000n, { runeId, TEST_PROTOCOL_TAG, } = {
    runeId: {
        block: 840000n,
        tx: 1,
    },
    TEST_PROTOCOL_TAG: BigInt("0x400000000000000000"),
}, _block) {
    // ================================
    // TODO: Create a fixture from here
    // ================================
    const outputs = [
        {
            script: bitcoinjs.payments.p2pkh({
                address: general_1.TEST_BTC_ADDRESS1,
                network: bitcoinjs.networks.bitcoin,
            }).output,
            value: 1,
        },
        {
            script: bitcoinjs.payments.p2pkh({
                network: bitcoinjs.networks.bitcoin,
                address: general_1.TEST_BTC_ADDRESS2,
            }).output,
            value: 624999999,
        },
    ];
    const pointer1 = 1;
    let block = _block ||
        (0, rune_helpers_1.initCompleteBlockWithRuneEtching)(outputs, pointer1, undefined, premineAmount);
    const input = {
        inputTxHash: block.transactions
            ?.at(block?.transactions?.length - 1)
            ?.getHash(), // 0 is coinbase, 1 is the mint
        inputTxOutputIndex: pointer1, // index of output in the input tx that has the runes. In this case it is the default pointer of the mint
    };
    const amount = premineAmount / 2n;
    const outputIndexToReceiveProtorunes = 2; // 0 is the runestone, 1 is protoburn, 2 is ADDRESS2
    const output = {
        address: general_1.TEST_BTC_ADDRESS2,
        btcAmount: 1, //this can be implied to be 1 since runes usually are just inscribed on a satoshi
    };
    // technically this is not a valid transaction since btc in and less than btc out but this is just to test the runes
    const refundOutput = {
        address: general_1.TEST_BTC_ADDRESS1,
        btcAmount: 0, // this gives address 1 his remaining bitcoin
    };
    // ================================
    // TODO: to here
    // ================================
    // Constructing tx 2
    // output 0: runestone with protoburns
    // output 1-2: output, and refundOutput
    // This transaction does a protoburn and transfers all protorunes to output 2
    if (!omitBurn) {
        block = (0, protoburn_1.constructProtoburnTransaction)([input], [
            {
                id: runeId,
                amount: amount,
                output: 0, // output 0 is the runestone. first edict corresponds to first protoburn
            },
        ], 
        /*outputIndexToReceiveProtorunes=*/ 1, //this goes to the output
        [output, refundOutput], // 0 is script, 1 is address 2 output, 2 is address 1 output
        TEST_PROTOCOL_TAG, block, 
        /*runeTransferPointer=*/ 0);
    }
    return {
        input,
        block,
        output,
        refundOutput,
        runeId,
        premineAmount,
        TEST_PROTOCOL_TAG,
    };
}
//# sourceMappingURL=fixtures.js.map