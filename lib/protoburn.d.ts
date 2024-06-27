import { ProtoBurn as ProtoBurnLayout } from "./proto/protorune";
export declare class ProtoBurn implements ProtoBurnLayout {
    protocolTag: Uint8Array;
    pointer: number;
    constructor(obj: ProtoBurnLayout);
    encipher(): Buffer;
}
