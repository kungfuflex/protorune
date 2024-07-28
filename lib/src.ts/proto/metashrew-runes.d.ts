import type { BinaryWriteOptions } from "@protobuf-ts/runtime";
import type { IBinaryWriter } from "@protobuf-ts/runtime";
import type { BinaryReadOptions } from "@protobuf-ts/runtime";
import type { IBinaryReader } from "@protobuf-ts/runtime";
import type { PartialMessage } from "@protobuf-ts/runtime";
import { MessageType } from "@protobuf-ts/runtime";
/**
 * @generated from protobuf message metashrew_runes.RuneId
 */
export interface RuneId {
    /**
     * @generated from protobuf field: uint32 height = 1;
     */
    height: number;
    /**
     * @generated from protobuf field: uint32 txindex = 2;
     */
    txindex: number;
}
/**
 * @generated from protobuf message metashrew_runes.Rune
 */
export interface Rune {
    /**
     * @generated from protobuf field: metashrew_runes.RuneId runeId = 1;
     */
    runeId?: RuneId;
    /**
     * @generated from protobuf field: bytes name = 2;
     */
    name: Uint8Array;
    /**
     * @generated from protobuf field: uint32 divisibility = 3;
     */
    divisibility: number;
    /**
     * @generated from protobuf field: uint32 spacers = 4;
     */
    spacers: number;
    /**
     * @generated from protobuf field: uint32 symbol = 5;
     */
    symbol: number;
}
/**
 * @generated from protobuf message metashrew_runes.BalanceSheetItem
 */
export interface BalanceSheetItem {
    /**
     * @generated from protobuf field: metashrew_runes.Rune rune = 1;
     */
    rune?: Rune;
    /**
     * @generated from protobuf field: bytes balance = 2;
     */
    balance: Uint8Array;
}
/**
 * @generated from protobuf message metashrew_runes.BalanceSheet
 */
export interface BalanceSheet {
    /**
     * @generated from protobuf field: repeated metashrew_runes.BalanceSheetItem entries = 1;
     */
    entries: BalanceSheetItem[];
}
/**
 * @generated from protobuf message metashrew_runes.Outpoint
 */
export interface Outpoint {
    /**
     * @generated from protobuf field: bytes txid = 1;
     */
    txid: Uint8Array;
    /**
     * @generated from protobuf field: uint32 vout = 2;
     */
    vout: number;
}
/**
 * @generated from protobuf message metashrew_runes.Output
 */
export interface Output {
    /**
     * @generated from protobuf field: bytes script = 1;
     */
    script: Uint8Array;
    /**
     * @generated from protobuf field: uint64 value = 2;
     */
    value: bigint;
}
/**
 * @generated from protobuf message metashrew_runes.OutpointResponse
 */
export interface OutpointResponse {
    /**
     * @generated from protobuf field: metashrew_runes.BalanceSheet balances = 1;
     */
    balances?: BalanceSheet;
    /**
     * @generated from protobuf field: metashrew_runes.Outpoint outpoint = 2;
     */
    outpoint?: Outpoint;
    /**
     * @generated from protobuf field: metashrew_runes.Output output = 3;
     */
    output?: Output;
    /**
     * @generated from protobuf field: uint32 height = 4;
     */
    height: number;
    /**
     * @generated from protobuf field: uint32 txindex = 5;
     */
    txindex: number;
}
/**
 * @generated from protobuf message metashrew_runes.PaginationInput
 */
export interface PaginationInput {
    /**
     * @generated from protobuf field: uint32 start = 1;
     */
    start: number;
    /**
     * @generated from protobuf field: uint32 end = 2;
     */
    end: number;
}
/**
 * @generated from protobuf message metashrew_runes.WalletRequest
 */
export interface WalletRequest {
    /**
     * @generated from protobuf field: bytes wallet = 1;
     */
    wallet: Uint8Array;
}
/**
 * @generated from protobuf message metashrew_runes.WalletResponse
 */
export interface WalletResponse {
    /**
     * @generated from protobuf field: repeated metashrew_runes.OutpointResponse outpoints = 1;
     */
    outpoints: OutpointResponse[];
    /**
     * @generated from protobuf field: metashrew_runes.BalanceSheet balances = 2;
     */
    balances?: BalanceSheet;
}
/**
 * @generated from protobuf message metashrew_runes.RunesResponse
 */
export interface RunesResponse {
    /**
     * @generated from protobuf field: repeated metashrew_runes.Rune runes = 1;
     */
    runes: Rune[];
}
/**
 * @generated from protobuf message metashrew_runes.ProtoBurn
 */
export interface ProtoBurn {
    /**
     * @generated from protobuf field: bytes protocol_tag = 1;
     */
    protocolTag: Uint8Array;
    /**
     * @generated from protobuf field: uint32 pointer = 2;
     */
    pointer: number;
}
/**
 * @generated from protobuf message metashrew_runes.uint128
 */
export interface uint128 {
    /**
     * @generated from protobuf field: uint64 lo = 1;
     */
    lo: bigint;
    /**
     * @generated from protobuf field: uint64 hi = 2;
     */
    hi: bigint;
}
/**
 * @generated from protobuf message metashrew_runes.Clause
 */
export interface Clause {
    /**
     * @generated from protobuf field: metashrew_runes.RuneId rune = 1;
     */
    rune?: RuneId;
    /**
     * @generated from protobuf field: metashrew_runes.uint128 amount = 2;
     */
    amount?: uint128;
}
/**
 * @generated from protobuf message metashrew_runes.Predicate
 */
export interface Predicate {
    /**
     * @generated from protobuf field: repeated metashrew_runes.Clause clauses = 1;
     */
    clauses: Clause[];
}
/**
 * @generated from protobuf message metashrew_runes.ProtoMessage
 */
export interface ProtoMessage {
    /**
     * @generated from protobuf field: bytes calldata = 1;
     */
    calldata: Uint8Array;
    /**
     * @generated from protobuf field: metashrew_runes.Predicate predicate = 2;
     */
    predicate?: Predicate;
    /**
     * @generated from protobuf field: uint32 pointer = 3;
     */
    pointer: number;
    /**
     * @generated from protobuf field: uint32 refund_pointer = 4;
     */
    refundPointer: number;
}
declare class RuneId$Type extends MessageType<RuneId> {
    constructor();
    create(value?: PartialMessage<RuneId>): RuneId;
    internalBinaryRead(reader: IBinaryReader, length: number, options: BinaryReadOptions, target?: RuneId): RuneId;
    internalBinaryWrite(message: RuneId, writer: IBinaryWriter, options: BinaryWriteOptions): IBinaryWriter;
}
/**
 * @generated MessageType for protobuf message metashrew_runes.RuneId
 */
export declare const RuneId: RuneId$Type;
declare class Rune$Type extends MessageType<Rune> {
    constructor();
    create(value?: PartialMessage<Rune>): Rune;
    internalBinaryRead(reader: IBinaryReader, length: number, options: BinaryReadOptions, target?: Rune): Rune;
    internalBinaryWrite(message: Rune, writer: IBinaryWriter, options: BinaryWriteOptions): IBinaryWriter;
}
/**
 * @generated MessageType for protobuf message metashrew_runes.Rune
 */
export declare const Rune: Rune$Type;
declare class BalanceSheetItem$Type extends MessageType<BalanceSheetItem> {
    constructor();
    create(value?: PartialMessage<BalanceSheetItem>): BalanceSheetItem;
    internalBinaryRead(reader: IBinaryReader, length: number, options: BinaryReadOptions, target?: BalanceSheetItem): BalanceSheetItem;
    internalBinaryWrite(message: BalanceSheetItem, writer: IBinaryWriter, options: BinaryWriteOptions): IBinaryWriter;
}
/**
 * @generated MessageType for protobuf message metashrew_runes.BalanceSheetItem
 */
export declare const BalanceSheetItem: BalanceSheetItem$Type;
declare class BalanceSheet$Type extends MessageType<BalanceSheet> {
    constructor();
    create(value?: PartialMessage<BalanceSheet>): BalanceSheet;
    internalBinaryRead(reader: IBinaryReader, length: number, options: BinaryReadOptions, target?: BalanceSheet): BalanceSheet;
    internalBinaryWrite(message: BalanceSheet, writer: IBinaryWriter, options: BinaryWriteOptions): IBinaryWriter;
}
/**
 * @generated MessageType for protobuf message metashrew_runes.BalanceSheet
 */
export declare const BalanceSheet: BalanceSheet$Type;
declare class Outpoint$Type extends MessageType<Outpoint> {
    constructor();
    create(value?: PartialMessage<Outpoint>): Outpoint;
    internalBinaryRead(reader: IBinaryReader, length: number, options: BinaryReadOptions, target?: Outpoint): Outpoint;
    internalBinaryWrite(message: Outpoint, writer: IBinaryWriter, options: BinaryWriteOptions): IBinaryWriter;
}
/**
 * @generated MessageType for protobuf message metashrew_runes.Outpoint
 */
export declare const Outpoint: Outpoint$Type;
declare class Output$Type extends MessageType<Output> {
    constructor();
    create(value?: PartialMessage<Output>): Output;
    internalBinaryRead(reader: IBinaryReader, length: number, options: BinaryReadOptions, target?: Output): Output;
    internalBinaryWrite(message: Output, writer: IBinaryWriter, options: BinaryWriteOptions): IBinaryWriter;
}
/**
 * @generated MessageType for protobuf message metashrew_runes.Output
 */
export declare const Output: Output$Type;
declare class OutpointResponse$Type extends MessageType<OutpointResponse> {
    constructor();
    create(value?: PartialMessage<OutpointResponse>): OutpointResponse;
    internalBinaryRead(reader: IBinaryReader, length: number, options: BinaryReadOptions, target?: OutpointResponse): OutpointResponse;
    internalBinaryWrite(message: OutpointResponse, writer: IBinaryWriter, options: BinaryWriteOptions): IBinaryWriter;
}
/**
 * @generated MessageType for protobuf message metashrew_runes.OutpointResponse
 */
export declare const OutpointResponse: OutpointResponse$Type;
declare class PaginationInput$Type extends MessageType<PaginationInput> {
    constructor();
    create(value?: PartialMessage<PaginationInput>): PaginationInput;
    internalBinaryRead(reader: IBinaryReader, length: number, options: BinaryReadOptions, target?: PaginationInput): PaginationInput;
    internalBinaryWrite(message: PaginationInput, writer: IBinaryWriter, options: BinaryWriteOptions): IBinaryWriter;
}
/**
 * @generated MessageType for protobuf message metashrew_runes.PaginationInput
 */
export declare const PaginationInput: PaginationInput$Type;
declare class WalletRequest$Type extends MessageType<WalletRequest> {
    constructor();
    create(value?: PartialMessage<WalletRequest>): WalletRequest;
    internalBinaryRead(reader: IBinaryReader, length: number, options: BinaryReadOptions, target?: WalletRequest): WalletRequest;
    internalBinaryWrite(message: WalletRequest, writer: IBinaryWriter, options: BinaryWriteOptions): IBinaryWriter;
}
/**
 * @generated MessageType for protobuf message metashrew_runes.WalletRequest
 */
export declare const WalletRequest: WalletRequest$Type;
declare class WalletResponse$Type extends MessageType<WalletResponse> {
    constructor();
    create(value?: PartialMessage<WalletResponse>): WalletResponse;
    internalBinaryRead(reader: IBinaryReader, length: number, options: BinaryReadOptions, target?: WalletResponse): WalletResponse;
    internalBinaryWrite(message: WalletResponse, writer: IBinaryWriter, options: BinaryWriteOptions): IBinaryWriter;
}
/**
 * @generated MessageType for protobuf message metashrew_runes.WalletResponse
 */
export declare const WalletResponse: WalletResponse$Type;
declare class RunesResponse$Type extends MessageType<RunesResponse> {
    constructor();
    create(value?: PartialMessage<RunesResponse>): RunesResponse;
    internalBinaryRead(reader: IBinaryReader, length: number, options: BinaryReadOptions, target?: RunesResponse): RunesResponse;
    internalBinaryWrite(message: RunesResponse, writer: IBinaryWriter, options: BinaryWriteOptions): IBinaryWriter;
}
/**
 * @generated MessageType for protobuf message metashrew_runes.RunesResponse
 */
export declare const RunesResponse: RunesResponse$Type;
declare class ProtoBurn$Type extends MessageType<ProtoBurn> {
    constructor();
    create(value?: PartialMessage<ProtoBurn>): ProtoBurn;
    internalBinaryRead(reader: IBinaryReader, length: number, options: BinaryReadOptions, target?: ProtoBurn): ProtoBurn;
    internalBinaryWrite(message: ProtoBurn, writer: IBinaryWriter, options: BinaryWriteOptions): IBinaryWriter;
}
/**
 * @generated MessageType for protobuf message metashrew_runes.ProtoBurn
 */
export declare const ProtoBurn: ProtoBurn$Type;
declare class uint128$Type extends MessageType<uint128> {
    constructor();
    create(value?: PartialMessage<uint128>): uint128;
    internalBinaryRead(reader: IBinaryReader, length: number, options: BinaryReadOptions, target?: uint128): uint128;
    internalBinaryWrite(message: uint128, writer: IBinaryWriter, options: BinaryWriteOptions): IBinaryWriter;
}
/**
 * @generated MessageType for protobuf message metashrew_runes.uint128
 */
export declare const uint128: uint128$Type;
declare class Clause$Type extends MessageType<Clause> {
    constructor();
    create(value?: PartialMessage<Clause>): Clause;
    internalBinaryRead(reader: IBinaryReader, length: number, options: BinaryReadOptions, target?: Clause): Clause;
    internalBinaryWrite(message: Clause, writer: IBinaryWriter, options: BinaryWriteOptions): IBinaryWriter;
}
/**
 * @generated MessageType for protobuf message metashrew_runes.Clause
 */
export declare const Clause: Clause$Type;
declare class Predicate$Type extends MessageType<Predicate> {
    constructor();
    create(value?: PartialMessage<Predicate>): Predicate;
    internalBinaryRead(reader: IBinaryReader, length: number, options: BinaryReadOptions, target?: Predicate): Predicate;
    internalBinaryWrite(message: Predicate, writer: IBinaryWriter, options: BinaryWriteOptions): IBinaryWriter;
}
/**
 * @generated MessageType for protobuf message metashrew_runes.Predicate
 */
export declare const Predicate: Predicate$Type;
declare class ProtoMessage$Type extends MessageType<ProtoMessage> {
    constructor();
    create(value?: PartialMessage<ProtoMessage>): ProtoMessage;
    internalBinaryRead(reader: IBinaryReader, length: number, options: BinaryReadOptions, target?: ProtoMessage): ProtoMessage;
    internalBinaryWrite(message: ProtoMessage, writer: IBinaryWriter, options: BinaryWriteOptions): IBinaryWriter;
}
/**
 * @generated MessageType for protobuf message metashrew_runes.ProtoMessage
 */
export declare const ProtoMessage: ProtoMessage$Type;
export {};
