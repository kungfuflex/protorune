/// <reference types="node" />
/// <reference types="node" />
import EventEmitter from "events";
export declare const readArrayBufferAsUtf8: (memory: WebAssembly.Memory, ptr: number) => string;
export declare const readArrayBufferAsHex: (memory: WebAssembly.Memory, ptr: number) => string;
export declare const toU32LEBytes: (n: any) => Buffer;
export declare const readArrayBuffer: (memory: WebAssembly.Memory, ptr: number) => ArrayBufferLike;
export declare class IndexerProgram extends EventEmitter {
    block: string;
    program: ArrayBuffer;
    kv: any;
    blockHeight: number;
    constructor(program: ArrayBuffer);
    get memory(): any;
    __log(ptr: number): void;
    __load_input(ptr: number): void;
    __host_len(): number;
    __flush(v: number): void;
    __get(k: number, v: number): void;
    __get_len(k: number): number;
    abort(): void;
    setBlock(block: string): IndexerProgram;
    setBlockHeight(blockHeight: number): IndexerProgram;
    run(symbol: string): Promise<any>;
}
