import { protorune as protobuf } from "../proto/protorune";
import { input } from "metashrew-as/assembly/indexer";
import { ProtoruneTable } from "../indexer/tables/protorune";
import { u128 } from "as-bignum/assembly";
import { fromArrayBuffer } from "metashrew-runes/assembly/utils";
import { RuneId } from "metashrew-runes/assembly/indexer/RuneId";
import { encodeHexFromBuffer } from "metashrew-as/assembly/utils/hex";
import { console } from "metashrew-as/assembly/utils/logging";

export function runtime(): ArrayBuffer {
  const inp = protobuf.RuntimeInput.decode(input().slice(4));

  const protocol = String.UTF8.decode(
    changetype<Uint8Array>(inp.protocol_tag).buffer,
  );
  const runeId = new RuneId(inp.rune.height, inp.rune.txindex).toBytes();
  const table = ProtoruneTable.for_str(protocol);

  const message = new protobuf.Runtime();

  let _bal = table.RUNTIME_BALANCE.select(runeId).get();
  let bal: Array<u8>;
  if (_bal.byteLength == 0) {
    bal = u128.Zero.toBytes(true);
  } else {
    bal = fromArrayBuffer(_bal).toBytes(true);
  }
  message.balance = bal;

  return message.encode();
}
