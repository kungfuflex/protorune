import { Outpoint, RuneId } from "./proto/metashrew-runes";

export type Rune = {
  id: string;
  name: string;
  divisibility: number;
};

export type OutPoint = {
  runes: Rune[];
  balances: BigInt[];
};

export function decodeOutpointView(hex: string): OutPoint {
  const bytes = Uint8Array.from(Buffer.from(hex, "hex"));
  const op = Outpoint.fromBinary(bytes);
  const runes = op.runes.map((d) => {
    const rune: Rune = {
      id: `${d.runeId.block}:${d.runeId.tx}`,
      name: Buffer.from(d.name).toString("utf-8"),
      divisibility: d.divisibility,
    };
    return rune;
  });

  const balances = op.balances.map((d) => {
    return BigInt("0x" + Buffer.from(d).toString("hex"));
  });

  return {
    runes,
    balances,
  };
}
