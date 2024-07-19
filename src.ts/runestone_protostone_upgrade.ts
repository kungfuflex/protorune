// file is forked from @magiceden-oss/runestone-lib/src/runestone
// I left comments where I made changes
import {
  MAGIC_NUMBER,
  MAX_DIVISIBILITY,
  MAX_SCRIPT_ELEMENT_SIZE,
  OP_RETURN,
} from "@magiceden-oss/runestone-lib/dist/src/constants";
import { Edict } from "@magiceden-oss/runestone-lib/dist/src/edict";
import { Etching } from "@magiceden-oss/runestone-lib/dist/src/etching";
import { SeekBuffer } from "@magiceden-oss/runestone-lib/dist/src/seekbuffer";
import { Tag } from "@magiceden-oss/runestone-lib/dist/src/tag";
import {
  u128,
  u32,
  u64,
  u8,
} from "@magiceden-oss/runestone-lib/dist/src/integer";
import {
  Option,
  Some,
  None,
} from "@magiceden-oss/runestone-lib/dist/src/monads";
import { Rune } from "@magiceden-oss/runestone-lib/dist/src/rune";
import { Flag } from "@magiceden-oss/runestone-lib/dist/src/flag";
import { Instruction } from "@magiceden-oss/runestone-lib/dist/src/utils";
import { RuneId } from "@magiceden-oss/runestone-lib/dist/src/runeid";
import { script } from "@magiceden-oss/runestone-lib/dist/src/script";
import { Message } from "@magiceden-oss/runestone-lib/dist/src/message";
import { Artifact } from "@magiceden-oss/runestone-lib/dist/src/artifact";
import { Flaw } from "@magiceden-oss/runestone-lib/dist/src/flaw";
import { Cenotaph } from "@magiceden-oss/runestone-lib/dist/src/cenotaph";
import { RuneEtchingSpec } from "@magiceden-oss/runestone-lib/dist/src/indexer";
import { SpacedRune } from "@magiceden-oss/runestone-lib/dist/src/spacedrune";
import { Terms } from "@magiceden-oss/runestone-lib/dist/src/terms";
import { ProtoStone } from "./protostone";

export const MAX_SPACERS = 0b00000111_11111111_11111111_11111111;

export type RunestoneTx = { vout: { scriptPubKey: { hex: string } }[] };

type Payload = Buffer | Flaw;

export function isValidPayload(payload: Payload): payload is Buffer {
  return Buffer.isBuffer(payload);
}

const MAX_LEB128_BYTES_IN_U128 = 18;

// this is the max number for a 2 byte LEB encoded number
const PROTOSTONE_TAG = 2 ** 14 - 1;

export function encodeProtostone(values: u128[]): Buffer {
  return Buffer.concat(
    values
      .map((value) => [
        u128.encodeVarInt(u128(PROTOSTONE_TAG)),
        u128.encodeVarInt(value),
      ])
      .flat(),
  );
}
export type RunestoneProtostoneSpec = {
  mint?: {
    block: bigint;
    tx: number;
  };
  pointer?: number;
  etching?: RuneEtchingSpec;
  edicts?: {
    id: {
      block: bigint;
      tx: number;
    };
    amount: bigint;
    output: number;
  }[];
  protostones?: ProtoStone[];
};

export class RunestoneProtostoneUpgrade {
  constructor(
    readonly mint: Option<RuneId>,
    readonly pointer: Option<u32>,
    readonly edicts: Edict[],
    readonly etching: Option<Etching>,
    /* BEGIN CODE CHANGE */
    readonly protostones: ProtoStone[],
    /* CODE CHANGE END */
  ) {}

  // removed decipher function -- can add it back if needed

  encipher(): Buffer {
    const payloads: Buffer[] = [];

    if (this.etching.isSome()) {
      const etching = this.etching.unwrap();
      let flags = u128(0);
      flags = Flag.set(flags, Flag.ETCHING);

      if (etching.terms.isSome()) {
        flags = Flag.set(flags, Flag.TERMS);
      }

      if (etching.turbo) {
        flags = Flag.set(flags, Flag.TURBO);
      }

      payloads.push(Tag.encode(Tag.FLAGS, [flags]));

      payloads.push(
        Tag.encodeOptionInt(
          Tag.RUNE,
          etching.rune.map((rune) => rune.value),
        ),
      );
      payloads.push(
        Tag.encodeOptionInt(Tag.DIVISIBILITY, etching.divisibility.map(u128)),
      );
      payloads.push(
        Tag.encodeOptionInt(Tag.SPACERS, etching.spacers.map(u128)),
      );
      payloads.push(
        Tag.encodeOptionInt(
          Tag.SYMBOL,
          etching.symbol.map((symbol) => u128(symbol.codePointAt(0)!)),
        ),
      );
      payloads.push(Tag.encodeOptionInt(Tag.PREMINE, etching.premine));

      if (etching.terms.isSome()) {
        const terms = etching.terms.unwrap();

        payloads.push(Tag.encodeOptionInt(Tag.AMOUNT, terms.amount));
        payloads.push(Tag.encodeOptionInt(Tag.CAP, terms.cap));
        payloads.push(Tag.encodeOptionInt(Tag.HEIGHT_START, terms.height[0]));
        payloads.push(Tag.encodeOptionInt(Tag.HEIGHT_END, terms.height[1]));
        payloads.push(Tag.encodeOptionInt(Tag.OFFSET_START, terms.offset[0]));
        payloads.push(Tag.encodeOptionInt(Tag.OFFSET_END, terms.offset[1]));
      }
    }

    if (this.mint.isSome()) {
      const claim = this.mint.unwrap();
      payloads.push(Tag.encode(Tag.MINT, [claim.block, claim.tx].map(u128)));
    }

    payloads.push(Tag.encodeOptionInt(Tag.POINTER, this.pointer.map(u128)));

    if (this.edicts.length) {
      payloads.push(u128.encodeVarInt(u128(Tag.BODY)));

      const edicts = [...this.edicts].sort((x, y) =>
        Number(x.id.block - y.id.block || x.id.tx - y.id.tx),
      );

      let previous = new RuneId(u64(0), u32(0));
      for (const edict of edicts) {
        const [block, tx] = previous.delta(edict.id).unwrap();

        payloads.push(u128.encodeVarInt(block));
        payloads.push(u128.encodeVarInt(tx));
        payloads.push(u128.encodeVarInt(edict.amount));
        payloads.push(u128.encodeVarInt(u128(edict.output)));
        previous = edict.id;
      }
    }

    /* BEGIN CODE CHANGE */
    if (this.protostones.length) {
      // TODO: ORDERING?
      // TODO: encode 13 in front of everything
      this.protostones.forEach((protostone: ProtoStone) => {
        const protostone_payload = protostone.encipher_payloads();
        const u128s = [];
        for (
          let i = 0;
          i < protostone_payload.length;
          i += MAX_LEB128_BYTES_IN_U128
        ) {
          const end = Math.min(
            protostone_payload.length,
            i + MAX_LEB128_BYTES_IN_U128,
          );
          const seekbuffer = new SeekBuffer(
            protostone_payload.subarray(i, end),
          );
          u128s.push(u128.tryDecodeVarInt(seekbuffer));
        }
        payloads.push(encodeProtostone(u128s));
      });
    }
    /* CODE CHANGE END */

    const stack: (Buffer | number)[] = [];
    stack.push(OP_RETURN);
    stack.push(MAGIC_NUMBER);

    const payload = Buffer.concat(payloads);
    let i = 0;
    for (let i = 0; i < payload.length; i += MAX_SCRIPT_ELEMENT_SIZE) {
      stack.push(payload.subarray(i, i + MAX_SCRIPT_ELEMENT_SIZE));
    }

    return script.compile(stack);
  }

  // payloads function removed -- searches tx for payloads

  // integers removed -- takes a payload buffer and returns all LEB128s
}

// Helper functions to ensure numbers fit the desired type correctly
const u8Strict = (n: number) => {
  const bigN = BigInt(n);
  if (bigN < 0n || bigN > u8.MAX) {
    throw Error("u8 overflow");
  }
  return u8(bigN);
};
const u32Strict = (n: number) => {
  const bigN = BigInt(n);
  if (bigN < 0n || bigN > u32.MAX) {
    throw Error("u32 overflow");
  }
  return u32(bigN);
};
const u64Strict = (n: bigint) => {
  const bigN = BigInt(n);
  if (bigN < 0n || bigN > u64.MAX) {
    throw Error("u64 overflow");
  }
  return u64(bigN);
};
const u128Strict = (n: bigint) => {
  const bigN = BigInt(n);
  if (bigN < 0n || bigN > u128.MAX) {
    throw Error("u128 overflow");
  }
  return u128(bigN);
};

/**
 * Low level function to allow for encoding runestones without any indexer and transaction checks.
 *
 * @param runestone runestone spec to encode as runestone
 * @returns encoded runestone bytes
 * @throws Error if encoding is detected to be considered a cenotaph
 */
export function encodeRunestoneProtostone(runestone: RunestoneProtostoneSpec): {
  encodedRunestone: Buffer;
  etchingCommitment?: Buffer;
} {
  const mint = runestone.mint
    ? Some(
        new RuneId(
          u64Strict(runestone.mint.block),
          u32Strict(runestone.mint.tx),
        ),
      )
    : None;

  const pointer =
    runestone.pointer !== undefined
      ? Some(runestone.pointer).map(u32Strict)
      : None;

  const edicts = (runestone.edicts ?? []).map((edict) => ({
    id: new RuneId(u64Strict(edict.id.block), u32Strict(edict.id.tx)),
    amount: u128Strict(edict.amount),
    output: u32Strict(edict.output),
  }));

  const protostones = runestone.protostones ?? [];

  let etching: Option<Etching> = None;
  let etchingCommitment: Buffer | undefined = undefined;
  if (runestone.etching) {
    const etchingSpec = runestone.etching;

    const spacedRune = etchingSpec.runeName
      ? SpacedRune.fromString(etchingSpec.runeName)
      : undefined;
    const rune = spacedRune?.rune !== undefined ? Some(spacedRune.rune) : None;

    if (
      etchingSpec.symbol &&
      !(
        etchingSpec.symbol.length === 1 ||
        (etchingSpec.symbol.length === 2 &&
          etchingSpec.symbol.codePointAt(0)! >= 0x10000)
      )
    ) {
      throw Error("Symbol must be one code point");
    }

    const divisibility =
      etchingSpec.divisibility !== undefined
        ? Some(etchingSpec.divisibility).map(u8Strict)
        : None;
    const premine =
      etchingSpec.premine !== undefined
        ? Some(etchingSpec.premine).map(u128Strict)
        : None;
    const spacers =
      spacedRune?.spacers !== undefined && spacedRune.spacers !== 0
        ? Some(u32Strict(spacedRune.spacers))
        : None;
    const symbol = etchingSpec.symbol ? Some(etchingSpec.symbol) : None;

    if (divisibility.isSome() && divisibility.unwrap() > MAX_DIVISIBILITY) {
      throw Error(
        `Divisibility is greater than protocol max ${MAX_DIVISIBILITY}`,
      );
    }

    let terms: Option<Terms> = None;
    if (etchingSpec.terms) {
      const termsSpec = etchingSpec.terms;

      const amount =
        termsSpec.amount !== undefined
          ? Some(termsSpec.amount).map(u128Strict)
          : None;
      const cap =
        termsSpec.cap !== undefined
          ? Some(termsSpec.cap).map(u128Strict)
          : None;
      const height: [Option<u64>, Option<u64>] = termsSpec.height
        ? [
            termsSpec.height.start !== undefined
              ? Some(termsSpec.height.start).map(u64Strict)
              : None,
            termsSpec.height.end !== undefined
              ? Some(termsSpec.height.end).map(u64Strict)
              : None,
          ]
        : [None, None];
      const offset: [Option<u64>, Option<u64>] = termsSpec.offset
        ? [
            termsSpec.offset.start !== undefined
              ? Some(termsSpec.offset.start).map(u64Strict)
              : None,
            termsSpec.offset.end !== undefined
              ? Some(termsSpec.offset.end).map(u64Strict)
              : None,
          ]
        : [None, None];

      if (
        amount.isSome() &&
        cap.isSome() &&
        amount.unwrap() * cap.unwrap() > u128.MAX
      ) {
        throw Error("Terms overflow with amount times cap");
      }

      terms = Some({ amount, cap, height, offset });
    }

    const turbo = etchingSpec.turbo ?? false;

    etching = Some(
      new Etching(divisibility, rune, spacers, symbol, terms, premine, turbo),
    );
    etchingCommitment = rune.isSome() ? rune.unwrap().commitment : undefined;
  }

  return {
    encodedRunestone: new RunestoneProtostoneUpgrade(
      mint,
      pointer,
      edicts,
      etching,
      protostones,
    ).encipher(),
    etchingCommitment,
  };
}
