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
  transferRune,
} from "metashrew-runes/lib/tests/utils/rune-helpers";
import {
  buildCoinbaseToAddress,
  buildDefaultBlock,
} from "metashrew-runes/lib/tests/utils/block-helpers";
import { DEBUG_WASM } from "./utils/general";

describe("metashrew-runes", () => {
	/*
  it("should check if duplicate keys are not being set", async () => {
    const program = buildProgram(DEBUG_WASM);
    program.setBlock(
      fs.readFileSync(path.join(__dirname, "runes-genesis.hex"), "utf8"),
    );
    program.setBlockHeight(840000);
    program.on("log", console.log);
    await program.run("testOverwrite");
    expect(
      Object.keys(formatKv(program.kv)).filter((d) =>
        d.includes("/etching/byruneid"),
      ).length,
    ).to.be.equal(2);
  });
 */
  it("should not index before 840000", async () => {
    const program = buildProgram(DEBUG_WASM);
    program.setBlockHeight(839000);
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
    const block = initCompleteBlockWithRuneEtching(
      outputs,
      1,
      undefined,
      premineAmount,
    );
    program.setBlock(block.toHex());
    await program.run("_start");

    const resultAddress1 = await runesbyaddress(program, TEST_BTC_ADDRESS1);
    expect(resultAddress1.balanceSheet.length).equals(0);

    const resultAddress2 = await runesbyaddress(program, TEST_BTC_ADDRESS2);
    expect(resultAddress2.balanceSheet.length).equals(0);
  });
  it("index Runestone on etching and premine", async () => {
    const program = buildProgram(DEBUG_WASM);
    program.setBlockHeight(840001);
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
    const block = initCompleteBlockWithRuneEtching(
      outputs,
      1,
      undefined,
      premineAmount,
    );
    program.setBlock(block.toHex());
    await program.run("_start");

    const resultAddress1 = await runesbyaddress(program, TEST_BTC_ADDRESS1);
    expect(resultAddress1.balanceSheet[0].balance).equals(
      premineAmount,
      "address 1 should be mined premine amount",
    );

    const resultAddress2 = await runesbyaddress(program, TEST_BTC_ADDRESS2);
    expect(resultAddress2.balanceSheet.length).equals(
      0,
      "address 2 should not have anything",
    );
  });
  it("Runestone transfer invalid funds", async () => {
    const program = buildProgram(DEBUG_WASM);
    program.setBlockHeight(840000);
    const premineAmount = 2100000005000000n;

    let block = buildDefaultBlock();
    const coinbase = buildCoinbaseToAddress(TEST_BTC_ADDRESS1);
    block.transactions?.push(coinbase);

    const input = {
      inputTxHash: coinbase.getHash(),
      inputTxOutputIndex: 0,
    };
    const runeId = {
      block: 840000n,
      tx: 0,
    };
    const amount = premineAmount;
    const outputIndexToReceiveRunes = 1; // 0 is the script
    const output = {
      address: TEST_BTC_ADDRESS2,
      btcAmount: 1, //this can be implied to be 1 since runes usually are just inscribed on a satoshi
    };
    // technically this is not a valid transaction since btc in and less than btc out but this is just to test the runes
    const refundOutput = {
      address: TEST_BTC_ADDRESS1,
      btcAmount: 1, //this can be implied to be 1 since runes usually are just inscribed on a satoshi
    };
    const outputRunePointer = 2; // refund points to the refundOutput

    block = transferRune(
      [input],
      runeId,
      amount,
      outputIndexToReceiveRunes,
      [output, refundOutput],
      outputRunePointer,
      block,
    );

    program.setBlock(block.toHex());

    await program.run("_start");

    const resultAddress1 = await runesbyaddress(program, TEST_BTC_ADDRESS1);
    console.log(resultAddress1.balanceSheet);
    expect(resultAddress1.balanceSheet.length).equals(
      0,
      "address 1 should not have received runes from invalid rune transfer",
    );
    const resultAddress2 = await runesbyaddress(program, TEST_BTC_ADDRESS2);
    console.log(resultAddress2.balanceSheet);
    expect(resultAddress2.balanceSheet.length).equals(
      0,
      "address 2 should not have received runes from invalid rune transfer",
    );
  });
  it("index Runestone on transfer and refund to another address", async () => {
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
    const outputIndexToReceiveRunes = 1; // 0 is the script
    const output = {
      address: TEST_BTC_ADDRESS2,
      btcAmount: 1, //this can be implied to be 1 since runes usually are just inscribed on a satoshi
    };
    // technically this is not a valid transaction since btc in and less than btc out but this is just to test the runes
    const refundOutput = {
      address: TEST_BTC_ADDRESS1,
      btcAmount: 1, //this can be implied to be 1 since runes usually are just inscribed on a satoshi
    };
    const outputRunePointer = 2; // refund points to the refundOutput

    block = transferRune(
      [input],
      runeId,
      amount,
      outputIndexToReceiveRunes,
      [output, refundOutput],
      outputRunePointer,
      block,
    );

    program.setBlock(block.toHex());

    await program.run("_start");

    const remainingAmount = premineAmount - amount;

    const resultAddress1 = await runesbyaddress(program, TEST_BTC_ADDRESS1);
    console.log(resultAddress1.balanceSheet);
    expect(resultAddress1.balanceSheet[0].balance).equals(
      remainingAmount,
      "amount refund to address 1 is incorrect",
    );
    const resultAddress2 = await runesbyaddress(program, TEST_BTC_ADDRESS2);
    console.log(resultAddress2.balanceSheet);
    expect(resultAddress2.balanceSheet[0].balance).equals(
      amount,
      "amount to address 2 is incorrect",
    );
  });
  it("index Runestone on transfer and refund to self", async () => {
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
    const outputIndexToReceiveRunes = 1; // 0 is the script
    const output = {
      address: TEST_BTC_ADDRESS2,
      btcAmount: 1, //this can be implied to be 1 since runes usually are just inscribed on a satoshi
    };
    const refundOutput = {
      address: TEST_BTC_ADDRESS1,
      btcAmount: 1, //this can be implied to be 1 since runes usually are just inscribed on a satoshi
    };
    const outputRunePointer = 1; // leftover amount should go to output 1, so output 1 should have ALL premine runes

    block = transferRune(
      [input],
      runeId,
      amount,
      outputIndexToReceiveRunes,
      [output, refundOutput],
      outputRunePointer,
      block,
    );

    program.setBlock(block.toHex());

    await program.run("_start");

    const resultAddress1 = await runesbyaddress(program, TEST_BTC_ADDRESS1);
    console.log(resultAddress1.balanceSheet);
    expect(resultAddress1.balanceSheet.length).equals(
      0,
      "address 1 should not have any runes left",
    );
    const resultAddress2 = await runesbyaddress(program, TEST_BTC_ADDRESS2);
    console.log(resultAddress2.balanceSheet);
    expect(resultAddress2.balanceSheet[0].balance).equals(
      premineAmount,
      "amount to address 2 should be entire premineAmount",
    );
  });
  it("try to send runes from output that doesn't have runes", async () => {
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
    const inputWithoutRunes = {
      inputTxHash: block.transactions?.at(1)?.getHash(), // 0 is coinbase, 1 is the mint
      inputTxOutputIndex: 2, // index of output in the input tx that has the runes. In this case it is the default pointer of the mint
    };
    const runeId = {
      block: 840000n,
      tx: 1,
    };
    const amount = premineAmount / 2n;
    const outputIndexToReceiveRunes = 1; // 0 is the script
    const output = {
      address: TEST_BTC_ADDRESS2,
      btcAmount: 1, //this can be implied to be 1 since runes usually are just inscribed on a satoshi
    };
    const refundOutput = {
      address: TEST_BTC_ADDRESS1,
      btcAmount: 1, //this can be implied to be 1 since runes usually are just inscribed on a satoshi
    };
    const outputRunePointer = 1; // leftover amount should go to output 1, so output 1 should have ALL premine runes

    block = transferRune(
      [input],
      runeId,
      amount,
      outputIndexToReceiveRunes,
      [output, refundOutput],
      outputRunePointer,
      block,
    );
    block = transferRune(
      [inputWithoutRunes],
      runeId,
      amount,
      outputIndexToReceiveRunes,
      [output, refundOutput],
      outputRunePointer,
      block,
    );

    program.setBlock(block.toHex());

    await program.run("_start");

    const resultAddress1 = await runesbyaddress(program, TEST_BTC_ADDRESS1);
    console.log(resultAddress1.balanceSheet);
    expect(resultAddress1.balanceSheet.length).equals(
      0,
      "address 1 should not have any runes left",
    );
    const resultAddress2 = await runesbyaddress(program, TEST_BTC_ADDRESS2);
    console.log(resultAddress2.balanceSheet);
    expect(resultAddress2.balanceSheet[0].balance).equals(
      premineAmount,
      "amount to address 2 should be entire premineAmount",
    );
  });
  it("index Runestone on burn", async () => {
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
    const amount = premineAmount;
    const outputIndexToReceiveRunes = 0; // 0 is the script
    const output = {
      address: TEST_BTC_ADDRESS2,
      btcAmount: 1, //this can be implied to be 1 since runes usually are just inscribed on a satoshi
    };
    const outputRunePointer = 0; // leftover amount should go to output 0, the script, which means it will be burned

    block = transferRune(
      [input],
      runeId,
      amount,
      outputIndexToReceiveRunes,
      [output],
      outputRunePointer,
      block,
    );

    program.setBlock(block.toHex());

    await program.run("_start");

    const resultAddress1 = await runesbyaddress(program, TEST_BTC_ADDRESS1);
    console.log(resultAddress1.balanceSheet);
    expect(resultAddress1.balanceSheet.length).equals(
      0,
      "address 1 should not have any runes left",
    );
    const resultAddress2 = await runesbyaddress(program, TEST_BTC_ADDRESS2);
    console.log(resultAddress2.balanceSheet);
    expect(resultAddress2.balanceSheet.length).equals(
      0,
      "address 2 should not have any runes left",
    );
  });
  it("index Runestone integration test", async () => {
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
    const block1 = initCompleteBlockWithRuneEtching(
      outputs,
      pointer1,
      undefined,
      premineAmount,
    );
    program.setBlock(block1.toHex());
    await program.run("_start");

    // Sending entire rune amount to address 2
    program.setBlockHeight(840001);
    const input = {
      inputTxHash: block1.transactions?.at(1)?.getHash(), // 0 is coinbase, 1 is the mint
      inputTxOutputIndex: pointer1, // index of output in the input tx that has the runes. In this case it is the default pointer of the mint
    };
    const runeId = {
      block: 840000n,
      tx: 1,
    };
    const amount = premineAmount / 2n;
    const outputIndexToReceiveRunes = 1; // 0 is the script
    const output = {
      address: TEST_BTC_ADDRESS2,
      btcAmount: 1,
    };
    const refundOutput = {
      address: TEST_BTC_ADDRESS1,
      btcAmount: 1,
    };
    const outputRunePointer = 1; // leftover amount should go to output 1, so output 1 should have ALL premine runes

    const block2 = transferRune(
      [input],
      runeId,
      amount,
      outputIndexToReceiveRunes,
      [output, refundOutput],
      outputRunePointer,
    );

    program.setBlock(block2.toHex());

    await program.run("_start");

    let resultAddress1 = await runesbyaddress(program, TEST_BTC_ADDRESS1);
    console.log(resultAddress1.balanceSheet);
    expect(resultAddress1.balanceSheet.length).equals(
      0,
      "address 1 should not have any runes left",
    );
    let resultAddress2 = await runesbyaddress(program, TEST_BTC_ADDRESS2);
    console.log(resultAddress2.balanceSheet);
    expect(resultAddress2.balanceSheet[0].balance).equals(
      premineAmount,
      "amount to address 2 should be entire premineAmount",
    );

    // Sending half rune amount from address 2 back to address 1
    program.setBlockHeight(840001);
    const input2 = {
      inputTxHash: block2.transactions?.at(1)?.getHash(), // 0 is coinbase, 1 is the mint
      inputTxOutputIndex: pointer1, // index of output in the input tx that has the runes. In this case it is the default pointer of the mint
    };

    const block3 = transferRune(
      [input2],
      runeId,
      amount,
      outputIndexToReceiveRunes,
      [refundOutput, output],
      2,
    );

    program.setBlock(block3.toHex());

    await program.run("_start");
    const leftover = premineAmount - amount;

    resultAddress1 = await runesbyaddress(program, TEST_BTC_ADDRESS1);
    console.log(resultAddress1.balanceSheet);
    expect(resultAddress1.balanceSheet[0].balance).equals(amount);
    resultAddress2 = await runesbyaddress(program, TEST_BTC_ADDRESS2);
    console.log(resultAddress2.balanceSheet);
    expect(resultAddress2.balanceSheet[0].balance).equals(leftover);
  });
});
