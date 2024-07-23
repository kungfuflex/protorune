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
  buildTransaction,
  buildCoinbaseToAddress,
  buildDefaultBlock,
} from "metashrew-runes/lib/tests/utils/block-helpers";
import { constructProtoburnTransaction, constructProtostoneTx, constructRunestoneTx } from "./utils/protoburn";
import { protorunesbyaddress } from "./utils/view-helpers";
import { DEBUG_WASM } from "./utils/general";
import { uint128 } from "../src.ts/proto/protorune";
import { ProtoStone } from "../src.ts/protostone";
import { u128, u32, u64 } from "@magiceden-oss/runestone-lib/dist/src/integer";
import { RuneId } from "@magiceden-oss/runestone-lib/dist/src/runeid";

// const TEST_PROTOCOL_TAG = parseInt("0x112233445566778899aabbccddeeff10", 16);
const GENESIS_PROTOCOL_TAG = BigInt("20000024");
const GENESIS_PROTOBURN = Buffer.from("5d6d171601ff7f82b6e1e892a6c0a9841a00d4ea33aa02904e00", 'hex');

describe("protoburns", () => {
  it("should index full protoburn, where edict target and pointer point to the protoburn", async () => {
    const program = buildProgram(DEBUG_WASM);
    program.setBlockHeight(849236);
    const block = buildDefaultBlock();
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
    block.transactions.push(buildCoinbaseToAddress(TEST_BTC_ADDRESS1));
    Array(297).fill(0).forEach((_, i) => {
      block.transactions.push(buildCoinbaseToAddress(TEST_BTC_ADDRESS1));
    });
    const pointer1 = 1;
    initCompleteBlockWithRuneEtching(
      outputs,
      pointer1,
      1,
      premineAmount,
      "QUORUM•GENESIS•PROTORUNE",
      "Q",
      block
    );
    program.setBlock(block.toHex());

    await program.run("_start");

    const input = {
      inputTxHash: block.transactions?.at(block.transactions.length - 1)?.getHash(), // 0 is coinbase, 1 is the mint
      inputTxOutputIndex: pointer1, // index of output in the input tx that has the runes. In this case it is the default pointer of the mint
    };
    const block2 = buildDefaultBlock();
    const coinbase2 = buildCoinbaseToAddress(TEST_BTC_ADDRESS1);
    block2.transactions.push(coinbase2);
    const transaction2 = buildTransaction([{
      hash: block.transactions[block.transactions.length - 1].getHash(),
      index: pointer1
    }, {
      hash: coinbase2.getHash(),
      index: 0
    }], [{
      value: 0,
      script: Buffer.from('5d6d171601ff7f82b6e1e892a6c0a9841a00d4ea33aa02904e00', 'hex')
    }, {
      value: 1,
      script: bitcoinjs.payments.p2pkh({
        address: TEST_BTC_ADDRESS1,
	network: bitcoinjs.networks.bitcoin
      })
    }, {
      value: 1,
      script: bitcoinjs.payments.p2pkh({
        address: TEST_BTC_ADDRESS1,
	network: bitcoinjs.networks.bitcoin
      })
    }]);
    block2.transactions.push(transaction2);
    program.setBlockHeight(program.blockHeight + 1);
    program.setBlock(block2.toHex());
    await program.run('_start');
    

    const resultAddress1 = await runesbyaddress(program, TEST_BTC_ADDRESS1);
    // expect(resultAddress1.balanceSheet.length).equals(
    //   0,
    //   "address 1 should not have any runes left",
    // );
    const resultAddress2 = await runesbyaddress(program, TEST_BTC_ADDRESS2);
    // expect(resultAddress2.balanceSheet.length).equals(
    //   0,
    //   "address 2 should not have received any runes",
    // );

    const protorunesAddress2 = await protorunesbyaddress(
      program,
      TEST_BTC_ADDRESS2,
      GENESIS_PROTOCOL_TAG,
    );
    console.log(protorunesAddress2);
    // expect(protorunesAddress2.balanceSheet.length).equals(
    //   0,
    //   "address 2 should not have any protorunes",
    // );
    const protorunesAddress1 = await protorunesbyaddress(
      program,
      TEST_BTC_ADDRESS1,
      GENESIS_PROTOCOL_TAG,
    );
    console.log(protorunesAddress1);
    // expect(protorunesAddress1.balanceSheet[0].balance).equals(
    //   premineAmount,
    //   "address 1 should now have all the protorunes",
    // );
  });
});
