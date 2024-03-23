import EventEmitter from "events";
import rlp from "rlp";
import chunk from "lodash/chunk";

export const readArrayBufferAsUtf8 = (
  memory: WebAssembly.Memory,
  ptr: number,
) => {
  return Buffer.from(
    Array.from(new Uint8Array(readArrayBuffer(memory, ptr))),
  ).toString("utf8");
};

export const readArrayBufferAsHex = (
  memory: WebAssembly.Memory,
  ptr: number,
) => {
  return (
    "0x" +
    Buffer.from(
      Array.from(new Uint8Array(readArrayBuffer(memory, ptr))),
    ).toString("hex")
  );
};

export const toU32LEBytes = (n) => {
  const ary = new Uint32Array(1);
  ary[0] = n;
  const byteArray = new Uint8Array(ary.buffer);
  return Buffer.from(Array.from(byteArray));
};

export const readArrayBuffer = (memory: WebAssembly.Memory, ptr: number) => {
  const ary = Array.from(new Uint8Array(memory.buffer));
  const data = Buffer.from(ary);
  const length = data.readUInt32LE(ptr - 4);
  return new Uint8Array(ary.slice(ptr, ptr + length)).buffer;
};

const stripHexPrefix = (s) => (s.substr(0, 2) === "0x" ? s.substr(2) : s);
const addHexPrefix = (s) => (s.substr(0, 2) === "0x" ? s : "0x" + s);

export class IndexerProgram extends EventEmitter {
  public block: string;
  public program: ArrayBuffer;
  public kv: any;
  public blockHeight: number;
  constructor(program: ArrayBuffer) {
    super();
    this.program = program;
    this.kv = Object.create(null);
  }
  get memory() {
    return (this as any).instance.instance.exports.memory;
  }
  __log(ptr: number): void {
    const ary = Array.from(new Uint8Array(this.memory.buffer));
    const data = Buffer.from(ary);
    const length = data.readUInt32LE(ptr - 4);
    this.emit(
      "log",
      Buffer.from(ary.slice(ptr, ptr + length)).toString("utf8"),
    );
  }
  __load_input(ptr: number): void {
    const view = new Uint8Array(this.memory.buffer);
    const block = Buffer.concat([  toU32LEBytes(this.blockHeight), Buffer.from(stripHexPrefix(this.block), "hex") ]);
    for (let i = 0; i < block.length; i++) {
      view[i + ptr] = block.readUInt8(i);
    }
  }
  __host_len(): number {
    return stripHexPrefix(this.block).length / 2;
  }
  __flush(v: number): void {
    const list = rlp.decode(readArrayBufferAsHex(this.memory, v));
    chunk(list, 2).forEach(([key, value]: any) => {
      this.kv[
        addHexPrefix(Buffer.from(Array.from(key) as number[]).toString("hex"))
      ] = addHexPrefix(
        Buffer.from(Array.from(value) as number[]).toString("hex"),
      );
    });
  }
  __get(k: number, v: number): void {
    const key = readArrayBufferAsHex(this.memory, k);
    const value = this.kv[key] || '0x';
    this.emit("get", [key, value]);
    const view = new Uint8Array(this.memory.buffer);
    const valueData = Buffer.from(stripHexPrefix(value), "hex");
    for (let i = 0; i < valueData.length; i++) {
      view[v + i] = valueData.readUInt8(i);
    }
  }
  __get_len(k: number): number {
    const key = readArrayBufferAsHex(this.memory, k);
    if (!this.kv[key]) return 0;
    return stripHexPrefix(key).length / 2;
  }
  abort() {
    this.emit("abort");
    throw Error("abort!");
  }
  setBlock(block: string): IndexerProgram {
    this.block = block;
    return this;
  }
  setBlockHeight(blockHeight: number): IndexerProgram {
    this.blockHeight = blockHeight;
    return this;
  }
  async run(symbol: string) {
    (this as any).instance = await WebAssembly.instantiate(this.program, {
      env: {
        abort: (...args) => (this as any).abort(...args),
        __log: (...args) => (this as any).__log(...args),
        __flush: (...args) => (this as any).__flush(...args),
        __get: (...args) => (this as any).__get(...args),
        __get_len: (...args) => (this as any).__get_len(...args),
        __host_len: () => (this as any).__host_len(),
        __load_input: (ptr: number) => (this as any).__load_input(ptr),
      },
    });
    return await (this as any).instance.instance.exports[symbol]();
  }
}
