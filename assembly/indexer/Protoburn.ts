import { ProtoruneBalanceSheet } from "./ProtoruneBalanceSheet";
import { Box } from "metashrew-as/assembly/utils/box";
import { ProtoruneTable } from "./tables/protorune";
import * as base from "metashrew-runes/assembly/indexer/constants";
import { u128 } from "as-bignum/assembly";
import { console } from "metashrew-as/assembly/utils/logging";

export class Protoburn {
  public protocolTag: u128;
  public pointer: u32;
  public from: Array<u32>;
  public table: ProtoruneTable;
  constructor(data: Array<u128>) {
    const protocolTag = data[0];
    this.pointer = data[1].toU32();
    this.protocolTag = protocolTag;
    this.from = data.slice(2).map<u32>((v) => v.toU32());
    this.table = ProtoruneTable.for(protocolTag);
  }

  hookBurn(rune: ArrayBuffer, amount: u128): void {}

  process(balanceSheet: ProtoruneBalanceSheet, outpoint: ArrayBuffer): void {
    for (let i = 0; i < balanceSheet.runes.length; i++) {
      const runeId = balanceSheet.runes[i];
      const name = base.RUNE_ID_TO_ETCHING.select(runeId).get();
      this.table.RUNE_ID_TO_ETCHING.select(runeId).set(name);
      this.table.ETCHING_TO_RUNE_ID.select(name).set(runeId);
      this.table.SPACERS.select(name).set(base.SPACERS.select(name).get());
      this.table.DIVISIBILITY.select(name).set(
        base.DIVISIBILITY.select(name).get(),
      );
      this.table.SYMBOL.select(name).set(base.SYMBOL.select(name).get());
      this.table.ETCHINGS.append(name);
      balanceSheet.saveIndex(i, this.table.OUTPOINT_TO_RUNES.select(outpoint));
      this.hookBurn(runeId, balanceSheet.balances[i]);
    }
  }
}
