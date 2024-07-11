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

export const constructProtoburnTransaction = (
  inputs: {
    inputTxHash: Buffer | undefined;
    inputTxOutputIndex: number;
  }[],
  runeId: {
    block: bigint;
    tx: number;
  },
  runeTransferAmount: bigint,
  outputIndexToReceiveProtorunes: number,
  outputs: {
    address: string;
    btcAmount: number;
  }[],
  protocolTag: bigint,
  block?: bitcoinjs.Block,
  runeTransferEdictTarget: number = 1,
  runeTransferPointer: number = 1,
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
      output: runeTransferEdictTarget, // default targets the protoburn output
    },
  ];

  const runesTransfer = encodeRunestone({
    edicts: edicts,
    pointer: runeTransferPointer, // default output for leftover runes, default goes to the protoburn
  }).encodedRunestone;
  const protoburn = ProtoStone.burn({
    protocolTag: protocolTag,
    pointer: outputIndexToReceiveProtorunes,
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
      ...blockOutputs,
    ],
  );
  block.transactions?.push(transaction);
  return block;
};
