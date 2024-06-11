import { OUTPOINTS_FOR_ADDRESS } from "metashrew-spendables/assembly/tables.ts";
import { outpointBase } from "./outpoint";
import { metashrew_runes } from "../proto/metashrew-runes";
import { Output } from "metashrew-as/assembly/blockdata/transaction";
import { Box } from "metashrew-as/assembly/utils/box";
import { parsePrimitive } from "metashrew-as/assembly/utils/utils";
import { console } from "metashrew-as/assembly/utils/logging";
import { input } from "metashrew-as/assembly/indexer";

export function wallet(): ArrayBuffer {
  const _address = metashrew_runes.WalletInput.decode(input().slice(4)).wallet;
  const address = changetype<Uint8Array>(_address).buffer;

  const addressPointer = OUTPOINTS_FOR_ADDRESS.select(address);
  let i = <i32>addressPointer.length();
  const outpoints = new Array<metashrew_runes.OutpointOut>();
  while (i >= 0) {
    const itemPointer = addressPointer.selectIndex(<u32>i);
    const item = itemPointer.get();
    i--;
    if (item.byteLength == 0) continue;
    const inp = new metashrew_runes.Outpoint();
    inp.txid = changetype<Array<u8>>(Uint8Array.wrap(item.slice(0, 32)));
    inp.pos = parsePrimitive<u32>(Box.from(item.slice(32)));
    const op = outpointBase(inp);
    if (op.balances.length == 0) continue;

    outpoints.push(op);
  }

  const message = new metashrew_runes.WalletOutput();
  message.outpoints = outpoints;

  return message.encode();
}
