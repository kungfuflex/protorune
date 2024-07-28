import { ProtorunesWalletRequest } from "./proto/protorune";

import { WalletResponse, WalletRequest } from "./proto/metashrew-runes";
import { decodeOutpointViewBase } from "./outpoint";
import { decodeRunes, OutPoint, RuneOutput } from "./outpoint";
import { stripHexPrefix } from "./utils";

function numberToBytes(num: bigint): Uint8Array {
  const buf = Buffer.from(num.toString(), "utf-8");
  const bytes = Uint8Array.from(buf);
  return bytes;
}

export function decodeWalletOutput(hex: string): {
  outpoints: OutPoint[];
  balanceSheet: RuneOutput[];
} {
  const wo = WalletResponse.fromBinary(
    Uint8Array.from(Buffer.from(stripHexPrefix(hex), "hex"))
  );
  return {
    outpoints: wo.outpoints.map((op) => decodeOutpointViewBase(op)),
    balanceSheet: decodeRunes(wo.balances),
  };
>>>>>>> 645354c55e3e093d736ecc2123a5768a980d8499
}

export function encodeProtorunesWalletInput(
  address: string,
  protocol_tag: bigint,
) {
  const input: ProtorunesWalletRequest = {
    wallet: Uint8Array.from(Buffer.from(address, "utf-8")),
    protocolTag: numberToBytes(protocol_tag),
  };
  return (
    "0x" + Buffer.from(ProtorunesWalletRequest.toBinary(input)).toString("hex")
  );
}
