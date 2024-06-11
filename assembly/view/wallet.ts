import { OUTPOINTS_FOR_ADDRESS } from "metashrew-spendables/assembly/tables.ts";
import { outpointBase } from "./outpoint";
import { metashrew_runes } from "../proto/metashrew-runes";

export function wallet(): ArrayBuffer {
  const _address = metashrew_runes.WalletInput.decode(input.slice(4)).wallet;
  const address = changetype<Uint8Array>(_address).buffer;

  const addressPointer = OUTPOINTS_FOR_ADDRESS.select(wallet);
  const i = addressPointer.length();
  const outpoints = new Array<metashrew_runes.Outpoint>();
  while (i >= 0) {
    const itemPointer = addressPointer.selectIndex(i);
    const item = itemPointer.get();
    i--;
    if (item.byteLength == 0) continue;
    const op = outpointBase(item);
    if (op.balances.length == 0) continue;

    outpoints.push(op);
  }

  const message = new metashrew_runes.WalletOutput();
  message.outpoints = outpoints;

  return message.encode();
}
