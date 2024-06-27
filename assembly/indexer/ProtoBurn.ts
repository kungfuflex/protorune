import { protorune } from "../proto/protorune";
import { scriptParse } from "metashrew-as/assembly/utils/yabsp";
import { BalanceSheet } from "./BalanceSheet";
import { Box } from "metashrew-as/assembly/utils/box";
import {
  SPACERS,
  RUNE_ID_TO_ETCHING,
  ETCHING_TO_RUNE_ID,
  DIVISIBILITY,
  SYMBOL,
  ETCHINGS,
  OUTPOINT_TO_RUNES,
} from "./constants/protorune";

import * as base from "./constants";

export class ProtoBurn {
  protocol_tag: u16;
  pointer: u32;
  constructor(data: ArrayBuffer) {
    const res = protorune.ProtoBurn.decode(data);
    this.protocol_tag = bswap<u16>(
      load<u16>(
        changetype<usize>(changetype<Uint8Array>(res.protocol_tag).buffer),
      ),
    );
    this.pointer = res.pointer;
  }

  process(balanceSheet: BalanceSheet, outpoint: ArrayBuffer): void {
    for (let i = 0; i < balanceSheet.runes.length; i++) {
      const runeId = balanceSheet.runes[i];
      const name = base.RUNE_ID_TO_ETCHING.select(runeId).get();
      RUNE_ID_TO_ETCHING.select(runeId).set(name);
      ETCHING_TO_RUNE_ID.select(name).set(runeId);
      SPACERS.select(name).set(base.SPACERS.select(name).get());
      DIVISIBILITY.select(name).set(base.DIVISIBILITY.select(name).get());
      SYMBOL.select(name).set(base.SYMBOL.select(name).get());
      ETCHINGS.append(name);
      balanceSheet.save(OUTPOINT_TO_RUNES.select(outpoint));
    }
  }

  static from(script: Box): ProtoBurn {
    return new ProtoBurn(Box.concat(scriptParse(script).slice(2)));
  }
}
