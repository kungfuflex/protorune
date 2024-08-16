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
import { createProtoruneFixture } from "./utils/fixtures";
import { expectBalances } from "./utils/matchers";

// const TEST_PROTOCOL_TAG = parseInt("0x112233445566778899aabbccddeeff10", 16);
const TEST_PROTOCOL_TAG = BigInt("0x400000000000000000");

describe("protomessage", () => {
  let program: ReturnType<typeof buildProgram>;
  const premineAmount = 2100000005000000n;
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
    let { block, premineAmount } = await createProtoruneFixture(true);
    program.setBlock(block.toHex());
    await program.run("_start");
    await expectRunesBalances(TEST_BTC_ADDRESS1, 1).equals(premineAmount);
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
  it("should test fixture initial values", async () => {
    let { block, premineAmount } = await createProtoruneFixture();
    program.setBlock(block.toHex());
    await program.run("_start");
    await expectRunesBalances(TEST_BTC_ADDRESS1, 1).isZero();
    await expectRunesBalances(TEST_BTC_ADDRESS2, 2).isZero();
    await expectProtoRunesBalances(
      TEST_BTC_ADDRESS2,
      2,
      TEST_PROTOCOL_TAG,
    ).equals(premineAmount);
    await expectProtoRunesBalances(
      TEST_BTC_ADDRESS1,
      1,
      TEST_PROTOCOL_TAG,
    ).isZero();
  });
  it("should index protomessage in the same tx as protoburn", async () => {
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
    // right now, address 2 has all the protorunes. we want to depositAll
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
          pointer: 1, // address 2
          refundPointer: 2, // address 1
          calldata,
        }),
      ],
      block,
      2,
    );
    program.setBlock(block.toHex());
    console.log("indexing message block");
    await program.run("testProtomessage"); // calls depositAll
    await expectRunesBalances(TEST_BTC_ADDRESS1, 1).isZero();
    await expectRunesBalances(TEST_BTC_ADDRESS2, 2).isZero();
    await expectProtoRunesBalances(
      TEST_BTC_ADDRESS2,
      2,
      TEST_PROTOCOL_TAG,
    ).isZero();
    // console.log(formatKv(program.kv));
    await expectProtoRunesBalances(
      TEST_BTC_ADDRESS1,
      1,
      TEST_PROTOCOL_TAG,
    ).isZero();
    const runtimeStats = await runtime(program, TEST_PROTOCOL_TAG, {
      height: Number(runeId.block),
      txindex: runeId.tx,
    });
    expect(runtimeStats.balances[0].balance).to.equal(premineAmount);
  });
});
