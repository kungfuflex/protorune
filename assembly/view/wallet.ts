import {
  OUTPOINTS_FOR_ADDRESS,
  OUTPOINT_TO_OUTPUT,
} from "metashrew-spendables/assembly/tables.ts";
import { Index as SpendablesIndex } from "metashrew-spendables/assembly/indexer";
import { balanceSheetToProtobuf, outpointBase } from "./outpoint";
import { BalanceSheet } from "../indexer/BalanceSheet";
import { metashrew_runes as protobuf } from "../proto/metashrew-runes";
import { Output } from "metashrew-as/assembly/blockdata/transaction";
import { Box } from "metashrew-as/assembly/utils/box";
import { parsePrimitive } from "metashrew-as/assembly/utils/utils";
import { console } from "metashrew-as/assembly/utils/logging";
import { input } from "metashrew-as/assembly/indexer";
import { decodeHex } from "metashrew-as/assembly";
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

export function wallet_test(): ArrayBuffer {
  const address = String.UTF8.encode(
    "bc1pl35wn7k578zg55exz799m6v6pnu563wg34t7yg7jsnmxpmvw5fdscdsmvu",
  );
  const outpoint =
    "a92ba4aab6ac3fe26667665ca6bcd75eff2cd05963ab665d259a31113ae831a401000000";

  SpendablesIndex.findOutpointsForAddress(address);

  return new ArrayBuffer(0);
}

export function runesbyaddress(): ArrayBuffer {
  const _address = protobuf.WalletRequest.decode(input().slice(4)).wallet;
  const address = changetype<Uint8Array>(_address).buffer;

  const _outpoints = SpendablesIndex.findOutpointsForAddress(address);
  const outpoints = new Array<protobuf.OutpointResponse>();
  const balanceSheets = new Array<BalanceSheet>();
  for (let i = 0; i < _outpoints.length; i++) {
    const inp = new protobuf.Outpoint();
    inp.txid = changetype<Array<u8>>(
      Uint8Array.wrap(_outpoints[i].slice(0, 32)),
    );
    inp.vout = parsePrimitive<u32>(Box.from(_outpoints[i].slice(32)));
    const op = outpointBase(inp);
    if (op.balances.entries.length == 0) continue;
    balanceSheets.push(
      BalanceSheet.load(OUTPOINT_TO_RUNES.select(_outpoints[i])),
    );
    outpoints.push(op);
  }

  const message = new protobuf.WalletResponse();
  message.outpoints = outpoints;
  message.balances = balanceSheetToProtobuf(
    balanceSheets.reduce(
      (r: BalanceSheet, v: BalanceSheet, i: i32, ary: Array<BalanceSheet>) => {
        return BalanceSheet.merge(r, v);
      },
      new BalanceSheet(),
    ),
  );

  return message.encode();
}
