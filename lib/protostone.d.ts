import { u128, u32 } from "@magiceden-oss/runestone-lib/dist/src/integer";
import { Option } from "@magiceden-oss/runestone-lib/dist/src/monads";
export type ProtoBurn = {
    pointer: Option<u32>;
};
export type ProtoMessage = {
    calldata: u128[];
    pointer: Option<u32>;
    refundPointer: Option<u32>;
};
export type ProtoSplit = {
    order: u32[];
};
export type Chunk = Buffer;
export type SplitResult = {
    protostone: ProtoStone;
    chunks: ProtoStone[];
};
export declare function protosplit(input: ProtoStone, voutStart: number): SplitResult;
export declare class ProtoStone {
    burn?: ProtoBurn;
    message?: ProtoMessage;
    split?: ProtoSplit;
    chunk?: Chunk;
    protocolTag: u128;
    constructor({ burn, message, protocolTag, split, chunk, }: {
        protocolTag: bigint;
        burn?: {
            pointer: number;
        };
        message?: {
            calldata: Buffer;
            pointer: number;
            refundPointer: number;
        };
        split?: {
            order: number[];
        };
        chunk?: Buffer;
    });
    encipher(): Buffer;
    static burn({ protocolTag, ...burn }: {
        protocolTag: bigint;
        pointer: number;
    }): ProtoStone;
    static split({ protocolTag, ...split }: {
        protocolTag: bigint;
        order: number[];
    }): ProtoStone;
    protosplit(voutStart: number): ReturnType<typeof protosplit>;
    static chunk(chunk: Buffer): ProtoStone;
    static message({ protocolTag, ...message }: {
        calldata: Buffer;
        protocolTag: bigint;
        pointer: number;
        refundPointer: number;
    }): ProtoStone;
}
