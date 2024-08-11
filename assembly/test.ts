import { Box } from "metashrew-as/assembly/utils/box";
import { _flush, input } from "metashrew-as/assembly/indexer/index";
import { Block } from "metashrew-as/assembly/blockdata/block";
import { parsePrimitive } from "metashrew-as/assembly/utils/utils";
import { u128 } from "as-bignum/assembly";
import { ProtoruneRuneId } from "./indexer/ProtoruneRuneId";
import { DefaultProtorune, Protorune } from "./indexer";
import { MessageContext } from "./indexer/protomessage";
import { GENESIS } from "metashrew-runes/assembly/indexer/constants";
import { IncomingRune } from "./indexer/protomessage/IncomingRune";
import { SpendablesIndex } from "metashrew-spendables/assembly/indexer";
import { console } from "metashrew-as/assembly/utils/logging"
import { IndexPointer } from "metashrew-as/assembly/indexer/tables";

export const TEST_PROTORUNE_RUNEID = IndexPointer.for("/test/protorune/runeid/");

class DepositAllContext extends MessageContext {
  handle(): bool {
    this.runes.map<IncomingRune>((rune) => {
      rune.depositAll();
      return rune;
    });
    return true;
  }
}

class DepositAllProtorune extends Protorune<DepositAllContext> { }

export function test_ProtoruneRuneId(): void {
  const runeId = ProtoruneRuneId.encode([u128.from(50), u128.from(100)]);
  console.log(runeId.block.toString());
  console.log(runeId.tx.toString());
  TEST_PROTORUNE_RUNEID.select(String.UTF8.encode("block")).set(runeId.block.toUint8Array().buffer);
  TEST_PROTORUNE_RUNEID.select(String.UTF8.encode("tx")).set(runeId.tx.toUint8Array().buffer);
  const decoded = runeId.decode();
  for (let i = 0; i < decoded.length; i++) {
    console.log("decoded[" + i.toString() + "]: " + decoded[i].toString())
  }
  _flush();
}

export function testProtomessage(): void {
  const data = input();
  const box = Box.from(data);
  const height = parsePrimitive<u32>(box);
  if (height < GENESIS - 6) {
    _flush();
    return;
  }
  const block = new Block(box);
  if (height >= GENESIS) {
    new SpendablesIndex().indexBlock(height, block);
  }
  new DepositAllProtorune().indexBlock(height, block);
  _flush();
}

export function testEtching(): void {
  const data = input();
  const box = Box.from(data);
  const height = parsePrimitive<u32>(box);
  if (height < GENESIS - 6) {
    _flush();
    return;
  }
  const block = new Block(box);
  if (height >= GENESIS) {
    new SpendablesIndex().indexBlock(height, block);
  }
  const indexer = new DefaultProtorune(true, true);
  indexer.indexBlock(height, block);
  _flush();
}
