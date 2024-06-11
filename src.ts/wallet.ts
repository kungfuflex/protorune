import { WalletOutput, WalletInput } from "./proto/metashrew-runes";
import { decodeOutpointViewBase } from "./outpoint";
import {
  isBech32CharacterSet,
  decodeBase58Address,
  decodeBech32,
} from "@bitauth/libauth";
import type { OutPoint } from "./outpoint";

export function decodeWalletOutput(hex: string): OutPoint[] {
  const wo = WalletOutput.fromBinary(Uint8Array.from(Buffer.from(hex, "hex")));

  return wo.outpoints.map((op) => decodeOutpointViewBase(op));
}

export function encodeWalletInput(address: string) {
  const input: WalletInput = {
    wallet: Uint8Array.from(Buffer.from(address, "utf-8")),
  };
  return "0x" + Buffer.from(WalletInput.toBinary(input)).toString("hex");
}
