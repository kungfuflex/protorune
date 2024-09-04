"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.createProtoruneFixture = createProtoruneFixture;
exports.createProtomessageFixture = createProtomessageFixture;
exports.createMultipleProtoruneFixture = createMultipleProtoruneFixture;
exports.createMultipleProtomessageFixture = createMultipleProtomessageFixture;
//@ts-ignore
const bitcoinjs = require("bitcoinjs-lib");
const general_1 = require("metashrew-runes/lib/tests/utils/general");
const rune_helpers_1 = require("metashrew-runes/lib/tests/utils/rune-helpers");
const protoburn_1 = require("./protoburn");
const protostone_1 = require("../../src.ts/protostone");
const integer_1 = require("@magiceden-oss/runestone-lib/dist/src/integer");
const runeid_1 = require("@magiceden-oss/runestone-lib/dist/src/runeid");
/**
 * Fixture creates a block with 3 transactions:
 *  - tx 1: coinbase that transfers all bitcoins to ADDRESS1
 *  - tx 2: runestone that has two outputs
 *    - output 0: runestone etch, transfer all runes to pointer = 1 which is ADDRESS1
 *    - output 1: ADDRESS1 p2pkh
 *    - output 2: ADDRESS2 p2pkh
 *  - tx 3: runestone with protoburn
 *    - output 0: runestone with edicts transferring half of the runes to output 0, which has the protoburn.
 *                the protoburn transfers the protorunes to output 1.
 *                The leftover runes get transferred to the pointer, which is also output 0 (the protoburn)
 *                All runes end up getting converted to protorunes and sent to ADDRESS2
 *    - output 1: ADDRESS2 p2pkh
 *    - output 2: ADDRESS1 p2pkh
 *    - note, this will protoburn all the runes that address 1 had and transfer all to ADDRESS2
 *
 * Ending balances if omitBurn=true:
 *  - ADDRESS1 balances
 *    - 1 sat
 *    - 2100000005000000 runes
 *    - 0 protorunes
 *  - ADDRESS2 balances
 *    - 624999999 sat
 *    - 0 runes
 *    - 0 protorunes
 *
 * Ending balances if omitBurn=false:
 *  - ADDRESS1 balances
 *    - 1 sat
 *    - 0 runes
 *    - 0 protorunes
 *  - ADDRESS2 balances
 *    - 624999999 sat
 *    - 0 runes
 *    - 2100000005000000 protorunes
 */
async function createProtoruneFixture(protocolTag, omitBurn = false, premineAmount = 2100000005000000n, { skip, } = {
    skip: 0,
}, _block) {
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
    const pointerToReceiveRunes = 1;
    // constructs tx 0 (coinbase) and tx 1 (rune etching)
    let block = _block ||
        (0, rune_helpers_1.initCompleteBlockWithRuneEtching)(outputs, pointerToReceiveRunes, undefined, premineAmount, undefined /*name */, undefined /*symbol */, undefined /* block */, skip);
    const runeId = {
        block: 840000n,
        tx: 1,
    };
    const input = {
        inputTxHash: block.transactions
            ?.at(block?.transactions?.length - 1)
            ?.getHash(), // 0 is coinbase, 1 is the mint
        inputTxOutputIndex: pointerToReceiveRunes, // index of output in the input tx that has the runes. In this case it is the default pointer of the mint
    };
    const amount = premineAmount / 2n;
    const output = {
        address: general_1.TEST_BTC_ADDRESS2,
        btcAmount: 1, //this can be implied to be 1 since runes usually are just inscribed on a satoshi
    };
    // technically this is not a valid transaction since btc in and less than btc out but this is just to test the runes
    const refundOutput = {
        address: general_1.TEST_BTC_ADDRESS1,
        btcAmount: 0, // this gives address 1 his remaining bitcoin
    };
    // Constructing tx 2
    // output 0: runestone with protoburns
    // output 1-2: output, and refundOutput
    // This transaction does a protoburn and transfers all protorunes to output 2
    if (!omitBurn) {
        block = (0, protoburn_1.constructProtoburnTransaction)([input], [
            {
                id: runeId,
                amount: amount,
                output: 0, // output 0 is the runestone, which indicates a protoburn
            },
        ], 
        /*outputIndexToReceiveProtorunes=*/ 1, //this goes to ADDRESS2
        [output, refundOutput], // 0 is script, 1 is address 2 output, 2 is address 1 output
        protocolTag, block, 
        /*runeTransferPointer=*/ 0);
    }
    return {
        input,
        block,
        output,
        refundOutput,
        runeId,
        premineAmount,
        pointerToReceiveRunes,
    };
}
async function createProtomessageFixture({ protocolTag, protomessagePointer, protomessageRefundPointer, }) {
    let { block, output, refundOutput, runeId, pointerToReceiveRunes, premineAmount, } = 
    // this fixture always assumes a protoburn and default values
    await createProtoruneFixture(protocolTag);
    const calldata = Buffer.from("testing 12345");
    // constructing tx 3: protomessage
    // right now, address 2 has all the protorunes. we want to forward everything to the pointer
    block = (0, protoburn_1.constructProtostoneTx)([
        {
            inputTxHash: block.transactions?.at(2)?.getHash(), //protoburn is at tx2
            inputTxOutputIndex: pointerToReceiveRunes,
        },
    ], [output, refundOutput], [], [
        protostone_1.ProtoStone.edicts({
            protocolTag: protocolTag,
            edicts: [
                {
                    amount: (0, integer_1.u128)(premineAmount),
                    id: new runeid_1.RuneId((0, integer_1.u64)(runeId.block), (0, integer_1.u32)(runeId.tx)),
                    output: (0, integer_1.u32)(5),
                },
            ],
        }),
        protostone_1.ProtoStone.message({
            protocolTag: protocolTag,
            pointer: protomessagePointer,
            refundPointer: protomessageRefundPointer,
            calldata,
        }),
    ], block, 2);
    return { block, runeId, premineAmount };
}
/**
 * Fixture creates a block with 4 transactions:
 *  - tx 0: coinbase that transfers all bitcoins to ADDRESS1
 *  - tx 1: rune etching (runestone that has two outputs)
 *    - output 0: runestone etch, transfer all runes to pointer = 1 which is ADDRESS1
 *    - output 1: ADDRESS1 p2pkh
 *    - output 2: ADDRESS2 p2pkh
 *  - tx 2: rune etching
 *    - output 0: runestone etch, transfer all runes to pointer = 1 which is ADDRESS1
 *    - this is actually an invalid block since it uses the coinbase again as the input
 *  - tx 3: runestone with protoburn
 *    - output 0: runestone with edicts transferring half of the runes to output 0, which has the protoburn.
 *                the protoburn transfers the protorunes to output 1.
 *                The leftover runes get transferred to the pointer, which is also output 0 (the protoburn)
 *                All runes end up getting converted to protorunes and sent to ADDRESS2
 *    - output 1: ADDRESS2 p2pkh
 *    - output 2: ADDRESS1 p2pkh
 *    - note, this will protoburn all the runes that address 1 had and transfer all to ADDRESS2
 * Ending balances if omitBurn=true:
 *  - ADDRESS1 balances
 *    - 1 sat
 *    - 2100000005000000 runes1
 *    - 2100000005000000 runes2
 *    - 0 protorunes
 *  - ADDRESS2 balances
 *    - 624999999 sat
 *    - 0 runes
 *    - 0 protorunes
 *
 * Ending balances if omitBurn=false:
 *  - ADDRESS1 balances
 *    - 1 sat
 *    - 0 runes
 *    - 0 protorunes
 *  - ADDRESS2 balances
 *    - 624999999 sat
 *    - 0 runes
 *    - 2100000005000000 protorune1
 *    - 2100000005000000 protorune2
 */
async function createMultipleProtoruneFixture(protocolTag, omitBurn = false, premineAmount = 2100000005000000n, { skip, } = {
    skip: 0,
}, _block) {
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
    const pointerToReceiveRunes = 1;
    // constructs tx 0 (coinbase) and tx 1 (rune etching)
    let block = _block ||
        (0, rune_helpers_1.initCompleteBlockWithRuneEtching)(outputs, pointerToReceiveRunes, undefined, premineAmount, undefined /*name */, undefined /*symbol */, undefined /* block */, skip);
    const runeId1 = {
        block: 840000n,
        tx: 1,
    };
    // tx 2 is another rune etching
    block = (0, rune_helpers_1.initCompleteBlockWithRuneEtching)(outputs, pointerToReceiveRunes, undefined, premineAmount, "GENESIS•RUNE•TWO" /*name */, "H" /*symbol */, block /* block */, skip);
    const runeId2 = {
        block: 840000n,
        tx: 2,
    };
    const inputs = [
        {
            inputTxHash: block.transactions?.at(runeId1.tx)?.getHash(),
            inputTxOutputIndex: pointerToReceiveRunes,
        },
        {
            inputTxHash: block.transactions?.at(runeId2.tx)?.getHash(),
            inputTxOutputIndex: pointerToReceiveRunes,
        },
    ];
    const amount = premineAmount / 2n;
    const output = {
        address: general_1.TEST_BTC_ADDRESS2,
        btcAmount: 1, //this can be implied to be 1 since runes usually are just inscribed on a satoshi
    };
    // technically this is not a valid transaction since btc in and less than btc out but this is just to test the runes
    const refundOutput = {
        address: general_1.TEST_BTC_ADDRESS1,
        btcAmount: 0, // this gives address 1 his remaining bitcoin
    };
    // Constructing tx 3
    // output 0: runestone with protoburns
    // output 1-2: output, and refundOutput
    // This transaction does a protoburn and transfers all protorunes to output 2
    if (!omitBurn) {
        block = (0, protoburn_1.constructProtoburnTransaction)(inputs, [
            {
                id: runeId1,
                amount: amount,
                output: 0, // output 0 is the runestone, which indicates a protoburn
            },
            {
                id: runeId2,
                amount: amount,
                output: 0,
            },
        ], 
        /*outputIndexToReceiveProtorunes=*/ 1, //this goes to ADDRESS2
        [output, refundOutput], // 0 is script, 1 is address 2 output, 2 is address 1 output
        protocolTag, block, 
        /*runeTransferPointer=*/ 0);
    }
    return {
        inputs,
        block,
        output,
        refundOutput,
        runeId1,
        runeId2,
        premineAmount,
        pointerToReceiveRunes,
    };
}
/**
 * This fixture creates the following balances
 *  - ADDRESS1 balances
 *    - 1 sat
 *    - 0 runes
 *    - x protorune1
 *    - 2100000005000000 protorune2
 *  - ADDRESS2 balances
 *    - 624999999 sat
 *    - 0 runes
 *    - x protorune1
 *    - x protorune2
 * stored in the same UTXO
 * @param param0
 * @param omitBurn
 * @param premineAmount
 * @param param3
 * @param _block
 * @returns
 */
async function createMultipleProtomessageFixture({ protocolTag, protomessagePointer, protomessageRefundPointer, }) {
    let { block, output, refundOutput, runeId1, pointerToReceiveRunes, premineAmount, } = 
    // this fixture always assumes a protoburn and default values
    await createMultipleProtoruneFixture(protocolTag);
    const calldata = Buffer.from("testing 12345");
    // constructing tx 4: protomessage
    // right now, address 2 has all the protorunes. we want to forward everything to the pointer
    block = (0, protoburn_1.constructProtostoneTx)([
        {
            inputTxHash: block.transactions?.at(3)?.getHash(), //protoburn is at tx3
            inputTxOutputIndex: pointerToReceiveRunes, //this pointer has both protorune1 and protorune2
        },
    ], [output, refundOutput], [], [
        protostone_1.ProtoStone.edicts({
            protocolTag: protocolTag,
            edicts: [
                {
                    amount: (0, integer_1.u128)(premineAmount),
                    id: new runeid_1.RuneId((0, integer_1.u64)(runeId1.block), (0, integer_1.u32)(runeId1.tx)),
                    output: (0, integer_1.u32)(5),
                },
            ],
        }),
        protostone_1.ProtoStone.message({
            protocolTag: protocolTag,
            pointer: protomessagePointer,
            refundPointer: protomessageRefundPointer,
            calldata,
        }),
    ], block, 2);
    return { block, runeId1, premineAmount };
}
//# sourceMappingURL=fixtures.js.map