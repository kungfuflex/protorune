# protorune

![Tests](https://img.shields.io/github/actions/workflow/status/AssemblyScript/assemblyscript/test.yml?branch=main&label=test&logo=github)
![Publish](https://img.shields.io/github/actions/workflow/status/AssemblyScript/assemblyscript/publish.yml?branch=main&label=publish&logo=github)
[![npm version](https://img.shields.io/npm/v/assemblyscript.svg?color=007acc&logo=npm)](https://www.npmjs.com/package/protorune)

AssemblyScript boilerplate for architecting protorunes-compatible subprotocols. 

**The protorunes specification is hosted at** 👉🏻👉🏼👉🏽👉🏾👉🏿 [https://github.com/kungfuflex/protorune/wiki](https://github.com/kungfuflex/protorune/wiki)

## IF YOU HAVE DISCOVERED THIS REPOSITORY, READ THIS NEXT LINE

NO protoburn shall be honored prior to the first on-chain protoburn of QUORUM•GENESIS•PROTORUNE.

The first protoburn of QUORUM•GENESIS•PROTORUNE signifies maturity of the protorune specification, as defined in this document.

[https://github.com/kungfuflex/quorumgenesisprotorune](https://github.com/kungfuflex/quorumgenesisprotorune)

***UPDATE (07/23/2024):*** The genesis protorune has been mined and can be referenced at [https://mempool.space/tx/eb2fa5fad4a7f054c6c039ff934c7a6a8d18313ddb9b8c9ed1e0bc01d3dc9572](https://mempool.space/tx/eb2fa5fad4a7f054c6c039ff934c7a6a8d18313ddb9b8c9ed1e0bc01d3dc9572)

#### NOTE: protorune does not have a token

The genesis protorune is strictly a reference implementation and not a financial instrument, nor is it meant for sale. The subprotocol can be included in a protocol for out-of-the-box governance utility on a subprotocol for a project token. The genesis subprotocol naturally is simply intended as an open forum for the protorune standard.


## Usage

This repository is meant to be forked.

```sh
git clone https://github.com/yourorganization/yourprotorunefork
cd yourprotorunefork
yarn
```

The indexer WASM file is generated with a build step:

```sh
cd yourprotorunefork
yarn build
```

This produces yourprotorunefork/build/debug.wasm and yourprotorunefork/build/release.wasm

Build metashrew:
```sh
git clone https://github.com/sandshrewmetaprotocols/metashrew
cd metashrew
cargo build --release
```

Run the indexer with metashrew:
```sh
./metashrew/target/release/metashrew --log-filters DEBUG --indexer yourprotorunefork/build/debug.wasm --db-dir ~/.metashrew --daemon-dir ~/.bitcoin/bitcoin --network bitcoin
```

## Implementing the Subprotocol

At the top level of `assembly/index.ts` the entrypoint to the program `_start` must call the indexer then `_flush()` the k/v pairs for the block. In production, this WASM function is called for every block.

The Protorune class is generic and accepts a class argument where you can supply a subclass of `MessageContext`. In your subclass, you define the `MessageContext#handle()` function which does the work of handling `this.runes` which contains a set of `IncomingRune` objects.

Refer to [https://github.com/kungfuflex/protorune/tree/master/assembly/indexer/protomessage/MessageContext.ts](https://github.com/kungfuflex/protorune/tree/master/assembly/indexer/protomessage/MessageContext.ts) to see the API to this object.

Every protomessage evaluated in a Protostone that is called is passed a context to `MessageContext#handle()` and executed. The default behavior of the MessageContext is to refund all runes to the `refund_pointer` which are not used by the runtime.

Other protomessage / protoburn semantics are handled transparently by the indexer runtime.

### Example

```ts
import { MessageContext } from "protorune/assembly/indexer/protomessage/MessageContext";
import { Protorune } from "protorune/assembly/indexer";
import { Index as SpendablesIndex } from "metashrew-spendables/assembly/indexer";
class MyMessageContext extends MessageContext {
  handle(): bool {
    const runes: Array<IncomingRune> = this.runes;
    runes.forEach((v: IncomingRune) => {
      v.depositAll(); /* this indexer just swallows your runes */
    });
    return true;
  }
  protocolTag(): u128 {
    return u128.from(0x22222222); /* this subprotocol has ID 0x22222222 */
  }
}

class MyProtorune extends Protorune<MyMessageContext> {}

const GENESIS = 850000;

export function _start(): void {
  const data = input();
  const box = Box.from(data);
  const block = new Block(box);
  if (height < GENESIS) {
    _flush();
    return;
  }
  SpendablesIndex.indexBlock(height, block);
  new MyProtorune().indexBlock(height, block);
  _flush();
}
```


## Testing

Modify test suite in tests/release.spec.ts to mock blocks.

Run the command:

```sh
cd yourprotorunefork
yarn test
```

## License

MIT
