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
import { IndexerProgram } from "metashrew-test";
import { createProtoruneFixture } from "./utils/fixtures";

// const TEST_PROTOCOL_TAG = parseInt("0x112233445566778899aabbccddeeff10", 16);
const TEST_PROTOCOL_TAG = BigInt("0x400000000000000000");

describe("subprotocol protorunes", () => {
  let program: IndexerProgram;

  beforeEach(async () => {
    program = buildProgram(DEBUG_WASM);
    program.setBlockHeight(840000);
  });

  // it("should etch runes if optional etching is enabled", async () => {
  //   const fixtures = await createProtoruneFixture();
  //   let block = fixtures.block;
  //   //@TODO: create protostone encoded with runestone etch
  // });
});
