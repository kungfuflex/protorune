import { _flush, input, get, set } from "metashrew-as/assembly/indexer/index";

class Table {
  public keyPrefix: ArrayBuffer;
  constructor(prefix: ArrayBuffer) {
    this.keyPrefix = prefix;

  }
  static lengthKey(key: ArrayBuffer): ArrayBuffer {
    return Box.concat([
      Box.from(key),
      Box.from(String.UTF8.encode("/length"))
    ]);
  }
  static tipKey(key: ArrayBuffer): ArrayBuffer {
    return Box.concat([
      Box.from(key),
      Box.from(String.UTF8.encode("/tip"))
    ]);
  }
  static nextKey(key: ArrayBuffer): ArrayBuffer {
    return Box.concat([
      Box.from(key),
      Box.from(String.UTF8.encode("/next"))
    ]);
  }
  static subKey(key: ArrayBuffer: subKey: ArrayBuffer): ArrayBuffer {
    return Box.from([
      Box.from(key),
      Box.from(String.UTF8.encode("/")),
      Box.from(subKey)
    ]);
  }
  static previousKey(key: ArrayBuffer): ArrayBuffer {
    return Box.concat([
      Box.from(key),
      Box.from(String.UTF8.encode("/previous"))
    ]);
  }
  static appendNode(key: ArrayBuffer, subKey: ArrayBuffer, value: ArrayBuffer): void {
    const tableKey = Table.keyFor(key);
    let nextKey = Table.tipKey(tableKey);
    let tip = get(tipKey);
    let previous = new ArrayBuffer(0);
    while (tip.byteLength !== 0) {
      
      
      nextKey = Table.nextKey(Table.subKey(tableKey, tip));
      tip = get(nextKey);
    }
    set(nextKey, subKey);
    set(Table.subKey(

    
  }

  static listKey(key: ArrayBuffer, i: u32): ArrayBuffer {
    return Box.concat([
      Box.from(key),
      Box.from(String.UTF8.encode("/")),
      Box.from(String.UTF8.encode(i.toString(10)))
    ]);
  }
  static keyFor(table: ArrayBuffer, key: ArrayBuffer): ArrayBuffer {
    return Box.concat([Box.from(table), Box.from(key)]);
  }
  public tableKey(key: ArrayBuffer): ArrayBuffer {
    return Table.keyFor(this.keyPrefix, key);
  }
  static open(prefix: ArrayBuffer): Table {
    return new Table(prefix);
  }

  public insert(key: ArrayBuffer, value: ArrayBuffer): void {
    set(Index.keyFor(this.keyPrefix, key), value);
  }
  public append(key: ArrayBuffer, value: ArrayBuffer): void {
    const lengthKey = Table.lengthKey(this.tableKey(key));
    const lengthLookup = get(lengthKey);
    const length = lengthLookup.byteLength === 0 ? 0 : parsePrimitive<u32>(Box.from(lengthLookup))!
    set(Table.listKey(this.tableKey(key), length), value);
    const newLength = new ArrayBuffer(4);
    store<u32>(newLength, length + 1);
    set(lengthKey, newLength);
  }
  public pop(key: ArrayBuffer): ArrayBuffer {
    const lengthKey = Table.lengthKey(this.tableKey(key));
    const lengthLookup = get(lengthKey);
    const length = lengthLookup.byteLength === 0 ? 0 : parsePrimitive<u32>(Box.from(lengthLookup))!
    if (length == 0) return new ArrayBuffer(0);
    get(Table.listKey(this.tableKey(key), length - 1));
    const newLength = new ArrayBuffer(4);
    store<u32>(newLength, length - 1);
    set(lengthKey, newLength);
  }
  public remove(key: ArrayBuffer): void {
    set(Index.keyFor(this.keyPrefix, key), new ArrayBuffer(0));
  }

  public get(key: ArrayBuffer): ArrayBuffer {
    return get(Index.keyFor(this.keyPrefix, key));
  }
}
const HEIGHT_TO_BLOCKHASH = Table.open(String.UTF8.encode("/block/byheight"));
const BLOCKHASH_TO_HEIGHT = String.UTF8.encode("/height/byhash");
const SAT_TO_SATPOINT = String.UTF8.encode("/satpoint/byordinal");
const SAT_TO_INSCRIPTION_ID = String.UTF8.encode("/inscription/byordinal");
const INSCRIPTION_TO_SATPOINT = String.UTF8.encode("/satpoint/byinscription");
const SATPOINT_TO_INSCRIPTION = String.UTF8.encode("/inscription/bysatpoint");
const OUTPOINT_TO_SATRANGE = String.UTF8.encode("/sat/byoutpoint");
const OUTPOINT_TO_VALUE = String.UTF8.encode("/outpoint/tovalue");
const SEQUENCE_TO_INSCRIPTION_ID = String.UTF8.encode("/inscription/bysequence");
