import { u128 } from "@magiceden-oss/runestone-lib/dist/src/integer/u128";

export const bufferToU128Array = (b: Buffer): u128[] => {
  const ary = Uint8Array.from(b);
  const res: u128[] = [];

  for (let i = 0; i < ary.byteLength; i += 16) {
    const last = i + 16;
    res.push(
      u128(
        BigInt(
          `0x${Buffer.from(ary.slice(i, last > ary.byteLength ? ary.byteLength : last)).toString("hex")}`
        )
      )
    );
  }

  return res;
};
