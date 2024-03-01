import { IndexerProgram } from "metashrew-test";
import path from "path";
import fs from "fs-extra";
import { EventEmitter } from "events";

describe("metashrew index", () => {
  it("should run __start against ordinal-gensis block", async () => {
    const wasmHex = path.join(__dirname, "..", "build", "release.wasm");

    const indexer = new IndexerProgram(
      new Uint8Array(
        Array.from(
          await fs.readFile(
            wasmHex
          ),
        ),
      ).buffer,
    );

    indexer.setBlock(
      await fs.readFile(path.join(__dirname, "ordinal-genesis.hex"), "utf8")
    );

    indexer.setBlockHeight(767430);
    const result = await indexer.run("_start");
  });

});
