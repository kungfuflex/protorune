import bitcoinjs = require("bitcoinjs-lib");
import { u128 } from "@magiceden-oss/runestone-lib/dist/src/integer";
export declare const constructProtomessageBlock: (inputs: {
    inputTxHash: Buffer | undefined;
    inputTxOutputIndex: number;
}[], outputs: {
    address: string;
    btcAmount: number;
}[], { runeId, amount, }: {
    runeId: {
        block: bigint;
        tx: number;
    };
    amount: bigint;
}, protocolTag: bigint, message: {
    calldata: u128[];
    pointer: number;
    refundPointer: number;
}, block?: bitcoinjs.Block) => bitcoinjs.Block;
