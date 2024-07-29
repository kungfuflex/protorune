import { toPrimitive, min, fieldTo } from "metashrew-runes/assembly/utils";
import { Edict } from "metashrew-runes/assembly/indexer/Edict";
import { ProtoruneTable } from "./tables/protorune";
import { BalanceSheet } from "metashrew-runes/assembly/indexer/BalanceSheet";
import { RunesTransaction } from "metashrew-runes/assembly/indexer/RunesTransaction";
import { OutPoint } from "metashrew-as/assembly/blockdata/transaction";
import { RunestoneMessage } from "metashrew-runes/assembly/indexer/RunestoneMessage";
import { u128 } from "as-bignum/assembly";
import { console } from "metashrew-as/assembly/utils/logging";
import { Field } from "./fields";
import { encodeHexFromBuffer } from "metashrew-as/assembly/utils";
import { ProtoStone } from "./ProtoStone";
import { u128ToHex } from "metashrew-runes/assembly/utils";
import { Box } from "metashrew-as/assembly/utils/box";

export class ProtoruneMessage extends RunestoneMessage {
  constructor(
    fields: Map<u64, Array<u128>>,
    edicts: Array<StaticArray<u128>>,
    table: ProtoruneTable,
  ) {
    super(fields, edicts, table);
  }
  static fromProtoStone(protostone: ProtoStone): ProtoruneMessage {
    return new ProtoruneMessage(
      changetype<Map<u64, Array<u128>>>(0),
      protostone.edicts,
      ProtoruneTable.for(protostone.protocol_id),
    );
  }
  static parseProtocol(data: ArrayBuffer, protocol: u128): RunestoneMessage {
    const message = this.parse(data);
    if (protocol == u128.Zero) {
      return message;
    }
    let protorunemessage = new ProtoruneMessage(
      message.fields,
      message.edicts,
      ProtoruneTable.for(protocol),
    );
    return protorunemessage;
  }

  processEdicts(
    edicts: Array<Edict>,
    balancesByOutput: Map<u32, BalanceSheet>,
    balanceSheet: BalanceSheet,
    _txid: ArrayBuffer,
  ): bool {
    let isCenotaph: bool = false;
    for (let e = 0; e < edicts.length; e++) {
      const edict = edicts[e];
      const edictOutput = toPrimitive<u32>(edict.output);

      const runeId = edict.runeId().toBytes();
      let outputBalanceSheet = changetype<BalanceSheet>(0);
      if (!balancesByOutput.has(edictOutput)) {
        balancesByOutput.set(
          edictOutput,
          (outputBalanceSheet = new BalanceSheet()),
        );
      } else outputBalanceSheet = balancesByOutput.get(edictOutput);
      const amount = min(edict.amount, balanceSheet.get(runeId));

      balanceSheet.decrease(runeId, amount);
      outputBalanceSheet.increase(runeId, amount);
    }
    return isCenotaph;
  }
  process(
    tx: RunesTransaction,
    txid: ArrayBuffer,
    _height: u32,
    _txindex: u32,
  ): Map<u32, BalanceSheet> {
    let sheets = new Array<BalanceSheet>();
    for (let i = 0; i < tx.ins.length; i++) {
      sheets.push(
        BalanceSheet.load(
          this.table.OUTPOINT_TO_RUNES.select(
            tx.ins[i].previousOutput().toArrayBuffer(),
          ),
        ),
      );
    }
    let balanceSheet = BalanceSheet.concat(sheets);
    const balancesByOutput = new Map<u32, BalanceSheet>();
    const unallocatedTo = this.fields.has(Field.POINTER)
      ? fieldTo<u32>(this.fields.get(Field.POINTER))
      : <u32>tx.defaultOutput();
    const edicts = Edict.fromDeltaSeries(this.edicts);

    this.processEdicts(edicts, balancesByOutput, balanceSheet, txid);

    if (balancesByOutput.has(unallocatedTo)) {
      balanceSheet.pipe(balancesByOutput.get(unallocatedTo));
    } else {
      balancesByOutput.set(unallocatedTo, balanceSheet);
    }

    //@TODO: save sheet properly
    const runesToOutputs = balancesByOutput.keys();

    for (let x = 0; x < runesToOutputs.length; x++) {
      const sheet = balancesByOutput.get(runesToOutputs[x]);
      sheet.save(
        this.table.OUTPOINT_TO_RUNES.select(
          OutPoint.from(txid, runesToOutputs[x]).toArrayBuffer(),
        ),
      );
    }
    return balancesByOutput;
  }
}
