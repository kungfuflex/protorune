import { Box } from "./box";
import { toPointer, nullptr, Pointer } from "./pointer";
import { memcpy } from "./memcpy";

export function reverse(data: ArrayBuffer): ArrayBuffer {
  const result = new ArrayBuffer(data.byteLength);
  for (let i: i32 = 0; i < result.byteLength; i++) {
    store<u8>(
      changetype<usize>(result) + i,
      load<u8>(changetype<usize>(data) + result.byteLength - i - 1),
    );
  }
  return result;
}

export function concat(data: Array<ArrayBuffer>): ArrayBuffer {
  return Box.concat(
    data.map<Box>((v: ArrayBuffer, i: i32, ary: Array<ArrayBuffer>) => {
      return Box.from(v);
    }),
  );
}

export function parsePrimitive<T>(data: Box): T {
  const result = load<T>(data.start);
  data.shrinkFront(sizeof<T>());
  return result;
}

export function parseBytes(data: Box, sz: usize): Box {
  const result = data.sliceFrom(0);
  result.len = sz;
  data.shrinkFront(sz);
  return result;
}

export function parsePushOp(data: Box): Box {
  const opcode = parsePrimitive<u8>(data);
  if (opcode == 0x4d) {
    return parseBytes(data, <usize>parsePrimitive<u16>(data));
  }
  if (opcode == 0x4e) {
    return parseBytes(data, <usize>parsePrimitive<u32>(data));
  }
  if (opcode == 0x4f) {
    return toPointer(<usize>0).toBox(<usize>0);
  }
  if (opcode == 0x51) {
    return toPointer(<usize>0).toBox(<usize>0); // return a pointer value 0 for -1
  }
  if (opcode >= 0x52 && opcode <= 0x60) {
    return toPointer(<usize>0).toBox(<usize>opcode - <usize>0x50);
  }
  if (opcode >= 0x01 && opcode <= 0x4b) {
    return parseBytes(data, <usize>opcode);
  }
  if (opcode == 0) {
    return data.sliceFrom(0).setLength(0);
  }
  return data;
}

export function isPushOp(op: u8): boolean {
  return (op >= 0x00 && op <= 0x4f) || (op > 0x50 && op <= 0x60);
}

export function decodeTag(box: Box): usize {
  const v = box.start;
  if (v === 0) {
    return box.len;
  }
  if (box.len === 0) return <usize>0;
  const buffer = new ArrayBuffer(sizeof<usize>());
  if (box.len > <usize>buffer.byteLength) return <usize>0;
  memcpy(changetype<usize>(buffer), v, box.len);
  return load<usize>(changetype<usize>(buffer));
}

export function parseVarInt(data: Box): u64 {
  const first: u8 = load<u8>(data.start);
  data.shrinkFront(<usize>1);
  switch (first) {
    case 0xff:
      return <u64>parsePrimitive<u64>(data);
      break;
    case 0xfe:
      return <u64>parsePrimitive<u32>(data);
      break;
    case 0xfd:
      return <u64>parsePrimitive<u16>(data);
      break;
    default:
      return <u64>first;
  }
}

export function parseLenThenBytes(data: Box): Box {
  const length = parseVarInt(data);
  return parseBytes(data, <usize>length);
}

// subsidy of block @ given height
export function subsidy(height: u64): u64 {
  return 50 * 100000000 >> (height / 210000);
}

// first ordinal of subsidy of block @ given height
export function firstOrdinal(height: u64): number {
  let start: u64 = 0;
  for ( let i = 0; i < height; i++) {
    start += subsidy(height);
  }
  return start;
}

// assign ordinals in given block
// export function assignOrdinals() {
//   let first = firstOrdinal(height);
//   let last = frist + subsidy(height);
//   let coinbaseOrdinals = new Array<u32>(last - first); 
  
  
// }
