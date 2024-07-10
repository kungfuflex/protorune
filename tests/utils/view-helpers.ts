//@ts-ignore
import bitcoinjs = require("bitcoinjs-lib");
import { encodeRunestone } from "@magiceden-oss/runestone-lib";
import { IndexerProgram, readArrayBufferAsHex } from "metashrew-test";
import { ProtorunesRpc } from "../../src.ts/rpc";

export const protorunesbyaddress = async (
  program: IndexerProgram,
  address: string,
  protocolTag: bigint,
): Promise<any> => {
  const cloned = program; // just mutate it
  const result = await ProtorunesRpc.prototype.protorunesbyaddress.call(
    {
      async _call({ input }) {
        cloned.setBlock(input);
        const ptr = await cloned.run("protorunesbyaddress");
        return readArrayBufferAsHex(cloned.memory, ptr);
      },
    },
    { address, protocolTag },
  );
  return result;
};
