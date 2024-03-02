import { expect } from "chai";
import fs from "fs-extra";
import { EventEmitter } from "events";
import { IndexerProgram } from "metashrew-test";
import path from "path";

describe("metashrew index", () => {
	/*
  it("indexes the genesis block", async () => {
    const program = new IndexerProgram(
      new Uint8Array(
        Array.from(
          await fs.readFile(
            path.join(__dirname, "..", "build", "release.wasm"),
          ),
        ),
      ).buffer,
    );
    program.setBlock(
      await fs.readFile(path.join(__dirname, "genesis.hex"), "utf8"),
    );
    program.setBlockHeight(0);
    program.on("log", (v) => console.log(v));
    await program.run("_start");
    // console.log(program.kv);
  });
  it("indexes the first inscription", async () => {
    const program = new IndexerProgram(
      new Uint8Array(
        Array.from(
          await fs.readFile(
            path.join(__dirname, "..", "build", "release.wasm"),
          ),
        ),
      ).buffer,
    );
    program.setBlock(
      await fs.readFile(path.join(__dirname, "ordinal-genesis.hex"), "utf8"),
    );
    program.setBlockHeight(767430);
    program.on("log", (v) => console.log(v));
    const ms = await program.run("_start");
    // console.log(program.kv);
    // console.log(String(ms) + "ms");
  });
  it("indexes block 785391", async () => {
    const program = new IndexerProgram(
      new Uint8Array(
        Array.from(
          await fs.readFile(
            path.join(__dirname, "..", "build", "release.wasm"),
          ),
        ),
      ).buffer,
    );
    program.setBlock(
      await fs.readFile(path.join(__dirname, "785391.hex"), "utf8"),
    );
    program.setBlockHeight(785391);
    program.on("log", (v) => console.log(v));
    const ms = await program.run("_start");
    // console.log(program.kv);
    // console.log(String(ms) + "ms");
  });
  it("indexes block 772904", async () => {
    const program = new IndexerProgram(
      new Uint8Array(
        Array.from(
          await fs.readFile(
            path.join(__dirname, "..", "build", "release.wasm"),
          ),
        ),
      ).buffer,
    );
    program.setBlock(
      await fs.readFile(path.join(__dirname, "772904.hex"), "utf8"),
    );
    program.setBlockHeight(772904);
    prograom.on("log", (v) => console.log(v));
    const mos = await program.run("_start");
    // console.log(program.kv);
    // console.log(String(ms) + "ms");
  });
  */
  it("indexes a range of blocks", async () => {
    const program = new IndexerProgram(
      new Uint8Array(
        Array.from(
          await fs.readFile(
            path.join(__dirname, "..", "build", "release.wasm"),
          ),
        ),
      ).buffer,
    );
    program.on("log", (v) => console.log(v));
    async function rpcCall(method, params) {
      const response = await fetch(
        "https://mainnet.sandshrew.io/v1/154f9aaa25a986241357836c37f8d71",
        {
          method: "POST",
          body: JSON.stringify({
            method,
            params,
            jsonrpc: "2.0",
            id: Date.now(),
          }),
          headers: {
            "Content-Type": "application/json",
          },
        },
      );
      return (await response.json()).result;
    }
    async function runBlock(i: number) {
      program.setBlock(
        await rpcCall("getblock", [await rpcCall("getblockhash", [i]), 0]),
      );
      program.setBlockHeight(i);
      await program.run("_start");
    }
    for (let i = 772904; i < 785391; i++) {
      await runBlock(i);
    }
  });
});
