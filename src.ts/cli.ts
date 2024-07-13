import yargs from "yargs";
import { encodeProtoburn } from "./protoburn";
import { DEFAULT as DEFAULT_KEYPAIR } from "./utils/wallet";
import * as bitcoin from "bitcoinjs-lib";

function getAddress(node: any, network?: any): string {
  return bitcoin.payments.p2pkh({ pubkey: node.publicKey, network }).address!;
}

yargs
  .scriptName("protorune")
  .usage("$0 <cmd> [args]")
  .command(
    "gen-protoburn [protocol_id] [runeid] [amount]",
    "generate protoburn tx",
    (yargs) => {
      yargs.positional("protocol_id", {
        type: "string",
        describe: "subprotocol id for the protorune",
      });
      yargs.positional("runeid", {
        type: "string",
        describe: "has to be of the format `height:txindex`",
      });
      yargs.positional("amount", {
        type: "string",
        describe: "amount of protorunes to be burned",
      });
    },
    function (argv) {
      const protocol_id = argv.protocol_id as string;
      const runeid = argv.runeid as string;
      const amount = argv.amount as string;

      const address = getAddress(DEFAULT_KEYPAIR, bitcoin.networks.bitcoin);
      const protoburn = encodeProtoburn(
        [
          {
            amount: BigInt(amount),
            id: runeid.split(":").reduce(
              ({ block }, d) => ({
                block: block == BigInt(0) ? BigInt(d) : block,
                tx: block > BigInt(0) ? parseInt(d) : 0,
              }),
              { block: BigInt(0), tx: 0 } as { block: bigint; tx: number },
            ),
          },
        ],
        BigInt(protocol_id),
        address,
      );
    },
  );
