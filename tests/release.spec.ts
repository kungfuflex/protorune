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
  // it("should check name things", async () => {
  //   const program = new IndexerProgram(
  //     new Uint8Array(
  //       Array.from(
  //         fs.readFileSync(path.join(__dirname, "..", "build", "debug.wasm")),
  //       ),
  //     ).buffer,
  //   );
  //   program.on("log", console.log);
  //   program.setBlock(
  //     fs.readFileSync(path.join(__dirname, "849236.hex"), "utf8"),
  //   );
  //   program.setBlockHeight(849236);
  //   await program.run("testFieldToName");
  //   let spaced_name = "UNCOMMONGOODS";
  //   const spacer = "•";
  //   const spacers = 128;
  //   const bitField = spacers.toString(2);
  //   let x = 0;
  //   bitField
  //     .split("")
  //     .reverse()
  //     .map((d, i) => {
  //       if (d == "1") {
  //         spaced_name = `${spaced_name.slice(0, i + 1 + x)}${spacer}${spaced_name.slice(i + 1 + x)}`;
  //         x++;
  //       }
  //     });
  //   console.log(spaced_name);
  //   return program;
  // });
});
