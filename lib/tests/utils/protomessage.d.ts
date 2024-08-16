import bitcoinjs = require("bitcoinjs-lib");
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
    calldata: Buffer;
    pointer: number;
    refundPointer: number;
}, block?: bitcoinjs.Block) => bitcoinjs.Block;
