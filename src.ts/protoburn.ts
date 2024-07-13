import { ProtoStone } from "./protostone";
import { encodeRunestone } from "@magiceden-oss/runestone-lib";
import { buildRunesTransaction } from "./utils/transaction";

export async function encodeProtoburn(
  runes: {
    id: { block: bigint; tx: number };
    amount: bigint;
  }[],
  protocolTag: bigint,
  address: string,
  output: any,
) {
  const runestone = encodeRunestone({
    edicts: runes.map((r) => ({ ...r, output: 1 })),
    pointer: 2,
  }).encodedRunestone;
  const protoburn = ProtoStone.burn({ protocolTag, pointer: 2 }).encipher();

  const outs = [
    {
      script: runestone,
      value: 0,
    },
    {
      script: protoburn,
      value: 0,
    },
    {
      address,
      //@TODO: change so that it correctly gets the value to be sent
      value: 1,
    },
  ];

  return buildRunesTransaction(outs, address, output);
}
