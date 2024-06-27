# metashrew-runes

Implementation of [https://github.com/ordinals/ord](https://github.com/ordinals/ord) runestone.

## Author

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

The following structures MUST be compiled with a protoc-compatible compiler.


```proto
syntax = "proto3";
package protorune;

message ProtoBurn {
  bytes protocol_tag = 1;
  uint32 pointer = 2;
}

message Etched {
  uint64 height = 1;
  uint32 txindex = 2;
}

message uint128 {
  uint64 lo = 1;
  uint64 hi = 2;
}

message Clause {
  Etched rune = 1;
  uint128 amount = 2;
}

message Predicate {
  repeated Clause clauses = 1;
}

message ProtoMessage {
  bytes calldata = 1;
  Predicate predicate = 2;
  uint32 pointer = 3;
  uint32 refund_pointer = 4;
}
```

## Indexer

The protorunes design is such that a minimal indexer for a protorune subprotocol should only need to index the runes protocol as well as itself. Runes are always able to be burned onto a subprotocol and remain bound to the runes design, as it relates to supply and transfer.

### protoburn

A protoburn is used to burn runes onto a subprotocol, and is generally a one-way function. A subprotocol MAY allow a protoburn from a sibling subprotocol, if it decides that the indexer for the given subprotocol is sound and is willing to honor incoming assets. Alternatively, protorunes on different subprotocols or runes itself can be exchanged via the usual protocol features of runes and Bitcoin itself.

A protoburn message is an OP_RETURN output where all data pushes are concatenated to a single byte string. The first bytes MUST be 0x6a6a to be considered a protoburn message, followed by a valid protobuf encoding of the ProtoBurn message given above.

The protocol_tag within the ProtoBurn message SHOULD be unique for the subprotocol, and serve as a replacement for the tag 0x6a5d when parsing a RunestoneMessage for protorunes transfers. A protocol_tag MUST NOT include a 0x00 byte.

The pointer within the ProtoBurn message MUST contain the index of a spendable UTXO within the transaction outputs.

All edicts in a RunestoneMessage that are burned into the protoburn output are delegated to the pointer in the protoburn, which MAY be a spendable UTXO OR an OP_RETURN containing a protomessage or a RunestoneMessage with the subprotocol tag.

### protomessage

A protomessage is a protocol message that an indexer MUST interpret as an action on the subprotocol. It is an OP_RETURN output where all data pushes are concatenated to a single byte string, similar to a protoburn. The first bytes of a protomessage contain 0x6a6b, followed by the protocol_tag for the subprotocol, followed by the 0x00 byte. Subsequent bytes MUST be be a valid protobuf message built with the above scheme for ProtoMessage.

A protomessage contains an input byte string which SHOULD be interpreted as an argument to the runtime of the subprotocol. Protorunes MUST be output to the locations pointed to by the `pointer` tag in ProtoMessage or the inputs refunded to the `refund_pointer` if the runtime decides it should not execute against its input of runes and calldata.

It is also acceptable for protorunes to be returned to the refund_pointer as well as to the pointer, for instances where a surplus of protorunes are sent for processing, or protorunes are sent which are not handled by the runtime of the indexer.

The pointers are named for simplicitly in terms of their intended function, but ultimately they provide a mechanism for a branch in execution outputs which can, in turn, target another protomessage. In this way the scheme can support an unlimited amount of protorunes recipients in a given transaction script.

A predicate MUST be supplied with the protomessage which defines the minimum balance sheet which MUST exist on the output pointed to by the pointer, else all assets should be returned to the output pointed to by the refund_pointer.

Assets which are not handled by the runtime which are transferred to the protomessage output SHOULD be returned via the refund_pointer.

### protosplit

For instances where an OP_RETURN output buffer is not large enough to fit a protomessage, the protosplit structure is defined. A protosplit is an OP_RETURN output followed by a data push of the bytes 0x6a6c, then the bytestring representing the protocol tag for the subprotocol. The remaining data pushes are parsed as a series of leb128 encoded u128 values, which should represent the vout index for each of a list of outputs, which MUST each either be an OP_RETURN output beginning with a 0x6a6d data push, or another protosplit output. The data pushes following the first 0x6a6d data push of each output are concatenated together to form a single bytestring, evaluating 0x6a6c prefixed OP_RETURN outputs as protosplit and flattening the entire concatenation in the order it is evaluated. The final bytestring should be interpreted as a protomessage payload, which does NOT include the magic number NOR the protocol tag of the subprotocol. The complete bytestring should be directly parsed by the protobuf parser to decode the protomessage structure defined above. Pointers which target a protosplit result in behavior which is identical to a scenario where the same protomessage were to exist on the single output in its entirety, that is, if the OP_RETURN size limit were not present and this were permitted.

### Ordering

A protorunes compatible indexer MUST process a maximum of two RunestoneMessage outputs per transaction, in the order they appear. Edicts that result in a transfer to a protoburn output execute atomically with the processing of the edict. All other execution is handled in layers, where outputs are processed in the order that they are marked by an edict, protoburn, or another protomessage.

In this way, processing occurs in layers, where batches of protorunes are allowed to collect on a given output before the next phase of execution begins. An AMM, for example, may handle a pair of runes that are received directly from the runes protocol, atomically. In this case, it is necessary we would allow edicts to target a protoburn to the subprotocol, and the protoburn pointer target a protomessage. This way, the protomessage can be designed to expect the pair of protorunes as an input and respond by issuing protorunes representing LP to the protomessage pointer, and then any component which should be refunded to the refund pointer. Protomessage outputs are always processed in the order they are targeted by an output as each processing phase is executed.

Layered execution of protomessages also ensures our compute model can support the prohibition of recursion with a simple mechanism: a protomessage can only be executed once. If a protomessage pointer points to a protomessage which would be evaluated more than once, it is not executed, and instead inputs to the protomessage are sent to the refund_pointer. It is permitted for a refund_pointer to point to a protomessage, but if that protomessage has already been executed, execution simply halts instead, and all funds thus become unspendable. Do not use recursion unless you know what you are doing!

## License

MIT