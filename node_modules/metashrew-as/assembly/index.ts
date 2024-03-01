import { Box } from "./utils/box";
import { memcpy } from "./utils/memcpy";
import { 
  concat, 
  reverse, 
  parseLenThenBytes, 
  parsePrimitive, 
  parsePushOp, 
  parseBytes, 
  isPushOp, 
  decodeTag, 
  parseVarInt 
} from "./utils/utils";
import { Index, get, set, _flush, input } from "./indexer/index";
import { console } from "./utils/logging";
import { abort } from "./utils/abort";
import { Block } from "./blockdata";
import { encodeHexFromBuffer } from "./utils/hex";


export function _start(): void {
  const data = input();
  const box = Box.from(data);
  const height = parsePrimitive<u32>(box);
  const block = new Block(box);

  _flush();
}
