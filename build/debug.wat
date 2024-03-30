(module
 (type $0 (func (param i32) (result i32)))
 (type $1 (func (param i32 i32)))
 (type $2 (func (param i32 i32) (result i32)))
 (type $3 (func (param i32 i32 i32) (result i32)))
 (type $4 (func))
 (type $5 (func (param i32) (result i64)))
 (type $6 (func (param i32 i32 i32 i32) (result i32)))
 (type $7 (func (result i32)))
 (type $8 (func (param i32 i32 i32)))
 (type $9 (func (param i32 i64)))
 (type $10 (func (param i32)))
 (type $11 (func (param i32 i64) (result i32)))
 (type $12 (func (param i64 i32) (result i32)))
 (type $13 (func (param i32 i64 i32)))
 (type $14 (func (param i32 i32 i32 i32)))
 (type $15 (func (param i32 i32 i32 i32 i32) (result i32)))
 (type $16 (func (param i32 i64) (result i64)))
 (type $17 (func (param i64 i32 i32)))
 (type $18 (func (param i64) (result i64)))
 (type $19 (func (param i32 i32 i64)))
 (type $20 (func (param i64 i64) (result i32)))
 (type $21 (func (param i32 i32) (result i64)))
 (type $22 (func (param i32 i64 i32 i32)))
 (type $23 (func (param i64 i64 i32) (result i32)))
 (type $24 (func (param i32 i32 i32) (result i64)))
 (type $25 (func (param i64 i64) (result i64)))
 (type $26 (func (param i32 i32 i64) (result i32)))
 (type $27 (func (param i64) (result i32)))
 (import "env" "abort" (func $~lib/builtins/abort (param i32 i32 i32 i32)))
 (import "env" "__host_len" (func $~lib/metashrew-as/assembly/indexer/index/__host_len (result i32)))
 (import "env" "__load_input" (func $~lib/metashrew-as/assembly/indexer/index/__load_input (param i32)))
 (import "env" "__get_len" (func $~lib/metashrew-as/assembly/indexer/index/__get_len (param i32) (result i32)))
 (import "env" "__get" (func $~lib/metashrew-as/assembly/indexer/index/__get (param i32 i32)))
 (import "env" "__flush" (func $~lib/metashrew-as/assembly/indexer/index/__flush (param i32)))
 (global $~lib/metashrew-as/assembly/utils/hex/hexLookupTable i32 (i32.const 32))
 (global $~lib/rt/stub/startOffset (mut i32) (i32.const 0))
 (global $~lib/rt/stub/offset (mut i32) (i32.const 0))
 (global $~lib/metashrew-as/assembly/utils/logging/console (mut i32) (i32.const 0))
 (global $~lib/metashrew-as/assembly/utils/sha256/DIGEST_LENGTH i32 (i32.const 32))
 (global $~lib/metashrew-as/assembly/utils/sha256/INPUT_LENGTH i32 (i32.const 512))
 (global $~lib/metashrew-as/assembly/utils/sha256/K i32 (i32.const 992))
 (global $~lib/metashrew-as/assembly/utils/sha256/kPtr (mut i32) (i32.const 0))
 (global $~lib/metashrew-as/assembly/utils/sha256/W64 i32 (i32.const 1328))
 (global $~lib/metashrew-as/assembly/utils/sha256/w64Ptr (mut i32) (i32.const 0))
 (global $~lib/metashrew-as/assembly/utils/sha256/H0 (mut i32) (i32.const 0))
 (global $~lib/metashrew-as/assembly/utils/sha256/H1 (mut i32) (i32.const 0))
 (global $~lib/metashrew-as/assembly/utils/sha256/H2 (mut i32) (i32.const 0))
 (global $~lib/metashrew-as/assembly/utils/sha256/H3 (mut i32) (i32.const 0))
 (global $~lib/metashrew-as/assembly/utils/sha256/H4 (mut i32) (i32.const 0))
 (global $~lib/metashrew-as/assembly/utils/sha256/H5 (mut i32) (i32.const 0))
 (global $~lib/metashrew-as/assembly/utils/sha256/H6 (mut i32) (i32.const 0))
 (global $~lib/metashrew-as/assembly/utils/sha256/H7 (mut i32) (i32.const 0))
 (global $~lib/metashrew-as/assembly/utils/sha256/a (mut i32) (i32.const 0))
 (global $~lib/metashrew-as/assembly/utils/sha256/b (mut i32) (i32.const 0))
 (global $~lib/metashrew-as/assembly/utils/sha256/c (mut i32) (i32.const 0))
 (global $~lib/metashrew-as/assembly/utils/sha256/d (mut i32) (i32.const 0))
 (global $~lib/metashrew-as/assembly/utils/sha256/e (mut i32) (i32.const 0))
 (global $~lib/metashrew-as/assembly/utils/sha256/f (mut i32) (i32.const 0))
 (global $~lib/metashrew-as/assembly/utils/sha256/g (mut i32) (i32.const 0))
 (global $~lib/metashrew-as/assembly/utils/sha256/h (mut i32) (i32.const 0))
 (global $~lib/metashrew-as/assembly/utils/sha256/i (mut i32) (i32.const 0))
 (global $~lib/metashrew-as/assembly/utils/sha256/t1 (mut i32) (i32.const 0))
 (global $~lib/metashrew-as/assembly/utils/sha256/t2 (mut i32) (i32.const 0))
 (global $~lib/shared/runtime/Runtime.Stub i32 (i32.const 0))
 (global $~lib/shared/runtime/Runtime.Minimal i32 (i32.const 1))
 (global $~lib/shared/runtime/Runtime.Incremental i32 (i32.const 2))
 (global $~lib/native/ASC_RUNTIME i32 (i32.const 0))
 (global $~lib/metashrew-as/assembly/utils/sha256/M (mut i32) (i32.const 0))
 (global $~lib/metashrew-as/assembly/utils/sha256/mPtr (mut i32) (i32.const 0))
 (global $~lib/metashrew-as/assembly/utils/sha256/W (mut i32) (i32.const 0))
 (global $~lib/metashrew-as/assembly/utils/sha256/wPtr (mut i32) (i32.const 0))
 (global $~lib/metashrew-as/assembly/utils/sha256/input (mut i32) (i32.const 0))
 (global $~lib/metashrew-as/assembly/utils/sha256/inputPtr (mut i32) (i32.const 0))
 (global $~lib/metashrew-as/assembly/utils/sha256/output (mut i32) (i32.const 0))
 (global $~lib/metashrew-as/assembly/utils/sha256/outputPtr (mut i32) (i32.const 0))
 (global $~lib/metashrew-as/assembly/utils/sha256/mLength (mut i32) (i32.const 0))
 (global $~lib/metashrew-as/assembly/utils/sha256/bytesHashed (mut i32) (i32.const 0))
 (global $~lib/metashrew-as/assembly/indexer/index/_updates (mut i32) (i32.const 0))
 (global $~lib/metashrew-as/assembly/indexer/index/_updateKeys (mut i32) (i32.const 0))
 (global $~lib/metashrew-as/assembly/indexer/index/BUFFER_SIZE i32 (i32.const 1048576))
 (global $~lib/metashrew-as/assembly/indexer/index/_filled (mut i32) (i32.const 0))
 (global $~lib/metashrew-as/assembly/utils/yabsp/console (mut i32) (i32.const 0))
 (global $~lib/metashrew-as/assembly/utils/b32/ENCODING_CONST_BECH32 i32 (i32.const 1))
 (global $~lib/metashrew-as/assembly/utils/b32/ENCODING_CONST_BECH32M i32 (i32.const 734539939))
 (global $~argumentsLength (mut i32) (i32.const 0))
 (global $~lib/metashrew-as/assembly/utils/b32/ONE (mut i32) (i32.const 0))
 (global $~lib/metashrew-as/assembly/utils/b32/ALPHABET_MAP i32 (i32.const 1680))
 (global $~lib/metashrew-as/assembly/utils/b32/ALPHABET i32 (i32.const 1968))
 (global $~lib/metashrew-as/assembly/utils/b58/ALPHABET i32 (i32.const 2032))
 (global $~lib/metashrew-as/assembly/utils/b58/LEADER (mut i32) (i32.const 0))
 (global $~lib/metashrew-as/assembly/utils/ordinals/SUPPLY i64 (i64.const 2099999997690000))
 (global $~lib/metashrew-as/assembly/utils/ordinals/LAST i64 (i64.const 2099999997689999))
 (global $~lib/metashrew-as/assembly/utils/constant/CYCLE_EPOCHS i32 (i32.const 6))
 (global $~lib/metashrew-as/assembly/utils/constant/SUBSIDY_HALVING_INTERVAL i32 (i32.const 210000))
 (global $~lib/metashrew-as/assembly/utils/constant/COIN_VALUE i32 (i32.const 100000000))
 (global $~lib/metashrew-as/assembly/utils/constant/DIFFCHANGE_INTERVAL i32 (i32.const 2016))
 (global $~lib/metashrew-as/assembly/utils/constant/COINBASE_MATURITY i32 (i32.const 100))
 (global $~lib/metashrew-as/assembly/utils/opcodes/OP_FALSE i32 (i32.const 0))
 (global $~lib/metashrew-as/assembly/utils/opcodes/OP_PUSHDATA1 i32 (i32.const 76))
 (global $~lib/metashrew-as/assembly/utils/opcodes/OP_PUSHDATA2 i32 (i32.const 77))
 (global $~lib/metashrew-as/assembly/utils/opcodes/OP_PUSHDATA4 i32 (i32.const 78))
 (global $~lib/metashrew-as/assembly/utils/opcodes/OP_IF i32 (i32.const 99))
 (global $~lib/metashrew-as/assembly/utils/opcodes/OP_NOTIF i32 (i32.const 100))
 (global $~lib/metashrew-as/assembly/utils/opcodes/OP_ELSE i32 (i32.const 103))
 (global $~lib/metashrew-as/assembly/utils/opcodes/OP_ENDIF i32 (i32.const 104))
 (global $~lib/metashrew-as/assembly/utils/opcodes/OP_VERIFY i32 (i32.const 105))
 (global $~lib/metashrew-as/assembly/utils/opcodes/OP_RETURN i32 (i32.const 106))
 (global $~lib/metashrew-as/assembly/utils/opcodes/OP_1 i32 (i32.const 81))
 (global $~lib/metashrew-as/assembly/blockdata/sat/Sat.SUPPLY (mut i64) (i64.const 2099999997690000))
 (global $~lib/metashrew-as/assembly/blockdata/epoch/Epoch.STARTING_SATS (mut i32) (i32.const 0))
 (global $~lib/metashrew-as/assembly/blockdata/epoch/Epoch.FIRST_POST_SUBSIDY (mut i32) (i32.const 0))
 (global $assembly/constants/JUBILEE_HEIGHT i32 (i32.const 824544))
 (global $assembly/index/SAT_TO_OUTPOINT (mut i32) (i32.const 0))
 (global $assembly/index/OUTPOINT_TO_SAT (mut i32) (i32.const 0))
 (global $assembly/index/OUTPOINT_TO_VALUE (mut i32) (i32.const 0))
 (global $assembly/index/OUTPOINT_TO_SEQUENCE_NUMBERS (mut i32) (i32.const 0))
 (global $assembly/index/HEIGHT_TO_BLOCKHASH (mut i32) (i32.const 0))
 (global $assembly/index/BLOCKHASH_TO_HEIGHT (mut i32) (i32.const 0))
 (global $assembly/index/STARTING_SAT (mut i32) (i32.const 0))
 (global $assembly/index/INSCRIPTION_ID_TO_INSCRIPTION (mut i32) (i32.const 0))
 (global $assembly/index/SATPOINT_TO_INSCRIPTION_ID (mut i32) (i32.const 0))
 (global $assembly/index/SATPOINT_TO_SAT (mut i32) (i32.const 0))
 (global $assembly/index/INSCRIPTION_ID_TO_SATPOINT (mut i32) (i32.const 0))
 (global $assembly/index/INSCRIPTION_ID_TO_BLOCKHEIGHT (mut i32) (i32.const 0))
 (global $assembly/index/HEIGHT_TO_INSCRIPTION_IDS (mut i32) (i32.const 0))
 (global $assembly/index/NEXT_SEQUENCE_NUMBER (mut i32) (i32.const 0))
 (global $assembly/index/SEQUENCE_NUMBER_TO_INSCRIPTION_ID (mut i32) (i32.const 0))
 (global $assembly/index/INSCRIPTION_ID_TO_SEQUENCE_NUMBER (mut i32) (i32.const 0))
 (global $~lib/native/ASC_SHRINK_LEVEL i32 (i32.const 0))
 (global $~lib/builtins/u32.MAX_VALUE i32 (i32.const -1))
 (global $~lib/number/U32.MAX_VALUE i32 (i32.const -1))
 (global $~lib/builtins/u16.MAX_VALUE i32 (i32.const 65535))
 (global $~lib/number/U16.MAX_VALUE i32 (i32.const 65535))
 (global $~lib/builtins/u8.MAX_VALUE i32 (i32.const 255))
 (global $~lib/number/U8.MAX_VALUE i32 (i32.const 255))
 (global $~lib/builtins/i32.MAX_VALUE i32 (i32.const 2147483647))
 (global $~lib/memory/__heap_base i32 (i32.const 5932))
 (memory $0 1 65335)
 (data $0 (i32.const 12) "\1c\02\00\00\00\00\00\00\00\00\00\00\04\00\00\00\00\02\00\00000102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f202122232425262728292a2b2c2d2e2f303132333435363738393a3b3c3d3e3f404142434445464748494a4b4c4d4e4f505152535455565758595a5b5c5d5e5f606162636465666768696a6b6c6d6e6f707172737475767778797a7b7c7d7e7f808182838485868788898a8b8c8d8e8f909192939495969798999a9b9c9d9e9fa0a1a2a3a4a5a6a7a8a9aaabacadaeafb0b1b2b3b4b5b6b7b8b9babbbcbdbebfc0c1c2c3c4c5c6c7c8c9cacbcccdcecfd0d1d2d3d4d5d6d7d8d9dadbdcdddedfe0e1e2e3e4e5e6e7e8e9eaebecedeeeff0f1f2f3f4f5f6f7f8f9fafbfcfdfeff\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $1 (i32.const 556) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00(\00\00\00A\00l\00l\00o\00c\00a\00t\00i\00o\00n\00 \00t\00o\00o\00 \00l\00a\00r\00g\00e\00\00\00\00\00")
 (data $2 (i32.const 620) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\1e\00\00\00~\00l\00i\00b\00/\00r\00t\00/\00s\00t\00u\00b\00.\00t\00s\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $3 (i32.const 684) "\1c\01\00\00\00\00\00\00\00\00\00\00\01\00\00\00\00\01\00\00\98/\8aB\91D7q\cf\fb\c0\b5\a5\db\b5\e9[\c2V9\f1\11\f1Y\a4\82?\92\d5^\1c\ab\98\aa\07\d8\01[\83\12\be\851$\c3}\0cUt]\ber\fe\b1\de\80\a7\06\dc\9bt\f1\9b\c1\c1i\9b\e4\86G\be\ef\c6\9d\c1\0f\cc\a1\0c$o,\e9-\aa\84tJ\dc\a9\b0\\\da\88\f9vRQ>\98m\c61\a8\c8\'\03\b0\c7\7fY\bf\f3\0b\e0\c6G\91\a7\d5Qc\ca\06g))\14\85\n\b7\'8!\1b.\fcm,M\13\r8STs\ne\bb\njv.\c9\c2\81\85,r\92\a1\e8\bf\a2Kf\1a\a8p\8bK\c2\a3Ql\c7\19\e8\92\d1$\06\99\d6\855\0e\f4p\a0j\10\16\c1\a4\19\08l7\1eLwH\'\b5\bc\b04\b3\0c\1c9J\aa\d8NO\ca\9c[\f3o.h\ee\82\8ftoc\a5x\14x\c8\84\08\02\c7\8c\fa\ff\be\90\eblP\a4\f7\a3\f9\be\f2xq\c6\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $4 (i32.const 972) ",\00\00\00\00\00\00\00\00\00\00\00\06\00\00\00\10\00\00\00\c0\02\00\00\c0\02\00\00\00\01\00\00@\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $5 (i32.const 1020) "\1c\01\00\00\00\00\00\00\00\00\00\00\01\00\00\00\00\01\00\00\98/\8a\c2\91D7q\cf\fb\c0\b5\a5\db\b5\e9[\c2V9\f1\11\f1Y\a4\82?\92\d5^\1c\ab\98\aa\07\d8\01[\83\12\be\851$\c3}\0cUt]\ber\fe\b1\de\80\a7\06\dc\9bt\f3\9b\c1\c1i\9bd\86G\fe\f0\c6\ed\e1\0fT\f2\0c$o4\e9O\be\84\c9l\1eA\b9a\fa\88\f9\16RQ\c6\f2mZ\8e\a8e\fc\19\b0\c7\9e\d9\b9\c31\12\9a\a0\ea\0e\e7+#\b1\fd\b0>5\c7\d5\bai0_m\97\cb\8f\11\0fZ\fd\ee\1e\dc\89\b65\n\04z\0b\de\9d\ca\f4X\16[]\e1\86>\7f\00\80\89\0872\ea\07\a57\95\abo\10a@\17\f1\d6\8c\rm;\aa\cd7\be\bb\c0\da;a\83c\a3H\db1\e9\02\0b\a7\\\d1o\ca\fa\1aR1\8431\95\1a\d4n\90xCm\f2\91\9c\c3\bd\ab\cc\9e\e6\a0\c9\b5<\b6/S\c6A\c7\d2\a3~#\07hK\95\a4v\1d\19L\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $6 (i32.const 1308) ",\00\00\00\00\00\00\00\00\00\00\00\06\00\00\00\10\00\00\00\10\04\00\00\10\04\00\00\00\01\00\00@\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $7 (i32.const 1356) ",\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\1c\00\00\00I\00n\00v\00a\00l\00i\00d\00 \00l\00e\00n\00g\00t\00h\00")
 (data $8 (i32.const 1404) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00&\00\00\00~\00l\00i\00b\00/\00a\00r\00r\00a\00y\00b\00u\00f\00f\00e\00r\00.\00t\00s\00\00\00\00\00\00\00")
 (data $9 (i32.const 1468) ",\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\14\00\00\00u\00s\00e\00 \00s\00t\00r\00i\00c\00t\00\00\00\00\00\00\00\00\00")
 (data $10 (i32.const 1516) "\1c\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\02\00\00\001\00\00\00\00\00\00\00\00\00\00\00")
 (data $11 (i32.const 1548) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00$\00\00\00U\00n\00p\00a\00i\00r\00e\00d\00 \00s\00u\00r\00r\00o\00g\00a\00t\00e\00\00\00\00\00\00\00\00\00")
 (data $12 (i32.const 1612) ",\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\1c\00\00\00~\00l\00i\00b\00/\00s\00t\00r\00i\00n\00g\00.\00t\00s\00")
 (data $13 (i32.const 1660) "\1c\01\00\00\00\00\00\00\00\00\00\00\04\00\00\00\00\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\0f\00\n\11\15\14\1a\1e\07\05\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\1d\00\18\r\19\t\08\17\00\12\16\1f\1b\13\00\01\00\03\10\0b\1c\0c\0e\06\04\02\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $14 (i32.const 1948) "<\00\00\00\00\00\00\00\00\00\00\00\04\00\00\00 \00\00\00qpzry9x8gf2tvdw0s3jn54khce6mua7l\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $15 (i32.const 2012) "L\00\00\00\00\00\00\00\00\00\00\00\04\00\00\00:\00\00\00123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz\00\00")
 (data $16 (i32.const 2092) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00$\00\00\00I\00n\00d\00e\00x\00 \00o\00u\00t\00 \00o\00f\00 \00r\00a\00n\00g\00e\00\00\00\00\00\00\00\00\00")
 (data $17 (i32.const 2156) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00&\00\00\00~\00l\00i\00b\00/\00s\00t\00a\00t\00i\00c\00a\00r\00r\00a\00y\00.\00t\00s\00\00\00\00\00\00\00")
 (data $18 (i32.const 2220) ",\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\1a\00\00\00~\00l\00i\00b\00/\00a\00r\00r\00a\00y\00.\00t\00s\00\00\00")
 (data $19 (i32.const 2268) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00*\00\00\00/\00o\00u\00t\00p\00o\00i\00n\00t\00/\00b\00y\00s\00a\00t\00r\00a\00n\00g\00e\00/\00\00\00")
 (data $20 (i32.const 2332) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\"\00\00\00/\00s\00a\00t\00/\00b\00y\00/\00o\00u\00t\00p\00o\00i\00n\00t\00/\00\00\00\00\00\00\00\00\00\00\00")
 (data $21 (i32.const 2396) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00$\00\00\00/\00v\00a\00l\00u\00e\00/\00b\00y\00o\00u\00t\00p\00o\00i\00n\00t\00/\00\00\00\00\00\00\00\00\00")
 (data $22 (i32.const 2460) "L\00\00\00\00\00\00\00\00\00\00\00\02\00\00\006\00\00\00/\00s\00e\00q\00u\00e\00n\00c\00e\00n\00u\00m\00b\00e\00r\00s\00/\00b\00y\00o\00u\00t\00p\00o\00i\00n\00t\00\00\00\00\00\00\00")
 (data $23 (i32.const 2540) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00(\00\00\00/\00b\00l\00o\00c\00k\00h\00a\00s\00h\00/\00b\00y\00h\00e\00i\00g\00h\00t\00/\00\00\00\00\00")
 (data $24 (i32.const 2604) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00(\00\00\00/\00h\00e\00i\00g\00h\00t\00/\00b\00y\00b\00l\00o\00c\00k\00h\00a\00s\00h\00/\00\00\00\00\00")
 (data $25 (i32.const 2668) ",\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\18\00\00\00/\00s\00t\00a\00r\00t\00i\00n\00g\00s\00a\00t\00\00\00\00\00")
 (data $26 (i32.const 2716) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00$\00\00\00/\00i\00n\00s\00c\00r\00i\00p\00t\00i\00o\00n\00/\00b\00y\00i\00d\00/\00\00\00\00\00\00\00\00\00")
 (data $27 (i32.const 2780) "L\00\00\00\00\00\00\00\00\00\00\00\02\00\00\002\00\00\00/\00i\00n\00s\00c\00r\00i\00p\00t\00i\00o\00n\00i\00d\00/\00b\00y\00s\00a\00t\00p\00o\00i\00n\00t\00\00\00\00\00\00\00\00\00\00\00")
 (data $28 (i32.const 2860) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\1e\00\00\00/\00s\00a\00t\00/\00b\00y\00s\00a\00t\00p\00o\00i\00n\00t\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $29 (i32.const 2924) "L\00\00\00\00\00\00\00\00\00\00\00\02\00\00\004\00\00\00/\00s\00a\00t\00p\00o\00i\00n\00t\00/\00b\00y\00i\00n\00s\00c\00r\00i\00p\00t\00i\00o\00n\00i\00d\00/\00\00\00\00\00\00\00\00\00")
 (data $30 (i32.const 3004) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00,\00\00\00/\00h\00e\00i\00g\00h\00t\00/\00b\00y\00i\00n\00s\00c\00r\00i\00p\00t\00i\00o\00n\00/\00")
 (data $31 (i32.const 3068) "L\00\00\00\00\00\00\00\00\00\00\00\02\00\00\002\00\00\00/\00i\00n\00s\00c\00r\00i\00p\00t\00i\00o\00n\00i\00d\00s\00/\00b\00y\00h\00e\00i\00g\00h\00t\00/\00\00\00\00\00\00\00\00\00\00\00")
 (data $32 (i32.const 3148) ",\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\1a\00\00\00/\00n\00e\00x\00t\00s\00e\00q\00u\00e\00n\00c\00e\00\00\00")
 (data $33 (i32.const 3196) "L\00\00\00\00\00\00\00\00\00\00\00\02\00\00\004\00\00\00/\00i\00n\00s\00c\00r\00i\00p\00t\00i\00o\00n\00i\00d\00/\00b\00y\00s\00e\00q\00u\00e\00n\00c\00e\00/\00\00\00\00\00\00\00\00\00")
 (data $34 (i32.const 3276) "L\00\00\00\00\00\00\00\00\00\00\00\02\00\00\004\00\00\00/\00s\00e\00q\00u\00e\00n\00c\00e\00/\00b\00y\00i\00n\00s\00c\00r\00i\00p\00t\00i\00o\00n\00i\00d\00/\00\00\00\00\00\00\00\00\00")
 (data $35 (i32.const 3356) "|\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00^\00\00\00E\00l\00e\00m\00e\00n\00t\00 \00t\00y\00p\00e\00 \00m\00u\00s\00t\00 \00b\00e\00 \00n\00u\00l\00l\00a\00b\00l\00e\00 \00i\00f\00 \00a\00r\00r\00a\00y\00 \00i\00s\00 \00h\00o\00l\00e\00y\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $36 (i32.const 3484) "\1c\00\00\00\00\00\00\00\00\00\00\00\1c\00\00\00\08\00\00\00\01\00\00\00\00\00\00\00\00\00\00\00")
 (data $37 (i32.const 3516) "\1c\00\00\00\00\00\00\00\00\00\00\00\1d\00\00\00\08\00\00\00\02\00\00\00\00\00\00\00\00\00\00\00")
 (data $38 (i32.const 3548) "\1c\00\00\00\00\00\00\00\00\00\00\00\1f\00\00\00\08\00\00\00\03\00\00\00\00\00\00\00\00\00\00\00")
 (data $39 (i32.const 3580) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00$\00\00\00K\00e\00y\00 \00d\00o\00e\00s\00 \00n\00o\00t\00 \00e\00x\00i\00s\00t\00\00\00\00\00\00\00\00\00")
 (data $40 (i32.const 3644) ",\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\16\00\00\00~\00l\00i\00b\00/\00m\00a\00p\00.\00t\00s\00\00\00\00\00\00\00")
 (data $41 (i32.const 3692) "\1c\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\n\00\00\00/\00m\00a\00s\00k\00\00\00")
 (data $42 (i32.const 3724) ",\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\0e\00\00\00/\00l\00e\00n\00g\00t\00h\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $43 (i32.const 3772) "\1c\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\02\00\00\00/\00\00\00\00\00\00\00\00\00\00\00")
 (data $44 (i32.const 3804) "|\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00d\00\00\00t\00o\00S\00t\00r\00i\00n\00g\00(\00)\00 \00r\00a\00d\00i\00x\00 \00a\00r\00g\00u\00m\00e\00n\00t\00 \00m\00u\00s\00t\00 \00b\00e\00 \00b\00e\00t\00w\00e\00e\00n\00 \002\00 \00a\00n\00d\00 \003\006\00\00\00\00\00\00\00\00\00")
 (data $45 (i32.const 3932) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00&\00\00\00~\00l\00i\00b\00/\00u\00t\00i\00l\00/\00n\00u\00m\00b\00e\00r\00.\00t\00s\00\00\00\00\00\00\00")
 (data $46 (i32.const 3996) "\1c\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\02\00\00\000\00\00\00\00\00\00\00\00\00\00\00")
 (data $47 (i32.const 4028) "0\000\000\001\000\002\000\003\000\004\000\005\000\006\000\007\000\008\000\009\001\000\001\001\001\002\001\003\001\004\001\005\001\006\001\007\001\008\001\009\002\000\002\001\002\002\002\003\002\004\002\005\002\006\002\007\002\008\002\009\003\000\003\001\003\002\003\003\003\004\003\005\003\006\003\007\003\008\003\009\004\000\004\001\004\002\004\003\004\004\004\005\004\006\004\007\004\008\004\009\005\000\005\001\005\002\005\003\005\004\005\005\005\006\005\007\005\008\005\009\006\000\006\001\006\002\006\003\006\004\006\005\006\006\006\007\006\008\006\009\007\000\007\001\007\002\007\003\007\004\007\005\007\006\007\007\007\008\007\009\008\000\008\001\008\002\008\003\008\004\008\005\008\006\008\007\008\008\008\009\009\000\009\001\009\002\009\003\009\004\009\005\009\006\009\007\009\008\009\009\00")
 (data $48 (i32.const 4428) "\1c\04\00\00\00\00\00\00\00\00\00\00\02\00\00\00\00\04\00\000\000\000\001\000\002\000\003\000\004\000\005\000\006\000\007\000\008\000\009\000\00a\000\00b\000\00c\000\00d\000\00e\000\00f\001\000\001\001\001\002\001\003\001\004\001\005\001\006\001\007\001\008\001\009\001\00a\001\00b\001\00c\001\00d\001\00e\001\00f\002\000\002\001\002\002\002\003\002\004\002\005\002\006\002\007\002\008\002\009\002\00a\002\00b\002\00c\002\00d\002\00e\002\00f\003\000\003\001\003\002\003\003\003\004\003\005\003\006\003\007\003\008\003\009\003\00a\003\00b\003\00c\003\00d\003\00e\003\00f\004\000\004\001\004\002\004\003\004\004\004\005\004\006\004\007\004\008\004\009\004\00a\004\00b\004\00c\004\00d\004\00e\004\00f\005\000\005\001\005\002\005\003\005\004\005\005\005\006\005\007\005\008\005\009\005\00a\005\00b\005\00c\005\00d\005\00e\005\00f\006\000\006\001\006\002\006\003\006\004\006\005\006\006\006\007\006\008\006\009\006\00a\006\00b\006\00c\006\00d\006\00e\006\00f\007\000\007\001\007\002\007\003\007\004\007\005\007\006\007\007\007\008\007\009\007\00a\007\00b\007\00c\007\00d\007\00e\007\00f\008\000\008\001\008\002\008\003\008\004\008\005\008\006\008\007\008\008\008\009\008\00a\008\00b\008\00c\008\00d\008\00e\008\00f\009\000\009\001\009\002\009\003\009\004\009\005\009\006\009\007\009\008\009\009\009\00a\009\00b\009\00c\009\00d\009\00e\009\00f\00a\000\00a\001\00a\002\00a\003\00a\004\00a\005\00a\006\00a\007\00a\008\00a\009\00a\00a\00a\00b\00a\00c\00a\00d\00a\00e\00a\00f\00b\000\00b\001\00b\002\00b\003\00b\004\00b\005\00b\006\00b\007\00b\008\00b\009\00b\00a\00b\00b\00b\00c\00b\00d\00b\00e\00b\00f\00c\000\00c\001\00c\002\00c\003\00c\004\00c\005\00c\006\00c\007\00c\008\00c\009\00c\00a\00c\00b\00c\00c\00c\00d\00c\00e\00c\00f\00d\000\00d\001\00d\002\00d\003\00d\004\00d\005\00d\006\00d\007\00d\008\00d\009\00d\00a\00d\00b\00d\00c\00d\00d\00d\00e\00d\00f\00e\000\00e\001\00e\002\00e\003\00e\004\00e\005\00e\006\00e\007\00e\008\00e\009\00e\00a\00e\00b\00e\00c\00e\00d\00e\00e\00e\00f\00f\000\00f\001\00f\002\00f\003\00f\004\00f\005\00f\006\00f\007\00f\008\00f\009\00f\00a\00f\00b\00f\00c\00f\00d\00f\00e\00f\00f\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $49 (i32.const 5484) "\\\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00H\00\00\000\001\002\003\004\005\006\007\008\009\00a\00b\00c\00d\00e\00f\00g\00h\00i\00j\00k\00l\00m\00n\00o\00p\00q\00r\00s\00t\00u\00v\00w\00x\00y\00z\00\00\00\00\00")
 (data $50 (i32.const 5580) "\1c\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $51 (i32.const 5612) "\1c\00\00\00\00\00\00\00\00\00\00\00&\00\00\00\08\00\00\00\04\00\00\00\00\00\00\00\00\00\00\00")
 (data $52 (i32.const 5644) "\1c\00\00\00\00\00\00\00\00\00\00\00\'\00\00\00\08\00\00\00\05\00\00\00\00\00\00\00\00\00\00\00")
 (data $53 (i32.const 5676) "\1c\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\06\00\00\00o\00r\00d\00\00\00\00\00\00\00")
 (data $54 (i32.const 5708) "\1c\00\00\00\00\00\00\00\00\00\00\00,\00\00\00\08\00\00\00\06\00\00\00\00\00\00\00\00\00\00\00")
 (data $55 (i32.const 5740) "\1c\00\00\00\00\00\00\00\00\00\00\000\00\00\00\08\00\00\00\07\00\00\00\00\00\00\00\00\00\00\00")
 (data $56 (i32.const 5772) "\1c\00\00\00\00\00\00\00\00\00\00\001\00\00\00\08\00\00\00\08\00\00\00\00\00\00\00\00\00\00\00")
 (data $57 (i32.const 5804) "\1c\00\00\00\00\00\00\00\00\00\00\002\00\00\00\08\00\00\00\t\00\00\00\00\00\00\00\00\00\00\00")
 (data $58 (i32.const 5836) "\1c\00\00\00\00\00\00\00\00\00\00\003\00\00\00\08\00\00\00\n\00\00\00\00\00\00\00\00\00\00\00")
 (data $59 (i32.const 5868) "\1c\00\00\00\00\00\00\00\00\00\00\003\00\00\00\08\00\00\00\0b\00\00\00\00\00\00\00\00\00\00\00")
 (data $60 (i32.const 5900) "\1c\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\02\00\00\00.\00\00\00\00\00\00\00\00\00\00\00")
 (table $0 12 12 funcref)
 (elem $0 (i32.const 1) $~lib/metashrew-as/assembly/utils/box/Box.concat~anonymous|0 $~lib/metashrew-as/assembly/utils/box/Box.concat~anonymous|1 $~lib/metashrew-as/assembly/utils/utils/concat~anonymous|0 $assembly/index/SatRanges.fromTransaction~anonymous|0 $assembly/index/SatRanges#pull~anonymous|0 $~lib/metashrew-as/assembly/blockdata/inscription/Inscription#toArrayBuffer~anonymous|0 $~lib/metashrew-as/assembly/indexer/index/_flush~anonymous|0 $~lib/metashrew-as/assembly/utils/rlp/toRLP~anonymous|0 $~lib/metashrew-as/assembly/utils/rlp/toRLP~anonymous|1 $~lib/metashrew-as/assembly/utils/rlp/toRLP~anonymous|2 $~lib/metashrew-as/assembly/utils/rlp/toRLP~anonymous|3)
 (export "_start" (func $assembly/index/_start))
 (export "sat" (func $assembly/index/sat))
 (export "inscription" (func $assembly/index/inscription))
 (export "content" (func $assembly/index/content))
 (export "inscriptionsfrom" (func $assembly/index/inscriptionsfrom))
 (export "inscriptionsforblock" (func $assembly/index/inscriptionsforblock))
 (export "output" (func $assembly/index/output))
 (export "memory" (memory $0))
 (start $~start)
 (func $~lib/rt/stub/maybeGrowMemory (param $newOffset i32)
  (local $pagesBefore i32)
  (local $maxOffset i32)
  (local $pagesNeeded i32)
  (local $4 i32)
  (local $5 i32)
  (local $pagesWanted i32)
  memory.size
  local.set $pagesBefore
  local.get $pagesBefore
  i32.const 16
  i32.shl
  i32.const 15
  i32.add
  i32.const 15
  i32.const -1
  i32.xor
  i32.and
  local.set $maxOffset
  local.get $newOffset
  local.get $maxOffset
  i32.gt_u
  if
   local.get $newOffset
   local.get $maxOffset
   i32.sub
   i32.const 65535
   i32.add
   i32.const 65535
   i32.const -1
   i32.xor
   i32.and
   i32.const 16
   i32.shr_u
   local.set $pagesNeeded
   local.get $pagesBefore
   local.tee $4
   local.get $pagesNeeded
   local.tee $5
   local.get $4
   local.get $5
   i32.gt_s
   select
   local.set $pagesWanted
   local.get $pagesWanted
   memory.grow
   i32.const 0
   i32.lt_s
   if
    local.get $pagesNeeded
    memory.grow
    i32.const 0
    i32.lt_s
    if
     unreachable
    end
   end
  end
  local.get $newOffset
  global.set $~lib/rt/stub/offset
 )
 (func $~lib/rt/common/BLOCK#set:mmInfo (param $this i32) (param $mmInfo i32)
  local.get $this
  local.get $mmInfo
  i32.store
 )
 (func $~lib/rt/stub/__alloc (param $size i32) (result i32)
  (local $block i32)
  (local $ptr i32)
  (local $size|3 i32)
  (local $payloadSize i32)
  local.get $size
  i32.const 1073741820
  i32.gt_u
  if
   i32.const 576
   i32.const 640
   i32.const 33
   i32.const 29
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/rt/stub/offset
  local.set $block
  global.get $~lib/rt/stub/offset
  i32.const 4
  i32.add
  local.set $ptr
  block $~lib/rt/stub/computeSize|inlined.0 (result i32)
   local.get $size
   local.set $size|3
   local.get $size|3
   i32.const 4
   i32.add
   i32.const 15
   i32.add
   i32.const 15
   i32.const -1
   i32.xor
   i32.and
   i32.const 4
   i32.sub
   br $~lib/rt/stub/computeSize|inlined.0
  end
  local.set $payloadSize
  local.get $ptr
  local.get $payloadSize
  i32.add
  call $~lib/rt/stub/maybeGrowMemory
  local.get $block
  local.get $payloadSize
  call $~lib/rt/common/BLOCK#set:mmInfo
  local.get $ptr
  return
 )
 (func $~lib/rt/common/OBJECT#set:gcInfo (param $this i32) (param $gcInfo i32)
  local.get $this
  local.get $gcInfo
  i32.store offset=4
 )
 (func $~lib/rt/common/OBJECT#set:gcInfo2 (param $this i32) (param $gcInfo2 i32)
  local.get $this
  local.get $gcInfo2
  i32.store offset=8
 )
 (func $~lib/rt/common/OBJECT#set:rtId (param $this i32) (param $rtId i32)
  local.get $this
  local.get $rtId
  i32.store offset=12
 )
 (func $~lib/rt/common/OBJECT#set:rtSize (param $this i32) (param $rtSize i32)
  local.get $this
  local.get $rtSize
  i32.store offset=16
 )
 (func $~lib/rt/stub/__new (param $size i32) (param $id i32) (result i32)
  (local $ptr i32)
  (local $object i32)
  local.get $size
  i32.const 1073741804
  i32.gt_u
  if
   i32.const 576
   i32.const 640
   i32.const 86
   i32.const 30
   call $~lib/builtins/abort
   unreachable
  end
  i32.const 16
  local.get $size
  i32.add
  call $~lib/rt/stub/__alloc
  local.set $ptr
  local.get $ptr
  i32.const 4
  i32.sub
  local.set $object
  local.get $object
  i32.const 0
  call $~lib/rt/common/OBJECT#set:gcInfo
  local.get $object
  i32.const 0
  call $~lib/rt/common/OBJECT#set:gcInfo2
  local.get $object
  local.get $id
  call $~lib/rt/common/OBJECT#set:rtId
  local.get $object
  local.get $size
  call $~lib/rt/common/OBJECT#set:rtSize
  local.get $ptr
  i32.const 16
  i32.add
  return
 )
 (func $~lib/object/Object#constructor (param $this i32) (result i32)
  local.get $this
  i32.eqz
  if
   i32.const 0
   i32.const 0
   call $~lib/rt/stub/__new
   local.set $this
  end
  local.get $this
 )
 (func $~lib/metashrew-as/assembly/utils/logging/Console#constructor (param $this i32) (result i32)
  local.get $this
  i32.eqz
  if
   i32.const 0
   i32.const 5
   call $~lib/rt/stub/__new
   local.set $this
  end
  local.get $this
  call $~lib/object/Object#constructor
  local.set $this
  local.get $this
 )
 (func $start:~lib/metashrew-as/assembly/utils/logging
  global.get $~lib/memory/__heap_base
  i32.const 4
  i32.add
  i32.const 15
  i32.add
  i32.const 15
  i32.const -1
  i32.xor
  i32.and
  i32.const 4
  i32.sub
  global.set $~lib/rt/stub/startOffset
  global.get $~lib/rt/stub/startOffset
  global.set $~lib/rt/stub/offset
  i32.const 0
  call $~lib/metashrew-as/assembly/utils/logging/Console#constructor
  global.set $~lib/metashrew-as/assembly/utils/logging/console
 )
 (func $start:~lib/metashrew-as/assembly/utils/rlp
  call $start:~lib/metashrew-as/assembly/utils/logging
 )
 (func $~lib/array/Array<u32>#get:dataStart (param $this i32) (result i32)
  local.get $this
  i32.load offset=4
 )
 (func $~lib/arraybuffer/ArrayBuffer#constructor (param $this i32) (param $length i32) (result i32)
  (local $buffer i32)
  local.get $length
  i32.const 1073741820
  i32.gt_u
  if
   i32.const 1376
   i32.const 1424
   i32.const 52
   i32.const 43
   call $~lib/builtins/abort
   unreachable
  end
  local.get $length
  i32.const 1
  call $~lib/rt/stub/__new
  local.set $buffer
  i32.const 0
  global.get $~lib/shared/runtime/Runtime.Incremental
  i32.ne
  drop
  local.get $buffer
  i32.const 0
  local.get $length
  memory.fill
  local.get $buffer
  return
 )
 (func $start:~lib/metashrew-as/assembly/utils/sha256
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  global.get $~lib/metashrew-as/assembly/utils/sha256/K
  call $~lib/array/Array<u32>#get:dataStart
  global.set $~lib/metashrew-as/assembly/utils/sha256/kPtr
  global.get $~lib/metashrew-as/assembly/utils/sha256/W64
  call $~lib/array/Array<u32>#get:dataStart
  global.set $~lib/metashrew-as/assembly/utils/sha256/w64Ptr
  i32.const 0
  i32.const 64
  call $~lib/arraybuffer/ArrayBuffer#constructor
  global.set $~lib/metashrew-as/assembly/utils/sha256/M
  global.get $~lib/metashrew-as/assembly/utils/sha256/M
  global.set $~lib/metashrew-as/assembly/utils/sha256/mPtr
  i32.const 0
  i32.const 256
  call $~lib/arraybuffer/ArrayBuffer#constructor
  global.set $~lib/metashrew-as/assembly/utils/sha256/W
  global.get $~lib/metashrew-as/assembly/utils/sha256/W
  global.set $~lib/metashrew-as/assembly/utils/sha256/wPtr
  i32.const 0
  global.get $~lib/metashrew-as/assembly/utils/sha256/INPUT_LENGTH
  call $~lib/arraybuffer/ArrayBuffer#constructor
  global.set $~lib/metashrew-as/assembly/utils/sha256/input
  global.get $~lib/metashrew-as/assembly/utils/sha256/input
  global.set $~lib/metashrew-as/assembly/utils/sha256/inputPtr
  i32.const 0
  global.get $~lib/metashrew-as/assembly/utils/sha256/DIGEST_LENGTH
  call $~lib/arraybuffer/ArrayBuffer#constructor
  global.set $~lib/metashrew-as/assembly/utils/sha256/output
  global.get $~lib/metashrew-as/assembly/utils/sha256/output
  global.set $~lib/metashrew-as/assembly/utils/sha256/outputPtr
 )
 (func $~lib/rt/stub/__link (param $parentPtr i32) (param $childPtr i32) (param $expectMultiple i32)
 )
 (func $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set:buckets" (param $this i32) (param $buckets i32)
  local.get $this
  local.get $buckets
  i32.store
  local.get $this
  local.get $buckets
  i32.const 0
  call $~lib/rt/stub/__link
 )
 (func $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set:bucketsMask" (param $this i32) (param $bucketsMask i32)
  local.get $this
  local.get $bucketsMask
  i32.store offset=4
 )
 (func $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set:entries" (param $this i32) (param $entries i32)
  local.get $this
  local.get $entries
  i32.store offset=8
  local.get $this
  local.get $entries
  i32.const 0
  call $~lib/rt/stub/__link
 )
 (func $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set:entriesCapacity" (param $this i32) (param $entriesCapacity i32)
  local.get $this
  local.get $entriesCapacity
  i32.store offset=12
 )
 (func $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set:entriesOffset" (param $this i32) (param $entriesOffset i32)
  local.get $this
  local.get $entriesOffset
  i32.store offset=16
 )
 (func $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set:entriesCount" (param $this i32) (param $entriesCount i32)
  local.get $this
  local.get $entriesCount
  i32.store offset=20
 )
 (func $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#constructor" (param $this i32) (result i32)
  local.get $this
  i32.eqz
  if
   i32.const 24
   i32.const 7
   call $~lib/rt/stub/__new
   local.set $this
  end
  local.get $this
  i32.const 0
  i32.const 4
  i32.const 4
  i32.mul
  call $~lib/arraybuffer/ArrayBuffer#constructor
  call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set:buckets"
  local.get $this
  i32.const 4
  i32.const 1
  i32.sub
  call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set:bucketsMask"
  local.get $this
  i32.const 0
  i32.const 4
  block $"~lib/map/ENTRY_SIZE<~lib/string/String,~lib/arraybuffer/ArrayBuffer>|inlined.0" (result i32)
   i32.const 12
   br $"~lib/map/ENTRY_SIZE<~lib/string/String,~lib/arraybuffer/ArrayBuffer>|inlined.0"
  end
  i32.mul
  call $~lib/arraybuffer/ArrayBuffer#constructor
  call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set:entries"
  local.get $this
  i32.const 4
  call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set:entriesCapacity"
  local.get $this
  i32.const 0
  call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set:entriesOffset"
  local.get $this
  i32.const 0
  call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set:entriesCount"
  local.get $this
 )
 (func $start:~lib/metashrew-as/assembly/indexer/index
  call $start:~lib/metashrew-as/assembly/utils/rlp
  call $start:~lib/metashrew-as/assembly/utils/sha256
  i32.const 0
  call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#constructor"
  global.set $~lib/metashrew-as/assembly/indexer/index/_updates
  i32.const 0
  call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#constructor"
  global.set $~lib/metashrew-as/assembly/indexer/index/_updateKeys
 )
 (func $~lib/metashrew-as/assembly/utils/yabsp/Console#constructor (param $this i32) (result i32)
  local.get $this
  i32.eqz
  if
   i32.const 0
   i32.const 8
   call $~lib/rt/stub/__new
   local.set $this
  end
  local.get $this
  call $~lib/object/Object#constructor
  local.set $this
  local.get $this
 )
 (func $start:~lib/metashrew-as/assembly/utils/yabsp
  i32.const 0
  call $~lib/metashrew-as/assembly/utils/yabsp/Console#constructor
  global.set $~lib/metashrew-as/assembly/utils/yabsp/console
 )
 (func $~lib/rt/common/OBJECT#get:rtSize (param $this i32) (result i32)
  local.get $this
  i32.load offset=16
 )
 (func $~lib/string/String.UTF8.byteLength (param $str i32) (param $nullTerminated i32) (result i32)
  (local $strOff i32)
  (local $strEnd i32)
  (local $bufLen i32)
  (local $c1 i32)
  local.get $str
  local.set $strOff
  local.get $strOff
  local.get $str
  i32.const 20
  i32.sub
  call $~lib/rt/common/OBJECT#get:rtSize
  i32.add
  local.set $strEnd
  local.get $nullTerminated
  i32.const 0
  i32.ne
  local.set $bufLen
  block $while-break|0
   loop $while-continue|0
    local.get $strOff
    local.get $strEnd
    i32.lt_u
    if
     local.get $strOff
     i32.load16_u
     local.set $c1
     local.get $c1
     i32.const 128
     i32.lt_u
     if
      local.get $nullTerminated
      local.get $c1
      i32.eqz
      i32.and
      if
       br $while-break|0
      end
      local.get $bufLen
      i32.const 1
      i32.add
      local.set $bufLen
     else
      local.get $c1
      i32.const 2048
      i32.lt_u
      if
       local.get $bufLen
       i32.const 2
       i32.add
       local.set $bufLen
      else
       local.get $c1
       i32.const 64512
       i32.and
       i32.const 55296
       i32.eq
       if (result i32)
        local.get $strOff
        i32.const 2
        i32.add
        local.get $strEnd
        i32.lt_u
       else
        i32.const 0
       end
       if
        local.get $strOff
        i32.load16_u offset=2
        i32.const 64512
        i32.and
        i32.const 56320
        i32.eq
        if
         local.get $bufLen
         i32.const 4
         i32.add
         local.set $bufLen
         local.get $strOff
         i32.const 4
         i32.add
         local.set $strOff
         br $while-continue|0
        end
       end
       local.get $bufLen
       i32.const 3
       i32.add
       local.set $bufLen
      end
     end
     local.get $strOff
     i32.const 2
     i32.add
     local.set $strOff
     br $while-continue|0
    end
   end
  end
  local.get $bufLen
  return
 )
 (func $~lib/string/String#get:length (param $this i32) (result i32)
  local.get $this
  i32.const 20
  i32.sub
  call $~lib/rt/common/OBJECT#get:rtSize
  i32.const 1
  i32.shr_u
  return
 )
 (func $~lib/string/String.UTF8.encodeUnsafe (param $str i32) (param $len i32) (param $buf i32) (param $nullTerminated i32) (param $errorMode i32) (result i32)
  (local $strEnd i32)
  (local $bufOff i32)
  (local $c1 i32)
  (local $b0 i32)
  (local $b1 i32)
  (local $c2 i32)
  (local $b0|11 i32)
  (local $b1|12 i32)
  (local $b2 i32)
  (local $b3 i32)
  (local $b0|15 i32)
  (local $b1|16 i32)
  (local $b2|17 i32)
  (local $18 i32)
  local.get $str
  local.get $len
  i32.const 1
  i32.shl
  i32.add
  local.set $strEnd
  local.get $buf
  local.set $bufOff
  loop $while-continue|0
   local.get $str
   local.get $strEnd
   i32.lt_u
   if
    local.get $str
    i32.load16_u
    local.set $c1
    local.get $c1
    i32.const 128
    i32.lt_u
    if
     local.get $bufOff
     local.get $c1
     i32.store8
     local.get $bufOff
     i32.const 1
     i32.add
     local.set $bufOff
     local.get $nullTerminated
     local.get $c1
     i32.eqz
     i32.and
     if
      local.get $bufOff
      local.get $buf
      i32.sub
      return
     end
    else
     local.get $c1
     i32.const 2048
     i32.lt_u
     if
      local.get $c1
      i32.const 6
      i32.shr_u
      i32.const 192
      i32.or
      local.set $b0
      local.get $c1
      i32.const 63
      i32.and
      i32.const 128
      i32.or
      local.set $b1
      local.get $bufOff
      local.get $b1
      i32.const 8
      i32.shl
      local.get $b0
      i32.or
      i32.store16
      local.get $bufOff
      i32.const 2
      i32.add
      local.set $bufOff
     else
      local.get $c1
      i32.const 63488
      i32.and
      i32.const 55296
      i32.eq
      if
       local.get $c1
       i32.const 56320
       i32.lt_u
       if (result i32)
        local.get $str
        i32.const 2
        i32.add
        local.get $strEnd
        i32.lt_u
       else
        i32.const 0
       end
       if
        local.get $str
        i32.load16_u offset=2
        local.set $c2
        local.get $c2
        i32.const 64512
        i32.and
        i32.const 56320
        i32.eq
        if
         i32.const 65536
         local.get $c1
         i32.const 1023
         i32.and
         i32.const 10
         i32.shl
         i32.add
         local.get $c2
         i32.const 1023
         i32.and
         i32.or
         local.set $c1
         local.get $c1
         i32.const 18
         i32.shr_u
         i32.const 240
         i32.or
         local.set $b0|11
         local.get $c1
         i32.const 12
         i32.shr_u
         i32.const 63
         i32.and
         i32.const 128
         i32.or
         local.set $b1|12
         local.get $c1
         i32.const 6
         i32.shr_u
         i32.const 63
         i32.and
         i32.const 128
         i32.or
         local.set $b2
         local.get $c1
         i32.const 63
         i32.and
         i32.const 128
         i32.or
         local.set $b3
         local.get $bufOff
         local.get $b3
         i32.const 24
         i32.shl
         local.get $b2
         i32.const 16
         i32.shl
         i32.or
         local.get $b1|12
         i32.const 8
         i32.shl
         i32.or
         local.get $b0|11
         i32.or
         i32.store
         local.get $bufOff
         i32.const 4
         i32.add
         local.set $bufOff
         local.get $str
         i32.const 4
         i32.add
         local.set $str
         br $while-continue|0
        end
       end
       local.get $errorMode
       i32.const 0
       i32.ne
       if
        local.get $errorMode
        i32.const 2
        i32.eq
        if
         i32.const 1568
         i32.const 1632
         i32.const 742
         i32.const 49
         call $~lib/builtins/abort
         unreachable
        end
        i32.const 65533
        local.set $c1
       end
      end
      local.get $c1
      i32.const 12
      i32.shr_u
      i32.const 224
      i32.or
      local.set $b0|15
      local.get $c1
      i32.const 6
      i32.shr_u
      i32.const 63
      i32.and
      i32.const 128
      i32.or
      local.set $b1|16
      local.get $c1
      i32.const 63
      i32.and
      i32.const 128
      i32.or
      local.set $b2|17
      local.get $bufOff
      local.get $b1|16
      i32.const 8
      i32.shl
      local.get $b0|15
      i32.or
      i32.store16
      local.get $bufOff
      local.get $b2|17
      i32.store8 offset=2
      local.get $bufOff
      i32.const 3
      i32.add
      local.set $bufOff
     end
    end
    local.get $str
    i32.const 2
    i32.add
    local.set $str
    br $while-continue|0
   end
  end
  local.get $nullTerminated
  if
   local.get $bufOff
   local.tee $18
   i32.const 1
   i32.add
   local.set $bufOff
   local.get $18
   i32.const 0
   i32.store8
  end
  local.get $bufOff
  local.get $buf
  i32.sub
  return
 )
 (func $~lib/string/String.UTF8.encode (param $str i32) (param $nullTerminated i32) (param $errorMode i32) (result i32)
  (local $buf i32)
  local.get $str
  local.get $nullTerminated
  call $~lib/string/String.UTF8.byteLength
  i32.const 1
  call $~lib/rt/stub/__new
  local.set $buf
  local.get $str
  local.get $str
  call $~lib/string/String#get:length
  local.get $buf
  local.get $nullTerminated
  local.get $errorMode
  call $~lib/string/String.UTF8.encodeUnsafe
  drop
  local.get $buf
  return
 )
 (func $~lib/string/String.UTF8.encode@varargs (param $str i32) (param $nullTerminated i32) (param $errorMode i32) (result i32)
  block $2of2
   block $1of2
    block $0of2
     block $outOfRange
      global.get $~argumentsLength
      i32.const 1
      i32.sub
      br_table $0of2 $1of2 $2of2 $outOfRange
     end
     unreachable
    end
    i32.const 0
    local.set $nullTerminated
   end
   i32.const 0
   local.set $errorMode
  end
  local.get $str
  local.get $nullTerminated
  local.get $errorMode
  call $~lib/string/String.UTF8.encode
 )
 (func $start:~lib/metashrew-as/assembly/utils/b32
  (local $0 i32)
  (local $1 i32)
  i32.const 1488
  drop
  i32.const 1536
  i32.const 0
  i32.const 1
  global.set $~argumentsLength
  i32.const 0
  call $~lib/string/String.UTF8.encode@varargs
  global.set $~lib/metashrew-as/assembly/utils/b32/ONE
 )
 (func $~lib/staticarray/StaticArray<u8>#get:length (param $this i32) (result i32)
  local.get $this
  i32.const 20
  i32.sub
  call $~lib/rt/common/OBJECT#get:rtSize
  i32.const 0
  i32.shr_u
  return
 )
 (func $~lib/staticarray/StaticArray<u8>#__get (param $this i32) (param $index i32) (result i32)
  (local $value i32)
  local.get $index
  local.get $this
  call $~lib/staticarray/StaticArray<u8>#get:length
  i32.ge_u
  if
   i32.const 2112
   i32.const 2176
   i32.const 78
   i32.const 41
   call $~lib/builtins/abort
   unreachable
  end
  local.get $this
  local.get $index
  i32.const 0
  i32.shl
  i32.add
  i32.load8_u
  local.set $value
  i32.const 0
  drop
  local.get $value
  return
 )
 (func $start:~lib/metashrew-as/assembly/utils/b58
  (local $0 i32)
  i32.const 1488
  drop
  global.get $~lib/metashrew-as/assembly/utils/b58/ALPHABET
  i32.const 0
  call $~lib/staticarray/StaticArray<u8>#__get
  global.set $~lib/metashrew-as/assembly/utils/b58/LEADER
 )
 (func $start:~lib/metashrew-as/assembly/blockdata/address
  call $start:~lib/metashrew-as/assembly/utils/b32
  call $start:~lib/metashrew-as/assembly/utils/b58
 )
 (func $start:~lib/metashrew-as/assembly/blockdata/transaction
  call $start:~lib/metashrew-as/assembly/utils/yabsp
  call $start:~lib/metashrew-as/assembly/blockdata/address
 )
 (func $start:~lib/metashrew-as/assembly/blockdata/block
  call $start:~lib/metashrew-as/assembly/blockdata/transaction
 )
 (func $~lib/metashrew-as/assembly/blockdata/sat/Sat#set:_idx (param $this i32) (param $_idx i64)
  local.get $this
  local.get $_idx
  i64.store
 )
 (func $~lib/metashrew-as/assembly/blockdata/sat/Sat#constructor (param $this i32) (param $idx i64) (result i32)
  local.get $this
  i32.eqz
  if
   i32.const 8
   i32.const 9
   call $~lib/rt/stub/__new
   local.set $this
  end
  local.get $this
  i64.const 0
  call $~lib/metashrew-as/assembly/blockdata/sat/Sat#set:_idx
  local.get $this
  local.get $idx
  call $~lib/metashrew-as/assembly/blockdata/sat/Sat#set:_idx
  local.get $this
 )
 (func $~lib/rt/__newBuffer (param $size i32) (param $id i32) (param $data i32) (result i32)
  (local $buffer i32)
  local.get $size
  local.get $id
  call $~lib/rt/stub/__new
  local.set $buffer
  local.get $data
  if
   local.get $buffer
   local.get $data
   local.get $size
   memory.copy
  end
  local.get $buffer
  return
 )
 (func $~lib/rt/__newArray (param $length i32) (param $alignLog2 i32) (param $id i32) (param $data i32) (result i32)
  (local $bufferSize i32)
  (local $buffer i32)
  (local $array i32)
  local.get $length
  local.get $alignLog2
  i32.shl
  local.set $bufferSize
  local.get $bufferSize
  i32.const 1
  local.get $data
  call $~lib/rt/__newBuffer
  local.set $buffer
  i32.const 16
  local.get $id
  call $~lib/rt/stub/__new
  local.set $array
  local.get $array
  local.get $buffer
  i32.store
  local.get $array
  local.get $buffer
  i32.const 0
  call $~lib/rt/stub/__link
  local.get $array
  local.get $buffer
  i32.store offset=4
  local.get $array
  local.get $bufferSize
  i32.store offset=8
  local.get $array
  local.get $length
  i32.store offset=12
  local.get $array
  return
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/sat/Sat>#get:length_ (param $this i32) (result i32)
  local.get $this
  i32.load offset=12
 )
 (func $~lib/arraybuffer/ArrayBufferView#get:byteLength (param $this i32) (result i32)
  local.get $this
  i32.load offset=8
 )
 (func $~lib/arraybuffer/ArrayBufferView#get:buffer (param $this i32) (result i32)
  local.get $this
  i32.load
 )
 (func $~lib/rt/common/BLOCK#get:mmInfo (param $this i32) (result i32)
  local.get $this
  i32.load
 )
 (func $~lib/rt/stub/__realloc (param $ptr i32) (param $size i32) (result i32)
  (local $block i32)
  (local $actualSize i32)
  (local $isLast i32)
  (local $size|5 i32)
  (local $payloadSize i32)
  (local $7 i32)
  (local $8 i32)
  (local $newPtr i32)
  local.get $ptr
  i32.const 0
  i32.ne
  if (result i32)
   local.get $ptr
   i32.const 15
   i32.and
   i32.eqz
  else
   i32.const 0
  end
  i32.eqz
  if
   i32.const 0
   i32.const 640
   i32.const 45
   i32.const 3
   call $~lib/builtins/abort
   unreachable
  end
  local.get $ptr
  i32.const 4
  i32.sub
  local.set $block
  local.get $block
  call $~lib/rt/common/BLOCK#get:mmInfo
  local.set $actualSize
  local.get $ptr
  local.get $actualSize
  i32.add
  global.get $~lib/rt/stub/offset
  i32.eq
  local.set $isLast
  block $~lib/rt/stub/computeSize|inlined.1 (result i32)
   local.get $size
   local.set $size|5
   local.get $size|5
   i32.const 4
   i32.add
   i32.const 15
   i32.add
   i32.const 15
   i32.const -1
   i32.xor
   i32.and
   i32.const 4
   i32.sub
   br $~lib/rt/stub/computeSize|inlined.1
  end
  local.set $payloadSize
  local.get $size
  local.get $actualSize
  i32.gt_u
  if
   local.get $isLast
   if
    local.get $size
    i32.const 1073741820
    i32.gt_u
    if
     i32.const 576
     i32.const 640
     i32.const 52
     i32.const 33
     call $~lib/builtins/abort
     unreachable
    end
    local.get $ptr
    local.get $payloadSize
    i32.add
    call $~lib/rt/stub/maybeGrowMemory
    local.get $block
    local.get $payloadSize
    call $~lib/rt/common/BLOCK#set:mmInfo
   else
    local.get $payloadSize
    local.tee $7
    local.get $actualSize
    i32.const 1
    i32.shl
    local.tee $8
    local.get $7
    local.get $8
    i32.gt_u
    select
    call $~lib/rt/stub/__alloc
    local.set $newPtr
    local.get $newPtr
    local.get $ptr
    local.get $actualSize
    memory.copy
    local.get $newPtr
    local.tee $ptr
    i32.const 4
    i32.sub
    local.set $block
   end
  else
   local.get $isLast
   if
    local.get $ptr
    local.get $payloadSize
    i32.add
    global.set $~lib/rt/stub/offset
    local.get $block
    local.get $payloadSize
    call $~lib/rt/common/BLOCK#set:mmInfo
   end
  end
  local.get $ptr
  return
 )
 (func $~lib/rt/stub/__renew (param $oldPtr i32) (param $size i32) (result i32)
  (local $newPtr i32)
  local.get $size
  i32.const 1073741804
  i32.gt_u
  if
   i32.const 576
   i32.const 640
   i32.const 99
   i32.const 30
   call $~lib/builtins/abort
   unreachable
  end
  local.get $oldPtr
  i32.const 16
  i32.sub
  i32.const 16
  local.get $size
  i32.add
  call $~lib/rt/stub/__realloc
  local.set $newPtr
  local.get $newPtr
  i32.const 4
  i32.sub
  local.get $size
  call $~lib/rt/common/OBJECT#set:rtSize
  local.get $newPtr
  i32.const 16
  i32.add
  return
 )
 (func $~lib/array/ensureCapacity (param $array i32) (param $newSize i32) (param $alignLog2 i32) (param $canGrow i32)
  (local $oldCapacity i32)
  (local $oldData i32)
  (local $6 i32)
  (local $7 i32)
  (local $newCapacity i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (local $12 i32)
  (local $newData i32)
  local.get $array
  call $~lib/arraybuffer/ArrayBufferView#get:byteLength
  local.set $oldCapacity
  local.get $newSize
  local.get $oldCapacity
  local.get $alignLog2
  i32.shr_u
  i32.gt_u
  if
   local.get $newSize
   i32.const 1073741820
   local.get $alignLog2
   i32.shr_u
   i32.gt_u
   if
    i32.const 1376
    i32.const 2240
    i32.const 19
    i32.const 48
    call $~lib/builtins/abort
    unreachable
   end
   local.get $array
   call $~lib/arraybuffer/ArrayBufferView#get:buffer
   local.set $oldData
   local.get $newSize
   local.tee $6
   i32.const 8
   local.tee $7
   local.get $6
   local.get $7
   i32.gt_u
   select
   local.get $alignLog2
   i32.shl
   local.set $newCapacity
   local.get $canGrow
   if
    local.get $oldCapacity
    i32.const 1
    i32.shl
    local.tee $9
    i32.const 1073741820
    local.tee $10
    local.get $9
    local.get $10
    i32.lt_u
    select
    local.tee $11
    local.get $newCapacity
    local.tee $12
    local.get $11
    local.get $12
    i32.gt_u
    select
    local.set $newCapacity
   end
   local.get $oldData
   local.get $newCapacity
   call $~lib/rt/stub/__renew
   local.set $newData
   i32.const 0
   global.get $~lib/shared/runtime/Runtime.Incremental
   i32.ne
   drop
   local.get $newData
   local.get $oldCapacity
   i32.add
   i32.const 0
   local.get $newCapacity
   local.get $oldCapacity
   i32.sub
   memory.fill
   local.get $newData
   local.get $oldData
   i32.ne
   if
    local.get $array
    local.get $newData
    i32.store
    local.get $array
    local.get $newData
    i32.store offset=4
    local.get $array
    local.get $newData
    i32.const 0
    call $~lib/rt/stub/__link
   end
   local.get $array
   local.get $newCapacity
   i32.store offset=8
  end
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/sat/Sat>#set:length_ (param $this i32) (param $length_ i32)
  local.get $this
  local.get $length_
  i32.store offset=12
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/sat/Sat>#get:dataStart (param $this i32) (result i32)
  local.get $this
  i32.load offset=4
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/sat/Sat>#__set (param $this i32) (param $index i32) (param $value i32)
  local.get $index
  local.get $this
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/sat/Sat>#get:length_
  i32.ge_u
  if
   local.get $index
   i32.const 0
   i32.lt_s
   if
    i32.const 2112
    i32.const 2240
    i32.const 130
    i32.const 22
    call $~lib/builtins/abort
    unreachable
   end
   local.get $this
   local.get $index
   i32.const 1
   i32.add
   i32.const 2
   i32.const 1
   call $~lib/array/ensureCapacity
   local.get $this
   local.get $index
   i32.const 1
   i32.add
   call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/sat/Sat>#set:length_
  end
  local.get $this
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/sat/Sat>#get:dataStart
  local.get $index
  i32.const 2
  i32.shl
  i32.add
  local.get $value
  i32.store
  i32.const 1
  drop
  local.get $this
  local.get $value
  i32.const 1
  call $~lib/rt/stub/__link
 )
 (func $~lib/metashrew-as/assembly/blockdata/epoch/Epoch#set:idx (param $this i32) (param $idx i32)
  local.get $this
  local.get $idx
  i32.store
 )
 (func $~lib/metashrew-as/assembly/blockdata/epoch/Epoch#constructor (param $this i32) (param $idx i32) (result i32)
  local.get $this
  i32.eqz
  if
   i32.const 4
   i32.const 12
   call $~lib/rt/stub/__new
   local.set $this
  end
  local.get $this
  i32.const 0
  call $~lib/metashrew-as/assembly/blockdata/epoch/Epoch#set:idx
  local.get $this
  local.get $idx
  call $~lib/metashrew-as/assembly/blockdata/epoch/Epoch#set:idx
  local.get $this
 )
 (func $start:~lib/metashrew-as/assembly/blockdata/epoch
  (local $0 i32)
  (local $1 i32)
  i32.const 34
  i32.const 2
  i32.const 10
  i32.const 0
  call $~lib/rt/__newArray
  local.set $0
  local.get $0
  i32.load offset=4
  local.set $1
  local.get $0
  i32.const 0
  i32.const 0
  i64.const 0
  call $~lib/metashrew-as/assembly/blockdata/sat/Sat#constructor
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/sat/Sat>#__set
  local.get $0
  i32.const 1
  i32.const 0
  i64.const 1050000000000000
  call $~lib/metashrew-as/assembly/blockdata/sat/Sat#constructor
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/sat/Sat>#__set
  local.get $0
  i32.const 2
  i32.const 0
  i64.const 1575000000000000
  call $~lib/metashrew-as/assembly/blockdata/sat/Sat#constructor
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/sat/Sat>#__set
  local.get $0
  i32.const 3
  i32.const 0
  i64.const 1837500000000000
  call $~lib/metashrew-as/assembly/blockdata/sat/Sat#constructor
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/sat/Sat>#__set
  local.get $0
  i32.const 4
  i32.const 0
  i64.const 1968750000000000
  call $~lib/metashrew-as/assembly/blockdata/sat/Sat#constructor
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/sat/Sat>#__set
  local.get $0
  i32.const 5
  i32.const 0
  i64.const 2034375000000000
  call $~lib/metashrew-as/assembly/blockdata/sat/Sat#constructor
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/sat/Sat>#__set
  local.get $0
  i32.const 6
  i32.const 0
  i64.const 2067187500000000
  call $~lib/metashrew-as/assembly/blockdata/sat/Sat#constructor
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/sat/Sat>#__set
  local.get $0
  i32.const 7
  i32.const 0
  i64.const 2083593750000000
  call $~lib/metashrew-as/assembly/blockdata/sat/Sat#constructor
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/sat/Sat>#__set
  local.get $0
  i32.const 8
  i32.const 0
  i64.const 2091796875000000
  call $~lib/metashrew-as/assembly/blockdata/sat/Sat#constructor
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/sat/Sat>#__set
  local.get $0
  i32.const 9
  i32.const 0
  i64.const 2095898437500000
  call $~lib/metashrew-as/assembly/blockdata/sat/Sat#constructor
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/sat/Sat>#__set
  local.get $0
  i32.const 10
  i32.const 0
  i64.const 2097949218750000
  call $~lib/metashrew-as/assembly/blockdata/sat/Sat#constructor
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/sat/Sat>#__set
  local.get $0
  i32.const 11
  i32.const 0
  i64.const 2098974609270000
  call $~lib/metashrew-as/assembly/blockdata/sat/Sat#constructor
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/sat/Sat>#__set
  local.get $0
  i32.const 12
  i32.const 0
  i64.const 2099487304530000
  call $~lib/metashrew-as/assembly/blockdata/sat/Sat#constructor
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/sat/Sat>#__set
  local.get $0
  i32.const 13
  i32.const 0
  i64.const 2099743652160000
  call $~lib/metashrew-as/assembly/blockdata/sat/Sat#constructor
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/sat/Sat>#__set
  local.get $0
  i32.const 14
  i32.const 0
  i64.const 2099871825870000
  call $~lib/metashrew-as/assembly/blockdata/sat/Sat#constructor
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/sat/Sat>#__set
  local.get $0
  i32.const 15
  i32.const 0
  i64.const 2099935912620000
  call $~lib/metashrew-as/assembly/blockdata/sat/Sat#constructor
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/sat/Sat>#__set
  local.get $0
  i32.const 16
  i32.const 0
  i64.const 2099967955890000
  call $~lib/metashrew-as/assembly/blockdata/sat/Sat#constructor
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/sat/Sat>#__set
  local.get $0
  i32.const 17
  i32.const 0
  i64.const 2099983977420000
  call $~lib/metashrew-as/assembly/blockdata/sat/Sat#constructor
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/sat/Sat>#__set
  local.get $0
  i32.const 18
  i32.const 0
  i64.const 2099991988080000
  call $~lib/metashrew-as/assembly/blockdata/sat/Sat#constructor
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/sat/Sat>#__set
  local.get $0
  i32.const 19
  i32.const 0
  i64.const 2099995993410000
  call $~lib/metashrew-as/assembly/blockdata/sat/Sat#constructor
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/sat/Sat>#__set
  local.get $0
  i32.const 20
  i32.const 0
  i64.const 2099997995970000
  call $~lib/metashrew-as/assembly/blockdata/sat/Sat#constructor
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/sat/Sat>#__set
  local.get $0
  i32.const 21
  i32.const 0
  i64.const 2099998997250000
  call $~lib/metashrew-as/assembly/blockdata/sat/Sat#constructor
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/sat/Sat>#__set
  local.get $0
  i32.const 22
  i32.const 0
  i64.const 2099999497890000
  call $~lib/metashrew-as/assembly/blockdata/sat/Sat#constructor
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/sat/Sat>#__set
  local.get $0
  i32.const 23
  i32.const 0
  i64.const 2099999748210000
  call $~lib/metashrew-as/assembly/blockdata/sat/Sat#constructor
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/sat/Sat>#__set
  local.get $0
  i32.const 24
  i32.const 0
  i64.const 2099999873370000
  call $~lib/metashrew-as/assembly/blockdata/sat/Sat#constructor
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/sat/Sat>#__set
  local.get $0
  i32.const 25
  i32.const 0
  i64.const 2099999935950000
  call $~lib/metashrew-as/assembly/blockdata/sat/Sat#constructor
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/sat/Sat>#__set
  local.get $0
  i32.const 26
  i32.const 0
  i64.const 2099999967240000
  call $~lib/metashrew-as/assembly/blockdata/sat/Sat#constructor
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/sat/Sat>#__set
  local.get $0
  i32.const 27
  i32.const 0
  i64.const 2099999982780000
  call $~lib/metashrew-as/assembly/blockdata/sat/Sat#constructor
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/sat/Sat>#__set
  local.get $0
  i32.const 28
  i32.const 0
  i64.const 2099999990550000
  call $~lib/metashrew-as/assembly/blockdata/sat/Sat#constructor
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/sat/Sat>#__set
  local.get $0
  i32.const 29
  i32.const 0
  i64.const 2099999994330000
  call $~lib/metashrew-as/assembly/blockdata/sat/Sat#constructor
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/sat/Sat>#__set
  local.get $0
  i32.const 30
  i32.const 0
  i64.const 2099999996220000
  call $~lib/metashrew-as/assembly/blockdata/sat/Sat#constructor
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/sat/Sat>#__set
  local.get $0
  i32.const 31
  i32.const 0
  i64.const 2099999997060000
  call $~lib/metashrew-as/assembly/blockdata/sat/Sat#constructor
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/sat/Sat>#__set
  local.get $0
  i32.const 32
  i32.const 0
  i64.const 2099999997480000
  call $~lib/metashrew-as/assembly/blockdata/sat/Sat#constructor
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/sat/Sat>#__set
  local.get $0
  i32.const 33
  i32.const 0
  global.get $~lib/metashrew-as/assembly/blockdata/sat/Sat.SUPPLY
  call $~lib/metashrew-as/assembly/blockdata/sat/Sat#constructor
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/sat/Sat>#__set
  local.get $0
  global.set $~lib/metashrew-as/assembly/blockdata/epoch/Epoch.STARTING_SATS
  i32.const 0
  i32.const 33
  call $~lib/metashrew-as/assembly/blockdata/epoch/Epoch#constructor
  global.set $~lib/metashrew-as/assembly/blockdata/epoch/Epoch.FIRST_POST_SUBSIDY
 )
 (func $start:~lib/metashrew-as/assembly/blockdata/height
  call $start:~lib/metashrew-as/assembly/blockdata/epoch
 )
 (func $~lib/metashrew-as/assembly/indexer/tables/IndexPointer.wrap (param $pointer i32) (result i32)
  local.get $pointer
  return
 )
 (func $~lib/metashrew-as/assembly/indexer/tables/IndexPointer.for (param $keyword i32) (result i32)
  local.get $keyword
  i32.const 0
  i32.const 1
  global.set $~argumentsLength
  i32.const 0
  call $~lib/string/String.UTF8.encode@varargs
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer.wrap
  return
 )
 (func $~lib/metashrew-as/assembly/indexer/bst/BST<u64>#set:ptr (param $this i32) (param $ptr i32)
  local.get $this
  local.get $ptr
  i32.store
 )
 (func $~lib/metashrew-as/assembly/indexer/bst/BST<u64>#constructor (param $this i32) (param $ptr i32) (result i32)
  local.get $this
  i32.eqz
  if
   i32.const 4
   i32.const 13
   call $~lib/rt/stub/__new
   local.set $this
  end
  local.get $this
  i32.const 0
  call $~lib/metashrew-as/assembly/indexer/bst/BST<u64>#set:ptr
  local.get $this
  local.get $ptr
  call $~lib/metashrew-as/assembly/indexer/bst/BST<u64>#set:ptr
  local.get $this
 )
 (func $~lib/metashrew-as/assembly/indexer/bst/BST.at<u64> (param $key i32) (result i32)
  i32.const 0
  local.get $key
  call $~lib/metashrew-as/assembly/indexer/bst/BST<u64>#constructor
  return
 )
 (func $start:assembly/index
  call $start:~lib/metashrew-as/assembly/indexer/index
  call $start:~lib/metashrew-as/assembly/blockdata/block
  call $start:~lib/metashrew-as/assembly/blockdata/height
  i32.const 2288
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer.for
  call $~lib/metashrew-as/assembly/indexer/bst/BST.at<u64>
  global.set $assembly/index/SAT_TO_OUTPOINT
  i32.const 2352
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer.for
  global.set $assembly/index/OUTPOINT_TO_SAT
  i32.const 2416
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer.for
  global.set $assembly/index/OUTPOINT_TO_VALUE
  i32.const 2480
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer.for
  global.set $assembly/index/OUTPOINT_TO_SEQUENCE_NUMBERS
  i32.const 2560
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer.for
  global.set $assembly/index/HEIGHT_TO_BLOCKHASH
  i32.const 2624
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer.for
  global.set $assembly/index/BLOCKHASH_TO_HEIGHT
  i32.const 2688
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer.for
  global.set $assembly/index/STARTING_SAT
  i32.const 2736
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer.for
  global.set $assembly/index/INSCRIPTION_ID_TO_INSCRIPTION
  i32.const 2800
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer.for
  global.set $assembly/index/SATPOINT_TO_INSCRIPTION_ID
  i32.const 2880
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer.for
  global.set $assembly/index/SATPOINT_TO_SAT
  i32.const 2944
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer.for
  global.set $assembly/index/INSCRIPTION_ID_TO_SATPOINT
  i32.const 3024
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer.for
  global.set $assembly/index/INSCRIPTION_ID_TO_BLOCKHEIGHT
  i32.const 3088
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer.for
  global.set $assembly/index/HEIGHT_TO_INSCRIPTION_IDS
  i32.const 3168
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer.for
  global.set $assembly/index/NEXT_SEQUENCE_NUMBER
  i32.const 3216
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer.for
  global.set $assembly/index/SEQUENCE_NUMBER_TO_INSCRIPTION_ID
  i32.const 3296
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer.for
  global.set $assembly/index/INSCRIPTION_ID_TO_SEQUENCE_NUMBER
 )
 (func $~lib/metashrew-as/assembly/indexer/index/input (result i32)
  (local $data i32)
  i32.const 0
  call $~lib/metashrew-as/assembly/indexer/index/__host_len
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.set $data
  local.get $data
  call $~lib/metashrew-as/assembly/indexer/index/__load_input
  local.get $data
  return
 )
 (func $~lib/metashrew-as/assembly/utils/box/Box#set:start (param $this i32) (param $start i32)
  local.get $this
  local.get $start
  i32.store
 )
 (func $~lib/metashrew-as/assembly/utils/box/Box#set:len (param $this i32) (param $len i32)
  local.get $this
  local.get $len
  i32.store offset=4
 )
 (func $~lib/metashrew-as/assembly/utils/box/Box#constructor (param $this i32) (param $start i32) (param $len i32) (result i32)
  local.get $this
  i32.eqz
  if
   i32.const 8
   i32.const 14
   call $~lib/rt/stub/__new
   local.set $this
  end
  local.get $this
  i32.const 0
  call $~lib/metashrew-as/assembly/utils/box/Box#set:start
  local.get $this
  i32.const 0
  call $~lib/metashrew-as/assembly/utils/box/Box#set:len
  local.get $this
  local.get $start
  call $~lib/metashrew-as/assembly/utils/box/Box#set:start
  local.get $this
  local.get $len
  call $~lib/metashrew-as/assembly/utils/box/Box#set:len
  local.get $this
 )
 (func $~lib/arraybuffer/ArrayBuffer#get:byteLength (param $this i32) (result i32)
  local.get $this
  i32.const 20
  i32.sub
  call $~lib/rt/common/OBJECT#get:rtSize
  return
 )
 (func $~lib/metashrew-as/assembly/utils/box/Box.from (param $data i32) (result i32)
  i32.const 0
  local.get $data
  local.get $data
  call $~lib/arraybuffer/ArrayBuffer#get:byteLength
  call $~lib/metashrew-as/assembly/utils/box/Box#constructor
  return
 )
 (func $~lib/metashrew-as/assembly/utils/box/Box#get:start (param $this i32) (result i32)
  local.get $this
  i32.load
 )
 (func $~lib/metashrew-as/assembly/utils/box/Box#get:len (param $this i32) (result i32)
  local.get $this
  i32.load offset=4
 )
 (func $~lib/metashrew-as/assembly/utils/box/Box#shrinkFront (param $this i32) (param $distance i32) (result i32)
  local.get $this
  local.get $this
  call $~lib/metashrew-as/assembly/utils/box/Box#get:start
  local.get $distance
  i32.add
  call $~lib/metashrew-as/assembly/utils/box/Box#set:start
  local.get $this
  local.get $this
  call $~lib/metashrew-as/assembly/utils/box/Box#get:len
  local.get $distance
  i32.sub
  call $~lib/metashrew-as/assembly/utils/box/Box#set:len
  local.get $this
  return
 )
 (func $~lib/metashrew-as/assembly/utils/utils/parsePrimitive<u32> (param $data i32) (result i32)
  (local $result i32)
  local.get $data
  call $~lib/metashrew-as/assembly/utils/box/Box#get:start
  i32.load
  local.set $result
  local.get $data
  i32.const 4
  call $~lib/metashrew-as/assembly/utils/box/Box#shrinkFront
  drop
  local.get $result
  return
 )
 (func $~lib/metashrew-as/assembly/utils/pointer/nullptr<~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Transaction>> (result i32)
  i32.const 0
  return
 )
 (func $~lib/metashrew-as/assembly/blockdata/block/Block#set:transactions (param $this i32) (param $transactions i32)
  local.get $this
  local.get $transactions
  i32.store offset=8
  local.get $this
  local.get $transactions
  i32.const 0
  call $~lib/rt/stub/__link
 )
 (func $~lib/metashrew-as/assembly/utils/pointer/nullptr<~lib/metashrew-as/assembly/utils/box/Box> (result i32)
  i32.const 0
  return
 )
 (func $~lib/metashrew-as/assembly/blockdata/block/Block#set:prevBlock (param $this i32) (param $prevBlock i32)
  local.get $this
  local.get $prevBlock
  i32.store offset=12
  local.get $this
  local.get $prevBlock
  i32.const 0
  call $~lib/rt/stub/__link
 )
 (func $~lib/metashrew-as/assembly/blockdata/block/Block#set:merkleRoot (param $this i32) (param $merkleRoot i32)
  local.get $this
  local.get $merkleRoot
  i32.store offset=16
  local.get $this
  local.get $merkleRoot
  i32.const 0
  call $~lib/rt/stub/__link
 )
 (func $~lib/metashrew-as/assembly/utils/utils/parsePrimitive<i32> (param $data i32) (result i32)
  (local $result i32)
  local.get $data
  call $~lib/metashrew-as/assembly/utils/box/Box#get:start
  i32.load
  local.set $result
  local.get $data
  i32.const 4
  call $~lib/metashrew-as/assembly/utils/box/Box#shrinkFront
  drop
  local.get $result
  return
 )
 (func $~lib/metashrew-as/assembly/blockdata/block/Header#set:version (param $this i32) (param $version i32)
  local.get $this
  local.get $version
  i32.store
 )
 (func $~lib/metashrew-as/assembly/utils/box/Box#sliceFrom (param $this i32) (param $start i32) (result i32)
  i32.const 0
  local.get $this
  call $~lib/metashrew-as/assembly/utils/box/Box#get:start
  local.get $start
  i32.add
  local.get $this
  call $~lib/metashrew-as/assembly/utils/box/Box#get:len
  local.get $start
  i32.sub
  call $~lib/metashrew-as/assembly/utils/box/Box#constructor
  return
 )
 (func $~lib/metashrew-as/assembly/utils/utils/parseBytes (param $data i32) (param $sz i32) (result i32)
  (local $result i32)
  local.get $data
  i32.const 0
  call $~lib/metashrew-as/assembly/utils/box/Box#sliceFrom
  local.set $result
  local.get $result
  local.get $sz
  call $~lib/metashrew-as/assembly/utils/box/Box#set:len
  local.get $data
  local.get $sz
  call $~lib/metashrew-as/assembly/utils/box/Box#shrinkFront
  drop
  local.get $result
  return
 )
 (func $~lib/metashrew-as/assembly/blockdata/block/Header#set:prevBlock (param $this i32) (param $prevBlock i32)
  local.get $this
  local.get $prevBlock
  i32.store offset=4
  local.get $this
  local.get $prevBlock
  i32.const 0
  call $~lib/rt/stub/__link
 )
 (func $~lib/metashrew-as/assembly/blockdata/block/Header#set:merkleRoot (param $this i32) (param $merkleRoot i32)
  local.get $this
  local.get $merkleRoot
  i32.store offset=8
  local.get $this
  local.get $merkleRoot
  i32.const 0
  call $~lib/rt/stub/__link
 )
 (func $~lib/metashrew-as/assembly/blockdata/block/Header#set:time (param $this i32) (param $time i32)
  local.get $this
  local.get $time
  i32.store offset=12
 )
 (func $~lib/metashrew-as/assembly/blockdata/block/Header#set:bits (param $this i32) (param $bits i32)
  local.get $this
  local.get $bits
  i32.store offset=16
 )
 (func $~lib/metashrew-as/assembly/blockdata/block/Header#set:nonce (param $this i32) (param $nonce i32)
  local.get $this
  local.get $nonce
  i32.store offset=20
 )
 (func $~lib/metashrew-as/assembly/utils/pointer/toPointer (param $v i32) (result i32)
  (local $this i32)
  (local $ptr i32)
  block $~lib/metashrew-as/assembly/utils/pointer/Pointer#constructor|inlined.0 (result i32)
   i32.const 0
   local.set $this
   local.get $v
   local.set $ptr
   local.get $ptr
   br $~lib/metashrew-as/assembly/utils/pointer/Pointer#constructor|inlined.0
  end
  return
 )
 (func $~lib/metashrew-as/assembly/blockdata/block/Header#set:bytes (param $this i32) (param $bytes i32)
  local.get $this
  local.get $bytes
  i32.store offset=24
  local.get $this
  local.get $bytes
  i32.const 0
  call $~lib/rt/stub/__link
 )
 (func $~lib/metashrew-as/assembly/blockdata/block/Header#constructor (param $this i32) (param $data i32) (result i32)
  (local $head i32)
  (local $tail i32)
  (local $this|4 i32)
  (local $len i32)
  (local $this|6 i32)
  (local $this|7 i32)
  local.get $this
  i32.eqz
  if
   i32.const 28
   i32.const 16
   call $~lib/rt/stub/__new
   local.set $this
  end
  local.get $this
  i32.const 0
  call $~lib/metashrew-as/assembly/blockdata/block/Header#set:version
  local.get $this
  i32.const 0
  call $~lib/metashrew-as/assembly/blockdata/block/Header#set:prevBlock
  local.get $this
  i32.const 0
  call $~lib/metashrew-as/assembly/blockdata/block/Header#set:merkleRoot
  local.get $this
  i32.const 0
  call $~lib/metashrew-as/assembly/blockdata/block/Header#set:time
  local.get $this
  i32.const 0
  call $~lib/metashrew-as/assembly/blockdata/block/Header#set:bits
  local.get $this
  i32.const 0
  call $~lib/metashrew-as/assembly/blockdata/block/Header#set:nonce
  local.get $this
  i32.const 0
  call $~lib/metashrew-as/assembly/blockdata/block/Header#set:bytes
  local.get $data
  call $~lib/metashrew-as/assembly/utils/box/Box#get:start
  local.set $head
  local.get $this
  local.get $data
  call $~lib/metashrew-as/assembly/utils/utils/parsePrimitive<i32>
  call $~lib/metashrew-as/assembly/blockdata/block/Header#set:version
  local.get $this
  local.get $data
  i32.const 32
  call $~lib/metashrew-as/assembly/utils/utils/parseBytes
  call $~lib/metashrew-as/assembly/blockdata/block/Header#set:prevBlock
  local.get $this
  local.get $data
  i32.const 32
  call $~lib/metashrew-as/assembly/utils/utils/parseBytes
  call $~lib/metashrew-as/assembly/blockdata/block/Header#set:merkleRoot
  local.get $this
  local.get $data
  call $~lib/metashrew-as/assembly/utils/utils/parsePrimitive<u32>
  call $~lib/metashrew-as/assembly/blockdata/block/Header#set:time
  local.get $this
  local.get $data
  call $~lib/metashrew-as/assembly/utils/utils/parsePrimitive<u32>
  call $~lib/metashrew-as/assembly/blockdata/block/Header#set:bits
  local.get $this
  local.get $data
  call $~lib/metashrew-as/assembly/utils/utils/parsePrimitive<u32>
  call $~lib/metashrew-as/assembly/blockdata/block/Header#set:nonce
  local.get $data
  call $~lib/metashrew-as/assembly/utils/box/Box#get:start
  local.set $tail
  local.get $this
  block $~lib/metashrew-as/assembly/utils/pointer/Pointer#toBox|inlined.0 (result i32)
   local.get $head
   call $~lib/metashrew-as/assembly/utils/pointer/toPointer
   local.set $this|4
   local.get $tail
   local.get $head
   i32.sub
   local.set $len
   i32.const 0
   block $~lib/metashrew-as/assembly/utils/pointer/Pointer#asUsize|inlined.0 (result i32)
    local.get $this|4
    local.set $this|6
    block $~lib/metashrew-as/assembly/utils/pointer/Pointer#asRef<usize>|inlined.0 (result i32)
     local.get $this|6
     local.set $this|7
     local.get $this|7
     br $~lib/metashrew-as/assembly/utils/pointer/Pointer#asRef<usize>|inlined.0
    end
    br $~lib/metashrew-as/assembly/utils/pointer/Pointer#asUsize|inlined.0
   end
   local.get $len
   call $~lib/metashrew-as/assembly/utils/box/Box#constructor
   br $~lib/metashrew-as/assembly/utils/pointer/Pointer#toBox|inlined.0
  end
  call $~lib/metashrew-as/assembly/blockdata/block/Header#set:bytes
  local.get $this
 )
 (func $~lib/metashrew-as/assembly/blockdata/block/Block#set:header (param $this i32) (param $header i32)
  local.get $this
  local.get $header
  i32.store offset=4
  local.get $this
  local.get $header
  i32.const 0
  call $~lib/rt/stub/__link
 )
 (func $~lib/metashrew-as/assembly/utils/utils/parsePrimitive<u64> (param $data i32) (result i64)
  (local $result i64)
  local.get $data
  call $~lib/metashrew-as/assembly/utils/box/Box#get:start
  i64.load
  local.set $result
  local.get $data
  i32.const 8
  call $~lib/metashrew-as/assembly/utils/box/Box#shrinkFront
  drop
  local.get $result
  return
 )
 (func $~lib/metashrew-as/assembly/utils/utils/parsePrimitive<u16> (param $data i32) (result i32)
  (local $result i32)
  local.get $data
  call $~lib/metashrew-as/assembly/utils/box/Box#get:start
  i32.load16_u
  local.set $result
  local.get $data
  i32.const 2
  call $~lib/metashrew-as/assembly/utils/box/Box#shrinkFront
  drop
  local.get $result
  return
 )
 (func $~lib/metashrew-as/assembly/utils/utils/parseVarInt (param $data i32) (result i64)
  (local $first i32)
  (local $2 i32)
  local.get $data
  call $~lib/metashrew-as/assembly/utils/box/Box#get:start
  i32.load8_u
  local.set $first
  local.get $data
  i32.const 1
  call $~lib/metashrew-as/assembly/utils/box/Box#shrinkFront
  drop
  block $case3|0
   block $case2|0
    block $case1|0
     block $case0|0
      local.get $first
      local.set $2
      local.get $2
      i32.const 255
      i32.eq
      br_if $case0|0
      local.get $2
      i32.const 254
      i32.eq
      br_if $case1|0
      local.get $2
      i32.const 253
      i32.eq
      br_if $case2|0
      br $case3|0
     end
     local.get $data
     call $~lib/metashrew-as/assembly/utils/utils/parsePrimitive<u64>
     return
    end
    local.get $data
    call $~lib/metashrew-as/assembly/utils/utils/parsePrimitive<u32>
    i64.extend_i32_u
    return
   end
   local.get $data
   call $~lib/metashrew-as/assembly/utils/utils/parsePrimitive<u16>
   i64.extend_i32_u
   return
  end
  local.get $first
  i64.extend_i32_u
  return
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Transaction>#set:buffer (param $this i32) (param $buffer i32)
  local.get $this
  local.get $buffer
  i32.store
  local.get $this
  local.get $buffer
  i32.const 0
  call $~lib/rt/stub/__link
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Transaction>#set:dataStart (param $this i32) (param $dataStart i32)
  local.get $this
  local.get $dataStart
  i32.store offset=4
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Transaction>#set:byteLength (param $this i32) (param $byteLength i32)
  local.get $this
  local.get $byteLength
  i32.store offset=8
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Transaction>#set:length_ (param $this i32) (param $length_ i32)
  local.get $this
  local.get $length_
  i32.store offset=12
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Transaction>#constructor (param $this i32) (param $length i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $bufferSize i32)
  (local $buffer i32)
  local.get $this
  i32.eqz
  if
   i32.const 16
   i32.const 25
   call $~lib/rt/stub/__new
   local.set $this
  end
  local.get $this
  i32.const 0
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Transaction>#set:buffer
  local.get $this
  i32.const 0
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Transaction>#set:dataStart
  local.get $this
  i32.const 0
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Transaction>#set:byteLength
  local.get $this
  i32.const 0
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Transaction>#set:length_
  local.get $length
  i32.const 1073741820
  i32.const 2
  i32.shr_u
  i32.gt_u
  if
   i32.const 1376
   i32.const 2240
   i32.const 70
   i32.const 60
   call $~lib/builtins/abort
   unreachable
  end
  local.get $length
  local.tee $2
  i32.const 8
  local.tee $3
  local.get $2
  local.get $3
  i32.gt_u
  select
  i32.const 2
  i32.shl
  local.set $bufferSize
  local.get $bufferSize
  i32.const 1
  call $~lib/rt/stub/__new
  local.set $buffer
  i32.const 0
  global.get $~lib/shared/runtime/Runtime.Incremental
  i32.ne
  drop
  local.get $buffer
  i32.const 0
  local.get $bufferSize
  memory.fill
  local.get $this
  local.get $buffer
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Transaction>#set:buffer
  local.get $this
  local.get $buffer
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Transaction>#set:dataStart
  local.get $this
  local.get $bufferSize
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Transaction>#set:byteLength
  local.get $this
  local.get $length
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Transaction>#set:length_
  local.get $this
 )
 (func $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#set:bytes (param $this i32) (param $bytes i32)
  local.get $this
  local.get $bytes
  i32.store
  local.get $this
  local.get $bytes
  i32.const 0
  call $~lib/rt/stub/__link
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Input>#set:buffer (param $this i32) (param $buffer i32)
  local.get $this
  local.get $buffer
  i32.store
  local.get $this
  local.get $buffer
  i32.const 0
  call $~lib/rt/stub/__link
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Input>#set:dataStart (param $this i32) (param $dataStart i32)
  local.get $this
  local.get $dataStart
  i32.store offset=4
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Input>#set:byteLength (param $this i32) (param $byteLength i32)
  local.get $this
  local.get $byteLength
  i32.store offset=8
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Input>#set:length_ (param $this i32) (param $length_ i32)
  local.get $this
  local.get $length_
  i32.store offset=12
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Input>#constructor (param $this i32) (param $length i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $bufferSize i32)
  (local $buffer i32)
  local.get $this
  i32.eqz
  if
   i32.const 16
   i32.const 22
   call $~lib/rt/stub/__new
   local.set $this
  end
  local.get $this
  i32.const 0
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Input>#set:buffer
  local.get $this
  i32.const 0
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Input>#set:dataStart
  local.get $this
  i32.const 0
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Input>#set:byteLength
  local.get $this
  i32.const 0
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Input>#set:length_
  local.get $length
  i32.const 1073741820
  i32.const 2
  i32.shr_u
  i32.gt_u
  if
   i32.const 1376
   i32.const 2240
   i32.const 70
   i32.const 60
   call $~lib/builtins/abort
   unreachable
  end
  local.get $length
  local.tee $2
  i32.const 8
  local.tee $3
  local.get $2
  local.get $3
  i32.gt_u
  select
  i32.const 2
  i32.shl
  local.set $bufferSize
  local.get $bufferSize
  i32.const 1
  call $~lib/rt/stub/__new
  local.set $buffer
  i32.const 0
  global.get $~lib/shared/runtime/Runtime.Incremental
  i32.ne
  drop
  local.get $buffer
  i32.const 0
  local.get $bufferSize
  memory.fill
  local.get $this
  local.get $buffer
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Input>#set:buffer
  local.get $this
  local.get $buffer
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Input>#set:dataStart
  local.get $this
  local.get $bufferSize
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Input>#set:byteLength
  local.get $this
  local.get $length
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Input>#set:length_
  local.get $this
 )
 (func $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#set:ins (param $this i32) (param $ins i32)
  local.get $this
  local.get $ins
  i32.store offset=12
  local.get $this
  local.get $ins
  i32.const 0
  call $~lib/rt/stub/__link
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Output>#set:buffer (param $this i32) (param $buffer i32)
  local.get $this
  local.get $buffer
  i32.store
  local.get $this
  local.get $buffer
  i32.const 0
  call $~lib/rt/stub/__link
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Output>#set:dataStart (param $this i32) (param $dataStart i32)
  local.get $this
  local.get $dataStart
  i32.store offset=4
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Output>#set:byteLength (param $this i32) (param $byteLength i32)
  local.get $this
  local.get $byteLength
  i32.store offset=8
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Output>#set:length_ (param $this i32) (param $length_ i32)
  local.get $this
  local.get $length_
  i32.store offset=12
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Output>#constructor (param $this i32) (param $length i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $bufferSize i32)
  (local $buffer i32)
  local.get $this
  i32.eqz
  if
   i32.const 16
   i32.const 24
   call $~lib/rt/stub/__new
   local.set $this
  end
  local.get $this
  i32.const 0
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Output>#set:buffer
  local.get $this
  i32.const 0
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Output>#set:dataStart
  local.get $this
  i32.const 0
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Output>#set:byteLength
  local.get $this
  i32.const 0
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Output>#set:length_
  local.get $length
  i32.const 1073741820
  i32.const 2
  i32.shr_u
  i32.gt_u
  if
   i32.const 1376
   i32.const 2240
   i32.const 70
   i32.const 60
   call $~lib/builtins/abort
   unreachable
  end
  local.get $length
  local.tee $2
  i32.const 8
  local.tee $3
  local.get $2
  local.get $3
  i32.gt_u
  select
  i32.const 2
  i32.shl
  local.set $bufferSize
  local.get $bufferSize
  i32.const 1
  call $~lib/rt/stub/__new
  local.set $buffer
  i32.const 0
  global.get $~lib/shared/runtime/Runtime.Incremental
  i32.ne
  drop
  local.get $buffer
  i32.const 0
  local.get $bufferSize
  memory.fill
  local.get $this
  local.get $buffer
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Output>#set:buffer
  local.get $this
  local.get $buffer
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Output>#set:dataStart
  local.get $this
  local.get $bufferSize
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Output>#set:byteLength
  local.get $this
  local.get $length
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Output>#set:length_
  local.get $this
 )
 (func $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#set:outs (param $this i32) (param $outs i32)
  local.get $this
  local.get $outs
  i32.store offset=16
  local.get $this
  local.get $outs
  i32.const 0
  call $~lib/rt/stub/__link
 )
 (func $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#set:witnessDataBytes (param $this i32) (param $witnessDataBytes i32)
  local.get $this
  local.get $witnessDataBytes
  i32.store offset=24
  local.get $this
  local.get $witnessDataBytes
  i32.const 0
  call $~lib/rt/stub/__link
 )
 (func $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#set:legacyInputOutputBytes (param $this i32) (param $legacyInputOutputBytes i32)
  local.get $this
  local.get $legacyInputOutputBytes
  i32.store offset=28
  local.get $this
  local.get $legacyInputOutputBytes
  i32.const 0
  call $~lib/rt/stub/__link
 )
 (func $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#set:flag (param $this i32) (param $flag i32)
  local.get $this
  local.get $flag
  i32.store8 offset=8
 )
 (func $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#set:_txid (param $this i32) (param $_txid i32)
  local.get $this
  local.get $_txid
  i32.store offset=32
  local.get $this
  local.get $_txid
  i32.const 0
  call $~lib/rt/stub/__link
 )
 (func $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#set:version (param $this i32) (param $version i32)
  local.get $this
  local.get $version
  i32.store offset=4
 )
 (func $~lib/metashrew-as/assembly/utils/utils/parsePrimitive<u8> (param $data i32) (result i32)
  (local $result i32)
  local.get $data
  call $~lib/metashrew-as/assembly/utils/box/Box#get:start
  i32.load8_u
  local.set $result
  local.get $data
  i32.const 1
  call $~lib/metashrew-as/assembly/utils/box/Box#shrinkFront
  drop
  local.get $result
  return
 )
 (func $~lib/metashrew-as/assembly/blockdata/transaction/Input#set:hash (param $this i32) (param $hash i32)
  local.get $this
  local.get $hash
  i32.store offset=4
  local.get $this
  local.get $hash
  i32.const 0
  call $~lib/rt/stub/__link
 )
 (func $~lib/metashrew-as/assembly/blockdata/transaction/Input#set:index (param $this i32) (param $index i32)
  local.get $this
  local.get $index
  i32.store offset=8
 )
 (func $~lib/metashrew-as/assembly/utils/utils/parseLenThenBytes (param $data i32) (result i32)
  (local $length i64)
  local.get $data
  call $~lib/metashrew-as/assembly/utils/utils/parseVarInt
  local.set $length
  local.get $data
  local.get $length
  i32.wrap_i64
  call $~lib/metashrew-as/assembly/utils/utils/parseBytes
  return
 )
 (func $~lib/metashrew-as/assembly/blockdata/transaction/Input#set:script (param $this i32) (param $script i32)
  local.get $this
  local.get $script
  i32.store offset=12
  local.get $this
  local.get $script
  i32.const 0
  call $~lib/rt/stub/__link
 )
 (func $~lib/metashrew-as/assembly/blockdata/transaction/Input#set:sequence (param $this i32) (param $sequence i32)
  local.get $this
  local.get $sequence
  i32.store offset=16
 )
 (func $~lib/metashrew-as/assembly/utils/pointer/nullptr<~lib/metashrew-as/assembly/blockdata/witness/Witness> (result i32)
  i32.const 0
  return
 )
 (func $~lib/metashrew-as/assembly/blockdata/transaction/Input#set:witness (param $this i32) (param $witness i32)
  local.get $this
  local.get $witness
  i32.store offset=20
  local.get $this
  local.get $witness
  i32.const 0
  call $~lib/rt/stub/__link
 )
 (func $~lib/metashrew-as/assembly/blockdata/transaction/Input#set:bytes (param $this i32) (param $bytes i32)
  local.get $this
  local.get $bytes
  i32.store
  local.get $this
  local.get $bytes
  i32.const 0
  call $~lib/rt/stub/__link
 )
 (func $~lib/metashrew-as/assembly/blockdata/transaction/Input#constructor (param $this i32) (param $data i32) (result i32)
  (local $head i32)
  (local $tail i32)
  (local $this|4 i32)
  (local $len i32)
  (local $this|6 i32)
  (local $this|7 i32)
  local.get $this
  i32.eqz
  if
   i32.const 24
   i32.const 18
   call $~lib/rt/stub/__new
   local.set $this
  end
  local.get $this
  i32.const 0
  call $~lib/metashrew-as/assembly/blockdata/transaction/Input#set:bytes
  local.get $this
  i32.const 0
  call $~lib/metashrew-as/assembly/blockdata/transaction/Input#set:hash
  local.get $this
  i32.const 0
  call $~lib/metashrew-as/assembly/blockdata/transaction/Input#set:index
  local.get $this
  i32.const 0
  call $~lib/metashrew-as/assembly/blockdata/transaction/Input#set:script
  local.get $this
  i32.const 0
  call $~lib/metashrew-as/assembly/blockdata/transaction/Input#set:sequence
  local.get $this
  i32.const 0
  call $~lib/metashrew-as/assembly/blockdata/transaction/Input#set:witness
  local.get $data
  call $~lib/metashrew-as/assembly/utils/box/Box#get:start
  local.set $head
  local.get $this
  local.get $data
  i32.const 32
  call $~lib/metashrew-as/assembly/utils/utils/parseBytes
  call $~lib/metashrew-as/assembly/blockdata/transaction/Input#set:hash
  local.get $this
  local.get $data
  call $~lib/metashrew-as/assembly/utils/utils/parsePrimitive<u32>
  call $~lib/metashrew-as/assembly/blockdata/transaction/Input#set:index
  local.get $this
  local.get $data
  call $~lib/metashrew-as/assembly/utils/utils/parseLenThenBytes
  call $~lib/metashrew-as/assembly/blockdata/transaction/Input#set:script
  local.get $this
  local.get $data
  call $~lib/metashrew-as/assembly/utils/utils/parsePrimitive<u32>
  call $~lib/metashrew-as/assembly/blockdata/transaction/Input#set:sequence
  local.get $this
  call $~lib/metashrew-as/assembly/utils/pointer/nullptr<~lib/metashrew-as/assembly/blockdata/witness/Witness>
  call $~lib/metashrew-as/assembly/blockdata/transaction/Input#set:witness
  local.get $data
  call $~lib/metashrew-as/assembly/utils/box/Box#get:start
  local.set $tail
  local.get $this
  block $~lib/metashrew-as/assembly/utils/pointer/Pointer#toBox|inlined.1 (result i32)
   local.get $head
   call $~lib/metashrew-as/assembly/utils/pointer/toPointer
   local.set $this|4
   local.get $tail
   local.get $head
   i32.sub
   local.set $len
   i32.const 0
   block $~lib/metashrew-as/assembly/utils/pointer/Pointer#asUsize|inlined.1 (result i32)
    local.get $this|4
    local.set $this|6
    block $~lib/metashrew-as/assembly/utils/pointer/Pointer#asRef<usize>|inlined.1 (result i32)
     local.get $this|6
     local.set $this|7
     local.get $this|7
     br $~lib/metashrew-as/assembly/utils/pointer/Pointer#asRef<usize>|inlined.1
    end
    br $~lib/metashrew-as/assembly/utils/pointer/Pointer#asUsize|inlined.1
   end
   local.get $len
   call $~lib/metashrew-as/assembly/utils/box/Box#constructor
   br $~lib/metashrew-as/assembly/utils/pointer/Pointer#toBox|inlined.1
  end
  call $~lib/metashrew-as/assembly/blockdata/transaction/Input#set:bytes
  local.get $this
 )
 (func $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#get:ins (param $this i32) (result i32)
  local.get $this
  i32.load offset=12
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Input>#get:length_ (param $this i32) (result i32)
  local.get $this
  i32.load offset=12
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Input>#get:dataStart (param $this i32) (result i32)
  local.get $this
  i32.load offset=4
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Input>#__set (param $this i32) (param $index i32) (param $value i32)
  local.get $index
  local.get $this
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Input>#get:length_
  i32.ge_u
  if
   local.get $index
   i32.const 0
   i32.lt_s
   if
    i32.const 2112
    i32.const 2240
    i32.const 130
    i32.const 22
    call $~lib/builtins/abort
    unreachable
   end
   local.get $this
   local.get $index
   i32.const 1
   i32.add
   i32.const 2
   i32.const 1
   call $~lib/array/ensureCapacity
   local.get $this
   local.get $index
   i32.const 1
   i32.add
   call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Input>#set:length_
  end
  local.get $this
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Input>#get:dataStart
  local.get $index
  i32.const 2
  i32.shl
  i32.add
  local.get $value
  i32.store
  i32.const 1
  drop
  local.get $this
  local.get $value
  i32.const 1
  call $~lib/rt/stub/__link
 )
 (func $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#get:flag (param $this i32) (result i32)
  local.get $this
  i32.load8_u offset=8
 )
 (func $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#get:outs (param $this i32) (result i32)
  local.get $this
  i32.load offset=16
 )
 (func $~lib/metashrew-as/assembly/blockdata/transaction/Output#set:value (param $this i32) (param $value i64)
  local.get $this
  local.get $value
  i64.store offset=8
 )
 (func $~lib/metashrew-as/assembly/blockdata/transaction/Output#set:script (param $this i32) (param $script i32)
  local.get $this
  local.get $script
  i32.store offset=16
  local.get $this
  local.get $script
  i32.const 0
  call $~lib/rt/stub/__link
 )
 (func $~lib/metashrew-as/assembly/blockdata/transaction/Output#set:bytes (param $this i32) (param $bytes i32)
  local.get $this
  local.get $bytes
  i32.store
  local.get $this
  local.get $bytes
  i32.const 0
  call $~lib/rt/stub/__link
 )
 (func $~lib/metashrew-as/assembly/blockdata/transaction/Output#set:segwit (param $this i32) (param $segwit i32)
  local.get $this
  local.get $segwit
  i32.store8 offset=20
 )
 (func $~lib/metashrew-as/assembly/blockdata/transaction/Output#constructor (param $this i32) (param $data i32) (param $segwit i32) (result i32)
  (local $head i32)
  (local $tail i32)
  (local $this|5 i32)
  (local $len i32)
  (local $this|7 i32)
  (local $this|8 i32)
  local.get $this
  i32.eqz
  if
   i32.const 21
   i32.const 23
   call $~lib/rt/stub/__new
   local.set $this
  end
  local.get $this
  i32.const 0
  call $~lib/metashrew-as/assembly/blockdata/transaction/Output#set:bytes
  local.get $this
  i64.const 0
  call $~lib/metashrew-as/assembly/blockdata/transaction/Output#set:value
  local.get $this
  i32.const 0
  call $~lib/metashrew-as/assembly/blockdata/transaction/Output#set:script
  local.get $this
  i32.const 0
  call $~lib/metashrew-as/assembly/blockdata/transaction/Output#set:segwit
  local.get $data
  call $~lib/metashrew-as/assembly/utils/box/Box#get:start
  local.set $head
  local.get $this
  local.get $data
  call $~lib/metashrew-as/assembly/utils/utils/parsePrimitive<u64>
  call $~lib/metashrew-as/assembly/blockdata/transaction/Output#set:value
  local.get $this
  local.get $data
  call $~lib/metashrew-as/assembly/utils/utils/parseLenThenBytes
  call $~lib/metashrew-as/assembly/blockdata/transaction/Output#set:script
  local.get $data
  call $~lib/metashrew-as/assembly/utils/box/Box#get:start
  local.set $tail
  local.get $this
  block $~lib/metashrew-as/assembly/utils/pointer/Pointer#toBox|inlined.2 (result i32)
   local.get $head
   call $~lib/metashrew-as/assembly/utils/pointer/toPointer
   local.set $this|5
   local.get $tail
   local.get $head
   i32.sub
   local.set $len
   i32.const 0
   block $~lib/metashrew-as/assembly/utils/pointer/Pointer#asUsize|inlined.2 (result i32)
    local.get $this|5
    local.set $this|7
    block $~lib/metashrew-as/assembly/utils/pointer/Pointer#asRef<usize>|inlined.2 (result i32)
     local.get $this|7
     local.set $this|8
     local.get $this|8
     br $~lib/metashrew-as/assembly/utils/pointer/Pointer#asRef<usize>|inlined.2
    end
    br $~lib/metashrew-as/assembly/utils/pointer/Pointer#asUsize|inlined.2
   end
   local.get $len
   call $~lib/metashrew-as/assembly/utils/box/Box#constructor
   br $~lib/metashrew-as/assembly/utils/pointer/Pointer#toBox|inlined.2
  end
  call $~lib/metashrew-as/assembly/blockdata/transaction/Output#set:bytes
  local.get $this
  local.get $segwit
  call $~lib/metashrew-as/assembly/blockdata/transaction/Output#set:segwit
  local.get $this
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Output>#get:length_ (param $this i32) (result i32)
  local.get $this
  i32.load offset=12
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Output>#get:dataStart (param $this i32) (result i32)
  local.get $this
  i32.load offset=4
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Output>#push (param $this i32) (param $value i32) (result i32)
  (local $oldLen i32)
  (local $len i32)
  local.get $this
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Output>#get:length_
  local.set $oldLen
  local.get $oldLen
  i32.const 1
  i32.add
  local.set $len
  local.get $this
  local.get $len
  i32.const 2
  i32.const 1
  call $~lib/array/ensureCapacity
  i32.const 1
  drop
  local.get $this
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Output>#get:dataStart
  local.get $oldLen
  i32.const 2
  i32.shl
  i32.add
  local.get $value
  i32.store
  local.get $this
  local.get $value
  i32.const 1
  call $~lib/rt/stub/__link
  local.get $this
  local.get $len
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Output>#set:length_
  local.get $len
  return
 )
 (func $~lib/metashrew-as/assembly/blockdata/witness/Witness#set:bytes (param $this i32) (param $bytes i32)
  local.get $this
  local.get $bytes
  i32.store
  local.get $this
  local.get $bytes
  i32.const 0
  call $~lib/rt/stub/__link
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/witness/WitnessPart>#set:buffer (param $this i32) (param $buffer i32)
  local.get $this
  local.get $buffer
  i32.store
  local.get $this
  local.get $buffer
  i32.const 0
  call $~lib/rt/stub/__link
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/witness/WitnessPart>#set:dataStart (param $this i32) (param $dataStart i32)
  local.get $this
  local.get $dataStart
  i32.store offset=4
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/witness/WitnessPart>#set:byteLength (param $this i32) (param $byteLength i32)
  local.get $this
  local.get $byteLength
  i32.store offset=8
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/witness/WitnessPart>#set:length_ (param $this i32) (param $length_ i32)
  local.get $this
  local.get $length_
  i32.store offset=12
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/witness/WitnessPart>#constructor (param $this i32) (param $length i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $bufferSize i32)
  (local $buffer i32)
  local.get $this
  i32.eqz
  if
   i32.const 16
   i32.const 21
   call $~lib/rt/stub/__new
   local.set $this
  end
  local.get $this
  i32.const 0
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/witness/WitnessPart>#set:buffer
  local.get $this
  i32.const 0
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/witness/WitnessPart>#set:dataStart
  local.get $this
  i32.const 0
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/witness/WitnessPart>#set:byteLength
  local.get $this
  i32.const 0
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/witness/WitnessPart>#set:length_
  local.get $length
  i32.const 1073741820
  i32.const 2
  i32.shr_u
  i32.gt_u
  if
   i32.const 1376
   i32.const 2240
   i32.const 70
   i32.const 60
   call $~lib/builtins/abort
   unreachable
  end
  local.get $length
  local.tee $2
  i32.const 8
  local.tee $3
  local.get $2
  local.get $3
  i32.gt_u
  select
  i32.const 2
  i32.shl
  local.set $bufferSize
  local.get $bufferSize
  i32.const 1
  call $~lib/rt/stub/__new
  local.set $buffer
  i32.const 0
  global.get $~lib/shared/runtime/Runtime.Incremental
  i32.ne
  drop
  local.get $buffer
  i32.const 0
  local.get $bufferSize
  memory.fill
  local.get $this
  local.get $buffer
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/witness/WitnessPart>#set:buffer
  local.get $this
  local.get $buffer
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/witness/WitnessPart>#set:dataStart
  local.get $this
  local.get $bufferSize
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/witness/WitnessPart>#set:byteLength
  local.get $this
  local.get $length
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/witness/WitnessPart>#set:length_
  local.get $this
 )
 (func $~lib/metashrew-as/assembly/blockdata/witness/Witness#set:parts (param $this i32) (param $parts i32)
  local.get $this
  local.get $parts
  i32.store offset=4
  local.get $this
  local.get $parts
  i32.const 0
  call $~lib/rt/stub/__link
 )
 (func $~lib/metashrew-as/assembly/blockdata/witness/WitnessPart#set:bytes (param $this i32) (param $bytes i32)
  local.get $this
  local.get $bytes
  i32.store
  local.get $this
  local.get $bytes
  i32.const 0
  call $~lib/rt/stub/__link
 )
 (func $~lib/metashrew-as/assembly/blockdata/witness/WitnessPart#get:bytes (param $this i32) (result i32)
  local.get $this
  i32.load
 )
 (func $~lib/metashrew-as/assembly/blockdata/witness/WitnessPart#set:firstByte (param $this i32) (param $firstByte i32)
  local.get $this
  local.get $firstByte
  i32.store8 offset=4
 )
 (func $~lib/metashrew-as/assembly/blockdata/witness/WitnessPart#get:firstByte (param $this i32) (result i32)
  local.get $this
  i32.load8_u offset=4
 )
 (func $~lib/metashrew-as/assembly/blockdata/witness/WitnessPart#set:taprootAnnex (param $this i32) (param $taprootAnnex i32)
  local.get $this
  local.get $taprootAnnex
  i32.store8 offset=6
 )
 (func $~lib/metashrew-as/assembly/blockdata/witness/WitnessPart#set:isScript (param $this i32) (param $isScript i32)
  local.get $this
  local.get $isScript
  i32.store8 offset=5
 )
 (func $~lib/metashrew-as/assembly/blockdata/witness/WitnessPart#constructor (param $this i32) (param $data i32) (result i32)
  (local $2 i32)
  local.get $this
  i32.eqz
  if
   i32.const 7
   i32.const 20
   call $~lib/rt/stub/__new
   local.set $this
  end
  local.get $this
  i32.const 0
  call $~lib/metashrew-as/assembly/blockdata/witness/WitnessPart#set:bytes
  local.get $this
  i32.const 0
  call $~lib/metashrew-as/assembly/blockdata/witness/WitnessPart#set:firstByte
  local.get $this
  i32.const 0
  call $~lib/metashrew-as/assembly/blockdata/witness/WitnessPart#set:isScript
  local.get $this
  i32.const 0
  call $~lib/metashrew-as/assembly/blockdata/witness/WitnessPart#set:taprootAnnex
  local.get $this
  local.get $data
  call $~lib/metashrew-as/assembly/utils/utils/parseLenThenBytes
  call $~lib/metashrew-as/assembly/blockdata/witness/WitnessPart#set:bytes
  local.get $this
  local.get $this
  call $~lib/metashrew-as/assembly/blockdata/witness/WitnessPart#get:bytes
  i32.const 0
  call $~lib/metashrew-as/assembly/utils/box/Box#sliceFrom
  call $~lib/metashrew-as/assembly/utils/utils/parsePrimitive<u8>
  call $~lib/metashrew-as/assembly/blockdata/witness/WitnessPart#set:firstByte
  block $break|0
   block $case2|0
    block $case1|0
     block $case0|0
      local.get $this
      call $~lib/metashrew-as/assembly/blockdata/witness/WitnessPart#get:firstByte
      i32.const 255
      i32.and
      local.set $2
      local.get $2
      i32.const 80
      i32.eq
      br_if $case0|0
      local.get $2
      i32.const 48
      i32.eq
      br_if $case1|0
      br $case2|0
     end
     local.get $this
     i32.const 1
     call $~lib/metashrew-as/assembly/blockdata/witness/WitnessPart#set:taprootAnnex
     local.get $this
     i32.const 0
     call $~lib/metashrew-as/assembly/blockdata/witness/WitnessPart#set:isScript
     br $break|0
    end
    local.get $this
    i32.const 0
    call $~lib/metashrew-as/assembly/blockdata/witness/WitnessPart#set:isScript
    local.get $this
    i32.const 0
    call $~lib/metashrew-as/assembly/blockdata/witness/WitnessPart#set:taprootAnnex
    br $break|0
   end
   local.get $this
   i32.const 0
   call $~lib/metashrew-as/assembly/blockdata/witness/WitnessPart#set:taprootAnnex
   local.get $this
   i32.const 1
   call $~lib/metashrew-as/assembly/blockdata/witness/WitnessPart#set:isScript
  end
  local.get $this
  call $~lib/metashrew-as/assembly/blockdata/witness/WitnessPart#get:bytes
  call $~lib/metashrew-as/assembly/utils/box/Box#get:len
  i32.const 1
  i32.le_u
  if
   local.get $this
   i32.const 0
   call $~lib/metashrew-as/assembly/blockdata/witness/WitnessPart#set:isScript
  end
  local.get $this
 )
 (func $~lib/metashrew-as/assembly/blockdata/witness/Witness#get:parts (param $this i32) (result i32)
  local.get $this
  i32.load offset=4
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/witness/WitnessPart>#get:length_ (param $this i32) (result i32)
  local.get $this
  i32.load offset=12
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/witness/WitnessPart>#get:dataStart (param $this i32) (result i32)
  local.get $this
  i32.load offset=4
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/witness/WitnessPart>#__set (param $this i32) (param $index i32) (param $value i32)
  local.get $index
  local.get $this
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/witness/WitnessPart>#get:length_
  i32.ge_u
  if
   local.get $index
   i32.const 0
   i32.lt_s
   if
    i32.const 2112
    i32.const 2240
    i32.const 130
    i32.const 22
    call $~lib/builtins/abort
    unreachable
   end
   local.get $this
   local.get $index
   i32.const 1
   i32.add
   i32.const 2
   i32.const 1
   call $~lib/array/ensureCapacity
   local.get $this
   local.get $index
   i32.const 1
   i32.add
   call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/witness/WitnessPart>#set:length_
  end
  local.get $this
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/witness/WitnessPart>#get:dataStart
  local.get $index
  i32.const 2
  i32.shl
  i32.add
  local.get $value
  i32.store
  i32.const 1
  drop
  local.get $this
  local.get $value
  i32.const 1
  call $~lib/rt/stub/__link
 )
 (func $~lib/metashrew-as/assembly/blockdata/witness/Witness#constructor (param $this i32) (param $data i32) (result i32)
  (local $head i32)
  (local $len i32)
  (local $i i32)
  (local $tail i32)
  (local $this|6 i32)
  (local $len|7 i32)
  (local $this|8 i32)
  (local $this|9 i32)
  local.get $this
  i32.eqz
  if
   i32.const 8
   i32.const 19
   call $~lib/rt/stub/__new
   local.set $this
  end
  local.get $this
  i32.const 0
  call $~lib/metashrew-as/assembly/blockdata/witness/Witness#set:bytes
  local.get $this
  i32.const 0
  call $~lib/metashrew-as/assembly/blockdata/witness/Witness#set:parts
  local.get $this
  call $~lib/metashrew-as/assembly/utils/pointer/nullptr<~lib/metashrew-as/assembly/utils/box/Box>
  call $~lib/metashrew-as/assembly/blockdata/witness/Witness#set:bytes
  local.get $data
  call $~lib/metashrew-as/assembly/utils/box/Box#get:start
  local.set $head
  local.get $data
  call $~lib/metashrew-as/assembly/utils/utils/parseVarInt
  i32.wrap_i64
  local.set $len
  local.get $this
  i32.const 0
  local.get $len
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/witness/WitnessPart>#constructor
  call $~lib/metashrew-as/assembly/blockdata/witness/Witness#set:parts
  i32.const 0
  local.set $i
  loop $for-loop|0
   local.get $i
   local.get $len
   i32.lt_s
   if
    local.get $this
    call $~lib/metashrew-as/assembly/blockdata/witness/Witness#get:parts
    local.get $i
    i32.const 0
    local.get $data
    call $~lib/metashrew-as/assembly/blockdata/witness/WitnessPart#constructor
    call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/witness/WitnessPart>#__set
    local.get $i
    i32.const 1
    i32.add
    local.set $i
    br $for-loop|0
   end
  end
  local.get $data
  call $~lib/metashrew-as/assembly/utils/box/Box#get:start
  local.set $tail
  local.get $this
  block $~lib/metashrew-as/assembly/utils/pointer/Pointer#toBox|inlined.4 (result i32)
   local.get $head
   call $~lib/metashrew-as/assembly/utils/pointer/toPointer
   local.set $this|6
   local.get $tail
   local.get $head
   i32.sub
   local.set $len|7
   i32.const 0
   block $~lib/metashrew-as/assembly/utils/pointer/Pointer#asUsize|inlined.4 (result i32)
    local.get $this|6
    local.set $this|8
    block $~lib/metashrew-as/assembly/utils/pointer/Pointer#asRef<usize>|inlined.4 (result i32)
     local.get $this|8
     local.set $this|9
     local.get $this|9
     br $~lib/metashrew-as/assembly/utils/pointer/Pointer#asRef<usize>|inlined.4
    end
    br $~lib/metashrew-as/assembly/utils/pointer/Pointer#asUsize|inlined.4
   end
   local.get $len|7
   call $~lib/metashrew-as/assembly/utils/box/Box#constructor
   br $~lib/metashrew-as/assembly/utils/pointer/Pointer#toBox|inlined.4
  end
  call $~lib/metashrew-as/assembly/blockdata/witness/Witness#set:bytes
  local.get $this
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Input>#__get (param $this i32) (param $index i32) (result i32)
  (local $value i32)
  local.get $index
  local.get $this
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Input>#get:length_
  i32.ge_u
  if
   i32.const 2112
   i32.const 2240
   i32.const 114
   i32.const 42
   call $~lib/builtins/abort
   unreachable
  end
  local.get $this
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Input>#get:dataStart
  local.get $index
  i32.const 2
  i32.shl
  i32.add
  i32.load
  local.set $value
  i32.const 1
  drop
  i32.const 0
  i32.eqz
  drop
  local.get $value
  i32.eqz
  if
   i32.const 3376
   i32.const 2240
   i32.const 118
   i32.const 40
   call $~lib/builtins/abort
   unreachable
  end
  local.get $value
  return
 )
 (func $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#set:locktime (param $this i32) (param $locktime i32)
  local.get $this
  local.get $locktime
  i32.store offset=20
 )
 (func $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#constructor (param $this i32) (param $data i32) (result i32)
  (local $head i32)
  (local $saved i32)
  (local $marker i32)
  (local $flag i32)
  (local $inputLegacyHead i32)
  (local $vinLen i32)
  (local $i i32)
  (local $voutLen i32)
  (local $i|10 i32)
  (local $outputLegacyTail i32)
  (local $this|12 i32)
  (local $len i32)
  (local $this|14 i32)
  (local $this|15 i32)
  (local $witnessHead i32)
  (local $i|17 i32)
  (local $witnessTail i32)
  (local $this|19 i32)
  (local $len|20 i32)
  (local $this|21 i32)
  (local $this|22 i32)
  (local $tail i32)
  (local $this|24 i32)
  (local $len|25 i32)
  (local $this|26 i32)
  (local $this|27 i32)
  local.get $this
  i32.eqz
  if
   i32.const 36
   i32.const 17
   call $~lib/rt/stub/__new
   local.set $this
  end
  local.get $this
  i32.const 0
  call $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#set:bytes
  local.get $this
  i32.const 0
  call $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#set:version
  local.get $this
  i32.const 0
  call $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#set:flag
  local.get $this
  i32.const 0
  call $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#set:ins
  local.get $this
  i32.const 0
  call $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#set:outs
  local.get $this
  i32.const 0
  call $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#set:locktime
  local.get $this
  i32.const 0
  call $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#set:witnessDataBytes
  local.get $this
  i32.const 0
  call $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#set:legacyInputOutputBytes
  local.get $this
  i32.const 0
  call $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#set:_txid
  local.get $this
  call $~lib/metashrew-as/assembly/utils/pointer/nullptr<~lib/metashrew-as/assembly/utils/box/Box>
  call $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#set:bytes
  local.get $this
  i32.const 0
  i32.const 0
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Input>#constructor
  call $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#set:ins
  local.get $this
  i32.const 0
  i32.const 0
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Output>#constructor
  call $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#set:outs
  local.get $this
  call $~lib/metashrew-as/assembly/utils/pointer/nullptr<~lib/metashrew-as/assembly/utils/box/Box>
  call $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#set:witnessDataBytes
  local.get $this
  call $~lib/metashrew-as/assembly/utils/pointer/nullptr<~lib/metashrew-as/assembly/utils/box/Box>
  call $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#set:legacyInputOutputBytes
  local.get $this
  i32.const 0
  call $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#set:flag
  local.get $this
  i32.const 0
  i32.const 0
  call $~lib/arraybuffer/ArrayBuffer#constructor
  call $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#set:_txid
  local.get $data
  call $~lib/metashrew-as/assembly/utils/box/Box#get:start
  local.set $head
  local.get $this
  local.get $data
  call $~lib/metashrew-as/assembly/utils/utils/parsePrimitive<u32>
  call $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#set:version
  local.get $data
  i32.const 0
  call $~lib/metashrew-as/assembly/utils/box/Box#sliceFrom
  local.set $saved
  local.get $data
  call $~lib/metashrew-as/assembly/utils/utils/parsePrimitive<u8>
  local.set $marker
  local.get $data
  call $~lib/metashrew-as/assembly/utils/utils/parsePrimitive<u8>
  local.set $flag
  local.get $marker
  i32.const 0
  i32.eq
  if (result i32)
   local.get $flag
   i32.const 1
   i32.eq
  else
   i32.const 0
  end
  if
   local.get $this
   i32.const 1
   call $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#set:flag
  else
   local.get $data
   local.get $saved
   call $~lib/metashrew-as/assembly/utils/box/Box#get:start
   call $~lib/metashrew-as/assembly/utils/box/Box#set:start
   local.get $data
   local.get $saved
   call $~lib/metashrew-as/assembly/utils/box/Box#get:len
   call $~lib/metashrew-as/assembly/utils/box/Box#set:len
  end
  local.get $data
  call $~lib/metashrew-as/assembly/utils/box/Box#get:start
  local.set $inputLegacyHead
  local.get $data
  call $~lib/metashrew-as/assembly/utils/utils/parseVarInt
  i32.wrap_i64
  local.set $vinLen
  i32.const 0
  local.set $i
  loop $for-loop|0
   local.get $i
   local.get $vinLen
   i32.lt_s
   if
    local.get $this
    call $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#get:ins
    local.get $i
    i32.const 0
    local.get $data
    call $~lib/metashrew-as/assembly/blockdata/transaction/Input#constructor
    call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Input>#__set
    local.get $i
    i32.const 1
    i32.add
    local.set $i
    br $for-loop|0
   end
  end
  local.get $data
  call $~lib/metashrew-as/assembly/utils/utils/parseVarInt
  i32.wrap_i64
  local.set $voutLen
  i32.const 0
  local.set $i|10
  loop $for-loop|1
   local.get $i|10
   local.get $voutLen
   i32.lt_s
   if
    local.get $this
    call $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#get:flag
    if
     local.get $this
     call $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#get:outs
     i32.const 0
     local.get $data
     i32.const 1
     call $~lib/metashrew-as/assembly/blockdata/transaction/Output#constructor
     call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Output>#push
     drop
    else
     local.get $this
     call $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#get:outs
     i32.const 0
     local.get $data
     i32.const 0
     call $~lib/metashrew-as/assembly/blockdata/transaction/Output#constructor
     call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Output>#push
     drop
    end
    local.get $i|10
    i32.const 1
    i32.add
    local.set $i|10
    br $for-loop|1
   end
  end
  local.get $data
  call $~lib/metashrew-as/assembly/utils/box/Box#get:start
  local.set $outputLegacyTail
  local.get $this
  block $~lib/metashrew-as/assembly/utils/pointer/Pointer#toBox|inlined.3 (result i32)
   local.get $inputLegacyHead
   call $~lib/metashrew-as/assembly/utils/pointer/toPointer
   local.set $this|12
   local.get $outputLegacyTail
   local.get $inputLegacyHead
   i32.sub
   local.set $len
   i32.const 0
   block $~lib/metashrew-as/assembly/utils/pointer/Pointer#asUsize|inlined.3 (result i32)
    local.get $this|12
    local.set $this|14
    block $~lib/metashrew-as/assembly/utils/pointer/Pointer#asRef<usize>|inlined.3 (result i32)
     local.get $this|14
     local.set $this|15
     local.get $this|15
     br $~lib/metashrew-as/assembly/utils/pointer/Pointer#asRef<usize>|inlined.3
    end
    br $~lib/metashrew-as/assembly/utils/pointer/Pointer#asUsize|inlined.3
   end
   local.get $len
   call $~lib/metashrew-as/assembly/utils/box/Box#constructor
   br $~lib/metashrew-as/assembly/utils/pointer/Pointer#toBox|inlined.3
  end
  call $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#set:legacyInputOutputBytes
  local.get $this
  call $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#get:flag
  if
   local.get $data
   call $~lib/metashrew-as/assembly/utils/box/Box#get:start
   local.set $witnessHead
   i32.const 0
   local.set $i|17
   loop $for-loop|2
    local.get $i|17
    local.get $vinLen
    i32.lt_s
    if
     local.get $this
     call $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#get:ins
     local.get $i|17
     call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Input>#__get
     i32.const 0
     local.get $data
     call $~lib/metashrew-as/assembly/blockdata/witness/Witness#constructor
     call $~lib/metashrew-as/assembly/blockdata/transaction/Input#set:witness
     local.get $i|17
     i32.const 1
     i32.add
     local.set $i|17
     br $for-loop|2
    end
   end
   local.get $data
   call $~lib/metashrew-as/assembly/utils/box/Box#get:start
   local.set $witnessTail
   local.get $this
   block $~lib/metashrew-as/assembly/utils/pointer/Pointer#toBox|inlined.5 (result i32)
    local.get $witnessHead
    call $~lib/metashrew-as/assembly/utils/pointer/toPointer
    local.set $this|19
    local.get $witnessTail
    local.get $witnessHead
    i32.sub
    local.set $len|20
    i32.const 0
    block $~lib/metashrew-as/assembly/utils/pointer/Pointer#asUsize|inlined.5 (result i32)
     local.get $this|19
     local.set $this|21
     block $~lib/metashrew-as/assembly/utils/pointer/Pointer#asRef<usize>|inlined.5 (result i32)
      local.get $this|21
      local.set $this|22
      local.get $this|22
      br $~lib/metashrew-as/assembly/utils/pointer/Pointer#asRef<usize>|inlined.5
     end
     br $~lib/metashrew-as/assembly/utils/pointer/Pointer#asUsize|inlined.5
    end
    local.get $len|20
    call $~lib/metashrew-as/assembly/utils/box/Box#constructor
    br $~lib/metashrew-as/assembly/utils/pointer/Pointer#toBox|inlined.5
   end
   call $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#set:witnessDataBytes
  end
  local.get $this
  local.get $data
  call $~lib/metashrew-as/assembly/utils/utils/parsePrimitive<u32>
  call $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#set:locktime
  local.get $data
  call $~lib/metashrew-as/assembly/utils/box/Box#get:start
  local.set $tail
  local.get $this
  block $~lib/metashrew-as/assembly/utils/pointer/Pointer#toBox|inlined.6 (result i32)
   local.get $head
   call $~lib/metashrew-as/assembly/utils/pointer/toPointer
   local.set $this|24
   local.get $tail
   local.get $head
   i32.sub
   local.set $len|25
   i32.const 0
   block $~lib/metashrew-as/assembly/utils/pointer/Pointer#asUsize|inlined.6 (result i32)
    local.get $this|24
    local.set $this|26
    block $~lib/metashrew-as/assembly/utils/pointer/Pointer#asRef<usize>|inlined.6 (result i32)
     local.get $this|26
     local.set $this|27
     local.get $this|27
     br $~lib/metashrew-as/assembly/utils/pointer/Pointer#asRef<usize>|inlined.6
    end
    br $~lib/metashrew-as/assembly/utils/pointer/Pointer#asUsize|inlined.6
   end
   local.get $len|25
   call $~lib/metashrew-as/assembly/utils/box/Box#constructor
   br $~lib/metashrew-as/assembly/utils/pointer/Pointer#toBox|inlined.6
  end
  call $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#set:bytes
  local.get $this
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Transaction>#get:length_ (param $this i32) (result i32)
  local.get $this
  i32.load offset=12
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Transaction>#get:dataStart (param $this i32) (result i32)
  local.get $this
  i32.load offset=4
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Transaction>#__set (param $this i32) (param $index i32) (param $value i32)
  local.get $index
  local.get $this
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Transaction>#get:length_
  i32.ge_u
  if
   local.get $index
   i32.const 0
   i32.lt_s
   if
    i32.const 2112
    i32.const 2240
    i32.const 130
    i32.const 22
    call $~lib/builtins/abort
    unreachable
   end
   local.get $this
   local.get $index
   i32.const 1
   i32.add
   i32.const 2
   i32.const 1
   call $~lib/array/ensureCapacity
   local.get $this
   local.get $index
   i32.const 1
   i32.add
   call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Transaction>#set:length_
  end
  local.get $this
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Transaction>#get:dataStart
  local.get $index
  i32.const 2
  i32.shl
  i32.add
  local.get $value
  i32.store
  i32.const 1
  drop
  local.get $this
  local.get $value
  i32.const 1
  call $~lib/rt/stub/__link
 )
 (func $~lib/metashrew-as/assembly/blockdata/transaction/Transaction.parseTransactionsFromBlock (param $data i32) (result i32)
  (local $txsLen i64)
  (local $result i32)
  (local $i i32)
  local.get $data
  call $~lib/metashrew-as/assembly/utils/utils/parseVarInt
  local.set $txsLen
  i32.const 0
  local.get $txsLen
  i32.wrap_i64
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Transaction>#constructor
  local.set $result
  i32.const 0
  local.set $i
  loop $for-loop|0
   local.get $i
   local.get $txsLen
   i32.wrap_i64
   i32.lt_s
   if
    local.get $result
    local.get $i
    i32.const 0
    local.get $data
    call $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#constructor
    call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Transaction>#__set
    local.get $i
    i32.const 1
    i32.add
    local.set $i
    br $for-loop|0
   end
  end
  local.get $result
  return
 )
 (func $~lib/metashrew-as/assembly/blockdata/block/Block#set:bytes (param $this i32) (param $bytes i32)
  local.get $this
  local.get $bytes
  i32.store
  local.get $this
  local.get $bytes
  i32.const 0
  call $~lib/rt/stub/__link
 )
 (func $~lib/metashrew-as/assembly/blockdata/block/Block#constructor (param $this i32) (param $data i32) (result i32)
  (local $head i32)
  (local $tail i32)
  (local $this|4 i32)
  (local $len i32)
  (local $this|6 i32)
  (local $this|7 i32)
  local.get $this
  i32.eqz
  if
   i32.const 20
   i32.const 15
   call $~lib/rt/stub/__new
   local.set $this
  end
  local.get $this
  i32.const 0
  call $~lib/metashrew-as/assembly/blockdata/block/Block#set:bytes
  local.get $this
  i32.const 0
  call $~lib/metashrew-as/assembly/blockdata/block/Block#set:header
  local.get $this
  i32.const 0
  call $~lib/metashrew-as/assembly/blockdata/block/Block#set:transactions
  local.get $this
  i32.const 0
  call $~lib/metashrew-as/assembly/blockdata/block/Block#set:prevBlock
  local.get $this
  i32.const 0
  call $~lib/metashrew-as/assembly/blockdata/block/Block#set:merkleRoot
  local.get $this
  call $~lib/metashrew-as/assembly/utils/pointer/nullptr<~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Transaction>>
  call $~lib/metashrew-as/assembly/blockdata/block/Block#set:transactions
  local.get $this
  call $~lib/metashrew-as/assembly/utils/pointer/nullptr<~lib/metashrew-as/assembly/utils/box/Box>
  call $~lib/metashrew-as/assembly/blockdata/block/Block#set:prevBlock
  local.get $this
  call $~lib/metashrew-as/assembly/utils/pointer/nullptr<~lib/metashrew-as/assembly/utils/box/Box>
  call $~lib/metashrew-as/assembly/blockdata/block/Block#set:merkleRoot
  local.get $data
  call $~lib/metashrew-as/assembly/utils/box/Box#get:start
  local.set $head
  local.get $this
  i32.const 0
  local.get $data
  call $~lib/metashrew-as/assembly/blockdata/block/Header#constructor
  call $~lib/metashrew-as/assembly/blockdata/block/Block#set:header
  local.get $this
  local.get $data
  call $~lib/metashrew-as/assembly/blockdata/transaction/Transaction.parseTransactionsFromBlock
  call $~lib/metashrew-as/assembly/blockdata/block/Block#set:transactions
  local.get $data
  call $~lib/metashrew-as/assembly/utils/box/Box#get:start
  local.set $tail
  local.get $this
  block $~lib/metashrew-as/assembly/utils/pointer/Pointer#toBox|inlined.7 (result i32)
   local.get $head
   call $~lib/metashrew-as/assembly/utils/pointer/toPointer
   local.set $this|4
   local.get $tail
   local.get $head
   i32.sub
   local.set $len
   i32.const 0
   block $~lib/metashrew-as/assembly/utils/pointer/Pointer#asUsize|inlined.7 (result i32)
    local.get $this|4
    local.set $this|6
    block $~lib/metashrew-as/assembly/utils/pointer/Pointer#asRef<usize>|inlined.7 (result i32)
     local.get $this|6
     local.set $this|7
     local.get $this|7
     br $~lib/metashrew-as/assembly/utils/pointer/Pointer#asRef<usize>|inlined.7
    end
    br $~lib/metashrew-as/assembly/utils/pointer/Pointer#asUsize|inlined.7
   end
   local.get $len
   call $~lib/metashrew-as/assembly/utils/box/Box#constructor
   br $~lib/metashrew-as/assembly/utils/pointer/Pointer#toBox|inlined.7
  end
  call $~lib/metashrew-as/assembly/blockdata/block/Block#set:bytes
  local.get $this
 )
 (func $~lib/polyfills/bswap<u64> (param $value i64) (result i64)
  (local $a i64)
  (local $b i64)
  (local $v i64)
  i32.const 1
  drop
  i32.const 8
  i32.const 1
  i32.eq
  drop
  i32.const 8
  i32.const 2
  i32.eq
  drop
  i32.const 8
  i32.const 4
  i32.eq
  drop
  i32.const 8
  i32.const 8
  i32.eq
  drop
  local.get $value
  i64.const 8
  i64.shr_u
  i64.const 71777214294589695
  i64.and
  local.set $a
  local.get $value
  i64.const 71777214294589695
  i64.and
  i64.const 8
  i64.shl
  local.set $b
  local.get $a
  local.get $b
  i64.or
  local.set $v
  local.get $v
  i64.const 16
  i64.shr_u
  i64.const 281470681808895
  i64.and
  local.set $a
  local.get $v
  i64.const 281470681808895
  i64.and
  i64.const 16
  i64.shl
  local.set $b
  local.get $a
  local.get $b
  i64.or
  i64.const 32
  i64.rotr
  return
 )
 (func $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#unwrap (param $this i32) (result i32)
  local.get $this
  return
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/utils/box/Box>#get:length_ (param $this i32) (result i32)
  local.get $this
  i32.load offset=12
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/utils/box/Box>#set:length_ (param $this i32) (param $length_ i32)
  local.get $this
  local.get $length_
  i32.store offset=12
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/utils/box/Box>#get:dataStart (param $this i32) (result i32)
  local.get $this
  i32.load offset=4
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/utils/box/Box>#__set (param $this i32) (param $index i32) (param $value i32)
  local.get $index
  local.get $this
  call $~lib/array/Array<~lib/metashrew-as/assembly/utils/box/Box>#get:length_
  i32.ge_u
  if
   local.get $index
   i32.const 0
   i32.lt_s
   if
    i32.const 2112
    i32.const 2240
    i32.const 130
    i32.const 22
    call $~lib/builtins/abort
    unreachable
   end
   local.get $this
   local.get $index
   i32.const 1
   i32.add
   i32.const 2
   i32.const 1
   call $~lib/array/ensureCapacity
   local.get $this
   local.get $index
   i32.const 1
   i32.add
   call $~lib/array/Array<~lib/metashrew-as/assembly/utils/box/Box>#set:length_
  end
  local.get $this
  call $~lib/array/Array<~lib/metashrew-as/assembly/utils/box/Box>#get:dataStart
  local.get $index
  i32.const 2
  i32.shl
  i32.add
  local.get $value
  i32.store
  i32.const 1
  drop
  local.get $this
  local.get $value
  i32.const 1
  call $~lib/rt/stub/__link
 )
 (func $~lib/metashrew-as/assembly/utils/box/Box.concat~anonymous|0 (param $r i32) (param $v i32) (param $i i32) (param $ary i32) (result i32)
  local.get $r
  local.get $v
  call $~lib/metashrew-as/assembly/utils/box/Box#get:len
  i32.add
  return
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/utils/box/Box>#reduce<i32> (param $this i32) (param $fn i32) (param $initialValue i32) (result i32)
  (local $acc i32)
  (local $i i32)
  (local $len i32)
  (local $6 i32)
  (local $7 i32)
  local.get $initialValue
  local.set $acc
  i32.const 0
  local.set $i
  local.get $this
  call $~lib/array/Array<~lib/metashrew-as/assembly/utils/box/Box>#get:length_
  local.set $len
  loop $for-loop|0
   local.get $i
   local.get $len
   local.tee $6
   local.get $this
   call $~lib/array/Array<~lib/metashrew-as/assembly/utils/box/Box>#get:length_
   local.tee $7
   local.get $6
   local.get $7
   i32.lt_s
   select
   i32.lt_s
   if
    local.get $acc
    local.get $this
    call $~lib/array/Array<~lib/metashrew-as/assembly/utils/box/Box>#get:dataStart
    local.get $i
    i32.const 2
    i32.shl
    i32.add
    i32.load
    local.get $i
    local.get $this
    i32.const 4
    global.set $~argumentsLength
    local.get $fn
    i32.load
    call_indirect (type $6)
    local.set $acc
    local.get $i
    i32.const 1
    i32.add
    local.set $i
    br $for-loop|0
   end
  end
  local.get $acc
  return
 )
 (func $~lib/metashrew-as/assembly/utils/memcpy/memcpy (param $dest i32) (param $src i32) (param $len i32) (result i32)
  local.get $dest
  local.get $src
  local.get $len
  memory.copy
  local.get $dest
  return
 )
 (func $~lib/metashrew-as/assembly/utils/box/Box.concat~anonymous|1 (param $r i32) (param $v i32) (param $i i32) (param $ary i32) (result i32)
  local.get $r
  local.get $v
  call $~lib/metashrew-as/assembly/utils/box/Box#get:start
  local.get $v
  call $~lib/metashrew-as/assembly/utils/box/Box#get:len
  call $~lib/metashrew-as/assembly/utils/memcpy/memcpy
  drop
  local.get $r
  local.get $v
  call $~lib/metashrew-as/assembly/utils/box/Box#get:len
  i32.add
  return
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/utils/box/Box>#reduce<usize> (param $this i32) (param $fn i32) (param $initialValue i32) (result i32)
  (local $acc i32)
  (local $i i32)
  (local $len i32)
  (local $6 i32)
  (local $7 i32)
  local.get $initialValue
  local.set $acc
  i32.const 0
  local.set $i
  local.get $this
  call $~lib/array/Array<~lib/metashrew-as/assembly/utils/box/Box>#get:length_
  local.set $len
  loop $for-loop|0
   local.get $i
   local.get $len
   local.tee $6
   local.get $this
   call $~lib/array/Array<~lib/metashrew-as/assembly/utils/box/Box>#get:length_
   local.tee $7
   local.get $6
   local.get $7
   i32.lt_s
   select
   i32.lt_s
   if
    local.get $acc
    local.get $this
    call $~lib/array/Array<~lib/metashrew-as/assembly/utils/box/Box>#get:dataStart
    local.get $i
    i32.const 2
    i32.shl
    i32.add
    i32.load
    local.get $i
    local.get $this
    i32.const 4
    global.set $~argumentsLength
    local.get $fn
    i32.load
    call_indirect (type $6)
    local.set $acc
    local.get $i
    i32.const 1
    i32.add
    local.set $i
    br $for-loop|0
   end
  end
  local.get $acc
  return
 )
 (func $~lib/metashrew-as/assembly/utils/box/Box.concat (param $data i32) (result i32)
  (local $result i32)
  i32.const 0
  local.get $data
  i32.const 3504
  i32.const 0
  call $~lib/array/Array<~lib/metashrew-as/assembly/utils/box/Box>#reduce<i32>
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.set $result
  local.get $data
  i32.const 3536
  local.get $result
  call $~lib/array/Array<~lib/metashrew-as/assembly/utils/box/Box>#reduce<usize>
  drop
  local.get $result
  return
 )
 (func $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select (param $this i32) (param $key i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  i32.const 2
  i32.const 2
  i32.const 27
  i32.const 0
  call $~lib/rt/__newArray
  local.set $2
  local.get $2
  i32.load offset=4
  local.set $3
  local.get $2
  i32.const 0
  local.get $this
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#unwrap
  call $~lib/metashrew-as/assembly/utils/box/Box.from
  call $~lib/array/Array<~lib/metashrew-as/assembly/utils/box/Box>#__set
  local.get $2
  i32.const 1
  local.get $key
  call $~lib/metashrew-as/assembly/utils/box/Box.from
  call $~lib/array/Array<~lib/metashrew-as/assembly/utils/box/Box>#__set
  local.get $2
  call $~lib/metashrew-as/assembly/utils/box/Box.concat
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer.wrap
  return
 )
 (func $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#selectValue<u32> (param $this i32) (param $key i32) (result i32)
  (local $keyBytes i32)
  i32.const 0
  i32.const 4
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.set $keyBytes
  local.get $keyBytes
  local.get $key
  i64.extend_i32_u
  call $~lib/polyfills/bswap<u64>
  i64.store32
  local.get $this
  local.get $keyBytes
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
  return
 )
 (func $~lib/metashrew-as/assembly/blockdata/block/Block#get:header (param $this i32) (result i32)
  local.get $this
  i32.load offset=4
 )
 (func $~lib/metashrew-as/assembly/blockdata/block/Header#get:version (param $this i32) (result i32)
  local.get $this
  i32.load
 )
 (func $~lib/metashrew-as/assembly/utils/utils/primitiveToBuffer<i32> (param $value i32) (result i32)
  (local $buffer i32)
  i32.const 0
  i32.const 4
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.set $buffer
  local.get $buffer
  local.get $value
  i32.store
  local.get $buffer
  return
 )
 (func $~lib/metashrew-as/assembly/blockdata/block/Header#get:prevBlock (param $this i32) (result i32)
  local.get $this
  i32.load offset=4
 )
 (func $~lib/metashrew-as/assembly/utils/box/Box#toArrayBuffer (param $this i32) (result i32)
  (local $result i32)
  i32.const 0
  local.get $this
  call $~lib/metashrew-as/assembly/utils/box/Box#get:len
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.set $result
  local.get $result
  local.get $this
  call $~lib/metashrew-as/assembly/utils/box/Box#get:start
  local.get $this
  call $~lib/metashrew-as/assembly/utils/box/Box#get:len
  call $~lib/metashrew-as/assembly/utils/memcpy/memcpy
  drop
  local.get $result
  return
 )
 (func $~lib/metashrew-as/assembly/blockdata/block/Header#get:merkleRoot (param $this i32) (result i32)
  local.get $this
  i32.load offset=8
 )
 (func $~lib/metashrew-as/assembly/blockdata/block/Header#get:time (param $this i32) (result i32)
  local.get $this
  i32.load offset=12
 )
 (func $~lib/metashrew-as/assembly/utils/utils/primitiveToBuffer<u32> (param $value i32) (result i32)
  (local $buffer i32)
  i32.const 0
  i32.const 4
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.set $buffer
  local.get $buffer
  local.get $value
  i32.store
  local.get $buffer
  return
 )
 (func $~lib/metashrew-as/assembly/blockdata/block/Header#get:bits (param $this i32) (result i32)
  local.get $this
  i32.load offset=16
 )
 (func $~lib/metashrew-as/assembly/blockdata/block/Header#get:nonce (param $this i32) (result i32)
  local.get $this
  i32.load offset=20
 )
 (func $~lib/array/Array<~lib/arraybuffer/ArrayBuffer>#get:length_ (param $this i32) (result i32)
  local.get $this
  i32.load offset=12
 )
 (func $~lib/array/Array<~lib/arraybuffer/ArrayBuffer>#set:length_ (param $this i32) (param $length_ i32)
  local.get $this
  local.get $length_
  i32.store offset=12
 )
 (func $~lib/array/Array<~lib/arraybuffer/ArrayBuffer>#get:dataStart (param $this i32) (result i32)
  local.get $this
  i32.load offset=4
 )
 (func $~lib/array/Array<~lib/arraybuffer/ArrayBuffer>#__set (param $this i32) (param $index i32) (param $value i32)
  local.get $index
  local.get $this
  call $~lib/array/Array<~lib/arraybuffer/ArrayBuffer>#get:length_
  i32.ge_u
  if
   local.get $index
   i32.const 0
   i32.lt_s
   if
    i32.const 2112
    i32.const 2240
    i32.const 130
    i32.const 22
    call $~lib/builtins/abort
    unreachable
   end
   local.get $this
   local.get $index
   i32.const 1
   i32.add
   i32.const 2
   i32.const 1
   call $~lib/array/ensureCapacity
   local.get $this
   local.get $index
   i32.const 1
   i32.add
   call $~lib/array/Array<~lib/arraybuffer/ArrayBuffer>#set:length_
  end
  local.get $this
  call $~lib/array/Array<~lib/arraybuffer/ArrayBuffer>#get:dataStart
  local.get $index
  i32.const 2
  i32.shl
  i32.add
  local.get $value
  i32.store
  i32.const 1
  drop
  local.get $this
  local.get $value
  i32.const 1
  call $~lib/rt/stub/__link
 )
 (func $~lib/metashrew-as/assembly/utils/utils/concat~anonymous|0 (param $v i32) (param $i i32) (param $ary i32) (result i32)
  local.get $v
  call $~lib/metashrew-as/assembly/utils/box/Box.from
  return
 )
 (func $~lib/array/Array<~lib/arraybuffer/ArrayBuffer>#map<~lib/metashrew-as/assembly/utils/box/Box> (param $this i32) (param $fn i32) (result i32)
  (local $len i32)
  (local $out i32)
  (local $outStart i32)
  (local $i i32)
  (local $6 i32)
  (local $7 i32)
  (local $result i32)
  local.get $this
  call $~lib/array/Array<~lib/arraybuffer/ArrayBuffer>#get:length_
  local.set $len
  local.get $len
  i32.const 2
  i32.const 27
  i32.const 0
  call $~lib/rt/__newArray
  local.set $out
  local.get $out
  call $~lib/array/Array<~lib/metashrew-as/assembly/utils/box/Box>#get:dataStart
  local.set $outStart
  i32.const 0
  local.set $i
  loop $for-loop|0
   local.get $i
   local.get $len
   local.tee $6
   local.get $this
   call $~lib/array/Array<~lib/arraybuffer/ArrayBuffer>#get:length_
   local.tee $7
   local.get $6
   local.get $7
   i32.lt_s
   select
   i32.lt_s
   if
    local.get $this
    call $~lib/array/Array<~lib/arraybuffer/ArrayBuffer>#get:dataStart
    local.get $i
    i32.const 2
    i32.shl
    i32.add
    i32.load
    local.get $i
    local.get $this
    i32.const 3
    global.set $~argumentsLength
    local.get $fn
    i32.load
    call_indirect (type $3)
    local.set $result
    local.get $outStart
    local.get $i
    i32.const 2
    i32.shl
    i32.add
    local.get $result
    i32.store
    i32.const 1
    drop
    local.get $out
    local.get $result
    i32.const 1
    call $~lib/rt/stub/__link
    local.get $i
    i32.const 1
    i32.add
    local.set $i
    br $for-loop|0
   end
  end
  local.get $out
  return
 )
 (func $~lib/metashrew-as/assembly/utils/utils/concat (param $data i32) (result i32)
  local.get $data
  i32.const 3568
  call $~lib/array/Array<~lib/arraybuffer/ArrayBuffer>#map<~lib/metashrew-as/assembly/utils/box/Box>
  call $~lib/metashrew-as/assembly/utils/box/Box.concat
  return
 )
 (func $~lib/metashrew-as/assembly/blockdata/block/Header#toLeBytes (param $this i32) (result i32)
  (local $vers i32)
  (local $prevBlock i32)
  (local $merkleRoot i32)
  (local $time i32)
  (local $bits i32)
  (local $nonce i32)
  (local $7 i32)
  (local $8 i32)
  local.get $this
  call $~lib/metashrew-as/assembly/blockdata/block/Header#get:version
  call $~lib/metashrew-as/assembly/utils/utils/primitiveToBuffer<i32>
  local.set $vers
  local.get $this
  call $~lib/metashrew-as/assembly/blockdata/block/Header#get:prevBlock
  call $~lib/metashrew-as/assembly/utils/box/Box#toArrayBuffer
  local.set $prevBlock
  local.get $this
  call $~lib/metashrew-as/assembly/blockdata/block/Header#get:merkleRoot
  call $~lib/metashrew-as/assembly/utils/box/Box#toArrayBuffer
  local.set $merkleRoot
  local.get $this
  call $~lib/metashrew-as/assembly/blockdata/block/Header#get:time
  call $~lib/metashrew-as/assembly/utils/utils/primitiveToBuffer<u32>
  local.set $time
  local.get $this
  call $~lib/metashrew-as/assembly/blockdata/block/Header#get:bits
  call $~lib/metashrew-as/assembly/utils/utils/primitiveToBuffer<u32>
  local.set $bits
  local.get $this
  call $~lib/metashrew-as/assembly/blockdata/block/Header#get:nonce
  call $~lib/metashrew-as/assembly/utils/utils/primitiveToBuffer<u32>
  local.set $nonce
  i32.const 6
  i32.const 2
  i32.const 30
  i32.const 0
  call $~lib/rt/__newArray
  local.set $7
  local.get $7
  i32.load offset=4
  local.set $8
  local.get $7
  i32.const 0
  local.get $vers
  call $~lib/array/Array<~lib/arraybuffer/ArrayBuffer>#__set
  local.get $7
  i32.const 1
  local.get $prevBlock
  call $~lib/array/Array<~lib/arraybuffer/ArrayBuffer>#__set
  local.get $7
  i32.const 2
  local.get $merkleRoot
  call $~lib/array/Array<~lib/arraybuffer/ArrayBuffer>#__set
  local.get $7
  i32.const 3
  local.get $time
  call $~lib/array/Array<~lib/arraybuffer/ArrayBuffer>#__set
  local.get $7
  i32.const 4
  local.get $bits
  call $~lib/array/Array<~lib/arraybuffer/ArrayBuffer>#__set
  local.get $7
  i32.const 5
  local.get $nonce
  call $~lib/array/Array<~lib/arraybuffer/ArrayBuffer>#__set
  local.get $7
  call $~lib/metashrew-as/assembly/utils/utils/concat
  return
 )
 (func $~lib/metashrew-as/assembly/utils/sha256/init
  i32.const 1779033703
  global.set $~lib/metashrew-as/assembly/utils/sha256/H0
  i32.const -1150833019
  global.set $~lib/metashrew-as/assembly/utils/sha256/H1
  i32.const 1013904242
  global.set $~lib/metashrew-as/assembly/utils/sha256/H2
  i32.const -1521486534
  global.set $~lib/metashrew-as/assembly/utils/sha256/H3
  i32.const 1359893119
  global.set $~lib/metashrew-as/assembly/utils/sha256/H4
  i32.const -1694144372
  global.set $~lib/metashrew-as/assembly/utils/sha256/H5
  i32.const 528734635
  global.set $~lib/metashrew-as/assembly/utils/sha256/H6
  i32.const 1541459225
  global.set $~lib/metashrew-as/assembly/utils/sha256/H7
  i32.const 0
  global.set $~lib/metashrew-as/assembly/utils/sha256/mLength
  i32.const 0
  global.set $~lib/metashrew-as/assembly/utils/sha256/bytesHashed
 )
 (func $~lib/metashrew-as/assembly/utils/sha256/hashBlocks (param $wPtr i32) (param $mPtr i32)
  (local $ptr i32)
  (local $offset i32)
  (local $firstOffset i32)
  (local $ptr|5 i32)
  (local $offset|6 i32)
  (local $ptr|7 i32)
  (local $offset|8 i32)
  (local $ptr|9 i32)
  (local $offset|10 i32)
  (local $ptr|11 i32)
  (local $offset|12 i32)
  (local $ptr|13 i32)
  (local $offset|14 i32)
  (local $u i32)
  (local $ptr|16 i32)
  (local $offset|17 i32)
  (local $x i32)
  (local $ptr|19 i32)
  (local $offset|20 i32)
  (local $ptr|21 i32)
  (local $offset|22 i32)
  (local $x|23 i32)
  (local $ptr|24 i32)
  (local $offset|25 i32)
  (local $ptr|26 i32)
  (local $offset|27 i32)
  (local $u|28 i32)
  (local $x|29 i32)
  (local $x|30 i32)
  (local $y i32)
  (local $z i32)
  (local $ptr|33 i32)
  (local $offset|34 i32)
  (local $ptr|35 i32)
  (local $offset|36 i32)
  (local $x|37 i32)
  (local $x|38 i32)
  (local $y|39 i32)
  (local $z|40 i32)
  global.get $~lib/metashrew-as/assembly/utils/sha256/H0
  global.set $~lib/metashrew-as/assembly/utils/sha256/a
  global.get $~lib/metashrew-as/assembly/utils/sha256/H1
  global.set $~lib/metashrew-as/assembly/utils/sha256/b
  global.get $~lib/metashrew-as/assembly/utils/sha256/H2
  global.set $~lib/metashrew-as/assembly/utils/sha256/c
  global.get $~lib/metashrew-as/assembly/utils/sha256/H3
  global.set $~lib/metashrew-as/assembly/utils/sha256/d
  global.get $~lib/metashrew-as/assembly/utils/sha256/H4
  global.set $~lib/metashrew-as/assembly/utils/sha256/e
  global.get $~lib/metashrew-as/assembly/utils/sha256/H5
  global.set $~lib/metashrew-as/assembly/utils/sha256/f
  global.get $~lib/metashrew-as/assembly/utils/sha256/H6
  global.set $~lib/metashrew-as/assembly/utils/sha256/g
  global.get $~lib/metashrew-as/assembly/utils/sha256/H7
  global.set $~lib/metashrew-as/assembly/utils/sha256/h
  i32.const 0
  global.set $~lib/metashrew-as/assembly/utils/sha256/i
  loop $for-loop|0
   global.get $~lib/metashrew-as/assembly/utils/sha256/i
   i32.const 16
   i32.lt_u
   if
    local.get $wPtr
    local.set $ptr|13
    global.get $~lib/metashrew-as/assembly/utils/sha256/i
    local.set $offset|14
    block $~lib/metashrew-as/assembly/utils/sha256/load32be|inlined.0 (result i32)
     local.get $mPtr
     local.set $ptr
     global.get $~lib/metashrew-as/assembly/utils/sha256/i
     local.set $offset
     local.get $offset
     i32.const 2
     i32.shl
     local.set $firstOffset
     block $~lib/metashrew-as/assembly/utils/sha256/load8|inlined.0 (result i32)
      local.get $ptr
      local.set $ptr|5
      local.get $firstOffset
      i32.const 0
      i32.add
      local.set $offset|6
      local.get $ptr|5
      local.get $offset|6
      i32.add
      i32.load8_u
      br $~lib/metashrew-as/assembly/utils/sha256/load8|inlined.0
     end
     i32.const 255
     i32.and
     i32.const 24
     i32.shl
     block $~lib/metashrew-as/assembly/utils/sha256/load8|inlined.1 (result i32)
      local.get $ptr
      local.set $ptr|7
      local.get $firstOffset
      i32.const 1
      i32.add
      local.set $offset|8
      local.get $ptr|7
      local.get $offset|8
      i32.add
      i32.load8_u
      br $~lib/metashrew-as/assembly/utils/sha256/load8|inlined.1
     end
     i32.const 255
     i32.and
     i32.const 16
     i32.shl
     i32.or
     block $~lib/metashrew-as/assembly/utils/sha256/load8|inlined.2 (result i32)
      local.get $ptr
      local.set $ptr|9
      local.get $firstOffset
      i32.const 2
      i32.add
      local.set $offset|10
      local.get $ptr|9
      local.get $offset|10
      i32.add
      i32.load8_u
      br $~lib/metashrew-as/assembly/utils/sha256/load8|inlined.2
     end
     i32.const 255
     i32.and
     i32.const 8
     i32.shl
     i32.or
     block $~lib/metashrew-as/assembly/utils/sha256/load8|inlined.3 (result i32)
      local.get $ptr
      local.set $ptr|11
      local.get $firstOffset
      i32.const 3
      i32.add
      local.set $offset|12
      local.get $ptr|11
      local.get $offset|12
      i32.add
      i32.load8_u
      br $~lib/metashrew-as/assembly/utils/sha256/load8|inlined.3
     end
     i32.const 255
     i32.and
     i32.const 0
     i32.shl
     i32.or
     br $~lib/metashrew-as/assembly/utils/sha256/load32be|inlined.0
    end
    local.set $u
    local.get $ptr|13
    local.get $offset|14
    i32.const 2
    i32.shl
    i32.add
    local.get $u
    i32.store
    global.get $~lib/metashrew-as/assembly/utils/sha256/i
    i32.const 1
    i32.add
    global.set $~lib/metashrew-as/assembly/utils/sha256/i
    br $for-loop|0
   end
  end
  i32.const 16
  global.set $~lib/metashrew-as/assembly/utils/sha256/i
  loop $for-loop|1
   global.get $~lib/metashrew-as/assembly/utils/sha256/i
   i32.const 64
   i32.lt_u
   if
    local.get $wPtr
    local.set $ptr|26
    global.get $~lib/metashrew-as/assembly/utils/sha256/i
    local.set $offset|27
    block $~lib/metashrew-as/assembly/utils/sha256/SIG1|inlined.0 (result i32)
     block $~lib/metashrew-as/assembly/utils/sha256/load32|inlined.0 (result i32)
      local.get $wPtr
      local.set $ptr|16
      global.get $~lib/metashrew-as/assembly/utils/sha256/i
      i32.const 2
      i32.sub
      local.set $offset|17
      local.get $ptr|16
      local.get $offset|17
      i32.const 2
      i32.shl
      i32.add
      i32.load
      br $~lib/metashrew-as/assembly/utils/sha256/load32|inlined.0
     end
     local.set $x
     local.get $x
     i32.const 17
     i32.rotr
     local.get $x
     i32.const 19
     i32.rotr
     i32.xor
     local.get $x
     i32.const 10
     i32.shr_u
     i32.xor
     br $~lib/metashrew-as/assembly/utils/sha256/SIG1|inlined.0
    end
    block $~lib/metashrew-as/assembly/utils/sha256/load32|inlined.1 (result i32)
     local.get $wPtr
     local.set $ptr|19
     global.get $~lib/metashrew-as/assembly/utils/sha256/i
     i32.const 7
     i32.sub
     local.set $offset|20
     local.get $ptr|19
     local.get $offset|20
     i32.const 2
     i32.shl
     i32.add
     i32.load
     br $~lib/metashrew-as/assembly/utils/sha256/load32|inlined.1
    end
    i32.add
    block $~lib/metashrew-as/assembly/utils/sha256/SIG0|inlined.0 (result i32)
     block $~lib/metashrew-as/assembly/utils/sha256/load32|inlined.2 (result i32)
      local.get $wPtr
      local.set $ptr|21
      global.get $~lib/metashrew-as/assembly/utils/sha256/i
      i32.const 15
      i32.sub
      local.set $offset|22
      local.get $ptr|21
      local.get $offset|22
      i32.const 2
      i32.shl
      i32.add
      i32.load
      br $~lib/metashrew-as/assembly/utils/sha256/load32|inlined.2
     end
     local.set $x|23
     local.get $x|23
     i32.const 7
     i32.rotr
     local.get $x|23
     i32.const 18
     i32.rotr
     i32.xor
     local.get $x|23
     i32.const 3
     i32.shr_u
     i32.xor
     br $~lib/metashrew-as/assembly/utils/sha256/SIG0|inlined.0
    end
    i32.add
    block $~lib/metashrew-as/assembly/utils/sha256/load32|inlined.3 (result i32)
     local.get $wPtr
     local.set $ptr|24
     global.get $~lib/metashrew-as/assembly/utils/sha256/i
     i32.const 16
     i32.sub
     local.set $offset|25
     local.get $ptr|24
     local.get $offset|25
     i32.const 2
     i32.shl
     i32.add
     i32.load
     br $~lib/metashrew-as/assembly/utils/sha256/load32|inlined.3
    end
    i32.add
    local.set $u|28
    local.get $ptr|26
    local.get $offset|27
    i32.const 2
    i32.shl
    i32.add
    local.get $u|28
    i32.store
    global.get $~lib/metashrew-as/assembly/utils/sha256/i
    i32.const 1
    i32.add
    global.set $~lib/metashrew-as/assembly/utils/sha256/i
    br $for-loop|1
   end
  end
  i32.const 0
  global.set $~lib/metashrew-as/assembly/utils/sha256/i
  loop $for-loop|2
   global.get $~lib/metashrew-as/assembly/utils/sha256/i
   i32.const 64
   i32.lt_u
   if
    global.get $~lib/metashrew-as/assembly/utils/sha256/h
    block $~lib/metashrew-as/assembly/utils/sha256/EP1|inlined.0 (result i32)
     global.get $~lib/metashrew-as/assembly/utils/sha256/e
     local.set $x|29
     local.get $x|29
     i32.const 6
     i32.rotr
     local.get $x|29
     i32.const 11
     i32.rotr
     i32.xor
     local.get $x|29
     i32.const 25
     i32.rotr
     i32.xor
     br $~lib/metashrew-as/assembly/utils/sha256/EP1|inlined.0
    end
    i32.add
    block $~lib/metashrew-as/assembly/utils/sha256/CH|inlined.0 (result i32)
     global.get $~lib/metashrew-as/assembly/utils/sha256/e
     local.set $x|30
     global.get $~lib/metashrew-as/assembly/utils/sha256/f
     local.set $y
     global.get $~lib/metashrew-as/assembly/utils/sha256/g
     local.set $z
     local.get $x|30
     local.get $y
     i32.and
     local.get $x|30
     i32.const -1
     i32.xor
     local.get $z
     i32.and
     i32.xor
     br $~lib/metashrew-as/assembly/utils/sha256/CH|inlined.0
    end
    i32.add
    block $~lib/metashrew-as/assembly/utils/sha256/load32|inlined.4 (result i32)
     global.get $~lib/metashrew-as/assembly/utils/sha256/kPtr
     local.set $ptr|33
     global.get $~lib/metashrew-as/assembly/utils/sha256/i
     local.set $offset|34
     local.get $ptr|33
     local.get $offset|34
     i32.const 2
     i32.shl
     i32.add
     i32.load
     br $~lib/metashrew-as/assembly/utils/sha256/load32|inlined.4
    end
    i32.add
    block $~lib/metashrew-as/assembly/utils/sha256/load32|inlined.5 (result i32)
     local.get $wPtr
     local.set $ptr|35
     global.get $~lib/metashrew-as/assembly/utils/sha256/i
     local.set $offset|36
     local.get $ptr|35
     local.get $offset|36
     i32.const 2
     i32.shl
     i32.add
     i32.load
     br $~lib/metashrew-as/assembly/utils/sha256/load32|inlined.5
    end
    i32.add
    global.set $~lib/metashrew-as/assembly/utils/sha256/t1
    block $~lib/metashrew-as/assembly/utils/sha256/EP0|inlined.0 (result i32)
     global.get $~lib/metashrew-as/assembly/utils/sha256/a
     local.set $x|37
     local.get $x|37
     i32.const 2
     i32.rotr
     local.get $x|37
     i32.const 13
     i32.rotr
     i32.xor
     local.get $x|37
     i32.const 22
     i32.rotr
     i32.xor
     br $~lib/metashrew-as/assembly/utils/sha256/EP0|inlined.0
    end
    block $~lib/metashrew-as/assembly/utils/sha256/MAJ|inlined.0 (result i32)
     global.get $~lib/metashrew-as/assembly/utils/sha256/a
     local.set $x|38
     global.get $~lib/metashrew-as/assembly/utils/sha256/b
     local.set $y|39
     global.get $~lib/metashrew-as/assembly/utils/sha256/c
     local.set $z|40
     local.get $x|38
     local.get $y|39
     i32.and
     local.get $x|38
     local.get $z|40
     i32.and
     i32.xor
     local.get $y|39
     local.get $z|40
     i32.and
     i32.xor
     br $~lib/metashrew-as/assembly/utils/sha256/MAJ|inlined.0
    end
    i32.add
    global.set $~lib/metashrew-as/assembly/utils/sha256/t2
    global.get $~lib/metashrew-as/assembly/utils/sha256/g
    global.set $~lib/metashrew-as/assembly/utils/sha256/h
    global.get $~lib/metashrew-as/assembly/utils/sha256/f
    global.set $~lib/metashrew-as/assembly/utils/sha256/g
    global.get $~lib/metashrew-as/assembly/utils/sha256/e
    global.set $~lib/metashrew-as/assembly/utils/sha256/f
    global.get $~lib/metashrew-as/assembly/utils/sha256/d
    global.get $~lib/metashrew-as/assembly/utils/sha256/t1
    i32.add
    global.set $~lib/metashrew-as/assembly/utils/sha256/e
    global.get $~lib/metashrew-as/assembly/utils/sha256/c
    global.set $~lib/metashrew-as/assembly/utils/sha256/d
    global.get $~lib/metashrew-as/assembly/utils/sha256/b
    global.set $~lib/metashrew-as/assembly/utils/sha256/c
    global.get $~lib/metashrew-as/assembly/utils/sha256/a
    global.set $~lib/metashrew-as/assembly/utils/sha256/b
    global.get $~lib/metashrew-as/assembly/utils/sha256/t1
    global.get $~lib/metashrew-as/assembly/utils/sha256/t2
    i32.add
    global.set $~lib/metashrew-as/assembly/utils/sha256/a
    global.get $~lib/metashrew-as/assembly/utils/sha256/i
    i32.const 1
    i32.add
    global.set $~lib/metashrew-as/assembly/utils/sha256/i
    br $for-loop|2
   end
  end
  global.get $~lib/metashrew-as/assembly/utils/sha256/H0
  global.get $~lib/metashrew-as/assembly/utils/sha256/a
  i32.add
  global.set $~lib/metashrew-as/assembly/utils/sha256/H0
  global.get $~lib/metashrew-as/assembly/utils/sha256/H1
  global.get $~lib/metashrew-as/assembly/utils/sha256/b
  i32.add
  global.set $~lib/metashrew-as/assembly/utils/sha256/H1
  global.get $~lib/metashrew-as/assembly/utils/sha256/H2
  global.get $~lib/metashrew-as/assembly/utils/sha256/c
  i32.add
  global.set $~lib/metashrew-as/assembly/utils/sha256/H2
  global.get $~lib/metashrew-as/assembly/utils/sha256/H3
  global.get $~lib/metashrew-as/assembly/utils/sha256/d
  i32.add
  global.set $~lib/metashrew-as/assembly/utils/sha256/H3
  global.get $~lib/metashrew-as/assembly/utils/sha256/H4
  global.get $~lib/metashrew-as/assembly/utils/sha256/e
  i32.add
  global.set $~lib/metashrew-as/assembly/utils/sha256/H4
  global.get $~lib/metashrew-as/assembly/utils/sha256/H5
  global.get $~lib/metashrew-as/assembly/utils/sha256/f
  i32.add
  global.set $~lib/metashrew-as/assembly/utils/sha256/H5
  global.get $~lib/metashrew-as/assembly/utils/sha256/H6
  global.get $~lib/metashrew-as/assembly/utils/sha256/g
  i32.add
  global.set $~lib/metashrew-as/assembly/utils/sha256/H6
  global.get $~lib/metashrew-as/assembly/utils/sha256/H7
  global.get $~lib/metashrew-as/assembly/utils/sha256/h
  i32.add
  global.set $~lib/metashrew-as/assembly/utils/sha256/H7
 )
 (func $~lib/metashrew-as/assembly/utils/sha256/update (param $dataPtr i32) (param $dataLength i32)
  (local $dataPos i32)
  (local $i i32)
  i32.const 0
  local.set $dataPos
  global.get $~lib/metashrew-as/assembly/utils/sha256/bytesHashed
  local.get $dataLength
  i32.add
  global.set $~lib/metashrew-as/assembly/utils/sha256/bytesHashed
  global.get $~lib/metashrew-as/assembly/utils/sha256/mLength
  if
   i32.const 64
   global.get $~lib/metashrew-as/assembly/utils/sha256/mLength
   i32.sub
   local.get $dataLength
   i32.le_s
   if
    global.get $~lib/metashrew-as/assembly/utils/sha256/mPtr
    global.get $~lib/metashrew-as/assembly/utils/sha256/mLength
    i32.add
    local.get $dataPtr
    i32.const 64
    global.get $~lib/metashrew-as/assembly/utils/sha256/mLength
    i32.sub
    memory.copy
    global.get $~lib/metashrew-as/assembly/utils/sha256/mLength
    i32.const 64
    global.get $~lib/metashrew-as/assembly/utils/sha256/mLength
    i32.sub
    i32.add
    global.set $~lib/metashrew-as/assembly/utils/sha256/mLength
    local.get $dataPos
    i32.const 64
    global.get $~lib/metashrew-as/assembly/utils/sha256/mLength
    i32.sub
    i32.add
    local.set $dataPos
    local.get $dataLength
    i32.const 64
    global.get $~lib/metashrew-as/assembly/utils/sha256/mLength
    i32.sub
    i32.sub
    local.set $dataLength
    global.get $~lib/metashrew-as/assembly/utils/sha256/wPtr
    global.get $~lib/metashrew-as/assembly/utils/sha256/mPtr
    call $~lib/metashrew-as/assembly/utils/sha256/hashBlocks
    i32.const 0
    global.set $~lib/metashrew-as/assembly/utils/sha256/mLength
   else
    global.get $~lib/metashrew-as/assembly/utils/sha256/mPtr
    global.get $~lib/metashrew-as/assembly/utils/sha256/mLength
    i32.add
    local.get $dataPtr
    local.get $dataLength
    memory.copy
    global.get $~lib/metashrew-as/assembly/utils/sha256/mLength
    local.get $dataLength
    i32.add
    global.set $~lib/metashrew-as/assembly/utils/sha256/mLength
    local.get $dataPos
    local.get $dataLength
    i32.add
    local.set $dataPos
    local.get $dataLength
    local.get $dataLength
    i32.sub
    local.set $dataLength
    return
   end
  end
  i32.const 0
  local.set $i
  loop $for-loop|0
   local.get $i
   local.get $dataLength
   i32.const 64
   i32.div_s
   i32.lt_s
   if
    global.get $~lib/metashrew-as/assembly/utils/sha256/wPtr
    local.get $dataPtr
    local.get $dataPos
    i32.add
    call $~lib/metashrew-as/assembly/utils/sha256/hashBlocks
    local.get $i
    i32.const 1
    i32.add
    local.set $i
    local.get $dataPos
    i32.const 64
    i32.add
    local.set $dataPos
    br $for-loop|0
   end
  end
  local.get $dataLength
  i32.const 63
  i32.and
  if
   global.get $~lib/metashrew-as/assembly/utils/sha256/mPtr
   global.get $~lib/metashrew-as/assembly/utils/sha256/mLength
   i32.add
   local.get $dataPtr
   local.get $dataPos
   i32.add
   local.get $dataLength
   i32.const 63
   i32.and
   memory.copy
   global.get $~lib/metashrew-as/assembly/utils/sha256/mLength
   local.get $dataLength
   i32.const 63
   i32.and
   i32.add
   global.set $~lib/metashrew-as/assembly/utils/sha256/mLength
  end
 )
 (func $~lib/polyfills/bswap<i32> (param $value i32) (result i32)
  i32.const 1
  drop
  i32.const 4
  i32.const 1
  i32.eq
  drop
  i32.const 4
  i32.const 2
  i32.eq
  drop
  i32.const 4
  i32.const 4
  i32.eq
  drop
  local.get $value
  i32.const -16711936
  i32.and
  i32.const 8
  i32.rotl
  local.get $value
  i32.const 16711935
  i32.and
  i32.const 8
  i32.rotr
  i32.or
  return
 )
 (func $~lib/polyfills/bswap<u32> (param $value i32) (result i32)
  i32.const 1
  drop
  i32.const 4
  i32.const 1
  i32.eq
  drop
  i32.const 4
  i32.const 2
  i32.eq
  drop
  i32.const 4
  i32.const 4
  i32.eq
  drop
  local.get $value
  i32.const -16711936
  i32.and
  i32.const 8
  i32.rotl
  local.get $value
  i32.const 16711935
  i32.and
  i32.const 8
  i32.rotr
  i32.or
  return
 )
 (func $~lib/metashrew-as/assembly/utils/sha256/final (param $outPtr i32)
  (local $ptr i32)
  (local $offset i32)
  (local $u i32)
  (local $ptr|4 i32)
  (local $value i32)
  (local $length i32)
  (local $finalPtr i32)
  (local $ptr|8 i32)
  (local $offset|9 i32)
  (local $u|10 i32)
  (local $ptr|11 i32)
  (local $value|12 i32)
  (local $length|13 i32)
  (local $finalPtr|14 i32)
  (local $ptr|15 i32)
  (local $offset|16 i32)
  (local $u|17 i32)
  (local $ptr|18 i32)
  (local $offset|19 i32)
  (local $u|20 i32)
  (local $ptr|21 i32)
  (local $offset|22 i32)
  (local $u|23 i32)
  (local $ptr|24 i32)
  (local $offset|25 i32)
  (local $u|26 i32)
  (local $ptr|27 i32)
  (local $offset|28 i32)
  (local $u|29 i32)
  (local $ptr|30 i32)
  (local $offset|31 i32)
  (local $u|32 i32)
  (local $ptr|33 i32)
  (local $offset|34 i32)
  (local $u|35 i32)
  (local $ptr|36 i32)
  (local $offset|37 i32)
  (local $u|38 i32)
  global.get $~lib/metashrew-as/assembly/utils/sha256/bytesHashed
  i32.const 63
  i32.and
  i32.const 63
  i32.lt_s
  if
   global.get $~lib/metashrew-as/assembly/utils/sha256/mPtr
   local.set $ptr
   global.get $~lib/metashrew-as/assembly/utils/sha256/mLength
   local.set $offset
   i32.const 128
   local.set $u
   local.get $ptr
   local.get $offset
   i32.add
   local.get $u
   i32.store8
   global.get $~lib/metashrew-as/assembly/utils/sha256/mLength
   i32.const 1
   i32.add
   global.set $~lib/metashrew-as/assembly/utils/sha256/mLength
  end
  global.get $~lib/metashrew-as/assembly/utils/sha256/bytesHashed
  i32.const 63
  i32.and
  i32.const 56
  i32.ge_s
  if
   global.get $~lib/metashrew-as/assembly/utils/sha256/mPtr
   global.get $~lib/metashrew-as/assembly/utils/sha256/mLength
   i32.add
   local.set $ptr|4
   i32.const 0
   local.set $value
   i32.const 64
   global.get $~lib/metashrew-as/assembly/utils/sha256/mLength
   i32.sub
   local.set $length
   local.get $ptr|4
   local.get $length
   i32.add
   local.set $finalPtr
   loop $while-continue|0
    local.get $ptr|4
    local.get $finalPtr
    i32.lt_u
    if
     local.get $ptr|4
     local.get $value
     i32.store8
     local.get $ptr|4
     i32.const 1
     i32.add
     local.set $ptr|4
     br $while-continue|0
    end
   end
   global.get $~lib/metashrew-as/assembly/utils/sha256/wPtr
   global.get $~lib/metashrew-as/assembly/utils/sha256/mPtr
   call $~lib/metashrew-as/assembly/utils/sha256/hashBlocks
   i32.const 0
   global.set $~lib/metashrew-as/assembly/utils/sha256/mLength
  end
  global.get $~lib/metashrew-as/assembly/utils/sha256/bytesHashed
  i32.const 63
  i32.and
  i32.const 63
  i32.ge_s
  if
   global.get $~lib/metashrew-as/assembly/utils/sha256/mPtr
   local.set $ptr|8
   global.get $~lib/metashrew-as/assembly/utils/sha256/mLength
   local.set $offset|9
   i32.const 128
   local.set $u|10
   local.get $ptr|8
   local.get $offset|9
   i32.add
   local.get $u|10
   i32.store8
   global.get $~lib/metashrew-as/assembly/utils/sha256/mLength
   i32.const 1
   i32.add
   global.set $~lib/metashrew-as/assembly/utils/sha256/mLength
  end
  global.get $~lib/metashrew-as/assembly/utils/sha256/mPtr
  global.get $~lib/metashrew-as/assembly/utils/sha256/mLength
  i32.add
  local.set $ptr|11
  i32.const 0
  local.set $value|12
  i32.const 64
  global.get $~lib/metashrew-as/assembly/utils/sha256/mLength
  i32.sub
  i32.const 8
  i32.sub
  local.set $length|13
  local.get $ptr|11
  local.get $length|13
  i32.add
  local.set $finalPtr|14
  loop $while-continue|1
   local.get $ptr|11
   local.get $finalPtr|14
   i32.lt_u
   if
    local.get $ptr|11
    local.get $value|12
    i32.store8
    local.get $ptr|11
    i32.const 1
    i32.add
    local.set $ptr|11
    br $while-continue|1
   end
  end
  global.get $~lib/metashrew-as/assembly/utils/sha256/mPtr
  i32.const 64
  i32.add
  i32.const 8
  i32.sub
  global.get $~lib/metashrew-as/assembly/utils/sha256/bytesHashed
  i32.const 536870912
  i32.div_s
  call $~lib/polyfills/bswap<i32>
  i32.store
  global.get $~lib/metashrew-as/assembly/utils/sha256/mPtr
  i32.const 64
  i32.add
  i32.const 4
  i32.sub
  global.get $~lib/metashrew-as/assembly/utils/sha256/bytesHashed
  i32.const 3
  i32.shl
  call $~lib/polyfills/bswap<i32>
  i32.store
  global.get $~lib/metashrew-as/assembly/utils/sha256/wPtr
  global.get $~lib/metashrew-as/assembly/utils/sha256/mPtr
  call $~lib/metashrew-as/assembly/utils/sha256/hashBlocks
  local.get $outPtr
  local.set $ptr|15
  i32.const 0
  local.set $offset|16
  global.get $~lib/metashrew-as/assembly/utils/sha256/H0
  call $~lib/polyfills/bswap<u32>
  local.set $u|17
  local.get $ptr|15
  local.get $offset|16
  i32.const 2
  i32.shl
  i32.add
  local.get $u|17
  i32.store
  local.get $outPtr
  local.set $ptr|18
  i32.const 1
  local.set $offset|19
  global.get $~lib/metashrew-as/assembly/utils/sha256/H1
  call $~lib/polyfills/bswap<u32>
  local.set $u|20
  local.get $ptr|18
  local.get $offset|19
  i32.const 2
  i32.shl
  i32.add
  local.get $u|20
  i32.store
  local.get $outPtr
  local.set $ptr|21
  i32.const 2
  local.set $offset|22
  global.get $~lib/metashrew-as/assembly/utils/sha256/H2
  call $~lib/polyfills/bswap<u32>
  local.set $u|23
  local.get $ptr|21
  local.get $offset|22
  i32.const 2
  i32.shl
  i32.add
  local.get $u|23
  i32.store
  local.get $outPtr
  local.set $ptr|24
  i32.const 3
  local.set $offset|25
  global.get $~lib/metashrew-as/assembly/utils/sha256/H3
  call $~lib/polyfills/bswap<u32>
  local.set $u|26
  local.get $ptr|24
  local.get $offset|25
  i32.const 2
  i32.shl
  i32.add
  local.get $u|26
  i32.store
  local.get $outPtr
  local.set $ptr|27
  i32.const 4
  local.set $offset|28
  global.get $~lib/metashrew-as/assembly/utils/sha256/H4
  call $~lib/polyfills/bswap<u32>
  local.set $u|29
  local.get $ptr|27
  local.get $offset|28
  i32.const 2
  i32.shl
  i32.add
  local.get $u|29
  i32.store
  local.get $outPtr
  local.set $ptr|30
  i32.const 5
  local.set $offset|31
  global.get $~lib/metashrew-as/assembly/utils/sha256/H5
  call $~lib/polyfills/bswap<u32>
  local.set $u|32
  local.get $ptr|30
  local.get $offset|31
  i32.const 2
  i32.shl
  i32.add
  local.get $u|32
  i32.store
  local.get $outPtr
  local.set $ptr|33
  i32.const 6
  local.set $offset|34
  global.get $~lib/metashrew-as/assembly/utils/sha256/H6
  call $~lib/polyfills/bswap<u32>
  local.set $u|35
  local.get $ptr|33
  local.get $offset|34
  i32.const 2
  i32.shl
  i32.add
  local.get $u|35
  i32.store
  local.get $outPtr
  local.set $ptr|36
  i32.const 7
  local.set $offset|37
  global.get $~lib/metashrew-as/assembly/utils/sha256/H7
  call $~lib/polyfills/bswap<u32>
  local.set $u|38
  local.get $ptr|36
  local.get $offset|37
  i32.const 2
  i32.shl
  i32.add
  local.get $u|38
  i32.store
 )
 (func $~lib/metashrew-as/assembly/utils/sha256/sha256 (param $data i32) (result i32)
  (local $output i32)
  i32.const 0
  i32.const 32
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.set $output
  call $~lib/metashrew-as/assembly/utils/sha256/init
  local.get $data
  local.get $data
  call $~lib/arraybuffer/ArrayBuffer#get:byteLength
  call $~lib/metashrew-as/assembly/utils/sha256/update
  local.get $output
  call $~lib/metashrew-as/assembly/utils/sha256/final
  local.get $output
  return
 )
 (func $~lib/metashrew-as/assembly/utils/utils/reverse (param $data i32) (result i32)
  (local $result i32)
  (local $i i32)
  i32.const 0
  local.get $data
  call $~lib/arraybuffer/ArrayBuffer#get:byteLength
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.set $result
  i32.const 0
  local.set $i
  loop $for-loop|0
   local.get $i
   local.get $result
   call $~lib/arraybuffer/ArrayBuffer#get:byteLength
   i32.lt_s
   if
    local.get $result
    local.get $i
    i32.add
    local.get $data
    local.get $result
    call $~lib/arraybuffer/ArrayBuffer#get:byteLength
    i32.add
    local.get $i
    i32.sub
    i32.const 1
    i32.sub
    i32.load8_u
    i32.store8
    local.get $i
    i32.const 1
    i32.add
    local.set $i
    br $for-loop|0
   end
  end
  local.get $result
  return
 )
 (func $~lib/metashrew-as/assembly/utils/sha256/sha256d (param $data i32) (result i32)
  local.get $data
  call $~lib/metashrew-as/assembly/utils/sha256/sha256
  call $~lib/metashrew-as/assembly/utils/sha256/sha256
  call $~lib/metashrew-as/assembly/utils/utils/reverse
  return
 )
 (func $~lib/metashrew-as/assembly/blockdata/block/Block#blockhash (param $this i32) (result i32)
  local.get $this
  call $~lib/metashrew-as/assembly/blockdata/block/Block#get:header
  call $~lib/metashrew-as/assembly/blockdata/block/Header#toLeBytes
  call $~lib/metashrew-as/assembly/utils/sha256/sha256d
  return
 )
 (func $~lib/string/String.UTF8.decodeUnsafe (param $buf i32) (param $len i32) (param $nullTerminated i32) (result i32)
  (local $bufOff i32)
  (local $bufEnd i32)
  (local $str i32)
  (local $strOff i32)
  (local $u0 i32)
  (local $u1 i32)
  (local $u2 i32)
  (local $lo i32)
  (local $hi i32)
  local.get $buf
  local.set $bufOff
  local.get $buf
  local.get $len
  i32.add
  local.set $bufEnd
  local.get $bufEnd
  local.get $bufOff
  i32.ge_u
  i32.eqz
  if
   i32.const 0
   i32.const 1632
   i32.const 770
   i32.const 7
   call $~lib/builtins/abort
   unreachable
  end
  local.get $len
  i32.const 1
  i32.shl
  i32.const 2
  call $~lib/rt/stub/__new
  local.set $str
  local.get $str
  local.set $strOff
  block $while-break|0
   loop $while-continue|0
    local.get $bufOff
    local.get $bufEnd
    i32.lt_u
    if
     local.get $bufOff
     i32.load8_u
     local.set $u0
     local.get $bufOff
     i32.const 1
     i32.add
     local.set $bufOff
     local.get $u0
     i32.const 128
     i32.and
     i32.eqz
     if
      local.get $nullTerminated
      local.get $u0
      i32.eqz
      i32.and
      if
       br $while-break|0
      end
      local.get $strOff
      local.get $u0
      i32.store16
     else
      local.get $bufEnd
      local.get $bufOff
      i32.eq
      if
       br $while-break|0
      end
      local.get $bufOff
      i32.load8_u
      i32.const 63
      i32.and
      local.set $u1
      local.get $bufOff
      i32.const 1
      i32.add
      local.set $bufOff
      local.get $u0
      i32.const 224
      i32.and
      i32.const 192
      i32.eq
      if
       local.get $strOff
       local.get $u0
       i32.const 31
       i32.and
       i32.const 6
       i32.shl
       local.get $u1
       i32.or
       i32.store16
      else
       local.get $bufEnd
       local.get $bufOff
       i32.eq
       if
        br $while-break|0
       end
       local.get $bufOff
       i32.load8_u
       i32.const 63
       i32.and
       local.set $u2
       local.get $bufOff
       i32.const 1
       i32.add
       local.set $bufOff
       local.get $u0
       i32.const 240
       i32.and
       i32.const 224
       i32.eq
       if
        local.get $u0
        i32.const 15
        i32.and
        i32.const 12
        i32.shl
        local.get $u1
        i32.const 6
        i32.shl
        i32.or
        local.get $u2
        i32.or
        local.set $u0
       else
        local.get $bufEnd
        local.get $bufOff
        i32.eq
        if
         br $while-break|0
        end
        local.get $u0
        i32.const 7
        i32.and
        i32.const 18
        i32.shl
        local.get $u1
        i32.const 12
        i32.shl
        i32.or
        local.get $u2
        i32.const 6
        i32.shl
        i32.or
        local.get $bufOff
        i32.load8_u
        i32.const 63
        i32.and
        i32.or
        local.set $u0
        local.get $bufOff
        i32.const 1
        i32.add
        local.set $bufOff
       end
       local.get $u0
       i32.const 65536
       i32.lt_u
       if
        local.get $strOff
        local.get $u0
        i32.store16
       else
        local.get $u0
        i32.const 65536
        i32.sub
        local.set $u0
        local.get $u0
        i32.const 10
        i32.shr_u
        i32.const 55296
        i32.or
        local.set $lo
        local.get $u0
        i32.const 1023
        i32.and
        i32.const 56320
        i32.or
        local.set $hi
        local.get $strOff
        local.get $lo
        local.get $hi
        i32.const 16
        i32.shl
        i32.or
        i32.store
        local.get $strOff
        i32.const 2
        i32.add
        local.set $strOff
       end
      end
     end
     local.get $strOff
     i32.const 2
     i32.add
     local.set $strOff
     br $while-continue|0
    end
   end
  end
  local.get $str
  local.get $strOff
  local.get $str
  i32.sub
  call $~lib/rt/stub/__renew
  return
 )
 (func $~lib/string/String.UTF8.decode (param $buf i32) (param $nullTerminated i32) (result i32)
  local.get $buf
  local.get $buf
  call $~lib/arraybuffer/ArrayBuffer#get:byteLength
  local.get $nullTerminated
  call $~lib/string/String.UTF8.decodeUnsafe
  return
 )
 (func $~lib/metashrew-as/assembly/indexer/index/hash (param $k i32) (result i32)
  local.get $k
  i32.const 0
  call $~lib/string/String.UTF8.decode
  return
 )
 (func $~lib/util/hash/HASH<~lib/string/String> (param $key i32) (result i32)
  (local $key|1 i32)
  (local $h i32)
  (local $len i32)
  (local $pos i32)
  (local $s1 i32)
  (local $s2 i32)
  (local $s3 i32)
  (local $s4 i32)
  (local $end i32)
  (local $h|10 i32)
  (local $key|11 i32)
  (local $h|12 i32)
  (local $key|13 i32)
  (local $h|14 i32)
  (local $key|15 i32)
  (local $h|16 i32)
  (local $key|17 i32)
  (local $end|18 i32)
  i32.const 1
  drop
  block $~lib/util/hash/hashStr|inlined.0 (result i32)
   local.get $key
   local.set $key|1
   local.get $key|1
   i32.const 0
   i32.eq
   if
    i32.const 0
    br $~lib/util/hash/hashStr|inlined.0
   end
   local.get $key|1
   call $~lib/string/String#get:length
   i32.const 1
   i32.shl
   local.set $h
   local.get $h
   local.set $len
   local.get $key|1
   local.set $pos
   local.get $len
   i32.const 16
   i32.ge_u
   if
    i32.const 0
    i32.const -1640531535
    i32.add
    i32.const -2048144777
    i32.add
    local.set $s1
    i32.const 0
    i32.const -2048144777
    i32.add
    local.set $s2
    i32.const 0
    local.set $s3
    i32.const 0
    i32.const -1640531535
    i32.sub
    local.set $s4
    local.get $len
    local.get $pos
    i32.add
    i32.const 16
    i32.sub
    local.set $end
    loop $while-continue|0
     local.get $pos
     local.get $end
     i32.le_u
     if
      block $~lib/util/hash/mix|inlined.0 (result i32)
       local.get $s1
       local.set $h|10
       local.get $pos
       i32.load
       local.set $key|11
       local.get $h|10
       local.get $key|11
       i32.const -2048144777
       i32.mul
       i32.add
       i32.const 13
       i32.rotl
       i32.const -1640531535
       i32.mul
       br $~lib/util/hash/mix|inlined.0
      end
      local.set $s1
      block $~lib/util/hash/mix|inlined.1 (result i32)
       local.get $s2
       local.set $h|12
       local.get $pos
       i32.load offset=4
       local.set $key|13
       local.get $h|12
       local.get $key|13
       i32.const -2048144777
       i32.mul
       i32.add
       i32.const 13
       i32.rotl
       i32.const -1640531535
       i32.mul
       br $~lib/util/hash/mix|inlined.1
      end
      local.set $s2
      block $~lib/util/hash/mix|inlined.2 (result i32)
       local.get $s3
       local.set $h|14
       local.get $pos
       i32.load offset=8
       local.set $key|15
       local.get $h|14
       local.get $key|15
       i32.const -2048144777
       i32.mul
       i32.add
       i32.const 13
       i32.rotl
       i32.const -1640531535
       i32.mul
       br $~lib/util/hash/mix|inlined.2
      end
      local.set $s3
      block $~lib/util/hash/mix|inlined.3 (result i32)
       local.get $s4
       local.set $h|16
       local.get $pos
       i32.load offset=12
       local.set $key|17
       local.get $h|16
       local.get $key|17
       i32.const -2048144777
       i32.mul
       i32.add
       i32.const 13
       i32.rotl
       i32.const -1640531535
       i32.mul
       br $~lib/util/hash/mix|inlined.3
      end
      local.set $s4
      local.get $pos
      i32.const 16
      i32.add
      local.set $pos
      br $while-continue|0
     end
    end
    local.get $h
    local.get $s1
    i32.const 1
    i32.rotl
    local.get $s2
    i32.const 7
    i32.rotl
    i32.add
    local.get $s3
    i32.const 12
    i32.rotl
    i32.add
    local.get $s4
    i32.const 18
    i32.rotl
    i32.add
    i32.add
    local.set $h
   else
    local.get $h
    i32.const 0
    i32.const 374761393
    i32.add
    i32.add
    local.set $h
   end
   local.get $key|1
   local.get $len
   i32.add
   i32.const 4
   i32.sub
   local.set $end|18
   loop $while-continue|1
    local.get $pos
    local.get $end|18
    i32.le_u
    if
     local.get $h
     local.get $pos
     i32.load
     i32.const -1028477379
     i32.mul
     i32.add
     local.set $h
     local.get $h
     i32.const 17
     i32.rotl
     i32.const 668265263
     i32.mul
     local.set $h
     local.get $pos
     i32.const 4
     i32.add
     local.set $pos
     br $while-continue|1
    end
   end
   local.get $key|1
   local.get $len
   i32.add
   local.set $end|18
   loop $while-continue|2
    local.get $pos
    local.get $end|18
    i32.lt_u
    if
     local.get $h
     local.get $pos
     i32.load8_u
     i32.const 374761393
     i32.mul
     i32.add
     local.set $h
     local.get $h
     i32.const 11
     i32.rotl
     i32.const -1640531535
     i32.mul
     local.set $h
     local.get $pos
     i32.const 1
     i32.add
     local.set $pos
     br $while-continue|2
    end
   end
   local.get $h
   local.get $h
   i32.const 15
   i32.shr_u
   i32.xor
   local.set $h
   local.get $h
   i32.const -2048144777
   i32.mul
   local.set $h
   local.get $h
   local.get $h
   i32.const 13
   i32.shr_u
   i32.xor
   local.set $h
   local.get $h
   i32.const -1028477379
   i32.mul
   local.set $h
   local.get $h
   local.get $h
   i32.const 16
   i32.shr_u
   i32.xor
   local.set $h
   local.get $h
   br $~lib/util/hash/hashStr|inlined.0
  end
  return
 )
 (func $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#get:buckets" (param $this i32) (result i32)
  local.get $this
  i32.load
 )
 (func $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#get:bucketsMask" (param $this i32) (result i32)
  local.get $this
  i32.load offset=4
 )
 (func $"~lib/map/MapEntry<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#get:taggedNext" (param $this i32) (result i32)
  local.get $this
  i32.load offset=8
 )
 (func $"~lib/map/MapEntry<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#get:key" (param $this i32) (result i32)
  local.get $this
  i32.load
 )
 (func $~lib/util/string/compareImpl (param $str1 i32) (param $index1 i32) (param $str2 i32) (param $index2 i32) (param $len i32) (result i32)
  (local $ptr1 i32)
  (local $ptr2 i32)
  (local $7 i32)
  (local $a i32)
  (local $b i32)
  local.get $str1
  local.get $index1
  i32.const 1
  i32.shl
  i32.add
  local.set $ptr1
  local.get $str2
  local.get $index2
  i32.const 1
  i32.shl
  i32.add
  local.set $ptr2
  i32.const 0
  i32.const 2
  i32.lt_s
  drop
  local.get $len
  i32.const 4
  i32.ge_u
  if (result i32)
   local.get $ptr1
   i32.const 7
   i32.and
   local.get $ptr2
   i32.const 7
   i32.and
   i32.or
   i32.eqz
  else
   i32.const 0
  end
  if
   block $do-break|0
    loop $do-loop|0
     local.get $ptr1
     i64.load
     local.get $ptr2
     i64.load
     i64.ne
     if
      br $do-break|0
     end
     local.get $ptr1
     i32.const 8
     i32.add
     local.set $ptr1
     local.get $ptr2
     i32.const 8
     i32.add
     local.set $ptr2
     local.get $len
     i32.const 4
     i32.sub
     local.set $len
     local.get $len
     i32.const 4
     i32.ge_u
     br_if $do-loop|0
    end
   end
  end
  loop $while-continue|1
   local.get $len
   local.tee $7
   i32.const 1
   i32.sub
   local.set $len
   local.get $7
   if
    local.get $ptr1
    i32.load16_u
    local.set $a
    local.get $ptr2
    i32.load16_u
    local.set $b
    local.get $a
    local.get $b
    i32.ne
    if
     local.get $a
     local.get $b
     i32.sub
     return
    end
    local.get $ptr1
    i32.const 2
    i32.add
    local.set $ptr1
    local.get $ptr2
    i32.const 2
    i32.add
    local.set $ptr2
    br $while-continue|1
   end
  end
  i32.const 0
  return
 )
 (func $~lib/string/String.__eq (param $left i32) (param $right i32) (result i32)
  (local $leftLength i32)
  local.get $left
  local.get $right
  i32.eq
  if
   i32.const 1
   return
  end
  local.get $left
  i32.const 0
  i32.eq
  if (result i32)
   i32.const 1
  else
   local.get $right
   i32.const 0
   i32.eq
  end
  if
   i32.const 0
   return
  end
  local.get $left
  call $~lib/string/String#get:length
  local.set $leftLength
  local.get $leftLength
  local.get $right
  call $~lib/string/String#get:length
  i32.ne
  if
   i32.const 0
   return
  end
  local.get $left
  i32.const 0
  local.get $right
  i32.const 0
  local.get $leftLength
  call $~lib/util/string/compareImpl
  i32.eqz
  return
 )
 (func $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#find" (param $this i32) (param $key i32) (param $hashCode i32) (result i32)
  (local $entry i32)
  (local $taggedNext i32)
  local.get $this
  call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#get:buckets"
  local.get $hashCode
  local.get $this
  call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#get:bucketsMask"
  i32.and
  i32.const 4
  i32.mul
  i32.add
  i32.load
  local.set $entry
  loop $while-continue|0
   local.get $entry
   if
    local.get $entry
    call $"~lib/map/MapEntry<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#get:taggedNext"
    local.set $taggedNext
    local.get $taggedNext
    i32.const 1
    i32.and
    i32.eqz
    if (result i32)
     local.get $entry
     call $"~lib/map/MapEntry<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#get:key"
     local.get $key
     call $~lib/string/String.__eq
    else
     i32.const 0
    end
    if
     local.get $entry
     return
    end
    local.get $taggedNext
    i32.const 1
    i32.const -1
    i32.xor
    i32.and
    local.set $entry
    br $while-continue|0
   end
  end
  i32.const 0
  return
 )
 (func $"~lib/map/MapEntry<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set:value" (param $this i32) (param $value i32)
  local.get $this
  local.get $value
  i32.store offset=4
 )
 (func $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#get:entriesOffset" (param $this i32) (result i32)
  local.get $this
  i32.load offset=16
 )
 (func $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#get:entriesCapacity" (param $this i32) (result i32)
  local.get $this
  i32.load offset=12
 )
 (func $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#get:entriesCount" (param $this i32) (result i32)
  local.get $this
  i32.load offset=20
 )
 (func $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#get:entries" (param $this i32) (result i32)
  local.get $this
  i32.load offset=8
 )
 (func $"~lib/map/MapEntry<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set:key" (param $this i32) (param $key i32)
  local.get $this
  local.get $key
  i32.store
 )
 (func $"~lib/map/MapEntry<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#get:value" (param $this i32) (result i32)
  local.get $this
  i32.load offset=4
 )
 (func $"~lib/map/MapEntry<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set:taggedNext" (param $this i32) (param $taggedNext i32)
  local.get $this
  local.get $taggedNext
  i32.store offset=8
 )
 (func $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#rehash" (param $this i32) (param $newBucketsMask i32)
  (local $newBucketsCapacity i32)
  (local $newBuckets i32)
  (local $newEntriesCapacity i32)
  (local $newEntries i32)
  (local $oldPtr i32)
  (local $oldEnd i32)
  (local $newPtr i32)
  (local $oldEntry i32)
  (local $newEntry i32)
  (local $oldEntryKey i32)
  (local $newBucketIndex i32)
  (local $newBucketPtrBase i32)
  local.get $newBucketsMask
  i32.const 1
  i32.add
  local.set $newBucketsCapacity
  i32.const 0
  local.get $newBucketsCapacity
  i32.const 4
  i32.mul
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.set $newBuckets
  local.get $newBucketsCapacity
  i32.const 8
  i32.mul
  i32.const 3
  i32.div_s
  local.set $newEntriesCapacity
  i32.const 0
  local.get $newEntriesCapacity
  block $"~lib/map/ENTRY_SIZE<~lib/string/String,~lib/arraybuffer/ArrayBuffer>|inlined.1" (result i32)
   i32.const 12
   br $"~lib/map/ENTRY_SIZE<~lib/string/String,~lib/arraybuffer/ArrayBuffer>|inlined.1"
  end
  i32.mul
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.set $newEntries
  local.get $this
  call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#get:entries"
  local.set $oldPtr
  local.get $oldPtr
  local.get $this
  call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#get:entriesOffset"
  block $"~lib/map/ENTRY_SIZE<~lib/string/String,~lib/arraybuffer/ArrayBuffer>|inlined.2" (result i32)
   i32.const 12
   br $"~lib/map/ENTRY_SIZE<~lib/string/String,~lib/arraybuffer/ArrayBuffer>|inlined.2"
  end
  i32.mul
  i32.add
  local.set $oldEnd
  local.get $newEntries
  local.set $newPtr
  loop $while-continue|0
   local.get $oldPtr
   local.get $oldEnd
   i32.ne
   if
    local.get $oldPtr
    local.set $oldEntry
    local.get $oldEntry
    call $"~lib/map/MapEntry<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#get:taggedNext"
    i32.const 1
    i32.and
    i32.eqz
    if
     local.get $newPtr
     local.set $newEntry
     local.get $oldEntry
     call $"~lib/map/MapEntry<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#get:key"
     local.set $oldEntryKey
     local.get $newEntry
     local.get $oldEntryKey
     call $"~lib/map/MapEntry<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set:key"
     local.get $newEntry
     local.get $oldEntry
     call $"~lib/map/MapEntry<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#get:value"
     call $"~lib/map/MapEntry<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set:value"
     local.get $oldEntryKey
     call $~lib/util/hash/HASH<~lib/string/String>
     local.get $newBucketsMask
     i32.and
     local.set $newBucketIndex
     local.get $newBuckets
     local.get $newBucketIndex
     i32.const 4
     i32.mul
     i32.add
     local.set $newBucketPtrBase
     local.get $newEntry
     local.get $newBucketPtrBase
     i32.load
     call $"~lib/map/MapEntry<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set:taggedNext"
     local.get $newBucketPtrBase
     local.get $newPtr
     i32.store
     local.get $newPtr
     block $"~lib/map/ENTRY_SIZE<~lib/string/String,~lib/arraybuffer/ArrayBuffer>|inlined.3" (result i32)
      i32.const 12
      br $"~lib/map/ENTRY_SIZE<~lib/string/String,~lib/arraybuffer/ArrayBuffer>|inlined.3"
     end
     i32.add
     local.set $newPtr
    end
    local.get $oldPtr
    block $"~lib/map/ENTRY_SIZE<~lib/string/String,~lib/arraybuffer/ArrayBuffer>|inlined.4" (result i32)
     i32.const 12
     br $"~lib/map/ENTRY_SIZE<~lib/string/String,~lib/arraybuffer/ArrayBuffer>|inlined.4"
    end
    i32.add
    local.set $oldPtr
    br $while-continue|0
   end
  end
  local.get $this
  local.get $newBuckets
  call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set:buckets"
  local.get $this
  local.get $newBucketsMask
  call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set:bucketsMask"
  local.get $this
  local.get $newEntries
  call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set:entries"
  local.get $this
  local.get $newEntriesCapacity
  call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set:entriesCapacity"
  local.get $this
  local.get $this
  call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#get:entriesCount"
  call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set:entriesOffset"
 )
 (func $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set" (param $this i32) (param $key i32) (param $value i32) (result i32)
  (local $hashCode i32)
  (local $entry i32)
  (local $entries i32)
  (local $6 i32)
  (local $bucketPtrBase i32)
  local.get $key
  call $~lib/util/hash/HASH<~lib/string/String>
  local.set $hashCode
  local.get $this
  local.get $key
  local.get $hashCode
  call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#find"
  local.set $entry
  local.get $entry
  if
   local.get $entry
   local.get $value
   call $"~lib/map/MapEntry<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set:value"
   i32.const 1
   drop
   local.get $this
   local.get $value
   i32.const 1
   call $~lib/rt/stub/__link
  else
   local.get $this
   call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#get:entriesOffset"
   local.get $this
   call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#get:entriesCapacity"
   i32.eq
   if
    local.get $this
    local.get $this
    call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#get:entriesCount"
    local.get $this
    call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#get:entriesCapacity"
    i32.const 3
    i32.mul
    i32.const 4
    i32.div_s
    i32.lt_s
    if (result i32)
     local.get $this
     call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#get:bucketsMask"
    else
     local.get $this
     call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#get:bucketsMask"
     i32.const 1
     i32.shl
     i32.const 1
     i32.or
    end
    call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#rehash"
   end
   local.get $this
   call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#get:entries"
   local.set $entries
   local.get $entries
   local.get $this
   local.get $this
   call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#get:entriesOffset"
   local.tee $6
   i32.const 1
   i32.add
   call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set:entriesOffset"
   local.get $6
   block $"~lib/map/ENTRY_SIZE<~lib/string/String,~lib/arraybuffer/ArrayBuffer>|inlined.5" (result i32)
    i32.const 12
    br $"~lib/map/ENTRY_SIZE<~lib/string/String,~lib/arraybuffer/ArrayBuffer>|inlined.5"
   end
   i32.mul
   i32.add
   local.set $entry
   local.get $entry
   local.get $key
   call $"~lib/map/MapEntry<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set:key"
   i32.const 1
   drop
   local.get $this
   local.get $key
   i32.const 1
   call $~lib/rt/stub/__link
   local.get $entry
   local.get $value
   call $"~lib/map/MapEntry<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set:value"
   i32.const 1
   drop
   local.get $this
   local.get $value
   i32.const 1
   call $~lib/rt/stub/__link
   local.get $this
   local.get $this
   call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#get:entriesCount"
   i32.const 1
   i32.add
   call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set:entriesCount"
   local.get $this
   call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#get:buckets"
   local.get $hashCode
   local.get $this
   call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#get:bucketsMask"
   i32.and
   i32.const 4
   i32.mul
   i32.add
   local.set $bucketPtrBase
   local.get $entry
   local.get $bucketPtrBase
   i32.load
   call $"~lib/map/MapEntry<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set:taggedNext"
   local.get $bucketPtrBase
   local.get $entry
   i32.store
  end
  local.get $this
  return
 )
 (func $~lib/metashrew-as/assembly/indexer/index/set (param $k i32) (param $v i32)
  (local $h i32)
  local.get $k
  call $~lib/metashrew-as/assembly/indexer/index/hash
  local.set $h
  global.get $~lib/metashrew-as/assembly/indexer/index/_updates
  local.get $h
  local.get $v
  call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set"
  drop
  global.get $~lib/metashrew-as/assembly/indexer/index/_updateKeys
  local.get $h
  local.get $k
  call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set"
  drop
 )
 (func $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#set (param $this i32) (param $v i32)
  local.get $this
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#unwrap
  call $~lib/metashrew-as/assembly/utils/box/Box.from
  call $~lib/metashrew-as/assembly/utils/box/Box#toArrayBuffer
  local.get $v
  call $~lib/metashrew-as/assembly/indexer/index/set
 )
 (func $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#setValue<u32> (param $this i32) (param $v i32)
  (local $value i32)
  i32.const 0
  i32.const 4
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.set $value
  local.get $value
  local.get $v
  i32.store
  local.get $this
  local.get $value
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#set
 )
 (func $~lib/metashrew-as/assembly/blockdata/block/Block#get:transactions (param $this i32) (result i32)
  local.get $this
  i32.load offset=8
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Transaction>#get:length (param $this i32) (result i32)
  local.get $this
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Transaction>#get:length_
  return
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Transaction>#__get (param $this i32) (param $index i32) (result i32)
  (local $value i32)
  local.get $index
  local.get $this
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Transaction>#get:length_
  i32.ge_u
  if
   i32.const 2112
   i32.const 2240
   i32.const 114
   i32.const 42
   call $~lib/builtins/abort
   unreachable
  end
  local.get $this
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Transaction>#get:dataStart
  local.get $index
  i32.const 2
  i32.shl
  i32.add
  i32.load
  local.set $value
  i32.const 1
  drop
  i32.const 0
  i32.eqz
  drop
  local.get $value
  i32.eqz
  if
   i32.const 3376
   i32.const 2240
   i32.const 118
   i32.const 40
   call $~lib/builtins/abort
   unreachable
  end
  local.get $value
  return
 )
 (func $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#get:_txid (param $this i32) (result i32)
  local.get $this
  i32.load offset=32
 )
 (func $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#get:bytes (param $this i32) (result i32)
  local.get $this
  i32.load
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/utils/box/Box>#set:buffer (param $this i32) (param $buffer i32)
  local.get $this
  local.get $buffer
  i32.store
  local.get $this
  local.get $buffer
  i32.const 0
  call $~lib/rt/stub/__link
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/utils/box/Box>#set:dataStart (param $this i32) (param $dataStart i32)
  local.get $this
  local.get $dataStart
  i32.store offset=4
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/utils/box/Box>#set:byteLength (param $this i32) (param $byteLength i32)
  local.get $this
  local.get $byteLength
  i32.store offset=8
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/utils/box/Box>#constructor (param $this i32) (param $length i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $bufferSize i32)
  (local $buffer i32)
  local.get $this
  i32.eqz
  if
   i32.const 16
   i32.const 27
   call $~lib/rt/stub/__new
   local.set $this
  end
  local.get $this
  i32.const 0
  call $~lib/array/Array<~lib/metashrew-as/assembly/utils/box/Box>#set:buffer
  local.get $this
  i32.const 0
  call $~lib/array/Array<~lib/metashrew-as/assembly/utils/box/Box>#set:dataStart
  local.get $this
  i32.const 0
  call $~lib/array/Array<~lib/metashrew-as/assembly/utils/box/Box>#set:byteLength
  local.get $this
  i32.const 0
  call $~lib/array/Array<~lib/metashrew-as/assembly/utils/box/Box>#set:length_
  local.get $length
  i32.const 1073741820
  i32.const 2
  i32.shr_u
  i32.gt_u
  if
   i32.const 1376
   i32.const 2240
   i32.const 70
   i32.const 60
   call $~lib/builtins/abort
   unreachable
  end
  local.get $length
  local.tee $2
  i32.const 8
  local.tee $3
  local.get $2
  local.get $3
  i32.gt_u
  select
  i32.const 2
  i32.shl
  local.set $bufferSize
  local.get $bufferSize
  i32.const 1
  call $~lib/rt/stub/__new
  local.set $buffer
  i32.const 0
  global.get $~lib/shared/runtime/Runtime.Incremental
  i32.ne
  drop
  local.get $buffer
  i32.const 0
  local.get $bufferSize
  memory.fill
  local.get $this
  local.get $buffer
  call $~lib/array/Array<~lib/metashrew-as/assembly/utils/box/Box>#set:buffer
  local.get $this
  local.get $buffer
  call $~lib/array/Array<~lib/metashrew-as/assembly/utils/box/Box>#set:dataStart
  local.get $this
  local.get $bufferSize
  call $~lib/array/Array<~lib/metashrew-as/assembly/utils/box/Box>#set:byteLength
  local.get $this
  local.get $length
  call $~lib/array/Array<~lib/metashrew-as/assembly/utils/box/Box>#set:length_
  local.get $this
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/utils/box/Box>#push (param $this i32) (param $value i32) (result i32)
  (local $oldLen i32)
  (local $len i32)
  local.get $this
  call $~lib/array/Array<~lib/metashrew-as/assembly/utils/box/Box>#get:length_
  local.set $oldLen
  local.get $oldLen
  i32.const 1
  i32.add
  local.set $len
  local.get $this
  local.get $len
  i32.const 2
  i32.const 1
  call $~lib/array/ensureCapacity
  i32.const 1
  drop
  local.get $this
  call $~lib/array/Array<~lib/metashrew-as/assembly/utils/box/Box>#get:dataStart
  local.get $oldLen
  i32.const 2
  i32.shl
  i32.add
  local.get $value
  i32.store
  local.get $this
  local.get $value
  i32.const 1
  call $~lib/rt/stub/__link
  local.get $this
  local.get $len
  call $~lib/array/Array<~lib/metashrew-as/assembly/utils/box/Box>#set:length_
  local.get $len
  return
 )
 (func $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#get:legacyInputOutputBytes (param $this i32) (result i32)
  local.get $this
  i32.load offset=28
 )
 (func $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#legacyBytes (param $this i32) (result i32)
  (local $this|1 i32)
  (local $len i32)
  (local $this|3 i32)
  (local $this|4 i32)
  (local $version i32)
  (local $this|6 i32)
  (local $len|7 i32)
  (local $this|8 i32)
  (local $this|9 i32)
  (local $locktime i32)
  (local $result i32)
  (local $result|12 i32)
  local.get $this
  call $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#get:flag
  if
   block $~lib/metashrew-as/assembly/utils/pointer/Pointer#toBox|inlined.8 (result i32)
    local.get $this
    call $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#get:bytes
    call $~lib/metashrew-as/assembly/utils/box/Box#get:start
    call $~lib/metashrew-as/assembly/utils/pointer/toPointer
    local.set $this|1
    i32.const 4
    local.set $len
    i32.const 0
    block $~lib/metashrew-as/assembly/utils/pointer/Pointer#asUsize|inlined.8 (result i32)
     local.get $this|1
     local.set $this|3
     block $~lib/metashrew-as/assembly/utils/pointer/Pointer#asRef<usize>|inlined.8 (result i32)
      local.get $this|3
      local.set $this|4
      local.get $this|4
      br $~lib/metashrew-as/assembly/utils/pointer/Pointer#asRef<usize>|inlined.8
     end
     br $~lib/metashrew-as/assembly/utils/pointer/Pointer#asUsize|inlined.8
    end
    local.get $len
    call $~lib/metashrew-as/assembly/utils/box/Box#constructor
    br $~lib/metashrew-as/assembly/utils/pointer/Pointer#toBox|inlined.8
   end
   local.set $version
   block $~lib/metashrew-as/assembly/utils/pointer/Pointer#toBox|inlined.9 (result i32)
    local.get $this
    call $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#get:bytes
    call $~lib/metashrew-as/assembly/utils/box/Box#get:start
    local.get $this
    call $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#get:bytes
    call $~lib/metashrew-as/assembly/utils/box/Box#get:len
    i32.add
    i32.const 4
    i32.sub
    call $~lib/metashrew-as/assembly/utils/pointer/toPointer
    local.set $this|6
    i32.const 4
    local.set $len|7
    i32.const 0
    block $~lib/metashrew-as/assembly/utils/pointer/Pointer#asUsize|inlined.9 (result i32)
     local.get $this|6
     local.set $this|8
     block $~lib/metashrew-as/assembly/utils/pointer/Pointer#asRef<usize>|inlined.9 (result i32)
      local.get $this|8
      local.set $this|9
      local.get $this|9
      br $~lib/metashrew-as/assembly/utils/pointer/Pointer#asRef<usize>|inlined.9
     end
     br $~lib/metashrew-as/assembly/utils/pointer/Pointer#asUsize|inlined.9
    end
    local.get $len|7
    call $~lib/metashrew-as/assembly/utils/box/Box#constructor
    br $~lib/metashrew-as/assembly/utils/pointer/Pointer#toBox|inlined.9
   end
   local.set $locktime
   i32.const 0
   i32.const 0
   call $~lib/array/Array<~lib/metashrew-as/assembly/utils/box/Box>#constructor
   local.set $result
   local.get $result
   local.get $version
   call $~lib/array/Array<~lib/metashrew-as/assembly/utils/box/Box>#push
   drop
   local.get $result
   local.get $this
   call $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#get:legacyInputOutputBytes
   call $~lib/array/Array<~lib/metashrew-as/assembly/utils/box/Box>#push
   drop
   local.get $result
   local.get $locktime
   call $~lib/array/Array<~lib/metashrew-as/assembly/utils/box/Box>#push
   drop
   local.get $result
   return
  else
   i32.const 0
   i32.const 0
   call $~lib/array/Array<~lib/metashrew-as/assembly/utils/box/Box>#constructor
   local.set $result|12
   local.get $result|12
   local.get $this
   call $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#get:bytes
   call $~lib/array/Array<~lib/metashrew-as/assembly/utils/box/Box>#push
   drop
   local.get $result|12
   return
  end
  unreachable
 )
 (func $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#txid (param $this i32) (result i32)
  local.get $this
  call $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#get:_txid
  call $~lib/arraybuffer/ArrayBuffer#get:byteLength
  i32.const 0
  i32.gt_s
  if
   local.get $this
   call $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#get:_txid
   return
  end
  local.get $this
  local.get $this
  call $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#legacyBytes
  call $~lib/metashrew-as/assembly/utils/box/Box.concat
  call $~lib/metashrew-as/assembly/utils/sha256/sha256d
  call $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#set:_txid
  local.get $this
  call $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#get:_txid
  return
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Output>#get:length (param $this i32) (result i32)
  local.get $this
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Output>#get:length_
  return
 )
 (func $~lib/metashrew-as/assembly/blockdata/transaction/OutPoint#set:bytes (param $this i32) (param $bytes i32)
  local.get $this
  local.get $bytes
  i32.store
  local.get $this
  local.get $bytes
  i32.const 0
  call $~lib/rt/stub/__link
 )
 (func $~lib/metashrew-as/assembly/blockdata/transaction/OutPoint#set:txid (param $this i32) (param $txid i32)
  local.get $this
  local.get $txid
  i32.store offset=4
  local.get $this
  local.get $txid
  i32.const 0
  call $~lib/rt/stub/__link
 )
 (func $~lib/metashrew-as/assembly/blockdata/transaction/OutPoint#set:index (param $this i32) (param $index i32)
  local.get $this
  local.get $index
  i32.store offset=8
 )
 (func $~lib/metashrew-as/assembly/utils/box/Box#shrinkBack (param $this i32) (param $distance i32) (result i32)
  local.get $this
  local.get $this
  call $~lib/metashrew-as/assembly/utils/box/Box#get:len
  local.get $distance
  i32.sub
  call $~lib/metashrew-as/assembly/utils/box/Box#set:len
  local.get $this
  return
 )
 (func $~lib/metashrew-as/assembly/blockdata/transaction/OutPoint#constructor (param $this i32) (param $bytes i32) (result i32)
  local.get $this
  i32.eqz
  if
   i32.const 12
   i32.const 32
   call $~lib/rt/stub/__new
   local.set $this
  end
  local.get $this
  i32.const 0
  call $~lib/metashrew-as/assembly/blockdata/transaction/OutPoint#set:bytes
  local.get $this
  i32.const 0
  call $~lib/metashrew-as/assembly/blockdata/transaction/OutPoint#set:txid
  local.get $this
  i32.const 0
  call $~lib/metashrew-as/assembly/blockdata/transaction/OutPoint#set:index
  local.get $this
  call $~lib/metashrew-as/assembly/utils/pointer/nullptr<~lib/metashrew-as/assembly/utils/box/Box>
  call $~lib/metashrew-as/assembly/blockdata/transaction/OutPoint#set:bytes
  local.get $this
  call $~lib/metashrew-as/assembly/utils/pointer/nullptr<~lib/metashrew-as/assembly/utils/box/Box>
  call $~lib/metashrew-as/assembly/blockdata/transaction/OutPoint#set:txid
  local.get $this
  i32.const 0
  call $~lib/metashrew-as/assembly/blockdata/transaction/OutPoint#set:index
  local.get $bytes
  call $~lib/metashrew-as/assembly/utils/box/Box#get:len
  i32.const 36
  i32.eq
  if
   local.get $this
   local.get $bytes
   call $~lib/metashrew-as/assembly/blockdata/transaction/OutPoint#set:bytes
   local.get $this
   local.get $bytes
   i32.const 0
   call $~lib/metashrew-as/assembly/utils/box/Box#sliceFrom
   i32.const 4
   call $~lib/metashrew-as/assembly/utils/box/Box#shrinkBack
   call $~lib/metashrew-as/assembly/blockdata/transaction/OutPoint#set:txid
   local.get $this
   local.get $bytes
   i32.const 32
   call $~lib/metashrew-as/assembly/utils/box/Box#sliceFrom
   call $~lib/metashrew-as/assembly/utils/utils/parsePrimitive<u32>
   call $~lib/metashrew-as/assembly/blockdata/transaction/OutPoint#set:index
  end
  local.get $this
 )
 (func $~lib/metashrew-as/assembly/blockdata/transaction/OutPoint.from (param $txid i32) (param $offset i32) (result i32)
  (local $index i32)
  (local $3 i32)
  (local $4 i32)
  local.get $offset
  call $~lib/metashrew-as/assembly/utils/utils/primitiveToBuffer<u32>
  local.set $index
  i32.const 0
  i32.const 2
  i32.const 2
  i32.const 30
  i32.const 0
  call $~lib/rt/__newArray
  local.set $3
  local.get $3
  i32.load offset=4
  local.set $4
  local.get $3
  i32.const 0
  local.get $txid
  call $~lib/array/Array<~lib/arraybuffer/ArrayBuffer>#__set
  local.get $3
  i32.const 1
  local.get $index
  call $~lib/array/Array<~lib/arraybuffer/ArrayBuffer>#__set
  local.get $3
  call $~lib/metashrew-as/assembly/utils/utils/concat
  call $~lib/metashrew-as/assembly/utils/box/Box.from
  call $~lib/metashrew-as/assembly/blockdata/transaction/OutPoint#constructor
  return
 )
 (func $~lib/metashrew-as/assembly/blockdata/transaction/OutPoint#get:bytes (param $this i32) (result i32)
  local.get $this
  i32.load
 )
 (func $~lib/metashrew-as/assembly/blockdata/transaction/OutPoint#toArrayBuffer (param $this i32) (result i32)
  local.get $this
  call $~lib/metashrew-as/assembly/blockdata/transaction/OutPoint#get:bytes
  call $~lib/metashrew-as/assembly/utils/box/Box#toArrayBuffer
  return
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Output>#__get (param $this i32) (param $index i32) (result i32)
  (local $value i32)
  local.get $index
  local.get $this
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Output>#get:length_
  i32.ge_u
  if
   i32.const 2112
   i32.const 2240
   i32.const 114
   i32.const 42
   call $~lib/builtins/abort
   unreachable
  end
  local.get $this
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Output>#get:dataStart
  local.get $index
  i32.const 2
  i32.shl
  i32.add
  i32.load
  local.set $value
  i32.const 1
  drop
  i32.const 0
  i32.eqz
  drop
  local.get $value
  i32.eqz
  if
   i32.const 3376
   i32.const 2240
   i32.const 118
   i32.const 40
   call $~lib/builtins/abort
   unreachable
  end
  local.get $value
  return
 )
 (func $~lib/metashrew-as/assembly/blockdata/transaction/Output#get:value (param $this i32) (result i64)
  local.get $this
  i64.load offset=8
 )
 (func $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#setValue<u64> (param $this i32) (param $v i64)
  (local $value i32)
  i32.const 0
  i32.const 8
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.set $value
  local.get $value
  local.get $v
  i64.store
  local.get $this
  local.get $value
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#set
 )
 (func $assembly/index/Index.indexOutputValuesForTransaction (param $tx i32)
  (local $txid i32)
  (local $i i32)
  local.get $tx
  call $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#txid
  local.set $txid
  i32.const 0
  local.set $i
  loop $for-loop|0
   local.get $i
   local.get $tx
   call $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#get:outs
   call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Output>#get:length
   i32.lt_s
   if
    global.get $assembly/index/OUTPOINT_TO_VALUE
    local.get $txid
    local.get $i
    call $~lib/metashrew-as/assembly/blockdata/transaction/OutPoint.from
    call $~lib/metashrew-as/assembly/blockdata/transaction/OutPoint#toArrayBuffer
    call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
    local.get $tx
    call $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#get:outs
    local.get $i
    call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Output>#__get
    call $~lib/metashrew-as/assembly/blockdata/transaction/Output#get:value
    call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#setValue<u64>
    local.get $i
    i32.const 1
    i32.add
    local.set $i
    br $for-loop|0
   end
  end
 )
 (func $assembly/index/Index.indexOutputValuesForBlock (param $block i32)
  (local $i i32)
  i32.const 0
  local.set $i
  loop $for-loop|0
   local.get $i
   local.get $block
   call $~lib/metashrew-as/assembly/blockdata/block/Block#get:transactions
   call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Transaction>#get:length
   i32.lt_s
   if
    local.get $block
    call $~lib/metashrew-as/assembly/blockdata/block/Block#get:transactions
    local.get $i
    call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Transaction>#__get
    call $assembly/index/Index.indexOutputValuesForTransaction
    local.get $i
    i32.const 1
    i32.add
    local.set $i
    br $for-loop|0
   end
  end
 )
 (func $~lib/metashrew-as/assembly/blockdata/block/Block#coinbase (param $this i32) (result i32)
  local.get $this
  call $~lib/metashrew-as/assembly/blockdata/block/Block#get:transactions
  i32.const 0
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Transaction>#__get
  return
 )
 (func $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#has" (param $this i32) (param $key i32) (result i32)
  local.get $this
  local.get $key
  local.get $key
  call $~lib/util/hash/HASH<~lib/string/String>
  call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#find"
  i32.const 0
  i32.ne
  return
 )
 (func $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#get" (param $this i32) (param $key i32) (result i32)
  (local $entry i32)
  local.get $this
  local.get $key
  local.get $key
  call $~lib/util/hash/HASH<~lib/string/String>
  call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#find"
  local.set $entry
  local.get $entry
  i32.eqz
  if
   i32.const 3600
   i32.const 3664
   i32.const 105
   i32.const 17
   call $~lib/builtins/abort
   unreachable
  end
  local.get $entry
  call $"~lib/map/MapEntry<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#get:value"
  return
 )
 (func $~lib/metashrew-as/assembly/indexer/index/get (param $k i32) (result i32)
  (local $h i32)
  (local $result i32)
  local.get $k
  call $~lib/metashrew-as/assembly/indexer/index/hash
  local.set $h
  i32.const 0
  local.set $result
  global.get $~lib/metashrew-as/assembly/indexer/index/_updates
  local.get $h
  call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#has"
  i32.eqz
  if
   i32.const 0
   local.get $k
   call $~lib/metashrew-as/assembly/indexer/index/__get_len
   call $~lib/arraybuffer/ArrayBuffer#constructor
   local.set $result
   local.get $k
   local.get $result
   call $~lib/metashrew-as/assembly/indexer/index/__get
   global.get $~lib/metashrew-as/assembly/indexer/index/_updates
   local.get $h
   local.get $result
   call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set"
   drop
   global.get $~lib/metashrew-as/assembly/indexer/index/_updateKeys
   local.get $h
   local.get $result
   call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set"
   drop
  else
   global.get $~lib/metashrew-as/assembly/indexer/index/_updates
   local.get $h
   call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#get"
   local.set $result
  end
  local.get $result
  return
 )
 (func $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#get (param $this i32) (result i32)
  local.get $this
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#unwrap
  call $~lib/metashrew-as/assembly/indexer/index/get
  call $~lib/metashrew-as/assembly/utils/box/Box.from
  call $~lib/metashrew-as/assembly/utils/box/Box#toArrayBuffer
  return
 )
 (func $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#getValue<u64> (param $this i32) (result i64)
  (local $value i32)
  (local $container i32)
  local.get $this
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#get
  local.set $value
  local.get $value
  call $~lib/arraybuffer/ArrayBuffer#get:byteLength
  i32.const 0
  i32.eq
  if
   i64.const 0
   return
  end
  i32.const 0
  i32.const 8
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.set $container
  local.get $container
  local.get $value
  local.get $value
  call $~lib/arraybuffer/ArrayBuffer#get:byteLength
  call $~lib/metashrew-as/assembly/utils/memcpy/memcpy
  drop
  local.get $container
  i64.load
  return
 )
 (func $assembly/index/Index.totalOutputs (param $tx i32) (result i64)
  (local $total i64)
  (local $i i32)
  i64.const 0
  local.set $total
  i32.const 0
  local.set $i
  loop $for-loop|0
   local.get $i
   local.get $tx
   call $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#get:outs
   call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Output>#get:length
   i32.lt_s
   if
    local.get $total
    local.get $tx
    call $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#get:outs
    local.get $i
    call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Output>#__get
    call $~lib/metashrew-as/assembly/blockdata/transaction/Output#get:value
    i64.add
    local.set $total
    local.get $i
    i32.const 1
    i32.add
    local.set $i
    br $for-loop|0
   end
  end
  local.get $total
  return
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Input>#get:length (param $this i32) (result i32)
  local.get $this
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Input>#get:length_
  return
 )
 (func $~lib/metashrew-as/assembly/blockdata/transaction/Input#get:hash (param $this i32) (result i32)
  local.get $this
  i32.load offset=4
 )
 (func $~lib/metashrew-as/assembly/blockdata/transaction/Input#previousOutput (param $this i32) (result i32)
  (local $this|1 i32)
  (local $len i32)
  (local $this|3 i32)
  (local $this|4 i32)
  (local $txid i32)
  (local $this|6 i32)
  (local $len|7 i32)
  (local $this|8 i32)
  (local $this|9 i32)
  (local $vout i32)
  block $~lib/metashrew-as/assembly/utils/pointer/Pointer#toBox|inlined.10 (result i32)
   local.get $this
   call $~lib/metashrew-as/assembly/blockdata/transaction/Input#get:hash
   call $~lib/metashrew-as/assembly/utils/box/Box#get:start
   call $~lib/metashrew-as/assembly/utils/pointer/toPointer
   local.set $this|1
   i32.const 32
   local.set $len
   i32.const 0
   block $~lib/metashrew-as/assembly/utils/pointer/Pointer#asUsize|inlined.10 (result i32)
    local.get $this|1
    local.set $this|3
    block $~lib/metashrew-as/assembly/utils/pointer/Pointer#asRef<usize>|inlined.10 (result i32)
     local.get $this|3
     local.set $this|4
     local.get $this|4
     br $~lib/metashrew-as/assembly/utils/pointer/Pointer#asRef<usize>|inlined.10
    end
    br $~lib/metashrew-as/assembly/utils/pointer/Pointer#asUsize|inlined.10
   end
   local.get $len
   call $~lib/metashrew-as/assembly/utils/box/Box#constructor
   br $~lib/metashrew-as/assembly/utils/pointer/Pointer#toBox|inlined.10
  end
  local.set $txid
  block $~lib/metashrew-as/assembly/utils/pointer/Pointer#toBox|inlined.11 (result i32)
   local.get $this
   call $~lib/metashrew-as/assembly/blockdata/transaction/Input#get:hash
   call $~lib/metashrew-as/assembly/utils/box/Box#get:start
   i32.const 32
   i32.add
   call $~lib/metashrew-as/assembly/utils/pointer/toPointer
   local.set $this|6
   i32.const 4
   local.set $len|7
   i32.const 0
   block $~lib/metashrew-as/assembly/utils/pointer/Pointer#asUsize|inlined.11 (result i32)
    local.get $this|6
    local.set $this|8
    block $~lib/metashrew-as/assembly/utils/pointer/Pointer#asRef<usize>|inlined.11 (result i32)
     local.get $this|8
     local.set $this|9
     local.get $this|9
     br $~lib/metashrew-as/assembly/utils/pointer/Pointer#asRef<usize>|inlined.11
    end
    br $~lib/metashrew-as/assembly/utils/pointer/Pointer#asUsize|inlined.11
   end
   local.get $len|7
   call $~lib/metashrew-as/assembly/utils/box/Box#constructor
   br $~lib/metashrew-as/assembly/utils/pointer/Pointer#toBox|inlined.11
  end
  local.set $vout
  local.get $txid
  call $~lib/metashrew-as/assembly/utils/box/Box#toArrayBuffer
  call $~lib/metashrew-as/assembly/utils/utils/reverse
  local.get $vout
  call $~lib/metashrew-as/assembly/utils/utils/parsePrimitive<u32>
  call $~lib/metashrew-as/assembly/blockdata/transaction/OutPoint.from
  return
 )
 (func $assembly/index/Index.totalInputs (param $tx i32) (result i64)
  (local $total i64)
  (local $i i32)
  i64.const 0
  local.set $total
  i32.const 0
  local.set $i
  loop $for-loop|0
   local.get $i
   local.get $tx
   call $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#get:ins
   call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Input>#get:length
   i32.lt_s
   if
    local.get $total
    global.get $assembly/index/OUTPOINT_TO_VALUE
    local.get $tx
    call $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#get:ins
    local.get $i
    call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Input>#__get
    call $~lib/metashrew-as/assembly/blockdata/transaction/Input#previousOutput
    call $~lib/metashrew-as/assembly/blockdata/transaction/OutPoint#toArrayBuffer
    call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
    call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#getValue<u64>
    i64.add
    local.set $total
    local.get $i
    i32.const 1
    i32.add
    local.set $i
    br $for-loop|0
   end
  end
  local.get $total
  return
 )
 (func $assembly/index/Index.transactionFeesForBlock (param $block i32) (result i64)
  (local $total i64)
  (local $i i32)
  (local $tx i32)
  i64.const 0
  local.set $total
  i32.const 1
  local.set $i
  loop $for-loop|0
   local.get $i
   local.get $block
   call $~lib/metashrew-as/assembly/blockdata/block/Block#get:transactions
   call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Transaction>#get:length
   i32.lt_s
   if
    local.get $block
    call $~lib/metashrew-as/assembly/blockdata/block/Block#get:transactions
    local.get $i
    call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Transaction>#__get
    local.set $tx
    local.get $total
    local.get $tx
    call $assembly/index/Index.totalInputs
    local.get $tx
    call $assembly/index/Index.totalOutputs
    i64.sub
    i64.add
    local.set $total
    local.get $i
    i32.const 1
    i32.add
    local.set $i
    br $for-loop|0
   end
  end
  local.get $total
  return
 )
 (func $~lib/array/Array<u64>#set:buffer (param $this i32) (param $buffer i32)
  local.get $this
  local.get $buffer
  i32.store
  local.get $this
  local.get $buffer
  i32.const 0
  call $~lib/rt/stub/__link
 )
 (func $~lib/array/Array<u64>#set:dataStart (param $this i32) (param $dataStart i32)
  local.get $this
  local.get $dataStart
  i32.store offset=4
 )
 (func $~lib/array/Array<u64>#set:byteLength (param $this i32) (param $byteLength i32)
  local.get $this
  local.get $byteLength
  i32.store offset=8
 )
 (func $~lib/array/Array<u64>#set:length_ (param $this i32) (param $length_ i32)
  local.get $this
  local.get $length_
  i32.store offset=12
 )
 (func $~lib/array/Array<u64>#constructor (param $this i32) (param $length i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $bufferSize i32)
  (local $buffer i32)
  local.get $this
  i32.eqz
  if
   i32.const 16
   i32.const 35
   call $~lib/rt/stub/__new
   local.set $this
  end
  local.get $this
  i32.const 0
  call $~lib/array/Array<u64>#set:buffer
  local.get $this
  i32.const 0
  call $~lib/array/Array<u64>#set:dataStart
  local.get $this
  i32.const 0
  call $~lib/array/Array<u64>#set:byteLength
  local.get $this
  i32.const 0
  call $~lib/array/Array<u64>#set:length_
  local.get $length
  i32.const 1073741820
  i32.const 3
  i32.shr_u
  i32.gt_u
  if
   i32.const 1376
   i32.const 2240
   i32.const 70
   i32.const 60
   call $~lib/builtins/abort
   unreachable
  end
  local.get $length
  local.tee $2
  i32.const 8
  local.tee $3
  local.get $2
  local.get $3
  i32.gt_u
  select
  i32.const 3
  i32.shl
  local.set $bufferSize
  local.get $bufferSize
  i32.const 1
  call $~lib/rt/stub/__new
  local.set $buffer
  i32.const 0
  global.get $~lib/shared/runtime/Runtime.Incremental
  i32.ne
  drop
  local.get $buffer
  i32.const 0
  local.get $bufferSize
  memory.fill
  local.get $this
  local.get $buffer
  call $~lib/array/Array<u64>#set:buffer
  local.get $this
  local.get $buffer
  call $~lib/array/Array<u64>#set:dataStart
  local.get $this
  local.get $bufferSize
  call $~lib/array/Array<u64>#set:byteLength
  local.get $this
  local.get $length
  call $~lib/array/Array<u64>#set:length_
  local.get $this
 )
 (func $~lib/array/Array<u64>#get:length_ (param $this i32) (result i32)
  local.get $this
  i32.load offset=12
 )
 (func $~lib/array/Array<u64>#get:dataStart (param $this i32) (result i32)
  local.get $this
  i32.load offset=4
 )
 (func $~lib/array/Array<u64>#__set (param $this i32) (param $index i32) (param $value i64)
  local.get $index
  local.get $this
  call $~lib/array/Array<u64>#get:length_
  i32.ge_u
  if
   local.get $index
   i32.const 0
   i32.lt_s
   if
    i32.const 2112
    i32.const 2240
    i32.const 130
    i32.const 22
    call $~lib/builtins/abort
    unreachable
   end
   local.get $this
   local.get $index
   i32.const 1
   i32.add
   i32.const 3
   i32.const 1
   call $~lib/array/ensureCapacity
   local.get $this
   local.get $index
   i32.const 1
   i32.add
   call $~lib/array/Array<u64>#set:length_
  end
  local.get $this
  call $~lib/array/Array<u64>#get:dataStart
  local.get $index
  i32.const 3
  i32.shl
  i32.add
  local.get $value
  i64.store
  i32.const 0
  drop
 )
 (func $assembly/index/SatSource#set:ranges (param $this i32) (param $ranges i32)
  local.get $this
  local.get $ranges
  i32.store
  local.get $this
  local.get $ranges
  i32.const 0
  call $~lib/rt/stub/__link
 )
 (func $assembly/index/SatSource#set:pointer (param $this i32) (param $pointer i32)
  local.get $this
  local.get $pointer
  i32.store offset=4
 )
 (func $assembly/index/SatSource#set:offset (param $this i32) (param $offset i64)
  local.get $this
  local.get $offset
  i64.store offset=8
 )
 (func $assembly/index/SatSource#constructor (param $this i32) (param $ranges i32) (result i32)
  local.get $this
  i32.eqz
  if
   i32.const 16
   i32.const 33
   call $~lib/rt/stub/__new
   local.set $this
  end
  local.get $this
  i32.const 0
  call $assembly/index/SatSource#set:ranges
  local.get $this
  i32.const 0
  call $assembly/index/SatSource#set:pointer
  local.get $this
  i64.const 0
  call $assembly/index/SatSource#set:offset
  local.get $this
  local.get $ranges
  call $assembly/index/SatSource#set:ranges
  local.get $this
 )
 (func $assembly/index/SatRanges#set:sats (param $this i32) (param $sats i32)
  local.get $this
  local.get $sats
  i32.store
  local.get $this
  local.get $sats
  i32.const 0
  call $~lib/rt/stub/__link
 )
 (func $assembly/index/SatRanges#set:distances (param $this i32) (param $distances i32)
  local.get $this
  local.get $distances
  i32.store offset=4
  local.get $this
  local.get $distances
  i32.const 0
  call $~lib/rt/stub/__link
 )
 (func $assembly/index/SatRanges#constructor (param $this i32) (param $sats i32) (param $distances i32) (result i32)
  local.get $this
  i32.eqz
  if
   i32.const 8
   i32.const 34
   call $~lib/rt/stub/__new
   local.set $this
  end
  local.get $this
  i32.const 0
  call $assembly/index/SatRanges#set:sats
  local.get $this
  i32.const 0
  call $assembly/index/SatRanges#set:distances
  local.get $this
  local.get $sats
  call $assembly/index/SatRanges#set:sats
  local.get $this
  local.get $distances
  call $assembly/index/SatRanges#set:distances
  local.get $this
 )
 (func $assembly/index/SatSource.range (param $sat i64) (param $distance i64) (result i32)
  (local $sats i32)
  (local $distances i32)
  i32.const 0
  i32.const 1
  call $~lib/array/Array<u64>#constructor
  local.set $sats
  local.get $sats
  i32.const 0
  local.get $sat
  call $~lib/array/Array<u64>#__set
  i32.const 0
  i32.const 1
  call $~lib/array/Array<u64>#constructor
  local.set $distances
  local.get $distances
  i32.const 0
  local.get $distance
  call $~lib/array/Array<u64>#__set
  i32.const 0
  i32.const 0
  local.get $sats
  local.get $distances
  call $assembly/index/SatRanges#constructor
  call $assembly/index/SatSource#constructor
  return
 )
 (func $assembly/index/SatSink#set:target (param $this i32) (param $target i32)
  local.get $this
  local.get $target
  i32.store
  local.get $this
  local.get $target
  i32.const 0
  call $~lib/rt/stub/__link
 )
 (func $assembly/index/SatSink#set:pointer (param $this i32) (param $pointer i32)
  local.get $this
  local.get $pointer
  i32.store offset=4
 )
 (func $assembly/index/SatSink#set:offset (param $this i32) (param $offset i64)
  local.get $this
  local.get $offset
  i64.store offset=8
 )
 (func $assembly/index/SatSink#constructor (param $this i32) (param $target i32) (result i32)
  local.get $this
  i32.eqz
  if
   i32.const 16
   i32.const 36
   call $~lib/rt/stub/__new
   local.set $this
  end
  local.get $this
  i32.const 0
  call $assembly/index/SatSink#set:target
  local.get $this
  i32.const 0
  call $assembly/index/SatSink#set:pointer
  local.get $this
  i64.const 0
  call $assembly/index/SatSink#set:offset
  local.get $this
  local.get $target
  call $assembly/index/SatSink#set:target
  local.get $this
 )
 (func $assembly/index/SatSink.fromTransaction (param $tx i32) (result i32)
  i32.const 0
  local.get $tx
  call $assembly/index/SatSink#constructor
  return
 )
 (func $assembly/index/SatSource#get:pointer (param $this i32) (result i32)
  local.get $this
  i32.load offset=4
 )
 (func $assembly/index/SatSource#get:ranges (param $this i32) (result i32)
  local.get $this
  i32.load
 )
 (func $assembly/index/SatRanges#get:sats (param $this i32) (result i32)
  local.get $this
  i32.load
 )
 (func $~lib/array/Array<u64>#get:length (param $this i32) (result i32)
  local.get $this
  call $~lib/array/Array<u64>#get:length_
  return
 )
 (func $assembly/index/SatSource#get:offset (param $this i32) (result i64)
  local.get $this
  i64.load offset=8
 )
 (func $assembly/index/SatRanges#get:distances (param $this i32) (result i32)
  local.get $this
  i32.load offset=4
 )
 (func $~lib/array/Array<u64>#__get (param $this i32) (param $index i32) (result i64)
  (local $value i64)
  local.get $index
  local.get $this
  call $~lib/array/Array<u64>#get:length_
  i32.ge_u
  if
   i32.const 2112
   i32.const 2240
   i32.const 114
   i32.const 42
   call $~lib/builtins/abort
   unreachable
  end
  local.get $this
  call $~lib/array/Array<u64>#get:dataStart
  local.get $index
  i32.const 3
  i32.shl
  i32.add
  i64.load
  local.set $value
  i32.const 0
  drop
  local.get $value
  return
 )
 (func $assembly/index/SatSource#consumed (param $this i32) (result i32)
  local.get $this
  call $assembly/index/SatSource#get:pointer
  local.get $this
  call $assembly/index/SatSource#get:ranges
  call $assembly/index/SatRanges#get:sats
  call $~lib/array/Array<u64>#get:length
  i32.ge_s
  if (result i32)
   i32.const 1
  else
   local.get $this
   call $assembly/index/SatSource#get:pointer
   local.get $this
   call $assembly/index/SatSource#get:ranges
   call $assembly/index/SatRanges#get:sats
   call $~lib/array/Array<u64>#get:length
   i32.const 1
   i32.sub
   i32.eq
   if (result i32)
    local.get $this
    call $assembly/index/SatSource#get:offset
    local.get $this
    call $assembly/index/SatSource#get:ranges
    call $assembly/index/SatRanges#get:distances
    local.get $this
    call $assembly/index/SatSource#get:ranges
    call $assembly/index/SatRanges#get:distances
    call $~lib/array/Array<u64>#get:length
    i32.const 1
    i32.sub
    call $~lib/array/Array<u64>#__get
    i64.ge_u
   else
    i32.const 0
   end
  end
  return
 )
 (func $assembly/index/SatSink#get:pointer (param $this i32) (result i32)
  local.get $this
  i32.load offset=4
 )
 (func $assembly/index/SatSink#get:target (param $this i32) (result i32)
  local.get $this
  i32.load
 )
 (func $assembly/index/SatSink#get:offset (param $this i32) (result i64)
  local.get $this
  i64.load offset=8
 )
 (func $assembly/index/SatSink#filled (param $this i32) (result i32)
  local.get $this
  call $assembly/index/SatSink#get:pointer
  local.get $this
  call $assembly/index/SatSink#get:target
  call $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#get:outs
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Output>#get:length
  i32.ge_s
  if (result i32)
   i32.const 1
  else
   local.get $this
   call $assembly/index/SatSink#get:pointer
   local.get $this
   call $assembly/index/SatSink#get:target
   call $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#get:outs
   call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Output>#get:length
   i32.const 1
   i32.sub
   i32.eq
   if (result i32)
    local.get $this
    call $assembly/index/SatSink#get:offset
    local.get $this
    call $assembly/index/SatSink#get:target
    call $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#get:outs
    local.get $this
    call $assembly/index/SatSink#get:target
    call $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#get:outs
    call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Output>#get:length
    i32.const 1
    i32.sub
    call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Output>#__get
    call $~lib/metashrew-as/assembly/blockdata/transaction/Output#get:value
    i64.ge_u
   else
    i32.const 0
   end
  end
  return
 )
 (func $assembly/index/SatSink#currentOutpoint (param $this i32) (result i32)
  local.get $this
  call $assembly/index/SatSink#get:target
  call $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#txid
  local.get $this
  call $assembly/index/SatSink#get:pointer
  call $~lib/metashrew-as/assembly/blockdata/transaction/OutPoint.from
  call $~lib/metashrew-as/assembly/blockdata/transaction/OutPoint#toArrayBuffer
  return
 )
 (func $~lib/metashrew-as/assembly/indexer/bst/BST<u64>#get:ptr (param $this i32) (result i32)
  local.get $this
  i32.load
 )
 (func $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#keyword (param $this i32) (param $key i32) (result i32)
  local.get $this
  local.get $key
  i32.const 0
  i32.const 1
  global.set $~argumentsLength
  i32.const 0
  call $~lib/string/String.UTF8.encode@varargs
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
  return
 )
 (func $~lib/metashrew-as/assembly/indexer/bst/BST<u64>#getMaskPointer (param $this i32) (param $partialKey i32) (result i32)
  local.get $this
  call $~lib/metashrew-as/assembly/indexer/bst/BST<u64>#get:ptr
  local.get $partialKey
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
  i32.const 3712
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#keyword
  return
 )
 (func $~lib/metashrew-as/assembly/indexer/bst/isSetU256 (param $mask i32) (param $position i32) (result i32)
  (local $bytePosition i32)
  (local $bitPosition i32)
  (local $existingByte i32)
  (local $bitMask i32)
  local.get $position
  i32.const 8
  i32.div_s
  local.set $bytePosition
  local.get $position
  i32.const 8
  i32.rem_s
  local.set $bitPosition
  local.get $mask
  local.get $bytePosition
  i32.add
  i32.load8_u
  local.set $existingByte
  i32.const 1
  i32.const 7
  local.get $bitPosition
  i32.sub
  i32.const 7
  i32.and
  i32.shl
  local.set $bitMask
  local.get $bitMask
  local.get $existingByte
  i32.and
  i32.const 0
  i32.ne
  return
 )
 (func $~lib/metashrew-as/assembly/indexer/bst/unsetBitU256 (param $mask i32) (param $position i32)
  (local $bytePosition i32)
  (local $bitPosition i32)
  (local $existingByte i32)
  (local $bitMask i32)
  local.get $position
  i32.const 8
  i32.div_s
  local.set $bytePosition
  local.get $position
  i32.const 8
  i32.rem_s
  local.set $bitPosition
  local.get $mask
  local.get $bytePosition
  i32.add
  i32.load8_u
  local.set $existingByte
  i32.const 1
  i32.const 7
  local.get $bitPosition
  i32.sub
  i32.const 7
  i32.and
  i32.shl
  i32.const -1
  i32.xor
  local.set $bitMask
  local.get $mask
  local.get $bytePosition
  i32.add
  local.get $existingByte
  local.get $bitMask
  i32.and
  i32.store8
 )
 (func $~lib/metashrew-as/assembly/indexer/bst/isZeroU256 (param $mask i32) (result i32)
  (local $i i32)
  i32.const 0
  local.set $i
  loop $for-loop|0
   local.get $i
   i32.const 4
   i32.lt_s
   if
    local.get $mask
    i32.const 8
    i32.const 8
    i32.mul
    i32.add
    i64.load
    i64.const 0
    i64.ne
    if
     i32.const 0
     return
    end
    local.get $i
    i32.const 1
    i32.add
    local.set $i
    br $for-loop|0
   end
  end
  i32.const 1
  return
 )
 (func $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#nullify (param $this i32)
  local.get $this
  i32.const 0
  i32.const 0
  call $~lib/arraybuffer/ArrayBuffer#constructor
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#set
 )
 (func $~lib/metashrew-as/assembly/indexer/bst/BST<u64>#unmarkPath (param $this i32) (param $key i64)
  (local $keyBytes i32)
  (local $i i32)
  (local $partialKey i32)
  (local $ptr i32)
  (local $mask i32)
  (local $newMask i32)
  (local $byte i32)
  i32.const 0
  i32.const 8
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.set $keyBytes
  local.get $keyBytes
  local.get $key
  call $~lib/polyfills/bswap<u64>
  i64.store
  i32.const 8
  i32.const 1
  i32.sub
  local.set $i
  block $for-break0
   loop $for-loop|0
    local.get $i
    i32.const 0
    i32.ge_s
    if
     i32.const 0
     local.get $i
     call $~lib/arraybuffer/ArrayBuffer#constructor
     local.set $partialKey
     local.get $i
     i32.const 0
     i32.ne
     if
      local.get $partialKey
      local.get $keyBytes
      local.get $i
      call $~lib/metashrew-as/assembly/utils/memcpy/memcpy
      drop
     end
     local.get $this
     local.get $partialKey
     call $~lib/metashrew-as/assembly/indexer/bst/BST<u64>#getMaskPointer
     local.set $ptr
     local.get $ptr
     call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#get
     local.set $mask
     local.get $mask
     call $~lib/arraybuffer/ArrayBuffer#get:byteLength
     i32.const 0
     i32.eq
     if (result i32)
      i32.const 0
      i32.const 32
      call $~lib/arraybuffer/ArrayBuffer#constructor
     else
      local.get $mask
     end
     local.set $newMask
     local.get $keyBytes
     local.get $i
     i32.add
     i32.load8_u
     local.set $byte
     local.get $newMask
     local.get $byte
     call $~lib/metashrew-as/assembly/indexer/bst/isSetU256
     if
      local.get $newMask
      local.get $byte
      call $~lib/metashrew-as/assembly/indexer/bst/unsetBitU256
     end
     local.get $newMask
     call $~lib/metashrew-as/assembly/indexer/bst/isZeroU256
     if
      local.get $ptr
      call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#nullify
      br $for-break0
     else
      local.get $ptr
      local.get $newMask
      call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#set
     end
     local.get $i
     i32.const 1
     i32.sub
     local.set $i
     br $for-loop|0
    end
   end
  end
 )
 (func $~lib/metashrew-as/assembly/indexer/bst/setBitU256 (param $mask i32) (param $position i32)
  (local $bytePosition i32)
  (local $bitPosition i32)
  (local $existingByte i32)
  (local $newBit i32)
  local.get $position
  i32.const 8
  i32.div_s
  local.set $bytePosition
  local.get $position
  i32.const 8
  i32.rem_s
  local.set $bitPosition
  local.get $mask
  local.get $bytePosition
  i32.add
  i32.load8_u
  local.set $existingByte
  i32.const 1
  i32.const 7
  local.get $bitPosition
  i32.sub
  i32.const 7
  i32.and
  i32.shl
  local.set $newBit
  local.get $mask
  local.get $bytePosition
  i32.add
  local.get $existingByte
  local.get $newBit
  i32.or
  i32.store8
 )
 (func $~lib/metashrew-as/assembly/indexer/bst/BST<u64>#markPath (param $this i32) (param $key i64)
  (local $keyBytes i32)
  (local $i i32)
  (local $partialKey i32)
  (local $ptr i32)
  (local $mask i32)
  (local $newMask i32)
  (local $byte i32)
  (local $isSet i32)
  i32.const 0
  i32.const 8
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.set $keyBytes
  local.get $keyBytes
  local.get $key
  call $~lib/polyfills/bswap<u64>
  i64.store
  i32.const 0
  local.set $i
  loop $for-loop|0
   local.get $i
   i32.const 8
   i32.lt_s
   if
    i32.const 0
    local.get $i
    call $~lib/arraybuffer/ArrayBuffer#constructor
    local.set $partialKey
    local.get $i
    i32.const 0
    i32.ne
    if
     local.get $partialKey
     local.get $keyBytes
     local.get $i
     call $~lib/metashrew-as/assembly/utils/memcpy/memcpy
     drop
    end
    local.get $this
    local.get $partialKey
    call $~lib/metashrew-as/assembly/indexer/bst/BST<u64>#getMaskPointer
    local.set $ptr
    local.get $ptr
    call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#get
    local.set $mask
    local.get $mask
    call $~lib/arraybuffer/ArrayBuffer#get:byteLength
    i32.const 0
    i32.eq
    if (result i32)
     i32.const 0
     i32.const 32
     call $~lib/arraybuffer/ArrayBuffer#constructor
    else
     local.get $mask
    end
    local.set $newMask
    local.get $keyBytes
    local.get $i
    i32.add
    i32.load8_u
    local.set $byte
    local.get $newMask
    local.get $byte
    call $~lib/metashrew-as/assembly/indexer/bst/isSetU256
    local.set $isSet
    local.get $newMask
    local.get $byte
    call $~lib/metashrew-as/assembly/indexer/bst/isSetU256
    i32.eqz
    if
     local.get $newMask
     local.get $byte
     call $~lib/metashrew-as/assembly/indexer/bst/setBitU256
     local.get $ptr
     local.get $newMask
     call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#set
    end
    local.get $i
    i32.const 1
    i32.add
    local.set $i
    br $for-loop|0
   end
  end
 )
 (func $~lib/metashrew-as/assembly/indexer/bst/BST<u64>#set (param $this i32) (param $k i64) (param $v i32)
  (local $key i64)
  (local $keyBytes i32)
  local.get $k
  call $~lib/polyfills/bswap<u64>
  local.set $key
  i32.const 0
  i32.const 8
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.set $keyBytes
  local.get $keyBytes
  local.get $key
  i64.store
  local.get $v
  call $~lib/arraybuffer/ArrayBuffer#get:byteLength
  i32.const 0
  i32.eq
  if
   local.get $this
   local.get $k
   call $~lib/metashrew-as/assembly/indexer/bst/BST<u64>#unmarkPath
  else
   local.get $this
   local.get $k
   call $~lib/metashrew-as/assembly/indexer/bst/BST<u64>#markPath
  end
  local.get $this
  call $~lib/metashrew-as/assembly/indexer/bst/BST<u64>#get:ptr
  local.get $keyBytes
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
  local.get $v
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#set
 )
 (func $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#lengthKey (param $this i32) (result i32)
  local.get $this
  i32.const 3744
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#keyword
  return
 )
 (func $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#getValue<u32> (param $this i32) (result i32)
  (local $value i32)
  (local $container i32)
  local.get $this
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#get
  local.set $value
  local.get $value
  call $~lib/arraybuffer/ArrayBuffer#get:byteLength
  i32.const 0
  i32.eq
  if
   i32.const 0
   return
  end
  i32.const 0
  i32.const 4
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.set $container
  local.get $container
  local.get $value
  local.get $value
  call $~lib/arraybuffer/ArrayBuffer#get:byteLength
  call $~lib/metashrew-as/assembly/utils/memcpy/memcpy
  drop
  local.get $container
  i32.load
  return
 )
 (func $~lib/util/number/decimalCount32 (param $value i32) (result i32)
  local.get $value
  i32.const 100000
  i32.lt_u
  if
   local.get $value
   i32.const 100
   i32.lt_u
   if
    i32.const 1
    local.get $value
    i32.const 10
    i32.ge_u
    i32.add
    return
   else
    i32.const 3
    local.get $value
    i32.const 10000
    i32.ge_u
    i32.add
    local.get $value
    i32.const 1000
    i32.ge_u
    i32.add
    return
   end
   unreachable
  else
   local.get $value
   i32.const 10000000
   i32.lt_u
   if
    i32.const 6
    local.get $value
    i32.const 1000000
    i32.ge_u
    i32.add
    return
   else
    i32.const 8
    local.get $value
    i32.const 1000000000
    i32.ge_u
    i32.add
    local.get $value
    i32.const 100000000
    i32.ge_u
    i32.add
    return
   end
   unreachable
  end
  unreachable
 )
 (func $~lib/util/number/utoa32_dec_lut (param $buffer i32) (param $num i32) (param $offset i32)
  (local $t i32)
  (local $r i32)
  (local $d1 i32)
  (local $d2 i32)
  (local $digits1 i64)
  (local $digits2 i64)
  (local $t|9 i32)
  (local $d1|10 i32)
  (local $digits i32)
  (local $digits|12 i32)
  (local $digit i32)
  loop $while-continue|0
   local.get $num
   i32.const 10000
   i32.ge_u
   if
    local.get $num
    i32.const 10000
    i32.div_u
    local.set $t
    local.get $num
    i32.const 10000
    i32.rem_u
    local.set $r
    local.get $t
    local.set $num
    local.get $r
    i32.const 100
    i32.div_u
    local.set $d1
    local.get $r
    i32.const 100
    i32.rem_u
    local.set $d2
    i32.const 4028
    local.get $d1
    i32.const 2
    i32.shl
    i32.add
    i64.load32_u
    local.set $digits1
    i32.const 4028
    local.get $d2
    i32.const 2
    i32.shl
    i32.add
    i64.load32_u
    local.set $digits2
    local.get $offset
    i32.const 4
    i32.sub
    local.set $offset
    local.get $buffer
    local.get $offset
    i32.const 1
    i32.shl
    i32.add
    local.get $digits1
    local.get $digits2
    i64.const 32
    i64.shl
    i64.or
    i64.store
    br $while-continue|0
   end
  end
  local.get $num
  i32.const 100
  i32.ge_u
  if
   local.get $num
   i32.const 100
   i32.div_u
   local.set $t|9
   local.get $num
   i32.const 100
   i32.rem_u
   local.set $d1|10
   local.get $t|9
   local.set $num
   local.get $offset
   i32.const 2
   i32.sub
   local.set $offset
   i32.const 4028
   local.get $d1|10
   i32.const 2
   i32.shl
   i32.add
   i32.load
   local.set $digits
   local.get $buffer
   local.get $offset
   i32.const 1
   i32.shl
   i32.add
   local.get $digits
   i32.store
  end
  local.get $num
  i32.const 10
  i32.ge_u
  if
   local.get $offset
   i32.const 2
   i32.sub
   local.set $offset
   i32.const 4028
   local.get $num
   i32.const 2
   i32.shl
   i32.add
   i32.load
   local.set $digits|12
   local.get $buffer
   local.get $offset
   i32.const 1
   i32.shl
   i32.add
   local.get $digits|12
   i32.store
  else
   local.get $offset
   i32.const 1
   i32.sub
   local.set $offset
   i32.const 48
   local.get $num
   i32.add
   local.set $digit
   local.get $buffer
   local.get $offset
   i32.const 1
   i32.shl
   i32.add
   local.get $digit
   i32.store16
  end
 )
 (func $~lib/util/number/utoa_hex_lut (param $buffer i32) (param $num i64) (param $offset i32)
  loop $while-continue|0
   local.get $offset
   i32.const 2
   i32.ge_u
   if
    local.get $offset
    i32.const 2
    i32.sub
    local.set $offset
    local.get $buffer
    local.get $offset
    i32.const 1
    i32.shl
    i32.add
    i32.const 4448
    local.get $num
    i32.wrap_i64
    i32.const 255
    i32.and
    i32.const 2
    i32.shl
    i32.add
    i32.load
    i32.store
    local.get $num
    i64.const 8
    i64.shr_u
    local.set $num
    br $while-continue|0
   end
  end
  local.get $offset
  i32.const 1
  i32.and
  if
   local.get $buffer
   i32.const 4448
   local.get $num
   i32.wrap_i64
   i32.const 6
   i32.shl
   i32.add
   i32.load16_u
   i32.store16
  end
 )
 (func $~lib/util/number/ulog_base (param $num i64) (param $base i32) (result i32)
  (local $value i32)
  (local $b64 i64)
  (local $b i64)
  (local $e i32)
  block $~lib/util/number/isPowerOf2<i32>|inlined.0 (result i32)
   local.get $base
   local.set $value
   local.get $value
   i32.popcnt
   i32.const 1
   i32.eq
   br $~lib/util/number/isPowerOf2<i32>|inlined.0
  end
  if
   i32.const 63
   local.get $num
   i64.clz
   i32.wrap_i64
   i32.sub
   i32.const 31
   local.get $base
   i32.clz
   i32.sub
   i32.div_u
   i32.const 1
   i32.add
   return
  end
  local.get $base
  i64.extend_i32_s
  local.set $b64
  local.get $b64
  local.set $b
  i32.const 1
  local.set $e
  loop $while-continue|0
   local.get $num
   local.get $b
   i64.ge_u
   if
    local.get $num
    local.get $b
    i64.div_u
    local.set $num
    local.get $b
    local.get $b
    i64.mul
    local.set $b
    local.get $e
    i32.const 1
    i32.shl
    local.set $e
    br $while-continue|0
   end
  end
  loop $while-continue|1
   local.get $num
   i64.const 1
   i64.ge_u
   if
    local.get $num
    local.get $b64
    i64.div_u
    local.set $num
    local.get $e
    i32.const 1
    i32.add
    local.set $e
    br $while-continue|1
   end
  end
  local.get $e
  i32.const 1
  i32.sub
  return
 )
 (func $~lib/util/number/utoa64_any_core (param $buffer i32) (param $num i64) (param $offset i32) (param $radix i32)
  (local $base i64)
  (local $shift i64)
  (local $mask i64)
  (local $q i64)
  local.get $radix
  i64.extend_i32_s
  local.set $base
  local.get $radix
  local.get $radix
  i32.const 1
  i32.sub
  i32.and
  i32.const 0
  i32.eq
  if
   local.get $radix
   i32.ctz
   i32.const 7
   i32.and
   i64.extend_i32_s
   local.set $shift
   local.get $base
   i64.const 1
   i64.sub
   local.set $mask
   loop $do-loop|0
    local.get $offset
    i32.const 1
    i32.sub
    local.set $offset
    local.get $buffer
    local.get $offset
    i32.const 1
    i32.shl
    i32.add
    i32.const 5504
    local.get $num
    local.get $mask
    i64.and
    i32.wrap_i64
    i32.const 1
    i32.shl
    i32.add
    i32.load16_u
    i32.store16
    local.get $num
    local.get $shift
    i64.shr_u
    local.set $num
    local.get $num
    i64.const 0
    i64.ne
    br_if $do-loop|0
   end
  else
   loop $do-loop|1
    local.get $offset
    i32.const 1
    i32.sub
    local.set $offset
    local.get $num
    local.get $base
    i64.div_u
    local.set $q
    local.get $buffer
    local.get $offset
    i32.const 1
    i32.shl
    i32.add
    i32.const 5504
    local.get $num
    local.get $q
    local.get $base
    i64.mul
    i64.sub
    i32.wrap_i64
    i32.const 1
    i32.shl
    i32.add
    i32.load16_u
    i32.store16
    local.get $q
    local.set $num
    local.get $num
    i64.const 0
    i64.ne
    br_if $do-loop|1
   end
  end
 )
 (func $~lib/util/number/utoa32 (param $value i32) (param $radix i32) (result i32)
  (local $out i32)
  (local $decimals i32)
  (local $buffer i32)
  (local $num i32)
  (local $offset i32)
  (local $decimals|7 i32)
  (local $buffer|8 i32)
  (local $num|9 i32)
  (local $offset|10 i32)
  (local $decimals|11 i32)
  local.get $radix
  i32.const 2
  i32.lt_s
  if (result i32)
   i32.const 1
  else
   local.get $radix
   i32.const 36
   i32.gt_s
  end
  if
   i32.const 3824
   i32.const 3952
   i32.const 350
   i32.const 5
   call $~lib/builtins/abort
   unreachable
  end
  local.get $value
  i32.eqz
  if
   i32.const 4016
   return
  end
  local.get $radix
  i32.const 10
  i32.eq
  if
   local.get $value
   call $~lib/util/number/decimalCount32
   local.set $decimals
   local.get $decimals
   i32.const 1
   i32.shl
   i32.const 2
   call $~lib/rt/stub/__new
   local.set $out
   local.get $out
   local.set $buffer
   local.get $value
   local.set $num
   local.get $decimals
   local.set $offset
   i32.const 0
   i32.const 1
   i32.ge_s
   drop
   local.get $buffer
   local.get $num
   local.get $offset
   call $~lib/util/number/utoa32_dec_lut
  else
   local.get $radix
   i32.const 16
   i32.eq
   if
    i32.const 31
    local.get $value
    i32.clz
    i32.sub
    i32.const 2
    i32.shr_s
    i32.const 1
    i32.add
    local.set $decimals|7
    local.get $decimals|7
    i32.const 1
    i32.shl
    i32.const 2
    call $~lib/rt/stub/__new
    local.set $out
    local.get $out
    local.set $buffer|8
    local.get $value
    local.set $num|9
    local.get $decimals|7
    local.set $offset|10
    i32.const 0
    i32.const 1
    i32.ge_s
    drop
    local.get $buffer|8
    local.get $num|9
    i64.extend_i32_u
    local.get $offset|10
    call $~lib/util/number/utoa_hex_lut
   else
    local.get $value
    i64.extend_i32_u
    local.get $radix
    call $~lib/util/number/ulog_base
    local.set $decimals|11
    local.get $decimals|11
    i32.const 1
    i32.shl
    i32.const 2
    call $~lib/rt/stub/__new
    local.set $out
    local.get $out
    local.get $value
    i64.extend_i32_u
    local.get $decimals|11
    local.get $radix
    call $~lib/util/number/utoa64_any_core
   end
  end
  local.get $out
  return
 )
 (func $~lib/number/U32#toString (param $this i32) (param $radix i32) (result i32)
  local.get $this
  local.get $radix
  call $~lib/util/number/utoa32
  return
 )
 (func $~lib/string/String#concat (param $this i32) (param $other i32) (result i32)
  (local $thisSize i32)
  (local $otherSize i32)
  (local $outSize i32)
  (local $out i32)
  local.get $this
  call $~lib/string/String#get:length
  i32.const 1
  i32.shl
  local.set $thisSize
  local.get $other
  call $~lib/string/String#get:length
  i32.const 1
  i32.shl
  local.set $otherSize
  local.get $thisSize
  local.get $otherSize
  i32.add
  local.set $outSize
  local.get $outSize
  i32.const 0
  i32.eq
  if
   i32.const 5600
   return
  end
  local.get $outSize
  i32.const 2
  call $~lib/rt/stub/__new
  local.set $out
  local.get $out
  local.get $this
  local.get $thisSize
  memory.copy
  local.get $out
  local.get $thisSize
  i32.add
  local.get $other
  local.get $otherSize
  memory.copy
  local.get $out
  return
 )
 (func $~lib/string/String.__concat (param $left i32) (param $right i32) (result i32)
  local.get $left
  local.get $right
  call $~lib/string/String#concat
  return
 )
 (func $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#selectIndex (param $this i32) (param $index i32) (result i32)
  local.get $this
  i32.const 3792
  local.get $index
  i32.const 10
  call $~lib/number/U32#toString
  call $~lib/string/String.__concat
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#keyword
  return
 )
 (func $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#extend (param $this i32) (result i32)
  (local $lengthKey i32)
  (local $length i32)
  local.get $this
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#lengthKey
  local.set $lengthKey
  local.get $lengthKey
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#getValue<u32>
  local.set $length
  local.get $lengthKey
  local.get $length
  i32.const 1
  i32.add
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#setValue<u32>
  local.get $this
  local.get $length
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#selectIndex
  return
 )
 (func $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#appendValue<u64> (param $this i32) (param $v i64)
  local.get $this
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#extend
  local.get $v
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#setValue<u64>
 )
 (func $assembly/index/SatSink#consume (param $this i32) (param $source i32)
  (local $sourceRemaining i64)
  (local $targetRemaining i64)
  (local $outpoint i32)
  (local $sat i64)
  loop $while-continue|0
   local.get $source
   call $assembly/index/SatSource#consumed
   i32.eqz
   if (result i32)
    local.get $this
    call $assembly/index/SatSink#filled
    i32.eqz
   else
    i32.const 0
   end
   if
    local.get $source
    call $assembly/index/SatSource#get:ranges
    call $assembly/index/SatRanges#get:distances
    local.get $source
    call $assembly/index/SatSource#get:pointer
    call $~lib/array/Array<u64>#__get
    local.get $source
    call $assembly/index/SatSource#get:offset
    i64.sub
    local.set $sourceRemaining
    local.get $this
    call $assembly/index/SatSink#get:target
    call $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#get:outs
    local.get $this
    call $assembly/index/SatSink#get:pointer
    call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Output>#__get
    call $~lib/metashrew-as/assembly/blockdata/transaction/Output#get:value
    local.get $this
    call $assembly/index/SatSink#get:offset
    i64.sub
    local.set $targetRemaining
    local.get $this
    call $assembly/index/SatSink#currentOutpoint
    local.set $outpoint
    local.get $source
    call $assembly/index/SatSource#get:ranges
    call $assembly/index/SatRanges#get:sats
    local.get $source
    call $assembly/index/SatSource#get:pointer
    call $~lib/array/Array<u64>#__get
    local.get $source
    call $assembly/index/SatSource#get:offset
    i64.add
    local.set $sat
    global.get $assembly/index/SAT_TO_OUTPOINT
    local.get $sat
    local.get $outpoint
    call $~lib/metashrew-as/assembly/indexer/bst/BST<u64>#set
    global.get $assembly/index/OUTPOINT_TO_SAT
    local.get $outpoint
    call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
    local.get $sat
    call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#appendValue<u64>
    local.get $targetRemaining
    local.get $sourceRemaining
    i64.lt_u
    if
     local.get $this
     local.get $this
     call $assembly/index/SatSink#get:pointer
     i32.const 1
     i32.add
     call $assembly/index/SatSink#set:pointer
     local.get $this
     i64.const 0
     call $assembly/index/SatSink#set:offset
     local.get $source
     local.get $source
     call $assembly/index/SatSource#get:offset
     local.get $targetRemaining
     i64.add
     call $assembly/index/SatSource#set:offset
    else
     local.get $sourceRemaining
     local.get $targetRemaining
     i64.lt_u
     if
      local.get $source
      local.get $source
      call $assembly/index/SatSource#get:pointer
      i32.const 1
      i32.add
      call $assembly/index/SatSource#set:pointer
      local.get $source
      i64.const 0
      call $assembly/index/SatSource#set:offset
      local.get $this
      local.get $this
      call $assembly/index/SatSink#get:offset
      local.get $sourceRemaining
      i64.add
      call $assembly/index/SatSink#set:offset
     else
      local.get $source
      i64.const 0
      call $assembly/index/SatSource#set:offset
      local.get $source
      local.get $source
      call $assembly/index/SatSource#get:pointer
      i32.const 1
      i32.add
      call $assembly/index/SatSource#set:pointer
      local.get $this
      i64.const 0
      call $assembly/index/SatSink#set:offset
      local.get $this
      local.get $this
      call $assembly/index/SatSink#get:pointer
      i32.const 1
      i32.add
      call $assembly/index/SatSink#set:pointer
     end
    end
    br $while-continue|0
   end
  end
 )
 (func $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#length (param $this i32) (result i32)
  local.get $this
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#lengthKey
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#getValue<u32>
  return
 )
 (func $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#getListValues<u64> (param $this i32) (result i32)
  (local $result i32)
  (local $i i32)
  i32.const 0
  local.get $this
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#length
  call $~lib/array/Array<u64>#constructor
  local.set $result
  i32.const 0
  local.set $i
  loop $for-loop|0
   local.get $i
   local.get $result
   call $~lib/array/Array<u64>#get:length
   i32.lt_s
   if
    local.get $result
    local.get $i
    local.get $this
    local.get $i
    call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#selectIndex
    call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#getValue<u64>
    call $~lib/array/Array<u64>#__set
    local.get $i
    i32.const 1
    i32.add
    local.set $i
    br $for-loop|0
   end
  end
  local.get $result
  return
 )
 (func $assembly/index/SatRanges.fromTransaction~anonymous|0 (param $v i32) (param $$1 i32) (param $$2 i32) (result i32)
  global.get $assembly/index/OUTPOINT_TO_SAT
  local.get $v
  call $~lib/metashrew-as/assembly/blockdata/transaction/Input#previousOutput
  call $~lib/metashrew-as/assembly/blockdata/transaction/OutPoint#toArrayBuffer
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#getListValues<u64>
 )
 (func $~lib/array/Array<~lib/array/Array<u64>>#get:dataStart (param $this i32) (result i32)
  local.get $this
  i32.load offset=4
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Input>#map<~lib/array/Array<u64>> (param $this i32) (param $fn i32) (result i32)
  (local $len i32)
  (local $out i32)
  (local $outStart i32)
  (local $i i32)
  (local $6 i32)
  (local $7 i32)
  (local $result i32)
  local.get $this
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Input>#get:length_
  local.set $len
  local.get $len
  i32.const 2
  i32.const 37
  i32.const 0
  call $~lib/rt/__newArray
  local.set $out
  local.get $out
  call $~lib/array/Array<~lib/array/Array<u64>>#get:dataStart
  local.set $outStart
  i32.const 0
  local.set $i
  loop $for-loop|0
   local.get $i
   local.get $len
   local.tee $6
   local.get $this
   call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Input>#get:length_
   local.tee $7
   local.get $6
   local.get $7
   i32.lt_s
   select
   i32.lt_s
   if
    local.get $this
    call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Input>#get:dataStart
    local.get $i
    i32.const 2
    i32.shl
    i32.add
    i32.load
    local.get $i
    local.get $this
    i32.const 3
    global.set $~argumentsLength
    local.get $fn
    i32.load
    call_indirect (type $3)
    local.set $result
    local.get $outStart
    local.get $i
    i32.const 2
    i32.shl
    i32.add
    local.get $result
    i32.store
    i32.const 1
    drop
    local.get $out
    local.get $result
    i32.const 1
    call $~lib/rt/stub/__link
    local.get $i
    i32.const 1
    i32.add
    local.set $i
    br $for-loop|0
   end
  end
  local.get $out
  return
 )
 (func $~lib/array/Array<~lib/array/Array<u64>>#get:length_ (param $this i32) (result i32)
  local.get $this
  i32.load offset=12
 )
 (func $~lib/array/Array<~lib/array/Array<u64>>#get:length (param $this i32) (result i32)
  local.get $this
  call $~lib/array/Array<~lib/array/Array<u64>>#get:length_
  return
 )
 (func $~lib/array/Array<~lib/array/Array<u64>>#__get (param $this i32) (param $index i32) (result i32)
  (local $value i32)
  local.get $index
  local.get $this
  call $~lib/array/Array<~lib/array/Array<u64>>#get:length_
  i32.ge_u
  if
   i32.const 2112
   i32.const 2240
   i32.const 114
   i32.const 42
   call $~lib/builtins/abort
   unreachable
  end
  local.get $this
  call $~lib/array/Array<~lib/array/Array<u64>>#get:dataStart
  local.get $index
  i32.const 2
  i32.shl
  i32.add
  i32.load
  local.set $value
  i32.const 1
  drop
  i32.const 0
  i32.eqz
  drop
  local.get $value
  i32.eqz
  if
   i32.const 3376
   i32.const 2240
   i32.const 118
   i32.const 40
   call $~lib/builtins/abort
   unreachable
  end
  local.get $value
  return
 )
 (func $~lib/array/Array<u64>#push (param $this i32) (param $value i64) (result i32)
  (local $oldLen i32)
  (local $len i32)
  local.get $this
  call $~lib/array/Array<u64>#get:length_
  local.set $oldLen
  local.get $oldLen
  i32.const 1
  i32.add
  local.set $len
  local.get $this
  local.get $len
  i32.const 3
  i32.const 1
  call $~lib/array/ensureCapacity
  i32.const 0
  drop
  local.get $this
  call $~lib/array/Array<u64>#get:dataStart
  local.get $oldLen
  i32.const 3
  i32.shl
  i32.add
  local.get $value
  i64.store
  local.get $this
  local.get $len
  call $~lib/array/Array<u64>#set:length_
  local.get $len
  return
 )
 (func $assembly/index/flatten<u64> (param $ary i32) (result i32)
  (local $result i32)
  (local $i i32)
  (local $j i32)
  i32.const 0
  i32.const 0
  call $~lib/array/Array<u64>#constructor
  local.set $result
  i32.const 0
  local.set $i
  loop $for-loop|0
   local.get $i
   local.get $ary
   call $~lib/array/Array<~lib/array/Array<u64>>#get:length
   i32.lt_s
   if
    i32.const 0
    local.set $j
    loop $for-loop|1
     local.get $j
     local.get $ary
     local.get $i
     call $~lib/array/Array<~lib/array/Array<u64>>#__get
     call $~lib/array/Array<u64>#get:length
     i32.lt_s
     if
      local.get $result
      local.get $ary
      local.get $i
      call $~lib/array/Array<~lib/array/Array<u64>>#__get
      local.get $j
      call $~lib/array/Array<u64>#__get
      call $~lib/array/Array<u64>#push
      drop
      local.get $j
      i32.const 1
      i32.add
      local.set $j
      br $for-loop|1
     end
    end
    local.get $i
    i32.const 1
    i32.add
    local.set $i
    br $for-loop|0
   end
  end
  local.get $result
  return
 )
 (func $~lib/metashrew-as/assembly/indexer/bst/byteAt<i32> (param $v i32) (param $byte i32) (result i32)
  local.get $v
  local.get $byte
  i32.add
  i32.load8_u
  return
 )
 (func $~lib/metashrew-as/assembly/indexer/bst/maskGreaterThan (param $v i32) (param $position i32)
  (local $ary i32)
  (local $byteSelected i32)
  (local $bitSelected i32)
  (local $i i32)
  (local $i|6 i32)
  i32.const 0
  i32.const 4
  call $~lib/array/Array<u64>#constructor
  local.set $ary
  local.get $ary
  i32.const 0
  local.get $v
  i64.load
  call $~lib/polyfills/bswap<u64>
  call $~lib/array/Array<u64>#__set
  local.get $ary
  i32.const 1
  local.get $v
  i32.const 8
  i32.add
  i64.load
  call $~lib/polyfills/bswap<u64>
  call $~lib/array/Array<u64>#__set
  local.get $ary
  i32.const 2
  local.get $v
  i32.const 2
  i32.const 8
  i32.mul
  i32.add
  i64.load
  call $~lib/polyfills/bswap<u64>
  call $~lib/array/Array<u64>#__set
  local.get $ary
  i32.const 3
  local.get $v
  i32.const 3
  i32.const 8
  i32.mul
  i32.add
  i64.load
  call $~lib/polyfills/bswap<u64>
  call $~lib/array/Array<u64>#__set
  local.get $position
  i32.const 255
  i32.and
  i32.const 64
  i32.div_u
  local.set $byteSelected
  local.get $position
  i32.const 255
  i32.and
  i32.const 64
  i32.rem_u
  local.set $bitSelected
  local.get $ary
  local.get $byteSelected
  local.get $ary
  local.get $byteSelected
  call $~lib/array/Array<u64>#__get
  i64.const 1
  local.get $bitSelected
  i32.const 1
  i32.add
  i32.const 255
  i32.and
  i64.extend_i32_u
  i64.shl
  i64.const 1
  i64.sub
  i64.const 63
  local.get $bitSelected
  i64.extend_i32_u
  i64.sub
  i64.shl
  i64.const -1
  i64.xor
  i64.and
  call $~lib/array/Array<u64>#__set
  i32.const 0
  local.set $i
  loop $for-loop|0
   local.get $i
   local.get $byteSelected
   i32.lt_u
   if
    local.get $ary
    local.get $i
    i64.const 0
    call $~lib/array/Array<u64>#__set
    local.get $i
    i32.const 1
    i32.add
    local.set $i
    br $for-loop|0
   end
  end
  i32.const 0
  local.set $i|6
  loop $for-loop|1
   local.get $i|6
   i32.const 4
   i32.lt_s
   if
    local.get $v
    local.get $i|6
    i32.const 8
    i32.mul
    i32.add
    local.get $ary
    local.get $i|6
    call $~lib/array/Array<u64>#__get
    call $~lib/polyfills/bswap<u64>
    i64.store
    local.get $i|6
    i32.const 1
    i32.add
    local.set $i|6
    br $for-loop|1
   end
  end
 )
 (func $~lib/metashrew-as/assembly/indexer/bst/binarySearchU2 (param $word i32) (param $forHighest i32) (result i32)
  (local $high i32)
  (local $low i32)
  local.get $word
  i32.const 255
  i32.and
  i32.const 1
  i32.const 7
  i32.and
  i32.shr_u
  i32.const 1
  i32.and
  local.set $high
  local.get $word
  i32.const 1
  i32.and
  local.set $low
  local.get $forHighest
  if (result i32)
   i32.const 1
  else
   local.get $low
   i32.const 0
   i32.eq
  end
  if (result i32)
   local.get $high
   i32.const 0
   i32.ne
  else
   i32.const 0
  end
  if (result i32)
   i32.const 0
  else
   i32.const 1
  end
  return
 )
 (func $~lib/metashrew-as/assembly/indexer/bst/binarySearchU4 (param $word i32) (param $forHighest i32) (result i32)
  (local $high i32)
  (local $low i32)
  local.get $word
  i32.const 255
  i32.and
  i32.const 2
  i32.const 7
  i32.and
  i32.shr_u
  i32.const 3
  i32.and
  local.set $high
  local.get $word
  i32.const 3
  i32.and
  local.set $low
  local.get $forHighest
  if (result i32)
   i32.const 1
  else
   local.get $low
   i32.const 0
   i32.eq
  end
  if (result i32)
   local.get $high
   i32.const 0
   i32.ne
  else
   i32.const 0
  end
  if
   local.get $high
   local.get $forHighest
   call $~lib/metashrew-as/assembly/indexer/bst/binarySearchU2
   return
  end
  i32.const 2
  local.get $low
  local.get $forHighest
  call $~lib/metashrew-as/assembly/indexer/bst/binarySearchU2
  i32.add
  return
 )
 (func $~lib/metashrew-as/assembly/indexer/bst/binarySearchU8 (param $word i32) (param $forHighest i32) (result i32)
  (local $high i32)
  (local $low i32)
  local.get $word
  i32.const 255
  i32.and
  i32.const 4
  i32.const 7
  i32.and
  i32.shr_u
  i32.const 15
  i32.and
  local.set $high
  local.get $word
  i32.const 15
  i32.and
  local.set $low
  local.get $forHighest
  if (result i32)
   i32.const 1
  else
   local.get $low
   i32.const 0
   i32.eq
  end
  if (result i32)
   local.get $high
   i32.const 0
   i32.ne
  else
   i32.const 0
  end
  if
   local.get $high
   local.get $forHighest
   call $~lib/metashrew-as/assembly/indexer/bst/binarySearchU4
   return
  end
  i32.const 4
  local.get $low
  local.get $forHighest
  call $~lib/metashrew-as/assembly/indexer/bst/binarySearchU4
  i32.add
  return
 )
 (func $~lib/metashrew-as/assembly/indexer/bst/binarySearchU16 (param $word i32) (param $forHighest i32) (result i32)
  (local $low i32)
  (local $high i32)
  local.get $word
  global.get $~lib/number/U8.MAX_VALUE
  i32.and
  local.set $low
  local.get $word
  i32.const 65535
  i32.and
  i32.const 1
  i32.const 8
  i32.mul
  i32.const 15
  i32.and
  i32.shr_u
  global.get $~lib/number/U8.MAX_VALUE
  i32.and
  local.set $high
  local.get $forHighest
  if (result i32)
   i32.const 1
  else
   local.get $low
   i32.const 0
   i32.eq
  end
  if (result i32)
   local.get $high
   i32.const 0
   i32.ne
  else
   i32.const 0
  end
  if
   local.get $high
   local.get $forHighest
   call $~lib/metashrew-as/assembly/indexer/bst/binarySearchU8
   return
  else
   i32.const 1
   i32.const 8
   i32.mul
   local.get $low
   local.get $forHighest
   call $~lib/metashrew-as/assembly/indexer/bst/binarySearchU8
   i32.add
   return
  end
  unreachable
 )
 (func $~lib/metashrew-as/assembly/indexer/bst/binarySearchU32 (param $word i32) (param $forHighest i32) (result i32)
  (local $low i32)
  (local $high i32)
  local.get $word
  global.get $~lib/number/U16.MAX_VALUE
  i32.and
  local.set $low
  local.get $word
  i32.const 2
  i32.const 8
  i32.mul
  i32.shr_u
  global.get $~lib/number/U16.MAX_VALUE
  i32.and
  local.set $high
  local.get $forHighest
  if (result i32)
   i32.const 1
  else
   local.get $low
   i32.const 0
   i32.eq
  end
  if (result i32)
   local.get $high
   i32.const 0
   i32.ne
  else
   i32.const 0
  end
  if
   local.get $high
   local.get $forHighest
   call $~lib/metashrew-as/assembly/indexer/bst/binarySearchU16
   return
  else
   i32.const 2
   i32.const 8
   i32.mul
   local.get $low
   local.get $forHighest
   call $~lib/metashrew-as/assembly/indexer/bst/binarySearchU16
   i32.add
   return
  end
  unreachable
 )
 (func $~lib/metashrew-as/assembly/indexer/bst/binarySearchU64 (param $word i64) (param $forHighest i32) (result i32)
  (local $low i32)
  (local $high i32)
  local.get $word
  global.get $~lib/number/U32.MAX_VALUE
  i64.extend_i32_u
  i64.and
  i32.wrap_i64
  local.set $low
  local.get $word
  i64.const 4
  i64.const 8
  i64.mul
  i64.shr_u
  global.get $~lib/number/U32.MAX_VALUE
  i64.extend_i32_u
  i64.and
  i32.wrap_i64
  local.set $high
  local.get $forHighest
  if (result i32)
   i32.const 1
  else
   local.get $low
   i32.const 0
   i32.eq
  end
  if (result i32)
   local.get $high
   i32.const 0
   i32.ne
  else
   i32.const 0
  end
  if
   local.get $high
   local.get $forHighest
   call $~lib/metashrew-as/assembly/indexer/bst/binarySearchU32
   return
  end
  i32.const 4
  i32.const 8
  i32.mul
  local.get $low
  local.get $forHighest
  call $~lib/metashrew-as/assembly/indexer/bst/binarySearchU32
  i32.add
  return
 )
 (func $~lib/metashrew-as/assembly/indexer/bst/binarySearchU128 (param $high i64) (param $low i64) (param $forHighest i32) (result i32)
  local.get $forHighest
  if (result i32)
   i32.const 1
  else
   local.get $low
   i64.const 0
   i64.eq
  end
  if (result i32)
   local.get $high
   i64.const 0
   i64.ne
  else
   i32.const 0
  end
  if
   local.get $high
   local.get $forHighest
   call $~lib/metashrew-as/assembly/indexer/bst/binarySearchU64
   return
  else
   i32.const 8
   i32.const 8
   i32.mul
   local.get $low
   local.get $forHighest
   call $~lib/metashrew-as/assembly/indexer/bst/binarySearchU64
   i32.add
   return
  end
  unreachable
 )
 (func $~lib/metashrew-as/assembly/indexer/bst/binarySearchU256 (param $v i32) (param $forHighest i32) (result i32)
  (local $leftHigh i64)
  (local $leftLow i64)
  (local $rightHigh i64)
  (local $rightLow i64)
  (local $left i64)
  (local $right i64)
  local.get $v
  i64.load
  call $~lib/polyfills/bswap<u64>
  local.set $leftHigh
  local.get $v
  i32.const 8
  i32.add
  i64.load
  call $~lib/polyfills/bswap<u64>
  local.set $leftLow
  local.get $v
  i32.const 16
  i32.add
  i64.load
  call $~lib/polyfills/bswap<u64>
  local.set $rightHigh
  local.get $v
  i32.const 24
  i32.add
  i64.load
  call $~lib/polyfills/bswap<u64>
  local.set $rightLow
  local.get $leftHigh
  local.get $leftLow
  i64.or
  local.set $left
  local.get $rightHigh
  local.get $rightLow
  i64.or
  local.set $right
  local.get $left
  local.get $right
  i64.or
  i64.const 0
  i64.eq
  if
   i32.const -1
   return
  end
  local.get $forHighest
  if (result i32)
   i32.const 1
  else
   local.get $right
   i64.const 0
   i64.eq
  end
  if (result i32)
   local.get $left
   i64.const 0
   i64.ne
  else
   i32.const 0
  end
  if
   local.get $leftHigh
   local.get $leftLow
   local.get $forHighest
   call $~lib/metashrew-as/assembly/indexer/bst/binarySearchU128
   return
  else
   i32.const 8
   i32.const 2
   i32.mul
   i32.const 8
   i32.mul
   local.get $rightHigh
   local.get $rightLow
   local.get $forHighest
   call $~lib/metashrew-as/assembly/indexer/bst/binarySearchU128
   i32.add
   return
  end
  unreachable
 )
 (func $~lib/polyfills/bswap<u8> (param $value i32) (result i32)
  i32.const 1
  drop
  i32.const 1
  i32.const 1
  i32.eq
  drop
  local.get $value
  return
 )
 (func $~lib/metashrew-as/assembly/indexer/bst/toBuffer<u8> (param $v i32) (result i32)
  (local $data i32)
  i32.const 0
  i32.const 1
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.set $data
  local.get $data
  local.get $v
  call $~lib/polyfills/bswap<u8>
  i32.store8
  local.get $data
  return
 )
 (func $~lib/metashrew-as/assembly/indexer/bst/BST<u64>#_findBoundaryFromPartial (param $this i32) (param $keyBytes i32) (param $seekHigher i32) (result i64)
  (local $partialKey i32)
  (local $newPartial i32)
  local.get $keyBytes
  local.set $partialKey
  loop $while-continue|0
   local.get $partialKey
   call $~lib/arraybuffer/ArrayBuffer#get:byteLength
   i32.const 8
   i32.ne
   if
    i32.const 0
    local.get $partialKey
    call $~lib/arraybuffer/ArrayBuffer#get:byteLength
    i32.const 1
    i32.add
    call $~lib/arraybuffer/ArrayBuffer#constructor
    local.set $newPartial
    local.get $newPartial
    local.get $partialKey
    local.get $partialKey
    call $~lib/arraybuffer/ArrayBuffer#get:byteLength
    call $~lib/metashrew-as/assembly/utils/memcpy/memcpy
    drop
    local.get $newPartial
    local.get $partialKey
    call $~lib/arraybuffer/ArrayBuffer#get:byteLength
    i32.add
    local.get $this
    local.get $partialKey
    call $~lib/metashrew-as/assembly/indexer/bst/BST<u64>#getMaskPointer
    call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#get
    local.get $seekHigher
    call $~lib/metashrew-as/assembly/indexer/bst/binarySearchU256
    i32.store8
    local.get $newPartial
    local.set $partialKey
    br $while-continue|0
   end
  end
  local.get $partialKey
  i64.load
  call $~lib/polyfills/bswap<u64>
  return
 )
 (func $~lib/metashrew-as/assembly/indexer/bst/BST<u64>#seekGreater (param $this i32) (param $start i64) (result i64)
  (local $partialKey i32)
  (local $thisKey i32)
  (local $mask i32)
  (local $symbol i32)
  (local $6 i32)
  (local $7 i32)
  i32.const 0
  i32.const 8
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.set $partialKey
  local.get $partialKey
  local.get $start
  call $~lib/polyfills/bswap<u64>
  i64.store
  loop $do-loop|0
   local.get $partialKey
   call $~lib/metashrew-as/assembly/utils/box/Box.from
   i32.const 1
   call $~lib/metashrew-as/assembly/utils/box/Box#shrinkBack
   call $~lib/metashrew-as/assembly/utils/box/Box#toArrayBuffer
   local.set $thisKey
   local.get $this
   local.get $thisKey
   call $~lib/metashrew-as/assembly/indexer/bst/BST<u64>#getMaskPointer
   call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#get
   local.set $mask
   local.get $mask
   call $~lib/arraybuffer/ArrayBuffer#get:byteLength
   i32.const 0
   i32.ne
   if
    local.get $mask
    local.get $partialKey
    local.get $thisKey
    call $~lib/arraybuffer/ArrayBuffer#get:byteLength
    call $~lib/metashrew-as/assembly/indexer/bst/byteAt<i32>
    call $~lib/metashrew-as/assembly/indexer/bst/maskGreaterThan
    local.get $mask
    i32.const 1
    call $~lib/metashrew-as/assembly/indexer/bst/binarySearchU256
    local.set $symbol
    local.get $symbol
    i32.const -1
    i32.ne
    if
     local.get $this
     i32.const 2
     i32.const 2
     i32.const 27
     i32.const 0
     call $~lib/rt/__newArray
     local.set $6
     local.get $6
     i32.load offset=4
     local.set $7
     local.get $6
     i32.const 0
     local.get $thisKey
     call $~lib/metashrew-as/assembly/utils/box/Box.from
     call $~lib/array/Array<~lib/metashrew-as/assembly/utils/box/Box>#__set
     local.get $6
     i32.const 1
     local.get $symbol
     call $~lib/metashrew-as/assembly/indexer/bst/toBuffer<u8>
     call $~lib/metashrew-as/assembly/utils/box/Box.from
     call $~lib/array/Array<~lib/metashrew-as/assembly/utils/box/Box>#__set
     local.get $6
     call $~lib/metashrew-as/assembly/utils/box/Box.concat
     i32.const 1
     call $~lib/metashrew-as/assembly/indexer/bst/BST<u64>#_findBoundaryFromPartial
     return
    end
   end
   local.get $thisKey
   local.set $partialKey
   local.get $partialKey
   call $~lib/arraybuffer/ArrayBuffer#get:byteLength
   i32.const 0
   i32.ne
   br_if $do-loop|0
  end
  i64.const 0
  return
 )
 (func $assembly/index/rangeLength<u64> (param $bst i32) (param $key i64) (result i64)
  local.get $bst
  local.get $key
  call $~lib/metashrew-as/assembly/indexer/bst/BST<u64>#seekGreater
  local.get $key
  i64.sub
  return
 )
 (func $assembly/index/min<u64> (param $a i64) (param $b i64) (result i64)
  local.get $a
  local.get $b
  i64.gt_u
  if
   local.get $b
   return
  end
  local.get $a
  return
 )
 (func $assembly/index/SatRanges.fromSats (param $sats i32) (result i32)
  (local $distances i32)
  (local $i i32)
  i32.const 0
  local.get $sats
  call $~lib/array/Array<u64>#get:length
  call $~lib/array/Array<u64>#constructor
  local.set $distances
  i32.const 0
  local.set $i
  loop $for-loop|0
   local.get $i
   local.get $sats
   call $~lib/array/Array<u64>#get:length
   i32.lt_s
   if
    local.get $distances
    local.get $i
    global.get $assembly/index/SAT_TO_OUTPOINT
    local.get $sats
    local.get $i
    call $~lib/array/Array<u64>#__get
    call $assembly/index/rangeLength<u64>
    global.get $assembly/index/STARTING_SAT
    call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#getValue<u64>
    call $assembly/index/min<u64>
    call $~lib/array/Array<u64>#__set
    local.get $i
    i32.const 1
    i32.add
    local.set $i
    br $for-loop|0
   end
  end
  i32.const 0
  local.get $sats
  local.get $distances
  call $assembly/index/SatRanges#constructor
  return
 )
 (func $assembly/index/SatRanges.fromTransaction (param $tx i32) (result i32)
  local.get $tx
  call $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#get:ins
  i32.const 5632
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Input>#map<~lib/array/Array<u64>>
  call $assembly/index/flatten<u64>
  call $assembly/index/SatRanges.fromSats
  return
 )
 (func $assembly/index/SatSource.fromTransaction (param $tx i32) (result i32)
  i32.const 0
  local.get $tx
  call $assembly/index/SatRanges.fromTransaction
  call $assembly/index/SatSource#constructor
  return
 )
 (func $~lib/metashrew-as/assembly/indexer/bst/BST<u64>#nullify (param $this i32) (param $k i64)
  (local $key i64)
  (local $keyBytes i32)
  local.get $k
  call $~lib/polyfills/bswap<u64>
  local.set $key
  i32.const 0
  i32.const 8
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.set $keyBytes
  local.get $this
  call $~lib/metashrew-as/assembly/indexer/bst/BST<u64>#get:ptr
  local.get $keyBytes
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
  i32.const 0
  i32.const 0
  call $~lib/arraybuffer/ArrayBuffer#constructor
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#set
 )
 (func $assembly/index/SatRanges#pull~anonymous|0 (param $v i64) (param $i i32) (param $ary i32)
  global.get $assembly/index/SAT_TO_OUTPOINT
  local.get $v
  call $~lib/metashrew-as/assembly/indexer/bst/BST<u64>#nullify
 )
 (func $~lib/array/Array<u64>#forEach (param $this i32) (param $fn i32)
  (local $i i32)
  (local $len i32)
  (local $4 i32)
  (local $5 i32)
  i32.const 0
  local.set $i
  local.get $this
  call $~lib/array/Array<u64>#get:length_
  local.set $len
  loop $for-loop|0
   local.get $i
   local.get $len
   local.tee $4
   local.get $this
   call $~lib/array/Array<u64>#get:length_
   local.tee $5
   local.get $4
   local.get $5
   i32.lt_s
   select
   i32.lt_s
   if
    local.get $this
    call $~lib/array/Array<u64>#get:dataStart
    local.get $i
    i32.const 3
    i32.shl
    i32.add
    i64.load
    local.get $i
    local.get $this
    i32.const 3
    global.set $~argumentsLength
    local.get $fn
    i32.load
    call_indirect (type $17)
    local.get $i
    i32.const 1
    i32.add
    local.set $i
    br $for-loop|0
   end
  end
 )
 (func $assembly/index/SatRanges#pull (param $this i32) (result i32)
  local.get $this
  call $assembly/index/SatRanges#get:sats
  i32.const 5664
  call $~lib/array/Array<u64>#forEach
  local.get $this
  return
 )
 (func $assembly/index/SatSource#pull (param $this i32) (result i32)
  local.get $this
  call $assembly/index/SatSource#get:ranges
  call $assembly/index/SatRanges#pull
  drop
  local.get $this
  return
 )
 (func $~lib/metashrew-as/assembly/blockdata/transaction/Input#get:witness (param $this i32) (result i32)
  local.get $this
  i32.load offset=20
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/witness/WitnessPart>#get:length (param $this i32) (result i32)
  local.get $this
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/witness/WitnessPart>#get:length_
  return
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/witness/WitnessPart>#__get (param $this i32) (param $index i32) (result i32)
  (local $value i32)
  local.get $index
  local.get $this
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/witness/WitnessPart>#get:length_
  i32.ge_u
  if
   i32.const 2112
   i32.const 2240
   i32.const 114
   i32.const 42
   call $~lib/builtins/abort
   unreachable
  end
  local.get $this
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/witness/WitnessPart>#get:dataStart
  local.get $index
  i32.const 2
  i32.shl
  i32.add
  i32.load
  local.set $value
  i32.const 1
  drop
  i32.const 0
  i32.eqz
  drop
  local.get $value
  i32.eqz
  if
   i32.const 3376
   i32.const 2240
   i32.const 118
   i32.const 40
   call $~lib/builtins/abort
   unreachable
  end
  local.get $value
  return
 )
 (func $~lib/metashrew-as/assembly/blockdata/witness/WitnessPart#get:taprootAnnex (param $this i32) (result i32)
  local.get $this
  i32.load8_u offset=6
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/witness/WitnessPart>#slice (param $this i32) (param $start i32) (param $end i32) (result i32)
  (local $len i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (local $12 i32)
  (local $13 i32)
  (local $slice i32)
  (local $sliceBase i32)
  (local $thisBase i32)
  (local $off i32)
  (local $end|18 i32)
  (local $ref i32)
  local.get $this
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/witness/WitnessPart>#get:length_
  local.set $len
  local.get $start
  i32.const 0
  i32.lt_s
  if (result i32)
   local.get $start
   local.get $len
   i32.add
   local.tee $4
   i32.const 0
   local.tee $5
   local.get $4
   local.get $5
   i32.gt_s
   select
  else
   local.get $start
   local.tee $6
   local.get $len
   local.tee $7
   local.get $6
   local.get $7
   i32.lt_s
   select
  end
  local.set $start
  local.get $end
  i32.const 0
  i32.lt_s
  if (result i32)
   local.get $end
   local.get $len
   i32.add
   local.tee $8
   i32.const 0
   local.tee $9
   local.get $8
   local.get $9
   i32.gt_s
   select
  else
   local.get $end
   local.tee $10
   local.get $len
   local.tee $11
   local.get $10
   local.get $11
   i32.lt_s
   select
  end
  local.set $end
  local.get $end
  local.get $start
  i32.sub
  local.tee $12
  i32.const 0
  local.tee $13
  local.get $12
  local.get $13
  i32.gt_s
  select
  local.set $len
  local.get $len
  i32.const 2
  i32.const 21
  i32.const 0
  call $~lib/rt/__newArray
  local.set $slice
  local.get $slice
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/witness/WitnessPart>#get:dataStart
  local.set $sliceBase
  local.get $this
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/witness/WitnessPart>#get:dataStart
  local.get $start
  i32.const 2
  i32.shl
  i32.add
  local.set $thisBase
  i32.const 1
  drop
  i32.const 0
  local.set $off
  local.get $len
  i32.const 2
  i32.shl
  local.set $end|18
  loop $while-continue|0
   local.get $off
   local.get $end|18
   i32.lt_u
   if
    local.get $thisBase
    local.get $off
    i32.add
    i32.load
    local.set $ref
    local.get $sliceBase
    local.get $off
    i32.add
    local.get $ref
    i32.store
    local.get $slice
    local.get $ref
    i32.const 1
    call $~lib/rt/stub/__link
    local.get $off
    i32.const 4
    i32.add
    local.set $off
    br $while-continue|0
   end
  end
  local.get $slice
  return
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/witness/WitnessPart>#slice@varargs (param $this i32) (param $start i32) (param $end i32) (result i32)
  block $2of2
   block $1of2
    block $0of2
     block $outOfRange
      global.get $~argumentsLength
      br_table $0of2 $1of2 $2of2 $outOfRange
     end
     unreachable
    end
    i32.const 0
    local.set $start
   end
   global.get $~lib/builtins/i32.MAX_VALUE
   local.set $end
  end
  local.get $this
  local.get $start
  local.get $end
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/witness/WitnessPart>#slice
 )
 (func $~lib/metashrew-as/assembly/blockdata/witness/WitnessPart#get:isScript (param $this i32) (result i32)
  local.get $this
  i32.load8_u offset=5
 )
 (func $~lib/metashrew-as/assembly/blockdata/witness/Witness#tapscript (param $this i32) (result i32)
  (local $len i32)
  (local $script i32)
  (local $m i32)
  (local $mLen i32)
  (local $control i32)
  local.get $this
  call $~lib/metashrew-as/assembly/blockdata/witness/Witness#get:parts
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/witness/WitnessPart>#get:length
  local.set $len
  call $~lib/metashrew-as/assembly/utils/pointer/nullptr<~lib/metashrew-as/assembly/utils/box/Box>
  local.set $script
  local.get $len
  i32.const 0
  i32.eq
  if
   call $~lib/metashrew-as/assembly/utils/pointer/nullptr<~lib/metashrew-as/assembly/utils/box/Box>
   return
  end
  local.get $len
  i32.const 2
  i32.ge_s
  if
   local.get $this
   call $~lib/metashrew-as/assembly/blockdata/witness/Witness#get:parts
   local.get $len
   i32.const 1
   i32.sub
   call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/witness/WitnessPart>#__get
   call $~lib/metashrew-as/assembly/blockdata/witness/WitnessPart#get:taprootAnnex
   if
    local.get $this
    call $~lib/metashrew-as/assembly/blockdata/witness/Witness#get:parts
    i32.const 0
    local.get $len
    i32.const 1
    i32.sub
    call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/witness/WitnessPart>#slice
    local.set $m
   else
    local.get $this
    call $~lib/metashrew-as/assembly/blockdata/witness/Witness#get:parts
    i32.const 0
    i32.const 1
    global.set $~argumentsLength
    i32.const 0
    call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/witness/WitnessPart>#slice@varargs
    local.set $m
   end
   local.get $m
   call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/witness/WitnessPart>#get:length
   local.set $mLen
   local.get $mLen
   i32.const 1
   i32.eq
   if
    call $~lib/metashrew-as/assembly/utils/pointer/nullptr<~lib/metashrew-as/assembly/utils/box/Box>
    return
   end
   local.get $mLen
   i32.const 2
   i32.ge_s
   if
    local.get $m
    local.get $mLen
    i32.const 2
    i32.sub
    call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/witness/WitnessPart>#__get
    call $~lib/metashrew-as/assembly/blockdata/witness/WitnessPart#get:isScript
    i32.const 0
    i32.ne
    i32.const 1
    i32.ne
    if
     local.get $script
     return
    end
    local.get $m
    local.get $mLen
    i32.const 1
    i32.sub
    call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/witness/WitnessPart>#__get
    call $~lib/metashrew-as/assembly/blockdata/witness/WitnessPart#get:bytes
    local.set $control
    local.get $control
    call $~lib/metashrew-as/assembly/utils/box/Box#get:len
    i32.const 33
    i32.lt_u
    if (result i32)
     i32.const 1
    else
     local.get $control
     call $~lib/metashrew-as/assembly/utils/box/Box#get:len
     i32.const 33
     i32.sub
     i32.const 32
     i32.rem_u
     i32.const 0
     i32.ne
    end
    if
     local.get $script
     return
    end
    local.get $m
    local.get $mLen
    i32.const 2
    i32.sub
    call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/witness/WitnessPart>#__get
    call $~lib/metashrew-as/assembly/blockdata/witness/WitnessPart#get:bytes
    i32.const 0
    call $~lib/metashrew-as/assembly/utils/box/Box#sliceFrom
    local.set $script
    local.get $script
    return
   end
   local.get $script
   return
  else
   local.get $script
   return
  end
  unreachable
 )
 (func $~lib/metashrew-as/assembly/blockdata/inscription/Inscription#set:bytes (param $this i32) (param $bytes i32)
  local.get $this
  local.get $bytes
  i32.store
  local.get $this
  local.get $bytes
  i32.const 0
  call $~lib/rt/stub/__link
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/inscription/Field>#set:buffer (param $this i32) (param $buffer i32)
  local.get $this
  local.get $buffer
  i32.store
  local.get $this
  local.get $buffer
  i32.const 0
  call $~lib/rt/stub/__link
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/inscription/Field>#set:dataStart (param $this i32) (param $dataStart i32)
  local.get $this
  local.get $dataStart
  i32.store offset=4
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/inscription/Field>#set:byteLength (param $this i32) (param $byteLength i32)
  local.get $this
  local.get $byteLength
  i32.store offset=8
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/inscription/Field>#set:length_ (param $this i32) (param $length_ i32)
  local.get $this
  local.get $length_
  i32.store offset=12
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/inscription/Field>#constructor (param $this i32) (param $length i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $bufferSize i32)
  (local $buffer i32)
  local.get $this
  i32.eqz
  if
   i32.const 16
   i32.const 42
   call $~lib/rt/stub/__new
   local.set $this
  end
  local.get $this
  i32.const 0
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/inscription/Field>#set:buffer
  local.get $this
  i32.const 0
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/inscription/Field>#set:dataStart
  local.get $this
  i32.const 0
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/inscription/Field>#set:byteLength
  local.get $this
  i32.const 0
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/inscription/Field>#set:length_
  local.get $length
  i32.const 1073741820
  i32.const 2
  i32.shr_u
  i32.gt_u
  if
   i32.const 1376
   i32.const 2240
   i32.const 70
   i32.const 60
   call $~lib/builtins/abort
   unreachable
  end
  local.get $length
  local.tee $2
  i32.const 8
  local.tee $3
  local.get $2
  local.get $3
  i32.gt_u
  select
  i32.const 2
  i32.shl
  local.set $bufferSize
  local.get $bufferSize
  i32.const 1
  call $~lib/rt/stub/__new
  local.set $buffer
  i32.const 0
  global.get $~lib/shared/runtime/Runtime.Incremental
  i32.ne
  drop
  local.get $buffer
  i32.const 0
  local.get $bufferSize
  memory.fill
  local.get $this
  local.get $buffer
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/inscription/Field>#set:buffer
  local.get $this
  local.get $buffer
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/inscription/Field>#set:dataStart
  local.get $this
  local.get $bufferSize
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/inscription/Field>#set:byteLength
  local.get $this
  local.get $length
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/inscription/Field>#set:length_
  local.get $this
 )
 (func $~lib/metashrew-as/assembly/blockdata/inscription/Inscription#set:fields (param $this i32) (param $fields i32)
  local.get $this
  local.get $fields
  i32.store offset=4
  local.get $this
  local.get $fields
  i32.const 0
  call $~lib/rt/stub/__link
 )
 (func $~lib/metashrew-as/assembly/utils/box/Box#setLength (param $this i32) (param $len i32) (result i32)
  local.get $this
  local.get $len
  call $~lib/metashrew-as/assembly/utils/box/Box#set:len
  local.get $this
  return
 )
 (func $~lib/metashrew-as/assembly/utils/utils/parsePushOp (param $data i32) (result i32)
  (local $opcode i32)
  (local $this i32)
  (local $len i32)
  (local $this|4 i32)
  (local $this|5 i32)
  (local $this|6 i32)
  (local $len|7 i32)
  (local $this|8 i32)
  (local $this|9 i32)
  (local $this|10 i32)
  (local $len|11 i32)
  (local $this|12 i32)
  (local $this|13 i32)
  local.get $data
  call $~lib/metashrew-as/assembly/utils/utils/parsePrimitive<u8>
  local.set $opcode
  local.get $opcode
  i32.const 77
  i32.eq
  if
   local.get $data
   local.get $data
   call $~lib/metashrew-as/assembly/utils/utils/parsePrimitive<u16>
   call $~lib/metashrew-as/assembly/utils/utils/parseBytes
   return
  end
  local.get $opcode
  i32.const 78
  i32.eq
  if
   local.get $data
   local.get $data
   call $~lib/metashrew-as/assembly/utils/utils/parsePrimitive<u32>
   call $~lib/metashrew-as/assembly/utils/utils/parseBytes
   return
  end
  local.get $opcode
  i32.const 79
  i32.eq
  if
   block $~lib/metashrew-as/assembly/utils/pointer/Pointer#toBox|inlined.13 (result i32)
    i32.const 0
    call $~lib/metashrew-as/assembly/utils/pointer/toPointer
    local.set $this
    i32.const 0
    local.set $len
    i32.const 0
    block $~lib/metashrew-as/assembly/utils/pointer/Pointer#asUsize|inlined.13 (result i32)
     local.get $this
     local.set $this|4
     block $~lib/metashrew-as/assembly/utils/pointer/Pointer#asRef<usize>|inlined.13 (result i32)
      local.get $this|4
      local.set $this|5
      local.get $this|5
      br $~lib/metashrew-as/assembly/utils/pointer/Pointer#asRef<usize>|inlined.13
     end
     br $~lib/metashrew-as/assembly/utils/pointer/Pointer#asUsize|inlined.13
    end
    local.get $len
    call $~lib/metashrew-as/assembly/utils/box/Box#constructor
    br $~lib/metashrew-as/assembly/utils/pointer/Pointer#toBox|inlined.13
   end
   return
  end
  local.get $opcode
  i32.const 81
  i32.eq
  if
   block $~lib/metashrew-as/assembly/utils/pointer/Pointer#toBox|inlined.14 (result i32)
    i32.const 0
    call $~lib/metashrew-as/assembly/utils/pointer/toPointer
    local.set $this|6
    i32.const 0
    local.set $len|7
    i32.const 0
    block $~lib/metashrew-as/assembly/utils/pointer/Pointer#asUsize|inlined.14 (result i32)
     local.get $this|6
     local.set $this|8
     block $~lib/metashrew-as/assembly/utils/pointer/Pointer#asRef<usize>|inlined.14 (result i32)
      local.get $this|8
      local.set $this|9
      local.get $this|9
      br $~lib/metashrew-as/assembly/utils/pointer/Pointer#asRef<usize>|inlined.14
     end
     br $~lib/metashrew-as/assembly/utils/pointer/Pointer#asUsize|inlined.14
    end
    local.get $len|7
    call $~lib/metashrew-as/assembly/utils/box/Box#constructor
    br $~lib/metashrew-as/assembly/utils/pointer/Pointer#toBox|inlined.14
   end
   return
  end
  local.get $opcode
  i32.const 82
  i32.ge_u
  if (result i32)
   local.get $opcode
   i32.const 96
   i32.le_u
  else
   i32.const 0
  end
  if
   block $~lib/metashrew-as/assembly/utils/pointer/Pointer#toBox|inlined.15 (result i32)
    i32.const 0
    call $~lib/metashrew-as/assembly/utils/pointer/toPointer
    local.set $this|10
    local.get $opcode
    i32.const 80
    i32.sub
    local.set $len|11
    i32.const 0
    block $~lib/metashrew-as/assembly/utils/pointer/Pointer#asUsize|inlined.15 (result i32)
     local.get $this|10
     local.set $this|12
     block $~lib/metashrew-as/assembly/utils/pointer/Pointer#asRef<usize>|inlined.15 (result i32)
      local.get $this|12
      local.set $this|13
      local.get $this|13
      br $~lib/metashrew-as/assembly/utils/pointer/Pointer#asRef<usize>|inlined.15
     end
     br $~lib/metashrew-as/assembly/utils/pointer/Pointer#asUsize|inlined.15
    end
    local.get $len|11
    call $~lib/metashrew-as/assembly/utils/box/Box#constructor
    br $~lib/metashrew-as/assembly/utils/pointer/Pointer#toBox|inlined.15
   end
   return
  end
  local.get $opcode
  i32.const 1
  i32.ge_u
  if (result i32)
   local.get $opcode
   i32.const 75
   i32.le_u
  else
   i32.const 0
  end
  if
   local.get $data
   local.get $opcode
   call $~lib/metashrew-as/assembly/utils/utils/parseBytes
   return
  end
  local.get $opcode
  i32.const 0
  i32.eq
  if
   local.get $data
   i32.const 0
   call $~lib/metashrew-as/assembly/utils/box/Box#sliceFrom
   i32.const 0
   call $~lib/metashrew-as/assembly/utils/box/Box#setLength
   return
  end
  local.get $data
  return
 )
 (func $~lib/string/String.__ne (param $left i32) (param $right i32) (result i32)
  local.get $left
  local.get $right
  call $~lib/string/String.__eq
  i32.eqz
  return
 )
 (func $~lib/array/Array<~lib/arraybuffer/ArrayBuffer>#set:buffer (param $this i32) (param $buffer i32)
  local.get $this
  local.get $buffer
  i32.store
  local.get $this
  local.get $buffer
  i32.const 0
  call $~lib/rt/stub/__link
 )
 (func $~lib/array/Array<~lib/arraybuffer/ArrayBuffer>#set:dataStart (param $this i32) (param $dataStart i32)
  local.get $this
  local.get $dataStart
  i32.store offset=4
 )
 (func $~lib/array/Array<~lib/arraybuffer/ArrayBuffer>#set:byteLength (param $this i32) (param $byteLength i32)
  local.get $this
  local.get $byteLength
  i32.store offset=8
 )
 (func $~lib/array/Array<~lib/arraybuffer/ArrayBuffer>#constructor (param $this i32) (param $length i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $bufferSize i32)
  (local $buffer i32)
  local.get $this
  i32.eqz
  if
   i32.const 16
   i32.const 30
   call $~lib/rt/stub/__new
   local.set $this
  end
  local.get $this
  i32.const 0
  call $~lib/array/Array<~lib/arraybuffer/ArrayBuffer>#set:buffer
  local.get $this
  i32.const 0
  call $~lib/array/Array<~lib/arraybuffer/ArrayBuffer>#set:dataStart
  local.get $this
  i32.const 0
  call $~lib/array/Array<~lib/arraybuffer/ArrayBuffer>#set:byteLength
  local.get $this
  i32.const 0
  call $~lib/array/Array<~lib/arraybuffer/ArrayBuffer>#set:length_
  local.get $length
  i32.const 1073741820
  i32.const 2
  i32.shr_u
  i32.gt_u
  if
   i32.const 1376
   i32.const 2240
   i32.const 70
   i32.const 60
   call $~lib/builtins/abort
   unreachable
  end
  local.get $length
  local.tee $2
  i32.const 8
  local.tee $3
  local.get $2
  local.get $3
  i32.gt_u
  select
  i32.const 2
  i32.shl
  local.set $bufferSize
  local.get $bufferSize
  i32.const 1
  call $~lib/rt/stub/__new
  local.set $buffer
  i32.const 0
  global.get $~lib/shared/runtime/Runtime.Incremental
  i32.ne
  drop
  local.get $buffer
  i32.const 0
  local.get $bufferSize
  memory.fill
  local.get $this
  local.get $buffer
  call $~lib/array/Array<~lib/arraybuffer/ArrayBuffer>#set:buffer
  local.get $this
  local.get $buffer
  call $~lib/array/Array<~lib/arraybuffer/ArrayBuffer>#set:dataStart
  local.get $this
  local.get $bufferSize
  call $~lib/array/Array<~lib/arraybuffer/ArrayBuffer>#set:byteLength
  local.get $this
  local.get $length
  call $~lib/array/Array<~lib/arraybuffer/ArrayBuffer>#set:length_
  local.get $this
 )
 (func $~lib/metashrew-as/assembly/utils/utils/decodeTag (param $box i32) (result i32)
  (local $v i32)
  (local $buffer i32)
  local.get $box
  call $~lib/metashrew-as/assembly/utils/box/Box#get:start
  local.set $v
  local.get $v
  i32.const 0
  i32.eq
  if
   local.get $box
   call $~lib/metashrew-as/assembly/utils/box/Box#get:len
   return
  end
  local.get $box
  call $~lib/metashrew-as/assembly/utils/box/Box#get:len
  i32.const 0
  i32.eq
  if
   i32.const 0
   return
  end
  i32.const 0
  i32.const 4
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.set $buffer
  local.get $box
  call $~lib/metashrew-as/assembly/utils/box/Box#get:len
  local.get $buffer
  call $~lib/arraybuffer/ArrayBuffer#get:byteLength
  i32.gt_u
  if
   i32.const 0
   return
  end
  local.get $buffer
  local.get $v
  local.get $box
  call $~lib/metashrew-as/assembly/utils/box/Box#get:len
  call $~lib/metashrew-as/assembly/utils/memcpy/memcpy
  drop
  local.get $buffer
  i32.load
  return
 )
 (func $~lib/metashrew-as/assembly/blockdata/inscription/Inscription#get:fields (param $this i32) (result i32)
  local.get $this
  i32.load offset=4
 )
 (func $~lib/metashrew-as/assembly/blockdata/inscription/Field#set:tag (param $this i32) (param $tag i32)
  local.get $this
  local.get $tag
  i32.store
 )
 (func $~lib/metashrew-as/assembly/blockdata/inscription/Field#set:data (param $this i32) (param $data i32)
  local.get $this
  local.get $data
  i32.store offset=4
  local.get $this
  local.get $data
  i32.const 0
  call $~lib/rt/stub/__link
 )
 (func $~lib/metashrew-as/assembly/blockdata/inscription/Field#constructor (param $this i32) (param $tag i32) (param $data i32) (result i32)
  local.get $this
  i32.eqz
  if
   i32.const 8
   i32.const 41
   call $~lib/rt/stub/__new
   local.set $this
  end
  local.get $this
  i32.const 0
  call $~lib/metashrew-as/assembly/blockdata/inscription/Field#set:tag
  local.get $this
  i32.const 0
  call $~lib/metashrew-as/assembly/blockdata/inscription/Field#set:data
  local.get $this
  local.get $tag
  call $~lib/metashrew-as/assembly/blockdata/inscription/Field#set:tag
  local.get $this
  local.get $data
  call $~lib/metashrew-as/assembly/blockdata/inscription/Field#set:data
  local.get $this
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/inscription/Field>#get:length_ (param $this i32) (result i32)
  local.get $this
  i32.load offset=12
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/inscription/Field>#get:dataStart (param $this i32) (result i32)
  local.get $this
  i32.load offset=4
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/inscription/Field>#push (param $this i32) (param $value i32) (result i32)
  (local $oldLen i32)
  (local $len i32)
  local.get $this
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/inscription/Field>#get:length_
  local.set $oldLen
  local.get $oldLen
  i32.const 1
  i32.add
  local.set $len
  local.get $this
  local.get $len
  i32.const 2
  i32.const 1
  call $~lib/array/ensureCapacity
  i32.const 1
  drop
  local.get $this
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/inscription/Field>#get:dataStart
  local.get $oldLen
  i32.const 2
  i32.shl
  i32.add
  local.get $value
  i32.store
  local.get $this
  local.get $value
  i32.const 1
  call $~lib/rt/stub/__link
  local.get $this
  local.get $len
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/inscription/Field>#set:length_
  local.get $len
  return
 )
 (func $~lib/array/Array<~lib/arraybuffer/ArrayBuffer>#push (param $this i32) (param $value i32) (result i32)
  (local $oldLen i32)
  (local $len i32)
  local.get $this
  call $~lib/array/Array<~lib/arraybuffer/ArrayBuffer>#get:length_
  local.set $oldLen
  local.get $oldLen
  i32.const 1
  i32.add
  local.set $len
  local.get $this
  local.get $len
  i32.const 2
  i32.const 1
  call $~lib/array/ensureCapacity
  i32.const 1
  drop
  local.get $this
  call $~lib/array/Array<~lib/arraybuffer/ArrayBuffer>#get:dataStart
  local.get $oldLen
  i32.const 2
  i32.shl
  i32.add
  local.get $value
  i32.store
  local.get $this
  local.get $value
  i32.const 1
  call $~lib/rt/stub/__link
  local.get $this
  local.get $len
  call $~lib/array/Array<~lib/arraybuffer/ArrayBuffer>#set:length_
  local.get $len
  return
 )
 (func $~lib/metashrew-as/assembly/blockdata/inscription/Inscription#constructor (param $this i32) (param $data i32) (result i32)
  (local $view i32)
  (local $head i32)
  (local $len i32)
  (local $tail i32)
  (local $this|6 i32)
  (local $len|7 i32)
  (local $this|8 i32)
  (local $this|9 i32)
  (local $inscBox i32)
  (local $ordTag i32)
  (local $tag i32)
  (local $content i32)
  (local $i i32)
  (local $i|15 i32)
  (local $contentBody i32)
  local.get $this
  i32.eqz
  if
   i32.const 8
   i32.const 40
   call $~lib/rt/stub/__new
   local.set $this
  end
  local.get $this
  i32.const 0
  call $~lib/metashrew-as/assembly/blockdata/inscription/Inscription#set:bytes
  local.get $this
  i32.const 0
  call $~lib/metashrew-as/assembly/blockdata/inscription/Inscription#set:fields
  local.get $this
  call $~lib/metashrew-as/assembly/utils/pointer/nullptr<~lib/metashrew-as/assembly/utils/box/Box>
  call $~lib/metashrew-as/assembly/blockdata/inscription/Inscription#set:bytes
  local.get $this
  i32.const 0
  i32.const 0
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/inscription/Field>#constructor
  call $~lib/metashrew-as/assembly/blockdata/inscription/Inscription#set:fields
  local.get $data
  i32.const 0
  call $~lib/metashrew-as/assembly/utils/box/Box#sliceFrom
  local.set $view
  local.get $view
  call $~lib/metashrew-as/assembly/utils/box/Box#get:start
  local.set $head
  local.get $view
  call $~lib/metashrew-as/assembly/utils/box/Box#get:len
  local.set $len
  local.get $view
  call $~lib/metashrew-as/assembly/utils/box/Box#get:start
  local.get $len
  i32.add
  local.set $tail
  block $while-break|0
   loop $while-continue|0
    local.get $head
    local.get $tail
    i32.const 1
    i32.sub
    i32.lt_u
    if
     local.get $head
     i32.load8_u
     i32.const 0
     i32.eq
     if (result i32)
      local.get $head
      i32.const 1
      i32.add
      i32.load8_u
      i32.const 99
      i32.eq
     else
      i32.const 0
     end
     if
      local.get $head
      i32.const 2
      i32.add
      local.set $head
      local.get $len
      i32.const 2
      i32.sub
      local.set $len
      br $while-break|0
     end
     local.get $head
     i32.const 1
     i32.add
     local.set $head
     local.get $len
     i32.const 1
     i32.sub
     local.set $len
     br $while-continue|0
    end
   end
  end
  block $while-break|1
   loop $while-continue|1
    local.get $tail
    local.get $head
    i32.gt_u
    if
     local.get $tail
     i32.load8_u
     i32.const 104
     i32.eq
     if
      br $while-break|1
     end
     local.get $tail
     i32.const 1
     i32.sub
     local.set $tail
     local.get $len
     i32.const 1
     i32.sub
     local.set $len
     br $while-continue|1
    end
   end
  end
  block $~lib/metashrew-as/assembly/utils/pointer/Pointer#toBox|inlined.12 (result i32)
   local.get $head
   call $~lib/metashrew-as/assembly/utils/pointer/toPointer
   local.set $this|6
   local.get $len
   local.set $len|7
   i32.const 0
   block $~lib/metashrew-as/assembly/utils/pointer/Pointer#asUsize|inlined.12 (result i32)
    local.get $this|6
    local.set $this|8
    block $~lib/metashrew-as/assembly/utils/pointer/Pointer#asRef<usize>|inlined.12 (result i32)
     local.get $this|8
     local.set $this|9
     local.get $this|9
     br $~lib/metashrew-as/assembly/utils/pointer/Pointer#asRef<usize>|inlined.12
    end
    br $~lib/metashrew-as/assembly/utils/pointer/Pointer#asUsize|inlined.12
   end
   local.get $len|7
   call $~lib/metashrew-as/assembly/utils/box/Box#constructor
   br $~lib/metashrew-as/assembly/utils/pointer/Pointer#toBox|inlined.12
  end
  local.set $inscBox
  local.get $this
  local.get $inscBox
  i32.const 0
  call $~lib/metashrew-as/assembly/utils/box/Box#sliceFrom
  call $~lib/metashrew-as/assembly/blockdata/inscription/Inscription#set:bytes
  local.get $inscBox
  call $~lib/metashrew-as/assembly/utils/utils/parsePushOp
  local.set $ordTag
  local.get $ordTag
  call $~lib/metashrew-as/assembly/utils/box/Box#toArrayBuffer
  i32.const 0
  call $~lib/string/String.UTF8.decode
  i32.const 5696
  call $~lib/string/String.__ne
  if
   local.get $this
   return
  end
  i32.const 0
  i32.const 0
  call $~lib/array/Array<~lib/arraybuffer/ArrayBuffer>#constructor
  local.set $content
  local.get $inscBox
  call $~lib/metashrew-as/assembly/utils/utils/parsePushOp
  local.set $i
  block $for-break2
   loop $for-loop|2
    local.get $inscBox
    call $~lib/metashrew-as/assembly/utils/box/Box#get:len
    i32.const 0
    i32.gt_u
    if
     local.get $i
     call $~lib/metashrew-as/assembly/utils/utils/decodeTag
     i32.const 1
     i32.ge_u
     if (result i32)
      local.get $i
      call $~lib/metashrew-as/assembly/utils/utils/decodeTag
      i32.const 11
      i32.le_u
     else
      i32.const 0
     end
     if
      local.get $i
      call $~lib/metashrew-as/assembly/utils/utils/decodeTag
      local.set $tag
      local.get $this
      call $~lib/metashrew-as/assembly/blockdata/inscription/Inscription#get:fields
      i32.const 0
      local.get $tag
      local.get $inscBox
      call $~lib/metashrew-as/assembly/utils/utils/parsePushOp
      call $~lib/metashrew-as/assembly/utils/box/Box#toArrayBuffer
      call $~lib/metashrew-as/assembly/blockdata/inscription/Field#constructor
      call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/inscription/Field>#push
      drop
     else
      local.get $i
      call $~lib/metashrew-as/assembly/utils/utils/decodeTag
      i32.const 0
      i32.eq
      if
       br $for-break2
      end
     end
     local.get $inscBox
     call $~lib/metashrew-as/assembly/utils/utils/parsePushOp
     local.set $i
     br $for-loop|2
    end
   end
  end
  loop $while-continue|3
   local.get $inscBox
   call $~lib/metashrew-as/assembly/utils/box/Box#get:len
   i32.const 0
   i32.gt_u
   if
    local.get $inscBox
    call $~lib/metashrew-as/assembly/utils/utils/parsePushOp
    local.set $i|15
    local.get $content
    local.get $i|15
    call $~lib/metashrew-as/assembly/utils/box/Box#toArrayBuffer
    call $~lib/array/Array<~lib/arraybuffer/ArrayBuffer>#push
    drop
    br $while-continue|3
   end
  end
  local.get $content
  call $~lib/metashrew-as/assembly/utils/utils/concat
  local.set $contentBody
  local.get $this
  call $~lib/metashrew-as/assembly/blockdata/inscription/Inscription#get:fields
  i32.const 0
  i32.const 0
  local.get $contentBody
  call $~lib/metashrew-as/assembly/blockdata/inscription/Field#constructor
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/inscription/Field>#push
  drop
  local.get $this
 )
 (func $~lib/metashrew-as/assembly/blockdata/transaction/Input#inscription (param $this i32) (result i32)
  (local $script i32)
  local.get $this
  call $~lib/metashrew-as/assembly/blockdata/transaction/Input#get:witness
  call $~lib/metashrew-as/assembly/blockdata/witness/Witness#tapscript
  local.set $script
  local.get $script
  call $~lib/metashrew-as/assembly/utils/pointer/nullptr<~lib/metashrew-as/assembly/utils/box/Box>
  i32.eq
  if
   i32.const 0
   return
  end
  i32.const 0
  local.get $script
  call $~lib/metashrew-as/assembly/blockdata/inscription/Inscription#constructor
  return
 )
 (func $~lib/metashrew-as/assembly/blockdata/sat/SatPoint#set:outpoint (param $this i32) (param $outpoint i32)
  local.get $this
  local.get $outpoint
  i32.store offset=8
  local.get $this
  local.get $outpoint
  i32.const 0
  call $~lib/rt/stub/__link
 )
 (func $~lib/metashrew-as/assembly/blockdata/sat/SatPoint#set:offset (param $this i32) (param $offset i64)
  local.get $this
  local.get $offset
  i64.store
 )
 (func $~lib/metashrew-as/assembly/blockdata/sat/SatPoint#constructor (param $this i32) (param $outpoint i32) (param $offset i64) (result i32)
  local.get $this
  i32.eqz
  if
   i32.const 12
   i32.const 43
   call $~lib/rt/stub/__new
   local.set $this
  end
  local.get $this
  i64.const 0
  call $~lib/metashrew-as/assembly/blockdata/sat/SatPoint#set:offset
  local.get $this
  i32.const 0
  call $~lib/metashrew-as/assembly/blockdata/sat/SatPoint#set:outpoint
  local.get $this
  local.get $outpoint
  call $~lib/metashrew-as/assembly/blockdata/sat/SatPoint#set:outpoint
  local.get $this
  local.get $offset
  call $~lib/metashrew-as/assembly/blockdata/sat/SatPoint#set:offset
  local.get $this
 )
 (func $~lib/metashrew-as/assembly/blockdata/sat/SatPoint.from (param $outpoint i32) (param $offset i64) (result i32)
  i32.const 0
  local.get $outpoint
  local.get $offset
  call $~lib/metashrew-as/assembly/blockdata/sat/SatPoint#constructor
  return
 )
 (func $~lib/metashrew-as/assembly/blockdata/sat/SatPoint#get:outpoint (param $this i32) (result i32)
  local.get $this
  i32.load offset=8
 )
 (func $~lib/metashrew-as/assembly/blockdata/sat/SatPoint#get:offset (param $this i32) (result i64)
  local.get $this
  i64.load
 )
 (func $~lib/metashrew-as/assembly/blockdata/sat/SatPoint#toArrayBuffer (param $this i32) (result i32)
  (local $outpointBytes i32)
  (local $offsetBytes i32)
  (local $3 i32)
  (local $4 i32)
  local.get $this
  call $~lib/metashrew-as/assembly/blockdata/sat/SatPoint#get:outpoint
  local.set $outpointBytes
  i32.const 0
  local.get $outpointBytes
  call $~lib/arraybuffer/ArrayBuffer#get:byteLength
  i32.const 8
  i32.add
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.set $offsetBytes
  local.get $offsetBytes
  local.get $this
  call $~lib/metashrew-as/assembly/blockdata/sat/SatPoint#get:offset
  i64.store
  i32.const 2
  i32.const 2
  i32.const 27
  i32.const 0
  call $~lib/rt/__newArray
  local.set $3
  local.get $3
  i32.load offset=4
  local.set $4
  local.get $3
  i32.const 0
  local.get $outpointBytes
  call $~lib/metashrew-as/assembly/utils/box/Box.from
  call $~lib/array/Array<~lib/metashrew-as/assembly/utils/box/Box>#__set
  local.get $3
  i32.const 1
  local.get $offsetBytes
  call $~lib/metashrew-as/assembly/utils/box/Box.from
  call $~lib/array/Array<~lib/metashrew-as/assembly/utils/box/Box>#__set
  local.get $3
  call $~lib/metashrew-as/assembly/utils/box/Box.concat
  return
 )
 (func $assembly/index/toID (param $satpoint i32) (param $index i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  i32.const 2
  i32.const 2
  i32.const 27
  i32.const 0
  call $~lib/rt/__newArray
  local.set $2
  local.get $2
  i32.load offset=4
  local.set $3
  local.get $2
  i32.const 0
  local.get $satpoint
  call $~lib/metashrew-as/assembly/utils/box/Box.from
  call $~lib/array/Array<~lib/metashrew-as/assembly/utils/box/Box>#__set
  local.get $2
  i32.const 1
  local.get $index
  call $~lib/metashrew-as/assembly/utils/utils/primitiveToBuffer<u32>
  call $~lib/metashrew-as/assembly/utils/box/Box.from
  call $~lib/array/Array<~lib/metashrew-as/assembly/utils/box/Box>#__set
  local.get $2
  call $~lib/metashrew-as/assembly/utils/box/Box.concat
  return
 )
 (func $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#append (param $this i32) (param $v i32)
  local.get $this
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#extend
  local.get $v
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#set
 )
 (func $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#selectValue<u64> (param $this i32) (param $key i64) (result i32)
  (local $keyBytes i32)
  i32.const 0
  i32.const 8
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.set $keyBytes
  local.get $keyBytes
  local.get $key
  call $~lib/polyfills/bswap<u64>
  i64.store
  local.get $this
  local.get $keyBytes
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
  return
 )
 (func $~lib/metashrew-as/assembly/blockdata/inscription/Field#get:data (param $this i32) (result i32)
  local.get $this
  i32.load offset=4
 )
 (func $~lib/metashrew-as/assembly/blockdata/inscription/Inscription#toArrayBuffer~anonymous|0 (param $r i32) (param $v i32) (param $i i32) (param $ary i32) (result i32)
  (local $4 i32)
  (local $5 i32)
  i32.const 2
  i32.const 2
  i32.const 27
  i32.const 0
  call $~lib/rt/__newArray
  local.set $4
  local.get $4
  i32.load offset=4
  local.set $5
  local.get $4
  i32.const 0
  local.get $r
  call $~lib/metashrew-as/assembly/utils/box/Box.from
  call $~lib/array/Array<~lib/metashrew-as/assembly/utils/box/Box>#__set
  local.get $4
  i32.const 1
  local.get $v
  call $~lib/metashrew-as/assembly/blockdata/inscription/Field#get:data
  call $~lib/metashrew-as/assembly/utils/box/Box.from
  call $~lib/array/Array<~lib/metashrew-as/assembly/utils/box/Box>#__set
  local.get $4
  call $~lib/metashrew-as/assembly/utils/box/Box.concat
  return
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/inscription/Field>#reduce<~lib/arraybuffer/ArrayBuffer> (param $this i32) (param $fn i32) (param $initialValue i32) (result i32)
  (local $acc i32)
  (local $i i32)
  (local $len i32)
  (local $6 i32)
  (local $7 i32)
  local.get $initialValue
  local.set $acc
  i32.const 0
  local.set $i
  local.get $this
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/inscription/Field>#get:length_
  local.set $len
  loop $for-loop|0
   local.get $i
   local.get $len
   local.tee $6
   local.get $this
   call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/inscription/Field>#get:length_
   local.tee $7
   local.get $6
   local.get $7
   i32.lt_s
   select
   i32.lt_s
   if
    local.get $acc
    local.get $this
    call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/inscription/Field>#get:dataStart
    local.get $i
    i32.const 2
    i32.shl
    i32.add
    i32.load
    local.get $i
    local.get $this
    i32.const 4
    global.set $~argumentsLength
    local.get $fn
    i32.load
    call_indirect (type $6)
    local.set $acc
    local.get $i
    i32.const 1
    i32.add
    local.set $i
    br $for-loop|0
   end
  end
  local.get $acc
  return
 )
 (func $~lib/metashrew-as/assembly/blockdata/inscription/Inscription#toArrayBuffer (param $this i32) (result i32)
  local.get $this
  call $~lib/metashrew-as/assembly/blockdata/inscription/Inscription#get:fields
  i32.const 5728
  i32.const 0
  i32.const 0
  call $~lib/arraybuffer/ArrayBuffer#constructor
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/inscription/Field>#reduce<~lib/arraybuffer/ArrayBuffer>
  return
 )
 (func $assembly/index/Index.indexTransactionInscriptions (param $tx i32) (param $txid i32) (param $height i32)
  (local $jubilant i32)
  (local $total i32)
  (local $offset i64)
  (local $outputIndex i32)
  (local $i i32)
  (local $inscription i32)
  (local $sequenceNumber i64)
  (local $outpoint i32)
  (local $satpoint i32)
  (local $sat i64)
  (local $inscriptionId i32)
  (local $previousOutput i32)
  (local $inscriptionsForOutpoint i32)
  (local $j i32)
  (local $inscriptionId|17 i32)
  (local $outpoint|18 i32)
  (local $satpoint|19 i32)
  local.get $height
  global.get $assembly/constants/JUBILEE_HEIGHT
  i32.ge_u
  local.set $jubilant
  i32.const 0
  local.set $total
  i64.const 0
  local.set $offset
  i32.const 0
  local.set $outputIndex
  i32.const 0
  local.set $i
  loop $for-loop|0
   local.get $i
   local.get $tx
   call $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#get:ins
   call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Input>#get:length
   i32.lt_s
   if
    local.get $tx
    call $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#get:ins
    local.get $i
    call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Input>#__get
    call $~lib/metashrew-as/assembly/blockdata/transaction/Input#inscription
    local.set $inscription
    local.get $inscription
    i32.const 0
    i32.ne
    if
     global.get $assembly/index/NEXT_SEQUENCE_NUMBER
     call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#getValue<u64>
     local.set $sequenceNumber
     local.get $txid
     local.get $outputIndex
     call $~lib/metashrew-as/assembly/blockdata/transaction/OutPoint.from
     call $~lib/metashrew-as/assembly/blockdata/transaction/OutPoint#toArrayBuffer
     local.set $outpoint
     local.get $outpoint
     local.get $offset
     call $~lib/metashrew-as/assembly/blockdata/sat/SatPoint.from
     call $~lib/metashrew-as/assembly/blockdata/sat/SatPoint#toArrayBuffer
     local.set $satpoint
     local.get $offset
     i64.const 1
     i64.add
     local.set $offset
     local.get $offset
     local.get $tx
     call $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#get:outs
     local.get $outputIndex
     call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Output>#__get
     call $~lib/metashrew-as/assembly/blockdata/transaction/Output#get:value
     i64.ge_u
     if
      local.get $outputIndex
      i32.const 1
      i32.add
      local.set $outputIndex
      i64.const 0
      local.set $offset
     end
     global.get $assembly/index/OUTPOINT_TO_SAT
     i32.const 0
     call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#selectIndex
     call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#getValue<u64>
     local.set $sat
     local.get $satpoint
     i32.const 0
     call $assembly/index/toID
     local.set $inscriptionId
     global.get $assembly/index/SATPOINT_TO_SAT
     local.get $satpoint
     call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
     local.get $sat
     call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#setValue<u64>
     global.get $assembly/index/SATPOINT_TO_INSCRIPTION_ID
     local.get $satpoint
     call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
     local.get $inscriptionId
     call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#set
     global.get $assembly/index/INSCRIPTION_ID_TO_SATPOINT
     local.get $inscriptionId
     call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
     local.get $satpoint
     call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#set
     global.get $assembly/index/INSCRIPTION_ID_TO_BLOCKHEIGHT
     local.get $inscriptionId
     call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
     local.get $height
     call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#setValue<u32>
     global.get $assembly/index/HEIGHT_TO_INSCRIPTION_IDS
     local.get $height
     call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#selectValue<u32>
     local.get $inscriptionId
     call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#append
     global.get $assembly/index/SEQUENCE_NUMBER_TO_INSCRIPTION_ID
     local.get $sequenceNumber
     call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#selectValue<u64>
     local.get $inscriptionId
     call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#set
     global.get $assembly/index/INSCRIPTION_ID_TO_SEQUENCE_NUMBER
     local.get $inscriptionId
     call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
     local.get $sequenceNumber
     call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#setValue<u64>
     global.get $assembly/index/INSCRIPTION_ID_TO_INSCRIPTION
     local.get $inscriptionId
     call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
     local.get $inscription
     call $~lib/metashrew-as/assembly/blockdata/inscription/Inscription#toArrayBuffer
     call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#set
     global.get $assembly/index/OUTPOINT_TO_SEQUENCE_NUMBERS
     local.get $outpoint
     call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
     local.get $sequenceNumber
     call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#appendValue<u64>
    else
     local.get $tx
     call $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#get:ins
     local.get $i
     call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Input>#__get
     call $~lib/metashrew-as/assembly/blockdata/transaction/Input#previousOutput
     call $~lib/metashrew-as/assembly/blockdata/transaction/OutPoint#toArrayBuffer
     local.set $previousOutput
     global.get $assembly/index/OUTPOINT_TO_SEQUENCE_NUMBERS
     local.get $previousOutput
     call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
     call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#getListValues<u64>
     local.set $inscriptionsForOutpoint
     i32.const 0
     local.set $j
     loop $for-loop|1
      local.get $j
      local.get $inscriptionsForOutpoint
      call $~lib/array/Array<u64>#get:length
      i32.lt_s
      if
       global.get $assembly/index/SEQUENCE_NUMBER_TO_INSCRIPTION_ID
       local.get $inscriptionsForOutpoint
       local.get $j
       call $~lib/array/Array<u64>#__get
       call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#selectValue<u64>
       call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#get
       local.set $inscriptionId|17
       local.get $txid
       local.get $outputIndex
       call $~lib/metashrew-as/assembly/blockdata/transaction/OutPoint.from
       call $~lib/metashrew-as/assembly/blockdata/transaction/OutPoint#toArrayBuffer
       local.set $outpoint|18
       local.get $outpoint|18
       local.get $offset
       call $~lib/metashrew-as/assembly/blockdata/sat/SatPoint.from
       call $~lib/metashrew-as/assembly/blockdata/sat/SatPoint#toArrayBuffer
       local.set $satpoint|19
       global.get $assembly/index/SATPOINT_TO_INSCRIPTION_ID
       local.get $satpoint|19
       call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
       local.get $inscriptionId|17
       call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#set
       global.get $assembly/index/INSCRIPTION_ID_TO_SATPOINT
       local.get $inscriptionId|17
       call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
       local.get $satpoint|19
       call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#set
       local.get $offset
       i64.const 1
       i64.add
       local.set $offset
       local.get $offset
       local.get $tx
       call $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#get:outs
       local.get $outputIndex
       call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Output>#__get
       call $~lib/metashrew-as/assembly/blockdata/transaction/Output#get:value
       i64.ge_u
       if
        local.get $outputIndex
        i32.const 1
        i32.add
        local.set $outputIndex
        i64.const 0
        local.set $offset
       end
       local.get $j
       i32.const 1
       i32.add
       local.set $j
       br $for-loop|1
      end
     end
    end
    local.get $i
    i32.const 1
    i32.add
    local.set $i
    br $for-loop|0
   end
  end
 )
 (func $assembly/index/Index.indexBlock (param $height i32) (param $block i32)
  (local $coinbase i32)
  (local $startingSat i64)
  (local $reward i64)
  (local $coinbaseSource i32)
  (local $coinbaseSink i32)
  (local $i i32)
  (local $tx i32)
  (local $transactionSink i32)
  (local $transactionSource i32)
  (local $txid i32)
  global.get $assembly/index/HEIGHT_TO_BLOCKHASH
  local.get $height
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#selectValue<u32>
  local.get $block
  call $~lib/metashrew-as/assembly/blockdata/block/Block#blockhash
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#set
  global.get $assembly/index/BLOCKHASH_TO_HEIGHT
  local.get $block
  call $~lib/metashrew-as/assembly/blockdata/block/Block#blockhash
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
  local.get $height
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#setValue<u32>
  local.get $block
  call $assembly/index/Index.indexOutputValuesForBlock
  local.get $block
  call $~lib/metashrew-as/assembly/blockdata/block/Block#coinbase
  local.set $coinbase
  global.get $assembly/index/STARTING_SAT
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#getValue<u64>
  local.set $startingSat
  local.get $coinbase
  call $assembly/index/Index.totalOutputs
  local.get $block
  call $assembly/index/Index.transactionFeesForBlock
  i64.sub
  local.set $reward
  global.get $assembly/index/STARTING_SAT
  local.get $startingSat
  local.get $reward
  i64.add
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#setValue<u64>
  local.get $startingSat
  local.get $reward
  call $assembly/index/SatSource.range
  local.set $coinbaseSource
  local.get $coinbase
  call $assembly/index/SatSink.fromTransaction
  local.set $coinbaseSink
  local.get $coinbaseSink
  local.get $coinbaseSource
  call $assembly/index/SatSink#consume
  i32.const 1
  local.set $i
  loop $for-loop|0
   local.get $i
   local.get $block
   call $~lib/metashrew-as/assembly/blockdata/block/Block#get:transactions
   call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Transaction>#get:length
   i32.lt_s
   if
    local.get $block
    call $~lib/metashrew-as/assembly/blockdata/block/Block#get:transactions
    local.get $i
    call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Transaction>#__get
    local.set $tx
    local.get $tx
    call $assembly/index/SatSink.fromTransaction
    local.set $transactionSink
    local.get $tx
    call $assembly/index/SatSource.fromTransaction
    call $assembly/index/SatSource#pull
    local.set $transactionSource
    local.get $transactionSink
    local.get $transactionSource
    call $assembly/index/SatSink#consume
    local.get $tx
    call $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#txid
    local.set $txid
    local.get $transactionSource
    call $assembly/index/SatSource#consumed
    i32.eqz
    if
     local.get $coinbaseSink
     local.get $transactionSource
     call $assembly/index/SatSink#consume
    end
    local.get $tx
    local.get $txid
    local.get $height
    call $assembly/index/Index.indexTransactionInscriptions
    local.get $i
    i32.const 1
    i32.add
    local.set $i
    br $for-loop|0
   end
  end
 )
 (func $~lib/array/Array<~lib/string/String>#set:buffer (param $this i32) (param $buffer i32)
  local.get $this
  local.get $buffer
  i32.store
  local.get $this
  local.get $buffer
  i32.const 0
  call $~lib/rt/stub/__link
 )
 (func $~lib/array/Array<~lib/string/String>#set:dataStart (param $this i32) (param $dataStart i32)
  local.get $this
  local.get $dataStart
  i32.store offset=4
 )
 (func $~lib/array/Array<~lib/string/String>#set:byteLength (param $this i32) (param $byteLength i32)
  local.get $this
  local.get $byteLength
  i32.store offset=8
 )
 (func $~lib/array/Array<~lib/string/String>#set:length_ (param $this i32) (param $length_ i32)
  local.get $this
  local.get $length_
  i32.store offset=12
 )
 (func $~lib/array/Array<~lib/string/String>#constructor (param $this i32) (param $length i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $bufferSize i32)
  (local $buffer i32)
  local.get $this
  i32.eqz
  if
   i32.const 16
   i32.const 45
   call $~lib/rt/stub/__new
   local.set $this
  end
  local.get $this
  i32.const 0
  call $~lib/array/Array<~lib/string/String>#set:buffer
  local.get $this
  i32.const 0
  call $~lib/array/Array<~lib/string/String>#set:dataStart
  local.get $this
  i32.const 0
  call $~lib/array/Array<~lib/string/String>#set:byteLength
  local.get $this
  i32.const 0
  call $~lib/array/Array<~lib/string/String>#set:length_
  local.get $length
  i32.const 1073741820
  i32.const 2
  i32.shr_u
  i32.gt_u
  if
   i32.const 1376
   i32.const 2240
   i32.const 70
   i32.const 60
   call $~lib/builtins/abort
   unreachable
  end
  local.get $length
  local.tee $2
  i32.const 8
  local.tee $3
  local.get $2
  local.get $3
  i32.gt_u
  select
  i32.const 2
  i32.shl
  local.set $bufferSize
  local.get $bufferSize
  i32.const 1
  call $~lib/rt/stub/__new
  local.set $buffer
  i32.const 0
  global.get $~lib/shared/runtime/Runtime.Incremental
  i32.ne
  drop
  local.get $buffer
  i32.const 0
  local.get $bufferSize
  memory.fill
  local.get $this
  local.get $buffer
  call $~lib/array/Array<~lib/string/String>#set:buffer
  local.get $this
  local.get $buffer
  call $~lib/array/Array<~lib/string/String>#set:dataStart
  local.get $this
  local.get $bufferSize
  call $~lib/array/Array<~lib/string/String>#set:byteLength
  local.get $this
  local.get $length
  call $~lib/array/Array<~lib/string/String>#set:length_
  local.get $this
 )
 (func $~lib/array/Array<~lib/string/String>#get:length_ (param $this i32) (result i32)
  local.get $this
  i32.load offset=12
 )
 (func $~lib/array/Array<~lib/string/String>#get:dataStart (param $this i32) (result i32)
  local.get $this
  i32.load offset=4
 )
 (func $~lib/array/Array<~lib/string/String>#__set (param $this i32) (param $index i32) (param $value i32)
  local.get $index
  local.get $this
  call $~lib/array/Array<~lib/string/String>#get:length_
  i32.ge_u
  if
   local.get $index
   i32.const 0
   i32.lt_s
   if
    i32.const 2112
    i32.const 2240
    i32.const 130
    i32.const 22
    call $~lib/builtins/abort
    unreachable
   end
   local.get $this
   local.get $index
   i32.const 1
   i32.add
   i32.const 2
   i32.const 1
   call $~lib/array/ensureCapacity
   local.get $this
   local.get $index
   i32.const 1
   i32.add
   call $~lib/array/Array<~lib/string/String>#set:length_
  end
  local.get $this
  call $~lib/array/Array<~lib/string/String>#get:dataStart
  local.get $index
  i32.const 2
  i32.shl
  i32.add
  local.get $value
  i32.store
  i32.const 1
  drop
  local.get $this
  local.get $value
  i32.const 1
  call $~lib/rt/stub/__link
 )
 (func $~lib/array/Array<~lib/string/String>#set:length (param $this i32) (param $newLength i32)
  local.get $this
  local.get $newLength
  i32.const 2
  i32.const 0
  call $~lib/array/ensureCapacity
  local.get $this
  local.get $newLength
  call $~lib/array/Array<~lib/string/String>#set:length_
 )
 (func $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#keys" (param $this i32) (result i32)
  (local $start i32)
  (local $size i32)
  (local $keys i32)
  (local $length i32)
  (local $i i32)
  (local $entry i32)
  (local $7 i32)
  local.get $this
  call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#get:entries"
  local.set $start
  local.get $this
  call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#get:entriesOffset"
  local.set $size
  i32.const 0
  local.get $size
  call $~lib/array/Array<~lib/string/String>#constructor
  local.set $keys
  i32.const 0
  local.set $length
  i32.const 0
  local.set $i
  loop $for-loop|0
   local.get $i
   local.get $size
   i32.lt_s
   if
    local.get $start
    local.get $i
    block $"~lib/map/ENTRY_SIZE<~lib/string/String,~lib/arraybuffer/ArrayBuffer>|inlined.6" (result i32)
     i32.const 12
     br $"~lib/map/ENTRY_SIZE<~lib/string/String,~lib/arraybuffer/ArrayBuffer>|inlined.6"
    end
    i32.mul
    i32.add
    local.set $entry
    local.get $entry
    call $"~lib/map/MapEntry<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#get:taggedNext"
    i32.const 1
    i32.and
    i32.eqz
    if
     local.get $keys
     local.get $length
     local.tee $7
     i32.const 1
     i32.add
     local.set $length
     local.get $7
     local.get $entry
     call $"~lib/map/MapEntry<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#get:key"
     call $~lib/array/Array<~lib/string/String>#__set
    end
    local.get $i
    i32.const 1
    i32.add
    local.set $i
    br $for-loop|0
   end
  end
  local.get $keys
  local.get $length
  call $~lib/array/Array<~lib/string/String>#set:length
  local.get $keys
  return
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/utils/rlp/RLPItem>#set:buffer (param $this i32) (param $buffer i32)
  local.get $this
  local.get $buffer
  i32.store
  local.get $this
  local.get $buffer
  i32.const 0
  call $~lib/rt/stub/__link
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/utils/rlp/RLPItem>#set:dataStart (param $this i32) (param $dataStart i32)
  local.get $this
  local.get $dataStart
  i32.store offset=4
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/utils/rlp/RLPItem>#set:byteLength (param $this i32) (param $byteLength i32)
  local.get $this
  local.get $byteLength
  i32.store offset=8
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/utils/rlp/RLPItem>#set:length_ (param $this i32) (param $length_ i32)
  local.get $this
  local.get $length_
  i32.store offset=12
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/utils/rlp/RLPItem>#constructor (param $this i32) (param $length i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $bufferSize i32)
  (local $buffer i32)
  local.get $this
  i32.eqz
  if
   i32.const 16
   i32.const 47
   call $~lib/rt/stub/__new
   local.set $this
  end
  local.get $this
  i32.const 0
  call $~lib/array/Array<~lib/metashrew-as/assembly/utils/rlp/RLPItem>#set:buffer
  local.get $this
  i32.const 0
  call $~lib/array/Array<~lib/metashrew-as/assembly/utils/rlp/RLPItem>#set:dataStart
  local.get $this
  i32.const 0
  call $~lib/array/Array<~lib/metashrew-as/assembly/utils/rlp/RLPItem>#set:byteLength
  local.get $this
  i32.const 0
  call $~lib/array/Array<~lib/metashrew-as/assembly/utils/rlp/RLPItem>#set:length_
  local.get $length
  i32.const 1073741820
  i32.const 2
  i32.shr_u
  i32.gt_u
  if
   i32.const 1376
   i32.const 2240
   i32.const 70
   i32.const 60
   call $~lib/builtins/abort
   unreachable
  end
  local.get $length
  local.tee $2
  i32.const 8
  local.tee $3
  local.get $2
  local.get $3
  i32.gt_u
  select
  i32.const 2
  i32.shl
  local.set $bufferSize
  local.get $bufferSize
  i32.const 1
  call $~lib/rt/stub/__new
  local.set $buffer
  i32.const 0
  global.get $~lib/shared/runtime/Runtime.Incremental
  i32.ne
  drop
  local.get $buffer
  i32.const 0
  local.get $bufferSize
  memory.fill
  local.get $this
  local.get $buffer
  call $~lib/array/Array<~lib/metashrew-as/assembly/utils/rlp/RLPItem>#set:buffer
  local.get $this
  local.get $buffer
  call $~lib/array/Array<~lib/metashrew-as/assembly/utils/rlp/RLPItem>#set:dataStart
  local.get $this
  local.get $bufferSize
  call $~lib/array/Array<~lib/metashrew-as/assembly/utils/rlp/RLPItem>#set:byteLength
  local.get $this
  local.get $length
  call $~lib/array/Array<~lib/metashrew-as/assembly/utils/rlp/RLPItem>#set:length_
  local.get $this
 )
 (func $~lib/metashrew-as/assembly/utils/rlp/RLPItem#set:data (param $this i32) (param $data i32)
  local.get $this
  local.get $data
  i32.store offset=4
 )
 (func $~lib/metashrew-as/assembly/utils/rlp/RLPItem#set:typeFlag (param $this i32) (param $typeFlag i32)
  local.get $this
  local.get $typeFlag
  i32.store
 )
 (func $~lib/metashrew-as/assembly/utils/rlp/RLPItem#constructor (param $this i32) (param $ptr i32) (param $typeFlag i32) (result i32)
  local.get $this
  i32.eqz
  if
   i32.const 8
   i32.const 46
   call $~lib/rt/stub/__new
   local.set $this
  end
  local.get $this
  i32.const 0
  call $~lib/metashrew-as/assembly/utils/rlp/RLPItem#set:typeFlag
  local.get $this
  i32.const 0
  call $~lib/metashrew-as/assembly/utils/rlp/RLPItem#set:data
  local.get $this
  local.get $ptr
  call $~lib/metashrew-as/assembly/utils/rlp/RLPItem#set:data
  local.get $this
  local.get $typeFlag
  call $~lib/metashrew-as/assembly/utils/rlp/RLPItem#set:typeFlag
  local.get $this
 )
 (func $~lib/metashrew-as/assembly/utils/rlp/RLPItem.fromArrayBuffer (param $v i32) (result i32)
  i32.const 0
  local.get $v
  i32.const 1
  call $~lib/metashrew-as/assembly/utils/rlp/RLPItem#constructor
  return
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/utils/rlp/RLPItem>#get:length_ (param $this i32) (result i32)
  local.get $this
  i32.load offset=12
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/utils/rlp/RLPItem>#get:dataStart (param $this i32) (result i32)
  local.get $this
  i32.load offset=4
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/utils/rlp/RLPItem>#push (param $this i32) (param $value i32) (result i32)
  (local $oldLen i32)
  (local $len i32)
  local.get $this
  call $~lib/array/Array<~lib/metashrew-as/assembly/utils/rlp/RLPItem>#get:length_
  local.set $oldLen
  local.get $oldLen
  i32.const 1
  i32.add
  local.set $len
  local.get $this
  local.get $len
  i32.const 2
  i32.const 1
  call $~lib/array/ensureCapacity
  i32.const 1
  drop
  local.get $this
  call $~lib/array/Array<~lib/metashrew-as/assembly/utils/rlp/RLPItem>#get:dataStart
  local.get $oldLen
  i32.const 2
  i32.shl
  i32.add
  local.get $value
  i32.store
  local.get $this
  local.get $value
  i32.const 1
  call $~lib/rt/stub/__link
  local.get $this
  local.get $len
  call $~lib/array/Array<~lib/metashrew-as/assembly/utils/rlp/RLPItem>#set:length_
  local.get $len
  return
 )
 (func $~lib/metashrew-as/assembly/indexer/index/_flush~anonymous|0 (param $r i32) (param $v i32) (param $i i32) (param $ary i32) (result i32)
  local.get $r
  global.get $~lib/metashrew-as/assembly/indexer/index/_updateKeys
  local.get $v
  call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#get"
  call $~lib/metashrew-as/assembly/utils/rlp/RLPItem.fromArrayBuffer
  call $~lib/array/Array<~lib/metashrew-as/assembly/utils/rlp/RLPItem>#push
  drop
  local.get $r
  global.get $~lib/metashrew-as/assembly/indexer/index/_updates
  local.get $v
  call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#get"
  call $~lib/metashrew-as/assembly/utils/rlp/RLPItem.fromArrayBuffer
  call $~lib/array/Array<~lib/metashrew-as/assembly/utils/rlp/RLPItem>#push
  drop
  local.get $r
  return
 )
 (func $~lib/array/Array<~lib/string/String>#reduce<~lib/array/Array<~lib/metashrew-as/assembly/utils/rlp/RLPItem>> (param $this i32) (param $fn i32) (param $initialValue i32) (result i32)
  (local $acc i32)
  (local $i i32)
  (local $len i32)
  (local $6 i32)
  (local $7 i32)
  local.get $initialValue
  local.set $acc
  i32.const 0
  local.set $i
  local.get $this
  call $~lib/array/Array<~lib/string/String>#get:length_
  local.set $len
  loop $for-loop|0
   local.get $i
   local.get $len
   local.tee $6
   local.get $this
   call $~lib/array/Array<~lib/string/String>#get:length_
   local.tee $7
   local.get $6
   local.get $7
   i32.lt_s
   select
   i32.lt_s
   if
    local.get $acc
    local.get $this
    call $~lib/array/Array<~lib/string/String>#get:dataStart
    local.get $i
    i32.const 2
    i32.shl
    i32.add
    i32.load
    local.get $i
    local.get $this
    i32.const 4
    global.set $~argumentsLength
    local.get $fn
    i32.load
    call_indirect (type $6)
    local.set $acc
    local.get $i
    i32.const 1
    i32.add
    local.set $i
    br $for-loop|0
   end
  end
  local.get $acc
  return
 )
 (func $~lib/metashrew-as/assembly/utils/rlp/RLPItem.fromList (param $v i32) (result i32)
  i32.const 0
  local.get $v
  i32.const 3
  call $~lib/metashrew-as/assembly/utils/rlp/RLPItem#constructor
  return
 )
 (func $~lib/metashrew-as/assembly/utils/rlp/RLPItem#get:typeFlag (param $this i32) (result i32)
  local.get $this
  i32.load
 )
 (func $~lib/metashrew-as/assembly/utils/rlp/RLPItem#get:data (param $this i32) (result i32)
  local.get $this
  i32.load offset=4
 )
 (func $~lib/metashrew-as/assembly/utils/rlp/RLPItem#asList (param $this i32) (result i32)
  local.get $this
  call $~lib/metashrew-as/assembly/utils/rlp/RLPItem#get:data
  return
 )
 (func $~lib/metashrew-as/assembly/utils/rlp/toRLP~anonymous|0 (param $v i32) (param $i i32) (param $ary i32) (result i32)
  (local $item i32)
  local.get $v
  call $~lib/metashrew-as/assembly/utils/rlp/toRLP
  local.set $item
  local.get $item
  return
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/utils/rlp/RLPItem>#map<~lib/arraybuffer/ArrayBuffer> (param $this i32) (param $fn i32) (result i32)
  (local $len i32)
  (local $out i32)
  (local $outStart i32)
  (local $i i32)
  (local $6 i32)
  (local $7 i32)
  (local $result i32)
  local.get $this
  call $~lib/array/Array<~lib/metashrew-as/assembly/utils/rlp/RLPItem>#get:length_
  local.set $len
  local.get $len
  i32.const 2
  i32.const 30
  i32.const 0
  call $~lib/rt/__newArray
  local.set $out
  local.get $out
  call $~lib/array/Array<~lib/arraybuffer/ArrayBuffer>#get:dataStart
  local.set $outStart
  i32.const 0
  local.set $i
  loop $for-loop|0
   local.get $i
   local.get $len
   local.tee $6
   local.get $this
   call $~lib/array/Array<~lib/metashrew-as/assembly/utils/rlp/RLPItem>#get:length_
   local.tee $7
   local.get $6
   local.get $7
   i32.lt_s
   select
   i32.lt_s
   if
    local.get $this
    call $~lib/array/Array<~lib/metashrew-as/assembly/utils/rlp/RLPItem>#get:dataStart
    local.get $i
    i32.const 2
    i32.shl
    i32.add
    i32.load
    local.get $i
    local.get $this
    i32.const 3
    global.set $~argumentsLength
    local.get $fn
    i32.load
    call_indirect (type $3)
    local.set $result
    local.get $outStart
    local.get $i
    i32.const 2
    i32.shl
    i32.add
    local.get $result
    i32.store
    i32.const 1
    drop
    local.get $out
    local.get $result
    i32.const 1
    call $~lib/rt/stub/__link
    local.get $i
    i32.const 1
    i32.add
    local.set $i
    br $for-loop|0
   end
  end
  local.get $out
  return
 )
 (func $~lib/metashrew-as/assembly/utils/rlp/toRLP~anonymous|1 (param $r i32) (param $v i32) (param $i i32) (param $ary i32) (result i32)
  local.get $r
  local.get $v
  call $~lib/arraybuffer/ArrayBuffer#get:byteLength
  i32.add
  return
 )
 (func $~lib/array/Array<~lib/arraybuffer/ArrayBuffer>#reduce<i32> (param $this i32) (param $fn i32) (param $initialValue i32) (result i32)
  (local $acc i32)
  (local $i i32)
  (local $len i32)
  (local $6 i32)
  (local $7 i32)
  local.get $initialValue
  local.set $acc
  i32.const 0
  local.set $i
  local.get $this
  call $~lib/array/Array<~lib/arraybuffer/ArrayBuffer>#get:length_
  local.set $len
  loop $for-loop|0
   local.get $i
   local.get $len
   local.tee $6
   local.get $this
   call $~lib/array/Array<~lib/arraybuffer/ArrayBuffer>#get:length_
   local.tee $7
   local.get $6
   local.get $7
   i32.lt_s
   select
   i32.lt_s
   if
    local.get $acc
    local.get $this
    call $~lib/array/Array<~lib/arraybuffer/ArrayBuffer>#get:dataStart
    local.get $i
    i32.const 2
    i32.shl
    i32.add
    i32.load
    local.get $i
    local.get $this
    i32.const 4
    global.set $~argumentsLength
    local.get $fn
    i32.load
    call_indirect (type $6)
    local.set $acc
    local.get $i
    i32.const 1
    i32.add
    local.set $i
    br $for-loop|0
   end
  end
  local.get $acc
  return
 )
 (func $~lib/metashrew-as/assembly/utils/pointer/nullptr<~lib/arraybuffer/ArrayBuffer> (result i32)
  i32.const 0
  return
 )
 (func $~lib/metashrew-as/assembly/utils/rlp/toRLP~anonymous|2 (param $r i32) (param $v i32) (param $i i32) (param $ary i32) (result i32)
  local.get $r
  local.get $v
  local.get $v
  call $~lib/arraybuffer/ArrayBuffer#get:byteLength
  call $~lib/metashrew-as/assembly/utils/memcpy/memcpy
  drop
  local.get $r
  local.get $v
  call $~lib/arraybuffer/ArrayBuffer#get:byteLength
  i32.add
  return
 )
 (func $~lib/array/Array<~lib/arraybuffer/ArrayBuffer>#reduce<usize> (param $this i32) (param $fn i32) (param $initialValue i32) (result i32)
  (local $acc i32)
  (local $i i32)
  (local $len i32)
  (local $6 i32)
  (local $7 i32)
  local.get $initialValue
  local.set $acc
  i32.const 0
  local.set $i
  local.get $this
  call $~lib/array/Array<~lib/arraybuffer/ArrayBuffer>#get:length_
  local.set $len
  loop $for-loop|0
   local.get $i
   local.get $len
   local.tee $6
   local.get $this
   call $~lib/array/Array<~lib/arraybuffer/ArrayBuffer>#get:length_
   local.tee $7
   local.get $6
   local.get $7
   i32.lt_s
   select
   i32.lt_s
   if
    local.get $acc
    local.get $this
    call $~lib/array/Array<~lib/arraybuffer/ArrayBuffer>#get:dataStart
    local.get $i
    i32.const 2
    i32.shl
    i32.add
    i32.load
    local.get $i
    local.get $this
    i32.const 4
    global.set $~argumentsLength
    local.get $fn
    i32.load
    call_indirect (type $6)
    local.set $acc
    local.get $i
    i32.const 1
    i32.add
    local.set $i
    br $for-loop|0
   end
  end
  local.get $acc
  return
 )
 (func $~lib/metashrew-as/assembly/utils/rlp/byteLengthForLength (param $v i32) (result i32)
  local.get $v
  i32.const 24
  i32.shr_s
  i32.const 0
  i32.ne
  if
   i32.const 4
   return
  end
  local.get $v
  i32.const 16
  i32.shr_s
  i32.const 0
  i32.ne
  if
   i32.const 3
   return
  end
  local.get $v
  i32.const 8
  i32.shr_s
  i32.const 0
  i32.ne
  if
   i32.const 2
   return
  end
  i32.const 1
  return
 )
 (func $~lib/metashrew-as/assembly/utils/rlp/toRLP~anonymous|3 (param $r i32) (param $v i32) (param $i i32) (param $ary i32) (result i32)
  local.get $r
  local.get $v
  local.get $v
  call $~lib/arraybuffer/ArrayBuffer#get:byteLength
  call $~lib/metashrew-as/assembly/utils/memcpy/memcpy
  drop
  local.get $r
  local.get $v
  call $~lib/arraybuffer/ArrayBuffer#get:byteLength
  i32.add
  return
 )
 (func $~lib/metashrew-as/assembly/utils/rlp/RLPItem#asArrayBuffer (param $this i32) (result i32)
  local.get $this
  call $~lib/metashrew-as/assembly/utils/rlp/RLPItem#get:data
  return
 )
 (func $~lib/metashrew-as/assembly/utils/rlp/RLPItem#asBox (param $this i32) (result i32)
  local.get $this
  call $~lib/metashrew-as/assembly/utils/rlp/RLPItem#get:data
  return
 )
 (func $~lib/metashrew-as/assembly/utils/rlp/toRLP (param $item i32) (result i32)
  (local $list i32)
  (local $length i32)
  (local $result i32)
  (local $byteLength i32)
  (local $start i32)
  (local $len i32)
  (local $val i32)
  (local $val|8 i32)
  (local $byte i32)
  (local $result|10 i32)
  (local $result|11 i32)
  (local $length|12 i32)
  (local $result|13 i32)
  local.get $item
  call $~lib/metashrew-as/assembly/utils/rlp/RLPItem#get:typeFlag
  i32.const 3
  i32.eq
  if
   local.get $item
   call $~lib/metashrew-as/assembly/utils/rlp/RLPItem#asList
   i32.const 5792
   call $~lib/array/Array<~lib/metashrew-as/assembly/utils/rlp/RLPItem>#map<~lib/arraybuffer/ArrayBuffer>
   local.set $list
   local.get $list
   i32.const 5824
   i32.const 0
   call $~lib/array/Array<~lib/arraybuffer/ArrayBuffer>#reduce<i32>
   local.set $length
   call $~lib/metashrew-as/assembly/utils/pointer/nullptr<~lib/arraybuffer/ArrayBuffer>
   local.set $result
   local.get $length
   i32.const 55
   i32.le_s
   if
    i32.const 0
    local.get $length
    i32.const 1
    i32.add
    call $~lib/arraybuffer/ArrayBuffer#constructor
    local.set $result
    local.get $result
    i32.const 192
    local.get $length
    i32.add
    i32.store8
    local.get $list
    i32.const 5856
    local.get $result
    i32.const 1
    i32.add
    call $~lib/array/Array<~lib/arraybuffer/ArrayBuffer>#reduce<usize>
    drop
   else
    local.get $length
    call $~lib/metashrew-as/assembly/utils/rlp/byteLengthForLength
    local.set $byteLength
    i32.const 0
    local.get $length
    local.get $byteLength
    i32.add
    i32.const 1
    i32.add
    call $~lib/arraybuffer/ArrayBuffer#constructor
    local.set $result
    local.get $result
    i32.const 247
    local.get $byteLength
    i32.add
    i32.store8
    local.get $byteLength
    i32.const 1
    i32.eq
    if
     local.get $result
     i32.const 1
     i32.add
     local.get $length
     i32.store8
    else
     local.get $byteLength
     i32.const 2
     i32.eq
     if
      local.get $result
      i32.const 1
      i32.add
      local.get $length
      i32.const 65280
      i32.and
      i32.const 8
      i32.shr_s
      i32.store8
      local.get $result
      i32.const 2
      i32.add
      local.get $length
      i32.const 255
      i32.and
      i32.store8
     else
      local.get $byteLength
      i32.const 3
      i32.eq
      if
       local.get $result
       i32.const 1
       i32.add
       local.get $length
       i32.const 16711680
       i32.and
       i32.const 16
       i32.shr_s
       i32.store8
       local.get $result
       i32.const 2
       i32.add
       local.get $length
       i32.const 65280
       i32.and
       i32.const 8
       i32.shr_s
       i32.store8
       local.get $result
       i32.const 3
       i32.add
       local.get $length
       i32.const 255
       i32.and
       i32.store8
      else
       local.get $byteLength
       i32.const 4
       i32.eq
       if
        local.get $result
        i32.const 1
        i32.add
        local.get $length
        i32.const -16777216
        i32.and
        i32.const 24
        i32.shr_s
        i32.store8
        local.get $result
        i32.const 2
        i32.add
        local.get $length
        i32.const 16711680
        i32.and
        i32.const 16
        i32.shr_s
        i32.store8
        local.get $result
        i32.const 3
        i32.add
        local.get $length
        i32.const 65280
        i32.and
        i32.const 8
        i32.shr_s
        i32.store8
        local.get $result
        i32.const 4
        i32.add
        local.get $length
        i32.const 255
        i32.and
        i32.store8
       end
      end
     end
    end
    local.get $list
    i32.const 5888
    local.get $result
    i32.const 1
    i32.add
    local.get $byteLength
    i32.add
    call $~lib/array/Array<~lib/arraybuffer/ArrayBuffer>#reduce<usize>
    drop
   end
   local.get $result
   return
  else
   i32.const 0
   local.set $start
   i32.const 0
   local.set $len
   local.get $item
   call $~lib/metashrew-as/assembly/utils/rlp/RLPItem#get:typeFlag
   i32.const 1
   i32.eq
   if
    local.get $item
    call $~lib/metashrew-as/assembly/utils/rlp/RLPItem#asArrayBuffer
    local.set $val
    local.get $val
    local.set $start
    local.get $val
    call $~lib/arraybuffer/ArrayBuffer#get:byteLength
    local.set $len
   else
    local.get $item
    call $~lib/metashrew-as/assembly/utils/rlp/RLPItem#get:typeFlag
    i32.const 2
    i32.eq
    if
     local.get $item
     call $~lib/metashrew-as/assembly/utils/rlp/RLPItem#asBox
     local.set $val|8
     local.get $val|8
     call $~lib/metashrew-as/assembly/utils/box/Box#get:start
     local.set $start
     local.get $val|8
     call $~lib/metashrew-as/assembly/utils/box/Box#get:len
     local.set $len
    end
   end
   local.get $len
   i32.const 1
   i32.eq
   if
    local.get $start
    i32.load8_u
    local.set $byte
    local.get $byte
    i32.const 127
    i32.le_u
    if
     i32.const 0
     i32.const 1
     call $~lib/arraybuffer/ArrayBuffer#constructor
     local.set $result|10
     local.get $result|10
     local.get $byte
     i32.store8
     local.get $result|10
     return
    end
   end
   local.get $len
   i32.const 0
   i32.ge_s
   if (result i32)
    local.get $len
    i32.const 55
    i32.le_s
   else
    i32.const 0
   end
   if
    i32.const 0
    local.get $len
    i32.const 1
    i32.add
    call $~lib/arraybuffer/ArrayBuffer#constructor
    local.set $result|11
    local.get $result|11
    local.get $len
    i32.const 128
    i32.add
    i32.store8
    local.get $result|11
    i32.const 1
    i32.add
    local.get $start
    local.get $len
    call $~lib/metashrew-as/assembly/utils/memcpy/memcpy
    drop
    local.get $result|11
    return
   else
    local.get $len
    call $~lib/metashrew-as/assembly/utils/rlp/byteLengthForLength
    local.set $length|12
    i32.const 0
    local.get $len
    local.get $length|12
    i32.add
    i32.const 1
    i32.add
    call $~lib/arraybuffer/ArrayBuffer#constructor
    local.set $result|13
    local.get $result|13
    local.get $length|12
    i32.const 183
    i32.add
    i32.store8
    local.get $length|12
    i32.const 1
    i32.eq
    if
     local.get $result|13
     i32.const 1
     i32.add
     local.get $len
     i32.store8
    else
     local.get $length|12
     i32.const 2
     i32.eq
     if
      local.get $result|13
      i32.const 1
      i32.add
      local.get $len
      i32.const 65280
      i32.and
      i32.const 8
      i32.shr_s
      i32.store8
      local.get $result|13
      i32.const 2
      i32.add
      local.get $len
      i32.const 255
      i32.and
      i32.store8
     else
      local.get $length|12
      i32.const 3
      i32.eq
      if
       local.get $result|13
       i32.const 1
       i32.add
       local.get $len
       i32.const 16711680
       i32.and
       i32.const 16
       i32.shr_s
       i32.store8
       local.get $result|13
       i32.const 2
       i32.add
       local.get $len
       i32.const 65280
       i32.and
       i32.const 8
       i32.shr_s
       i32.store8
       local.get $result|13
       i32.const 3
       i32.add
       local.get $len
       i32.const 255
       i32.and
       i32.store8
      else
       local.get $length|12
       i32.const 4
       i32.eq
       if
        local.get $result|13
        i32.const 1
        i32.add
        local.get $len
        i32.const -16777216
        i32.and
        i32.const 24
        i32.shr_s
        i32.store8
        local.get $result|13
        i32.const 2
        i32.add
        local.get $len
        i32.const 16711680
        i32.and
        i32.const 16
        i32.shr_s
        i32.store8
        local.get $result|13
        i32.const 3
        i32.add
        local.get $len
        i32.const 65280
        i32.and
        i32.const 8
        i32.shr_s
        i32.store8
        local.get $result|13
        i32.const 4
        i32.add
        local.get $len
        i32.const 255
        i32.and
        i32.store8
       end
      end
     end
    end
    local.get $result|13
    i32.const 1
    i32.add
    local.get $length|12
    i32.add
    local.get $start
    local.get $len
    call $~lib/metashrew-as/assembly/utils/memcpy/memcpy
    drop
    local.get $result|13
    return
   end
   unreachable
  end
  unreachable
 )
 (func $~lib/metashrew-as/assembly/indexer/index/_flush
  (local $hashKeys i32)
  (local $rlpInput i32)
  (local $buffer i32)
  global.get $~lib/metashrew-as/assembly/indexer/index/_updates
  call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#keys"
  local.set $hashKeys
  i32.const 0
  i32.const 0
  call $~lib/array/Array<~lib/metashrew-as/assembly/utils/rlp/RLPItem>#constructor
  local.set $rlpInput
  local.get $hashKeys
  i32.const 5760
  local.get $rlpInput
  call $~lib/array/Array<~lib/string/String>#reduce<~lib/array/Array<~lib/metashrew-as/assembly/utils/rlp/RLPItem>>
  drop
  local.get $rlpInput
  call $~lib/metashrew-as/assembly/utils/rlp/RLPItem.fromList
  call $~lib/metashrew-as/assembly/utils/rlp/toRLP
  local.set $buffer
  local.get $buffer
  call $~lib/metashrew-as/assembly/indexer/index/__flush
 )
 (func $assembly/index/_start
  (local $data i32)
  (local $box i32)
  (local $height i32)
  (local $block i32)
  call $~lib/metashrew-as/assembly/indexer/index/input
  local.set $data
  local.get $data
  call $~lib/metashrew-as/assembly/utils/box/Box.from
  local.set $box
  local.get $box
  call $~lib/metashrew-as/assembly/utils/utils/parsePrimitive<u32>
  local.set $height
  i32.const 0
  local.get $box
  call $~lib/metashrew-as/assembly/blockdata/block/Block#constructor
  local.set $block
  local.get $height
  local.get $block
  call $assembly/index/Index.indexBlock
  call $~lib/metashrew-as/assembly/indexer/index/_flush
 )
 (func $~lib/metashrew-as/assembly/blockdata/sat/Sat#get:_idx (param $this i32) (result i64)
  local.get $this
  i64.load
 )
 (func $~lib/metashrew-as/assembly/blockdata/sat/Sat#n (param $this i32) (result i64)
  local.get $this
  call $~lib/metashrew-as/assembly/blockdata/sat/Sat#get:_idx
  return
 )
 (func $~lib/metashrew-as/assembly/utils/rlp/RLPItem.fromValue (param $v i32) (result i32)
  i32.const 0
  local.get $v
  i32.const 4
  call $~lib/metashrew-as/assembly/utils/rlp/RLPItem#constructor
  return
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/sat/Sat>#__get (param $this i32) (param $index i32) (result i32)
  (local $value i32)
  local.get $index
  local.get $this
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/sat/Sat>#get:length_
  i32.ge_u
  if
   i32.const 2112
   i32.const 2240
   i32.const 114
   i32.const 42
   call $~lib/builtins/abort
   unreachable
  end
  local.get $this
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/sat/Sat>#get:dataStart
  local.get $index
  i32.const 2
  i32.shl
  i32.add
  i32.load
  local.set $value
  i32.const 1
  drop
  i32.const 0
  i32.eqz
  drop
  local.get $value
  i32.eqz
  if
   i32.const 3376
   i32.const 2240
   i32.const 118
   i32.const 40
   call $~lib/builtins/abort
   unreachable
  end
  local.get $value
  return
 )
 (func $~lib/metashrew-as/assembly/blockdata/epoch/Epoch.fromSat (param $sat i32) (result i32)
  (local $idx i32)
  i32.const 0
  local.set $idx
  loop $while-continue|0
   local.get $sat
   call $~lib/metashrew-as/assembly/blockdata/sat/Sat#n
   global.get $~lib/metashrew-as/assembly/blockdata/epoch/Epoch.STARTING_SATS
   local.get $idx
   call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/sat/Sat>#__get
   call $~lib/metashrew-as/assembly/blockdata/sat/Sat#n
   i64.gt_u
   if (result i32)
    local.get $idx
    i32.const 33
    i32.lt_s
   else
    i32.const 0
   end
   if
    local.get $idx
    i32.const 1
    i32.add
    local.set $idx
    br $while-continue|0
   end
  end
  i32.const 0
  local.get $idx
  call $~lib/metashrew-as/assembly/blockdata/epoch/Epoch#constructor
  return
 )
 (func $~lib/metashrew-as/assembly/blockdata/sat/Sat#epoch (param $this i32) (result i32)
  local.get $this
  call $~lib/metashrew-as/assembly/blockdata/epoch/Epoch.fromSat
  return
 )
 (func $~lib/metashrew-as/assembly/blockdata/height/Height#set:_idx (param $this i32) (param $_idx i32)
  local.get $this
  local.get $_idx
  i32.store
 )
 (func $~lib/metashrew-as/assembly/blockdata/height/Height#constructor (param $this i32) (param $idx i32) (result i32)
  local.get $this
  i32.eqz
  if
   i32.const 4
   i32.const 52
   call $~lib/rt/stub/__new
   local.set $this
  end
  local.get $this
  i32.const 0
  call $~lib/metashrew-as/assembly/blockdata/height/Height#set:_idx
  local.get $this
  local.get $idx
  call $~lib/metashrew-as/assembly/blockdata/height/Height#set:_idx
  local.get $this
 )
 (func $~lib/metashrew-as/assembly/blockdata/epoch/Epoch#get:idx (param $this i32) (result i32)
  local.get $this
  i32.load
 )
 (func $~lib/metashrew-as/assembly/blockdata/epoch/Epoch#startingHeight (param $this i32) (result i32)
  i32.const 0
  local.get $this
  call $~lib/metashrew-as/assembly/blockdata/epoch/Epoch#get:idx
  global.get $~lib/metashrew-as/assembly/utils/constant/SUBSIDY_HALVING_INTERVAL
  i32.mul
  call $~lib/metashrew-as/assembly/blockdata/height/Height#constructor
  return
 )
 (func $~lib/metashrew-as/assembly/blockdata/epoch/Epoch#startingSat (param $this i32) (result i32)
  local.get $this
  call $~lib/metashrew-as/assembly/blockdata/epoch/Epoch#get:idx
  i32.const 33
  i32.gt_u
  if
   global.get $~lib/metashrew-as/assembly/blockdata/epoch/Epoch.STARTING_SATS
   i32.const 33
   call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/sat/Sat>#__get
   return
  end
  global.get $~lib/metashrew-as/assembly/blockdata/epoch/Epoch.STARTING_SATS
  local.get $this
  call $~lib/metashrew-as/assembly/blockdata/epoch/Epoch#get:idx
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/sat/Sat>#__get
  return
 )
 (func $~lib/metashrew-as/assembly/blockdata/sat/Sat#epochPosition (param $this i32) (result i64)
  local.get $this
  call $~lib/metashrew-as/assembly/blockdata/sat/Sat#get:_idx
  local.get $this
  call $~lib/metashrew-as/assembly/blockdata/sat/Sat#epoch
  call $~lib/metashrew-as/assembly/blockdata/epoch/Epoch#startingSat
  call $~lib/metashrew-as/assembly/blockdata/sat/Sat#n
  i64.sub
  return
 )
 (func $~lib/metashrew-as/assembly/blockdata/epoch/Epoch#subsidy (param $this i32) (result i64)
  local.get $this
  call $~lib/metashrew-as/assembly/blockdata/epoch/Epoch#get:idx
  i32.const 33
  i32.gt_u
  if
   i64.const 0
   return
  else
   i64.const 50
   global.get $~lib/metashrew-as/assembly/utils/constant/COIN_VALUE
   i64.extend_i32_u
   i64.mul
   local.get $this
   call $~lib/metashrew-as/assembly/blockdata/epoch/Epoch#get:idx
   i64.extend_i32_u
   i64.shr_u
   return
  end
  unreachable
 )
 (func $~lib/metashrew-as/assembly/blockdata/height/Height#get:_idx (param $this i32) (result i32)
  local.get $this
  i32.load
 )
 (func $~lib/metashrew-as/assembly/blockdata/height/Height#n (param $this i32) (result i32)
  local.get $this
  call $~lib/metashrew-as/assembly/blockdata/height/Height#get:_idx
  return
 )
 (func $~lib/metashrew-as/assembly/blockdata/height/Height#add (param $this i32) (param $x i32) (result i32)
  i32.const 0
  local.get $this
  call $~lib/metashrew-as/assembly/blockdata/height/Height#n
  local.get $x
  i32.add
  call $~lib/metashrew-as/assembly/blockdata/height/Height#constructor
  return
 )
 (func $~lib/metashrew-as/assembly/blockdata/sat/Sat#height (param $this i32) (result i32)
  local.get $this
  call $~lib/metashrew-as/assembly/blockdata/sat/Sat#epoch
  call $~lib/metashrew-as/assembly/blockdata/epoch/Epoch#startingHeight
  local.get $this
  call $~lib/metashrew-as/assembly/blockdata/sat/Sat#epochPosition
  local.get $this
  call $~lib/metashrew-as/assembly/blockdata/sat/Sat#epoch
  call $~lib/metashrew-as/assembly/blockdata/epoch/Epoch#subsidy
  i64.div_u
  i32.wrap_i64
  call $~lib/metashrew-as/assembly/blockdata/height/Height#add
  return
 )
 (func $~lib/metashrew-as/assembly/blockdata/sat/Sat#third (param $this i32) (result i64)
  local.get $this
  call $~lib/metashrew-as/assembly/blockdata/sat/Sat#epochPosition
  local.get $this
  call $~lib/metashrew-as/assembly/blockdata/sat/Sat#epoch
  call $~lib/metashrew-as/assembly/blockdata/epoch/Epoch#subsidy
  i64.rem_u
  return
 )
 (func $~lib/util/number/decimalCount64High (param $value i64) (result i32)
  local.get $value
  i64.const 1000000000000000
  i64.lt_u
  if
   local.get $value
   i64.const 1000000000000
   i64.lt_u
   if
    i32.const 10
    local.get $value
    i64.const 100000000000
    i64.ge_u
    i32.add
    local.get $value
    i64.const 10000000000
    i64.ge_u
    i32.add
    return
   else
    i32.const 13
    local.get $value
    i64.const 100000000000000
    i64.ge_u
    i32.add
    local.get $value
    i64.const 10000000000000
    i64.ge_u
    i32.add
    return
   end
   unreachable
  else
   local.get $value
   i64.const 100000000000000000
   i64.lt_u
   if
    i32.const 16
    local.get $value
    i64.const 10000000000000000
    i64.ge_u
    i32.add
    return
   else
    i32.const 18
    local.get $value
    i64.const -8446744073709551616
    i64.ge_u
    i32.add
    local.get $value
    i64.const 1000000000000000000
    i64.ge_u
    i32.add
    return
   end
   unreachable
  end
  unreachable
 )
 (func $~lib/util/number/utoa64_dec_lut (param $buffer i32) (param $num i64) (param $offset i32)
  (local $t i64)
  (local $r i32)
  (local $b i32)
  (local $c i32)
  (local $b1 i32)
  (local $b2 i32)
  (local $c1 i32)
  (local $c2 i32)
  (local $digits1 i64)
  (local $digits2 i64)
  loop $while-continue|0
   local.get $num
   i64.const 100000000
   i64.ge_u
   if
    local.get $num
    i64.const 100000000
    i64.div_u
    local.set $t
    local.get $num
    local.get $t
    i64.const 100000000
    i64.mul
    i64.sub
    i32.wrap_i64
    local.set $r
    local.get $t
    local.set $num
    local.get $r
    i32.const 10000
    i32.div_u
    local.set $b
    local.get $r
    i32.const 10000
    i32.rem_u
    local.set $c
    local.get $b
    i32.const 100
    i32.div_u
    local.set $b1
    local.get $b
    i32.const 100
    i32.rem_u
    local.set $b2
    local.get $c
    i32.const 100
    i32.div_u
    local.set $c1
    local.get $c
    i32.const 100
    i32.rem_u
    local.set $c2
    i32.const 4028
    local.get $c1
    i32.const 2
    i32.shl
    i32.add
    i64.load32_u
    local.set $digits1
    i32.const 4028
    local.get $c2
    i32.const 2
    i32.shl
    i32.add
    i64.load32_u
    local.set $digits2
    local.get $offset
    i32.const 4
    i32.sub
    local.set $offset
    local.get $buffer
    local.get $offset
    i32.const 1
    i32.shl
    i32.add
    local.get $digits1
    local.get $digits2
    i64.const 32
    i64.shl
    i64.or
    i64.store
    i32.const 4028
    local.get $b1
    i32.const 2
    i32.shl
    i32.add
    i64.load32_u
    local.set $digits1
    i32.const 4028
    local.get $b2
    i32.const 2
    i32.shl
    i32.add
    i64.load32_u
    local.set $digits2
    local.get $offset
    i32.const 4
    i32.sub
    local.set $offset
    local.get $buffer
    local.get $offset
    i32.const 1
    i32.shl
    i32.add
    local.get $digits1
    local.get $digits2
    i64.const 32
    i64.shl
    i64.or
    i64.store
    br $while-continue|0
   end
  end
  local.get $buffer
  local.get $num
  i32.wrap_i64
  local.get $offset
  call $~lib/util/number/utoa32_dec_lut
 )
 (func $~lib/util/number/utoa64 (param $value i64) (param $radix i32) (result i32)
  (local $out i32)
  (local $val32 i32)
  (local $decimals i32)
  (local $buffer i32)
  (local $num i32)
  (local $offset i32)
  (local $decimals|8 i32)
  (local $buffer|9 i32)
  (local $num|10 i64)
  (local $offset|11 i32)
  (local $decimals|12 i32)
  (local $buffer|13 i32)
  (local $num|14 i64)
  (local $offset|15 i32)
  (local $decimals|16 i32)
  local.get $radix
  i32.const 2
  i32.lt_s
  if (result i32)
   i32.const 1
  else
   local.get $radix
   i32.const 36
   i32.gt_s
  end
  if
   i32.const 3824
   i32.const 3952
   i32.const 401
   i32.const 5
   call $~lib/builtins/abort
   unreachable
  end
  local.get $value
  i64.const 0
  i64.ne
  i32.eqz
  if
   i32.const 4016
   return
  end
  local.get $radix
  i32.const 10
  i32.eq
  if
   local.get $value
   global.get $~lib/builtins/u32.MAX_VALUE
   i64.extend_i32_u
   i64.le_u
   if
    local.get $value
    i32.wrap_i64
    local.set $val32
    local.get $val32
    call $~lib/util/number/decimalCount32
    local.set $decimals
    local.get $decimals
    i32.const 1
    i32.shl
    i32.const 2
    call $~lib/rt/stub/__new
    local.set $out
    local.get $out
    local.set $buffer
    local.get $val32
    local.set $num
    local.get $decimals
    local.set $offset
    i32.const 0
    i32.const 1
    i32.ge_s
    drop
    local.get $buffer
    local.get $num
    local.get $offset
    call $~lib/util/number/utoa32_dec_lut
   else
    local.get $value
    call $~lib/util/number/decimalCount64High
    local.set $decimals|8
    local.get $decimals|8
    i32.const 1
    i32.shl
    i32.const 2
    call $~lib/rt/stub/__new
    local.set $out
    local.get $out
    local.set $buffer|9
    local.get $value
    local.set $num|10
    local.get $decimals|8
    local.set $offset|11
    i32.const 0
    i32.const 1
    i32.ge_s
    drop
    local.get $buffer|9
    local.get $num|10
    local.get $offset|11
    call $~lib/util/number/utoa64_dec_lut
   end
  else
   local.get $radix
   i32.const 16
   i32.eq
   if
    i32.const 63
    local.get $value
    i64.clz
    i32.wrap_i64
    i32.sub
    i32.const 2
    i32.shr_s
    i32.const 1
    i32.add
    local.set $decimals|12
    local.get $decimals|12
    i32.const 1
    i32.shl
    i32.const 2
    call $~lib/rt/stub/__new
    local.set $out
    local.get $out
    local.set $buffer|13
    local.get $value
    local.set $num|14
    local.get $decimals|12
    local.set $offset|15
    i32.const 0
    i32.const 1
    i32.ge_s
    drop
    local.get $buffer|13
    local.get $num|14
    local.get $offset|15
    call $~lib/util/number/utoa_hex_lut
   else
    local.get $value
    local.get $radix
    call $~lib/util/number/ulog_base
    local.set $decimals|16
    local.get $decimals|16
    i32.const 1
    i32.shl
    i32.const 2
    call $~lib/rt/stub/__new
    local.set $out
    local.get $out
    local.get $value
    local.get $decimals|16
    local.get $radix
    call $~lib/util/number/utoa64_any_core
   end
  end
  local.get $out
  return
 )
 (func $~lib/number/U64#toString (param $this i64) (param $radix i32) (result i32)
  local.get $this
  local.get $radix
  call $~lib/util/number/utoa64
  return
 )
 (func $~lib/metashrew-as/assembly/blockdata/epoch/Epoch#n (param $this i32) (result i32)
  local.get $this
  call $~lib/metashrew-as/assembly/blockdata/epoch/Epoch#get:idx
  return
 )
 (func $~lib/metashrew-as/assembly/blockdata/sat/Sat#cycle (param $this i32) (result i32)
  local.get $this
  call $~lib/metashrew-as/assembly/blockdata/sat/Sat#epoch
  call $~lib/metashrew-as/assembly/blockdata/epoch/Epoch#n
  global.get $~lib/metashrew-as/assembly/utils/constant/CYCLE_EPOCHS
  i32.div_u
  return
 )
 (func $~lib/metashrew-as/assembly/blockdata/sat/Sat#period (param $this i32) (result i32)
  local.get $this
  call $~lib/metashrew-as/assembly/blockdata/sat/Sat#height
  call $~lib/metashrew-as/assembly/blockdata/height/Height#n
  global.get $~lib/metashrew-as/assembly/utils/constant/DIFFCHANGE_INTERVAL
  i32.div_u
  return
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/utils/rlp/RLPItem>#__set (param $this i32) (param $index i32) (param $value i32)
  local.get $index
  local.get $this
  call $~lib/array/Array<~lib/metashrew-as/assembly/utils/rlp/RLPItem>#get:length_
  i32.ge_u
  if
   local.get $index
   i32.const 0
   i32.lt_s
   if
    i32.const 2112
    i32.const 2240
    i32.const 130
    i32.const 22
    call $~lib/builtins/abort
    unreachable
   end
   local.get $this
   local.get $index
   i32.const 1
   i32.add
   i32.const 2
   i32.const 1
   call $~lib/array/ensureCapacity
   local.get $this
   local.get $index
   i32.const 1
   i32.add
   call $~lib/array/Array<~lib/metashrew-as/assembly/utils/rlp/RLPItem>#set:length_
  end
  local.get $this
  call $~lib/array/Array<~lib/metashrew-as/assembly/utils/rlp/RLPItem>#get:dataStart
  local.get $index
  i32.const 2
  i32.shl
  i32.add
  local.get $value
  i32.store
  i32.const 1
  drop
  local.get $this
  local.get $value
  i32.const 1
  call $~lib/rt/stub/__link
 )
 (func $assembly/index/sat (result i32)
  (local $point i32)
  (local $1 i32)
  (local $2 i32)
  i32.const 0
  call $~lib/metashrew-as/assembly/indexer/index/input
  call $~lib/metashrew-as/assembly/utils/box/Box.from
  call $~lib/metashrew-as/assembly/utils/utils/parsePrimitive<u64>
  call $~lib/metashrew-as/assembly/blockdata/sat/Sat#constructor
  local.set $point
  i32.const 7
  i32.const 2
  i32.const 47
  i32.const 0
  call $~lib/rt/__newArray
  local.set $1
  local.get $1
  i32.load offset=4
  local.set $2
  local.get $1
  i32.const 0
  local.get $point
  call $~lib/metashrew-as/assembly/blockdata/sat/Sat#n
  i32.wrap_i64
  call $~lib/metashrew-as/assembly/utils/rlp/RLPItem.fromValue
  call $~lib/array/Array<~lib/metashrew-as/assembly/utils/rlp/RLPItem>#__set
  local.get $1
  i32.const 1
  local.get $point
  call $~lib/metashrew-as/assembly/blockdata/sat/Sat#height
  call $~lib/metashrew-as/assembly/blockdata/height/Height#n
  i32.const 10
  call $~lib/number/U32#toString
  i32.const 5920
  call $~lib/string/String.__concat
  local.get $point
  call $~lib/metashrew-as/assembly/blockdata/sat/Sat#third
  i32.const 10
  call $~lib/number/U64#toString
  call $~lib/string/String.__concat
  i32.const 0
  i32.const 1
  global.set $~argumentsLength
  i32.const 0
  call $~lib/string/String.UTF8.encode@varargs
  call $~lib/metashrew-as/assembly/utils/rlp/RLPItem.fromArrayBuffer
  call $~lib/array/Array<~lib/metashrew-as/assembly/utils/rlp/RLPItem>#__set
  local.get $1
  i32.const 2
  local.get $point
  call $~lib/metashrew-as/assembly/blockdata/sat/Sat#height
  call $~lib/metashrew-as/assembly/blockdata/height/Height#n
  call $~lib/metashrew-as/assembly/utils/rlp/RLPItem.fromValue
  call $~lib/array/Array<~lib/metashrew-as/assembly/utils/rlp/RLPItem>#__set
  local.get $1
  i32.const 3
  local.get $point
  call $~lib/metashrew-as/assembly/blockdata/sat/Sat#cycle
  call $~lib/metashrew-as/assembly/utils/rlp/RLPItem.fromValue
  call $~lib/array/Array<~lib/metashrew-as/assembly/utils/rlp/RLPItem>#__set
  local.get $1
  i32.const 4
  local.get $point
  call $~lib/metashrew-as/assembly/blockdata/sat/Sat#epoch
  call $~lib/metashrew-as/assembly/blockdata/epoch/Epoch#n
  call $~lib/metashrew-as/assembly/utils/rlp/RLPItem.fromValue
  call $~lib/array/Array<~lib/metashrew-as/assembly/utils/rlp/RLPItem>#__set
  local.get $1
  i32.const 5
  local.get $point
  call $~lib/metashrew-as/assembly/blockdata/sat/Sat#period
  call $~lib/metashrew-as/assembly/utils/rlp/RLPItem.fromValue
  call $~lib/array/Array<~lib/metashrew-as/assembly/utils/rlp/RLPItem>#__set
  local.get $1
  i32.const 6
  local.get $point
  call $~lib/metashrew-as/assembly/blockdata/sat/Sat#third
  i32.wrap_i64
  call $~lib/metashrew-as/assembly/utils/rlp/RLPItem.fromValue
  call $~lib/array/Array<~lib/metashrew-as/assembly/utils/rlp/RLPItem>#__set
  local.get $1
  call $~lib/metashrew-as/assembly/utils/rlp/RLPItem.fromList
  call $~lib/metashrew-as/assembly/utils/rlp/toRLP
  return
 )
 (func $assembly/index/inscription (result i32)
  (local $data i32)
  call $~lib/metashrew-as/assembly/indexer/index/input
  local.set $data
  local.get $data
  return
 )
 (func $assembly/index/content (result i32)
  (local $data i32)
  call $~lib/metashrew-as/assembly/indexer/index/input
  local.set $data
  local.get $data
  return
 )
 (func $assembly/index/inscriptionsfrom (result i32)
  (local $data i32)
  call $~lib/metashrew-as/assembly/indexer/index/input
  local.set $data
  local.get $data
  return
 )
 (func $assembly/index/inscriptionsforblock (result i32)
  (local $height i32)
  call $~lib/metashrew-as/assembly/indexer/index/input
  call $~lib/metashrew-as/assembly/utils/box/Box.from
  call $~lib/metashrew-as/assembly/utils/utils/parsePrimitive<u32>
  local.set $height
  i32.const 0
  i32.const 0
  call $~lib/arraybuffer/ArrayBuffer#constructor
  return
 )
 (func $assembly/index/output (result i32)
  (local $data i32)
  (local $outpoint i32)
  (local $vout i32)
  call $~lib/metashrew-as/assembly/indexer/index/input
  call $~lib/metashrew-as/assembly/utils/box/Box.from
  local.set $data
  local.get $data
  i32.const 32
  call $~lib/metashrew-as/assembly/utils/utils/parseBytes
  local.set $outpoint
  local.get $data
  call $~lib/metashrew-as/assembly/utils/utils/parsePrimitive<u32>
  local.set $vout
  i32.const 0
  i32.const 0
  call $~lib/arraybuffer/ArrayBuffer#constructor
  return
 )
 (func $~start
  call $start:assembly/index
 )
)
