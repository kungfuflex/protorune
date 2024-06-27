import { u128 } from "as-bignum/assembly";
import { IndexPointer } from "metashrew-as/assembly/indexer/tables";
import { PROTOCOL_TAG as PROTORUNE_TAG } from "./protorune";

export const RUNESTONE_TAG: u16 = 0x5d6a;
export const PROTOBURN_TAG: u16 = 0x6a6a;
export const PROTOMESSAGE_TAG: u16 = 0x6b6a;

export const OP_RETURN: u8 = 0x6a;

export const GENESIS: u32 = 840000;

export const PROTOCOLS_TO_INDEX = new Set<u16>();
// initial protorune tag
PROTOCOLS_TO_INDEX.add(PROTORUNE_TAG);

export const HEIGHT_TO_BLOCKHASH = IndexPointer.for("/blockhash/byheight/");
export const BLOCKHASH_TO_HEIGHT = IndexPointer.for("/height/byblockhash/");
export const OUTPOINT_TO_RUNES = IndexPointer.for("/runes/byoutpoint/");
export const OUTPOINT_TO_HEIGHT = IndexPointer.for("/height/byoutpoint/");
export const HEIGHT_TO_TRANSACTION_IDS = IndexPointer.for("/txids/byheight");
export const SYMBOL = IndexPointer.for("/runes/symbol/");
export const CAP = IndexPointer.for("/runes/cap/");
export const SPACERS = IndexPointer.for("/runes/spaces/");
export const OFFSETEND = IndexPointer.for("/runes/offset/end/");
export const OFFSETSTART = IndexPointer.for("/runes/offset/start/");
export const HEIGHTSTART = IndexPointer.for("/runes/height/start/");
export const HEIGHTEND = IndexPointer.for("/runes/height/end/");
export const AMOUNT = IndexPointer.for("/runes/amount/");
export const MINTS_REMAINING = IndexPointer.for("/runes/mints-remaining/");
export const PREMINE = IndexPointer.for("/runes/premine/");
export const DIVISIBILITY = IndexPointer.for("/runes/divisibility/");
export const RUNE_ID_TO_HEIGHT = IndexPointer.for("/height/byruneid/");
export const ETCHINGS = IndexPointer.for("/runes/names");
export const RUNE_ID_TO_ETCHING = IndexPointer.for("/etching/byruneid/");
export const ETCHING_TO_RUNE_ID = IndexPointer.for("/runeid/byetching/");

export const MINIMUM_NAME = u128.from("99246114928149462");
export const TWENTY_SIX = u128.from(26);
export const RESERVED_NAME = u128.from("6402364363415443603228541259936211926");
export const SUBSIDY_HALVING_INTERVAL: u64 = 210_000;
export const HEIGHT_INTERVAL: u64 = 17_500;
