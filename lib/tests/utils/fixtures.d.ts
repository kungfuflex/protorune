import bitcoinjs = require("bitcoinjs-lib");
export declare function createProtoruneFixture(omitBurn?: boolean, premineAmount?: bigint): Promise<{
    input: {
        inputTxHash: Buffer;
        inputTxOutputIndex: number;
    };
    block: bitcoinjs.Block;
    output: {
        address: string;
        btcAmount: number;
    };
    refundOutput: {
        address: string;
        btcAmount: number;
    };
    runeId: {
        block: bigint;
        tx: number;
    };
    premineAmount: bigint;
}>;