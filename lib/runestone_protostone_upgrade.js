"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.RunestoneProtostoneUpgrade = exports.MAX_SPACERS = void 0;
exports.isValidPayload = isValidPayload;
exports.encodeRunestoneProtostone = encodeRunestoneProtostone;
// file is forked from @magiceden-oss/runestone-lib/src/runestone
// I left comments where I made changes
const constants_1 = require("@magiceden-oss/runestone-lib/dist/src/constants");
const etching_1 = require("@magiceden-oss/runestone-lib/dist/src/etching");
const tag_1 = require("@magiceden-oss/runestone-lib/dist/src/tag");
const integer_1 = require("@magiceden-oss/runestone-lib/dist/src/integer");
const monads_1 = require("@magiceden-oss/runestone-lib/dist/src/monads");
const flag_1 = require("@magiceden-oss/runestone-lib/dist/src/flag");
const runeid_1 = require("@magiceden-oss/runestone-lib/dist/src/runeid");
const script_1 = require("@magiceden-oss/runestone-lib/dist/src/script");
const spacedrune_1 = require("@magiceden-oss/runestone-lib/dist/src/spacedrune");
exports.MAX_SPACERS = 134217727;
function isValidPayload(payload) {
    return Buffer.isBuffer(payload);
}
class RunestoneProtostoneUpgrade {
    constructor(mint, pointer, edicts, etching, 
    /* BEGIN CODE CHANGE */
    protostones) {
        this.mint = mint;
        this.pointer = pointer;
        this.edicts = edicts;
        this.etching = etching;
        this.protostones = protostones;
    }
    // removed decipher function -- can add it back if needed
    encipher() {
        const payloads = [];
        if (this.etching.isSome()) {
            const etching = this.etching.unwrap();
            let flags = (0, integer_1.u128)(0);
            flags = flag_1.Flag.set(flags, flag_1.Flag.ETCHING);
            if (etching.terms.isSome()) {
                flags = flag_1.Flag.set(flags, flag_1.Flag.TERMS);
            }
            if (etching.turbo) {
                flags = flag_1.Flag.set(flags, flag_1.Flag.TURBO);
            }
            payloads.push(tag_1.Tag.encode(tag_1.Tag.FLAGS, [flags]));
            payloads.push(tag_1.Tag.encodeOptionInt(tag_1.Tag.RUNE, etching.rune.map((rune) => rune.value)));
            payloads.push(tag_1.Tag.encodeOptionInt(tag_1.Tag.DIVISIBILITY, etching.divisibility.map(integer_1.u128)));
            payloads.push(tag_1.Tag.encodeOptionInt(tag_1.Tag.SPACERS, etching.spacers.map(integer_1.u128)));
            payloads.push(tag_1.Tag.encodeOptionInt(tag_1.Tag.SYMBOL, etching.symbol.map((symbol) => (0, integer_1.u128)(symbol.codePointAt(0)))));
            payloads.push(tag_1.Tag.encodeOptionInt(tag_1.Tag.PREMINE, etching.premine));
            if (etching.terms.isSome()) {
                const terms = etching.terms.unwrap();
                payloads.push(tag_1.Tag.encodeOptionInt(tag_1.Tag.AMOUNT, terms.amount));
                payloads.push(tag_1.Tag.encodeOptionInt(tag_1.Tag.CAP, terms.cap));
                payloads.push(tag_1.Tag.encodeOptionInt(tag_1.Tag.HEIGHT_START, terms.height[0]));
                payloads.push(tag_1.Tag.encodeOptionInt(tag_1.Tag.HEIGHT_END, terms.height[1]));
                payloads.push(tag_1.Tag.encodeOptionInt(tag_1.Tag.OFFSET_START, terms.offset[0]));
                payloads.push(tag_1.Tag.encodeOptionInt(tag_1.Tag.OFFSET_END, terms.offset[1]));
            }
        }
        if (this.mint.isSome()) {
            const claim = this.mint.unwrap();
            payloads.push(tag_1.Tag.encode(tag_1.Tag.MINT, [claim.block, claim.tx].map(integer_1.u128)));
        }
        payloads.push(tag_1.Tag.encodeOptionInt(tag_1.Tag.POINTER, this.pointer.map(integer_1.u128)));
        if (this.edicts.length) {
            payloads.push(integer_1.u128.encodeVarInt((0, integer_1.u128)(tag_1.Tag.BODY)));
            const edicts = [...this.edicts].sort((x, y) => Number(x.id.block - y.id.block || x.id.tx - y.id.tx));
            let previous = new runeid_1.RuneId((0, integer_1.u64)(0), (0, integer_1.u32)(0));
            for (const edict of edicts) {
                const [block, tx] = previous.delta(edict.id).unwrap();
                payloads.push(integer_1.u128.encodeVarInt(block));
                payloads.push(integer_1.u128.encodeVarInt(tx));
                payloads.push(integer_1.u128.encodeVarInt(edict.amount));
                payloads.push(integer_1.u128.encodeVarInt((0, integer_1.u128)(edict.output)));
                previous = edict.id;
            }
        }
        /* BEGIN CODE CHANGE */
        if (this.protostones.length) {
            // TODO: ORDERING?
            // TODO: encode 13 in front of everything
            this.protostones.forEach((protostone) => {
                payloads.push(...protostone.encipher_payloads());
            });
        }
        /* CODE CHANGE END */
        const stack = [];
        stack.push(constants_1.OP_RETURN);
        stack.push(constants_1.MAGIC_NUMBER);
        const payload = Buffer.concat(payloads);
        let i = 0;
        for (let i = 0; i < payload.length; i += constants_1.MAX_SCRIPT_ELEMENT_SIZE) {
            stack.push(payload.subarray(i, i + constants_1.MAX_SCRIPT_ELEMENT_SIZE));
        }
        return script_1.script.compile(stack);
    }
}
exports.RunestoneProtostoneUpgrade = RunestoneProtostoneUpgrade;
// Helper functions to ensure numbers fit the desired type correctly
const u8Strict = (n) => {
    const bigN = BigInt(n);
    if (bigN < 0n || bigN > integer_1.u8.MAX) {
        throw Error("u8 overflow");
    }
    return (0, integer_1.u8)(bigN);
};
const u32Strict = (n) => {
    const bigN = BigInt(n);
    if (bigN < 0n || bigN > integer_1.u32.MAX) {
        throw Error("u32 overflow");
    }
    return (0, integer_1.u32)(bigN);
};
const u64Strict = (n) => {
    const bigN = BigInt(n);
    if (bigN < 0n || bigN > integer_1.u64.MAX) {
        throw Error("u64 overflow");
    }
    return (0, integer_1.u64)(bigN);
};
const u128Strict = (n) => {
    const bigN = BigInt(n);
    if (bigN < 0n || bigN > integer_1.u128.MAX) {
        throw Error("u128 overflow");
    }
    return (0, integer_1.u128)(bigN);
};
/**
 * Low level function to allow for encoding runestones without any indexer and transaction checks.
 *
 * @param runestone runestone spec to encode as runestone
 * @returns encoded runestone bytes
 * @throws Error if encoding is detected to be considered a cenotaph
 */
function encodeRunestoneProtostone(runestone) {
    const mint = runestone.mint
        ? (0, monads_1.Some)(new runeid_1.RuneId(u64Strict(runestone.mint.block), u32Strict(runestone.mint.tx)))
        : monads_1.None;
    const pointer = runestone.pointer !== undefined
        ? (0, monads_1.Some)(runestone.pointer).map(u32Strict)
        : monads_1.None;
    const edicts = (runestone.edicts ?? []).map((edict) => ({
        id: new runeid_1.RuneId(u64Strict(edict.id.block), u32Strict(edict.id.tx)),
        amount: u128Strict(edict.amount),
        output: u32Strict(edict.output),
    }));
    const protostones = runestone.protostones ?? [];
    let etching = monads_1.None;
    let etchingCommitment = undefined;
    if (runestone.etching) {
        const etchingSpec = runestone.etching;
        const spacedRune = etchingSpec.runeName
            ? spacedrune_1.SpacedRune.fromString(etchingSpec.runeName)
            : undefined;
        const rune = spacedRune?.rune !== undefined ? (0, monads_1.Some)(spacedRune.rune) : monads_1.None;
        if (etchingSpec.symbol &&
            !(etchingSpec.symbol.length === 1 ||
                (etchingSpec.symbol.length === 2 &&
                    etchingSpec.symbol.codePointAt(0) >= 0x10000))) {
            throw Error("Symbol must be one code point");
        }
        const divisibility = etchingSpec.divisibility !== undefined
            ? (0, monads_1.Some)(etchingSpec.divisibility).map(u8Strict)
            : monads_1.None;
        const premine = etchingSpec.premine !== undefined
            ? (0, monads_1.Some)(etchingSpec.premine).map(u128Strict)
            : monads_1.None;
        const spacers = spacedRune?.spacers !== undefined && spacedRune.spacers !== 0
            ? (0, monads_1.Some)(u32Strict(spacedRune.spacers))
            : monads_1.None;
        const symbol = etchingSpec.symbol ? (0, monads_1.Some)(etchingSpec.symbol) : monads_1.None;
        if (divisibility.isSome() && divisibility.unwrap() > constants_1.MAX_DIVISIBILITY) {
            throw Error(`Divisibility is greater than protocol max ${constants_1.MAX_DIVISIBILITY}`);
        }
        let terms = monads_1.None;
        if (etchingSpec.terms) {
            const termsSpec = etchingSpec.terms;
            const amount = termsSpec.amount !== undefined
                ? (0, monads_1.Some)(termsSpec.amount).map(u128Strict)
                : monads_1.None;
            const cap = termsSpec.cap !== undefined
                ? (0, monads_1.Some)(termsSpec.cap).map(u128Strict)
                : monads_1.None;
            const height = termsSpec.height
                ? [
                    termsSpec.height.start !== undefined
                        ? (0, monads_1.Some)(termsSpec.height.start).map(u64Strict)
                        : monads_1.None,
                    termsSpec.height.end !== undefined
                        ? (0, monads_1.Some)(termsSpec.height.end).map(u64Strict)
                        : monads_1.None,
                ]
                : [monads_1.None, monads_1.None];
            const offset = termsSpec.offset
                ? [
                    termsSpec.offset.start !== undefined
                        ? (0, monads_1.Some)(termsSpec.offset.start).map(u64Strict)
                        : monads_1.None,
                    termsSpec.offset.end !== undefined
                        ? (0, monads_1.Some)(termsSpec.offset.end).map(u64Strict)
                        : monads_1.None,
                ]
                : [monads_1.None, monads_1.None];
            if (amount.isSome() &&
                cap.isSome() &&
                amount.unwrap() * cap.unwrap() > integer_1.u128.MAX) {
                throw Error("Terms overflow with amount times cap");
            }
            terms = (0, monads_1.Some)({ amount, cap, height, offset });
        }
        const turbo = etchingSpec.turbo ?? false;
        etching = (0, monads_1.Some)(new etching_1.Etching(divisibility, rune, spacers, symbol, terms, premine, turbo));
        etchingCommitment = rune.isSome() ? rune.unwrap().commitment : undefined;
    }
    return {
        encodedRunestone: new RunestoneProtostoneUpgrade(mint, pointer, edicts, etching, protostones).encipher(),
        etchingCommitment,
    };
}
//# sourceMappingURL=runestone_protostone_upgrade.js.map