import { expect } from "chai";
import fs from "fs-extra";
import { EventEmitter } from "events";
import { IndexerProgram } from "metashrew-test";
import path from "path";


describe("metashrew index", () => {
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
    await program.run('_start');
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
    const ms = await program.run('_start');
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
    const ms = await program.run('_start');
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
    program.on("log", (v) => console.log(v));
    const ms = await program.run('_start');
    // console.log(program.kv);
    // console.log(String(ms) + "ms");
  });

    
});
