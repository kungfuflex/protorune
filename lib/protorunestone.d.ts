import { Edict } from "@magiceden-oss/runestone-lib/dist/src/edict";
import { u32 } from "@magiceden-oss/runestone-lib/dist/src/integer";
import { Option } from "@magiceden-oss/runestone-lib/dist/src/monads";
export declare class ProtoRunestone {
    readonly pointer: Option<u32>;
    readonly edicts: Edict[];
    constructor(pointer: Option<u32>, edicts: Edict[]);
    encipher(): Buffer;
}
