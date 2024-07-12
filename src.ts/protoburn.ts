import { ProtoStone } from "./protostone";
import { encodeRunestone } from "@magiceden-oss/runestone-lib";
import * as bitcoin from "bitcoinjs-lib";

//@TODO: should fetch a list of spendable outpoints for the specified address
async function getInputsFor(address: string) {
  return [];
}

export async function encodeProtoburn(
  runes: {
    id: { block: bigint; tx: number };
    amount: bigint;
  }[],
  burn: { protocolTag: bigint; pointer: number },
  address: string,
) {
  const runestone = encodeRunestone({
    edicts: runes.map((r) => ({ ...r, output: 1 })),
    pointer: 2,
  }).encodedRunestone;
  const protoburn = ProtoStone.burn(burn).encipher();

  const inputs = [];
  const psbt = new bitcoin.Psbt();
  const outs = [
    {
      script: runestone,
      value: 0,
    },
    {
      script: protoburn,
      value: 0,
    },
    {
      script:
        bitcoin.payments.p2pkh({
          address,
          network: bitcoin.networks.bitcoin,
        }).output || Buffer.from(""),
      //@TODO: change so that it correctly gets the value to be sent
      value: 1,
    },
  ];
  outs.map((o) => psbt.addOutput(o));
}
