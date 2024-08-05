import { IndexPointer } from "metashrew-as/assembly/indexer/tables";
import { u128 } from "as-bignum/assembly";
import { console } from "metashrew-as/assembly/utils";

class ProtocolIndexer {
  set: Set<string> = new Set<string>();
  add(val: u128): void {
    this.set.add(val.toString());
  }
  has(val: u128): bool {
    return this.set.has(val.toString());
  }
  toString(): string {
    let str = "";
    const set = this.set.values();
    for (let i = 0; i < set.length; i++) {
      str += set[i] + ", ";
    }
    return str;
  }
}

export const PROTOCOLS_TO_INDEX = new ProtocolIndexer();

export class ProtoruneTable {
  ptr: IndexPointer;
  OUTPOINT_TO_RUNES: IndexPointer;
  HEIGHT_TO_TRANSACTION_IDS: IndexPointer;
  SYMBOL: IndexPointer;
  SPACERS: IndexPointer;
  DIVISIBILITY: IndexPointer;
  ETCHINGS: IndexPointer;
  RUNE_ID_TO_ETCHING: IndexPointer;
  ETCHING_TO_RUNE_ID: IndexPointer;
  RUNTIME_BALANCE: IndexPointer;
  INTERNAL_MINT: IndexPointer;
  constructor(ptr: IndexPointer) {
    this.ptr = ptr;
    this.OUTPOINT_TO_RUNES = ptr.keyword("/byoutpoint/");
    this.HEIGHT_TO_TRANSACTION_IDS = ptr.keyword("/txids/byheight");
    this.SYMBOL = ptr.keyword("/symbol/");
    this.SPACERS = ptr.keyword("/spaces/");
    this.DIVISIBILITY = ptr.keyword("/divisibility/");
    this.ETCHINGS = ptr.keyword("/names");
    this.RUNE_ID_TO_ETCHING = ptr.keyword("/etching/byruneid/");
    this.ETCHING_TO_RUNE_ID = ptr.keyword("/runeid/byetching/");
    this.RUNTIME_BALANCE = ptr.keyword("/runtime/balance");
    this.INTERNAL_MINT = ptr.keyword("/mint/isinternal");
  }
  static for(protocol: u128): ProtoruneTable {
    return new ProtoruneTable(
      IndexPointer.for("/runes/proto/").keyword(protocol.toString()),
    );
  }
  static for_str(protocol: string): ProtoruneTable {
    return new ProtoruneTable(
      IndexPointer.for("/runes/proto/").keyword(protocol),
    );
  }
  unwrap(): IndexPointer {
    return this.ptr;
  }
}
