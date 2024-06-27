import { Field } from "./Field";
import { fieldTo, toPrimitive, min } from "../utils";
import { Edict } from "./Edict";
import { OUTPOINT_TO_RUNES } from "./constants/protorune";
import { BalanceSheet } from "./BalanceSheet";
import { RunesTransaction } from "./RunesTransaction";
import { Input, OutPoint } from "metashrew-as/assembly/blockdata/transaction";
import { RunestoneMessage } from "./RunestoneMessage";

export class ProtoruneMessage extends RunestoneMessage {
  mint(_height: u32, _balanceSheet: BalanceSheet): bool {
    return false;
  }

  etch(_height: u64, _tx: u32, _initialBalanceSheet: BalanceSheet): bool {
    return false;
  }

  processEdicts(
    balancesByOutput: Map<u32, BalanceSheet>,
    balanceSheet: BalanceSheet,
  ): void {
    const edicts = Edict.fromDeltaSeries(this.edicts);
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
  }
  process(
    tx: RunesTransaction,
    txid: ArrayBuffer,
    height: u32,
    txindex: u32,
  ): void {
    let balanceSheet = BalanceSheet.concat(
      tx.ins.map<BalanceSheet>((v: Input, i: i32, ary: Array<Input>) =>
        BalanceSheet.load(
          OUTPOINT_TO_RUNES.select(v.previousOutput().toArrayBuffer()),
        ),
      ),
    );
    const balancesByOutput = new Map<u32, BalanceSheet>();

    const hasMinted = this.mint(height, balanceSheet);
    const hasEtched = this.etch(<u64>height, <u32>txindex, balanceSheet);

    if (hasMinted || hasEtched) {
      const unallocatedTo = this.fields.has(Field.POINTER)
        ? fieldTo<u32>(this.fields.get(Field.POINTER))
        : <u32>tx.defaultOutput();
      if (balancesByOutput.has(unallocatedTo)) {
        balanceSheet.pipe(balancesByOutput.get(unallocatedTo));
      } else {
        balancesByOutput.set(unallocatedTo, balanceSheet);
      }
    }

    this.processEdicts(balancesByOutput, balanceSheet);

    const runesToOutputs = balancesByOutput.keys();

    for (let x = 0; x < runesToOutputs.length; x++) {
      const sheet = balancesByOutput.get(runesToOutputs[x]);
      sheet.save(
        OUTPOINT_TO_RUNES.select(
          OutPoint.from(txid, runesToOutputs[x]).toArrayBuffer(),
        ),
      );
    }
  }
}
