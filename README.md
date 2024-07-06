# protorunes

[![Tests](https://img.shields.io/github/actions/workflow/status/AssemblyScript/assemblyscript/test.yml?branch=main&label=test&logo=github)
[![Publish](https://img.shields.io/github/actions/workflow/status/AssemblyScript/assemblyscript/publish.yml?branch=main&label=publish&logo=github)
[![npm version](https://img.shields.io/npm/v/assemblyscript.svg?color=007acc&logo=npm)](https://www.npmjs.com/package/protorune)
[![Downloads](https://img.shields.io/npm/dm/typescript.svg)](https://www.npmjs.com/package/protorune)

AssemblyScript boilerplate for architecting protorunes-compatible subprotocols. 

**The protorunes specification is hosted at**:

[https://github.com/kungfuflex/protorune/wiki](https://github.com/kungfuflex/protorune/wiki)

## IF YOU HAVE DISCOVERED THIS REPOSITORY, READ THIS NEXT LINE

NO protoburn shall be honored prior to the first on-chain protoburn of QUORUM•GENESIS•PROTORUNE.

The first protoburn of QUORUM•GENESIS•PROTORUNE signifies maturity of the protorune specification, as defined in this document.

[https://github.com/kungfuflex/quorumgenesisprotorune](https://github.com/kungfuflex/quorumgenesisprotorune)

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

## Testing

Modify test suite in tests/release.spec.ts to mock blocks.

Run the command:

```sh
cd yourprotorunefork
yarn test
```

## License

MIT
