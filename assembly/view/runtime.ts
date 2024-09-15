import { protorune as protobuf } from "../proto/protorune";
import { input } from "metashrew-as/assembly/indexer";
import { ProtoruneTable } from "../indexer/tables/protorune";
import { u128 } from "as-bignum/assembly";
import { fromArrayBuffer } from "metashrew-runes/assembly/utils";
import { RuneId } from "metashrew-runes/assembly/indexer/RuneId";
import { encodeHexFromBuffer } from "metashrew-as/assembly/utils/hex";
import { console } from "metashrew-as/assembly/utils/logging";
import { ProtoruneBalanceSheet } from "../indexer/ProtoruneBalanceSheet";
import { balanceSheetToProtobufForProtocol } from "./outpoint";
import { readULEB128ToU128 } from "metashrew-runes/assembly/leb128";
import { Box } from "metashrew-as/assembly/utils";

export function runtime(): ArrayBuffer {
  const inp = protobuf.RuntimeInput.decode(input().slice(4));

  const protocol_tag_bytes = changetype<Uint8Array>(inp.protocol_tag).buffer;
  let protocol_tag = u128.from(0);
  readULEB128ToU128(Box.from(protocol_tag_bytes), protocol_tag);

  const table = ProtoruneTable.for(protocol_tag);

  const message = new protobuf.Runtime();

  const bal = ProtoruneBalanceSheet.load(table.RUNTIME_BALANCE);
  const sheet = changetype<protobuf.BalanceSheet>(
    balanceSheetToProtobufForProtocol(bal, table)
  );
  message.balances = sheet;

  return message.encode();
}
