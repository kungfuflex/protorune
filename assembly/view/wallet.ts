import {
  OUTPOINTS_FOR_ADDRESS,
  OUTPOINT_TO_OUTPUT,
} from "metashrew-spendables/assembly/tables.ts";
import { balanceSheetToProtobuf, outpointBase } from "./outpoint";
import { BalanceSheet } from "../indexer/BalanceSheet";
import { metashrew_runes as protobuf } from "../proto/metashrew-runes";
import { Output } from "metashrew-as/assembly/blockdata/transaction";
import { Box } from "metashrew-as/assembly/utils/box";
import { parsePrimitive } from "metashrew-as/assembly/utils/utils";
import { console } from "metashrew-as/assembly/utils/logging";
import { input } from "metashrew-as/assembly/indexer";
import {
  OUTPOINT_TO_RUNES,
  HEIGHT_TO_TRANSACTION_IDS,
  RUNE_ID_TO_ETCHING,
  DIVISIBILITY,
  OUTPOINT_TO_HEIGHT,
  HEIGHT_TO_BLOCKHASH,
  CAP,
  SPACERS,
  SYMBOL,
} from "../indexer/constants";

export function runesbyaddress(): ArrayBuffer {
  const _address = protobuf.WalletRequest.decode(input().slice(4)).wallet;
  const address = changetype<Uint8Array>(_address).buffer;

  const addressPointer = OUTPOINTS_FOR_ADDRESS.select(address);
  let i = <i32>addressPointer.length();
  const outpoints = new Array<protobuf.OutpointResponse>();
  const balanceSheets = new Array<BalanceSheet>();
  while (i >= 0) {
    const itemPointer = addressPointer.selectIndex(<u32>i);
    const item = itemPointer.get();
    i--;
    if (item.byteLength == 0) continue;
    const inp = new protobuf.Outpoint();
    inp.txid = changetype<Array<u8>>(Uint8Array.wrap(item.slice(0, 32)));
    inp.vout = parsePrimitive<u32>(Box.from(item.slice(32)));
    const op = outpointBase(inp);
    if (op.balances.entries.length == 0) continue;
    balanceSheets.push(BalanceSheet.load(OUTPOINT_TO_RUNES.select(item)));
    outpoints.push(op);
  }

  const message = new protobuf.WalletResponse();
  message.outpoints = outpoints;
  message.balances = balanceSheetToProtobuf(
    balanceSheets.reduce(
      (r: BalanceSheet, v: BalanceSheet, i: i32, ary: Array<BalanceSheet>) => {
        return BalanceSheet.merge(r, v);
      },
      new BalanceSheet()
    )
  );

  return message.encode();
}
