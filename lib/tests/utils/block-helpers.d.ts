import bitcoinjs = require("bitcoinjs-lib");
export declare const buildCoinbase: (outputs: any) => bitcoinjs.Transaction;
export declare const buildInput: (o: any) => any;
export declare const buildTransaction: (ins: any, outs: any) => bitcoinjs.Transaction;
export declare const buildCoinbaseToAddress: (address: string) => bitcoinjs.Transaction;
export declare const buildDefaultBlock: () => bitcoinjs.Block;
