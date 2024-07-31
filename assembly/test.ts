import { Box } from "metashrew-as/assembly/utils/box";
import { _flush, input } from "metashrew-as/assembly/indexer/index";
import { Block } from "metashrew-as/assembly/blockdata/block";
import { parsePrimitive } from "metashrew-as/assembly/utils/utils";
import { DefaultProtorune, Protorune } from "./indexer";
import { MessageContext } from "./indexer/protomessage";
import { GENESIS } from "metashrew-runes/assembly/indexer/constants";
import { Index as SpendablesIndex } from "metashrew-spendables/assembly/indexer";
import { IncomingRune } from "./indexer/protomessage/IncomingRune";

class DepositAllContext extends MessageContext {
  handle(): bool {
    this.runes.map<IncomingRune>((rune) => {
      rune.depositAll();
      return rune;
    });
    return true;
  }
}

class DepositAllProtorune extends Protorune<DepositAllContext> {}

export function testProtomessage() {
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
  new DepositAllProtorune().indexBlock(height, block);
  _flush();
}
