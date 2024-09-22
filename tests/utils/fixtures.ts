import fs from "node:fs";

import * as path from "node:path";
import { expect } from "chai";
//@ts-ignore
import bitcoinjs = require("bitcoinjs-lib");
import {
  buildProgram,
  formatKv,
  TEST_BTC_ADDRESS1,
  TEST_BTC_ADDRESS2,
} from "metashrew-runes/lib/tests/utils/general";
import {
  initCompleteBlockWithRuneEtching,
  runesbyaddress,
} from "metashrew-runes/lib/tests/utils/rune-helpers";
import {
  constructProtoburnTransaction,
  constructProtostoneTx,
} from "./protoburn";
import { ProtoStone } from "../../src.ts/protostone";
import { u128, u64, u32 } from "@magiceden-oss/runestone-lib/dist/src/integer";
import { RuneId } from "@magiceden-oss/runestone-lib/dist/src/runeid";

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
export async function createProtoruneFixture(
  protocolTag: bigint,
  omitBurn: boolean = false,
  premineAmount: bigint = 2100000005000000n,
  {
    skip,
  }: {
    skip?: number;
  } = {
    skip: 0,
  },
  _block?: bitcoinjs.Block
) {
  const outputs = [
    {
      script: bitcoinjs.payments.p2pkh({
        address: TEST_BTC_ADDRESS1,
        network: bitcoinjs.networks.bitcoin,
      }).output,
      value: 1,
    },
    {
      script: bitcoinjs.payments.p2pkh({
        network: bitcoinjs.networks.bitcoin,
        address: TEST_BTC_ADDRESS2,
      }).output,
      value: 624999999,
    },
  ];
  const pointerToReceiveRunes = 1;

  // constructs tx 0 (coinbase) and tx 1 (rune etching)
  let block =
    _block ||
    initCompleteBlockWithRuneEtching(
      outputs,
      pointerToReceiveRunes,
      undefined,
      premineAmount,
      undefined /*name */,
      undefined /*symbol */,
      undefined /* block */,
      skip
    );
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


  const amount = premineAmount;

  const output = {
    address: TEST_BTC_ADDRESS2,
    btcAmount: 1, //this can be implied to be 1 since runes usually are just inscribed on a satoshi
  };
  // technically this is not a valid transaction since btc in and less than btc out but this is just to test the runes
  const refundOutput = {
    address: TEST_BTC_ADDRESS1,
    btcAmount: 0, // this gives address 1 his remaining bitcoin
  };

  // Constructing tx 2
  // output 0: runestone with protoburns
  // output 1-2: output, and refundOutput
  // This transaction does a protoburn and transfers all protorunes to output 2
  if (!omitBurn) {
    block = constructProtoburnTransaction(
      [input],
      [
        {
          id: runeId,
          amount: amount,
          output: 0, // output 0 is the runestone, which indicates a protoburn
        },
      ],
      /*outputIndexToReceiveProtorunes=*/ 1, //this goes to ADDRESS2
      [output, refundOutput], // 0 is script, 1 is address 2 output, 2 is address 1 output
      protocolTag,
      block,
      /*runeTransferPointer=*/ 2
    );
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

export async function createProtomessageFixture({
  protocolTag,
  protomessagePointer,
  protomessageRefundPointer,
}: {
  protocolTag: bigint;
  protomessagePointer: number;
  protomessageRefundPointer: number;
}) {
  let {
    block,
    output,
    refundOutput,
    runeId,
    pointerToReceiveRunes,
    premineAmount,
  } =
    // this fixture always assumes a protoburn and default values
    await createProtoruneFixture(protocolTag);

  const calldata = Buffer.from("testing 12345");

  // constructing tx 3: protomessage
  // right now, address 2 has all the protorunes. we want to forward everything to the pointer
  block = constructProtostoneTx(
    [
      {
        inputTxHash: block.transactions?.at(2)?.getHash(), //protoburn is at tx2
        inputTxOutputIndex: pointerToReceiveRunes,
      },
    ],
    [output, refundOutput],
    [],
    [
      ProtoStone.edicts({
        protocolTag: protocolTag,
        edicts: [
          {
            amount: u128(premineAmount),
            id: new RuneId(u64(runeId.block), u32(runeId.tx)),
            output: u32(5),
          },
        ],
      }),
      ProtoStone.message({
        protocolTag: protocolTag,
        pointer: protomessagePointer,
        refundPointer: protomessageRefundPointer,
        calldata,
      }),
    ],
    block,
    2, // leftover protorunes go to output2, which is ADDRESS 1
  );

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
export async function createMultipleProtoruneFixture(
  protocolTag: bigint,
  omitBurn: boolean = false,
  premineAmount: bigint = 2100000005000000n,
  {
    skip,
  }: {
    skip?: number;
  } = {
    skip: 0,
  },
  _block?: bitcoinjs.Block,
) {
  const outputs = [
    {
      script: bitcoinjs.payments.p2pkh({
        address: TEST_BTC_ADDRESS1,
        network: bitcoinjs.networks.bitcoin,
      }).output,
      value: 1,
    },
    {
      script: bitcoinjs.payments.p2pkh({
        network: bitcoinjs.networks.bitcoin,
        address: TEST_BTC_ADDRESS2,
      }).output,
      value: 624999999,
    },
  ];
  const pointerToReceiveRunes = 1;

  // constructs tx 0 (coinbase) and tx 1 (rune etching)
  let block =
    _block ||
    initCompleteBlockWithRuneEtching(
      outputs,
      pointerToReceiveRunes,
      undefined,
      premineAmount,
      undefined /*name */,
      undefined /*symbol */,
      undefined /* block */,
      skip,
    );
  const runeId1 = {
    block: 840000n,
    tx: 1,
  };

  // tx 2 is another rune etching
  block = initCompleteBlockWithRuneEtching(
    outputs,
    pointerToReceiveRunes,
    undefined,
    premineAmount,
    "GENESIS•RUNE•TWO" /*name */,
    "H" /*symbol */,
    block /* block */,
    skip,
  );
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
    address: TEST_BTC_ADDRESS2,
    btcAmount: 1, //this can be implied to be 1 since runes usually are just inscribed on a satoshi
  };
  // technically this is not a valid transaction since btc in and less than btc out but this is just to test the runes
  const refundOutput = {
    address: TEST_BTC_ADDRESS1,
    btcAmount: 0, // this gives address 1 his remaining bitcoin
  };

  // Constructing tx 3
  // output 0: runestone with protoburns
  // output 1-2: output, and refundOutput
  // This transaction does a protoburn and transfers all protorunes to output 2
  if (!omitBurn) {
    block = constructProtoburnTransaction(
      inputs,
      [
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
      protocolTag,
      block,
      /*runeTransferPointer=*/ 0,
    );
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
 * This fixture uses the createMultipleProtoruneFixture and transfers the
 *
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
export async function createMultipleProtomessageFixture({
  protocolTag,
  protomessagePointer,
  protomessageRefundPointer,
  calldata,
  amount1,
  amount2,
}: {
  protocolTag: bigint;
  protomessagePointer: number;
  protomessageRefundPointer: number;
  calldata: Buffer;
  amount1: bigint;
  amount2: bigint;
}) {
  let {
    block,
    output,
    refundOutput,
    runeId1,
    runeId2,
    pointerToReceiveRunes,
    premineAmount,
  } =
    // this fixture always assumes a protoburn and default values
    await createMultipleProtoruneFixture(protocolTag);

  const edicts = [];
  if (amount1) {
    edicts.push({
      amount: u128(amount1),
      id: new RuneId(u64(runeId1.block), u32(runeId1.tx)),
      output: u32(5),
    });
  }
  if (amount2) {
    edicts.push({
      amount: u128(amount2),
      id: new RuneId(u64(runeId2.block), u32(runeId2.tx)),
      output: u32(5),
    });
  }
  // constructing tx 4: protomessage
  // right now, address 2 has all the protorunes. we want to forward everything to the pointer
  block = constructProtostoneTx(
    [
      {
        inputTxHash: block.transactions?.at(3)?.getHash(), //protoburn is at tx3
        inputTxOutputIndex: pointerToReceiveRunes, //this pointer has both protorune1 and protorune2
      },
    ],
    [output, refundOutput],
    [],
    [
      ProtoStone.edicts({
        protocolTag: protocolTag,
        edicts: edicts,
      }),
      ProtoStone.message({
        protocolTag: protocolTag,
        pointer: protomessagePointer,
        refundPointer: protomessageRefundPointer,
        calldata,
      }),
    ],
    block,
    2, // leftover protorunes go to output2, which is ADDRESS 1
  );

  return { block, runeId1, premineAmount };
}
