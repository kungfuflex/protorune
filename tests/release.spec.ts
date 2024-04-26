import { expect } from "chai";
import fs from "fs-extra";
import { EventEmitter } from "events";
import { IndexerProgram } from "metashrew-test";
import path from "path";

const stripHexPrefix = (key: string) => {
  if (key.substr(0, 2) === '0x') return key.substr(2);
  return key;
};

const addHexPrefix = (s: string) => {
  if (s.substr(0, 2) === '0x') return s;
  return '0x' + s;
};

const split = (ary, sym) => {
  return ary.reduce((r, v) => {
    if (v === sym) {
      r.push([]);
    } else {
      if (r.length ===0) r.push([]);
      r[r.length - 1].push(v);
    }
    return r;
  }, []);
};
  
const formatKey = (key: string) => {
  return split(Array.from(Buffer.from(stripHexPrefix(key), 'hex')), Buffer.from('/')[0]).reduce((r, v, i, ary) => {
    const token = Buffer.from(v).toString('utf8');
    if (!(i + v.length)) {
      return  r + '/';
    } else if (token.match(/^[0-9a-zA-Z]+$/)) {
      return r + '/' + token;
    } else {
      return r + '/' + addHexPrefix(Buffer.from(v).toString('hex'));
    }
  }, '');
};

const formatKv = (kv: any) => {
  return Object.fromEntries(Object.entries(kv).map(([key, value]) => [ formatKey(key), value ]));
};

const ln = (v) => { console.log(v); return v; };

describe("metashrew-runes", () => {
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
        "https://testnet.sandshrew.io/v1/154f9aaa25a986241357836c37f8d71",
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
      return ln(await response.json()).result;
    }
    async function buildBlock(ary: Array<string>): string {
      const result = [];
      for (let i = 0; i < ary.length; i++) {
        result.push(((v) => console.log(v))(await rpcCall("gettransaction", [ ary[i] ])));
      }
      return result;
    }
    const block = await buildBlock([
      "db58ef3b9b05658c145c1dfeb54b98fce61f08bb323836eb027676e2a2c6c6ff",
      "df858e723f991905d28b7774a6633ded169f335791d5c7290e6c80246d98cb04"
    ]);
    console.log(block);
    async function runBlock(i: number) {
      program.setBlock(
        await rpcCall("getblock", [await rpcCall("getblockhash", [i]), 0]),
      );
      program.setBlockHeight(i);
      await program.run("_start");
    }
    for (let i = 0; i < 10; i++) {
      console.log(`BLOCK ${i}`);
      await runBlock(i);
    }
  });
});
