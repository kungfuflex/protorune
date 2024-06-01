import { metashrew as proto } from "metashrew-as/assembly/proto/metashrew";
import { Box } from "metashrew-as/assembly/utils/box";
import { input } from "metashrew-as/assembly/indexer/index";
import { BalanceSheet } from "./indexer/BalanceSheet";
import { OUTPOINT_TO_RUNES } from "./indexer/constants";

export function outpoint(): ArrayBuffer {
  const outpoint = input();
}
