import { Box } from "../utils/box";
import { parsePrimitive, parseBytes } from "../utils/utils";
import { nullptr, Pointer, toPointer } from "../utils/pointer";
import { Transaction } from "./transaction";

export class Header {
    public version: i32;
    public prevBlock: Box;
    public merkleRoot: Box;
    public time: u32;
    public bits: u32;
    public nonce: u32;
    public bytes: Box;
    constructor(data: Box) {
        let head = data.start;
        this.version = parsePrimitive<i32>(data);
        this.prevBlock = parseBytes(data, 32);
        this.merkleRoot = parseBytes(data, 32);
        this.time = parsePrimitive<u32>(data);
        this.bits = parsePrimitive<u32>(data);
        this.nonce = parsePrimitive<u32>(data);
        let tail = data.start;
        this.bytes = toPointer(head).toBox(tail - head);
    }
}

export class Block {
    public bytes: Box;
    public header: Header;
    public transactions: Array<Transaction>;
    public prevBlock: Box;
    public merkleRoot: Box;
    constructor(data: Box) {
        this.transactions = nullptr<Array<Transaction>>();
        this.prevBlock = nullptr<Box>();
        this.merkleRoot = nullptr<Box>();
        let head = data.start;
        this.header = new Header(data);
        this.transactions = Transaction.parseTransactionsFromBlock(data);
        let tail = data.start;
        this.bytes = toPointer(head).toBox(tail - head); 
    }
    
    // returns the coinbase transaction if there is one
    coinbase(): Transaction | null {
        if (this.transactions.length > 0) {
            return this.transactions[0];
        } else {
            return null
        }
    }

    // returns list of txids in the block transaction(s) body including the coinbase txid
    txids(): Array<ArrayBuffer> {
        let txids = new Array<ArrayBuffer>();
        for (let i = 0; i < this.transactions.length; i++) {
            txids.push(this.transactions[i].txid());
        }
        return txids;
    }
}
