import fs from "fs-extra";

import { inspect } from "node:util";
import { IndexerProgram } from "metashrew-test";
import path from "path";
import {
  decodeOutpointView,
  encodeOutpointInput,
  encodeWalletInput,
  decodeWalletOutput,
} from "../src.ts";
import { sha3_256 } from "js-sha3";
import { readFileSync } from "fs";

const stripHexPrefix = (key: string) => {
  if (key.substr(0, 2) === "0x") return key.substr(2);
  return key;
};

const addHexPrefix = (s: string) => {
  if (s.substr(0, 2) === "0x") return s;
  return "0x" + s;
};

const split = (ary, sym) => {
  return ary.reduce((r, v) => {
    if (v === sym) {
      r.push([]);
    } else {
      if (r.length === 0) r.push([]);
      r[r.length - 1].push(v);
    }
    return r;
  }, []);
};

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
    }
  );
  return (await response.json()).result;
}

const formatKey = (key: string) => {
  return split(
    Array.from(Buffer.from(stripHexPrefix(key), "hex")),
    Buffer.from("/")[0]
  ).reduce((r, v, i, ary) => {
    const token = Buffer.from(v).toString("utf8");
    if (!(i + v.length)) {
      return r + "/";
    } else if (token.match(/^[0-9a-zA-Z]+$/)) {
      return r + "/" + token;
    } else {
      return r + "/" + addHexPrefix(Buffer.from(v).toString("hex"));
    }
  }, "");
};

const formatKv = (kv: any) => {
  return Object.fromEntries(
    Object.entries(kv).map(([key, value]) => [formatKey(key), value])
  );
};

const ln = (v) => {
  console.log(v);
  return v;
};

const runTest = (s) =>
  it(s, async () => {
    const program = new IndexerProgram(
      new Uint8Array(
        Array.from(
          await fs.readFile(path.join(__dirname, "..", "build", "debug.wasm"))
        )
      ).buffer
    );
    program.on("log", (v) => console.log(v));
    await program.run(s);
    await new Promise((r) => setTimeout(r, 2000));
    return program;
  });
const log = (obj: any) => {
  console.log(inspect(obj, false, 10, true));
};
describe("metashrew-runes", () => {
  let hash: string;
  before(async () => {
    const file = readFileSync("build/debug.wasm");
    hash = sha3_256(file);
  });
  // [
  //   "test_indexEtching",
  //   "test_genesisTransaction",
  //   "test_secondTransaction",
  //   "test_oneFortyEight",
  //   "test_fifteen",
  // ].map((v) => runTest(v));
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
          params: [`0x${hash}`, func, input, "841569"],
        }),
      });
    };
  }
  it("should test address output", async () => {
    const wallets = [
      "bc1pwpd3dfvvsy2gcdc6du27wkzwl86pp50arycwzrh3r28a5g46fjfsluvsr9",
      "bc1pzskepp4ys2septcfz483lmk22xvwdgydgt5r4fgmfagqegwh5a8se48yxf",
      "bc1qp0wdw7ttsayed7rvsteajys74wyjfak68eufve",
    ];

    await wallets.reduce(
      async (a, wallet) => {
        await a;
        const walletView = buildView("runesbyaddress");
        const input = encodeWalletInput(wallet);
        let response = await walletView(input);
        const json = await response.json();
        const { result } = json;
        log(result);
        if (result.length == 0) return [...(await a), null];
        const outputs = decodeWalletOutput(result);
        log(outputs);
        return [...(await a), outputs];
      },
      Promise.resolve([] as any[])
    );
  });
  it("should test balanceSheet Output", async () => {
    const inputs = [
      ["d66defd5daa5b101d0bf9fb47581dbd76827572646211f5058328b28765e9fda", "0"],
      ["8c6c6b86069435308f468a3db4063d8b266b6dfc845ea4c5202920b13b464c44", "1"],
      ["e79134080a83fe3e0e06ed6990c5a9b63b362313341745707a2bff7d788a1375", "1"],
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
        //log(outpoint);
      }
    });
  });
  /*
  it('should run runes genesis block', async () => {
  const program = new IndexerProgram(
    new Uint8Array(
      Array.from(
        await fs.readFile(
          path.join(__dirname, "..", "build", "debug.wasm"),
        ),
      ),
    ).buffer,
  );
  program.on("log", (v) => console.log(v));
  program.setBlock(await fs.readFile(path.join(__dirname, 'runes-genesis.hex'), 'utf8'));
  program.setBlockHeight(840000);
  await program.run('_start');
  return program;
    
  });
  */
});
