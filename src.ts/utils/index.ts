export const stripHexPrefix = (s: string) =>
  s.slice(0, 2) == "0x" ? s.slice(2) : s;
