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
  TX_ID_TO_INDEX,
  CAP,
} from "./indexer/constants";
import { OutPoint } from "metashrew-as/assembly/blockdata/transaction";
import { metashrew_runes } from "./proto/metashrew-runes";
import { u256, u128 } from "as-bignum/assembly";
import { encodeHexFromBuffer } from "metashrew-as/assembly/utils/hex";
import { console } from "metashrew-as/assembly/utils/logging";
import { toArrayBuffer, fieldToU128 } from "./utils";

export function outpoint(): ArrayBuffer {
  const inputString = input();
  const txid = inputString.slice(4, inputString.byteLength - 1);
  const k = <u32>(
    parseInt(encodeHexFromBuffer(inputString.slice(inputString.byteLength - 1)))
  );
  const i = TX_ID_TO_INDEX.select(txid).getValue<u32>();
  console.log("outpoint: " + encodeHexFromBuffer(txid) + "," + k.toString());
  console.log(i.toString());
  const outpoint = OutPoint.from(txid, k).toArrayBuffer();
  const height = OUTPOINT_TO_HEIGHT.select(outpoint).getValue<u32>();
  console.log(height.toString());
  const rune = OUTPOINT_TO_RUNES.select(outpoint);
  const balances = rune.keyword("/runes");
  const balanceSheet = BalanceSheet.load(rune);
  const runeId = new RuneId(<u64>height, i).toBytes();
  const name = RUNE_ID_TO_ETCHING.select(runeId).get();
  const divisibility = DIVISIBILITY.select(name).getValue<u8>();
  console.log("balances length:" + balanceSheet.balances.length.toString());
  console.log("runes length:" + balanceSheet.runes.length.toString());
  const message = new metashrew_runes.OutPointTest();

  message.divisibility = <u32>divisibility;
  message.balances = balanceSheet.balances.map<Array<u8>>(
    (d, i, ary: Array<u128>) => {
      return d.toBytes();
    }
  );

  return message.encode();
}
