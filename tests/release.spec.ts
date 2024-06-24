import fs from "node:fs";

import { inspect } from "node:util";
import { IndexerProgram } from "metashrew-test";
import * as path from "node:path";

const log = (obj: any) => {
  console.log(inspect(obj, false, 10, true));
};

// const runTest = (s) =>
//   it(s, async () => {
//     const program = new IndexerProgram(
//       new Uint8Array(
//         Array.from(
//           fs.readFileSync(path.join(__dirname, "..", "build", "debug.wasm")),
//         ),
//       ).buffer,
//     );
//     program.on("log", log);
//     await program.run(s);
//     await new Promise((r) => setTimeout(r, 2000));
//     return program;
//   });
describe("metashrew-runes", () => {
  // [
  //   "test_indexEtching",
  //   "test_genesisTransaction",
  //   "test_secondTransaction",
  //   "test_oneFortyEight",
  //   "test_fifteen",
  // ].map((v) => runTest(v));

  it("should check runes witness script", async () => {
    const program = new IndexerProgram(
      new Uint8Array(
        Array.from(
          fs.readFileSync(path.join(__dirname, "..", "build", "debug.wasm")),
        ),
      ).buffer,
    );
    program.on("log", console.log);
    program.setBlock(
      fs.readFileSync(path.join(__dirname, "849236.hex"), "utf8"),
    );
    program.setBlockHeight(849236);
    await program.run("testCommitment");
    return program;
  });
});
