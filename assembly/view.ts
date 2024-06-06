import { metashrew as proto } from "metashrew-as/assembly/proto/metashrew";
import { Box } from "metashrew-as/assembly/utils/box";
import { input } from "metashrew-as/assembly/indexer/index";
import { BalanceSheet } from "./indexer/BalanceSheet";
import { RuneId } from "./indexer/RuneId";
import {
  OUTPOINT_TO_RUNES,
  HEIGHT_TO_TRANSACTION_IDS,
  RUNE_ID_TO_ETCHING,
  DIVISIBILITY,
  OUTPOINT_TO_HEIGHT,
  HEIGHT_TO_BLOCKHASH,
  CAP,
  SPACERS,
} from "./indexer/constants";
import { OutPoint } from "metashrew-as/assembly/blockdata/transaction";
import { metashrew_runes } from "./proto/metashrew-runes";
import { u256, u128 } from "as-bignum/assembly";
import { encodeHexFromBuffer } from "metashrew-as/assembly/utils/hex";
import { console } from "metashrew-as/assembly/utils/logging";
import { fromArrayBuffer, fieldToU128, fieldToName } from "./utils";

export function outpoint(): ArrayBuffer {
  const inputString = input();
  const txid = inputString.slice(4, inputString.byteLength - 1);
  const k = <u32>(
    parseInt(encodeHexFromBuffer(inputString.slice(inputString.byteLength - 1)))
  );
  const outpoint = OutPoint.from(txid, k).toArrayBuffer();
  const op = OUTPOINT_TO_RUNES.select(outpoint);
  const balanceSheet = BalanceSheet.load(op);
  const runes = balanceSheet.runes.reduce<Array<metashrew_runes.Rune>>(
    (a, d, i, init) => {
      const _runeId = RuneId.fromBytesU128(d);
      const name = RUNE_ID_TO_ETCHING.select(d).get();
      const spacers = SPACERS.select(name);
      const divisibility = <u32>DIVISIBILITY.select(name).getValue<u8>();
      const rune = new metashrew_runes.Rune();
      const runeId = new metashrew_runes.RuneId();
      runeId.block = _runeId.block;
      runeId.tx = _runeId.tx;
      rune.runeId = runeId;
      rune.name = Uint8Array.wrap(
        String.UTF8.encode(fieldToName(fromArrayBuffer(name)))
      ).reduce<Array<u8>>((a, d) => {
        a.push(d);
        return a;
      }, new Array<u8>());
      rune.divisibility = divisibility;
      a.push(rune);
      return a;
    },
    new Array<metashrew_runes.Rune>()
  );
  const message = new metashrew_runes.Outpoint();
  message.runes = runes;

  message.balances = balanceSheet.balances.map<Array<u8>>(
    (d, i, ary: Array<u128>) => {
      console.log(d.toString());
      return d.toBytes(true);
    }
  );

  return message.encode();
}
