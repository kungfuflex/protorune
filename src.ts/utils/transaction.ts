import * as bitcoin from "bitcoinjs-lib";
import * as ecc from "tiny-secp256k1";
import ECPairFactory from "ecpair";
import { rpcCall } from "./sandshrew";
import BIP32Factory from "bip32";
import * as bip39 from "bip39";

const bip32 = BIP32Factory(ecc);
const DEFAULT_AMOUNT = 2_000;

export const getPrivKey = () => {
  const mnemonic = process.env.PRIVATE_KEY || "";
  const seed = bip39.mnemonicToSeedSync(mnemonic);
  const node = bip32.fromSeed(seed, bitcoin.networks.bitcoin);
  return node;
};

export async function getFeeEstimates(): Promise<number> {
  return await rpcCall("esplora_fee-estimates", []);
}

export async function getVSize(tx: string): Promise<number> {
  return (await rpcCall("btc_decoderawtransaction", [tx])).vsize;
}

type UTXO = { txid: string; vout: number; value: number };
//@TODO: should fetch a list of spendable outpoints for the specified address
export async function getInputsFor(address: string, amount: number) {
  const utxos: UTXO[] = await rpcCall("esplora_address::txs:mempool", [
    address,
  ]);
  const inputs = utxos.reduce(
    (a, d) => {
      if (a.total < amount) {
        return {
          result: { ...a.result, d },
          total: (a.total += d.value),
        };
      }
      return a;
    },
    { result: [], total: 0 } as { result: UTXO[]; total: number },
  ).result;
  return { inputs, utxos };
}

export async function buildRunesTransaction(outputs: any[], address: string) {
  const { inputs, utxos } = await getInputsFor(address, DEFAULT_AMOUNT);
  const tx = new bitcoin.Psbt();
  outputs.map((o) =>
    tx.addOutput({
      script: o.script,
      value: o.value,
    }),
  );

  let currentIndex = inputs.length;
  let currentTotal = inputs.reduce((a, d) => {
    tx.addInput({
      hash: Buffer.from(d.txid, "hex"),
      index: d.vout,
    });
    return a + d.value;
  }, 0);
  //locktime - 6 blocks
  tx.locktime = 6;

  const pair = getPrivKey();
  tx.signAllInputs(pair);

  let vsize = await getVSize(tx.extractTransaction().toHex());
  const feeRate = await getFeeEstimates();

  let fee = vsize * feeRate;
  while (fee > currentTotal) {
    if (currentIndex > utxos.length)
      throw new Error("wallet does not have enough spendable btc");
    const v = utxos[currentIndex];
    tx.addInput({ hash: Buffer.from(v.txid, "hex"), index: v.vout });
    tx.signInput(currentIndex, pair);
    currentIndex++;
    currentTotal += v.value;
    vsize = await getVSize(tx.extractTransaction().toHex());
    fee = vsize * feeRate;
  }

  tx.addOutput({
    script:
      bitcoin.payments.p2pkh({
        address,
        network: bitcoin.networks.bitcoin,
      }).output || Buffer.from(""),
    value: currentTotal - fee,
  });

  return tx;
}
