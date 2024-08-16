export declare function encodeProtoburn(runes: {
    id: {
        block: bigint;
        tx: number;
    };
    amount: bigint;
}[], protocolTag: bigint, address: string, output: any): Promise<import("bitcoinjs-lib").Psbt>;
