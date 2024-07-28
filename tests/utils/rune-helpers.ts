//@ts-ignore
import bitcoinjs = require("bitcoinjs-lib");
import { encodeRunestone } from "@magiceden-oss/runestone-lib";
import { IndexerProgram, readArrayBufferAsHex } from "metashrew-test";
import { MetashrewRunes } from "../../src.ts/rpc";
import {
  buildCoinbaseToAddress,
  buildDefaultBlock,
  buildTransaction,
} from "./block-helpers";
import { EMPTY_BUFFER, EMPTY_WITNESS, TEST_BTC_ADDRESS1 } from "./general";

export const runesbyaddress = async (
  program: IndexerProgram,
  address: string,
): Promise<any> => {
  const cloned = program; // just mutate it
  const result = await MetashrewRunes.prototype.runesbyaddress.call(
    {
      async _call({ input }) {
        cloned.setBlock(input);
        const ptr = await cloned.run("runesbyaddress");
        return readArrayBufferAsHex(cloned.memory, ptr);
      },
    },
    { address },
  );
  return result;
};

export const initCompleteBlockWithRuneEtching = (
  outputs: any,
  pointer: number,
  divisibility: number = 8,
  premineAmount: bigint = 2100000005000000n,
  runeName: string = "GENESIS•RUNE•FR",
  symbol: string = "G",
  block?: bitcoinjs.Block,
): bitcoinjs.Block => {
  let coinbase;
  if (block == undefined) {
    block = buildDefaultBlock();
    coinbase = buildCoinbaseToAddress(TEST_BTC_ADDRESS1);
    block.transactions?.push(coinbase);
  } else {
    coinbase = block.transactions?.at(0);
  }
  const runesGenesis = encodeRunestone({
    etching: {
      divisibility: divisibility,
      premine: premineAmount,
      runeName: runeName,
      symbol: symbol,
    },
    pointer: pointer,
  }).encodedRunestone;
  const transaction = buildTransaction(
    [
      {
        hash: coinbase.getHash(),
        index: 0,
        witness: EMPTY_WITNESS,
        script: EMPTY_BUFFER,
      },
    ],
    [
      {
        script: runesGenesis,
        value: 0,
      },
      ...outputs,
    ],
  );
  block.transactions?.push(transaction);
  return block;
};

export const transferRune = (
  inputs: {
    inputTxHash: Buffer | undefined;
    inputTxOutputIndex: number;
  }[],
  runeId: {
    block: bigint;
    tx: number;
  },
  runeTransferAmount: bigint,
  outputIndexToReceiveRunes: number,
  outputs: {
    address: string;
    btcAmount: number;
  }[],
  outputRunePointer: number = 1, // default output for leftover runes
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
      output: outputIndexToReceiveRunes,
    },
  ];
  const runesTransfer = encodeRunestone({
    edicts: edicts,
    pointer: outputRunePointer,
  }).encodedRunestone;
  const transaction = buildTransaction(
    [...blockInputs],
    [
      {
        script: runesTransfer,
        value: 0,
      },
      ...blockOutputs,
    ],
  );
  block.transactions?.push(transaction);
  return block;
};

export const transferRuneMultiple = (
  inputs: {
    inputTxHash: Buffer | undefined;
    inputTxOutputIndex: number;
  }[],
  runeId: {
    block: bigint;
    tx: number;
  }[],
  runeTransferAmount: bigint[],
  outputIndexToReceiveRunes: number[],
  outputs: {
    address: string;
    btcAmount: number;
  }[],
  outputRunePointer: number, // default output for leftover runes
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
  const edicts = runeId.map((d, i) => ({
    id: d,
    amount: runeTransferAmount[i],
    output: outputIndexToReceiveRunes[i],
  }));
  const runesTransfer = encodeRunestone({
    edicts: edicts,
    pointer: outputRunePointer,
  }).encodedRunestone;
  const transaction = buildTransaction(
    [...blockInputs],
    [
      {
        script: runesTransfer,
        value: 0,
      },
      ...blockOutputs,
    ],
  );
  block.transactions?.push(transaction);
  return block;
};
