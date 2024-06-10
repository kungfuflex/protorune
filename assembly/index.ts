import { Box } from "metashrew-as/assembly/utils/box";
import { _flush, input, get, set } from "metashrew-as/assembly/indexer/index";
import { IndexPointer } from "metashrew-as/assembly/indexer/tables";
import { intoString, scriptParse } from "metashrew-as/assembly/utils/yabsp";
import { Block } from "metashrew-as/assembly/blockdata/block";
import { parsePrimitive } from "metashrew-as/assembly/utils/utils";
import {
  Transaction,
  Input,
  Output,
  OutPoint,
} from "metashrew-as/assembly/blockdata/transaction";
import { console } from "metashrew-as/assembly/utils/logging";
import { toRLP, RLPItem } from "metashrew-as/assembly/utils/rlp";
import { BST } from "metashrew-as/assembly/indexer/bst";
import { readULEB128ToU128 } from "./leb128";
import { u256, u128 } from "as-bignum/assembly";
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
  if (height < GENESIS) {
    _flush();
    return;
  }
  const block = new Block(box);
  SpendablesIndex.indexBlock(height, block);
  Index.indexBlock(height, block);
  _flush();
}

export * from "./tests";
export * from "./view";
