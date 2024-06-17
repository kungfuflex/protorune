"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.RunesResponse = exports.WalletResponse = exports.WalletRequest = exports.PaginationInput = exports.OutpointResponse = exports.Output = exports.Outpoint = exports.BalanceSheet = exports.BalanceSheetItem = exports.Rune = exports.RuneId = void 0;
const runtime_1 = require("@protobuf-ts/runtime");
const runtime_2 = require("@protobuf-ts/runtime");
const runtime_3 = require("@protobuf-ts/runtime");
const runtime_4 = require("@protobuf-ts/runtime");
// @generated message type with reflection information, may provide speed optimized methods
class RuneId$Type extends runtime_4.MessageType {
    constructor() {
        super("metashrew_runes.RuneId", [
            { no: 1, name: "height", kind: "scalar", T: 13 /*ScalarType.UINT32*/ },
            { no: 2, name: "txindex", kind: "scalar", T: 13 /*ScalarType.UINT32*/ }
        ]);
    }
    create(value) {
        const message = globalThis.Object.create((this.messagePrototype));
        message.height = 0;
        message.txindex = 0;
        if (value !== undefined)
            (0, runtime_3.reflectionMergePartial)(this, message, value);
        return message;
    }
    internalBinaryRead(reader, length, options, target) {
        let message = target ?? this.create(), end = reader.pos + length;
        while (reader.pos < end) {
            let [fieldNo, wireType] = reader.tag();
            switch (fieldNo) {
                case /* uint32 height */ 1:
                    message.height = reader.uint32();
                    break;
                case /* uint32 txindex */ 2:
                    message.txindex = reader.uint32();
                    break;
                default:
                    let u = options.readUnknownField;
                    if (u === "throw")
                        throw new globalThis.Error(`Unknown field ${fieldNo} (wire type ${wireType}) for ${this.typeName}`);
                    let d = reader.skip(wireType);
                    if (u !== false)
                        (u === true ? runtime_2.UnknownFieldHandler.onRead : u)(this.typeName, message, fieldNo, wireType, d);
            }
        }
        return message;
    }
    internalBinaryWrite(message, writer, options) {
        /* uint32 height = 1; */
        if (message.height !== 0)
            writer.tag(1, runtime_1.WireType.Varint).uint32(message.height);
        /* uint32 txindex = 2; */
        if (message.txindex !== 0)
            writer.tag(2, runtime_1.WireType.Varint).uint32(message.txindex);
        let u = options.writeUnknownFields;
        if (u !== false)
            (u == true ? runtime_2.UnknownFieldHandler.onWrite : u)(this.typeName, message, writer);
        return writer;
    }
}
/**
 * @generated MessageType for protobuf message metashrew_runes.RuneId
 */
exports.RuneId = new RuneId$Type();
// @generated message type with reflection information, may provide speed optimized methods
class Rune$Type extends runtime_4.MessageType {
    constructor() {
        super("metashrew_runes.Rune", [
            { no: 1, name: "runeId", kind: "message", T: () => exports.RuneId },
            { no: 2, name: "name", kind: "scalar", T: 12 /*ScalarType.BYTES*/ },
            { no: 3, name: "divisibility", kind: "scalar", T: 13 /*ScalarType.UINT32*/ },
            { no: 4, name: "spacers", kind: "scalar", T: 13 /*ScalarType.UINT32*/ },
            { no: 5, name: "symbol", kind: "scalar", T: 13 /*ScalarType.UINT32*/ }
        ]);
    }
    create(value) {
        const message = globalThis.Object.create((this.messagePrototype));
        message.name = new Uint8Array(0);
        message.divisibility = 0;
        message.spacers = 0;
        message.symbol = 0;
        if (value !== undefined)
            (0, runtime_3.reflectionMergePartial)(this, message, value);
        return message;
    }
    internalBinaryRead(reader, length, options, target) {
        let message = target ?? this.create(), end = reader.pos + length;
        while (reader.pos < end) {
            let [fieldNo, wireType] = reader.tag();
            switch (fieldNo) {
                case /* metashrew_runes.RuneId runeId */ 1:
                    message.runeId = exports.RuneId.internalBinaryRead(reader, reader.uint32(), options, message.runeId);
                    break;
                case /* bytes name */ 2:
                    message.name = reader.bytes();
                    break;
                case /* uint32 divisibility */ 3:
                    message.divisibility = reader.uint32();
                    break;
                case /* uint32 spacers */ 4:
                    message.spacers = reader.uint32();
                    break;
                case /* uint32 symbol */ 5:
                    message.symbol = reader.uint32();
                    break;
                default:
                    let u = options.readUnknownField;
                    if (u === "throw")
                        throw new globalThis.Error(`Unknown field ${fieldNo} (wire type ${wireType}) for ${this.typeName}`);
                    let d = reader.skip(wireType);
                    if (u !== false)
                        (u === true ? runtime_2.UnknownFieldHandler.onRead : u)(this.typeName, message, fieldNo, wireType, d);
            }
        }
        return message;
    }
    internalBinaryWrite(message, writer, options) {
        /* metashrew_runes.RuneId runeId = 1; */
        if (message.runeId)
            exports.RuneId.internalBinaryWrite(message.runeId, writer.tag(1, runtime_1.WireType.LengthDelimited).fork(), options).join();
        /* bytes name = 2; */
        if (message.name.length)
            writer.tag(2, runtime_1.WireType.LengthDelimited).bytes(message.name);
        /* uint32 divisibility = 3; */
        if (message.divisibility !== 0)
            writer.tag(3, runtime_1.WireType.Varint).uint32(message.divisibility);
        /* uint32 spacers = 4; */
        if (message.spacers !== 0)
            writer.tag(4, runtime_1.WireType.Varint).uint32(message.spacers);
        /* uint32 symbol = 5; */
        if (message.symbol !== 0)
            writer.tag(5, runtime_1.WireType.Varint).uint32(message.symbol);
        let u = options.writeUnknownFields;
        if (u !== false)
            (u == true ? runtime_2.UnknownFieldHandler.onWrite : u)(this.typeName, message, writer);
        return writer;
    }
}
/**
 * @generated MessageType for protobuf message metashrew_runes.Rune
 */
exports.Rune = new Rune$Type();
// @generated message type with reflection information, may provide speed optimized methods
class BalanceSheetItem$Type extends runtime_4.MessageType {
    constructor() {
        super("metashrew_runes.BalanceSheetItem", [
            { no: 1, name: "rune", kind: "message", T: () => exports.Rune },
            { no: 2, name: "balance", kind: "scalar", T: 12 /*ScalarType.BYTES*/ }
        ]);
    }
    create(value) {
        const message = globalThis.Object.create((this.messagePrototype));
        message.balance = new Uint8Array(0);
        if (value !== undefined)
            (0, runtime_3.reflectionMergePartial)(this, message, value);
        return message;
    }
    internalBinaryRead(reader, length, options, target) {
        let message = target ?? this.create(), end = reader.pos + length;
        while (reader.pos < end) {
            let [fieldNo, wireType] = reader.tag();
            switch (fieldNo) {
                case /* metashrew_runes.Rune rune */ 1:
                    message.rune = exports.Rune.internalBinaryRead(reader, reader.uint32(), options, message.rune);
                    break;
                case /* bytes balance */ 2:
                    message.balance = reader.bytes();
                    break;
                default:
                    let u = options.readUnknownField;
                    if (u === "throw")
                        throw new globalThis.Error(`Unknown field ${fieldNo} (wire type ${wireType}) for ${this.typeName}`);
                    let d = reader.skip(wireType);
                    if (u !== false)
                        (u === true ? runtime_2.UnknownFieldHandler.onRead : u)(this.typeName, message, fieldNo, wireType, d);
            }
        }
        return message;
    }
    internalBinaryWrite(message, writer, options) {
        /* metashrew_runes.Rune rune = 1; */
        if (message.rune)
            exports.Rune.internalBinaryWrite(message.rune, writer.tag(1, runtime_1.WireType.LengthDelimited).fork(), options).join();
        /* bytes balance = 2; */
        if (message.balance.length)
            writer.tag(2, runtime_1.WireType.LengthDelimited).bytes(message.balance);
        let u = options.writeUnknownFields;
        if (u !== false)
            (u == true ? runtime_2.UnknownFieldHandler.onWrite : u)(this.typeName, message, writer);
        return writer;
    }
}
/**
 * @generated MessageType for protobuf message metashrew_runes.BalanceSheetItem
 */
exports.BalanceSheetItem = new BalanceSheetItem$Type();
// @generated message type with reflection information, may provide speed optimized methods
class BalanceSheet$Type extends runtime_4.MessageType {
    constructor() {
        super("metashrew_runes.BalanceSheet", [
            { no: 1, name: "entries", kind: "message", repeat: 1 /*RepeatType.PACKED*/, T: () => exports.BalanceSheetItem }
        ]);
    }
    create(value) {
        const message = globalThis.Object.create((this.messagePrototype));
        message.entries = [];
        if (value !== undefined)
            (0, runtime_3.reflectionMergePartial)(this, message, value);
        return message;
    }
    internalBinaryRead(reader, length, options, target) {
        let message = target ?? this.create(), end = reader.pos + length;
        while (reader.pos < end) {
            let [fieldNo, wireType] = reader.tag();
            switch (fieldNo) {
                case /* repeated metashrew_runes.BalanceSheetItem entries */ 1:
                    message.entries.push(exports.BalanceSheetItem.internalBinaryRead(reader, reader.uint32(), options));
                    break;
                default:
                    let u = options.readUnknownField;
                    if (u === "throw")
                        throw new globalThis.Error(`Unknown field ${fieldNo} (wire type ${wireType}) for ${this.typeName}`);
                    let d = reader.skip(wireType);
                    if (u !== false)
                        (u === true ? runtime_2.UnknownFieldHandler.onRead : u)(this.typeName, message, fieldNo, wireType, d);
            }
        }
        return message;
    }
    internalBinaryWrite(message, writer, options) {
        /* repeated metashrew_runes.BalanceSheetItem entries = 1; */
        for (let i = 0; i < message.entries.length; i++)
            exports.BalanceSheetItem.internalBinaryWrite(message.entries[i], writer.tag(1, runtime_1.WireType.LengthDelimited).fork(), options).join();
        let u = options.writeUnknownFields;
        if (u !== false)
            (u == true ? runtime_2.UnknownFieldHandler.onWrite : u)(this.typeName, message, writer);
        return writer;
    }
}
/**
 * @generated MessageType for protobuf message metashrew_runes.BalanceSheet
 */
exports.BalanceSheet = new BalanceSheet$Type();
// @generated message type with reflection information, may provide speed optimized methods
class Outpoint$Type extends runtime_4.MessageType {
    constructor() {
        super("metashrew_runes.Outpoint", [
            { no: 1, name: "txid", kind: "scalar", T: 12 /*ScalarType.BYTES*/ },
            { no: 2, name: "vout", kind: "scalar", T: 13 /*ScalarType.UINT32*/ }
        ]);
    }
    create(value) {
        const message = globalThis.Object.create((this.messagePrototype));
        message.txid = new Uint8Array(0);
        message.vout = 0;
        if (value !== undefined)
            (0, runtime_3.reflectionMergePartial)(this, message, value);
        return message;
    }
    internalBinaryRead(reader, length, options, target) {
        let message = target ?? this.create(), end = reader.pos + length;
        while (reader.pos < end) {
            let [fieldNo, wireType] = reader.tag();
            switch (fieldNo) {
                case /* bytes txid */ 1:
                    message.txid = reader.bytes();
                    break;
                case /* uint32 vout */ 2:
                    message.vout = reader.uint32();
                    break;
                default:
                    let u = options.readUnknownField;
                    if (u === "throw")
                        throw new globalThis.Error(`Unknown field ${fieldNo} (wire type ${wireType}) for ${this.typeName}`);
                    let d = reader.skip(wireType);
                    if (u !== false)
                        (u === true ? runtime_2.UnknownFieldHandler.onRead : u)(this.typeName, message, fieldNo, wireType, d);
            }
        }
        return message;
    }
    internalBinaryWrite(message, writer, options) {
        /* bytes txid = 1; */
        if (message.txid.length)
            writer.tag(1, runtime_1.WireType.LengthDelimited).bytes(message.txid);
        /* uint32 vout = 2; */
        if (message.vout !== 0)
            writer.tag(2, runtime_1.WireType.Varint).uint32(message.vout);
        let u = options.writeUnknownFields;
        if (u !== false)
            (u == true ? runtime_2.UnknownFieldHandler.onWrite : u)(this.typeName, message, writer);
        return writer;
    }
}
/**
 * @generated MessageType for protobuf message metashrew_runes.Outpoint
 */
exports.Outpoint = new Outpoint$Type();
// @generated message type with reflection information, may provide speed optimized methods
class Output$Type extends runtime_4.MessageType {
    constructor() {
        super("metashrew_runes.Output", [
            { no: 1, name: "script", kind: "scalar", T: 12 /*ScalarType.BYTES*/ },
            { no: 2, name: "value", kind: "scalar", T: 4 /*ScalarType.UINT64*/, L: 0 /*LongType.BIGINT*/ }
        ]);
    }
    create(value) {
        const message = globalThis.Object.create((this.messagePrototype));
        message.script = new Uint8Array(0);
        message.value = 0n;
        if (value !== undefined)
            (0, runtime_3.reflectionMergePartial)(this, message, value);
        return message;
    }
    internalBinaryRead(reader, length, options, target) {
        let message = target ?? this.create(), end = reader.pos + length;
        while (reader.pos < end) {
            let [fieldNo, wireType] = reader.tag();
            switch (fieldNo) {
                case /* bytes script */ 1:
                    message.script = reader.bytes();
                    break;
                case /* uint64 value */ 2:
                    message.value = reader.uint64().toBigInt();
                    break;
                default:
                    let u = options.readUnknownField;
                    if (u === "throw")
                        throw new globalThis.Error(`Unknown field ${fieldNo} (wire type ${wireType}) for ${this.typeName}`);
                    let d = reader.skip(wireType);
                    if (u !== false)
                        (u === true ? runtime_2.UnknownFieldHandler.onRead : u)(this.typeName, message, fieldNo, wireType, d);
            }
        }
        return message;
    }
    internalBinaryWrite(message, writer, options) {
        /* bytes script = 1; */
        if (message.script.length)
            writer.tag(1, runtime_1.WireType.LengthDelimited).bytes(message.script);
        /* uint64 value = 2; */
        if (message.value !== 0n)
            writer.tag(2, runtime_1.WireType.Varint).uint64(message.value);
        let u = options.writeUnknownFields;
        if (u !== false)
            (u == true ? runtime_2.UnknownFieldHandler.onWrite : u)(this.typeName, message, writer);
        return writer;
    }
}
/**
 * @generated MessageType for protobuf message metashrew_runes.Output
 */
exports.Output = new Output$Type();
// @generated message type with reflection information, may provide speed optimized methods
class OutpointResponse$Type extends runtime_4.MessageType {
    constructor() {
        super("metashrew_runes.OutpointResponse", [
            { no: 1, name: "balances", kind: "message", T: () => exports.BalanceSheet },
            { no: 2, name: "outpoint", kind: "message", T: () => exports.Outpoint },
            { no: 3, name: "output", kind: "message", T: () => exports.Output },
            { no: 4, name: "height", kind: "scalar", T: 13 /*ScalarType.UINT32*/ },
            { no: 5, name: "txindex", kind: "scalar", T: 13 /*ScalarType.UINT32*/ }
        ]);
    }
    create(value) {
        const message = globalThis.Object.create((this.messagePrototype));
        message.height = 0;
        message.txindex = 0;
        if (value !== undefined)
            (0, runtime_3.reflectionMergePartial)(this, message, value);
        return message;
    }
    internalBinaryRead(reader, length, options, target) {
        let message = target ?? this.create(), end = reader.pos + length;
        while (reader.pos < end) {
            let [fieldNo, wireType] = reader.tag();
            switch (fieldNo) {
                case /* metashrew_runes.BalanceSheet balances */ 1:
                    message.balances = exports.BalanceSheet.internalBinaryRead(reader, reader.uint32(), options, message.balances);
                    break;
                case /* metashrew_runes.Outpoint outpoint */ 2:
                    message.outpoint = exports.Outpoint.internalBinaryRead(reader, reader.uint32(), options, message.outpoint);
                    break;
                case /* metashrew_runes.Output output */ 3:
                    message.output = exports.Output.internalBinaryRead(reader, reader.uint32(), options, message.output);
                    break;
                case /* uint32 height */ 4:
                    message.height = reader.uint32();
                    break;
                case /* uint32 txindex */ 5:
                    message.txindex = reader.uint32();
                    break;
                default:
                    let u = options.readUnknownField;
                    if (u === "throw")
                        throw new globalThis.Error(`Unknown field ${fieldNo} (wire type ${wireType}) for ${this.typeName}`);
                    let d = reader.skip(wireType);
                    if (u !== false)
                        (u === true ? runtime_2.UnknownFieldHandler.onRead : u)(this.typeName, message, fieldNo, wireType, d);
            }
        }
        return message;
    }
    internalBinaryWrite(message, writer, options) {
        /* metashrew_runes.BalanceSheet balances = 1; */
        if (message.balances)
            exports.BalanceSheet.internalBinaryWrite(message.balances, writer.tag(1, runtime_1.WireType.LengthDelimited).fork(), options).join();
        /* metashrew_runes.Outpoint outpoint = 2; */
        if (message.outpoint)
            exports.Outpoint.internalBinaryWrite(message.outpoint, writer.tag(2, runtime_1.WireType.LengthDelimited).fork(), options).join();
        /* metashrew_runes.Output output = 3; */
        if (message.output)
            exports.Output.internalBinaryWrite(message.output, writer.tag(3, runtime_1.WireType.LengthDelimited).fork(), options).join();
        /* uint32 height = 4; */
        if (message.height !== 0)
            writer.tag(4, runtime_1.WireType.Varint).uint32(message.height);
        /* uint32 txindex = 5; */
        if (message.txindex !== 0)
            writer.tag(5, runtime_1.WireType.Varint).uint32(message.txindex);
        let u = options.writeUnknownFields;
        if (u !== false)
            (u == true ? runtime_2.UnknownFieldHandler.onWrite : u)(this.typeName, message, writer);
        return writer;
    }
}
/**
 * @generated MessageType for protobuf message metashrew_runes.OutpointResponse
 */
exports.OutpointResponse = new OutpointResponse$Type();
// @generated message type with reflection information, may provide speed optimized methods
class PaginationInput$Type extends runtime_4.MessageType {
    constructor() {
        super("metashrew_runes.PaginationInput", [
            { no: 1, name: "start", kind: "scalar", T: 13 /*ScalarType.UINT32*/ },
            { no: 2, name: "end", kind: "scalar", T: 13 /*ScalarType.UINT32*/ }
        ]);
    }
    create(value) {
        const message = globalThis.Object.create((this.messagePrototype));
        message.start = 0;
        message.end = 0;
        if (value !== undefined)
            (0, runtime_3.reflectionMergePartial)(this, message, value);
        return message;
    }
    internalBinaryRead(reader, length, options, target) {
        let message = target ?? this.create(), end = reader.pos + length;
        while (reader.pos < end) {
            let [fieldNo, wireType] = reader.tag();
            switch (fieldNo) {
                case /* uint32 start */ 1:
                    message.start = reader.uint32();
                    break;
                case /* uint32 end */ 2:
                    message.end = reader.uint32();
                    break;
                default:
                    let u = options.readUnknownField;
                    if (u === "throw")
                        throw new globalThis.Error(`Unknown field ${fieldNo} (wire type ${wireType}) for ${this.typeName}`);
                    let d = reader.skip(wireType);
                    if (u !== false)
                        (u === true ? runtime_2.UnknownFieldHandler.onRead : u)(this.typeName, message, fieldNo, wireType, d);
            }
        }
        return message;
    }
    internalBinaryWrite(message, writer, options) {
        /* uint32 start = 1; */
        if (message.start !== 0)
            writer.tag(1, runtime_1.WireType.Varint).uint32(message.start);
        /* uint32 end = 2; */
        if (message.end !== 0)
            writer.tag(2, runtime_1.WireType.Varint).uint32(message.end);
        let u = options.writeUnknownFields;
        if (u !== false)
            (u == true ? runtime_2.UnknownFieldHandler.onWrite : u)(this.typeName, message, writer);
        return writer;
    }
}
/**
 * @generated MessageType for protobuf message metashrew_runes.PaginationInput
 */
exports.PaginationInput = new PaginationInput$Type();
// @generated message type with reflection information, may provide speed optimized methods
class WalletRequest$Type extends runtime_4.MessageType {
    constructor() {
        super("metashrew_runes.WalletRequest", [
            { no: 1, name: "wallet", kind: "scalar", T: 12 /*ScalarType.BYTES*/ }
        ]);
    }
    create(value) {
        const message = globalThis.Object.create((this.messagePrototype));
        message.wallet = new Uint8Array(0);
        if (value !== undefined)
            (0, runtime_3.reflectionMergePartial)(this, message, value);
        return message;
    }
    internalBinaryRead(reader, length, options, target) {
        let message = target ?? this.create(), end = reader.pos + length;
        while (reader.pos < end) {
            let [fieldNo, wireType] = reader.tag();
            switch (fieldNo) {
                case /* bytes wallet */ 1:
                    message.wallet = reader.bytes();
                    break;
                default:
                    let u = options.readUnknownField;
                    if (u === "throw")
                        throw new globalThis.Error(`Unknown field ${fieldNo} (wire type ${wireType}) for ${this.typeName}`);
                    let d = reader.skip(wireType);
                    if (u !== false)
                        (u === true ? runtime_2.UnknownFieldHandler.onRead : u)(this.typeName, message, fieldNo, wireType, d);
            }
        }
        return message;
    }
    internalBinaryWrite(message, writer, options) {
        /* bytes wallet = 1; */
        if (message.wallet.length)
            writer.tag(1, runtime_1.WireType.LengthDelimited).bytes(message.wallet);
        let u = options.writeUnknownFields;
        if (u !== false)
            (u == true ? runtime_2.UnknownFieldHandler.onWrite : u)(this.typeName, message, writer);
        return writer;
    }
}
/**
 * @generated MessageType for protobuf message metashrew_runes.WalletRequest
 */
exports.WalletRequest = new WalletRequest$Type();
// @generated message type with reflection information, may provide speed optimized methods
class WalletResponse$Type extends runtime_4.MessageType {
    constructor() {
        super("metashrew_runes.WalletResponse", [
            { no: 1, name: "outpoints", kind: "message", repeat: 1 /*RepeatType.PACKED*/, T: () => exports.OutpointResponse },
            { no: 2, name: "balances", kind: "message", T: () => exports.BalanceSheet }
        ]);
    }
    create(value) {
        const message = globalThis.Object.create((this.messagePrototype));
        message.outpoints = [];
        if (value !== undefined)
            (0, runtime_3.reflectionMergePartial)(this, message, value);
        return message;
    }
    internalBinaryRead(reader, length, options, target) {
        let message = target ?? this.create(), end = reader.pos + length;
        while (reader.pos < end) {
            let [fieldNo, wireType] = reader.tag();
            switch (fieldNo) {
                case /* repeated metashrew_runes.OutpointResponse outpoints */ 1:
                    message.outpoints.push(exports.OutpointResponse.internalBinaryRead(reader, reader.uint32(), options));
                    break;
                case /* metashrew_runes.BalanceSheet balances */ 2:
                    message.balances = exports.BalanceSheet.internalBinaryRead(reader, reader.uint32(), options, message.balances);
                    break;
                default:
                    let u = options.readUnknownField;
                    if (u === "throw")
                        throw new globalThis.Error(`Unknown field ${fieldNo} (wire type ${wireType}) for ${this.typeName}`);
                    let d = reader.skip(wireType);
                    if (u !== false)
                        (u === true ? runtime_2.UnknownFieldHandler.onRead : u)(this.typeName, message, fieldNo, wireType, d);
            }
        }
        return message;
    }
    internalBinaryWrite(message, writer, options) {
        /* repeated metashrew_runes.OutpointResponse outpoints = 1; */
        for (let i = 0; i < message.outpoints.length; i++)
            exports.OutpointResponse.internalBinaryWrite(message.outpoints[i], writer.tag(1, runtime_1.WireType.LengthDelimited).fork(), options).join();
        /* metashrew_runes.BalanceSheet balances = 2; */
        if (message.balances)
            exports.BalanceSheet.internalBinaryWrite(message.balances, writer.tag(2, runtime_1.WireType.LengthDelimited).fork(), options).join();
        let u = options.writeUnknownFields;
        if (u !== false)
            (u == true ? runtime_2.UnknownFieldHandler.onWrite : u)(this.typeName, message, writer);
        return writer;
    }
}
/**
 * @generated MessageType for protobuf message metashrew_runes.WalletResponse
 */
exports.WalletResponse = new WalletResponse$Type();
// @generated message type with reflection information, may provide speed optimized methods
class RunesResponse$Type extends runtime_4.MessageType {
    constructor() {
        super("metashrew_runes.RunesResponse", [
            { no: 1, name: "runes", kind: "message", repeat: 1 /*RepeatType.PACKED*/, T: () => exports.Rune }
        ]);
    }
    create(value) {
        const message = globalThis.Object.create((this.messagePrototype));
        message.runes = [];
        if (value !== undefined)
            (0, runtime_3.reflectionMergePartial)(this, message, value);
        return message;
    }
    internalBinaryRead(reader, length, options, target) {
        let message = target ?? this.create(), end = reader.pos + length;
        while (reader.pos < end) {
            let [fieldNo, wireType] = reader.tag();
            switch (fieldNo) {
                case /* repeated metashrew_runes.Rune runes */ 1:
                    message.runes.push(exports.Rune.internalBinaryRead(reader, reader.uint32(), options));
                    break;
                default:
                    let u = options.readUnknownField;
                    if (u === "throw")
                        throw new globalThis.Error(`Unknown field ${fieldNo} (wire type ${wireType}) for ${this.typeName}`);
                    let d = reader.skip(wireType);
                    if (u !== false)
                        (u === true ? runtime_2.UnknownFieldHandler.onRead : u)(this.typeName, message, fieldNo, wireType, d);
            }
        }
        return message;
    }
    internalBinaryWrite(message, writer, options) {
        /* repeated metashrew_runes.Rune runes = 1; */
        for (let i = 0; i < message.runes.length; i++)
            exports.Rune.internalBinaryWrite(message.runes[i], writer.tag(1, runtime_1.WireType.LengthDelimited).fork(), options).join();
        let u = options.writeUnknownFields;
        if (u !== false)
            (u == true ? runtime_2.UnknownFieldHandler.onWrite : u)(this.typeName, message, writer);
        return writer;
    }
}
/**
 * @generated MessageType for protobuf message metashrew_runes.RunesResponse
 */
exports.RunesResponse = new RunesResponse$Type();
//# sourceMappingURL=metashrew-runes.js.map