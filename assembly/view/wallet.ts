import { SpendablesIndex } from "metashrew-spendables/assembly/indexer";
import {
  balanceSheetToProtobuf,
  outpointBase,
  outpointBaseForProtocol,
} from "./outpoint";
import { ProtoruneBalanceSheet } from "../indexer/ProtoruneBalanceSheet";
import { metashrew_runes as protobuf } from "metashrew-runes/assembly/proto/metashrew-runes";
import { protorune, protorune as protoruneProtobuf } from "../proto/protorune";
import { Output } from "metashrew-as/assembly/blockdata/transaction";
import { Box } from "metashrew-as/assembly/utils/box";
import { parsePrimitive } from "metashrew-as/assembly/utils/utils";
import { console } from "metashrew-as/assembly/utils/logging";
import { input } from "metashrew-as/assembly/indexer";
import { OUTPOINT_TO_RUNES } from "metashrew-runes/assembly/indexer/constants";
import { ProtoruneTable } from "../indexer/tables/protorune";
import { readULEB128ToU128 } from "metashrew-runes/assembly/leb128";
import { u128 } from "as-bignum/assembly";

export function wallet_test(): ArrayBuffer {
  const address = String.UTF8.encode(
    "bc1pl35wn7k578zg55exz799m6v6pnu563wg34t7yg7jsnmxpmvw5fdscdsmvu"
  );
  const outpoint =
    "a92ba4aab6ac3fe26667665ca6bcd75eff2cd05963ab665d259a31113ae831a401000000";

  new SpendablesIndex().findOutpointsForAddress(address);

  return new ArrayBuffer(0);
}

export function runesbyaddress(): ArrayBuffer {
  const _address = protobuf.WalletRequest.decode(input().slice(4)).wallet;
  const address = changetype<Uint8Array>(_address).buffer;

  const _outpoints = new SpendablesIndex().findOutpointsForAddress(address);
  const outpoints = new Array<protobuf.OutpointResponse>();
  const balanceSheets = new Array<ProtoruneBalanceSheet>();
  for (let i = 0; i < _outpoints.length; i++) {
    const inp = new protobuf.Outpoint();
    inp.txid = changetype<Array<u8>>(
      Uint8Array.wrap(_outpoints[i].slice(0, 32))
    );
    inp.vout = parsePrimitive<u32>(Box.from(_outpoints[i].slice(32)));
    const op = outpointBase(inp);
    if (op.balances.entries.length == 0) {
      continue;
    }
    balanceSheets.push(
      ProtoruneBalanceSheet.load(OUTPOINT_TO_RUNES.select(_outpoints[i]))
    );
    outpoints.push(op);
  }

  const message = new protobuf.WalletResponse();
  message.outpoints = outpoints;
  message.balances = balanceSheetToProtobuf(
    balanceSheets.reduce<ProtoruneBalanceSheet>(
      (
        r: ProtoruneBalanceSheet,
        v: ProtoruneBalanceSheet,
        i: i32,
        ary: Array<ProtoruneBalanceSheet>
      ) => {
        return ProtoruneBalanceSheet.merge(r, v);
      },
      new ProtoruneBalanceSheet()
    )
  );

  return message.encode();
}

export function protorunesbyaddress(): ArrayBuffer {
  const request = protoruneProtobuf.ProtorunesWalletRequest.decode(
    input().slice(4)
  );
  const address = changetype<Uint8Array>(request.wallet).buffer;

  const protocol_tag_bytes = changetype<Uint8Array>(
    request.protocol_tag
  ).buffer;
  let protocol_tag = u128.from(0);
  readULEB128ToU128(Box.from(protocol_tag_bytes), protocol_tag);
  const protorune_pointer = ProtoruneTable.for(protocol_tag);

  const _outpoints = new SpendablesIndex().findOutpointsForAddress(address);
  const outpoints = new Array<protobuf.OutpointResponse>();
  const balanceSheets = new Array<ProtoruneBalanceSheet>();
  for (let i = 0; i < _outpoints.length; i++) {
    const inp = new protoruneProtobuf.OutpointWithProtocol();
    inp.txid = changetype<Array<u8>>(
      Uint8Array.wrap(_outpoints[i].slice(0, 32))
    );
    inp.vout = parsePrimitive<u32>(Box.from(_outpoints[i].slice(32)));
    inp.protocol = request.protocol_tag;
    const op = outpointBaseForProtocol(inp);
    if (op.balances.entries.length == 0) {
      continue;
    }
    balanceSheets.push(
      ProtoruneBalanceSheet.load(
        protorune_pointer.OUTPOINT_TO_RUNES.select(_outpoints[i])
      )
    );
    outpoints.push(op);
  }

  const message = new protobuf.WalletResponse();
  message.outpoints = outpoints;
  message.balances = balanceSheetToProtobuf(
    balanceSheets.reduce(
      (
        r: ProtoruneBalanceSheet,
        v: ProtoruneBalanceSheet,
        i: i32,
        ary: Array<ProtoruneBalanceSheet>
      ) => {
        return ProtoruneBalanceSheet.merge(r, v);
      },
      new ProtoruneBalanceSheet()
    )
  );

  return message.encode();
}
