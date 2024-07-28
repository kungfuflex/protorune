import { OutpointResponse, BalanceSheet } from "./proto/metashrew-runes";
export type Rune = {
    id: string;
    name: string;
    spacedName: string;
    divisibility: number;
    spacers: number;
    symbol: string;
};
export type RuneOutput = {
    rune: Rune;
    balance: BigInt;
};
export type OutPoint = {
    runes: RuneOutput[];
    outpoint: {
        txid: string;
        vout: number;
    };
    output: {
        value: any;
        script: string;
    };
    height: number;
    txindex: number;
};
export declare function encodeOutpointInput(txid: string, pos: number): string;
export declare function decodeRunes(balances: BalanceSheet): RuneOutput[];
export declare function decodeOutpointViewBase(op: OutpointResponse): OutPoint;
export declare function decodeOutpointView(hex: string): OutPoint;
