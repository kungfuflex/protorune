import { u128, u32 } from "@magiceden-oss/runestone-lib/dist/src/integer";
import { Option } from "@magiceden-oss/runestone-lib/dist/src/monads";
import { Edict } from "@magiceden-oss/runestone-lib/dist/src/edict";
export type ProtoBurn = {
    pointer: Option<u32>;
};
export type ProtoMessage = {
    calldata: u128[];
    pointer: Option<u32>;
    refundPointer: Option<u32>;
};
export declare class ProtoStone {
    burn?: ProtoBurn;
    message?: ProtoMessage;
    protocolTag: u128;
    edicts?: Edict[];
    constructor({ burn, message, protocolTag, edicts, }: {
        protocolTag: bigint;
        burn?: {
            pointer: number;
        };
        message?: {
            calldata: Buffer;
            pointer: number;
            refundPointer: number;
        };
        edicts?: Edict[];
    });
    encipher_payloads(): Buffer[];
    static burn({ protocolTag, edicts, ...burn }: {
        protocolTag: bigint;
        pointer: number;
        edicts?: Edict[];
    }): ProtoStone;
    static message({ protocolTag, edicts, ...message }: {
        calldata: Buffer;
        protocolTag: bigint;
        pointer: number;
        refundPointer: number;
        edicts?: Edict[];
    }): ProtoStone;
}
