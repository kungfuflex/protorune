import yargs from "yargs";
import { encodeProtoburn } from "./protoburn";

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

      //TODO: write this out
      //@ts-ignore
      const protoburn = encodeProtoburn(
        [{ amount: BigInt(amount), id: runeid }],
        burn,
        address,
      );
    },
  );
