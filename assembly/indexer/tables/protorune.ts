import { IndexPointer } from "metashrew-as/assembly/indexer/tables";

export const PROTOCOLS_TO_INDEX = new Set<u16>();

export class PROTORUNE_TABLE {
  ptr: IndexPointer;
  OUTPOINT_TO_RUNES: IndexPointer;
  HEIGHT_TO_TRANSACTION_IDS: IndexPointer;
  SYMBOL: IndexPointer;
  SPACERS: IndexPointer;
  DIVISIBILITY: IndexPointer;
  ETCHINGS: IndexPointer;
  RUNE_ID_TO_ETCHING: IndexPointer;
  ETCHING_TO_RUNE_ID: IndexPointer;
  constructor(ptr: IndexPointer) {
    this.ptr = ptr;
    this.OUTPOINT_TO_RUNES = ptr.keyword("/runes/byoutpoint/");
    this.HEIGHT_TO_TRANSACTION_IDS = ptr.keyword("/txids/byheight");
    this.SYMBOL = ptr.keyword("/runes/symbol/");
    this.SPACERS = ptr.keyword("/runes/spaces/");
    this.DIVISIBILITY = ptr.keyword("/runes/divisibility/");
    this.ETCHINGS = ptr.keyword("/runes/names");
    this.RUNE_ID_TO_ETCHING = ptr.keyword("/etching/byruneid/");
    this.ETCHING_TO_RUNE_ID = ptr.keyword("/runeid/byetching/");
  }
  static for(protocol: u16): PROTORUNE_TABLE {
    const buf = new ArrayBuffer(2);
    store<u16>(changetype<usize>(buf), protocol);
    return new PROTORUNE_TABLE(IndexPointer.for("/runes/proto").select(buf));
  }
  unwrap(): IndexPointer {
    return this.ptr;
  }
}
