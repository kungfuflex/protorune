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
import { protorunesbyaddress, runtime } from "./utils/view-helpers";
import { DEBUG_WASM } from "./utils/general";
import { uint128 } from "../src.ts/proto/protorune";
import { constructProtostoneTx } from "./utils/protoburn";
import { constructProtomessageBlock } from "./utils/protomessage";
import { ProtoStone } from "../src.ts/protostone";
import { u128, u64, u32 } from "@magiceden-oss/runestone-lib/dist/src/integer";
import { RuneId } from "@magiceden-oss/runestone-lib/dist/src/runeid";

// const TEST_PROTOCOL_TAG = parseInt("0x112233445566778899aabbccddeeff10", 16);
const TEST_PROTOCOL_TAG = BigInt("0x400000000000000000");

describe("protomessage", () => {
  let program: ReturnType<typeof buildProgram>;
  const premineAmount = 2100000005000000n;
  beforeEach(async () => {
    program = buildProgram(DEBUG_WASM);
    program.setBlockHeight(840000);
  });
  async function createProtoruneFixture(omitBurn: boolean = false) {
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
    return { input, block, output, refundOutput, runeId, program };
  }

  function expectBalances(
    address: string,
    index: number,
    method: (...args: any) => Promise<any>,
    ...args: any
  ) {
    const result = method(program, address, ...args);
    return {
      equals: async (amount: bigint) => {
        expect((await result).balanceSheet[0].balance).equals(
          amount,
          `address ${index} was not refunded runes`,
        );
      },
      isZero: async () => {
        expect((await result).balanceSheet.length).equals(
          0,
          `address ${index} should not have any runes left`,
        );
      },
    };
  }

  const expectRunesBalances = (address: string, index: number) =>
    expectBalances(address, index, runesbyaddress);
  const expectProtoRunesBalances = (
    address: string,
    index: number,
    protocol: any,
  ) => expectBalances(address, index, protorunesbyaddress, protocol);

  it("should index protomessage in the same tx as protoburn", async () => {
    // ================================
    // TODO: Create a fixture from here
    // ================================
    let { runeId, block, output, refundOutput, input } =
      await createProtoruneFixture(true);
    const amount = premineAmount / 3n;
    const refundAmount = premineAmount - amount;

    // output 0 is runestone
    // output 1 TEST_BTC_ADDRESS2
    // output 2 TEST_BTC_ADDRESS1
    // output 3 is protoburn
    // output 4 is protomessage
    // this method transfers all remaining runes to the protoburn
    block = constructProtostoneTx(
      [input],
      [output, refundOutput],
      /*edicts=*/ [
        {
          id: runeId,
          amount: amount,
          output: 0,
        },
      ],
      /*protostones=*/ [
        ProtoStone.burn({
          protocolTag: TEST_PROTOCOL_TAG,
          pointer: 5, // first protomessage is at the outpoint after outpoints.length
        }),
        ProtoStone.message({
          calldata: Buffer.from("1111"),
          protocolTag: TEST_PROTOCOL_TAG,
          pointer: 1,
          refundPointer: 2,
        }),
      ],
      block,
      /*runeTransferPointer=*/ 1, //remaining runes go to address 2
    );
    program.setBlock(block.toHex());
    await program.run("_start");
    // CHECK RUNE BALANCES
    await expectRunesBalances(TEST_BTC_ADDRESS1, 1).isZero();
    await expectRunesBalances(TEST_BTC_ADDRESS2, 2).equals(refundAmount);

    // CHECK PROTORUNE BALANCES
    await expectProtoRunesBalances(
      TEST_BTC_ADDRESS2,
      2,
      TEST_PROTOCOL_TAG,
    ).isZero();
    await expectProtoRunesBalances(
      TEST_BTC_ADDRESS1,
      1,
      TEST_PROTOCOL_TAG,
    ).equals(amount);
  });
  it("should index protomessage only", async () => {
    let { block, output, refundOutput, runeId } =
      await createProtoruneFixture();
    const calldata = Buffer.from("testing 12345");

    // constructing tx 3: protomessage
    block = constructProtostoneTx(
      [
        {
          inputTxHash: block.transactions?.at(2)?.getHash(),
          inputTxOutputIndex: 1,
        },
      ],
      [output, refundOutput],
      [],
      [
        ProtoStone.edicts({
          protocolTag: TEST_PROTOCOL_TAG,
          edicts: [
            {
              amount: u128(premineAmount),
              id: new RuneId(u64(runeId.block), u32(runeId.tx)),
              output: u32(5),
            },
          ],
        }),
        ProtoStone.message({
          protocolTag: TEST_PROTOCOL_TAG,
          pointer: 1,
          refundPointer: 2,
          calldata,
        }),
      ],
      block,
      2,
    );
    program.setBlock(block.toHex());
    console.log("indexing message block");
    await program.run("_start");
    await expectRunesBalances(TEST_BTC_ADDRESS1, 1).isZero();
    await expectRunesBalances(TEST_BTC_ADDRESS2, 2).isZero();
    await expectProtoRunesBalances(
      TEST_BTC_ADDRESS2,
      2,
      TEST_PROTOCOL_TAG,
    ).isZero();
    await expectProtoRunesBalances(
      TEST_BTC_ADDRESS1,
      1,
      TEST_PROTOCOL_TAG,
    ).equals(premineAmount);
  });

  it("should test depositAll", async () => {
    let { block, output, refundOutput, runeId } =
      await createProtoruneFixture();
    const calldata = Buffer.from("testing 12345");

    // constructing tx 3: protomessage
    block = constructProtostoneTx(
      [
        {
          inputTxHash: block.transactions?.at(2)?.getHash(),
          inputTxOutputIndex: 1,
        },
      ],
      [output, refundOutput],
      [],
      [
        ProtoStone.edicts({
          protocolTag: TEST_PROTOCOL_TAG,
          edicts: [
            {
              amount: u128(premineAmount),
              id: new RuneId(u64(runeId.block), u32(runeId.tx)),
              output: u32(5),
            },
          ],
        }),
        ProtoStone.message({
          protocolTag: TEST_PROTOCOL_TAG,
          pointer: 1,
          refundPointer: 2,
          calldata,
        }),
      ],
      block,
      2,
    );
    program.setBlock(block.toHex());
    console.log("indexing message block");
    await program.run("testProtomessage");
    await expectRunesBalances(TEST_BTC_ADDRESS1, 1).isZero();
    await expectRunesBalances(TEST_BTC_ADDRESS2, 2).isZero();
    await expectProtoRunesBalances(
      TEST_BTC_ADDRESS2,
      2,
      TEST_PROTOCOL_TAG,
    ).isZero();
    // await expectProtoRunesBalances(
    //   TEST_BTC_ADDRESS1,
    //   1,
    //   TEST_PROTOCOL_TAG,
    // ).isZero();
    const runtimeStats = await runtime(program, TEST_PROTOCOL_TAG, {
      height: Number(runeId.block),
      txindex: runeId.tx,
    });
    expect(runtimeStats.balance).to.equal(premineAmount);
  });
});
