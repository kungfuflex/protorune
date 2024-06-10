import { Outpoint, RuneId } from "./proto/metashrew-runes";

export type Rune = {
  id: string;
  name: string;
  spacedName: string;
  divisibility: number;
  spacers: number;
  symbol: string;
};

export type OutPoint = {
  runes: Rune[];
  balances: BigInt[];
};

export function decodeOutpointView(hex: string): OutPoint {
  const bytes = Uint8Array.from(Buffer.from(hex, "hex"));
  const op = Outpoint.fromBinary(bytes);
  const runes = op.runes.map((d) => {
    const spacer = "•";
    const bitField = d.spacers.toString(2);
    let name = Buffer.from(d.name).toString("utf-8");
    let spaced_name = name;
    const symbol = String.fromCharCode(d.symbol);
    bitField
      .split("")
      .reverse()
      .map((d, i) => {
        if (d == "1") {
          spaced_name = `${spaced_name.slice(0, i + 1)}${spacer}${spaced_name.slice(i + 1)}`;
        }
      });
    console.log(bitField);
    const rune: Rune = {
      id: `${d.runeId.block}:${d.runeId.tx}`,
      name,
      spacedName: spaced_name,
      divisibility: d.divisibility,
      spacers: d.spacers,
      symbol: symbol,
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
