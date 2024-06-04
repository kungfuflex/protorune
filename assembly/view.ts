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
} from "./indexer/constants";
import { OutPoint } from "metashrew-as/assembly/blockdata/transaction";
import { metashrew_runes } from "./proto/metashrew-runes";
import { u256, u128 } from "as-bignum/assembly";
import { encodeHexFromBuffer } from "metashrew-as/assembly/utils/hex";
import { console } from "metashrew-as/assembly/utils/logging";

export function outpoint(): ArrayBuffer {
  const inputString = input();
  const txid = inputString.slice(4, inputString.byteLength - 1);
  const k = <u32>(
    parseInt(encodeHexFromBuffer(inputString.slice(inputString.byteLength - 1)))
  );
  console.log(k.toString());
  console.log(encodeHexFromBuffer(txid));
  const outpoint = OutPoint.from(txid, k).toArrayBuffer();
  const outpoint2 = new RuneId(<u64>840303, <u32>3192).toBytes();
  const rune = OUTPOINT_TO_RUNES.select(outpoint);
  const balances = rune.keyword("/runes");
  console.log(rune.get().byteLength.toString());
  const balanceSheet = BalanceSheet.load(rune);
  console.log(balanceSheet.runes.length.toString());
  // const runeId = new RuneId(<u64>height, i).toBytes();
  const name = RUNE_ID_TO_ETCHING.select(outpoint2).get();
  const divisibility = DIVISIBILITY.select(name).getValue<u8>();
  console.log(divisibility.toString());

  const message = new metashrew_runes.OutPointTest();

  message.divisibility = <u32>0;
  message.balances = balanceSheet.balances.map<Array<u8>>(
    (d, i, ary: Array<u128>) => {
      return d.toBytes();
    }
  );

  return message.encode();
}
