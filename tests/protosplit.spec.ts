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
import { constructProtosplitTransaction } from "./utils/protosplit";

// const TEST_PROTOCOL_TAG = parseInt("0x112233445566778899aabbccddeeff10", 16);
const TEST_PROTOCOL_TAG = BigInt("0x400000000000000000");

describe("protosplit", () => {
  it("should index protosplit", async () => {
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

    const edicts = [
      {
        id: runeId,
        amount: amount,
        output: 1,
      },
    ];

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

    // tx 3:
    //  - output 0 is protorunestone
    //  - output 1 is TEST_BTC_ADDRESS2
    //  - output 2 is TEST_BTC_ADDRESS1
    //  - output 3 is protosplit
    //  - output 4-n is chunks
    block = constructProtosplitTransaction(
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
          // 200 bytes, numbered 1 to 200 (in hex)
          calldata: Buffer.from(
            "00102030405060708090a0b0c0d0e0f0101112131415161718191a1b1c1d1e1f202122232425262728292a2b2c2d2e2f303132333435363738393a3b3c3d3e3f404142434445464748494a4b4c4d4e4f505152535455565758595a5b5c5d5e5f606162636465666768696a6b6c6d6e6f707172737475767778797a7b7c7d7e7f808182838485868788898a8b8c8d8e8f909192939495969798999a9b9c9d9e9fa0a1a2a3a4a5a6a7a8a9aaabacadaeafb0b1b2b3b4b5b6b7b8b9babbbcbdbebfc0c1c2c3c4c5c6c7",
          ),
          pointer: 1,
          refundPointer: 2,
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
