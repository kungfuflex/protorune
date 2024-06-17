import { OutPoint, RuneOutput } from "./outpoint";
export declare function decodeWalletOutput(hex: string): {
    outpoints: OutPoint[];
    balanceSheet: RuneOutput[];
};
export declare function encodeWalletInput(address: string): string;
