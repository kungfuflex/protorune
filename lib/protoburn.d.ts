import { u128, u32 } from "@magiceden-oss/runestone-lib/dist/src/integer";
import { Option } from "@magiceden-oss/runestone-lib/dist/src/monads";
export declare class ProtoBurn {
    protocolTag: Option<u128>;
    pointer: Option<u32>;
    constructor(obj: {
        protocolTag: bigint;
        pointer: number;
    });
    encipher(): Buffer;
}
