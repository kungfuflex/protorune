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
  buildCoinbaseToAddress,
  buildDefaultBlock,
} from "metashrew-runes/lib/tests/utils/block-helpers";
import { constructProtoburnTransaction } from "./protoburn";
import { protorunesbyaddress, runtime } from "./view-helpers";
import { DEBUG_WASM } from "./general";
import { uint128 } from "../../src.ts/proto/protorune";
import { constructProtostoneTx } from "./protoburn";
import { constructProtomessageBlock } from "./protomessage";
import { ProtoStone } from "../../src.ts/protostone";
import { u128, u64, u32 } from "@magiceden-oss/runestone-lib/dist/src/integer";
import { RuneId } from "@magiceden-oss/runestone-lib/dist/src/runeid";

// const TEST_PROTOCOL_TAG = parseInt("0x112233445566778899aabbccddeeff10", 16);
const TEST_PROTOCOL_TAG = BigInt("0x400000000000000000");
export async function createProtoruneFixture(
  omitBurn: boolean = false,
  premineAmount: bigint = 2100000005000000n,
) {
  // ================================
  // TODO: Create a fixture from here
  // ================================
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
  const pointer1 = 1;
  let block = initCompleteBlockWithRuneEtching(
    outputs,
    pointer1,
    undefined,
    premineAmount,
  );
  const input = {
    inputTxHash: block.transactions?.at(1)?.getHash(), // 0 is coinbase, 1 is the mint
    inputTxOutputIndex: pointer1, // index of output in the input tx that has the runes. In this case it is the default pointer of the mint
  };
  const runeId = {
    block: 840000n,
    tx: 1,
  };
  const amount = premineAmount / 2n;
  const outputIndexToReceiveProtorunes = 2; // 0 is the runestone, 1 is protoburn, 2 is ADDRESS2
  const output = {
    address: TEST_BTC_ADDRESS2,
    btcAmount: 1, //this can be implied to be 1 since runes usually are just inscribed on a satoshi
  };
  // technically this is not a valid transaction since btc in and less than btc out but this is just to test the runes
  const refundOutput = {
    address: TEST_BTC_ADDRESS1,
    btcAmount: 0, // this gives address 1 his remaining bitcoin
  };
  // ================================
  // TODO: to here
  // ================================

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
          output: 0, // output 0 is the runestone. first edict corresponds to first protoburn
        },
      ],
      /*outputIndexToReceiveProtorunes=*/ 1, //this goes to the output
      [output, refundOutput], // 0 is script, 1 is address 2 output, 2 is address 1 output
      TEST_PROTOCOL_TAG,
      block,
      /*runeTransferPointer=*/ 0,
    );
  }
  return { input, block, output, refundOutput, runeId, premineAmount };
}
