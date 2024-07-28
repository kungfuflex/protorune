<<<<<<< HEAD
import path from "path";
import fs from "node:fs";

=======
import { IndexerProgram } from "metashrew-test";
import path from "path";
import { inspect } from "util";
import fs from "node:fs";

export const EMPTY_BUFFER = Buffer.allocUnsafe(0);
export const EMPTY_WITNESS = [];

export const TEST_BTC_ADDRESS1 = "16aE44Au1UQ5XqKMUhCMXTX7ZxbmAcQNA1";
export const TEST_BTC_ADDRESS2 = "1AdAhGdUgGF6ip7bBcVvuWYuuCxAeonNaK";

>>>>>>> 645354c55e3e093d736ecc2123a5768a980d8499
function findRootDir(currentDir: string): string {
  const parentDir = path.resolve(currentDir, "..");

  if (fs.existsSync(path.join(currentDir, "package.json"))) {
    return currentDir;
  } else if (currentDir === parentDir) {
    // If we reach the root directory of the file system, throw an error.
    throw new Error("Root directory not found");
  } else {
    // Recur with the parent directory.
    return findRootDir(parentDir);
  }
}

export const DEBUG_WASM = fs.readFileSync(
  path.join(findRootDir(__dirname), "build", "debug.wasm"),
);
<<<<<<< HEAD
=======

export const log = (obj: any) => {
  console.log(inspect(obj, false, 10, true));
};

export const stripHexPrefix = (key: string) => {
  if (key.substr(0, 2) === "0x") return key.substr(2);
  return key;
};

export const addHexPrefix = (s: string) => {
  if (s.substr(0, 2) === "0x") return s;
  return "0x" + s;
};

export const split = (ary, sym) => {
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

export const formatKey = (key: string) => {
  return split(
    Array.from(Buffer.from(stripHexPrefix(key), "hex")),
    Buffer.from("/")[0],
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

export const formatValue = (v) => {
  const token = Buffer.from(v.substr(2), "hex").toString("utf8");
  if (token.match(/^[0-9a-zA-Z]+$/)) return token;
  return v;
};

export const formatKv = (kv: any) => {
  return Object.fromEntries(
    Object.entries(kv).map(([key, value]) => [formatKey(key), value]),
  );
};

export const buildProgram = (wasm: Buffer) => {
  const program = new IndexerProgram(new Uint8Array(Array.from(wasm)).buffer);
  program.on("log", (v) => console.log(v.replace(/\0/g, "").trim()));
  return program;
};

export const buildBytes32 = () => Buffer.allocUnsafe(32);
>>>>>>> 645354c55e3e093d736ecc2123a5768a980d8499
