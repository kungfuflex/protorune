"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.constructProtomessageBlock = void 0;
const protostone_1 = require("../../src.ts/protostone");
const block_helpers_1 = require("metashrew-runes/lib/tests/utils/block-helpers");
//@ts-ignore
const bitcoinjs = require("bitcoinjs-lib");
const general_1 = require("metashrew-runes/lib/tests/utils/general");
const runestone_protostone_upgrade_1 = require("../../src.ts/runestone_protostone_upgrade");
const integer_1 = require("@magiceden-oss/runestone-lib/dist/src/integer");
const runeid_1 = require("@magiceden-oss/runestone-lib/dist/src/runeid");
// export const constructProtomessageBlockWithProtoburn = (
//   inputs: {
//     inputTxHash: Buffer | undefined;
//     inputTxOutputIndex: number;
//   }[],
//   runeId: {
//     block: bigint;
//     tx: number;
//   },
//   runeTransferAmount: bigint,
//   outputs: {
//     address: string;
//     btcAmount: number;
//   }[],
//   protocolTag: bigint,
//   message: {
//     calldata: Buffer;
//     pointer: number;
//     refundPointer: number;
//   },
//   block?: bitcoinjs.Block,
// ): bitcoinjs.Block => {
//   if (block == undefined) {
//     block = buildDefaultBlock();
//     const coinbase = buildCoinbaseToAddress(TEST_BTC_ADDRESS1);
//     block.transactions?.push(coinbase);
//   }
//   const blockInputs = inputs.map((input) => {
//     return {
//       hash: input.inputTxHash,
//       index: input.inputTxOutputIndex,
//       witness: EMPTY_WITNESS,
//       script: EMPTY_BUFFER,
//     };
//   });
//   const blockOutputs = outputs.map((output) => {
//     return {
//       script: bitcoinjs.payments.p2pkh({
//         address: output.address,
//         network: bitcoinjs.networks.bitcoin,
//       }).output,
//       value: output.btcAmount,
//     };
//   });
//   const edicts = [
//     {
//       id: runeId,
//       amount: runeTransferAmount,
//       output: 1, // targets the protoburn output
//     },
//   ];
//   const runesTransfer = encodeRunestone({
//     edicts: edicts,
//     pointer: 1, // default output for leftover runes, default goes to the protoburn
//   }).encodedRunestone;
//   const protoburn = ProtoStone.burn({
//     protocolTag: protocolTag,
//     pointer: 2, // target the protomessage
//   });
//   const protomessage = ProtoStone.message({
//     protocolTag: protocolTag,
//     ...message,
//   });
//   const transaction = buildTransaction(
//     [...blockInputs],
//     [
//       {
//         script: runesTransfer,
//         value: 0,
//       },
//       {
//         script: protoburn.encipher(),
//         value: 0,
//       },
//       {
//         script: protomessage.encipher(),
//         value: 0,
//       },
//       ...blockOutputs,
//     ],
//   );
//   block.transactions?.push(transaction);
//   return block;
// };
const constructProtomessageBlock = (inputs, outputs, { runeId, amount, }, protocolTag, message, block) => {
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
    const protomessage = protostone_1.ProtoStone.message({
        protocolTag: protocolTag,
        edicts: [
            {
                id: new runeid_1.RuneId((0, integer_1.u64)(runeId.block), (0, integer_1.u32)(runeId.tx)),
                amount: (0, integer_1.u128)(amount),
                output: (0, integer_1.u32)(0),
            },
        ],
        ...message,
    });
    const protorunestone = (0, runestone_protostone_upgrade_1.encodeRunestoneProtostone)({
        protostones: [protomessage],
    });
    const transaction = (0, block_helpers_1.buildTransaction)([...blockInputs], [
        {
            script: protorunestone,
            value: 0,
        },
        ...blockOutputs,
    ]);
    block.transactions?.push(transaction);
    return block;
};
exports.constructProtomessageBlock = constructProtomessageBlock;
//# sourceMappingURL=protomessage.js.map