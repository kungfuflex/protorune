import { Edict } from "@magiceden-oss/runestone-lib/dist/src/edict";
import { Etching } from "@magiceden-oss/runestone-lib/dist/src/etching";
import { u128, u32 } from "@magiceden-oss/runestone-lib/dist/src/integer";
import { Option } from "@magiceden-oss/runestone-lib/dist/src/monads";
import { RuneId } from "@magiceden-oss/runestone-lib/dist/src/runeid";
import { Flaw } from "@magiceden-oss/runestone-lib/dist/src/flaw";
import { RuneEtchingSpec } from "@magiceden-oss/runestone-lib/dist/src/indexer";
import { ProtoStone } from "./protostone";
export declare const MAX_SPACERS = 134217727;
export type RunestoneTx = {
    vout: {
        scriptPubKey: {
            hex: string;
        };
    }[];
};
type Payload = Buffer | Flaw;
export declare function isValidPayload(payload: Payload): payload is Buffer;
export declare const MAX_LEB128_BYTES_IN_U128 = 18;
export declare const MAX_U128_BYTES_COMPAT_W_RUNES = 15;
export declare function encodeProtostone(values: u128[]): Buffer;
export type RunestoneProtostoneSpec = {
    mint?: {
        block: bigint;
        tx: number;
    };
    pointer?: number;
    etching?: RuneEtchingSpec;
    edicts?: {
        id: {
            block: bigint;
            tx: number;
        };
        amount: bigint;
        output: number;
    }[];
    protostones?: ProtoStone[];
};
export declare class RunestoneProtostoneUpgrade {
    readonly mint: Option<RuneId>;
    readonly pointer: Option<u32>;
    readonly edicts: Edict[];
    readonly etching: Option<Etching>;
    readonly protostones: ProtoStone[];
    constructor(mint: Option<RuneId>, pointer: Option<u32>, edicts: Edict[], etching: Option<Etching>, protostones: ProtoStone[]);
    encipher(): Buffer;
}
/**
 * Low level function to allow for encoding runestones without any indexer and transaction checks.
 *
 * @param runestone runestone spec to encode as runestone
 * @returns encoded runestone bytes
 * @throws Error if encoding is detected to be considered a cenotaph
 */
export declare function encodeRunestoneProtostone(runestone: RunestoneProtostoneSpec): {
    encodedRunestone: Buffer;
    etchingCommitment?: Buffer;
};
export {};
