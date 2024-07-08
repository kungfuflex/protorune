import { BalanceSheet } from "./BalanceSheet";
import { PROTORUNE_TABLE } from "./tables/protorune";
import * as base from "./constants";
import { u128 } from "as-bignum/assembly";

export class ProtoBurn {
  protocol_tag: u128;
  pointer: u32;
  table: PROTORUNE_TABLE;
  constructor(data: Array<u128>) {
    const protocol_tag = data[0];
    this.pointer = data[1].toU32();
    this.protocol_tag = protocol_tag;
    this.table = PROTORUNE_TABLE.for(protocol_tag);
  }

  process(balanceSheet: BalanceSheet, outpoint: ArrayBuffer): void {
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
      balanceSheet.save(this.table.OUTPOINT_TO_RUNES.select(outpoint));
    }
  }
}
