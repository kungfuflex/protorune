import { IndexPointer } from "metashrew-as/assembly/indexer/tables";

export const RUNESTONE_TAG: u16 = 0x5d6a;
export const OP_RETURN: u8 = 0x6a;

export const GENESIS: u32 = 840000;

export const HEIGHT_TO_BLOCKHASH = IndexPointer.for("/blockhash/byheight/");
export const BLOCKHASH_TO_HEIGHT = IndexPointer.for("/height/byblockhash/");
export const OUTPOINT_TO_RUNES = IndexPointer.for("/height/byblockhash/");
export const OUTPOINT_TO_HEIGHT = IndexPointer.for("/height/byoutpoint/");
export const HEIGHT_TO_TRANSACTION_IDS = IndexPointer.for(
  "/transactionids/byheight"
);
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
export const RUNE_ID_TO_ETCHING = IndexPointer.for("/etching/byruneid/");
export const ETCHING_TO_RUNE_ID = IndexPointer.for("/runeid/byetching/");
