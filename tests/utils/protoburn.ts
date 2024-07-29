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
  block: bitcoinjs.Block,
  runeTransferPointer: number,
): bitcoinjs.Block => {
  const protoburn = ProtoStone.burn({
    protocolTag: protocolTag,
    pointer: outputIndexToReceiveProtorunes,
  });
  return constructProtostoneTx(
    inputs,
    outputs,
    edicts,
    [protoburn],
    block,
    runeTransferPointer,
  );
};

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
export const constructProtostoneTx = (
  inputs: {
    inputTxHash: Buffer | undefined;
    inputTxOutputIndex: number;
  }[],
  outputs: {
    address: string;
    btcAmount: number;
  }[],
  edicts?: {
    id: {
      block: bigint;
      tx: number;
    };
    amount: bigint;
    output: number;
  }[],
  protostones?: ProtoStone[],
  block?: bitcoinjs.Block,
  runeTransferPointer?: number,
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
  const runestone = encodeRunestoneProtostone({
    edicts: edicts,
    pointer: runeTransferPointer, // default output for leftover runes, default goes to the protoburn
    protostones: protostones,
  }).encodedRunestone;

  const transaction = buildTransaction(
    [...blockInputs],
    [
      {
        script: runestone,
        value: 0,
      },
      ...blockOutputs,
    ],
  );
  block.transactions?.push(transaction);
  return block;
};
