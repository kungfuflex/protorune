import { inspect } from "node:util";
import {
  decodeOutpointView,
  encodeOutpointInput,
  encodeWalletInput,
  decodeWalletOutput,
} from "../src.ts";
import { sha3_256 } from "js-sha3";
import { readFileSync } from "fs";

const log = (obj: any) => {
  console.log(inspect(obj, false, 10, true));
};

describe("metashrew-runes", () => {
  let hash: string;
  before(async () => {
    const file = readFileSync("build/debug.wasm");
    hash = sha3_256(file);
  });
  function buildView(func: string) {
    return (input: string) => {
      return fetch("http://localhost:8080", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({
          jsonrpc: "2.0",
          id: 0,
          method: "metashrew_view",
          params: [func, input, "841569"],
        }),
      });
    };
  }
  // it("should test address output", async () => {
  //   const wallets = [
  //     "bc1pwpd3dfvvsy2gcdc6du27wkzwl86pp50arycwzrh3r28a5g46fjfsluvsr9",
  //     "bc1pzskepp4ys2septcfz483lmk22xvwdgydgt5r4fgmfagqegwh5a8se48yxf",
  //     "bc1qp0wdw7ttsayed7rvsteajys74wyjfak68eufve",
  //   ];

  //   await wallets.reduce(
  //     async (a, wallet) => {
  //       await a;
  //       const walletView = buildView("runesbyaddress");
  //       const input = encodeWalletInput(wallet);
  //       let response = await walletView(input);
  //       const json = await response.json();
  //       const { result } = json;
  //       if (result.length == 0) return [...(await a), null];
  //       const outputs = decodeWalletOutput(result);
  //       log(outputs);
  //       return [...(await a), outputs];
  //     },
  //     Promise.resolve([] as any[]),
  //   );
  // });
  it("should test balanceSheet Output", async () => {
    const inputs = [
      // ["d66defd5daa5b101d0bf9fb47581dbd76827572646211f5058328b28765e9fda", "0"],
      // ["8c6c6b86069435308f468a3db4063d8b266b6dfc845ea4c5202920b13b464c44", "1"],
      // ["e79134080a83fe3e0e06ed6990c5a9b63b362313341745707a2bff7d788a1375", "1"],
      ["e5c74c1cffbc96e3d825635a9dd0ea16f99d1f240e2ab076eb88fea9ac6de64f", "0"],
    ].map((d) => encodeOutpointInput(d[0], parseInt(d[1])));
    const outpoint = buildView("outpoint");
    const res = await inputs.reduce(async (_res: Promise<any[]>, input) => {
      const r = await _res;

      let response = await outpoint(input);
      r.push((await response.json())["result"]);
      return r;
    }, Promise.resolve([]));
    res.map((hex) => {
      if (hex.length > 0) {
        const outpoint = decodeOutpointView(hex);
        log(outpoint);
      }
    });
  });
});
