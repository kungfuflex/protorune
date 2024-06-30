import fs from "node:fs";

import { inspect } from "node:util";
import { IndexerProgram } from "metashrew-test";
import * as path from "node:path";
import bitcoinjs = require("bitcoinjs-lib");
import { encodeRunestone } from "@magiceden-oss/runestone-lib";

const log = (obj: any) => {
  console.log(inspect(obj, false, 10, true));
};

const DEBUG_WASM = fs.readFileSync(
  path.join(__dirname, "..", "build", "debug.wasm"),
);

const buildProgram = () => {
  const program = new IndexerProgram(
    new Uint8Array(Array.from(DEBUG_WASM)).buffer,
  );
  program.on("log", (v) => console.log(v.replace(/\0/g, "").trim()));
  return program;
};

const buildBytes32 = () => Buffer.allocUnsafe(32);

const EMPTY_BUFFER = Buffer.allocUnsafe(0);
const EMPTY_WITNESS = [];

const TEST_BTC_ADDRESS1 = "16aE44Au1UQ5XqKMUhCMXTX7ZxbmAcQNA1";
const TEST_BTC_ADDRESS2 = "1AdAhGdUgGF6ip7bBcVvuWYuuCxAeonNaK";

const buildCoinbase = (outputs) => {
  const tx = new bitcoinjs.Transaction();
  tx.ins.push({
    hash: buildBytes32(),
    index: bitcoinjs.Transaction.DEFAULT_SEQUENCE,
    script: EMPTY_BUFFER,
    sequence: bitcoinjs.Transaction.DEFAULT_SEQUENECE,
    witness: EMPTY_WITNESS,
  });
  outputs.forEach((v) => tx.outs.push(v));
  return tx;
};

const buildInput = (o) => {
  return {
    ...o,
    script: EMPTY_BUFFER,
    sequence: bitcoinjs.Transaction.DEFAULT_SEQUENCE,
    witness: EMPTY_WITNESS,
  };
};

const buildTransaction = (ins, outs) => {
  const tx = new bitcoinjs.Transaction();
  ins.forEach((v) => tx.ins.push(v));
  outs.forEach((v) => tx.outs.push(v));
  return tx;
};

const buildCoinbaseToTestAddress = () =>
  buildCoinbase([
    {
      script: bitcoinjs.payments.p2pkh({
        address: TEST_BTC_ADDRESS1,
        network: bitcoinjs.networks.bitcoin,
      }).output,
      value: 625000000n,
    },
  ]);

const buildDefaultBlock = () => {
  const block = new bitcoinjs.Block();
  block.prevHash = buildBytes32();
  block.merkleRoot = buildBytes32();
  block.witnessCommit = buildBytes32();
  block.transactions = [];
  return block;
};

const runTest = (s) =>
  it(s, async () => {
    const program = buildProgram();
    await program.run(s);
    await new Promise((r) => setTimeout(r, 2000));
    return program;
  });

describe("metashrew-runes", () => {
  it("should check runes witness script", async () => {
    const program = buildProgram();
    program.setBlock(
      fs.readFileSync(path.join(__dirname, "849236.hex"), "utf8"),
    );
    program.setBlockHeight(849236);
    await program.run("testCommitment");
    return program;
  });
  it("should index Runestone", async () => {
    const program = buildProgram();
    program.setBlockHeight(840001);
    const block = buildDefaultBlock();
    const coinbase = buildCoinbaseToTestAddress();
    block.transactions.push(coinbase);
    const runesGenesis = encodeRunestone({
      etching: {
        divisibility: 8,
        premine: 2100000000000000n,
        name: "GENESNS•RUNE•FR",
	symbol: 'G'
      },
      pointer: 1,
    }).encodedRunestone;
    const transaction = buildTransaction(
      [{ hash: coinbase.getHash(), index: 0 }],
      [
        {
          script: runesGenesis,
          value: 0n,
        },
        {
          script: bitcoinjs.payments.p2pkh({
            address: TEST_BITCOIN_ADDRESS1,
            network: bitcoinjs.networks.bitcoin,
          }).output,
          value: 1n,
        },
        {
          script: bitcoinjs.payments.p2pkh({
            network: bitcoinjs.networks.bitcoin,
            address: TEST_BITCOIN_ADDRESS_1,
          }).output,
          value: 624999999n,
        },
      ],
    );
    block.transactions.push(transaction);
    program.setBlock("0x" + block.encodeHex());
    await program.run();
  });
});
