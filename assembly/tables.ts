import { _flush, input, get, set } from "metashrew-as/assembly/indexer/index";
import { Box } from "metashrew-as/assembly/utils/box";

export class Node {
  public key: ArrayBuffer;
  public value: ArrayBuffer;
  constructor(key: ArrayBuffer, value: ArrayBuffer) {
    this.key = key;
    this.value = value;
  }
  @inline
  static from(key: ArrayBuffer, value: ArrayBuffer): Node {
    return new Node(key, value);
  }
}

export class Table {
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
  static subKey(key: ArrayBuffer, subKey: ArrayBuffer): ArrayBuffer {
    return Box.concat([
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
    let i = 0;
    while (tip.byteLength !== 0) {
      previous = tip;
      nextKey = Table.nextKey(Table.subKey(tableKey, tip));
      tip = get(nextKey);
      i++;
    }
    if (i > 0) {
      set(Table.previousKey(Table.subKey(tableKey, subKey)), previous);
      set(Table.nextKey(Table.subKey(tableKey, previous)), subKey);
    }
    set(Table.subKey(tableKey, subKey), value);
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
  fromLinkedList(key: ArrayBuffer): Array<Node> {
    let tip = this.get(Table.tipKey(key));
    const result: Array<Node> = [];
    if (tip.byteLength === 0) return [];
    while (tip.byteLength !== 0) {
      result.push(Node.from(tip, this.get(Table.subKey(key, tip))));
      tip = this.get(Table.nextKey(Table.subKey(key, tip)));
    }
    return result;
  }
  public set(key: ArrayBuffer, value: ArrayBuffer): void {
    set(Table.keyFor(this.keyPrefix, key), value);
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
    set(Table.keyFor(this.keyPrefix, key), new ArrayBuffer(0));
  }

  public get(key: ArrayBuffer): ArrayBuffer {
    return get(Table.keyFor(this.keyPrefix, key));
  }
}
export const HEIGHT_TO_BLOCKHASH = Table.open(String.UTF8.encode("/block/byheight"));
export const BLOCKHASH_TO_HEIGHT = Table.open(String.UTF8.encode("/height/byhash"));
export const SAT_TO_SATPOINT = Table.open(String.UTF8.encode("/satpoint/byordinal"));
export const SAT_TO_INSCRIPTION_ID = Table.open(String.UTF8.encode("/inscription/byordinal"));
export const INSCRIPTION_TO_SATPOINT = Table.open(String.UTF8.encode("/satpoint/byinscription"));
export const SATPOINT_TO_INSCRIPTION = Table.open(String.UTF8.encode("/inscription/bysatpoint"));
export const OUTPOINT_TO_SATRANGES = Table.open(String.UTF8.encode("/satranges/byoutpoint"));
export const OUTPOINT_TO_VALUE = Table.open(String.UTF8.encode("/outpoint/tovalue"));
export const SEQUENCE_TO_INSCRIPTION_ID = Table.open(String.UTF8.encode("/inscription/bysequence"));
export const SEQUENCE_NUMBER_TO_SATPOINT = Table.open(String.UTF8.encode("/satpoint/bysequencenumber"));
export const SEQUENCE_NUMBER_TO_ENTRY = Table.open(String.UTF8.encode("/entry/bysequencenumber"));
export const SEQUENCE_NUMBER_TO_CHILDREN = Table.open(String.UTF8.encode("/children/bysequencenumber"));
export const SAT_TO_SEQUENCE_NUMBER = Table.open(String.UTF8.encode("/sequencenumber/bysat"));
export const INSCRIPTION_NUMBER_TO_SEQUENCE_NUMBER = Table.open(String.UTF8.encode("/sequencenumber/byinscriptionnumber"));
export const ID_TO_SEQUENCE_NUMBER = Table.open(String.UTF8.encode("/sequencenumber/byid"));
export const HOME_INSCRIPTIONS = Table.open(String.UTF8.encode("/homeinscriptions"));
export const SATPOINT_TO_SEQUENCE_NUMBER = Table.open(String.UTF8.encode("/sequencenumber/bysatpoint"));
export const CONTENT_TYPE_TO_COUNT = Table.open(String.UTF8.encode("/count/bycontenttype"));
export const VALUE_CACHE = Table.open(String.UTF8.encode("/valuecache"));
export const TRANSACTION_ID_TO_TRANSACTION = Table.open(String.UTF8.encode("/transaction/byid"));
