import { IndexerProgram } from "metashrew-test";
export declare const EMPTY_BUFFER: Buffer;
export declare const EMPTY_WITNESS: any[];
export declare const TEST_BTC_ADDRESS1 = "16aE44Au1UQ5XqKMUhCMXTX7ZxbmAcQNA1";
export declare const TEST_BTC_ADDRESS2 = "1AdAhGdUgGF6ip7bBcVvuWYuuCxAeonNaK";
export declare const DEBUG_WASM: Buffer;
export declare const log: (obj: any) => void;
export declare const stripHexPrefix: (key: string) => string;
export declare const addHexPrefix: (s: string) => string;
export declare const split: (ary: any, sym: any) => any;
export declare const formatKey: (key: string) => any;
export declare const formatValue: (v: any) => any;
export declare const formatKv: (kv: any) => any;
export declare const buildProgram: (wasm: Buffer) => IndexerProgram;
export declare const buildBytes32: () => Buffer;
