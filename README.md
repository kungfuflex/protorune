# Protorunes HAS a Specification

## IF YOU HAVE DISCOVERED THIS DOCUMENT, READ THIS NEXT LINE

NO protoburn shall be honored prior to the first on-chain protoburn of QUORUM•GENESIS•PROTORUNE.

The first protoburn of QUORUM•GENESIS•PROTORUNE signifies maturity of the protorune specification, as defined in this document.

[https://github.com/sandshrewmetaprotocols/quorumgenesisprotorune](https://github.com/sandshrewmetaprotocols/quorumgenesisprotorune)

#### NOTE: protorune does not have a token

The genesis protorune is strictly a reference implementation and not a financial instrument, nor is it meant for sale. The subprotocol can be included in a protocol for out-of-the-box governance utility on a subprotocol for a project token. The genesis subprotocol naturally is simply intended as an open forum for the protorune standard.

## Abstract

We present a protocol extension compatible with runes which permits the use of arbitrary indexers to define subprotocols. We define a mechanism by which runes can be burned on the runes metaprotocol and delegated to a UTXO on which the indexer for the targeted subprotocol honors their existence.

## Definitions

- `protoburn` is a mechanism by which runes are burned and a wrapped representation of the assets are minted onto a UTXO, referenced by the same RuneId as the source runes. A protoburn is an OP_RETURN output with the protoburn tag prefixed to a Protostone encoding the pointer and protocol tag for the subprotocol. A protoburn is targeted by a Runestone pointer or edict on the runes protocol, and runes sent to the protoburn are delegated to the output it points to.
- `protorunes` are runes that have been protoburned and no longer are recognized as spendable by the canonical runes indexer, only a protorunes compatible indexer, which MUST recognize its own protocol tag if it appears in the Burn field of a Protostone with the protoburn tag, and process it accordingly within the balance sheets it indexes.
- A `subprotocol` is a metaprotocol that runs the indexer program for its parent protocol.
- A `protorunes-compatible subprotocol` is a subprotocol of runes, which therefore MUST as a dependency run the runes indexing logic. Additionally, if a subprotocol is protorunes-compatible then it MUST correctly interpret and process the data structures described in this document, which includes the processing of Runestone and any edicts it contains, for both the protocol tag of runes and also the protocol tag of the subprotocol implementing protorunes, in the order those Runestone messages appear in a transaction.
- A `protomessage` is an OP_RETURN output which can be the target of one or more edicts, or the target of a protoburn. A protomessage output MUST delegate outputs of all edicts which point to it to the spendable UTXO it points to, OR the subprotocol constraints MUST refund assets to the UTXO pointed to by the protomessage refund_pointer. Protorunes MUST end up on the UTXO pointed to by the protomessage pointer OR the protomessage refund_pointer. The sum of runes which exist on a subprotocol SHOULD NOT exceed the sum of runes bridged into a subprotocol. Subprotocols MAY define their own scheme for assets which exist and are minted/burned/transacted against by the protocol runtime, provided the encoding of their RuneId can still be parsed as two u128 values, but at least one bit must be set in the high 64 bits of the u128 encoding what is traditionally the height of the block for a given etching, OR one bit is set in the high 96 bits of what is traditionally the txindex of the transaction for a given etching. This permits us to define a space of custom assets exclusive to the subprotocol which are still compatible and can be transacted with using the Runestone structure, while at the same time ensuring that we cannot clash with the space of RuneIds on the runes protocol.
- A `predicate` is a set of clauses that define the minimum balance sheet of protorunes which MUST exist on the output a protomessage points to. If the predicate is not satisfied, a protomessage MUST have no side effect. The balance sheet of protorunes MUST, in this case, be ransferred to the output defined by the refund_pointer. A standard predicate structure does not occur in the data structures used in protorunes, since it is not needed in every subprotocol and may need to be modeled in different ways in different contexts, but this vocabulary is provided to model a concept which SHOULD be a feature of protorune runtime messages for which there is settlement risk. A predicate mechanism SHOULD be available to the user in any instance where a reorg of the Bitcoin blockchain could change the balance sheet held by an input being used in a way that is significant to transactions which follow it. In cases where this occurs, we ensure that all value being used as inputs to a protomessage are safely returned to the `refund_pointer`.

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

### protoburn

A protoburn is used to burn runes onto a subprotocol, and is generally a one-way function. A subprotocol MAY allow a protoburn from a sibling subprotocol, if it decides that the indexer for the given subprotocol is sound and is willing to honor incoming assets. Alternatively, protorunes on different subprotocols or runes itself can be exchanged via the usual protocol features of runes and Bitcoin itself.

A protoburn message is an OP_RETURN output where all data pushes are concatenated to a single byte string. The first bytes MUST be 0x6a6a to be considered a protoburn message, followed by a Protostone encoding of the protocol tag for the subprotocol targeted, with any zero bytes removed.

The protocol tag within the protoburn message SHOULD be unique for the subprotocol, and serve as a replacement for the tag 0x6a5d when parsing a RunestoneMessage for protorunes transfers. A protocol tag MUST NOT include a 0x00 byte.

The pointer within the Protostone MUST contain the index of a spendable UTXO within the transaction outputs. For a protoburn, this will be where protorunes end up. The Message field and Refund field of a Protostone encoding a protoburn are ignored, but it is possible for the `pointer` to target a protomessage, for atomic execution against the subprotocol.

All edicts in a Runestone that target a protoburn are delegated to the pointer in the Protostone, which MAY be a spendable UTXO or another Protostone encoding a protomessage for that subprotocol.

### protomessage

A protomessage is a protocol message that an indexer MUST interpret as an action on the subprotocol. It is an OP_RETURN output where all data pushes are concatenated to a single byte string, the same for any Protostone. The first bytes of a protomessage contain 0x6a6b, followed by the protocol_tag for the subprotocol, followed by the 0x00 byte. Subsequent bytes MUST be a Protostone data structure.

A protomessage contains an input byte string concatenated together from the Message field, which SHOULD be then parsed with protobuf or any serializer expected by the subprotocol, then interpreted as an argument to the runtime of the subprotocol. Protorunes MUST be output to the locations pointed to by the `pointer` tag in Protostone or the inputs refunded to the `refund_pointer` if the runtime decides it should not execute against its input of runes and calldata.

Protorunes which target the Protostone that are unused by the runtime MUST be returned to the refund_pointer.

The pointers are named for simplicitly in terms of their intended function, but ultimately they provide a mechanism for a branch in execution outputs which can, in turn, target another Protostone. In this way the scheme can support an unlimited amount of protorunes recipients in a given transaction script.

Generally, the refund_pointer SHOULD be expected to be spendable by the entity which signed the transaction inputs, in the same way a change output is typically used on Bitcoin. A refund_pointer MAY point to another Protostone, but the tree of execution SHOULD be expected to have terminal refund_pointers which are UTXOs spendable by the entity which signed the transaction inputs.

Recursion of protomessages within a transaction is not permitted by the protorunes design. See the section on ordering for details.

### protosplit

For instances where an OP_RETURN output buffer is not large enough to fit an entire protomessage, the protosplit structure is defined. The u128 values in the Split field of a Protostone are interpreted as single u32	values which each represent the vout for the output in the transaction which are evaluated for additional bytes to concatenate to the Protostone message bytearray. Each output referenced by the protosplit must either be an OP_RETURN output beginning with a 0x6a6d data push, or another protosplit output. The data pushes following the first 0x6a6d data push of each output are concatenated together to form a single bytestring, and the entire list of concatenated bytes are appended to the message field of the Protostone being evaluated, in the order that chunks are evaluated.

A protosplit for a subprotocol contains the same prefix to the Protostone structure as any protomessage output, including protosplits which are recursively expanded to build the complete bytearray appended to the Message field in the Protostone encoding the protomessage.

For Protostones which are recursively evaluated by a protosplit, all fields are ignored except the Split field.

Chunks are just encoded as the series of data pushes following the OP_RETURN and magic 0x6a6d tag. Chunks are not encoded as a Protostone, and they do not contain the protocol tag for the subprotocol. The design is such that they are ignored by subprotocol indexers unless specifically targeted.

### Ordering

A protorunes compatible indexer MUST process a maximum of one RunestoneMessage for the runes protocol and one for the subprotocol, in the order they appear. Edicts that result in a transfer to a protoburn output execute atomically with the processing of the edict. All other execution is handled in layers, where outputs are processed in the order that they are marked by an edict, protoburn, or protomessage, with the entire set of protorunes which have accumulated onto the output used as the input to the next phase of execution. In this way, processing occurs in layers, such that a protomessage should never need to be evaluated a second time.

An AMM, for example, may handle a pair of runes that are received directly from the runes protocol, atomically. In this case, it is necessary we would allow edicts to target a protoburn to the subprotocol, and the protoburn pointer target a protomessage. This way, the protomessage can be designed to expect the pair of protorunes as an input and respond by issuing protorunes representing LP to the protomessage pointer, and then any component which should be refunded to the refund pointer. Protomessage outputs are always processed in the order they are targeted by an output, as each phase of processing is executed.

Layered execution of protomessages also ensures our compute model can support the prohibition of recursion with a simple mechanism: a protomessage can only be executed once. If a protomessage pointer points to a protomessage which would be evaluated more than once, it is not executed, and instead inputs to the protomessage are sent to the refund_pointer. It is permitted for a refund_pointer to point to a protomessage, but if that protomessage has already been executed, execution simply halts instead, and all funds thus become unspendable. Users of a subprotocol should be encouraged not to use recursion on the protorunes level unless they know what they are doing or mindful guidance is provided. It is your responsibility as a contributor to open finance to ensure that users are educated and understand the side effects which are possible from a transaction.

## License

MIT
