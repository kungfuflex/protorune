import { OutPoint, RuneOutput } from "metashrew-runes/lib/src.ts/outpoint";
import { MetashrewRunes } from "metashrew-runes/lib/src.ts/rpc";
export declare class ProtorunesRpc extends MetashrewRunes {
    protorunesbyaddress({ address, protocolTag }: any): Promise<{
        outpoints: OutPoint[];
        balanceSheet: RuneOutput[];
    }>;
    protorunesbyoutpoint({ txid, vout, protocolTag }: any): Promise<any>;
    runtime({ protocolTag }: any): Promise<{
        balances: RuneOutput[];
    }>;
}
