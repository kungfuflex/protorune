import bitcoinjs = require("bitcoinjs-lib");
/**
 * Fixture creates a block with 3 transactions:
 *  - tx 1: coinbase that transfers all bitcoins to ADDRESS1
 *  - tx 2: runestone that has two outputs
 *    - output 0: runestone etch, transfer all runes to pointer = 1 which is ADDRESS1
 *    - output 1: ADDRESS1 p2pkh
 *    - output 2: ADDRESS2 p2pkh
 *  - tx 3: runestone with protoburn
 *    - output 0: runestone with edicts transferring half of the runes to output 0, which has the protoburn.
 *                the protoburn transfers the protorunes to output 1.
 *                The leftover runes get transferred to the pointer, which is also output 0 (the protoburn)
 *                All runes end up getting converted to protorunes and sent to ADDRESS2
 *    - output 1: ADDRESS2 p2pkh
 *    - output 2: ADDRESS1 p2pkh
 *    - note, this will protoburn all the runes that address 1 had and transfer all to ADDRESS2
 *
 * Ending balances if omitBurn=true:
 *  - ADDRESS1 balances
 *    - 1 sat
 *    - 2100000005000000 runes
 *    - 0 protorunes
 *  - ADDRESS2 balances
 *    - 624999999 sat
 *    - 0 runes
 *    - 0 protorunes
 *
 * Ending balances if omitBurn=false:
 *  - ADDRESS1 balances
 *    - 1 sat
 *    - 0 runes
 *    - 0 protorunes
 *  - ADDRESS2 balances
 *    - 624999999 sat
 *    - 0 runes
 *    - 2100000005000000 protorunes
 */
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
    amount: bigint;
}>;
