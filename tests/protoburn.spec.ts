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
import {
  constructProtoburnTransaction,
  constructProtostoneTx,
} from "./utils/protoburn";
import { protorunesbyaddress } from "./utils/view-helpers";
import { DEBUG_WASM } from "./utils/general";
import { uint128 } from "../src.ts/proto/protorune";
import { ProtoStone } from "../src.ts/protostone";
import { u128, u32, u64 } from "@magiceden-oss/runestone-lib/dist/src/integer";
import { RuneId } from "@magiceden-oss/runestone-lib/dist/src/runeid";

// const TEST_PROTOCOL_TAG = parseInt("0x112233445566778899aabbccddeeff10", 16);
const TEST_PROTOCOL_TAG = BigInt("0x400000000000000000");

describe("protoburns", () => {
  it("initialProtoBurn: should index full protoburn, where edict target and pointer point to the protoburn", async () => {
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
      premineAmount
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
    // This transaction does a protoburn and transfers all protorunes to output 2
    block = constructProtoburnTransaction(
      [input],
      [
        {
          id: runeId,
          amount: amount,
          output: 0, // output 0 is the runestone. first edict corresponds to first protoburn
        },
      ],
      /*outputIndexToReceiveProtorunes=*/ 2, //this goes to the refundOutput
      [output, refundOutput], // 0 is script, 1 is address 2 output, 2 is address 1 output
      TEST_PROTOCOL_TAG,
      block,
      /*runeTransferPointer=*/ 0
    );

    program.setBlock(block.toHex());

    await program.run("_start");

    const resultAddress1 = await runesbyaddress(program, TEST_BTC_ADDRESS1);
    expect(resultAddress1.balanceSheet.length).equals(
      0,
      "address 1 should not have any runes left"
    );
    const resultAddress2 = await runesbyaddress(program, TEST_BTC_ADDRESS2);
    expect(resultAddress2.balanceSheet.length).equals(
      0,
      "address 2 should not have received any runes"
    );

    const protorunesAddress2 = await protorunesbyaddress(
      program,
      TEST_BTC_ADDRESS2,
      TEST_PROTOCOL_TAG
    );
    expect(protorunesAddress2.balanceSheet.length).equals(
      0,
      "address 2 should not have any protorunes"
    );
    const protorunesAddress1 = await protorunesbyaddress(
      program,
      TEST_BTC_ADDRESS1,
      TEST_PROTOCOL_TAG
    );
    expect(protorunesAddress1.balanceSheet[0].balance).equals(
      premineAmount,
      "address 1 should now have all the protorunes"
    );
  });
  it("initialProtoBurn with protocol tag < 10000000", async () => {
    // there used to be a bug in protorunesbyaddress where it was reading the protocol tag as a string
    // this led to the string getting padded to 8 bytes, so it was missing the index
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
      premineAmount
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
    // This transaction does a protoburn and transfers all protorunes to output 2
    block = constructProtoburnTransaction(
      [input],
      [
        {
          id: runeId,
          amount: amount,
          output: 0, // output 0 is the runestone. first edict corresponds to first protoburn
        },
      ],
      /*outputIndexToReceiveProtorunes=*/ 2, //this goes to the refundOutput
      [output, refundOutput], // 0 is script, 1 is address 2 output, 2 is address 1 output
      TEST_PROTOCOL_TAG,
      block,
      /*runeTransferPointer=*/ 0
    );

    program.setBlock(block.toHex());

    await program.run("_start");

    const resultAddress1 = await runesbyaddress(program, TEST_BTC_ADDRESS1);
    expect(resultAddress1.balanceSheet.length).equals(
      0,
      "address 1 should not have any runes left"
    );
    const resultAddress2 = await runesbyaddress(program, TEST_BTC_ADDRESS2);
    expect(resultAddress2.balanceSheet.length).equals(
      0,
      "address 2 should not have received any runes"
    );

    const protorunesAddress2 = await protorunesbyaddress(
      program,
      TEST_BTC_ADDRESS2,
      TEST_PROTOCOL_TAG
    );
    expect(protorunesAddress2.balanceSheet.length).equals(
      0,
      "address 2 should not have any protorunes"
    );
    const protorunesAddress1 = await protorunesbyaddress(
      program,
      TEST_BTC_ADDRESS1,
      TEST_PROTOCOL_TAG
    );
    expect(protorunesAddress1.balanceSheet[0].balance).equals(
      premineAmount,
      "address 1 should now have all the protorunes"
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
      premineAmount
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
          output: 0,
        },
      ],
      outputIndexToReceiveProtorunes,
      [output, refundOutput], // 0 is script, 1 is output 2, 2 is output 1
      TEST_PROTOCOL_TAG,
      block,
      /*runeTransferPointer=*/ 1
    );

    program.setBlock(block.toHex());

    await program.run("_start");

    const resultAddress1 = await runesbyaddress(program, TEST_BTC_ADDRESS1);
    expect(resultAddress1.balanceSheet.length).equals(
      0,
      "address 1 should not have any runes left"
    );
    const resultAddress2 = await runesbyaddress(program, TEST_BTC_ADDRESS2);
    expect(resultAddress2.balanceSheet[0].balance).equals(
      amountLeftover,
      "address 2 should have received leftover runes"
    );

    const protorunesAddress2 = await protorunesbyaddress(
      program,
      TEST_BTC_ADDRESS2,
      TEST_PROTOCOL_TAG
    );
    expect(protorunesAddress2.balanceSheet[0].balance).equals(
      amount,
      "address 2 should now have the protorunes sent to protoburn through edict"
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
      premineAmount
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
      /*runeTransferPointer=*/ 0
    );

    program.setBlock(block.toHex());

    await program.run("_start");

    const resultAddress1 = await runesbyaddress(program, TEST_BTC_ADDRESS1);
    expect(resultAddress1.balanceSheet.length).equals(
      0,
      "address 1 should not have any runes left"
    );
    const resultAddress2 = await runesbyaddress(program, TEST_BTC_ADDRESS2);
    expect(resultAddress2.balanceSheet[0].balance).equals(
      amount,
      "address 2 should have received transferred runes"
    );

    const protorunesAddress2 = await protorunesbyaddress(
      program,
      TEST_BTC_ADDRESS2,
      TEST_PROTOCOL_TAG
    );
    expect(protorunesAddress2.balanceSheet[0].balance).equals(
      amountLeftover,
      "address 2 should now have the protorunes left over from the transfer"
    );
  });
  it("multiple runes burned in one tx", async () => {
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
    ];
    const pointer1 = 1;
    let block1 = initCompleteBlockWithRuneEtching(
      outputs,
      pointer1,
      undefined,
      premineAmount
    );

    program.setBlock(block1.toHex());

    await program.run("_start");

    program.setBlockHeight(840001);

    const premineAmount2 = 10n;

    let block2 = initCompleteBlockWithRuneEtching(
      [
        {
          script: bitcoinjs.payments.p2pkh({
            address: TEST_BTC_ADDRESS1,
            network: bitcoinjs.networks.bitcoin,
          }).output,
          value: 1,
        },
      ],
      pointer1,
      1,
      premineAmount2,
      "TEST•RUNE•GENESIS",
      "T"
    );
    program.setBlock(block2.toHex());

    await program.run("_start");

    const input1 = {
      inputTxHash: block1.transactions?.at(1)?.getHash(), // 0 is coinbase, 1 is the mint
      inputTxOutputIndex: pointer1, // index of output in the input tx that has the runes. In this case it is the default pointer of the mint
    };
    const input2 = {
      inputTxHash: block2.transactions?.at(1)?.getHash(), // 0 is coinbase, 1 is the mint
      inputTxOutputIndex: pointer1, // index of output in the input tx that has the runes. In this case it is the default pointer of the mint
    };
    const runeId1 = {
      block: 840000n,
      tx: 1,
    };
    const runeId2 = {
      block: 840001n,
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
    // This transaction does a protoburn and transfers all protorunes to output 2
    block2 = constructProtoburnTransaction(
      [input1, input2],
      [
        {
          id: runeId1,
          amount: amount,
          output: 0,
        },
        {
          id: runeId2,
          amount: amount,
          output: 0,
        },
      ],
      /*outputIndexToReceiveProtorunes=*/ 2, //this goes to the refundOutput
      [output, refundOutput], // 0 is script, 1 is address 2 output, 2 is address 1 output
      TEST_PROTOCOL_TAG,
      block2,
      /*runeTransferPointer=*/ 0
    );

    program.setBlock(block2.toHex());

    await program.run("_start");

    const resultAddress1 = await runesbyaddress(program, TEST_BTC_ADDRESS1);
    expect(resultAddress1.balanceSheet.length).equals(
      0,
      "address 1 should not have any runes left"
    );
    const resultAddress2 = await runesbyaddress(program, TEST_BTC_ADDRESS2);
    expect(resultAddress2.balanceSheet.length).equals(
      0,
      "address 2 should not have received any runes"
    );

    const protorunesAddress2 = await protorunesbyaddress(
      program,
      TEST_BTC_ADDRESS2,
      TEST_PROTOCOL_TAG
    );
    expect(protorunesAddress2.balanceSheet.length).equals(
      0,
      "address 2 should not have any protorunes"
    );
    const protorunesAddress1 = await protorunesbyaddress(
      program,
      TEST_BTC_ADDRESS1,
      TEST_PROTOCOL_TAG
    );
    expect(protorunesAddress1.balanceSheet[0].balance).equals(
      premineAmount,
      "address 1 should now have all the protorunes 1"
    );
    expect(protorunesAddress1.balanceSheet[1].balance).equals(
      premineAmount2,
      "address 1 should now have all the protorunes 2"
    );
  });
  it("transfer protorune via edicts", async () => {
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
      premineAmount
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
    // This transaction does a protoburn and transfers all protorunes to output 2
    block = constructProtoburnTransaction(
      [input],
      [
        {
          id: runeId,
          amount: amount,
          output: 0,
        },
      ],
      /*outputIndexToReceiveProtorunes=*/ 2, //this goes to the refundOutput
      [output, refundOutput], // 0 is script, 1 is address 2 output, 2 is address 1 output
      TEST_PROTOCOL_TAG,
      block,
      /*runeTransferPointer=*/ 0
    );

    const protostoneEdictTransfer = new ProtoStone({
      protocolTag: TEST_PROTOCOL_TAG,
      edicts: [
        {
          id: new RuneId(<u64>840000n, <u32>1n),
          amount: <u128>amount,
          output: <u32>(<unknown>1), // output 1, who will be address 2 now.
        },
      ],
    });
    const input2 = {
      inputTxHash: block.transactions?.at(2)?.getHash(), // 0 is coinbase, 1 is the mint, 2 is protoburn
      inputTxOutputIndex: 2, // index of output in the input tx that has the protorunes. In this case it is the default pointer of the protoburn
    };

    block = constructProtostoneTx(
      [input2],
      [output, refundOutput], // 0 is script, 1 is address 2 output, 2 is address 1 output
      undefined, //no rune edicts
      [protostoneEdictTransfer],
      block,
      /*runeTransferPointer=*/ undefined // this should not be used
    );

    program.setBlock(block.toHex());

    await program.run("_start");

    const resultAddress1 = await runesbyaddress(program, TEST_BTC_ADDRESS1);
    expect(resultAddress1.balanceSheet.length).equals(
      0,
      "address 1 should not have any runes left"
    );
    const resultAddress2 = await runesbyaddress(program, TEST_BTC_ADDRESS2);
    expect(resultAddress2.balanceSheet.length).equals(
      0,
      "address 2 should not have received any runes"
    );

    const protorunesAddress2 = await protorunesbyaddress(
      program,
      TEST_BTC_ADDRESS2,
      TEST_PROTOCOL_TAG
    );
    expect(protorunesAddress2.balanceSheet[0].balance).equals(
      premineAmount,
      "address 2 should now have all protorunes"
    );
    const protorunesAddress1 = await protorunesbyaddress(
      program,
      TEST_BTC_ADDRESS1,
      TEST_PROTOCOL_TAG
    );
    expect(protorunesAddress1.balanceSheet.length).equals(
      0,
      "address 1 should now have no protorunes"
    );
  });
  it("multiple edicts will cycle around all protoburns", async () => {
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
      premineAmount
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
    const output = {
      address: TEST_BTC_ADDRESS2,
      btcAmount: 1, //this can be implied to be 1 since runes usually are just inscribed on a satoshi
    };
    // technically this is not a valid transaction since btc in and less than btc out but this is just to test the runes
    const refundOutput = {
      address: TEST_BTC_ADDRESS1,
      btcAmount: 1, // this gives address 1 his remaining bitcoin
    };

    // output 0: runestone with protoburns
    // output 1-2: output, and refundOutput
    // This transaction does a protoburn and transfers all protorunes to output 2
    block = constructProtostoneTx(
      [input],
      [output, refundOutput], // 0 is script, 1 is address 2 output, 2 is address 1 output
      [
        {
          id: runeId,
          amount: amount,
          output: 0, // this goes to protoburn 1, which goes to ADDRESS2
        },
        {
          id: runeId,
          amount: amount,
          output: 0, // this goes to protoburn 2
        },
        {
          id: runeId,
          amount: amount,
          output: 0, // this goes to protoburn 1
        },
      ],
      [
        // protoburn 1
        ProtoStone.burn({
          protocolTag: TEST_PROTOCOL_TAG,
          pointer: 1,
        }),
        //protoburn 2
        ProtoStone.burn({
          protocolTag: TEST_PROTOCOL_TAG,
          pointer: 2,
        }),
      ],
      block,
      /*runeTransferPointer=*/ 0
    );

    program.setBlock(block.toHex());

    await program.run("_start");
    console.log(formatKv(program.kv));

    const resultAddress1 = await runesbyaddress(program, TEST_BTC_ADDRESS1);
    expect(resultAddress1.balanceSheet.length).equals(
      0,
      "address 1 should not have any runes left"
    );
    const resultAddress2 = await runesbyaddress(program, TEST_BTC_ADDRESS2);
    expect(resultAddress2.balanceSheet.length).equals(
      0,
      "address 2 should not have received any runes"
    );
    const protorunesAddress1 = await protorunesbyaddress(
      program,
      TEST_BTC_ADDRESS1,
      TEST_PROTOCOL_TAG
    );
    expect(protorunesAddress1.balanceSheet[0].balance).equals(
      amount + 2n,
      "address 1 should now have amount"
    );

    const protorunesAddress2 = await protorunesbyaddress(
      program,
      TEST_BTC_ADDRESS2,
      TEST_PROTOCOL_TAG
    );
    expect(protorunesAddress2.balanceSheet[0].balance).equals(
      2n * amount,
      "address 2 should now have 2*amount"
    );
  });
  it("multiple edicts will cycle around all protoburns including pointer", async () => {
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
      premineAmount
    );

    const input = {
      inputTxHash: block.transactions?.at(1)?.getHash(), // 0 is coinbase, 1 is the mint
      inputTxOutputIndex: pointer1, // index of output in the input tx that has the runes. In this case it is the default pointer of the mint
    };
    const runeId = {
      block: 840000n,
      tx: 1,
    };
    const amount = premineAmount / 4n;
    const output = {
      address: TEST_BTC_ADDRESS2,
      btcAmount: 1, //this can be implied to be 1 since runes usually are just inscribed on a satoshi
    };
    // technically this is not a valid transaction since btc in and less than btc out but this is just to test the runes
    const refundOutput = {
      address: TEST_BTC_ADDRESS1,
      btcAmount: 1, // this gives address 1 his remaining bitcoin
    };

    // output 0: runestone with protoburns
    // output 1-2: output, and refundOutput
    // This transaction does a protoburn and transfers all protorunes to output 2
    block = constructProtostoneTx(
      [input],
      [output, refundOutput], // 0 is script, 1 is address 2 output, 2 is address 1 output
      [
        {
          id: runeId,
          amount: amount,
          output: 0, // this goes to protoburn 1, which goes to ADDRESS2
        },
        {
          id: runeId,
          amount: amount,
          output: 0, // this goes to protoburn 2
        },
        {
          id: runeId,
          amount: amount,
          output: 0, // this goes to protoburn 1
        },
      ],
      [
        // protoburn 1
        ProtoStone.burn({
          protocolTag: TEST_PROTOCOL_TAG,
          pointer: 1,
        }),
        //protoburn 2
        ProtoStone.burn({
          protocolTag: TEST_PROTOCOL_TAG,
          pointer: 2,
        }),
      ],
      block,
      /*runeTransferPointer=*/ 0
    );

    program.setBlock(block.toHex());

    await program.run("_start");

    const resultAddress1 = await runesbyaddress(program, TEST_BTC_ADDRESS1);
    expect(resultAddress1.balanceSheet.length).equals(
      0,
      "address 1 should not have any runes left"
    );
    const resultAddress2 = await runesbyaddress(program, TEST_BTC_ADDRESS2);
    expect(resultAddress2.balanceSheet.length).equals(
      0,
      "address 2 should not have received any runes"
    );
    const protorunesAddress1 = await protorunesbyaddress(
      program,
      TEST_BTC_ADDRESS1,
      TEST_PROTOCOL_TAG
    );
    expect(protorunesAddress1.balanceSheet[0].balance).equals(
      2n * amount,
      "address 1 should now have amount from first edict and third edict"
    );

    const protorunesAddress2 = await protorunesbyaddress(
      program,
      TEST_BTC_ADDRESS2,
      TEST_PROTOCOL_TAG
    );
    expect(protorunesAddress2.balanceSheet[0].balance).equals(
      2n * amount,
      "address 2 should now have amount from second edict and pointer"
    );
  });
  it("protoburn with FROM field is indexed", async () => {
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
      premineAmount
    );

    const input = {
      inputTxHash: block.transactions?.at(1)?.getHash(), // 0 is coinbase, 1 is the mint
      inputTxOutputIndex: pointer1, // index of output in the input tx that has the runes. In this case it is the default pointer of the mint
    };
    const runeId = {
      block: 840000n,
      tx: 1,
    };
    const amount = premineAmount / 4n;
    const output = {
      address: TEST_BTC_ADDRESS2,
      btcAmount: 1, //this can be implied to be 1 since runes usually are just inscribed on a satoshi
    };
    // technically this is not a valid transaction since btc in and less than btc out but this is just to test the runes
    const refundOutput = {
      address: TEST_BTC_ADDRESS1,
      btcAmount: 1, // this gives address 1 his remaining bitcoin
    };

    // output 0: runestone with protoburns
    // output 1-2: output, and refundOutput
    // This transaction does a protoburn and transfers all protorunes to output 2
    block = constructProtostoneTx(
      [input],
      [output, refundOutput], // 0 is script, 1 is address 2 output, 2 is address 1 output
      [
        {
          id: runeId,
          amount: amount,
          output: 0,
        },
        {
          id: runeId,
          amount: amount,
          output: 0,
        },
        {
          id: runeId,
          amount: amount,
          output: 0,
        },
      ],
      [
        // protoburn 1
        ProtoStone.burn({
          protocolTag: TEST_PROTOCOL_TAG,
          pointer: 1,
          from: [<u32>0n, <u32>1n, <u32>2n],
        }),
      ],
      block,
      /*runeTransferPointer=*/ 0
    );

    program.setBlock(block.toHex());

    await program.run("_start");

    const resultAddress1 = await runesbyaddress(program, TEST_BTC_ADDRESS1);
    expect(resultAddress1.balanceSheet.length).equals(
      0,
      "address 1 should not have any runes left"
    );
    const resultAddress2 = await runesbyaddress(program, TEST_BTC_ADDRESS2);
    expect(resultAddress2.balanceSheet.length).equals(
      0,
      "address 2 should not have received any runes"
    );
    const protorunesAddress1 = await protorunesbyaddress(
      program,
      TEST_BTC_ADDRESS1,
      TEST_PROTOCOL_TAG
    );
    expect(protorunesAddress1.balanceSheet.length).equals(
      0,
      "address 1 should not have any protorunes left"
    );

    const protorunesAddress2 = await protorunesbyaddress(
      program,
      TEST_BTC_ADDRESS2,
      TEST_PROTOCOL_TAG
    );
    expect(protorunesAddress2.balanceSheet[0].balance).equals(
      4n * amount,
      "address 2 should now have amount from 1,2,3 edicts, and pointer"
    );
  });
  it("protoburn with FROM field is indexed with protoburn without FROM field", async () => {
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
      premineAmount
    );

    const input = {
      inputTxHash: block.transactions?.at(1)?.getHash(), // 0 is coinbase, 1 is the mint
      inputTxOutputIndex: pointer1, // index of output in the input tx that has the runes. In this case it is the default pointer of the mint
    };
    const runeId = {
      block: 840000n,
      tx: 1,
    };
    const amount = premineAmount / 4n;
    const output = {
      address: TEST_BTC_ADDRESS2,
      btcAmount: 1, //this can be implied to be 1 since runes usually are just inscribed on a satoshi
    };
    // technically this is not a valid transaction since btc in and less than btc out but this is just to test the runes
    const refundOutput = {
      address: TEST_BTC_ADDRESS1,
      btcAmount: 1, // this gives address 1 his remaining bitcoin
    };

    // output 0: runestone with protoburns
    // output 1-2: output, and refundOutput
    // This transaction does a protoburn and transfers all protorunes to output 2
    block = constructProtostoneTx(
      [input],
      [output, refundOutput], // 0 is script, 1 is address 2 output, 2 is address 1 output
      [
        {
          id: runeId,
          amount: amount,
          output: 0,
        },
        {
          id: runeId,
          amount: amount,
          output: 0,
        },
        {
          id: runeId,
          amount: amount,
          output: 0,
        },
      ],
      [
        // protoburn 1
        ProtoStone.burn({
          protocolTag: TEST_PROTOCOL_TAG,
          pointer: 1,
          from: [<u32>0n, <u32>1n, <u32>2n],
        }),
        // protoburn 2
        ProtoStone.burn({
          protocolTag: TEST_PROTOCOL_TAG,
          pointer: 2,
        }),
      ],
      block,
      /*runeTransferPointer=*/ 0
    );

    program.setBlock(block.toHex());

    await program.run("_start");

    const resultAddress1 = await runesbyaddress(program, TEST_BTC_ADDRESS1);
    expect(resultAddress1.balanceSheet.length).equals(
      0,
      "address 1 should not have any runes left"
    );
    const resultAddress2 = await runesbyaddress(program, TEST_BTC_ADDRESS2);
    expect(resultAddress2.balanceSheet.length).equals(
      0,
      "address 2 should not have received any runes"
    );
    const protorunesAddress1 = await protorunesbyaddress(
      program,
      TEST_BTC_ADDRESS1,
      TEST_PROTOCOL_TAG
    );
    expect(protorunesAddress1.balanceSheet.length).equals(
      0,
      "address 1 should not have any protorunes left"
    );

    const protorunesAddress2 = await protorunesbyaddress(
      program,
      TEST_BTC_ADDRESS2,
      TEST_PROTOCOL_TAG
    );
    expect(protorunesAddress2.balanceSheet[0].balance).equals(
      4n * amount,
      "address 2 should now have amount from 1,2,3 edicts, and pointer"
    );
  });
  it("protoburn with FROM field is indexed with protoburn without FROM field with cycle", async () => {
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
      premineAmount
    );

    const input = {
      inputTxHash: block.transactions?.at(1)?.getHash(), // 0 is coinbase, 1 is the mint
      inputTxOutputIndex: pointer1, // index of output in the input tx that has the runes. In this case it is the default pointer of the mint
    };
    const runeId = {
      block: 840000n,
      tx: 1,
    };
    const amount = premineAmount / 8n;
    const output = {
      address: TEST_BTC_ADDRESS2,
      btcAmount: 1, //this can be implied to be 1 since runes usually are just inscribed on a satoshi
    };
    // technically this is not a valid transaction since btc in and less than btc out but this is just to test the runes
    const refundOutput = {
      address: TEST_BTC_ADDRESS1,
      btcAmount: 1, // this gives address 1 his remaining bitcoin
    };

    // output 0: runestone with protoburns
    // output 1-2: output, and refundOutput
    // This transaction does a protoburn and transfers all protorunes to output 2
    block = constructProtostoneTx(
      [input],
      [output, refundOutput], // 0 is script, 1 is address 2 output, 2 is address 1 output
      [
        {
          id: runeId,
          amount: amount,
          output: 0,
        },
        {
          id: runeId,
          amount: amount * 2n,
          output: 0,
        },
        {
          id: runeId,
          amount: amount * 3n,
          output: 0,
        },
      ],
      [
        // protoburn 1
        ProtoStone.burn({
          protocolTag: TEST_PROTOCOL_TAG,
          pointer: 1,
          from: [<u32>0n, <u32>2n],
        }),
        // protoburn 2
        ProtoStone.burn({
          protocolTag: TEST_PROTOCOL_TAG,
          pointer: 2,
        }),
      ],
      block,
      /*runeTransferPointer=*/ 0
    );

    program.setBlock(block.toHex());

    await program.run("_start");

    const resultAddress1 = await runesbyaddress(program, TEST_BTC_ADDRESS1);
    expect(resultAddress1.balanceSheet.length).equals(
      0,
      "address 1 should not have any runes left"
    );
    const resultAddress2 = await runesbyaddress(program, TEST_BTC_ADDRESS2);
    expect(resultAddress2.balanceSheet.length).equals(
      0,
      "address 2 should not have received any runes"
    );
    const protorunesAddress1 = await protorunesbyaddress(
      program,
      TEST_BTC_ADDRESS1,
      TEST_PROTOCOL_TAG
    );
    expect(protorunesAddress1.balanceSheet[0].balance).equals(
      2n * amount,
      "address 1 should now have amount from pointer"
    );

    const protorunesAddress2 = await protorunesbyaddress(
      program,
      TEST_BTC_ADDRESS2,
      TEST_PROTOCOL_TAG
    );
    expect(protorunesAddress2.balanceSheet[0].balance).equals(
      6n * amount,
      "address 2 should now have amount from 1,2, and 3 edicts"
    );
  });
  it("protoburn with FROM field is indexed with protoburn without FROM field with cycle 2", async () => {
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
      premineAmount
    );

    const input = {
      inputTxHash: block.transactions?.at(1)?.getHash(), // 0 is coinbase, 1 is the mint
      inputTxOutputIndex: pointer1, // index of output in the input tx that has the runes. In this case it is the default pointer of the mint
    };
    const runeId = {
      block: 840000n,
      tx: 1,
    };
    const amount = premineAmount / 8n;
    const output = {
      address: TEST_BTC_ADDRESS2,
      btcAmount: 1, //this can be implied to be 1 since runes usually are just inscribed on a satoshi
    };
    // technically this is not a valid transaction since btc in and less than btc out but this is just to test the runes
    const refundOutput = {
      address: TEST_BTC_ADDRESS1,
      btcAmount: 1, // this gives address 1 his remaining bitcoin
    };

    // output 0: runestone with protoburns
    // output 1-2: output, and refundOutput
    // This transaction does a protoburn and transfers all protorunes to output 2
    block = constructProtostoneTx(
      [input],
      [output, refundOutput], // 0 is script, 1 is address 2 output, 2 is address 1 output
      [
        {
          id: runeId,
          amount: amount,
          output: 0,
        },
        {
          id: runeId,
          amount: amount * 2n,
          output: 0,
        },
        {
          id: runeId,
          amount: amount * 3n,
          output: 0,
        },
      ],
      [
        // protoburn 1
        ProtoStone.burn({
          protocolTag: TEST_PROTOCOL_TAG,
          pointer: 1,
          from: [<u32>0n],
        }),
        // protoburn 2
        ProtoStone.burn({
          protocolTag: TEST_PROTOCOL_TAG,
          pointer: 2,
        }),
      ],
      block,
      /*runeTransferPointer=*/ 0
    );

    program.setBlock(block.toHex());

    await program.run("_start");

    const resultAddress1 = await runesbyaddress(program, TEST_BTC_ADDRESS1);
    expect(resultAddress1.balanceSheet.length).equals(
      0,
      "address 1 should not have any runes left"
    );
    const resultAddress2 = await runesbyaddress(program, TEST_BTC_ADDRESS2);
    expect(resultAddress2.balanceSheet.length).equals(
      0,
      "address 2 should not have received any runes"
    );
    const protorunesAddress1 = await protorunesbyaddress(
      program,
      TEST_BTC_ADDRESS1,
      TEST_PROTOCOL_TAG
    );
    expect(protorunesAddress1.balanceSheet[0].balance).equals(
      3n * amount,
      "address 1 should now have amount from 3rd edict"
    );

    const protorunesAddress2 = await protorunesbyaddress(
      program,
      TEST_BTC_ADDRESS2,
      TEST_PROTOCOL_TAG
    );
    expect(protorunesAddress2.balanceSheet[0].balance).equals(
      5n * amount,
      "address 2 should now have amount from 1,2 edicts and pointer"
    );
  });
  it("protoburn with multiple FROM field", async () => {
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
      premineAmount
    );

    const input = {
      inputTxHash: block.transactions?.at(1)?.getHash(), // 0 is coinbase, 1 is the mint
      inputTxOutputIndex: pointer1, // index of output in the input tx that has the runes. In this case it is the default pointer of the mint
    };
    const runeId = {
      block: 840000n,
      tx: 1,
    };
    const amount = premineAmount / 8n;
    const output = {
      address: TEST_BTC_ADDRESS2,
      btcAmount: 1, //this can be implied to be 1 since runes usually are just inscribed on a satoshi
    };
    // technically this is not a valid transaction since btc in and less than btc out but this is just to test the runes
    const refundOutput = {
      address: TEST_BTC_ADDRESS1,
      btcAmount: 1, // this gives address 1 his remaining bitcoin
    };

    // output 0: runestone with protoburns
    // output 1-2: output, and refundOutput
    // This transaction does a protoburn and transfers all protorunes to output 2
    block = constructProtostoneTx(
      [input],
      [output, refundOutput], // 0 is script, 1 is address 2 output, 2 is address 1 output
      [
        {
          id: runeId,
          amount: amount,
          output: 0,
        },
        {
          id: runeId,
          amount: amount * 2n,
          output: 0,
        },
        {
          id: runeId,
          amount: amount * 3n,
          output: 0,
        },
      ],
      [
        // protoburn 1
        ProtoStone.burn({
          protocolTag: TEST_PROTOCOL_TAG,
          pointer: 1,
          from: [<u32>0n, <u32>2n],
        }),
        // protoburn 2
        ProtoStone.burn({
          protocolTag: TEST_PROTOCOL_TAG,
          pointer: 2,
          from: [<u32>0n, <u32>1n],
        }),
      ],
      block,
      /*runeTransferPointer=*/ 0
    );

    program.setBlock(block.toHex());

    await program.run("_start");

    const resultAddress1 = await runesbyaddress(program, TEST_BTC_ADDRESS1);
    expect(resultAddress1.balanceSheet.length).equals(
      0,
      "address 1 should not have any runes left"
    );
    const resultAddress2 = await runesbyaddress(program, TEST_BTC_ADDRESS2);
    expect(resultAddress2.balanceSheet.length).equals(
      0,
      "address 2 should not have received any runes"
    );
    const protorunesAddress1 = await protorunesbyaddress(
      program,
      TEST_BTC_ADDRESS1,
      TEST_PROTOCOL_TAG
    );
    expect(protorunesAddress1.balanceSheet[0].balance).equals(
      2n * amount,
      "address 1 should now have amount from 2nd edict"
    );

    const protorunesAddress2 = await protorunesbyaddress(
      program,
      TEST_BTC_ADDRESS2,
      TEST_PROTOCOL_TAG
    );
    expect(protorunesAddress2.balanceSheet[0].balance).equals(
      6n * amount,
      "address 2 should now have amount from 1, 3 edicts and pointer"
    );
  });
  it("protoburn with FROM field with invalid index should be ignored", async () => {
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
      premineAmount
    );

    const input = {
      inputTxHash: block.transactions?.at(1)?.getHash(), // 0 is coinbase, 1 is the mint
      inputTxOutputIndex: pointer1, // index of output in the input tx that has the runes. In this case it is the default pointer of the mint
    };
    const runeId = {
      block: 840000n,
      tx: 1,
    };
    const amount = premineAmount / 8n;
    const output = {
      address: TEST_BTC_ADDRESS2,
      btcAmount: 1, //this can be implied to be 1 since runes usually are just inscribed on a satoshi
    };
    // technically this is not a valid transaction since btc in and less than btc out but this is just to test the runes
    const refundOutput = {
      address: TEST_BTC_ADDRESS1,
      btcAmount: 1, // this gives address 1 his remaining bitcoin
    };

    // output 0: runestone with protoburns
    // output 1-2: output, and refundOutput
    // This transaction does a protoburn and transfers all protorunes to output 2
    block = constructProtostoneTx(
      [input],
      [output, refundOutput], // 0 is script, 1 is address 2 output, 2 is address 1 output
      [
        {
          id: runeId,
          amount: amount,
          output: 0,
        },
        {
          id: runeId,
          amount: amount * 2n,
          output: 0,
        },
        {
          id: runeId,
          amount: amount * 3n,
          output: 0,
        },
      ],
      [
        // protoburn 1
        ProtoStone.burn({
          protocolTag: TEST_PROTOCOL_TAG,
          pointer: 1,
          from: [<u32>3n, <u32>2n],
        }),
        // protoburn 2
        ProtoStone.burn({
          protocolTag: TEST_PROTOCOL_TAG,
          pointer: 2,
        }),
      ],
      block,
      /*runeTransferPointer=*/ 0
    );

    program.setBlock(block.toHex());

    await program.run("_start");

    const resultAddress1 = await runesbyaddress(program, TEST_BTC_ADDRESS1);
    expect(resultAddress1.balanceSheet.length).equals(
      0,
      "address 1 should not have any runes left"
    );
    const resultAddress2 = await runesbyaddress(program, TEST_BTC_ADDRESS2);
    expect(resultAddress2.balanceSheet.length).equals(
      0,
      "address 2 should not have received any runes"
    );
    const protorunesAddress1 = await protorunesbyaddress(
      program,
      TEST_BTC_ADDRESS1,
      TEST_PROTOCOL_TAG
    );
    expect(protorunesAddress1.balanceSheet[0].balance).equals(
      2n * amount,
      "address 1 should now have amount from 2nd edict"
    );

    const protorunesAddress2 = await protorunesbyaddress(
      program,
      TEST_BTC_ADDRESS2,
      TEST_PROTOCOL_TAG
    );
    expect(protorunesAddress2.balanceSheet[0].balance).equals(
      6n * amount,
      "address 2 should now have amount from 1, and 3 edicts, and pointer"
    );
  });
});
