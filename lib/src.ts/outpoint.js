"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.encodeOutpointInput = encodeOutpointInput;
exports.decodeRunes = decodeRunes;
exports.decodeOutpointViewBase = decodeOutpointViewBase;
exports.decodeOutpointView = decodeOutpointView;
const metashrew_runes_1 = require("./proto/metashrew-runes");
const utils_1 = require("./utils");
function encodeOutpointInput(txid, pos) {
    const input = {
        txid: Buffer.from(txid, "hex"),
        vout: pos,
    };
    const str = Buffer.from(metashrew_runes_1.Outpoint.toBinary(input)).toString("hex");
    return "0x" + str;
}
function decodeRunes(balances) {
    if (!balances)
        return [];
    return balances.entries.map((entry) => {
        const balance = Buffer.from(entry.balance);
        const d = entry.rune;
        const spacer = "•";
        const bitField = d.spacers.toString(2);
        let name = Buffer.from(d.name).toString("utf-8");
        let spaced_name = name;
        const symbol = String.fromCharCode(d.symbol);
        let x = 0;
        bitField
            .split("")
            .reverse()
            .map((d, i) => {
            if (d == "1") {
                spaced_name = `${spaced_name.slice(0, i + 1 + x)}${spacer}${spaced_name.slice(i + 1 + x)}`;
                x++;
            }
        });
        const rune = {
            id: `${d.runeId.height}:${d.runeId.txindex}`,
            name,
            spacedName: spaced_name,
            divisibility: d.divisibility,
            spacers: d.spacers,
            symbol: symbol,
        };
        return {
            rune,
            balance: BigInt("0x" + Buffer.from(balance).toString("hex")),
        };
    });
}
function decodeOutpointViewBase(op) {
    return {
        runes: decodeRunes(op.balances),
        outpoint: {
            txid: Buffer.from(op.outpoint.txid).toString("hex"),
            vout: op.outpoint.vout,
        },
        output: op.output
            ? {
                value: op.output.value,
                script: Buffer.from(op.output.script).toString("hex"),
            }
            : { value: "", script: "" },
        height: op.height,
        txindex: op.txindex,
    };
}
function decodeOutpointView(hex) {
    const bytes = Uint8Array.from(Buffer.from((0, utils_1.stripHexPrefix)(hex), "hex"));
    const op = metashrew_runes_1.OutpointResponse.fromBinary(bytes);
    return decodeOutpointViewBase(op);
}
//# sourceMappingURL=outpoint.js.map