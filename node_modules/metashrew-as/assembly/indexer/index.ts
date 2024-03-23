@external("env", "__set") declare function __set(
  k: ArrayBuffer,
  v: ArrayBuffer,
): void;

@external("env", "__get") declare function __get(
  k: ArrayBuffer,
  v: ArrayBuffer,
): void;
@external("env", "__get_len") declare function __get_len(k: ArrayBuffer): i32;
@external("env", "__flush") declare function __flush(values: ArrayBuffer): void;
@external("env", "__load_input") declare function __load_input(
  block: ArrayBuffer,
): void;
@external("env", "__host_len") declare function __host_len(): i32;

import { toRLP, RLPItem } from "../utils/rlp";
import { xxh32 } from "../utils/xxh32";
import { memcpy } from "../utils/memcpy";
import { Box } from "../utils/box";
import {
  TRANSACTION_ID_TO_TRANSACTION,
  INSCRIPTION_ID_TO_INSCRIPTION,
  ACCOUNT_TO_INSCRIPTION,
  HEIGHT_TO_BLOCK_HEADER,
} from "./tables";
const _updates = new Map<u32, ArrayBuffer>();

const _updateKeys = new Map<u32, ArrayBuffer>();

const BUFFER_SIZE = <u32>0x100000;
let _filled: u32 = 0;

export function input(): ArrayBuffer {
  const data = new ArrayBuffer(__host_len());
  __load_input(data);
  return data;
}
export function set(k: ArrayBuffer, v: ArrayBuffer): void {
  const h = xxh32(k);
  _updates.set(h, v);
  _updateKeys.set(h, k);
}
export function get(k: ArrayBuffer): ArrayBuffer {
  const h = xxh32(k);
  if (!_updates.has(h)) {
    let result = new ArrayBuffer(__get_len(k));
    __get(k, result);
    _updates.set(h, result);
    _updateKeys.set(h, result);
    return result;
  } else return _updates.get(h);
}
export function _flush(): void {
  const hashKeys = _updates.keys();
  const rlpInput = new Array<RLPItem>();
  hashKeys.reduce((r: Array<RLPItem>, v: u32, i: i32, ary: Array<u32>) => {
    r.push(RLPItem.fromArrayBuffer(_updateKeys.get(v)));
    r.push(RLPItem.fromArrayBuffer(_updates.get(v)));
    return r;

  }, rlpInput);
  const buffer = toRLP(RLPItem.fromList(rlpInput));
  //const buffer = new ArrayBuffer(0);
  __flush(buffer);
}


/**
 * Class - Index
 *
 * Description:
 * This class is used to encode data and call the __set host function to store an index,
 * this class abstracts database updates as well as rlp encoding & hashing of data and key respectively
 *
 */
export class Index {
  static keyFor(table: ArrayBuffer, key: ArrayBuffer): ArrayBuffer {
    return Box.concat([Box.from(table), Box.from(key)]);
  }

  static indexTransactionById(txid: ArrayBuffer, data: ArrayBuffer): void {
    set(Index.keyFor(TRANSACTION_ID_TO_TRANSACTION, txid), data);
  }

  // Index: "/insc/byid"
  static indexInscriptionById(inscID: ArrayBuffer, data: ArrayBuffer): void {
    set(Index.keyFor(INSCRIPTION_ID_TO_INSCRIPTION, inscID), data);
  }

  // static indexInscriptionsByHeight(height: ArrayBuffer, data: ArrayBuffer): void {
  //   set(Index.keyFor(HEIGHT_TO_INSCRIPTIONS, height), data);
  // }
}
