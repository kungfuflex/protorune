import { Box } from "metashrew-as/assembly/utils/box";
import { u128 } from "as-bignum/assembly";
export function readULEB128ToU128(buf: Box, to: u128): usize {
  const slice = buf.sliceFrom(0);
  let shift: i32 = 0;
  let result: u128 = u128.from(0);
  let byte: u8 = 0;
  if (slice.len === 0) {
    return 0;
  }
  while (true) {
    byte = load<u8>(slice.start);
    if (slice.len === 0) return usize.MAX_VALUE;
    slice.shrinkFront(1);
    result |= u128.from(byte & 0x7f) << shift;
    if ((byte & 0x80) === 0) break;
    shift += 7;
  }
  to.hi = result.hi;
  to.lo = result.lo;
  return slice.start - buf.start;
}
