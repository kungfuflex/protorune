import { WalletResponse, WalletRequest } from "./proto/metashrew-runes";
import { decodeOutpointViewBase } from "./outpoint";
import {
  isBech32CharacterSet,
  decodeBase58Address,
  decodeBech32,
} from "@bitauth/libauth";
import { decodeRunes, OutPoint } from "./outpoint";

export function decodeWalletOutput(hex: string): OutPoint[] {
  const wo = WalletResponse.fromBinary(Uint8Array.from(Buffer.from(hex, "hex")));

  return { outpoints: wo.outpoints.map((op) => decodeOutpointViewBase(op)), runes: decodeRunes(wo.balances) };
}

export function encodeWalletInput(address: string) {
  const input: WalletInput = {
    wallet: Uint8Array.from(Buffer.from(address, "utf-8")),
  };
  return "0x" + Buffer.from(WalletRequest.toBinary(input)).toString("hex");
}
