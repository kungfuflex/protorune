import { Box } from "metashrew-as/assembly/utils/box";
import { _flush, input } from "metashrew-as/assembly/indexer/index";
import { Block } from "metashrew-as/assembly/blockdata/block";
import { parsePrimitive } from "metashrew-as/assembly/utils/utils";
import { Index } from "./indexer";
import { GENESIS } from "./indexer/constants";
import { Index as SpendablesIndex } from "metashrew-spendables/assembly/indexer";

export function trap(): void {
  unreachable();
}

export function _start(): void {
  const data = input();
  const box = Box.from(data);
  const height = parsePrimitive<u32>(box);
  if (height < GENESIS - 6) {
    _flush();
    return;
  }
  const block = new Block(box);
  if (height >= GENESIS) {
    SpendablesIndex.indexBlock(height, block);
  }
  Index.indexBlock(height, block);
  _flush();
}

export * from "./tests";
export * from "./view";
