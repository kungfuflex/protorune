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
import { console } from "metashrew-as/assembly/utils/logging";
import { IndexPointer } from "metashrew-as/assembly/indexer/tables";

export const TEST_PROTORUNE_RUNEID = IndexPointer.for(
  "/test/protorune/runeid/",
);

class DepositAllContext extends MessageContext {
  handle(): bool {
    this.runes.map<IncomingRune>((rune) => {
      rune.depositAll();
      return rune;
    });
    return true;
  }
}

class ForwardAllContext extends MessageContext {
  handle(): bool {
    this.runes.map<IncomingRune>((rune) => {
      rune.forwardAll();
      return rune;
    });
    return true;
  }
}

// forwards half of each rune, deposits 1/4, refunds 1/4
class SimpleMessageContext extends MessageContext {
  handle(): bool {
    this.runes.map<IncomingRune>((rune) => {
      const initAmount = rune.amount;
      rune.forward(u128.div(initAmount, u128.from(2)));
      rune.deposit(u128.div(initAmount, u128.from(4)));
      // no action for the rest, by default should be refunded
      return rune;
    });
    return true;
  }
}

// tests refunding existing deposts and forwards
class RefundMessageContext extends MessageContext {
  handle(): bool {
    this.runes.map<IncomingRune>((rune) => {
      const initAmount = rune.amount;
      const forward1 = rune.forward(u128.div(initAmount, u128.from(2)));
      // forward amount / 2
      console.log("forward1: " + forward1.toString());
      const deposit1 = rune.deposit(u128.div(initAmount, u128.from(4)));
      console.log("deposit1: " + deposit1.toString());
      //deposit amount / 4
      const refund1 = rune.refund(u128.div(initAmount, u128.from(8)));
      console.log("refund1: " + refund1.toString());
      //refund amount / 8
      const refund2 = rune.refund(u128.div(initAmount, u128.from(4)));
      console.log("refund2: " + refund2.toString());
      //refund amount / 4

      //total forwarded => amount /4
      //total refunded => 3*amount /4
      rune.refundDeposit(u128.div(initAmount, u128.from(4)));
      return rune;
    });
    return true;
  }
}

class DepositAllProtorune extends Protorune<DepositAllContext> {}
class ForwardAllProtorune extends Protorune<ForwardAllContext> {}
class SimpleProtorune extends Protorune<SimpleMessageContext> {}
class RefundProtorune extends Protorune<RefundMessageContext> {}

function _test_ProtoruneRuneId(runeId: ProtoruneRuneId): void {
  console.log(runeId.block.toString());
  console.log(runeId.tx.toString());
  TEST_PROTORUNE_RUNEID.select(String.UTF8.encode("block")).set(
    runeId.block.toUint8Array().buffer,
  );
  TEST_PROTORUNE_RUNEID.select(String.UTF8.encode("tx")).set(
    runeId.tx.toUint8Array().buffer,
  );
  const decoded = runeId.decode();
  for (let i = 0; i < decoded.length; i++) {
    console.log("decoded[" + i.toString() + "]: " + decoded[i].toString());
    TEST_PROTORUNE_RUNEID.select(String.UTF8.encode("decoded/"))
      .select(String.UTF8.encode(i.toString()))
      .set(decoded[i].toUint8Array().buffer);
  }
  _flush();
}

export function test_ProtoruneRuneId1(): void {
  const runeId = ProtoruneRuneId.encode([u128.from(50), u128.from(100)]);
  _test_ProtoruneRuneId(runeId);
}

export function test_ProtoruneRuneId2(): void {
  const runeId = ProtoruneRuneId.encode([
    u128.from(50000000),
    u128.from(1000000000),
  ]);
  _test_ProtoruneRuneId(runeId);
}

export function test_ProtoruneRuneId3(): void {
  const runeId = ProtoruneRuneId.encode([
    u128.from(50000000),
    u128.from(1000000000),
    u128.from(1500000000),
  ]);
  _test_ProtoruneRuneId(runeId);
}

export function test_ProtoruneRuneId4(): void {
  const runeId = ProtoruneRuneId.encode([
    u128.from(50000000),
    u128.from(1000000000),
    u128.from(1500000000),
    u128.from(2000000000),
  ]);
  _test_ProtoruneRuneId(runeId);
}

export function test_ProtoruneRuneId5(): void {
  const runeId = ProtoruneRuneId.encode([
    u128.from(50000000),
    u128.from(1000000000),
    u128.from(1500000000),
    u128.from(2000000000),
    u128.from(50000000),
    u128.from(1000000000),
    u128.from(1500000000),
    u128.from(2000000000),
  ]);
  _test_ProtoruneRuneId(runeId);
}

export function testProtomessageDepositAll(): void {
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

export function testProtomessageForwardAll(): void {
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
  new ForwardAllProtorune().indexBlock(height, block);
  _flush();
}

export function testSimpleProtorune(): void {
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
  new SimpleProtorune().indexBlock(height, block);
  _flush();
}
export function testRefundProtorune(): void {
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
  new RefundProtorune().indexBlock(height, block);
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
