"use strict";

import * as protowallet from "./wallet";
import * as wallet from "metashrew-runes/lib/src.ts/wallet";
import url from "url";
import { OutPoint, RuneOutput } from "metashrew-runes/lib/src.ts/outpoint";
import { MetashrewRunes } from "metashrew-runes/lib/src.ts/rpc";
import * as protobuf from "./proto/protorune";

import leb128 from "leb128";

const addHexPrefix = (s) => (s.substr(0, 2) === "0x" ? s : "0x" + s);

let id = 0;

export class ProtorunesRpc extends MetashrewRunes {
  async protorunesbyaddress({ address, protocolTag }: any): Promise<{
    outpoints: OutPoint[];
    balanceSheet: RuneOutput[];
  }> {
    const buffer = protowallet.encodeProtorunesWalletInput(
      address,
      protocolTag
    );
    const byteString = await this._call({
      method: "protorunesbyaddress",
      input: buffer,
    });
    const decoded = wallet.decodeWalletOutput(byteString);
    return decoded;
  }
  async protorunesbyoutpoint({ txid, vout, protocolTag }: any): Promise<any> {
    const buffer = '0x' + Buffer.from(protobuf.OutpointWithProtocol.toBinary({
      protocol: leb128.unsigned.encode(protocolTag),
      txid: Buffer.from(txid, 'hex'),
      vout
    })).toString('hex');
    return protobuf.OutpointResponse.fromBinary(Buffer.from((await this._call({
      method: 'protorunesbyoutpoint',
      input: buffer
    })).substr(2), 'hex'));
  }
  async runtime({ protocolTag }: any): Promise<{
    balances: RuneOutput[];
  }> {
    const buffer = protowallet.encodeRuntimeInput(protocolTag);
    const byteString = await this._call({
      method: "protorunesbyaddress",
      input: buffer,
    });
    const decoded = protowallet.decodeRuntimeOutput(byteString);
    return decoded;
  }
}
