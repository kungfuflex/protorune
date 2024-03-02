"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.IndexerProgram = exports.readArrayBuffer = exports.toU32LEBytes = exports.readArrayBufferAsHex = exports.readArrayBufferAsUtf8 = void 0;
const events_1 = __importDefault(require("events"));
const rlp_1 = __importDefault(require("rlp"));
const chunk_1 = __importDefault(require("lodash/chunk"));
const readArrayBufferAsUtf8 = (memory, ptr) => {
    return Buffer.from(Array.from(new Uint8Array((0, exports.readArrayBuffer)(memory, ptr)))).toString("utf8");
};
exports.readArrayBufferAsUtf8 = readArrayBufferAsUtf8;
const readArrayBufferAsHex = (memory, ptr) => {
    return ("0x" +
        Buffer.from(Array.from(new Uint8Array((0, exports.readArrayBuffer)(memory, ptr)))).toString("hex"));
};
exports.readArrayBufferAsHex = readArrayBufferAsHex;
const toU32LEBytes = (n) => {
    const ary = new Uint32Array(1);
    ary[0] = n;
    const byteArray = new Uint8Array(ary.buffer);
    return Buffer.from(Array.from(byteArray));
};
exports.toU32LEBytes = toU32LEBytes;
const readArrayBuffer = (memory, ptr) => {
    const ary = Array.from(new Uint8Array(memory.buffer));
    const data = Buffer.from(ary);
    const length = data.readUInt32LE(ptr - 4);
    return new Uint8Array(ary.slice(ptr, ptr + length)).buffer;
};
exports.readArrayBuffer = readArrayBuffer;
const stripHexPrefix = (s) => (s.substr(0, 2) === "0x" ? s.substr(2) : s);
const addHexPrefix = (s) => (s.substr(0, 2) === "0x" ? s : "0x" + s);
class IndexerProgram extends events_1.default {
    constructor(program) {
        super();
        this.program = program;
        this.kv = Object.create(null);
    }
    get memory() {
        return this.instance.instance.exports.memory;
    }
    __log(ptr) {
        const ary = Array.from(new Uint8Array(this.memory.buffer));
        const data = Buffer.from(ary);
        const length = data.readUInt32LE(ptr - 4);
        this.emit("log", Buffer.from(ary.slice(ptr, ptr + length)).toString("utf8"));
    }
    __load_input(ptr) {
        const view = new Uint8Array(this.memory.buffer);
        const block = Buffer.concat([(0, exports.toU32LEBytes)(this.blockHeight), Buffer.from(stripHexPrefix(this.block), "hex")]);
        for (let i = 0; i < block.length; i++) {
            view[i + ptr] = block.readUInt8(i);
        }
    }
    __host_len() {
        return stripHexPrefix(this.block).length / 2;
    }
    __flush(v) {
        const list = rlp_1.default.decode((0, exports.readArrayBufferAsHex)(this.memory, v));
        (0, chunk_1.default)(list, 2).forEach(([key, value]) => {
            this.kv[addHexPrefix(Buffer.from(Array.from(key)).toString("hex"))] = addHexPrefix(Buffer.from(Array.from(value)).toString("hex"));
        });
    }
    __get(k, v) {
        const key = (0, exports.readArrayBufferAsHex)(this.memory, k);
        const value = this.kv[key] || '0x';
        this.emit("get", [key, value]);
        const view = new Uint8Array(this.memory.buffer);
        const valueData = Buffer.from(stripHexPrefix(value), "hex");
        for (let i = 0; i < valueData.length; i++) {
            view[v + i] = valueData.readUInt8(i);
        }
    }
    __get_len(k) {
        const key = (0, exports.readArrayBufferAsHex)(this.memory, k);
        if (!this.kv[key])
            return 0;
        return stripHexPrefix(key).length / 2;
    }
    abort() {
        this.emit("abort");
        throw Error("abort!");
    }
    setBlock(block) {
        this.block = block;
        return this;
    }
    setBlockHeight(blockHeight) {
        this.blockHeight = blockHeight;
        return this;
    }
    async run(symbol) {
        this.instance = await WebAssembly.instantiate(this.program, {
            env: {
                abort: (...args) => this.abort(...args),
                __log: (...args) => this.__log(...args),
                __flush: (...args) => this.__flush(...args),
                __get: (...args) => this.__get(...args),
                __get_len: (...args) => this.__get_len(...args),
                __host_len: () => this.__host_len(),
                __load_input: (ptr) => this.__load_input(ptr),
            },
        });
        return await this.instance.instance.exports[symbol]();
    }
}
exports.IndexerProgram = IndexerProgram;
//# sourceMappingURL=runtime.js.map