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

describe("protoruneRuneId", () => {
    it("testing encode/decode for single bytes", async () => {
        const program = buildProgram(DEBUG_WASM);
        await program.run("test_ProtoruneRuneId1");
        const kv = formatKv(program.kv);
        expect(kv["/test/protorune/runeid/block"]).to.equal("0x7f000000000000000000000000000000");
        expect(kv["/test/protorune/runeid/tx"]).to.equal("0x64320000000000000000000000000000");
        expect(kv["/test/protorune/runeid/decoded/0"]).to.equal("0x32000000000000000000000000000000");
        expect(kv["/test/protorune/runeid/decoded/1"]).to.equal("0x64000000000000000000000000000000");
    });
    it("testing encode/decode for multiple bytes", async () => {
        const program = buildProgram(DEBUG_WASM);
        await program.run("test_ProtoruneRuneId2");
        const kv = formatKv(program.kv);
        expect(kv["/test/protorune/runeid/block"]).to.equal("0x7f000000000000000000000000000000");
        expect(kv["/test/protorune/runeid/tx"]).to.equal("0x03dceb948017ebe18000000000000000");
        expect(kv["/test/protorune/runeid/decoded/0"]).to.equal("0x80f0fa02000000000000000000000000");
        expect(kv["/test/protorune/runeid/decoded/1"]).to.equal("0x00ca9a3b000000000000000000000000");
    });
    it("testing encode/decode for multiple bytes 2", async () => {
        const program = buildProgram(DEBUG_WASM);
        await program.run("test_ProtoruneRuneId3");
        const kv = formatKv(program.kv);
        console.log(kv)
        expect(kv["/test/protorune/runeid/block"]).to.equal("0x7f000000000000000000000000000000");
        expect(kv["/test/protorune/runeid/tx"]).to.equal("0x05cba0de8003dceb948017ebe1800000");
        expect(kv["/test/protorune/runeid/decoded/0"]).to.equal("0x80f0fa02000000000000000000000000");
        expect(kv["/test/protorune/runeid/decoded/1"]).to.equal("0x00ca9a3b000000000000000000000000");
        expect(kv["/test/protorune/runeid/decoded/2"]).to.equal("0x002f6859000000000000000000000000");
    });
    it("testing encode/decode for multiple bytes into block area", async () => {
        const program = buildProgram(DEBUG_WASM);
        await program.run("test_ProtoruneRuneId4");
        const kv = formatKv(program.kv);
        console.log(kv)
        expect(kv["/test/protorune/runeid/block"]).to.equal("0x7febe180000000000000000000000000");
        expect(kv["/test/protorune/runeid/tx"]).to.equal("0x07b9d6a88005cba0de8003dceb948017");
        expect(kv["/test/protorune/runeid/decoded/0"]).to.equal("0x80f0fa02000000000000000000000000");
        expect(kv["/test/protorune/runeid/decoded/1"]).to.equal("0x00ca9a3b000000000000000000000000");
        expect(kv["/test/protorune/runeid/decoded/2"]).to.equal("0x002f6859000000000000000000000000");
        expect(kv["/test/protorune/runeid/decoded/3"]).to.equal("0x00943577000000000000000000000000");
    });
    it("testing encode when bytes > 32", async () => {
        const program = buildProgram(DEBUG_WASM);
        await program.run("test_ProtoruneRuneId5");
        const kv = formatKv(program.kv);
        console.log(kv)
        expect(kv["/test/protorune/runeid/block"]).to.equal("0x00000000000000000000000000000000");
        expect(kv["/test/protorune/runeid/tx"]).to.equal("0x00000000000000000000000000000000");
    });
});
