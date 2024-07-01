'use strict';

import * as wallet from "./wallet";
import url from "url";
import { OutPoint, RuneOutput } from "./outpoint";

const addHexPrefix = (s) => s.substr(0, 2) === '0x' ? s : '0x' + s;

let id = 0;

export class MetashrewRunes {
  public baseUrl: string;
  public blockTag: string;
  constructor({
    baseUrl,
    blockTag
  }: any) {
    this.baseUrl = baseUrl || 'http://localhost:8080';
    this.blockTag = blockTag || 'latest';
  }
  async _call({
    method,
    input
  }): Promise<string> {
    console.log(input);
    const response = (await (await fetch(url.format({
      ...url.parse(this.baseUrl),
      pathname: '/'
    }), {
      method: 'POST',
      body: JSON.stringify({
        id: id++,
	jsonrpc: '2.0',
	method: 'metashrew_view',
	params: [ method, input, this.blockTag ]
      }),
      headers: {
        'Content-Type': 'application/json',
	'Accept': 'application/json'
      }
    })).json());
    console.log(response);
    return addHexPrefix(response.result);
  }
  async runesbyaddress({
    address: string
  }: any): Promise<{
    outpoints: OutPoint[];
    balanceSheet: RuneOutput[];
  }> {
    const buffer = wallet.encodeWalletInput(string);
    const byteString = await this._call({
      method: 'runesbyaddress',
      input: buffer
    });
    const decoded = wallet.decodeWalletOutput(byteString);
    return decoded;
  }
}
