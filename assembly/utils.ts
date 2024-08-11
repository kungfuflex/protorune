import { Box } from "metashrew-as/assembly/utils";
import { readULEB128ToU128 } from "metashrew-runes/assembly/leb128";
import { toArrayBuffer } from "metashrew-runes/assembly/utils";
import { u128 } from "as-bignum/assembly";
import { reverse } from "metashrew-as/assembly/utils";
import { console } from "metashrew-as/assembly/utils/logging"


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

function toSevenBitChunks(data: u128): Array<Array<u8>> {
  const bytes = changetype<Uint8Array>(data.toBytes());
  let result = new Array<Array<u8>>(0);
  let bit = 0;
  for (let i = 0; i < bytes.length; i++) {
    for (let j = 0; j < 8; j++) {
      if (bit % 7 === 0) result.push(new Array<u8>(0));
      result[result.length - 1].push((bytes[i] >> <u8>(7 - j)) & 0x01);
    }
  }
  return result;
}

function joinBits(data: Array<u8>): u8 {
  return data.reduce((r: u8, v: u8, i: i32, ary: Array<u8>) => {
    return (r << 1) | v;
  }, <u8>0);
}

function dropTerminalBytes(ary: Array<u8>): Array<u8> {
  let i: i32 = ary.length;
  for (; i >= 0; i--) {
    if (ary[i] !== 0) break;
  }
  return ary.slice(0, i);
}

// export function toLEB128(data: u128): ArrayBuffer {
//   const values = dropTerminalBytes(toSevenBitChunks(data).map<u8>((v: Array<u8>, i: i32, ary: Array<Array<u8>>) => {
//     return joinBits(v);
//   }).reverse());
//   return values.reduce((r: ArrayBuffer, v: u8, i: i32, ary: Array<u8>) => {
//     store<u8>(changetype<usize>(r) + <usize>i, i === ary.length - 1 ? 0x80 | v : v);
//     return r;
//   }, new ArrayBuffer(values.length));
// }

export function toLEB128(data: u128): ArrayBuffer {
  let result: Array<u8> = [];
  let tempValue = data;
  const sevenBitMask = u128.from(0x7F);
  const continuationBit = u128.from(0x80);
  // Encode the u128 value using LEB128
  while (tempValue > sevenBitMask) {
    // Extract 7 bits and add continuation bit (0x80)
    const extracted: u128 = ((tempValue & sevenBitMask) | continuationBit)
    console.log("Attempting to push u8 " + extracted.toString())
    result.push(<u8>extracted.lo);
    // Shift the value right by 7 bits for the next byte
    tempValue = tempValue >> <i32>7;
  }

  // Add the final byte without continuation bit
  const lastByte = <u8>((tempValue & sevenBitMask).lo)
  result.push(lastByte);

  for (let i = 0; i < result.length; i++) {
    console.log("result[i] " + result[i].toString())
  }

  const final = changetype<ArrayBuffer>(StaticArray.fromArray<u8>(result));

  console.log("return final bytelength " + final.byteLength.toString())

  return final;
}

export function logArrayBuffer(arr: ArrayBuffer): void {
  const tempArray = Uint8Array.wrap(arr);
  console.log("Got arraybuffer of size " + tempArray.length.toString());
  tempArray.forEach((val, i) => {
    console.log("byte[" + i.toString() + "] = " + val.toString());
  })
}