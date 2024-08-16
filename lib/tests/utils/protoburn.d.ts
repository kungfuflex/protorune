import { ProtoStone } from "../../src.ts/protostone";
import bitcoinjs = require("bitcoinjs-lib");
/**
 * Outputs
 *  - [0]: runestone with protostones inside
 *  - [1-n): outputs (regular p2pkh) defined by outputs
 *  - (n, m): these are pointers that don't actually exist, but are used to target the specific protostone by edicts
 *
 *
 * @param inputs
 * @param edicts
 * @param outputIndexToReceiveProtorunes which output receives protorunes
 * @param outputs p2pkh outputs
 * @param protocolTag
 * @param block
 * @param runeTransferPointer which ouput receives leftover runes
 * @returns
 */
export declare const constructProtoburnTransaction: (inputs: {
    inputTxHash: Buffer | undefined;
    inputTxOutputIndex: number;
}[], edicts: {
    id: {
        block: bigint;
        tx: number;
    };
    amount: bigint;
    output: number;
}[], outputIndexToReceiveProtorunes: number, outputs: {
    address: string;
    btcAmount: number;
}[], protocolTag: bigint, block: bitcoinjs.Block, runeTransferPointer: number) => bitcoinjs.Block;
/**
 * Outputs
 *  - [0]: runestone with protostones inside
 *  - [1-n): outputs (regular p2pkh) defined by outputs
 *  - (n, m): these are pointers that don't actually exist, but are used to target the specific protostone by edicts
 *
 *
 * @param inputs
 * @param edicts
 * @param outputIndexToReceiveProtorunes which output receives protorunes
 * @param outputs p2pkh outputs
 * @param protocolTag
 * @param block
 * @param runeTransferPointer which ouput receives leftover runes
 * @returns
 */
export declare const constructProtostoneTx: (inputs: {
    inputTxHash: Buffer | undefined;
    inputTxOutputIndex: number;
}[], outputs: {
    address: string;
    btcAmount: number;
}[], edicts?: {
    id: {
        block: bigint;
        tx: number;
    };
    amount: bigint;
    output: number;
}[], protostones?: ProtoStone[], block?: bitcoinjs.Block, runeTransferPointer?: number) => bitcoinjs.Block;
