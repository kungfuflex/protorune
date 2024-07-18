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

/**
 * Outputs
 *  - [0-n): outputs (regular p2pkh) defined by outputs
 *  - [n]: runestone with protostones inside
 *  - (n, m): these are pointers that don't actually exist, but are used to target the specific protostone by edicts
 *
 *
 * @param inputs
 * @param edicts
 * @param outputIndexToReceiveProtorunes
 * @param outputs p2pkh outputs
 * @param protocolTag
 * @param block
 * @param runeTransferPointer
 * @returns
 */
export const constructProtoburnTransaction = (
  inputs: {
    inputTxHash: Buffer | undefined;
    inputTxOutputIndex: number;
  }[],
  edicts: {
    id: {
      block: bigint;
      tx: number;
    };
    amount: bigint;
    output: number;
  }[],
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
  const protoburn = ProtoStone.burn({
    protocolTag: protocolTag,
    pointer: outputIndexToReceiveProtorunes,
  });
  const runestone = encodeRunestoneProtostone({
    edicts: edicts,
    pointer: runeTransferPointer, // default output for leftover runes, default goes to the protoburn
    protostones: [protoburn],
  }).encodedRunestone;

  const transaction = buildTransaction(
    [...blockInputs],
    [
      ...blockOutputs,
      {
        script: runestone,
        value: 0,
      },
    ],
  );
  block.transactions?.push(transaction);
  return block;
};
