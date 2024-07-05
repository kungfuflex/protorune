import { protorune } from "../proto/protorune";
import { scriptParse } from "metashrew-as/assembly/utils/yabsp";
import { BalanceSheet } from "./BalanceSheet";
import { Box } from "metashrew-as/assembly/utils/box";
import { PROTORUNE_TABLE } from "./tables/protorune";

import * as base from "./constants";

export class ProtoBurn {
  protocol_tag: u16;
  pointer: u32;
  table: PROTORUNE_TABLE;
  constructor(data: ArrayBuffer) {
    const res = protorune.ProtoBurn.decode(data);
    this.protocol_tag = bswap<u16>(
      load<u16>(
        changetype<usize>(changetype<Uint8Array>(res.protocol_tag).buffer),
      ),
    );
    this.pointer = res.pointer;
    this.table = PROTORUNE_TABLE.for(this.protocol_tag);
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

  static from(script: Box): ProtoBurn {
    return new ProtoBurn(Box.concat(scriptParse(script).slice(2)));
  }
}
