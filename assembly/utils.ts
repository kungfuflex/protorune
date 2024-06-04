import { Box } from "metashrew-as/assembly/utils/box";
import { u256, u128 } from "as-bignum/assembly";
import { Edict } from "./indexer/Edict";

export function decodeHex(hex: string): ArrayBuffer {
  const result = new ArrayBuffer(hex.length / 2);
  for (let i = 0; i < hex.length; i += 2) {
    store<u8>(
      changetype<usize>(result) + i / 2,
      <u8>parseInt(hex.substring(i, i + 2), 16)
    );
  }
  return result;
}

export function min<T>(a: T, b: T): T {
  if (a > b) return b;
  return a;
}

export function padLeft(v: string, n: i32): string {
  let result = "";
  for (let i: i32 = 0; i < n - v.length; i++) {
    result += "0";
  }
  return result + v;
}

export function u128ToHex(v: u128): string {
  return padLeft(v.hi.toString(16), 16) + padLeft(v.lo.toString(16), 16);
}

export function fromU128Pair(lo: u128, hi: u128): u256 {
  return new u256(lo.lo, lo.hi, hi.lo, hi.hi);
}

export function inspectEdicts(ary: Array<Edict>): string {
  return (
    "[\n" +
    ary
      .map<string>((v: Edict, i: i32, ary: Array<Edict>) => "  " + v.toString())
      .join("\n") +
    "\n]"
  );
}

export function stripNullRight(data: ArrayBuffer): ArrayBuffer {
  const box = Box.from(data);
  while (box.len > 0) {
    if (load<u8>(box.start + box.len - <usize>1) === 0x00) {
      box.len--;
    } else break;
  }
  return box.toArrayBuffer();
}

export function isEqualArrayBuffer(a: ArrayBuffer, b: ArrayBuffer): bool {
  if (a.byteLength !== b.byteLength) return false;
  for (let i = 0; i < a.byteLength; i++) {
    if (
      load<u8>(changetype<usize>(a) + i) !== load<u8>(changetype<usize>(b) + i)
    )
      return false;
  }
  return true;
}

export function toPrimitive<T>(v: u128): T {
  return <T>v.lo;
}

export function fieldTo<T>(data: Array<u128>): T {
  return toPrimitive<T>(data[0]);
}

export function fieldToU128(data: Array<u128>): u128 {
  if (data.length === 0) return u128.from(0);
  return data[0];
}

export function toArrayBuffer(data: u128): ArrayBuffer {
  return Box.from(
    changetype<ArrayBuffer>(data.toStaticBytes())
  ).toArrayBuffer();
}

export function fieldToArrayBuffer(data: Array<u128>): ArrayBuffer {
  return Box.concat(
    data.map((v: u128, i: i32, ary: Array<u128>) => Box.from(toArrayBuffer(v)))
  );
}

export function fromBox(data: Box): u128 {
  return u128.fromBytesLE(
    changetype<u8[]>(Uint8Array.wrap(data.toArrayBuffer()))
  );
}

export function fromArrayBuffer(data: ArrayBuffer): u128 {
  if (data.byteLength === 0) return u128.from(0);
  const result = u128.fromBytesLE(changetype<u8[]>(Uint8Array.wrap(data)));
  return result;
}