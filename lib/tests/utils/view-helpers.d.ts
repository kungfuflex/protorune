import { IndexerProgram } from "metashrew-test";
export declare const protorunesbyaddress: (program: IndexerProgram, address: string, protocolTag: bigint) => Promise<any>;
export declare const runtime: (program: IndexerProgram, protocolTag: bigint, runeId: {
    height: number;
    txindex: number;
}) => Promise<any>;
