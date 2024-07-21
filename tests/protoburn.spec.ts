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

describe("protoburns", () => {
  it("should index full protoburn, where edict target and pointer point to the protoburn", async () => {
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
    const output = {
      address: TEST_BTC_ADDRESS2,
      btcAmount: 1, //this can be implied to be 1 since runes usually are just inscribed on a satoshi
    };
    // technically this is not a valid transaction since btc in and less than btc out but this is just to test the runes
    const refundOutput = {
      address: TEST_BTC_ADDRESS1,
      btcAmount: 0, // this gives address 1 his remaining bitcoin
    };

    // output 0: runestone with protoburns
    // output 1-2: output, and refundOutput
    // output 3: virtual output -- output of the protoburn
    // This transaction does a protoburn and transfers all protorunes to output 2
    block = constructProtoburnTransaction(
      [input],
      [
        {
          id: runeId,
          amount: amount,
          output: 3, // output 3 is the "virtual" output corresponding to the first protoburn
        },
      ],
      /*outputIndexToReceiveProtorunes=*/ 2, //this goes to the refundOutput
      [output, refundOutput], // 0 is script, 1 is address 2 output, 2 is address 1 output, 3 is virtual output for first protoburn
      TEST_PROTOCOL_TAG,
      block,
      /*runeTransferPointer=*/ 3,
    );

    program.setBlock(block.toHex());

    await program.run("_start");

    const resultAddress1 = await runesbyaddress(program, TEST_BTC_ADDRESS1);
    expect(resultAddress1.balanceSheet.length).equals(
      0,
      "address 1 should not have any runes left",
    );
    const resultAddress2 = await runesbyaddress(program, TEST_BTC_ADDRESS2);
    expect(resultAddress2.balanceSheet.length).equals(
      0,
      "address 2 should not have received any runes",
    );

    const protorunesAddress2 = await protorunesbyaddress(
      program,
      TEST_BTC_ADDRESS2,
      TEST_PROTOCOL_TAG,
    );
    expect(protorunesAddress2.balanceSheet.length).equals(
      0,
      "address 2 should not have any protorunes",
    );
    const protorunesAddress1 = await protorunesbyaddress(
      program,
      TEST_BTC_ADDRESS1,
      TEST_PROTOCOL_TAG,
    );
    console.log(protorunesAddress1);
    expect(protorunesAddress1.balanceSheet[0].balance).equals(
      premineAmount,
      "address 1 should now have all the protorunes",
    );
  });
  it("should index full protoburn where edict points to protoburn but pointer points to another address", async () => {
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
    const amount = premineAmount / 3n;
    const amountLeftover = premineAmount - amount;
    const outputIndexToReceiveProtorunes = 1; // 0 is the runestone, 1 is ADDRESS2, 2 is ADDRESS1
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
      [
        {
          id: runeId,
          amount: amount,
          output: 3, // output 3 is the "virtual" output corresponding to the first protoburn
        },
      ],
      outputIndexToReceiveProtorunes,
      [output, refundOutput], // 0 is script, 1 is output 2, 2 is output 1, 3 is virtual protoburn
      TEST_PROTOCOL_TAG,
      block,
      /*runeTransferPointer=*/ 1,
    );

    program.setBlock(block.toHex());

    await program.run("_start");

    const resultAddress1 = await runesbyaddress(program, TEST_BTC_ADDRESS1);
    expect(resultAddress1.balanceSheet.length).equals(
      0,
      "address 1 should not have any runes left",
    );
    const resultAddress2 = await runesbyaddress(program, TEST_BTC_ADDRESS2);
    expect(resultAddress2.balanceSheet[0].balance).equals(
      amountLeftover,
      "address 2 should have received leftover runes",
    );

    const protorunesAddress2 = await protorunesbyaddress(
      program,
      TEST_BTC_ADDRESS2,
      TEST_PROTOCOL_TAG,
    );
    console.log(protorunesAddress2);
    expect(protorunesAddress2.balanceSheet[0].balance).equals(
      amount,
      "address 2 should now have the protorunes sent to protoburn through edict",
    );
  });
  it("should index full protoburn where edict points to another address but pointer points to protoburn", async () => {
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
    const amount = premineAmount / 3n;
    const amountLeftover = premineAmount - amount;
    const outputIndexToReceiveProtorunes = 1; // 0 is the runestone, 1 is ADDRESS2, 2 is ADDRESS1
    const output = {
      address: TEST_BTC_ADDRESS2,
      btcAmount: 1, //this can be implied to be 1 since runes usually are just inscribed on a satoshi
    };
    const refundOutput = {
      address: TEST_BTC_ADDRESS1,
      btcAmount: 0, // this gives address 1 his remaining bitcoin
    };

    // is partial allowed?
    block = constructProtoburnTransaction(
      [input],
      [
        {
          id: runeId,
          amount: amount,
          output: 1, // output 1 is ADDRESS2 
        },
      ],
      outputIndexToReceiveProtorunes,
      [output, refundOutput],
      TEST_PROTOCOL_TAG,
      block,
      /*runeTransferPointer=*/ 3,
    );

    program.setBlock(block.toHex());

    await program.run("_start");

    const resultAddress1 = await runesbyaddress(program, TEST_BTC_ADDRESS1);
    expect(resultAddress1.balanceSheet.length).equals(
      0,
      "address 1 should not have any runes left",
    );
    const resultAddress2 = await runesbyaddress(program, TEST_BTC_ADDRESS2);
    expect(resultAddress2.balanceSheet[0].balance).equals(
      amount,
      "address 2 should have received transferred runes",
    );

    const protorunesAddress2 = await protorunesbyaddress(
      program,
      TEST_BTC_ADDRESS2,
      TEST_PROTOCOL_TAG,
    );
    console.log(protorunesAddress2);
    expect(protorunesAddress2.balanceSheet[0].balance).equals(
      amountLeftover,
      "address 2 should now have the protorunes left over from the transfer",
    );
  });
});
