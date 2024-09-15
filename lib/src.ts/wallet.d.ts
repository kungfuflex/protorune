/**
 * Protocol tag needs to be LEB128 encoded to pass into the protocol
 * @param address
 * @param protocolTag
 * @returns ProtorunesWalletRequest protobuf hex buffer
 */
export declare function encodeProtorunesWalletInput(address: string, protocolTag: bigint): string;
export declare function encodeRuntimeInput(protocolTag: bigint): string;
export declare function decodeRuntimeOutput(hex: string): {
    balances: import("metashrew-runes/lib/src.ts/outpoint").RuneOutput[];
};
