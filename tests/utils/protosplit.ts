import { ProtoStone, protosplit } from "../../src.ts/protostone";
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

export const constructProtosplitTransaction = (
  inputs: {
    inputTxHash: Buffer | undefined;
    inputTxOutputIndex: number;
  }[],
  outputs: {
    address: string;
    btcAmount: number;
  }[],
  protocolTag: bigint,
  messages: {
    calldata: Buffer;
    pointer: number;
    refundPointer: number;
  }[],
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

  let voutStart = 1;

  const protostones: ProtoStone[] = [];
  messages.forEach((message, idx) => {
    const protomessage = ProtoStone.message({
      protocolTag: protocolTag,
      ...message,
    });

    const { protostone, chunks } = protosplit(protomessage, voutStart);
    voutStart += chunks.length + 1;

    protostones.push(protostone);
    protostones.push(...chunks);
  });

  console.log(protostones);

  const transaction = buildTransaction(
    [...blockInputs],
    [
      {
        script: new ProtoRunestone({
          pointer: Some(u128(3)),
          edicts: [],
          protocolTag: u128(protocolTag),
        }).encipher(),
        value: 0,
      },
      ...blockOutputs,
      ...protostones.map((protostone) => {
        return {
          script: protostone.encipher(),
          value: 0,
        };
      }),
    ],
  );
  block.transactions?.push(transaction);
  return block;
};
