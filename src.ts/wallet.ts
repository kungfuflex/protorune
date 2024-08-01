import { decodeRunes } from "metashrew-runes/lib/src.ts/outpoint";
import {
  ProtorunesWalletRequest,
  RuntimeInput,
  Runtime,
} from "./proto/protorune";
import { stripHexPrefix } from "./utils";

function numberToBytes(num: bigint): Uint8Array {
  const buf = Buffer.from(num.toString(), "utf-8");
  const bytes = Uint8Array.from(buf);
  return bytes;
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

export function encodeRuntimeInput(protocol_tag: bigint) {
  const input: RuntimeInput = {
    protocolTag: numberToBytes(protocol_tag),
  };
  return "0x" + Buffer.from(RuntimeInput.toBinary(input)).toString("hex");
}

export function decodeRuntimeOutput(hex: string) {
  const runtime = Runtime.fromBinary(
    Uint8Array.from(Buffer.from(stripHexPrefix(hex), "hex")),
  );
  const balances = decodeRunes(runtime.balances);
  return {
    balances,
  };
}
