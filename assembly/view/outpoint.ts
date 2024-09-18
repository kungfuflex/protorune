import { Box } from "metashrew-as/assembly/utils/box";
import { input } from "metashrew-as/assembly/indexer/index";
import { arrayToArrayBuffer } from "metashrew-as/assembly/blockdata/address";
import { BalanceSheet } from "metashrew-runes/assembly/indexer/BalanceSheet";
import { RuneId } from "metashrew-runes/assembly/indexer/RuneId";
import {
  OUTPOINT_TO_RUNES,
  HEIGHT_TO_TRANSACTION_IDS,
  RUNE_ID_TO_ETCHING,
  DIVISIBILITY,
  OUTPOINT_TO_HEIGHT,
  SPACERS,
  SYMBOL,
} from "metashrew-runes/assembly/indexer/constants";
import { ProtoruneTable } from "../indexer/tables/protorune";
import { OutPoint, Output } from "metashrew-as/assembly/blockdata/transaction";
import { arrayBufferToArray } from "metashrew-spendables/assembly/indexer";
import { OUTPOINT_TO_OUTPUT } from "metashrew-spendables/assembly/tables";
import { metashrew_runes as protobuf } from "metashrew-runes/assembly/proto/metashrew-runes";
import { protorune as protobuf_protorune } from "../proto/protorune";
import { u128 } from "as-bignum/assembly";
import { fromArrayBuffer, fieldToName } from "metashrew-runes/assembly/utils";
import { console } from "metashrew-as/assembly/utils/logging";
import { parsePrimitive, encodeHexFromBuffer } from "metashrew-as/assembly/utils";
import { readULEB128ToU128 } from "metashrew-runes/assembly/leb128";

export function txindexForOutpoint(outpoint: ArrayBuffer): u32 {
  const box = Box.from(outpoint);
  box.len -= 4;
  const txid = box.toArrayBuffer();
  const ptr = HEIGHT_TO_TRANSACTION_IDS.selectValue<u32>(
    OUTPOINT_TO_HEIGHT.select(outpoint).getValue<u32>()
  );
  const length = ptr.length();
  for (let i = 0; i < <i32>length; i++) {
    if (
      memory.compare(
        changetype<usize>(txid),
        changetype<usize>(ptr.selectIndex(i).get()),
        txid.byteLength
      ) === 0
    )
      return i;
  }
  return ~0;
}

export function balanceSheetToProtobuf(
  sheet: BalanceSheet
): protobuf.BalanceSheet {
  const runes = sheet.runes.reduce<Array<protobuf.Rune>>((a, d, i, init) => {
    const _runeId = RuneId.fromBytesU128(d);
    const name = RUNE_ID_TO_ETCHING.select(d).get();
    const spacers = SPACERS.select(name);
    const divisibility = <u32>DIVISIBILITY.select(name).getValue<u8>();
    const rune = new protobuf.Rune();
    const runeId = new protobuf.RuneId();
    runeId.height = <u32>_runeId.block.toU64();
    runeId.txindex = _runeId.tx.toU32();
    rune.runeId = runeId;
    rune.name = Uint8Array.wrap(
      String.UTF8.encode(fieldToName(fromArrayBuffer(name)))
    ).reduce<Array<u8>>((a, d) => {
      a.push(d);
      return a;
    }, new Array<u8>());
    rune.divisibility = divisibility;
    rune.symbol = <u32>SYMBOL.select(name).getValue<u8>();
    rune.spacers = SPACERS.select(name).getValue<u32>();
    a.push(rune);
    return a;
  }, new Array<protobuf.Rune>());
  const balances = sheet.balances.map<Array<u8>>((d, i, ary: Array<u128>) => {
    return d.toBytes(true);
  });
  const balanceSheet = new protobuf.BalanceSheet();
  for (let i = 0; i < balances.length; i++) {
    const entry = new protobuf.BalanceSheetItem();
    entry.rune = runes[i];
    entry.balance = balances[i];
    balanceSheet.entries.push(entry);
  }
  return balanceSheet;
}

export function balanceSheetToProtobufForProtocol(
  sheet: BalanceSheet,
  table: ProtoruneTable
): protobuf.BalanceSheet {
  const runes = new Array<protobuf.Rune>();
  for (let i = 0; i < sheet.runes.length; i++) {
    const d = sheet.runes[i];
    const _runeId = RuneId.fromBytesU128(d);
    const name = table.RUNE_ID_TO_ETCHING.select(d).get();
    const spacers = table.SPACERS.select(name);
    const divisibility = <u32>table.DIVISIBILITY.select(name).getValue<u8>();
    const rune = new protobuf.Rune();
    const runeId = new protobuf.RuneId();
    runeId.height = <u32>_runeId.block.toU64();
    runeId.txindex = _runeId.tx.toU32();
    rune.runeId = runeId;
    rune.name = Uint8Array.wrap(
      String.UTF8.encode(fieldToName(fromArrayBuffer(name)))
    ).reduce<Array<u8>>((a, d) => {
      a.push(d);
      return a;
    }, new Array<u8>());
    rune.divisibility = divisibility;
    rune.symbol = <u32>table.SYMBOL.select(name).getValue<u8>();
    rune.spacers = table.SPACERS.select(name).getValue<u32>();
    runes.push(rune);
  }
  const balances = sheet.balances.map<Array<u8>>((d, i, ary: Array<u128>) => {
    return d.toBytes(true);
  });
  const balanceSheet = new protobuf.BalanceSheet();
  for (let i = 0; i < balances.length; i++) {
    const entry = new protobuf.BalanceSheetItem();
    entry.rune = runes[i];
    entry.balance = balances[i];
    balanceSheet.entries.push(entry);
  }
  return balanceSheet;
}
export function outpointBase(
  inp: protobuf.Outpoint
): protobuf.OutpointResponse {
  const txid = changetype<Uint8Array>(inp.txid).buffer;
  const pos = inp.vout;
  const outpoint = OutPoint.from(txid, pos).toArrayBuffer();

  const op = OUTPOINT_TO_RUNES.select(outpoint);
  const output = new Output(
    Box.from(OUTPOINT_TO_OUTPUT.select(outpoint).get())
  );
  const balanceSheet = balanceSheetToProtobuf(BalanceSheet.load(op));

  const message = new protobuf.OutpointResponse();
  message.outpoint = inp;
  message.output.script = arrayBufferToArray(output.script.toArrayBuffer());
  message.output.value = output.value;
  message.balances = balanceSheet;
  message.height = OUTPOINT_TO_HEIGHT.select(outpoint).getValue<u32>();
  message.txindex = txindexForOutpoint(outpoint);
  return message;
}

export function protorunesbyoutpoipnt(): ArrayBuffer {
  const data = Box.from(input());
  parsePrimitive<u32>(data);
  return _protorunesbyoutpoint(protobuf_protorune.OutpointWithProtocol.decode(data.toArrayBuffer())).encode();
}
export function _protorunesbyoutpoint(
  inp: protobuf_protorune.OutpointWithProtocol
): protobuf.OutpointResponse {
  const txid = changetype<Uint8Array>(inp.txid).buffer;
  const pos = inp.vout;
  const outpoint = OutPoint.from(txid, pos).toArrayBuffer();
  const protocol_tag_bytes = changetype<Uint8Array>(inp.protocol).buffer;
  let protocol_tag = u128.from(0);
  readULEB128ToU128(Box.from(protocol_tag_bytes), protocol_tag);
  const table = ProtoruneTable.for(protocol_tag);
  const op = table.OUTPOINT_TO_RUNES.select(outpoint);
  const output = new Output(
    Box.from(OUTPOINT_TO_OUTPUT.select(outpoint).get())
  );
  const balanceSheet = balanceSheetToProtobuf(BalanceSheet.load(op));

  const message = new protobuf.OutpointResponse();
  message.outpoint = new protobuf.Outpoint();
  message.outpoint.txid = inp.txid;
  message.outpoint.vout = inp.vout;
  message.output.script = arrayBufferToArray(output.script.toArrayBuffer());
  message.output.value = output.value;
  message.balances = balanceSheet;
  message.height = OUTPOINT_TO_HEIGHT.select(outpoint).getValue<u32>();
  message.txindex = txindexForOutpoint(outpoint);
  return message;
}

export function outpoint(): ArrayBuffer {
  const _input = input().slice(4);
  const inp = protobuf.Outpoint.decode(_input);
  return outpointBase(inp).encode();
}
