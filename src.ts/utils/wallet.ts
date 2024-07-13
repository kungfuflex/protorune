import * as bitcoin from "bitcoinjs-lib";
import * as ecc from "tiny-secp256k1";
import BIP32Factory from "bip32";
import * as bip39 from "bip39";

const bip32 = BIP32Factory(ecc);
const mnemonic = process.env.PRIVATE_KEY || "";
const seed = bip39.mnemonicToSeedSync(mnemonic);
export const node = bip32.fromSeed(seed, bitcoin.networks.bitcoin);
export const DEFAULT = node.derive(0);
