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
import {
  constructProtomessageTransaction,
  constructProtomessageBlockWithProtoburn,
} from "./utils/protomessage";

// const TEST_PROTOCOL_TAG = parseInt("0x112233445566778899aabbccddeeff10", 16);
const TEST_PROTOCOL_TAG = BigInt("0x400000000000000000");

describe("protomessage", () => {
  it("should index protomessage in the same tx as protoburn", async () => {
    // ================================
    // TODO: Create a fixture from here
    // ================================
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

    // output 0 is runestone, output 1 is protoburn, output 2 is protomessage
    // this method transfers all remaining runes to the protoburn
    const pointer = 3;
    const refundPointer = 4;
    block = constructProtomessageBlockWithProtoburn(
      [input],
      runeId,
      amount,
      [output, refundOutput],
      TEST_PROTOCOL_TAG,
      [
        {
          calldata: Buffer.from("1111"),
          pointer: pointer,
          refundPointer: refundPointer,
        },
      ],
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
    expect(resultAddress2.balanceSheet.length).equals(
      0,
      "address 2 should not have received any runes",
    );

    // since no calldata was specified, the protomessage should send all protorunes to refundpointer
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
    expect(protorunesAddress1.balanceSheet[0].balance).equals(
      premineAmount,
      "address 1 should now have all the protorunes",
    );
  });
  it("should index protomessage", async () => {
    // ================================
    // TODO: Create a fixture from here
    // ================================
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

    const edicts = [{
      id: runeId,
      amount: amount,
      output: 1
    }]


    // ================================
    // TODO: to here
    // ================================

    // tx 0 is the coinbase, tx 1 is the rune etching, tx 2 is the protoburn, tx 3 is the protomessage
    const protorunesOutputIdx = 2;
    block = constructProtoburnTransaction(
      [input],
      edicts,
      outputIndexToReceiveProtorunes,
      [output, refundOutput],
      TEST_PROTOCOL_TAG,
      block,
    );

    // tx 3: output 0 is protorunestone, output 1 is protomessage, output 2 is TEST_BTC_ADDRESS2, output 3 is TEST_BTC_ADDRESS1
    const pointer = 2;
    const refundPointer = 3;
    block = constructProtomessageTransaction(
      [
        {
          inputTxHash: block.transactions?.at(2)?.getHash(),
          inputTxOutputIndex: protorunesOutputIdx,
        },
      ],
      [output, refundOutput],
      TEST_PROTOCOL_TAG,
      [
        {
          calldata: Buffer.from("1111"),
          pointer: pointer,
          refundPointer: refundPointer,
        },
      ],
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
    expect(resultAddress2.balanceSheet.length).equals(
      0,
      "address 2 should not have received any runes",
    );

    // since no calldata was specified, the protomessage should send all protorunes to refundpointer
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
    expect(protorunesAddress1.balanceSheet[0].balance).equals(
      premineAmount,
      "address 1 should now have all the protorunes",
    );
  });
  it("should index protomessage in the same tx as protoburn with chaining protomessages", async () => {
    // ================================
    // TODO: Create a fixture from here
    // ================================
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

    // output 0 is runestone, output 1 is protoburn, output [2-4] is protomessage, 5 is TEST_BTC_ADDRESS2, 6 is TEST_BTC_ADDRESS1
    // this method transfers all remaining runes to the protoburn
    block = constructProtomessageBlockWithProtoburn(
      [input],
      runeId,
      amount,
      [output, refundOutput],
      TEST_PROTOCOL_TAG,
      [
        {
          calldata: Buffer.from("1111"),
          pointer: 10,
          refundPointer: 4,
        },
        {
          calldata: Buffer.from("1111"),
          pointer: 11,
          refundPointer: 6,
        },
        {
          calldata: Buffer.from("1111"),
          pointer: 12,
          refundPointer: 3,
        },
      ],
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
    expect(resultAddress2.balanceSheet.length).equals(
      0,
      "address 2 should not have received any runes",
    );

    // since no calldata was specified, the protomessage should send all protorunes to refundpointer
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
    expect(protorunesAddress1.balanceSheet[0].balance).equals(
      premineAmount,
      "address 1 should now have all the protorunes",
    );
  });
  it("should index protomessage chaining into more protomessages", async () => {
    // ================================
    // TODO: Create a fixture from here
    // ================================
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

    // tx 0 is the coinbase, tx 1 is the rune etching, tx 2 is the protoburn, tx 3 is the protomessage
    const protorunesOutputIdx = 2;
    block = constructProtoburnTransaction(
      [input],
      runeId,
      amount,
      outputIndexToReceiveProtorunes,
      [output, refundOutput],
      TEST_PROTOCOL_TAG,
      block,
    );

    // tx 3: output 0 is protorunestone, output 1-3 is protomessage, output 4 is TEST_BTC_ADDRESS2, output 5 is TEST_BTC_ADDRESS1
    block = constructProtomessageTransaction(
      [
        {
          inputTxHash: block.transactions?.at(2)?.getHash(),
          inputTxOutputIndex: protorunesOutputIdx,
        },
      ],
      [output, refundOutput],
      TEST_PROTOCOL_TAG,
      [
        {
          // output 1
          calldata: Buffer.from("1111"),
          pointer: 10, // output larger than total ouputs
          refundPointer: 2,
        },
        {
          // output 2
          calldata: Buffer.from("1111"),
          pointer: 11,
          refundPointer: 3,
        },
        {
          // output 3
          calldata: Buffer.from("1111"),
          pointer: 11,
          refundPointer: 5,
        },
      ],
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
    expect(resultAddress2.balanceSheet.length).equals(
      0,
      "address 2 should not have received any runes",
    );

    // since no calldata was specified, the protomessage should send all protorunes to refundpointer
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
    expect(protorunesAddress1.balanceSheet[0].balance).equals(
      premineAmount,
      "address 1 should now have all the protorunes",
    );
  });
});
