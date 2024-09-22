import { expect } from "chai";
//@ts-ignore
import {
  buildProgram,
  formatKv,
  TEST_BTC_ADDRESS1,
  TEST_BTC_ADDRESS2,
} from "metashrew-runes/lib/tests/utils/general";
import { runesbyaddress } from "metashrew-runes/lib/tests/utils/rune-helpers";
import { protorunesbyaddress, runtime } from "./utils/view-helpers";
import { DEBUG_WASM } from "./utils/general";
import { constructProtostoneTx } from "./utils/protoburn";
import { ProtoStone } from "../src.ts/protostone";
import { u128, u64, u32 } from "@magiceden-oss/runestone-lib/dist/src/integer";
import { RuneId } from "@magiceden-oss/runestone-lib/dist/src/runeid";
import {
  createMultipleProtomessageFixture,
  createMultipleProtoruneFixture,
  createProtomessageFixture,
  createProtoruneFixture,
} from "./utils/fixtures";
import { expectBalances } from "./utils/matchers";

export const TEST_PROTOCOL_TAG = BigInt("0x400000000000000000");

describe("protomessage", () => {
  let program: ReturnType<typeof buildProgram>;
  beforeEach(async () => {
    program = buildProgram(DEBUG_WASM);
    program.setBlockHeight(840000);
  });

  const expectRunesBalances = (address: string, index: number) =>
    expectBalances(program, address, index, runesbyaddress);
  const expectProtoRunesBalances = (
    address: string,
    index: number,
    protocol: any,
  ) => expectBalances(program, address, index, protorunesbyaddress, protocol);

  it("should test fixture initial values before protoburn", async () => {
    let { block, premineAmount } = await createProtoruneFixture(
      TEST_PROTOCOL_TAG,
      true,
    );
    program.setBlock(block.toHex());
    await program.run("_start");
    await expectRunesBalances(TEST_BTC_ADDRESS1, 1).equals([premineAmount]);
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
    ).isZero();
  });
  it("should test fixture initial values protoburn", async () => {
    let { block, premineAmount } =
      await createProtoruneFixture(TEST_PROTOCOL_TAG);
    program.setBlock(block.toHex());
    await program.run("_start");
    await expectRunesBalances(TEST_BTC_ADDRESS1, 1).isZero();
    await expectRunesBalances(TEST_BTC_ADDRESS2, 2).isZero();
    await expectProtoRunesBalances(
      TEST_BTC_ADDRESS2,
      2,
      TEST_PROTOCOL_TAG,
    ).equals([premineAmount]);
    await expectProtoRunesBalances(
      TEST_BTC_ADDRESS1,
      1,
      TEST_PROTOCOL_TAG,
    ).isZero();
  });
  it("should test fixture initial values before multiple protoburn", async () => {
    let { block, premineAmount } = await createMultipleProtoruneFixture(
      TEST_PROTOCOL_TAG,
      /*omitBurn=*/ true,
    );
    program.setBlock(block.toHex());
    await program.run("_start");
    await expectRunesBalances(TEST_BTC_ADDRESS1, 1).equals([
      premineAmount,
      premineAmount,
    ]);
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
    ).isZero();
  });
  it("should test fixture initial values multiple protoburn", async () => {
    let { block, premineAmount } =
      await createMultipleProtoruneFixture(TEST_PROTOCOL_TAG);
    program.setBlock(block.toHex());
    await program.run("_start");
    await expectRunesBalances(TEST_BTC_ADDRESS1, 1).isZero();
    await expectRunesBalances(TEST_BTC_ADDRESS2, 2).isZero();
    await expectProtoRunesBalances(
      TEST_BTC_ADDRESS2,
      2,
      TEST_PROTOCOL_TAG,
    ).equals([premineAmount, premineAmount]);
    await expectProtoRunesBalances(
      TEST_BTC_ADDRESS1,
      1,
      TEST_PROTOCOL_TAG,
    ).isZero();
  });
  it("should index protomessage in the same tx as protoburn", async () => {
    let { runeId1, block, output, refundOutput, inputs, premineAmount } =
      await createMultipleProtoruneFixture(TEST_PROTOCOL_TAG, true);
    const amount = premineAmount / 3n;
    const refundAmount = premineAmount - amount;

    // output 0 is runestone, targetting 0 will protoburn
    // output 1 p2pkh TEST_BTC_ADDRESS2
    // output 2 p2pkh TEST_BTC_ADDRESS1
    // output 3 will distribute... unused
    // output 4 is protomessage
    // this method transfers all remaining runes to the protoburn
    block = constructProtostoneTx(
      inputs,
      [output, refundOutput],
      /*edicts=*/ [
        {
          id: runeId1, // only rune1 is protoburned
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
    await expectRunesBalances(TEST_BTC_ADDRESS2, 2).equals([
      refundAmount,
      premineAmount,
    ]);

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
    ).equals([amount]);
  });
  it("should index protomessage only -- refund goes to the default protostone pointer", async () => {
    const amount1 = 100000n;
    // createMultipleProtomessageFixture hard codes the default protostone pointer to be address 1
    // this means unused protorunes in the input will go to address 1
    // the used protorunes go to the refund pointer, which is address 1
    // since the input contains the full amount of protorune 1 and 2, all protorunes transfer to address 1
    let { block, premineAmount } = await createMultipleProtomessageFixture({
      protocolTag: TEST_PROTOCOL_TAG,
      protomessagePointer: 1, // address 2
      protomessageRefundPointer: 2, // address 1
      calldata: Buffer.from("test calldata"),
      amount1: amount1,
      amount2: 0n,
    });
    program.setBlock(block.toHex());
    await program.run("_start"); // default behavior is to refund to refundPointer (address 1)
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
    ).equals([premineAmount, premineAmount]);
  });
  it("should index protomessage only -- refund doesn not go to default protostone pointer", async () => {
    const amount1 = 100000n;
    // createMultipleProtomessageFixture hard codes the default protostone pointer to be address 1
    // this means unused protorunes in the input will go to address 1
    // the used protorunes go to the refund pointer, which is address 2
    // protorune 2 is unused, will transfer to address 1. unused protorune 1 will also go to address 1
    let { block, premineAmount } = await createMultipleProtomessageFixture({
      protocolTag: TEST_PROTOCOL_TAG,
      protomessagePointer: 2, // address 1
      protomessageRefundPointer: 1, // address 2
      calldata: Buffer.from("test calldata"),
      amount1: amount1,
      amount2: 0n,
    });
    program.setBlock(block.toHex());
    await program.run("_start"); // default behavior is to refund to refundPointer (address 1)
    await expectRunesBalances(TEST_BTC_ADDRESS1, 1).isZero();
    await expectRunesBalances(TEST_BTC_ADDRESS2, 2).isZero();
    await expectProtoRunesBalances(
      TEST_BTC_ADDRESS2,
      2,
      TEST_PROTOCOL_TAG,
    ).equals([amount1]);
    await expectProtoRunesBalances(
      TEST_BTC_ADDRESS1,
      1,
      TEST_PROTOCOL_TAG,
    ).equals([premineAmount - amount1, premineAmount]);
  });

  it("should test depositAll", async () => {
    let { block, runeId, premineAmount } = await createProtomessageFixture({
      protocolTag: TEST_PROTOCOL_TAG,
      protomessagePointer: 2, // address 1
      protomessageRefundPointer: 1, // address 2
    });
    program.setBlock(block.toHex());
    await program.run("testProtomessageDepositAll"); // calls depositAll
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
    ).isZero();
    const runtimeStats = await runtime(program, TEST_PROTOCOL_TAG, {
      height: Number(runeId.block),
      txindex: runeId.tx,
    });
    expect(runtimeStats.balances.length).to.equal(1);
    expect(runtimeStats.balances[0].balance).to.equal(premineAmount);
  });
  // TODO: Fix this test
  // it("should test depositAll multiple protoburns", async () => {
  //   const amount1 = 100000n;
  //   let { block, runeId1, premineAmount } =
  //     await createMultipleProtomessageFixture({
  //       protocolTag: TEST_PROTOCOL_TAG,
  //       protomessagePointer: 2, // address 1
  //       protomessageRefundPointer: 1, // address 2
  //       calldata: Buffer.from("test calldata"),
  //       amount1: amount1,
  //       amount2: 0n,
  //     });
  //   program.setBlock(block.toHex());
  //   await program.run("testProtomessageDepositAll"); // calls depositAll on all protorune inputs
  //   await expectRunesBalances(TEST_BTC_ADDRESS1, 1).isZero();
  //   await expectRunesBalances(TEST_BTC_ADDRESS2, 2).isZero();
  //   await expectProtoRunesBalances(
  //     TEST_BTC_ADDRESS2,
  //     2,
  //     TEST_PROTOCOL_TAG
  //   ).isZero();
  //   await expectProtoRunesBalances(
  //     TEST_BTC_ADDRESS1,
  //     1,
  //     TEST_PROTOCOL_TAG
  //   ).equals([premineAmount]);
  //   const runtimeStats = await runtime(program, TEST_PROTOCOL_TAG, {
  //     height: Number(runeId1.block),
  //     txindex: runeId1.tx,
  //   });
  //   expect(runtimeStats.balances.length).to.equal(1);
  //   expect(runtimeStats.balances[0].balance).to.equal(amount1);
  // });
  it("should test forwardAll", async () => {
    let { block, runeId, premineAmount } = await createProtomessageFixture({
      protocolTag: TEST_PROTOCOL_TAG,
      protomessagePointer: 2, // address 1
      protomessageRefundPointer: 1, // address 2
    });
    program.setBlock(block.toHex());
    await program.run("testProtomessageForwardAll"); // calls forwardAll, forwarding all protorunes to address 1
    await expectRunesBalances(TEST_BTC_ADDRESS1, 1).isZero();
    await expectRunesBalances(TEST_BTC_ADDRESS2, 2).isZero();
    await expectProtoRunesBalances(
      TEST_BTC_ADDRESS1,
      1,
      TEST_PROTOCOL_TAG,
    ).equals([premineAmount]);
    await expectProtoRunesBalances(
      TEST_BTC_ADDRESS2,
      2,
      TEST_PROTOCOL_TAG,
    ).isZero();
    const runtimeStats = await runtime(program, TEST_PROTOCOL_TAG, {
      height: Number(runeId.block),
      txindex: runeId.tx,
    });
    expect(runtimeStats.balances.length).to.equal(0);
  });
  it("should test a mixture of deposit, forward, and refund", async () => {
    let { block, runeId, premineAmount } = await createProtomessageFixture({
      protocolTag: TEST_PROTOCOL_TAG,
      protomessagePointer: 2, // address 1
      protomessageRefundPointer: 1, // address 2
    });
    program.setBlock(block.toHex());
    await program.run("testSimpleProtorune");
    await expectRunesBalances(TEST_BTC_ADDRESS1, 1).isZero();
    await expectRunesBalances(TEST_BTC_ADDRESS2, 2).isZero();
    await expectProtoRunesBalances(
      TEST_BTC_ADDRESS1,
      1,
      TEST_PROTOCOL_TAG,
    ).equals([premineAmount / 2n]);
    await expectProtoRunesBalances(
      TEST_BTC_ADDRESS2,
      2,
      TEST_PROTOCOL_TAG,
    ).equals([premineAmount / 4n]);
    const runtimeStats = await runtime(program, TEST_PROTOCOL_TAG, {
      height: Number(runeId.block),
      txindex: runeId.tx,
    });
    expect(runtimeStats.balances[0].balance).to.equal(premineAmount / 4n);
  });
  it("should test refunding existing forwards and deposits", async () => {
    let { block, runeId, premineAmount } = await createProtomessageFixture({
      protocolTag: TEST_PROTOCOL_TAG,
      protomessagePointer: 2, // address 1
      protomessageRefundPointer: 1, // address 2
    });
    program.setBlock(block.toHex());
    await program.run("testRefundProtorune");
    // await expectRunesBalances(TEST_BTC_ADDRESS1, 1).isZero();
    // await expectRunesBalances(TEST_BTC_ADDRESS2, 2).isZero();
    await expectProtoRunesBalances(
      TEST_BTC_ADDRESS2,
      2,
      TEST_PROTOCOL_TAG,
    ).equals([(7n * premineAmount) / 8n]);
    await expectProtoRunesBalances(
      TEST_BTC_ADDRESS1,
      1,
      TEST_PROTOCOL_TAG,
    ).equals([premineAmount / 8n]);
    const runtimeStats = await runtime(program, TEST_PROTOCOL_TAG, {
      height: Number(runeId.block),
      txindex: runeId.tx,
    });
    // expect(runtimeStats.balances[0].balance).to.equal([premineAmount / 8n]);
  });
  // TODO: Fix
  // it("two inputs to a protomessage should both be transferred", async () => {
  //   let { block, runeId } = await createProtomessageFixture({
  //     protomessagePointer: 2, // address 1
  //     protomessageRefundPointer: 1, // address 2
  //   });
  //   program.setBlock(block.toHex());
  //   await program.run("testRefundProtorune");
  //   await expectRunesBalances(TEST_BTC_ADDRESS1, 1).isZero();
  //   await expectRunesBalances(TEST_BTC_ADDRESS2, 2).isZero();
  //   await expectProtoRunesBalances(
  //     TEST_BTC_ADDRESS1,
  //     1,
  //     TEST_PROTOCOL_TAG,
  //   ).equals(premineAmount / 8n);
  //   await expectProtoRunesBalances(
  //     TEST_BTC_ADDRESS2,
  //     2,
  //     TEST_PROTOCOL_TAG,
  //   ).equals((7n * premineAmount) / 8n);
  //   const runtimeStats = await runtime(program, TEST_PROTOCOL_TAG, {
  //     height: Number(runeId.block),
  //     txindex: runeId.tx,
  //   });
  //   expect(runtimeStats.balances[0].balance).to.equal(premineAmount / 8n);
  // });
});
