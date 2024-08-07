import { Box } from "metashrew-as/assembly/utils";
import { readULEB128ToU128 } from "metashrew-runes/assembly/leb128";
import { toArrayBuffer } from "metashrew-runes/assembly/utils";
import { u128 } from "as-bignum/assembly";
import { reverse } from "metashrew-as/assembly/utils";

export function alignArrayBuffer(v: ArrayBuffer): Box {
  const box = Box.from(v);
  while (box.len !== 0) {
    if (load<u8>(box.start) === 0) box.shrinkFront(1);
    else break;
  }
  return box;
}

export function alignU128ToArrayBuffer(v: u128): Box {
  return alignArrayBuffer(reverse(toArrayBuffer(v)));
}

export function snapTo15Bytes(v: Box): Box {
  const box = v.sliceFrom(0);
  box.shrinkFront(1);
  return box;
}

export function concatByteArray(v: Array<u128>): ArrayBuffer {
  return Box.concat(
    v.map<Box>((v, i, ary) =>
      i === ary.length - 1
        ? alignU128ToArrayBuffer(v)
        : snapTo15Bytes(Box.from(reverse(toArrayBuffer(v)))),
    ),
  );
}

export function byteLengthForNVarInts(input: Box, n: u64): usize {
  const clone = input.sliceFrom(0);
  const start = clone.start;
  for (let i: i32 = 0; i < <i32>n; i++) {
    clone.shrinkFront(readULEB128ToU128(clone, u128.from(0)));
  }
  return clone.start - start;
}

export function checkForNonDataPush(parsed: Array<Box>): ArrayBuffer {
  if (
    parsed.findIndex((v: Box, i: i32, ary: Array<Box>) => {
      return v.start === usize.MAX_VALUE;
    }) !== -1
  )
    return new ArrayBuffer(0);
  return Box.concat(parsed);
}

export function fieldToArrayBuffer15Bytes(data: Array<u128>): ArrayBuffer {
  return Box.concat(
    data.map((v: u128, i: i32, ary: Array<u128>) =>
      Box.from(toArrayBuffer(v).slice(0, MAX_U128_BYTES_COMPAT_W_RUNES)),
    ),
  );
}

