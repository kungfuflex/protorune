import { ProtoStone } from "../../src.ts/protostone";
import {
  buildCoinbaseToAddress,
  buildDefaultBlock,
  buildTransaction,
} from "metashrew-runes/lib/tests/utils/block-helpers";

//@ts-ignore
import bitcoinjs = require("bitcoinjs-lib");
import {
  EMPTY_BUFFER,
  EMPTY_WITNESS,
  TEST_BTC_ADDRESS1,
} from "metashrew-runes/lib/tests/utils/general";
import { encodeRunestoneProtostone } from "../../src.ts/runestone_protostone_upgrade";
import { encodeRunestone } from "@magiceden-oss/runestone-lib";
import { ProtoRunestone } from "../../src.ts/protorunestone";
import { Some } from "@magiceden-oss/runestone-lib/dist/src/monads";
import { u128, u64, u32 } from "@magiceden-oss/runestone-lib/dist/src/integer";
import { RuneId } from "@magiceden-oss/runestone-lib/dist/src/runeid";

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

export const constructProtomessageBlock = (
  inputs: {
    inputTxHash: Buffer | undefined;
    inputTxOutputIndex: number;
  }[],
  outputs: {
    address: string;
    btcAmount: number;
  }[],
  {
    runeId,
    amount,
  }: {
    runeId: {
      block: bigint;
      tx: number;
    };
    amount: bigint;
  },
  protocolTag: bigint,
  message: {
    calldata: Buffer;
    pointer: number;
    refundPointer: number;
  },
  block?: bitcoinjs.Block,
): bitcoinjs.Block => {
  if (block == undefined) {
    block = buildDefaultBlock();
    const coinbase = buildCoinbaseToAddress(TEST_BTC_ADDRESS1);
    block.transactions?.push(coinbase);
  }
  const blockInputs = inputs.map((input) => {
    return {
      hash: input.inputTxHash,
      index: input.inputTxOutputIndex,
      witness: EMPTY_WITNESS,
      script: EMPTY_BUFFER,
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

  const protomessage = ProtoStone.message({
    protocolTag: protocolTag,
    edicts: [
      {
        id: new RuneId(u64(runeId.block), u32(runeId.tx)),
        amount: u128(amount),
        output: u32(0),
      },
    ],
    ...message,
  });

  const protorunestone = encodeRunestoneProtostone({
    protostones: [protomessage],
  });

  const transaction = buildTransaction(
    [...blockInputs],
    [
      {
        script: protorunestone,
        value: 0,
      },
      ...blockOutputs,
    ],
  );
  block.transactions?.push(transaction);
  return block;
};
