"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.buildBytes32 = exports.buildProgram = exports.formatKv = exports.formatValue = exports.formatKey = exports.split = exports.addHexPrefix = exports.stripHexPrefix = exports.log = exports.DEBUG_WASM = exports.TEST_BTC_ADDRESS2 = exports.TEST_BTC_ADDRESS1 = exports.EMPTY_WITNESS = exports.EMPTY_BUFFER = void 0;
const metashrew_test_1 = require("metashrew-test");
const path_1 = __importDefault(require("path"));
const util_1 = require("util");
const node_fs_1 = __importDefault(require("node:fs"));
exports.EMPTY_BUFFER = Buffer.allocUnsafe(0);
exports.EMPTY_WITNESS = [];
exports.TEST_BTC_ADDRESS1 = "16aE44Au1UQ5XqKMUhCMXTX7ZxbmAcQNA1";
exports.TEST_BTC_ADDRESS2 = "1AdAhGdUgGF6ip7bBcVvuWYuuCxAeonNaK";
function findRootDir(currentDir) {
    const parentDir = path_1.default.resolve(currentDir, "..");
    if (node_fs_1.default.existsSync(path_1.default.join(currentDir, "package.json"))) {
        return currentDir;
    }
    else if (currentDir === parentDir) {
        // If we reach the root directory of the file system, throw an error.
        throw new Error("Root directory not found");
    }
    else {
        // Recur with the parent directory.
        return findRootDir(parentDir);
    }
}
exports.DEBUG_WASM = node_fs_1.default.readFileSync(path_1.default.join(findRootDir(__dirname), "build", "debug.wasm"));
const log = (obj) => {
    console.log((0, util_1.inspect)(obj, false, 10, true));
};
exports.log = log;
const stripHexPrefix = (key) => {
    if (key.substr(0, 2) === "0x")
        return key.substr(2);
    return key;
};
exports.stripHexPrefix = stripHexPrefix;
const addHexPrefix = (s) => {
    if (s.substr(0, 2) === "0x")
        return s;
    return "0x" + s;
};
exports.addHexPrefix = addHexPrefix;
const split = (ary, sym) => {
    return ary.reduce((r, v) => {
        if (v === sym) {
            r.push([]);
        }
        else {
            if (r.length === 0)
                r.push([]);
            r[r.length - 1].push(v);
        }
        return r;
    }, []);
};
exports.split = split;
const formatKey = (key) => {
    return (0, exports.split)(Array.from(Buffer.from((0, exports.stripHexPrefix)(key), "hex")), Buffer.from("/")[0]).reduce((r, v, i, ary) => {
        const token = Buffer.from(v).toString("utf8");
        if (!(i + v.length)) {
            return r + "/";
        }
        else if (token.match(/^[0-9a-zA-Z]+$/)) {
            return r + "/" + token;
        }
        else {
            return r + "/" + (0, exports.addHexPrefix)(Buffer.from(v).toString("hex"));
        }
    }, "");
};
exports.formatKey = formatKey;
const formatValue = (v) => {
    const token = Buffer.from(v.substr(2), "hex").toString("utf8");
    if (token.match(/^[0-9a-zA-Z]+$/))
        return token;
    return v;
};
exports.formatValue = formatValue;
const formatKv = (kv) => {
    return Object.fromEntries(Object.entries(kv).map(([key, value]) => [(0, exports.formatKey)(key), value]));
};
exports.formatKv = formatKv;
const buildProgram = (wasm) => {
    const program = new metashrew_test_1.IndexerProgram(new Uint8Array(Array.from(wasm)).buffer);
    program.on("log", (v) => console.log(v.replace(/\0/g, "").trim()));
    return program;
};
exports.buildProgram = buildProgram;
const buildBytes32 = () => Buffer.allocUnsafe(32);
exports.buildBytes32 = buildBytes32;
//# sourceMappingURL=general.js.map