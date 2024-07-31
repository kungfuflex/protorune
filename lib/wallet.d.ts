export declare function encodeProtorunesWalletInput(address: string, protocol_tag: bigint): string;
export declare function encodeRuntimeInput(protocol_tag: bigint): string;
export declare function decodeRuntimeOutput(hex: string): {
    balance: bigint;
};
