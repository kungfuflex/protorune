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
import { encodeRunestone } from "@magiceden-oss/runestone-lib";
import { ProtoRunestone } from "../../lib/protorunestone";
import { Some } from "@magiceden-oss/runestone-lib/dist/src/monads";
import { u128 } from "@magiceden-oss/runestone-lib/dist/src/integer";

export const constructProtomessageBlockWithProtoburn = (
  inputs: {
    inputTxHash: Buffer | undefined;
    inputTxOutputIndex: number;
  }[],
  runeId: {
    block: bigint;
    tx: number;
  },
  runeTransferAmount: bigint,
  outputs: {
    address: string;
    btcAmount: number;
  }[],
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
  const edicts = [
    {
      id: runeId,
      amount: runeTransferAmount,
      output: 1, // targets the protoburn output
    },
  ];

  const runesTransfer = encodeRunestone({
    edicts: edicts,
    pointer: 1, // default output for leftover runes, default goes to the protoburn
  }).encodedRunestone;

  const protoburn = ProtoStone.burn({
    protocolTag: protocolTag,
    pointer: 2, // target the protomessage
  });

  const protomessage = ProtoStone.message({
    protocolTag: protocolTag,
    ...message,
  });

  const transaction = buildTransaction(
    [...blockInputs],
    [
      {
        script: runesTransfer,
        value: 0,
      },
      {
        script: protoburn.encipher(),
        value: 0,
      },
      {
        script: protomessage.encipher(),
        value: 0,
      },
      ...blockOutputs,
    ],
  );
  block.transactions?.push(transaction);
  return block;
};

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
  console.log(message);
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
    ...message,
  });

  const transaction = buildTransaction(
    [...blockInputs],
    [
      {
        script: new ProtoRunestone({
          pointer: Some(u128(1)),
          edicts: [],
          protocolTag: u128(protocolTag),
        }).encipher(),
        value: 0,
      },
      {
        script: protomessage.encipher(),
        value: 0,
      },
      ...blockOutputs,
    ],
  );
  block.transactions?.push(transaction);
  return block;
};
