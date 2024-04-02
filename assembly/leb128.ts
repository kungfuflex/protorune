import { Box } from "metashrew-as/assembly/utils/box"
export function readULEB128ToU64(buf: Box, to: usize): usize {
  const slice = buf.sliceFrom(0);
  let shift: u64 = 0;
  let result: u64 = 0;
  let byte: u8 = 0;
  while (true) {
    if (slice.len === 0) {
      return 0;
    }
    byte = load<u8>(slice.start);
    slice.shrinkFront(1);
    result |= (<u64>(byte & 0x7f) << shift)
    if ((byte & 0x80) === 0) break;
    shift += 7;
  }
  store<u64>(to, result);
  return slice.start - buf.start;
}
