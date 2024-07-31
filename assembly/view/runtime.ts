import { protorune as protobuf } from "../proto/protorune";
import { input } from "metashrew-as/assembly/indexer";
import { ProtoruneTable } from "../indexer/tables/protorune";

export function runtime(): ArrayBuffer {
  const inp = protobuf.RuntimeInput.decode(input().slice(4));

  const protocol = String.UTF8.decode(
    changetype<Uint8Array>(inp.protocol_tag).buffer,
  );
  const table = ProtoruneTable.for_str(protocol);

  const message = new protobuf.Runtime();

  message.balance = changetype<Array<u8>>(
    Uint8Array.wrap(table.RUNTIME_BALANCE.get()),
  );

  return message.encode();
}
