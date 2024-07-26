import { BalanceSheet } from "./BalanceSheet";
import { ProtoruneTable } from "./tables/protorune";
import * as base from "./constants";
import { u128 } from "as-bignum/assembly";

export class ProtoBurn {
  public protocol_tag: u128;
  public pointer: u32;
  public table: ProtoruneTable;
  constructor(data: Array<u128>) {
    const protocol_tag = data[0];
    this.pointer = data[1].toU32();
    this.protocol_tag = protocol_tag;
    this.table = ProtoruneTable.for(protocol_tag);
  }

  process(
    balanceSheet: BalanceSheet,
    outpoint: ArrayBuffer
  ): void {
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
    }
  }
}
