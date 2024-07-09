'use strict';

import * as protowallet from "./wallet";
import * as wallet from "metashrew-runes/lib/src.ts/wallet";
import url from "url";
import { OutPoint, RuneOutput } from "metashrew-runes/lib/src.ts/outpoint";
import { MetashrewRunes } from "metashrew-runes/lib/src.ts/rpc";

const addHexPrefix = (s) => s.substr(0, 2) === '0x' ? s : '0x' + s;

let id = 0;

export class ProtorunesRpc extends MetashrewRunes {
  async protorunesbyaddress({
    address,
    protocol_tag
  }: any): Promise<{
    outpoints: OutPoint[];
    balanceSheet: RuneOutput[];
  }> {
    const buffer = protowallet.encodeProtorunesWalletInput(address, protocol_tag);
    const byteString = await this._call({
      method: 'protorunesbyaddress',
      input: buffer
    });
    const decoded = wallet.decodeWalletOutput(byteString);
    return decoded;
  }
}
