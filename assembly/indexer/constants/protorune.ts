import { IndexPointer } from "metashrew-as/assembly/indexer/tables";

const protocol: ArrayBuffer = new ArrayBuffer(2);
export const PROTOCOL_TAG: u16 = 0x6d6a;
store<u16>(changetype<usize>(protocol), PROTOCOL_TAG);
const PROTORUNE = IndexPointer.for("/rune/proto").select(protocol);

export const OUTPOINT_TO_RUNES = PROTORUNE.keyword("/runes/byoutpoint/");
export const HEIGHT_TO_TRANSACTION_IDS = PROTORUNE.keyword("/txids/byheight");
export const SYMBOL = PROTORUNE.keyword("/runes/symbol/");
export const SPACERS = PROTORUNE.keyword("/runes/spaces/");
export const DIVISIBILITY = PROTORUNE.keyword("/runes/divisibility/");
export const ETCHINGS = PROTORUNE.keyword("/runes/names");
export const RUNE_ID_TO_ETCHING = PROTORUNE.keyword("/etching/byruneid/");
export const ETCHING_TO_RUNE_ID = PROTORUNE.keyword("/runeid/byetching/");
