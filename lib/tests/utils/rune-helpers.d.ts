import bitcoinjs = require("bitcoinjs-lib");
import { IndexerProgram } from "metashrew-test";
export declare const runesbyaddress: (program: IndexerProgram, address: string) => Promise<any>;
export declare const initCompleteBlockWithRuneEtching: (outputs: any, pointer: number, divisibility?: number, premineAmount?: bigint, runeName?: string, symbol?: string, block?: bitcoinjs.Block) => bitcoinjs.Block;
export declare const transferRune: (inputs: {
    inputTxHash: Buffer | undefined;
    inputTxOutputIndex: number;
}[], runeId: {
    block: bigint;
    tx: number;
}, runeTransferAmount: bigint, outputIndexToReceiveRunes: number, outputs: {
    address: string;
    btcAmount: number;
}[], outputRunePointer?: number, block?: bitcoinjs.Block) => bitcoinjs.Block;
export declare const transferRuneMultiple: (inputs: {
    inputTxHash: Buffer | undefined;
    inputTxOutputIndex: number;
}[], runeId: {
    block: bigint;
    tx: number;
}[], runeTransferAmount: bigint[], outputIndexToReceiveRunes: number[], outputs: {
    address: string;
    btcAmount: number;
}[], outputRunePointer: number, block?: bitcoinjs.Block) => bitcoinjs.Block;
