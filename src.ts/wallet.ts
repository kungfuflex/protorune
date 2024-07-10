import { ProtorunesWalletRequest } from "./proto/protorune";

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
