# Protorunes HAS a Specification

## IF YOU HAVE DISCOVERED THIS DOCUMENT, READ THIS NEXT LINE

NO protoburn shall be honored prior to the first on-chain protoburn of QUORUM•GENESIS•PROTORUNE.

The first protoburn of QUORUM•GENESIS•PROTORUNE signifies maturity of the protorune specification, as defined in this document.

[https://github.com/sandshrewmetaprotocols/quorumgenesisprotorune](https://github.com/sandshrewmetaprotocols/quorumgenesisprotorune)

#### NOTE: protorune does not have a token

The genesis protorune is strictly a reference implementation and not a financial instrument, nor is it meant for sale. The subprotocol can be included in a protocol for out-of-the-box governance utility on a subprotocol for a project token. The genesis subprotocol naturally is simply intended as an open forum for the protorune standard.

## Abstract

We present a protocol extension compatible with runes which permits the use of arbitrary indexers to define subprotocols pegged to runes assets on Bitcoin.

## Definitions

- `protoburn` is a mechanism by which runes are burned and a wrapped representation of the assets are minted onto a UTXO
- `protorunes` are runes that have been protoburned and no longer are recognized as spendable by the canonical runes indexer, only a protorunes compatible indexer, which is programmed to recognize the protocol tag packed in the protoburn message on the unspendable OP_RETURN UTXO which the runes are spent to
- A `subprotocol` is a metaprotocol that is compatible with protorunes and MUST handle all of the logic within runes related to transfers. Etchings SHOULD NOT be handled on a subprotocol tag, unless there is care taken to prevent clashes with the RuneId and naming schema. A subprotocol for a given protocol tag MUST implement the runes specification to index the runes protocol, but also MUST implement the handling of a protoburn message for any protoburn message that includes the protocol tag for the subprotocol. Protorunes MUST implement the same indexing as runes for transfers for the protocol tag they honor. All runes MUST be able to be burned to a subprotocol in accordance with the protoburn definition.
- A `protomessage` is an OP_RETURN output which can be the target of one or more edicts. A protomessage output MUST delegate outputs of all edicts which point to it to the spendable UTXO it points to, OR the subprotocol constraints MAY refund assets to the UTXO pointed to by the protomessage refund_pointer. Protorunes MUST end up on the UTXO pointed to by the protomessage pointer OR the protomessage refund_pointer. The sum of runes which exist on a subprotocol SHOULD NOT exceed the sum of runes bridged into a subprotocol. Subprotocols MAY define their own scheme for assets which exist and are minted/burned/transacted against by the protocol runtime.
- A `predicate` is a set of clauses that define the minimum balance sheet of protorunes which MUST exist on the output a protomessage points to. If the predicate is not satisfied, a protomessage MUST have no side effect. The balance sheet of protorunes MUST, in this case, be considered as transferred to the output defined by the refund_pointer.


## Protocol messages

The following messages are parsed in the same manner as a Runestone payload, where key/value pairs are parsed in pairs of leb128 encoded u128 integers, and when pairs occur with the same key, the value is appended to the value for that key. Protocol message tags use unique values with respect to the Runestone specification, but since they are appended to a unique protocol tag, we do not have to be worry that we are creating cenotaphs.


```rs
enum ProtoTag {
  Message = 81,
  Burn = 83,
  Split = 85,
  Pointer = 91,
  Refund = 93,
  Cenotaph = 126,
  Nop = 127
}

struct Protostone {
  pointer: Option<u32>,
  refund_pointer: Option<u32>,
  split: Option<Vec<u32>>,
  burn: Option<Vec<u8>>,
  message: Option<Vec<u8>>
}
```

## Indexer

The protorunes design is such that a minimal indexer for a protorune subprotocol should only need to index the runes protocol as well as itself. Runes are always able to be burned onto a subprotocol and remain bound to the runes design, as it relates to supply and transfer.

### protoburn

A protoburn is used to burn runes onto a subprotocol, and is generally a one-way function. A subprotocol MAY allow a protoburn from a sibling subprotocol, if it decides that the indexer for the given subprotocol is sound and is willing to honor incoming assets. Alternatively, protorunes on different subprotocols or runes itself can be exchanged via the usual protocol features of runes and Bitcoin itself.

A protoburn message is an OP_RETURN output where all data pushes are concatenated to a single byte string. The first bytes MUST be 0x6a6a to be considered a protoburn message, followed by a Protostone encoding of the protocol tag for the subprotocol targeted, with any zero bytes removed.

The protocol tag within the protoburn message SHOULD be unique for the subprotocol, and serve as a replacement for the tag 0x6a5d when parsing a RunestoneMessage for protorunes transfers. A protocol_tag MUST NOT include a 0x00 byte.

The pointer within the Protostone MUST contain the index of a spendable UTXO within the transaction outputs. For a protoburn, this will be where protorunes end up.

All edicts in a Runestone that are burned into the Protostone burn output are delegated to the pointer in the Protostone, which MAY be a spendable UTXO OR an OP_RETURN containing another Protostone with the subprotocol tag or a Runestone with the subprotocol tag.

### protomessage

A protomessage is a protocol message that an indexer MUST interpret as an action on the subprotocol. It is an OP_RETURN output where all data pushes are concatenated to a single byte string, the same for any Protostone. The first bytes of a protomessage contain 0x6a6b, followed by the protocol_tag for the subprotocol, followed by the 0x00 byte. Subsequent bytes MUST be a Protostone data structure.

A protomessage contains an input byte string concatenated together from the Message field, which SHOULD be then parsed with protobuf (or any appropriate serializer), and interpreted as an argument to the runtime of the subprotocol. Protorunes MUST be output to the locations pointed to by the `pointer` tag in Protostone or the inputs refunded to the `refund_pointer` if the runtime decides it should not execute against its input of runes and calldata.

Protorunes which target the Protostone that are unused by the runtime MUST be returned to the refund_pointer.

The pointers are named for simplicitly in terms of their intended function, but ultimately they provide a mechanism for a branch in execution outputs which can, in turn, target another Protostone. In this way the scheme can support an unlimited amount of protorunes recipients in a given transaction script.

### protosplit

For instances where an OP_RETURN output buffer is not large enough to fit an entire protomessage, the protosplit structure is defined. The u32 values in the split field of the Protostone represent the vout index for each of a list of outputs, which MUST each either be an OP_RETURN output beginning with a 0x6a6d data push, or another protosplit output. The data pushes following the first 0x6a6d data push of each output are concatenated together to form a single bytestring, and the entire list of concatenated bytes are appended to the message field of the Protostone being evaluated, in the order that chunks are evaluated.

### Ordering

A protorunes compatible indexer MUST process a maximum of one RunestoneMessage, in the order they appear. Edicts that result in a transfer to a protoburn output execute atomically with the processing of the edict. All other execution is handled in layers, where outputs are processed in the order that they are marked by an edict, protoburn, or protomessage.

In this way, processing occurs in layers, where batches of protorunes are allowed to collect on a given output before the next phase of execution begins. An AMM, for example, may handle a pair of runes that are received directly from the runes protocol, atomically. In this case, it is necessary we would allow edicts to target a protoburn to the subprotocol, and the protoburn pointer target a protomessage. This way, the protomessage can be designed to expect the pair of protorunes as an input and respond by issuing protorunes representing LP to the protomessage pointer, and then any component which should be refunded to the refund pointer. Protomessage outputs are always processed in the order they are targeted by an output as each processing phase is executed.

Layered execution of protomessages also ensures our compute model can support the prohibition of recursion with a simple mechanism: a protomessage can only be executed once. If a protomessage pointer points to a protomessage which would be evaluated more than once, it is not executed, and instead inputs to the protomessage are sent to the refund_pointer. It is permitted for a refund_pointer to point to a protomessage, but if that protomessage has already been executed, execution simply halts instead, and all funds thus become unspendable. Do not use recursion unless you know what you are doing!

## License

MIT
