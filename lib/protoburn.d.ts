import { u32 } from "@magiceden-oss/runestone-lib/dist/src/integer";
import { Option } from "@magiceden-oss/runestone-lib/dist/src/monads";
export declare class ProtoBurn {
    protocolTag: Option<u32>;
    pointer: Option<u32>;
    constructor(obj: {
        protocolTag: number;
        pointer: number;
    });
    encipher(): Buffer;
}
