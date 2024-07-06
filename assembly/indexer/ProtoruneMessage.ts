import { toPrimitive, min } from "../utils";
import { Edict } from "./Edict";
import { PROTORUNE_TABLE } from "./tables/protorune";
import { BalanceSheet } from "./BalanceSheet";
import { RunesTransaction } from "./RunesTransaction";
import { Input } from "metashrew-as/assembly/blockdata/transaction";
import { RunestoneMessage } from "./RunestoneMessage";
import { u128 } from "as-bignum/assembly";

export class ProtoruneMessage extends RunestoneMessage {
  table: PROTORUNE_TABLE = changetype<PROTORUNE_TABLE>(0);
  constructor(
    fields: Map<u64, Array<u128>>,
    edicts: Array<StaticArray<u128>>,
    table: PROTORUNE_TABLE,
  ) {
    super(fields, edicts);
    this.table = table;
  }

  static parseProtocol(
    data: ArrayBuffer,
    protocol: u16,
  ): ProtoruneMessage | RunestoneMessage {
    const message = super.parse(data);
    if (protocol == 0) {
      return message;
    }
    return new ProtoruneMessage(
      message.fields,
      message.edicts,
      PROTORUNE_TABLE.for(protocol),
    );
  }

  processEdicts(
    balancesByOutput: Map<u32, BalanceSheet>,
    balanceSheet: BalanceSheet,
    _txid: ArrayBuffer,
  ): bool {
    const edicts = Edict.fromDeltaSeries(this.edicts);
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

      isCenotaph = balanceSheet.decrease(runeId, amount);
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
    let balanceSheet = BalanceSheet.concat(
      tx.ins.map<BalanceSheet>((v: Input, i: i32, ary: Array<Input>) =>
        BalanceSheet.load(
          this.table.OUTPOINT_TO_RUNES.select(
            v.previousOutput().toArrayBuffer(),
          ),
        ),
      ),
    );
    const balancesByOutput = new Map<u32, BalanceSheet>();

    this.processEdicts(balancesByOutput, balanceSheet, txid);

    //@TODO: save sheet properly
    // const runesToOutputs = balancesByOutput.keys();

    // for (let x = 0; x < runesToOutputs.length; x++) {
    //   const sheet = balancesByOutput.get(runesToOutputs[x]);
    //   sheet.save(
    //     OUTPOINT_TO_RUNES.select(
    //       OutPoint.from(txid, runesToOutputs[x]).toArrayBuffer(),
    //     ),
    //   );
    // }
    return balancesByOutput;
  }
}
