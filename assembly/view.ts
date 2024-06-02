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
} from "./indexer/constants";
import { OutPoint } from "metashrew-as/assembly/blockdata/transaction";
import { metashrew_runes } from "./proto/metashrew-runes";
import { u256, u128 } from "as-bignum/assembly";

export function outpoint(): ArrayBuffer {
  const outpoint_raw = String.UTF8.decode(input()).split(":");

  const txid = String.UTF8.encode(outpoint_raw[0]);
  const k = <u32>parseInt(outpoint_raw[1]);
  const outpoint = OutPoint.from(txid, k).toArrayBuffer();

  const height = OUTPOINT_TO_HEIGHT.select(outpoint).getValue<u32>();

  const balanceSheet = BalanceSheet.load(OUTPOINT_TO_RUNES.select(outpoint));
  const runeId = new RuneId(<u64>height, k).toBytes();
  const name = RUNE_ID_TO_ETCHING.select(runeId).get();
  const divisibility = DIVISIBILITY.select(name).getValue<u8>();

  const message = new metashrew_runes.OutPointTest();

  message.divisibility = <u32>divisibility;
  message.balances = balanceSheet.balances.map<Array<u8>>(
    (d, i, ary: Array<u128>) => {
      return d.toBytes();
    }
  );

  return message.encode();
}
