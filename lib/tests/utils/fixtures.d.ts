import bitcoinjs = require("bitcoinjs-lib");
export declare function createProtoruneFixture(omitBurn?: boolean, premineAmount?: bigint, { runeId, TEST_PROTOCOL_TAG, }?: {
    runeId: {
        block: bigint;
        tx: number;
    };
    TEST_PROTOCOL_TAG: bigint;
}, _block?: bitcoinjs.Block): Promise<{
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
    TEST_PROTOCOL_TAG: bigint;
}>;
