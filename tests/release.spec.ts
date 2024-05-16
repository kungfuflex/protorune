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
  it("indexes the genesis rune", async () => {
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
    await program.run("test_indexEtching");
    console.log(program.kv);
  });
});
