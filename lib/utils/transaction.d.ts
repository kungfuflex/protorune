import * as bitcoin from "bitcoinjs-lib";
export declare function decodeRawTx(tx: string): Promise<any>;
export declare function getFeeEstimates(): Promise<any>;
export declare function getVSize(tx: string): Promise<number>;
type UTXO = {
    txid: string;
    vout: number;
    value: number;
};
export declare function getInputsFor(address: string, amount: number): Promise<{
    inputs: UTXO[];
    utxos: UTXO[];
}>;
export declare function buildRunesTransaction(outputs: any[], address: string, output: any): Promise<bitcoin.Psbt>;
export {};
