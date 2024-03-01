# metashrew-as

The indexer standard library. Sources in this repository can be imported into indexer programs built with metashrew, and may have some utilty in other contexts.

## Install

This library will be included by default in projects scaffolded with metashrew-cli, guides for which are available here:

[https://github.com/sandshrewmetaprotocols/metashrew-cli](https://github.com/sandshrewmetaprotocols/metashrew-cli))

For projects not scaffolded with metashrew-cli, it is trivial to install this library with yarn as one would for a typical JavaScript-based dependency.

```sh
yarn add https://github.com/sandshrewmetaprotocols/metashrew-as
```

## Usage

### Core indexer utilities

The following functions should be used as-is within a metashrew indexer to ensure correct functionality of the indexing process within metashrew, given the constraints of the runtime that the WASM will execute within.

#### get(key: ArrayBuffer): ArrayBuffer

Gets a value from the index by its key. Multiple calls to the same key are cached, and calling the `set` function will update the cache as well, so it is acceptable to write programs that `set` then later `get` the value at the same key within the program run for the block.

```js
import { get } from "metashrew-as/assembly/indexer"

const KEY = String.UTF8.encode("/mykey");

export function lookup(): ArrayBuffer {
  return get(KEY);
}
```

#### set(key: ArrayBuffer, value: ArrayBuffer): void

Caches a value to be flushed to the write batch at the end of the program run. Even though no state changes are saved until the end of the program run, a call to `get` at any key will query the cache to lookup the value before it makes a call to the k/v store in the host environment.

```js
import { set, get, _flush } from "metashrew-as/assembly/indexer";

const KEY = String.UTF8.encode("/mykey");

export function setvalue(): void {
  set(KEY, String.UTF8.encode("hello");
}

export function lookup(): ArrayBuffer {
  return get(KEY);
}

export function _start(): void {
  setvalue();
  _flush();
}

// can call the metashrew-view JSONRPC with the "lookup" symbol to retrive the value, 
```

#### input(): ArrayBuffer

Reads the bytevector from the host environment containing a u32 value for the block height, followed by the bytes of the serialized block.


#### _flush(): void

It is required to call this function, only once, at the end of your `_start` function. Otherwise, no state changes will be saved to the index. Always put as the last line of your `_start` function.

```js

import { get, set, _flush, input } from "metashrew-as/assembly/indexer";
import { Box } from "metashrew-as/assembly/utils/box";
import { parsePrimitive } from "metashrew-as/assembly/utils/utils";

export function _start(): void {
  const data = input();
  const box = Box.from(data);
  const height = parsePrimitive<u32>(box);
  set(Box.concat([ Box.from(String.UTF8.encode("/block/")), Box.from(String.UTF8.encode(height.toString(10))); ]), box.toArrayBuffer());
  _flush();
  // trivial index sets UTF8 /block/n to the serialized block bytes, where n is 0..tip as
}
```

#### Index.keyFor(k: ArrayBuffer, k: ArrayBuffer)

Syntatic sugar over the concatenation of two ArrayBuffer byte vectors. Intended to be used as follows.

```js

import { Index } from "metashrew-as/assembly/indexer";

export const SAMPLE_LIST = String.UTF8.encode("/mylist/");

export function getListLengthKey(): ArrayBuffer {
  return Index.keyFor(SAMPLE_LIST, String.UTF8.encode("length")); // UTF8 byte vector of /mylist/length
}

```


#### console.log

```js
import { console } from "metashrew-as/assembly/utils/logging";

export function _start(): void {
  console.log("visible from tests or metashrew itself");
  console.logUTF8(String.UTF8.encode("sometimes we have UTF8 too and we can avoid decoding it needlessly"));
}
```


TODO: cover all libs


## Author

Sandshrew Inc


## License

MIT
