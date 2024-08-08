import { Edict } from "@magiceden-oss/runestone-lib/dist/src/edict";
import { u128, u32 } from "@magiceden-oss/runestone-lib/dist/src/integer";
import { Option } from "@magiceden-oss/runestone-lib/dist/src/monads";
export declare class ProtoRunestone {
    pointer: Option<u32>;
    protocolTag: u128;
    edicts: Edict[];
    constructor({ pointer, edicts, protocolTag }: any);
    encipher(): Buffer;
}
