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
import { constructProtoburnTransaction } from "./utils/protoburn";
import { protorunesbyaddress } from "./utils/view-helpers";
import { DEBUG_WASM } from "./utils/general";
import { uint128 } from "../src.ts/proto/protorune";

// const TEST_PROTOCOL_TAG = parseInt("0x112233445566778899aabbccddeeff10", 16);
const TEST_PROTOCOL_TAG = BigInt("0x400000000000000000");
console.log(TEST_PROTOCOL_TAG.toString(10));

describe("protoburns", () => {
  it("should index full protoburn", async () => {
    const program = buildProgram(DEBUG_WASM);
    program.setBlockHeight(840000);
    const premineAmount = 2100000005000000n;
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
    const outputIndexToReceiveRunes = 2; // 0 is the runestone, 1 is protoburn, 2 is ADDRESS2
    const output = {
      address: TEST_BTC_ADDRESS2,
      btcAmount: 1, //this can be implied to be 1 since runes usually are just inscribed on a satoshi
    };
    // technically this is not a valid transaction since btc in and less than btc out but this is just to test the runes
    const refundOutput = {
      address: TEST_BTC_ADDRESS1,
      btcAmount: 0, // this gives address 1 his remaining bitcoin
    };

    // is partial allowed?
    block = constructProtoburnTransaction(
      [input],
      runeId,
      amount,
      outputIndexToReceiveRunes,
      [output, refundOutput],
      TEST_PROTOCOL_TAG,
      block,
    );

    program.setBlock(block.toHex());

    await program.run("_start");

    const resultAddress1 = await runesbyaddress(program, TEST_BTC_ADDRESS1);
    expect(resultAddress1.balanceSheet.length).equals(
      0,
      "address 1 should not have any runes left",
    );
    const resultAddress2 = await runesbyaddress(program, TEST_BTC_ADDRESS2);
    //address 2 gets the runes that are burned @TODO: write part out that makes the rune balances 0 from that point
    // expect(resultAddress2.balanceSheet.length).equals(
    //   0,
    //   "address 2 should not have received any runes",
    // );

    const protorunesAddress2 = await protorunesbyaddress(
      program,
      TEST_BTC_ADDRESS2,
      TEST_PROTOCOL_TAG,
    );
    console.log(protorunesAddress2);
    console.log(formatKv(program.kv));
    expect(protorunesAddress2.balanceSheet[0].balance).equals(
      premineAmount,
      "address 2 should now have all the protorunes",
    );
  });
});
