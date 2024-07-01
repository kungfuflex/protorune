import { OutPoint, RuneOutput } from "./outpoint";
export declare class MetashrewRunes {
    baseUrl: string;
    blockTag: string;
    constructor({ baseUrl, blockTag }: any);
    _call({ method, input }: {
        method: any;
        input: any;
    }): Promise<string>;
    runesbyaddress({ address: string }: any): Promise<{
        outpoints: OutPoint[];
        balanceSheet: RuneOutput[];
    }>;
}
