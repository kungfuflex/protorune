(module
 (type $0 (func (param i32) (result i32)))
 (type $1 (func (param i32 i32)))
 (type $2 (func (param i32 i32) (result i32)))
 (type $3 (func (param i32 i32 i32) (result i32)))
 (type $4 (func))
 (type $5 (func (param i32 i32 i32 i32) (result i32)))
 (type $6 (func (param i32 i32 i32)))
 (type $7 (func (param i32) (result i64)))
 (type $8 (func (param i32)))
 (type $9 (func (result i32)))
 (type $10 (func (param i64 i32) (result i32)))
 (type $11 (func (param i32 i32 i32 i32)))
 (type $12 (func (param i32 i64)))
 (type $13 (func (param i32 i64) (result i32)))
 (type $14 (func (param i32 i64 i32)))
 (type $15 (func (param i64) (result i32)))
 (type $16 (func (param i32 i32 i32 i32 i32) (result i32)))
 (type $17 (func (param i32 i64 i32 i32)))
 (type $18 (func (param i32 i32 i64)))
 (type $19 (func (param i32 i32) (result i64)))
 (import "env" "abort" (func $~lib/builtins/abort (param i32 i32 i32 i32)))
 (import "env" "__host_len" (func $~lib/metashrew-as/assembly/indexer/index/__host_len (result i32)))
 (import "env" "__load_input" (func $~lib/metashrew-as/assembly/indexer/index/__load_input (param i32)))
 (import "env" "__log" (func $~lib/metashrew-as/assembly/utils/logging/__log (param i32)))
 (import "env" "__get_len" (func $~lib/metashrew-as/assembly/indexer/index/__get_len (param i32) (result i32)))
 (import "env" "__get" (func $~lib/metashrew-as/assembly/indexer/index/__get (param i32 i32)))
 (import "env" "__flush" (func $~lib/metashrew-as/assembly/indexer/index/__flush (param i32)))
 (global $~lib/metashrew-as/assembly/utils/hex/hexLookupTable i32 (i32.const 32))
 (global $~lib/shared/runtime/Runtime.Stub i32 (i32.const 0))
 (global $~lib/shared/runtime/Runtime.Minimal i32 (i32.const 1))
 (global $~lib/shared/runtime/Runtime.Incremental i32 (i32.const 2))
 (global $~lib/rt/stub/startOffset (mut i32) (i32.const 0))
 (global $~lib/rt/stub/offset (mut i32) (i32.const 0))
 (global $~argumentsLength (mut i32) (i32.const 0))
 (global $~lib/metashrew-as/assembly/indexer/tables/TRANSACTION_ID_TO_TRANSACTION (mut i32) (i32.const 0))
 (global $~lib/metashrew-as/assembly/indexer/tables/INSCRIPTION_ID_TO_INSCRIPTION (mut i32) (i32.const 0))
 (global $~lib/metashrew-as/assembly/indexer/tables/ACCOUNT_TO_INSCRIPTION (mut i32) (i32.const 0))
 (global $~lib/metashrew-as/assembly/indexer/tables/HEIGHT_TO_BLOCK_HEADER (mut i32) (i32.const 0))
 (global $~lib/metashrew-as/assembly/indexer/tables/SAT_TO_SATPOINT (mut i32) (i32.const 0))
 (global $~lib/metashrew-as/assembly/indexer/tables/OUTPOINT_TO_SAT_RANGES (mut i32) (i32.const 0))
 (global $~lib/native/ASC_RUNTIME i32 (i32.const 0))
 (global $~lib/metashrew-as/assembly/indexer/index/_updates (mut i32) (i32.const 0))
 (global $~lib/metashrew-as/assembly/indexer/index/_updateKeys (mut i32) (i32.const 0))
 (global $~lib/metashrew-as/assembly/indexer/index/BUFFER_SIZE i32 (i32.const 1048576))
 (global $~lib/metashrew-as/assembly/indexer/index/_filled (mut i32) (i32.const 0))
 (global $~lib/metashrew-as/assembly/utils/logging/console (mut i32) (i32.const 0))
 (global $~lib/metashrew-as/assembly/utils/sha256/DIGEST_LENGTH i32 (i32.const 32))
 (global $~lib/metashrew-as/assembly/utils/sha256/INPUT_LENGTH i32 (i32.const 512))
 (global $~lib/metashrew-as/assembly/utils/sha256/K i32 (i32.const 1568))
 (global $~lib/metashrew-as/assembly/utils/sha256/kPtr (mut i32) (i32.const 0))
 (global $~lib/metashrew-as/assembly/utils/sha256/W64 i32 (i32.const 1904))
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
 (global $~lib/metashrew-as/assembly/utils/yabsp/console (mut i32) (i32.const 0))
 (global $~lib/metashrew-as/assembly/utils/b32/ENCODING_CONST_BECH32 i32 (i32.const 1))
 (global $~lib/metashrew-as/assembly/utils/b32/ENCODING_CONST_BECH32M i32 (i32.const 734539939))
 (global $~lib/metashrew-as/assembly/utils/b32/ONE (mut i32) (i32.const 0))
 (global $~lib/metashrew-as/assembly/utils/b32/ALPHABET_MAP i32 (i32.const 2032))
 (global $~lib/metashrew-as/assembly/utils/b32/ALPHABET i32 (i32.const 2320))
 (global $~lib/metashrew-as/assembly/utils/b58/ALPHABET i32 (i32.const 2384))
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
 (global $assembly/index/HEIGHT_TO_BLOCK_HEADER (mut i32) (i32.const 0))
 (global $assembly/index/TRANSACTION_BY_ID (mut i32) (i32.const 0))
 (global $assembly/index/OUTPOINT_TO_VALUE (mut i32) (i32.const 0))
 (global $assembly/index/HEIGHT_TO_INSCRIPTION_ID (mut i32) (i32.const 0))
 (global $assembly/index/SAT_RANGE_BY_OUTPOINT (mut i32) (i32.const 0))
 (global $assembly/index/OUTPOINT_TO_ORDINALS_RANGE (mut i32) (i32.const 0))
 (global $~lib/native/ASC_SHRINK_LEVEL i32 (i32.const 0))
 (global $~lib/builtins/u32.MAX_VALUE i32 (i32.const -1))
 (global $~lib/memory/__heap_base i32 (i32.const 6108))
 (memory $0 1 32768)
 (data $0 (i32.const 12) "\1c\02\00\00\00\00\00\00\00\00\00\00\04\00\00\00\00\02\00\00000102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f202122232425262728292a2b2c2d2e2f303132333435363738393a3b3c3d3e3f404142434445464748494a4b4c4d4e4f505152535455565758595a5b5c5d5e5f606162636465666768696a6b6c6d6e6f707172737475767778797a7b7c7d7e7f808182838485868788898a8b8c8d8e8f909192939495969798999a9b9c9d9e9fa0a1a2a3a4a5a6a7a8a9aaabacadaeafb0b1b2b3b4b5b6b7b8b9babbbcbdbebfc0c1c2c3c4c5c6c7c8c9cacbcccdcecfd0d1d2d3d4d5d6d7d8d9dadbdcdddedfe0e1e2e3e4e5e6e7e8e9eaebecedeeeff0f1f2f3f4f5f6f7f8f9fafbfcfdfeff\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $1 (i32.const 556) ",\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\12\00\00\00/\00t\00x\00/\00b\00y\00i\00d\00/\00\00\00\00\00\00\00\00\00\00\00")
 (data $2 (i32.const 604) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00(\00\00\00A\00l\00l\00o\00c\00a\00t\00i\00o\00n\00 \00t\00o\00o\00 \00l\00a\00r\00g\00e\00\00\00\00\00")
 (data $3 (i32.const 668) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\1e\00\00\00~\00l\00i\00b\00/\00r\00t\00/\00s\00t\00u\00b\00.\00t\00s\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $4 (i32.const 732) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00$\00\00\00U\00n\00p\00a\00i\00r\00e\00d\00 \00s\00u\00r\00r\00o\00g\00a\00t\00e\00\00\00\00\00\00\00\00\00")
 (data $5 (i32.const 796) ",\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\1c\00\00\00~\00l\00i\00b\00/\00s\00t\00r\00i\00n\00g\00.\00t\00s\00")
 (data $6 (i32.const 844) ",\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\16\00\00\00/\00i\00n\00s\00c\00/\00b\00y\00i\00d\00/\00\00\00\00\00\00\00")
 (data $7 (i32.const 892) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\1e\00\00\00/\00o\00r\00d\00/\00b\00y\00a\00c\00c\00o\00u\00n\00t\00/\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $8 (i32.const 956) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00 \00\00\00/\00b\00l\00o\00c\00k\00/\00b\00y\00h\00e\00i\00g\00h\00t\00/\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $9 (i32.const 1020) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00 \00\00\00/\00s\00a\00t\00p\00o\00i\00n\00t\00/\00b\00y\00s\00a\00t\00/\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $10 (i32.const 1084) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00*\00\00\00/\00s\00a\00t\00r\00a\00n\00g\00e\00/\00b\00y\00o\00u\00t\00p\00o\00i\00n\00t\00/\00\00\00")
 (data $11 (i32.const 1148) ",\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\1c\00\00\00I\00n\00v\00a\00l\00i\00d\00 \00l\00e\00n\00g\00t\00h\00")
 (data $12 (i32.const 1196) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00&\00\00\00~\00l\00i\00b\00/\00a\00r\00r\00a\00y\00b\00u\00f\00f\00e\00r\00.\00t\00s\00\00\00\00\00\00\00")
 (data $13 (i32.const 1260) "\1c\01\00\00\00\00\00\00\00\00\00\00\01\00\00\00\00\01\00\00\98/\8aB\91D7q\cf\fb\c0\b5\a5\db\b5\e9[\c2V9\f1\11\f1Y\a4\82?\92\d5^\1c\ab\98\aa\07\d8\01[\83\12\be\851$\c3}\0cUt]\ber\fe\b1\de\80\a7\06\dc\9bt\f1\9b\c1\c1i\9b\e4\86G\be\ef\c6\9d\c1\0f\cc\a1\0c$o,\e9-\aa\84tJ\dc\a9\b0\\\da\88\f9vRQ>\98m\c61\a8\c8\'\03\b0\c7\7fY\bf\f3\0b\e0\c6G\91\a7\d5Qc\ca\06g))\14\85\n\b7\'8!\1b.\fcm,M\13\r8STs\ne\bb\njv.\c9\c2\81\85,r\92\a1\e8\bf\a2Kf\1a\a8p\8bK\c2\a3Ql\c7\19\e8\92\d1$\06\99\d6\855\0e\f4p\a0j\10\16\c1\a4\19\08l7\1eLwH\'\b5\bc\b04\b3\0c\1c9J\aa\d8NO\ca\9c[\f3o.h\ee\82\8ftoc\a5x\14x\c8\84\08\02\c7\8c\fa\ff\be\90\eblP\a4\f7\a3\f9\be\f2xq\c6\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $14 (i32.const 1548) ",\00\00\00\00\00\00\00\00\00\00\00\07\00\00\00\10\00\00\00\00\05\00\00\00\05\00\00\00\01\00\00@\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $15 (i32.const 1596) "\1c\01\00\00\00\00\00\00\00\00\00\00\01\00\00\00\00\01\00\00\98/\8a\c2\91D7q\cf\fb\c0\b5\a5\db\b5\e9[\c2V9\f1\11\f1Y\a4\82?\92\d5^\1c\ab\98\aa\07\d8\01[\83\12\be\851$\c3}\0cUt]\ber\fe\b1\de\80\a7\06\dc\9bt\f3\9b\c1\c1i\9bd\86G\fe\f0\c6\ed\e1\0fT\f2\0c$o4\e9O\be\84\c9l\1eA\b9a\fa\88\f9\16RQ\c6\f2mZ\8e\a8e\fc\19\b0\c7\9e\d9\b9\c31\12\9a\a0\ea\0e\e7+#\b1\fd\b0>5\c7\d5\bai0_m\97\cb\8f\11\0fZ\fd\ee\1e\dc\89\b65\n\04z\0b\de\9d\ca\f4X\16[]\e1\86>\7f\00\80\89\0872\ea\07\a57\95\abo\10a@\17\f1\d6\8c\rm;\aa\cd7\be\bb\c0\da;a\83c\a3H\db1\e9\02\0b\a7\\\d1o\ca\fa\1aR1\8431\95\1a\d4n\90xCm\f2\91\9c\c3\bd\ab\cc\9e\e6\a0\c9\b5<\b6/S\c6A\c7\d2\a3~#\07hK\95\a4v\1d\19L\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $16 (i32.const 1884) ",\00\00\00\00\00\00\00\00\00\00\00\07\00\00\00\10\00\00\00P\06\00\00P\06\00\00\00\01\00\00@\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $17 (i32.const 1932) ",\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\14\00\00\00u\00s\00e\00 \00s\00t\00r\00i\00c\00t\00\00\00\00\00\00\00\00\00")
 (data $18 (i32.const 1980) "\1c\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\02\00\00\001\00\00\00\00\00\00\00\00\00\00\00")
 (data $19 (i32.const 2012) "\1c\01\00\00\00\00\00\00\00\00\00\00\04\00\00\00\00\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\0f\00\n\11\15\14\1a\1e\07\05\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\1d\00\18\r\19\t\08\17\00\12\16\1f\1b\13\00\01\00\03\10\0b\1c\0c\0e\06\04\02\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $20 (i32.const 2300) "<\00\00\00\00\00\00\00\00\00\00\00\04\00\00\00 \00\00\00qpzry9x8gf2tvdw0s3jn54khce6mua7l\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $21 (i32.const 2364) "L\00\00\00\00\00\00\00\00\00\00\00\04\00\00\00:\00\00\00123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz\00\00")
 (data $22 (i32.const 2444) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00$\00\00\00I\00n\00d\00e\00x\00 \00o\00u\00t\00 \00o\00f\00 \00r\00a\00n\00g\00e\00\00\00\00\00\00\00\00\00")
 (data $23 (i32.const 2508) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00&\00\00\00~\00l\00i\00b\00/\00s\00t\00a\00t\00i\00c\00a\00r\00r\00a\00y\00.\00t\00s\00\00\00\00\00\00\00")
 (data $24 (i32.const 2572) ",\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\1a\00\00\00~\00l\00i\00b\00/\00a\00r\00r\00a\00y\00.\00t\00s\00\00\00")
 (data $25 (i32.const 2620) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\1e\00\00\00/\00b\00l\00o\00c\00k\00/\00b\00y\00h\00e\00i\00g\00h\00t\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $26 (i32.const 2684) ",\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\10\00\00\00/\00t\00x\00/\00b\00y\00i\00d\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $27 (i32.const 2732) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\"\00\00\00/\00o\00u\00t\00p\00o\00i\00n\00t\00/\00t\00o\00v\00a\00l\00u\00e\00\00\00\00\00\00\00\00\00\00\00")
 (data $28 (i32.const 2796) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00*\00\00\00/\00i\00n\00s\00c\00r\00i\00p\00t\00i\00o\00n\00/\00b\00y\00h\00e\00i\00g\00h\00t\00\00\00")
 (data $29 (i32.const 2860) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00(\00\00\00/\00s\00a\00t\00r\00a\00n\00g\00e\00/\00b\00y\00o\00u\00t\00p\00o\00i\00n\00t\00\00\00\00\00")
 (data $30 (i32.const 2924) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00(\00\00\00/\00o\00r\00d\00i\00n\00a\00l\00s\00/\00b\00y\00o\00u\00t\00p\00o\00i\00n\00t\00\00\00\00\00")
 (data $31 (i32.const 2988) "|\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00^\00\00\00E\00l\00e\00m\00e\00n\00t\00 \00t\00y\00p\00e\00 \00m\00u\00s\00t\00 \00b\00e\00 \00n\00u\00l\00l\00a\00b\00l\00e\00 \00i\00f\00 \00a\00r\00r\00a\00y\00 \00i\00s\00 \00h\00o\00l\00e\00y\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $32 (i32.const 3116) "\1c\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\0c\00\00\00B\00l\00o\00c\00k\00 \00")
 (data $33 (i32.const 3148) "\1c\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\0c\00\00\00 \00w\00i\00t\00h\00 \00")
 (data $34 (i32.const 3180) ",\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\1a\00\00\00 \00t\00r\00a\00n\00s\00a\00c\00t\00i\00o\00n\00s\00\00\00")
 (data $35 (i32.const 3228) ",\00\00\00\03\00\00\00\00\00\00\00\1a\00\00\00\14\00\00\00@\0c\00\00\00\00\00\00`\0c\00\00\00\00\00\00\80\0c\00\00\00\00\00\00\00\00\00\00")
 (data $36 (i32.const 3276) "|\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00d\00\00\00t\00o\00S\00t\00r\00i\00n\00g\00(\00)\00 \00r\00a\00d\00i\00x\00 \00a\00r\00g\00u\00m\00e\00n\00t\00 \00m\00u\00s\00t\00 \00b\00e\00 \00b\00e\00t\00w\00e\00e\00n\00 \002\00 \00a\00n\00d\00 \003\006\00\00\00\00\00\00\00\00\00")
 (data $37 (i32.const 3404) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00&\00\00\00~\00l\00i\00b\00/\00u\00t\00i\00l\00/\00n\00u\00m\00b\00e\00r\00.\00t\00s\00\00\00\00\00\00\00")
 (data $38 (i32.const 3468) "\1c\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\02\00\00\000\00\00\00\00\00\00\00\00\00\00\00")
 (data $39 (i32.const 3500) "0\000\000\001\000\002\000\003\000\004\000\005\000\006\000\007\000\008\000\009\001\000\001\001\001\002\001\003\001\004\001\005\001\006\001\007\001\008\001\009\002\000\002\001\002\002\002\003\002\004\002\005\002\006\002\007\002\008\002\009\003\000\003\001\003\002\003\003\003\004\003\005\003\006\003\007\003\008\003\009\004\000\004\001\004\002\004\003\004\004\004\005\004\006\004\007\004\008\004\009\005\000\005\001\005\002\005\003\005\004\005\005\005\006\005\007\005\008\005\009\006\000\006\001\006\002\006\003\006\004\006\005\006\006\006\007\006\008\006\009\007\000\007\001\007\002\007\003\007\004\007\005\007\006\007\007\007\008\007\009\008\000\008\001\008\002\008\003\008\004\008\005\008\006\008\007\008\008\008\009\009\000\009\001\009\002\009\003\009\004\009\005\009\006\009\007\009\008\009\009\00")
 (data $40 (i32.const 3900) "\1c\04\00\00\00\00\00\00\00\00\00\00\02\00\00\00\00\04\00\000\000\000\001\000\002\000\003\000\004\000\005\000\006\000\007\000\008\000\009\000\00a\000\00b\000\00c\000\00d\000\00e\000\00f\001\000\001\001\001\002\001\003\001\004\001\005\001\006\001\007\001\008\001\009\001\00a\001\00b\001\00c\001\00d\001\00e\001\00f\002\000\002\001\002\002\002\003\002\004\002\005\002\006\002\007\002\008\002\009\002\00a\002\00b\002\00c\002\00d\002\00e\002\00f\003\000\003\001\003\002\003\003\003\004\003\005\003\006\003\007\003\008\003\009\003\00a\003\00b\003\00c\003\00d\003\00e\003\00f\004\000\004\001\004\002\004\003\004\004\004\005\004\006\004\007\004\008\004\009\004\00a\004\00b\004\00c\004\00d\004\00e\004\00f\005\000\005\001\005\002\005\003\005\004\005\005\005\006\005\007\005\008\005\009\005\00a\005\00b\005\00c\005\00d\005\00e\005\00f\006\000\006\001\006\002\006\003\006\004\006\005\006\006\006\007\006\008\006\009\006\00a\006\00b\006\00c\006\00d\006\00e\006\00f\007\000\007\001\007\002\007\003\007\004\007\005\007\006\007\007\007\008\007\009\007\00a\007\00b\007\00c\007\00d\007\00e\007\00f\008\000\008\001\008\002\008\003\008\004\008\005\008\006\008\007\008\008\008\009\008\00a\008\00b\008\00c\008\00d\008\00e\008\00f\009\000\009\001\009\002\009\003\009\004\009\005\009\006\009\007\009\008\009\009\009\00a\009\00b\009\00c\009\00d\009\00e\009\00f\00a\000\00a\001\00a\002\00a\003\00a\004\00a\005\00a\006\00a\007\00a\008\00a\009\00a\00a\00a\00b\00a\00c\00a\00d\00a\00e\00a\00f\00b\000\00b\001\00b\002\00b\003\00b\004\00b\005\00b\006\00b\007\00b\008\00b\009\00b\00a\00b\00b\00b\00c\00b\00d\00b\00e\00b\00f\00c\000\00c\001\00c\002\00c\003\00c\004\00c\005\00c\006\00c\007\00c\008\00c\009\00c\00a\00c\00b\00c\00c\00c\00d\00c\00e\00c\00f\00d\000\00d\001\00d\002\00d\003\00d\004\00d\005\00d\006\00d\007\00d\008\00d\009\00d\00a\00d\00b\00d\00c\00d\00d\00d\00e\00d\00f\00e\000\00e\001\00e\002\00e\003\00e\004\00e\005\00e\006\00e\007\00e\008\00e\009\00e\00a\00e\00b\00e\00c\00e\00d\00e\00e\00e\00f\00f\000\00f\001\00f\002\00f\003\00f\004\00f\005\00f\006\00f\007\00f\008\00f\009\00f\00a\00f\00b\00f\00c\00f\00d\00f\00e\00f\00f\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $41 (i32.const 4956) "\\\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00H\00\00\000\001\002\003\004\005\006\007\008\009\00a\00b\00c\00d\00e\00f\00g\00h\00i\00j\00k\00l\00m\00n\00o\00p\00q\00r\00s\00t\00u\00v\00w\00x\00y\00z\00\00\00\00\00")
 (data $42 (i32.const 5052) "\1c\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $43 (i32.const 5084) "\1c\00\00\00\00\00\00\00\00\00\00\00!\00\00\00\08\00\00\00\01\00\00\00\00\00\00\00\00\00\00\00")
 (data $44 (i32.const 5116) "\1c\00\00\00\00\00\00\00\00\00\00\00\"\00\00\00\08\00\00\00\02\00\00\00\00\00\00\00\00\00\00\00")
 (data $45 (i32.const 5148) "\1c\00\00\00\00\00\00\00\00\00\00\00#\00\00\00\08\00\00\00\03\00\00\00\00\00\00\00\00\00\00\00")
 (data $46 (i32.const 5180) ",\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\16\00\00\00\t\00T\00x\00O\00f\00f\00s\00e\00t\00:\00 \00\00\00\00\00\00\00")
 (data $47 (i32.const 5228) ",\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\10\00\00\00 \00I\00n\00p\00u\00t\00:\00 \00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $48 (i32.const 5276) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00(\00\00\00 \00P\00r\00e\00v\00i\00o\00u\00s\00 \00O\00u\00t\00p\00o\00i\00n\00t\00:\00 \00\00\00\00\00")
 (data $49 (i32.const 5340) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00$\00\00\00K\00e\00y\00 \00d\00o\00e\00s\00 \00n\00o\00t\00 \00e\00x\00i\00s\00t\00\00\00\00\00\00\00\00\00")
 (data $50 (i32.const 5404) ",\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\16\00\00\00~\00l\00i\00b\00/\00m\00a\00p\00.\00t\00s\00\00\00\00\00\00\00")
 (data $51 (i32.const 5452) "\1c\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\08\00\00\00B\00P\00 \001\00\00\00\00\00")
 (data $52 (i32.const 5484) "\1c\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $53 (i32.const 5516) "\1c\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\08\00\00\00B\00P\00 \002\00\00\00\00\00")
 (data $54 (i32.const 5548) "l\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00X\00\00\00F\00o\00u\00n\00d\00 \00t\00r\00a\00n\00s\00a\00c\00t\00i\00o\00n\00 \00w\00i\00t\00h\00 \00o\00u\00t\00p\00u\00t\00s\00 \00b\00u\00t\00 \00n\00o\00 \00i\00n\00p\00u\00t\00s\00\00\00\00\00")
 (data $55 (i32.const 5660) "l\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00R\00\00\00F\00o\00u\00n\00d\00 \00t\00r\00a\00n\00s\00a\00c\00t\00i\00o\00n\00 \00w\00i\00t\00h\00 \00o\00u\00t\00p\00u\00t\00s\00 \00a\00n\00d\00 \00i\00n\00p\00u\00t\00s\00\00\00\00\00\00\00\00\00\00\00")
 (data $56 (i32.const 5772) ",\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\1c\00\00\00A\00r\00r\00a\00y\00 \00i\00s\00 \00e\00m\00p\00t\00y\00")
 (data $57 (i32.const 5820) ",\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\0e\00\00\00c\00o\00u\00n\00t\00:\00 \00\00\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $58 (i32.const 5868) "\1c\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $59 (i32.const 5900) "L\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00.\00\00\00\t\00C\00o\00i\00n\00b\00a\00s\00e\00 \00T\00r\00a\00n\00s\00a\00c\00t\00i\00o\00n\00:\00 \00\00\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $60 (i32.const 5980) "\1c\00\00\00\00\00\00\00\00\00\00\00&\00\00\00\08\00\00\00\04\00\00\00\00\00\00\00\00\00\00\00")
 (data $61 (i32.const 6012) "\1c\00\00\00\00\00\00\00\00\00\00\00\'\00\00\00\08\00\00\00\05\00\00\00\00\00\00\00\00\00\00\00")
 (data $62 (i32.const 6044) "\1c\00\00\00\00\00\00\00\00\00\00\00(\00\00\00\08\00\00\00\06\00\00\00\00\00\00\00\00\00\00\00")
 (data $63 (i32.const 6076) "\1c\00\00\00\00\00\00\00\00\00\00\00)\00\00\00\08\00\00\00\07\00\00\00\00\00\00\00\00\00\00\00")
 (table $0 8 8 funcref)
 (elem $0 (i32.const 1) $~lib/metashrew-as/assembly/utils/utils/concat~anonymous|0 $~lib/metashrew-as/assembly/utils/box/Box.concat~anonymous|0 $~lib/metashrew-as/assembly/utils/box/Box.concat~anonymous|1 $~lib/metashrew-as/assembly/indexer/index/_flush~anonymous|0 $~lib/metashrew-as/assembly/utils/rlp/toRLP~anonymous|0 $~lib/metashrew-as/assembly/utils/rlp/toRLP~anonymous|1 $~lib/metashrew-as/assembly/utils/rlp/toRLP~anonymous|2)
 (export "_start" (func $assembly/index/_start))
 (export "memory" (memory $0))
 (start $~start)
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
   i32.const 624
   i32.const 688
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
   i32.const 624
   i32.const 688
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
         i32.const 752
         i32.const 816
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
 (func $start:~lib/metashrew-as/assembly/indexer/tables
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
  i32.const 576
  i32.const 0
  i32.const 1
  global.set $~argumentsLength
  i32.const 0
  call $~lib/string/String.UTF8.encode@varargs
  global.set $~lib/metashrew-as/assembly/indexer/tables/TRANSACTION_ID_TO_TRANSACTION
  i32.const 864
  i32.const 0
  i32.const 1
  global.set $~argumentsLength
  i32.const 0
  call $~lib/string/String.UTF8.encode@varargs
  global.set $~lib/metashrew-as/assembly/indexer/tables/INSCRIPTION_ID_TO_INSCRIPTION
  i32.const 912
  i32.const 0
  i32.const 1
  global.set $~argumentsLength
  i32.const 0
  call $~lib/string/String.UTF8.encode@varargs
  global.set $~lib/metashrew-as/assembly/indexer/tables/ACCOUNT_TO_INSCRIPTION
  i32.const 976
  i32.const 0
  i32.const 1
  global.set $~argumentsLength
  i32.const 0
  call $~lib/string/String.UTF8.encode@varargs
  global.set $~lib/metashrew-as/assembly/indexer/tables/HEIGHT_TO_BLOCK_HEADER
  i32.const 1040
  i32.const 0
  i32.const 1
  global.set $~argumentsLength
  i32.const 0
  call $~lib/string/String.UTF8.encode@varargs
  global.set $~lib/metashrew-as/assembly/indexer/tables/SAT_TO_SATPOINT
  i32.const 1104
  i32.const 0
  i32.const 1
  global.set $~argumentsLength
  i32.const 0
  call $~lib/string/String.UTF8.encode@varargs
  global.set $~lib/metashrew-as/assembly/indexer/tables/OUTPOINT_TO_SAT_RANGES
 )
 (func $~lib/arraybuffer/ArrayBuffer#constructor (param $this i32) (param $length i32) (result i32)
  (local $buffer i32)
  local.get $length
  i32.const 1073741820
  i32.gt_u
  if
   i32.const 1168
   i32.const 1216
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
 (func $~lib/rt/stub/__link (param $parentPtr i32) (param $childPtr i32) (param $expectMultiple i32)
 )
 (func $"~lib/map/Map<u32,~lib/arraybuffer/ArrayBuffer>#set:buckets" (param $this i32) (param $buckets i32)
  local.get $this
  local.get $buckets
  i32.store
  local.get $this
  local.get $buckets
  i32.const 0
  call $~lib/rt/stub/__link
 )
 (func $"~lib/map/Map<u32,~lib/arraybuffer/ArrayBuffer>#set:bucketsMask" (param $this i32) (param $bucketsMask i32)
  local.get $this
  local.get $bucketsMask
  i32.store offset=4
 )
 (func $"~lib/map/Map<u32,~lib/arraybuffer/ArrayBuffer>#set:entries" (param $this i32) (param $entries i32)
  local.get $this
  local.get $entries
  i32.store offset=8
  local.get $this
  local.get $entries
  i32.const 0
  call $~lib/rt/stub/__link
 )
 (func $"~lib/map/Map<u32,~lib/arraybuffer/ArrayBuffer>#set:entriesCapacity" (param $this i32) (param $entriesCapacity i32)
  local.get $this
  local.get $entriesCapacity
  i32.store offset=12
 )
 (func $"~lib/map/Map<u32,~lib/arraybuffer/ArrayBuffer>#set:entriesOffset" (param $this i32) (param $entriesOffset i32)
  local.get $this
  local.get $entriesOffset
  i32.store offset=16
 )
 (func $"~lib/map/Map<u32,~lib/arraybuffer/ArrayBuffer>#set:entriesCount" (param $this i32) (param $entriesCount i32)
  local.get $this
  local.get $entriesCount
  i32.store offset=20
 )
 (func $"~lib/map/Map<u32,~lib/arraybuffer/ArrayBuffer>#constructor" (param $this i32) (result i32)
  local.get $this
  i32.eqz
  if
   i32.const 24
   i32.const 5
   call $~lib/rt/stub/__new
   local.set $this
  end
  local.get $this
  i32.const 0
  i32.const 4
  i32.const 4
  i32.mul
  call $~lib/arraybuffer/ArrayBuffer#constructor
  call $"~lib/map/Map<u32,~lib/arraybuffer/ArrayBuffer>#set:buckets"
  local.get $this
  i32.const 4
  i32.const 1
  i32.sub
  call $"~lib/map/Map<u32,~lib/arraybuffer/ArrayBuffer>#set:bucketsMask"
  local.get $this
  i32.const 0
  i32.const 4
  block $"~lib/map/ENTRY_SIZE<u32,~lib/arraybuffer/ArrayBuffer>|inlined.0" (result i32)
   i32.const 12
   br $"~lib/map/ENTRY_SIZE<u32,~lib/arraybuffer/ArrayBuffer>|inlined.0"
  end
  i32.mul
  call $~lib/arraybuffer/ArrayBuffer#constructor
  call $"~lib/map/Map<u32,~lib/arraybuffer/ArrayBuffer>#set:entries"
  local.get $this
  i32.const 4
  call $"~lib/map/Map<u32,~lib/arraybuffer/ArrayBuffer>#set:entriesCapacity"
  local.get $this
  i32.const 0
  call $"~lib/map/Map<u32,~lib/arraybuffer/ArrayBuffer>#set:entriesOffset"
  local.get $this
  i32.const 0
  call $"~lib/map/Map<u32,~lib/arraybuffer/ArrayBuffer>#set:entriesCount"
  local.get $this
 )
 (func $start:~lib/metashrew-as/assembly/indexer/index
  call $start:~lib/metashrew-as/assembly/indexer/tables
  i32.const 0
  call $"~lib/map/Map<u32,~lib/arraybuffer/ArrayBuffer>#constructor"
  global.set $~lib/metashrew-as/assembly/indexer/index/_updates
  i32.const 0
  call $"~lib/map/Map<u32,~lib/arraybuffer/ArrayBuffer>#constructor"
  global.set $~lib/metashrew-as/assembly/indexer/index/_updateKeys
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
   i32.const 6
   call $~lib/rt/stub/__new
   local.set $this
  end
  local.get $this
  call $~lib/object/Object#constructor
  local.set $this
  local.get $this
 )
 (func $start:~lib/metashrew-as/assembly/utils/logging
  i32.const 0
  call $~lib/metashrew-as/assembly/utils/logging/Console#constructor
  global.set $~lib/metashrew-as/assembly/utils/logging/console
 )
 (func $~lib/array/Array<u32>#get:dataStart (param $this i32) (result i32)
  local.get $this
  i32.load offset=4
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
 (func $start:~lib/metashrew-as/assembly/utils/b32
  (local $0 i32)
  (local $1 i32)
  i32.const 1952
  drop
  i32.const 2000
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
   i32.const 2464
   i32.const 2528
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
  i32.const 1952
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
  call $start:~lib/metashrew-as/assembly/utils/logging
  call $start:~lib/metashrew-as/assembly/utils/sha256
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
   i32.const 688
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
     i32.const 624
     i32.const 688
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
   i32.const 624
   i32.const 688
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
    i32.const 1168
    i32.const 2592
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
    i32.const 2464
    i32.const 2592
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
 (func $start:assembly/index
  call $start:~lib/metashrew-as/assembly/indexer/index
  call $start:~lib/metashrew-as/assembly/blockdata/block
  call $start:~lib/metashrew-as/assembly/blockdata/height
  i32.const 2640
  i32.const 0
  i32.const 1
  global.set $~argumentsLength
  i32.const 0
  call $~lib/string/String.UTF8.encode@varargs
  global.set $assembly/index/HEIGHT_TO_BLOCK_HEADER
  i32.const 2704
  i32.const 0
  i32.const 1
  global.set $~argumentsLength
  i32.const 0
  call $~lib/string/String.UTF8.encode@varargs
  global.set $assembly/index/TRANSACTION_BY_ID
  i32.const 2752
  i32.const 0
  i32.const 1
  global.set $~argumentsLength
  i32.const 0
  call $~lib/string/String.UTF8.encode@varargs
  global.set $assembly/index/OUTPOINT_TO_VALUE
  i32.const 2816
  i32.const 0
  i32.const 1
  global.set $~argumentsLength
  i32.const 0
  call $~lib/string/String.UTF8.encode@varargs
  global.set $assembly/index/HEIGHT_TO_INSCRIPTION_ID
  i32.const 2880
  i32.const 0
  i32.const 1
  global.set $~argumentsLength
  i32.const 0
  call $~lib/string/String.UTF8.encode@varargs
  global.set $assembly/index/SAT_RANGE_BY_OUTPOINT
  i32.const 2944
  i32.const 0
  i32.const 1
  global.set $~argumentsLength
  i32.const 0
  call $~lib/string/String.UTF8.encode@varargs
  global.set $assembly/index/OUTPOINT_TO_ORDINALS_RANGE
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
   i32.const 13
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
   i32.const 15
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
   i32.const 24
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
   i32.const 1168
   i32.const 2592
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
   i32.const 21
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
   i32.const 1168
   i32.const 2592
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
   i32.const 23
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
   i32.const 1168
   i32.const 2592
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
   i32.const 17
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
    i32.const 2464
    i32.const 2592
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
   i32.const 22
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
   i32.const 20
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
   i32.const 1168
   i32.const 2592
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
   i32.const 19
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
    i32.const 2464
    i32.const 2592
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
   i32.const 18
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
   i32.const 2464
   i32.const 2592
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
   i32.const 3008
   i32.const 2592
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
   i32.const 16
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
    i32.const 2464
    i32.const 2592
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
   i32.const 14
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
    i32.const 3500
    local.get $d1
    i32.const 2
    i32.shl
    i32.add
    i64.load32_u
    local.set $digits1
    i32.const 3500
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
   i32.const 3500
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
   i32.const 3500
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
    i32.const 3920
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
   i32.const 3920
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
    i32.const 4976
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
    i32.const 4976
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
   i32.const 3296
   i32.const 3424
   i32.const 350
   i32.const 5
   call $~lib/builtins/abort
   unreachable
  end
  local.get $value
  i32.eqz
  if
   i32.const 3488
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
 (func $~lib/metashrew-as/assembly/blockdata/block/Block#get:transactions (param $this i32) (result i32)
  local.get $this
  i32.load offset=8
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Transaction>#get:length (param $this i32) (result i32)
  local.get $this
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Transaction>#get:length_
  return
 )
 (func $~lib/util/number/itoa32 (param $value i32) (param $radix i32) (result i32)
  (local $sign i32)
  (local $out i32)
  (local $decimals i32)
  (local $buffer i32)
  (local $num i32)
  (local $offset i32)
  (local $decimals|8 i32)
  (local $buffer|9 i32)
  (local $num|10 i32)
  (local $offset|11 i32)
  (local $val32 i32)
  (local $decimals|13 i32)
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
   i32.const 3296
   i32.const 3424
   i32.const 373
   i32.const 5
   call $~lib/builtins/abort
   unreachable
  end
  local.get $value
  i32.eqz
  if
   i32.const 3488
   return
  end
  local.get $value
  i32.const 31
  i32.shr_u
  i32.const 1
  i32.shl
  local.set $sign
  local.get $sign
  if
   i32.const 0
   local.get $value
   i32.sub
   local.set $value
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
   local.get $sign
   i32.add
   i32.const 2
   call $~lib/rt/stub/__new
   local.set $out
   local.get $out
   local.get $sign
   i32.add
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
    local.set $decimals|8
    local.get $decimals|8
    i32.const 1
    i32.shl
    local.get $sign
    i32.add
    i32.const 2
    call $~lib/rt/stub/__new
    local.set $out
    local.get $out
    local.get $sign
    i32.add
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
    i64.extend_i32_u
    local.get $offset|11
    call $~lib/util/number/utoa_hex_lut
   else
    local.get $value
    local.set $val32
    local.get $val32
    i64.extend_i32_u
    local.get $radix
    call $~lib/util/number/ulog_base
    local.set $decimals|13
    local.get $decimals|13
    i32.const 1
    i32.shl
    local.get $sign
    i32.add
    i32.const 2
    call $~lib/rt/stub/__new
    local.set $out
    local.get $out
    local.get $sign
    i32.add
    local.get $val32
    i64.extend_i32_u
    local.get $decimals|13
    local.get $radix
    call $~lib/util/number/utoa64_any_core
   end
  end
  local.get $sign
  if
   local.get $out
   i32.const 45
   i32.store16
  end
  local.get $out
  return
 )
 (func $~lib/number/I32#toString (param $this i32) (param $radix i32) (result i32)
  local.get $this
  local.get $radix
  call $~lib/util/number/itoa32
  return
 )
 (func $~lib/staticarray/StaticArray<~lib/string/String>#__uset (param $this i32) (param $index i32) (param $value i32)
  local.get $this
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
 (func $~lib/staticarray/StaticArray<~lib/string/String>#get:length (param $this i32) (result i32)
  local.get $this
  i32.const 20
  i32.sub
  call $~lib/rt/common/OBJECT#get:rtSize
  i32.const 2
  i32.shr_u
  return
 )
 (func $~lib/util/string/joinStringArray (param $dataStart i32) (param $length i32) (param $separator i32) (result i32)
  (local $lastIndex i32)
  (local $4 i32)
  (local $estLen i32)
  (local $value i32)
  (local $i i32)
  (local $offset i32)
  (local $sepLen i32)
  (local $result i32)
  (local $i|11 i32)
  (local $valueLen i32)
  local.get $length
  i32.const 1
  i32.sub
  local.set $lastIndex
  local.get $lastIndex
  i32.const 0
  i32.lt_s
  if
   i32.const 5072
   return
  end
  local.get $lastIndex
  i32.eqz
  if
   local.get $dataStart
   i32.load
   local.tee $4
   if (result i32)
    local.get $4
   else
    i32.const 5072
   end
   return
  end
  i32.const 0
  local.set $estLen
  i32.const 0
  local.set $i
  loop $for-loop|0
   local.get $i
   local.get $length
   i32.lt_s
   if
    local.get $dataStart
    local.get $i
    i32.const 2
    i32.shl
    i32.add
    i32.load
    local.set $value
    local.get $value
    i32.const 0
    i32.ne
    if
     local.get $estLen
     local.get $value
     call $~lib/string/String#get:length
     i32.add
     local.set $estLen
    end
    local.get $i
    i32.const 1
    i32.add
    local.set $i
    br $for-loop|0
   end
  end
  i32.const 0
  local.set $offset
  local.get $separator
  call $~lib/string/String#get:length
  local.set $sepLen
  local.get $estLen
  local.get $sepLen
  local.get $lastIndex
  i32.mul
  i32.add
  i32.const 1
  i32.shl
  i32.const 2
  call $~lib/rt/stub/__new
  local.set $result
  i32.const 0
  local.set $i|11
  loop $for-loop|1
   local.get $i|11
   local.get $lastIndex
   i32.lt_s
   if
    local.get $dataStart
    local.get $i|11
    i32.const 2
    i32.shl
    i32.add
    i32.load
    local.set $value
    local.get $value
    i32.const 0
    i32.ne
    if
     local.get $value
     call $~lib/string/String#get:length
     local.set $valueLen
     local.get $result
     local.get $offset
     i32.const 1
     i32.shl
     i32.add
     local.get $value
     local.get $valueLen
     i32.const 1
     i32.shl
     memory.copy
     local.get $offset
     local.get $valueLen
     i32.add
     local.set $offset
    end
    local.get $sepLen
    if
     local.get $result
     local.get $offset
     i32.const 1
     i32.shl
     i32.add
     local.get $separator
     local.get $sepLen
     i32.const 1
     i32.shl
     memory.copy
     local.get $offset
     local.get $sepLen
     i32.add
     local.set $offset
    end
    local.get $i|11
    i32.const 1
    i32.add
    local.set $i|11
    br $for-loop|1
   end
  end
  local.get $dataStart
  local.get $lastIndex
  i32.const 2
  i32.shl
  i32.add
  i32.load
  local.set $value
  local.get $value
  i32.const 0
  i32.ne
  if
   local.get $result
   local.get $offset
   i32.const 1
   i32.shl
   i32.add
   local.get $value
   local.get $value
   call $~lib/string/String#get:length
   i32.const 1
   i32.shl
   memory.copy
  end
  local.get $result
  return
 )
 (func $~lib/staticarray/StaticArray<~lib/string/String>#join (param $this i32) (param $separator i32) (result i32)
  i32.const 0
  drop
  i32.const 0
  drop
  i32.const 0
  drop
  i32.const 0
  i32.const 1
  i32.lt_s
  drop
  i32.const 1
  drop
  local.get $this
  local.get $this
  call $~lib/staticarray/StaticArray<~lib/string/String>#get:length
  local.get $separator
  call $~lib/util/string/joinStringArray
  return
 )
 (func $~lib/metashrew-as/assembly/utils/logging/Console#log (param $this i32) (param $v i32)
  local.get $v
  i32.const 1
  i32.const 2
  global.set $~argumentsLength
  i32.const 0
  call $~lib/string/String.UTF8.encode@varargs
  call $~lib/metashrew-as/assembly/utils/logging/__log
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
   i32.const 27
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
 (func $~lib/array/Array<~lib/array/Array<u64>>#set:buffer (param $this i32) (param $buffer i32)
  local.get $this
  local.get $buffer
  i32.store
  local.get $this
  local.get $buffer
  i32.const 0
  call $~lib/rt/stub/__link
 )
 (func $~lib/array/Array<~lib/array/Array<u64>>#set:dataStart (param $this i32) (param $dataStart i32)
  local.get $this
  local.get $dataStart
  i32.store offset=4
 )
 (func $~lib/array/Array<~lib/array/Array<u64>>#set:byteLength (param $this i32) (param $byteLength i32)
  local.get $this
  local.get $byteLength
  i32.store offset=8
 )
 (func $~lib/array/Array<~lib/array/Array<u64>>#set:length_ (param $this i32) (param $length_ i32)
  local.get $this
  local.get $length_
  i32.store offset=12
 )
 (func $~lib/array/Array<~lib/array/Array<u64>>#constructor (param $this i32) (param $length i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $bufferSize i32)
  (local $buffer i32)
  local.get $this
  i32.eqz
  if
   i32.const 16
   i32.const 29
   call $~lib/rt/stub/__new
   local.set $this
  end
  local.get $this
  i32.const 0
  call $~lib/array/Array<~lib/array/Array<u64>>#set:buffer
  local.get $this
  i32.const 0
  call $~lib/array/Array<~lib/array/Array<u64>>#set:dataStart
  local.get $this
  i32.const 0
  call $~lib/array/Array<~lib/array/Array<u64>>#set:byteLength
  local.get $this
  i32.const 0
  call $~lib/array/Array<~lib/array/Array<u64>>#set:length_
  local.get $length
  i32.const 1073741820
  i32.const 2
  i32.shr_u
  i32.gt_u
  if
   i32.const 1168
   i32.const 2592
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
  call $~lib/array/Array<~lib/array/Array<u64>>#set:buffer
  local.get $this
  local.get $buffer
  call $~lib/array/Array<~lib/array/Array<u64>>#set:dataStart
  local.get $this
  local.get $bufferSize
  call $~lib/array/Array<~lib/array/Array<u64>>#set:byteLength
  local.get $this
  local.get $length
  call $~lib/array/Array<~lib/array/Array<u64>>#set:length_
  local.get $this
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
 (func $~lib/metashrew-as/assembly/blockdata/epoch/Epoch.fromHeight (param $i i32) (result i32)
  i32.const 0
  local.get $i
  call $~lib/metashrew-as/assembly/blockdata/height/Height#n
  global.get $~lib/metashrew-as/assembly/utils/constant/SUBSIDY_HALVING_INTERVAL
  i32.div_u
  call $~lib/metashrew-as/assembly/blockdata/epoch/Epoch#constructor
  return
 )
 (func $~lib/metashrew-as/assembly/blockdata/epoch/Epoch#get:idx (param $this i32) (result i32)
  local.get $this
  i32.load
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
 (func $~lib/metashrew-as/assembly/blockdata/height/Height#subsidy (param $this i32) (result i64)
  local.get $this
  call $~lib/metashrew-as/assembly/blockdata/epoch/Epoch.fromHeight
  call $~lib/metashrew-as/assembly/blockdata/epoch/Epoch#subsidy
  return
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/sat/Sat>#__get (param $this i32) (param $index i32) (result i32)
  (local $value i32)
  local.get $index
  local.get $this
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/sat/Sat>#get:length_
  i32.ge_u
  if
   i32.const 2464
   i32.const 2592
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
   i32.const 3008
   i32.const 2592
   i32.const 118
   i32.const 40
   call $~lib/builtins/abort
   unreachable
  end
  local.get $value
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
 (func $~lib/metashrew-as/assembly/blockdata/epoch/Epoch#startingHeight (param $this i32) (result i32)
  i32.const 0
  local.get $this
  call $~lib/metashrew-as/assembly/blockdata/epoch/Epoch#get:idx
  global.get $~lib/metashrew-as/assembly/utils/constant/SUBSIDY_HALVING_INTERVAL
  i32.mul
  call $~lib/metashrew-as/assembly/blockdata/height/Height#constructor
  return
 )
 (func $~lib/metashrew-as/assembly/blockdata/sat/Sat#get:_idx (param $this i32) (result i64)
  local.get $this
  i64.load
 )
 (func $~lib/metashrew-as/assembly/blockdata/sat/Sat#add (param $this i32) (param $x i64) (result i32)
  local.get $this
  local.get $this
  call $~lib/metashrew-as/assembly/blockdata/sat/Sat#get:_idx
  local.get $x
  i64.add
  call $~lib/metashrew-as/assembly/blockdata/sat/Sat#set:_idx
  local.get $this
  return
 )
 (func $~lib/metashrew-as/assembly/blockdata/height/Height#startingSat (param $this i32) (result i32)
  (local $startingSat i32)
  (local $startingHeight i32)
  local.get $this
  call $~lib/metashrew-as/assembly/blockdata/epoch/Epoch.fromHeight
  call $~lib/metashrew-as/assembly/blockdata/epoch/Epoch#startingSat
  local.set $startingSat
  local.get $this
  call $~lib/metashrew-as/assembly/blockdata/epoch/Epoch.fromHeight
  call $~lib/metashrew-as/assembly/blockdata/epoch/Epoch#startingHeight
  local.set $startingHeight
  local.get $startingSat
  local.get $this
  call $~lib/metashrew-as/assembly/blockdata/height/Height#n
  local.get $startingHeight
  call $~lib/metashrew-as/assembly/blockdata/height/Height#n
  i32.sub
  i64.extend_i32_u
  local.get $this
  call $~lib/metashrew-as/assembly/blockdata/epoch/Epoch.fromHeight
  call $~lib/metashrew-as/assembly/blockdata/epoch/Epoch#subsidy
  i64.mul
  call $~lib/metashrew-as/assembly/blockdata/sat/Sat#add
  return
 )
 (func $~lib/metashrew-as/assembly/blockdata/sat/Sat#n (param $this i32) (result i64)
  local.get $this
  call $~lib/metashrew-as/assembly/blockdata/sat/Sat#get:_idx
  return
 )
 (func $~lib/array/Array<u64>#get:length_ (param $this i32) (result i32)
  local.get $this
  i32.load offset=12
 )
 (func $~lib/array/Array<u64>#set:length_ (param $this i32) (param $length_ i32)
  local.get $this
  local.get $length_
  i32.store offset=12
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
    i32.const 2464
    i32.const 2592
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
 (func $~lib/array/Array<~lib/array/Array<u64>>#get:length_ (param $this i32) (result i32)
  local.get $this
  i32.load offset=12
 )
 (func $~lib/array/Array<~lib/array/Array<u64>>#get:dataStart (param $this i32) (result i32)
  local.get $this
  i32.load offset=4
 )
 (func $~lib/array/Array<~lib/array/Array<u64>>#push (param $this i32) (param $value i32) (result i32)
  (local $oldLen i32)
  (local $len i32)
  local.get $this
  call $~lib/array/Array<~lib/array/Array<u64>>#get:length_
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
  call $~lib/array/Array<~lib/array/Array<u64>>#get:dataStart
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
  call $~lib/array/Array<~lib/array/Array<u64>>#set:length_
  local.get $len
  return
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Transaction>#__get (param $this i32) (param $index i32) (result i32)
  (local $value i32)
  local.get $index
  local.get $this
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Transaction>#get:length_
  i32.ge_u
  if
   i32.const 2464
   i32.const 2592
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
   i32.const 3008
   i32.const 2592
   i32.const 118
   i32.const 40
   call $~lib/builtins/abort
   unreachable
  end
  local.get $value
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
 (func $~lib/metashrew-as/assembly/utils/memcpy/memcpy (param $dest i32) (param $src i32) (param $len i32) (result i32)
  local.get $dest
  local.get $src
  local.get $len
  memory.copy
  local.get $dest
  return
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
   i32.const 30
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
    i32.const 2464
    i32.const 2592
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
 (func $~lib/array/Array<~lib/metashrew-as/assembly/utils/box/Box>#get:dataStart (param $this i32) (result i32)
  local.get $this
  i32.load offset=4
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
  i32.const 32
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
 (func $~lib/metashrew-as/assembly/utils/box/Box.concat~anonymous|0 (param $r i32) (param $v i32) (param $i i32) (param $ary i32) (result i32)
  local.get $r
  local.get $v
  call $~lib/metashrew-as/assembly/utils/box/Box#get:len
  i32.add
  return
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/utils/box/Box>#get:length_ (param $this i32) (result i32)
  local.get $this
  i32.load offset=12
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
    call_indirect (type $5)
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
    call_indirect (type $5)
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
  i32.const 5136
  i32.const 0
  call $~lib/array/Array<~lib/metashrew-as/assembly/utils/box/Box>#reduce<i32>
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.set $result
  local.get $data
  i32.const 5168
  local.get $result
  call $~lib/array/Array<~lib/metashrew-as/assembly/utils/box/Box>#reduce<usize>
  drop
  local.get $result
  return
 )
 (func $~lib/metashrew-as/assembly/utils/utils/concat (param $data i32) (result i32)
  local.get $data
  i32.const 5104
  call $~lib/array/Array<~lib/arraybuffer/ArrayBuffer>#map<~lib/metashrew-as/assembly/utils/box/Box>
  call $~lib/metashrew-as/assembly/utils/box/Box.concat
  return
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
  i32.const 31
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
  (local $correctedTxid i32)
  block $~lib/metashrew-as/assembly/utils/pointer/Pointer#toBox|inlined.8 (result i32)
   local.get $this
   call $~lib/metashrew-as/assembly/blockdata/transaction/Input#get:hash
   call $~lib/metashrew-as/assembly/utils/box/Box#get:start
   call $~lib/metashrew-as/assembly/utils/pointer/toPointer
   local.set $this|1
   i32.const 32
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
  local.set $txid
  block $~lib/metashrew-as/assembly/utils/pointer/Pointer#toBox|inlined.9 (result i32)
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
  local.set $vout
  local.get $txid
  call $~lib/metashrew-as/assembly/utils/box/Box#toArrayBuffer
  call $~lib/metashrew-as/assembly/utils/utils/reverse
  local.set $correctedTxid
  local.get $correctedTxid
  local.get $vout
  call $~lib/metashrew-as/assembly/utils/utils/parsePrimitive<u32>
  call $~lib/metashrew-as/assembly/blockdata/transaction/OutPoint.from
  return
 )
 (func $~lib/metashrew-as/assembly/blockdata/transaction/OutPoint#get:bytes (param $this i32) (result i32)
  local.get $this
  i32.load
 )
 (func $~lib/metashrew-as/assembly/blockdata/transaction/OutPoint#toBuffer (param $this i32) (result i32)
  local.get $this
  call $~lib/metashrew-as/assembly/blockdata/transaction/OutPoint#get:bytes
  call $~lib/metashrew-as/assembly/utils/box/Box#toArrayBuffer
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
   i32.const 5072
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
 (func $~lib/metashrew-as/assembly/utils/hex/encodeHexUTF8 (param $start i32) (param $len i32) (result i32)
  (local $result i32)
  (local $i i32)
  i32.const 0
  i32.const 2
  local.get $len
  i32.const 2
  i32.mul
  i32.add
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.set $result
  local.get $result
  i32.const 30768
  i32.store16
  i32.const 0
  local.set $i
  loop $for-loop|0
   local.get $i
   local.get $len
   i32.lt_u
   if
    i32.const 2
    local.get $result
    i32.add
    local.get $i
    i32.const 2
    i32.mul
    i32.add
    global.get $~lib/metashrew-as/assembly/utils/hex/hexLookupTable
    i32.const 2
    local.get $start
    local.get $i
    i32.add
    i32.load8_u
    i32.mul
    i32.add
    i32.load16_u
    i32.store16
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
   i32.const 816
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
 (func $~lib/metashrew-as/assembly/utils/hex/encodeHex (param $start i32) (param $len i32) (result i32)
  local.get $start
  local.get $len
  call $~lib/metashrew-as/assembly/utils/hex/encodeHexUTF8
  i32.const 0
  call $~lib/string/String.UTF8.decode
  return
 )
 (func $~lib/metashrew-as/assembly/utils/hex/encodeHexFromBuffer (param $data i32) (result i32)
  local.get $data
  local.get $data
  call $~lib/arraybuffer/ArrayBuffer#get:byteLength
  call $~lib/metashrew-as/assembly/utils/hex/encodeHex
  return
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/utils/box/Box>#set:length_ (param $this i32) (param $length_ i32)
  local.get $this
  local.get $length_
  i32.store offset=12
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
    i32.const 2464
    i32.const 2592
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
 (func $assembly/index/Index.keyFor (param $table i32) (param $key i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  i32.const 2
  i32.const 2
  i32.const 32
  i32.const 0
  call $~lib/rt/__newArray
  local.set $2
  local.get $2
  i32.load offset=4
  local.set $3
  local.get $2
  i32.const 0
  local.get $table
  call $~lib/metashrew-as/assembly/utils/box/Box.from
  call $~lib/array/Array<~lib/metashrew-as/assembly/utils/box/Box>#__set
  local.get $2
  i32.const 1
  local.get $key
  call $~lib/metashrew-as/assembly/utils/box/Box.from
  call $~lib/array/Array<~lib/metashrew-as/assembly/utils/box/Box>#__set
  local.get $2
  call $~lib/metashrew-as/assembly/utils/box/Box.concat
  return
 )
 (func $~lib/metashrew-as/assembly/utils/xxh32/xxh32 (param $key i32) (result i32)
  (local $h i32)
  (local $len i32)
  (local $pos i32)
  (local $s1 i32)
  (local $s2 i32)
  (local $s3 i32)
  (local $s4 i32)
  (local $end i32)
  (local $h|9 i32)
  (local $key|10 i32)
  (local $h|11 i32)
  (local $key|12 i32)
  (local $h|13 i32)
  (local $key|14 i32)
  (local $h|15 i32)
  (local $key|16 i32)
  (local $end|17 i32)
  local.get $key
  i32.const 0
  i32.eq
  if
   i32.const 0
   return
  end
  local.get $key
  call $~lib/arraybuffer/ArrayBuffer#get:byteLength
  i32.const 1
  i32.shl
  local.set $h
  local.get $h
  local.set $len
  local.get $key
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
     block $~lib/metashrew-as/assembly/utils/xxh32/mix|inlined.0 (result i32)
      local.get $s1
      local.set $h|9
      local.get $pos
      i32.load
      local.set $key|10
      local.get $h|9
      local.get $key|10
      i32.const -2048144777
      i32.mul
      i32.add
      i32.const 13
      i32.rotl
      i32.const -1640531535
      i32.mul
      br $~lib/metashrew-as/assembly/utils/xxh32/mix|inlined.0
     end
     local.set $s1
     block $~lib/metashrew-as/assembly/utils/xxh32/mix|inlined.1 (result i32)
      local.get $s2
      local.set $h|11
      local.get $pos
      i32.load offset=4
      local.set $key|12
      local.get $h|11
      local.get $key|12
      i32.const -2048144777
      i32.mul
      i32.add
      i32.const 13
      i32.rotl
      i32.const -1640531535
      i32.mul
      br $~lib/metashrew-as/assembly/utils/xxh32/mix|inlined.1
     end
     local.set $s2
     block $~lib/metashrew-as/assembly/utils/xxh32/mix|inlined.2 (result i32)
      local.get $s3
      local.set $h|13
      local.get $pos
      i32.load offset=8
      local.set $key|14
      local.get $h|13
      local.get $key|14
      i32.const -2048144777
      i32.mul
      i32.add
      i32.const 13
      i32.rotl
      i32.const -1640531535
      i32.mul
      br $~lib/metashrew-as/assembly/utils/xxh32/mix|inlined.2
     end
     local.set $s3
     block $~lib/metashrew-as/assembly/utils/xxh32/mix|inlined.3 (result i32)
      local.get $s4
      local.set $h|15
      local.get $pos
      i32.load offset=12
      local.set $key|16
      local.get $h|15
      local.get $key|16
      i32.const -2048144777
      i32.mul
      i32.add
      i32.const 13
      i32.rotl
      i32.const -1640531535
      i32.mul
      br $~lib/metashrew-as/assembly/utils/xxh32/mix|inlined.3
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
  local.get $key
  local.get $len
  i32.add
  i32.const 4
  i32.sub
  local.set $end|17
  loop $while-continue|1
   local.get $pos
   local.get $end|17
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
  local.get $key
  local.get $len
  i32.add
  local.set $end|17
  loop $while-continue|2
   local.get $pos
   local.get $end|17
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
  return
 )
 (func $~lib/util/hash/HASH<u32> (param $key i32) (result i32)
  (local $key|1 i32)
  (local $len i32)
  (local $h i32)
  i32.const 0
  drop
  i32.const 0
  drop
  i32.const 0
  drop
  i32.const 4
  i32.const 4
  i32.le_u
  drop
  block $~lib/util/hash/hash32|inlined.0 (result i32)
   local.get $key
   local.set $key|1
   i32.const 4
   local.set $len
   i32.const 0
   i32.const 374761393
   i32.add
   local.get $len
   i32.add
   local.set $h
   local.get $h
   local.get $key|1
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
   br $~lib/util/hash/hash32|inlined.0
  end
  return
 )
 (func $"~lib/map/Map<u32,~lib/arraybuffer/ArrayBuffer>#get:buckets" (param $this i32) (result i32)
  local.get $this
  i32.load
 )
 (func $"~lib/map/Map<u32,~lib/arraybuffer/ArrayBuffer>#get:bucketsMask" (param $this i32) (result i32)
  local.get $this
  i32.load offset=4
 )
 (func $"~lib/map/MapEntry<u32,~lib/arraybuffer/ArrayBuffer>#get:taggedNext" (param $this i32) (result i32)
  local.get $this
  i32.load offset=8
 )
 (func $"~lib/map/MapEntry<u32,~lib/arraybuffer/ArrayBuffer>#get:key" (param $this i32) (result i32)
  local.get $this
  i32.load
 )
 (func $"~lib/map/Map<u32,~lib/arraybuffer/ArrayBuffer>#find" (param $this i32) (param $key i32) (param $hashCode i32) (result i32)
  (local $entry i32)
  (local $taggedNext i32)
  local.get $this
  call $"~lib/map/Map<u32,~lib/arraybuffer/ArrayBuffer>#get:buckets"
  local.get $hashCode
  local.get $this
  call $"~lib/map/Map<u32,~lib/arraybuffer/ArrayBuffer>#get:bucketsMask"
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
    call $"~lib/map/MapEntry<u32,~lib/arraybuffer/ArrayBuffer>#get:taggedNext"
    local.set $taggedNext
    local.get $taggedNext
    i32.const 1
    i32.and
    i32.eqz
    if (result i32)
     local.get $entry
     call $"~lib/map/MapEntry<u32,~lib/arraybuffer/ArrayBuffer>#get:key"
     local.get $key
     i32.eq
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
 (func $"~lib/map/Map<u32,~lib/arraybuffer/ArrayBuffer>#has" (param $this i32) (param $key i32) (result i32)
  local.get $this
  local.get $key
  local.get $key
  call $~lib/util/hash/HASH<u32>
  call $"~lib/map/Map<u32,~lib/arraybuffer/ArrayBuffer>#find"
  i32.const 0
  i32.ne
  return
 )
 (func $"~lib/map/MapEntry<u32,~lib/arraybuffer/ArrayBuffer>#set:value" (param $this i32) (param $value i32)
  local.get $this
  local.get $value
  i32.store offset=4
 )
 (func $"~lib/map/Map<u32,~lib/arraybuffer/ArrayBuffer>#get:entriesOffset" (param $this i32) (result i32)
  local.get $this
  i32.load offset=16
 )
 (func $"~lib/map/Map<u32,~lib/arraybuffer/ArrayBuffer>#get:entriesCapacity" (param $this i32) (result i32)
  local.get $this
  i32.load offset=12
 )
 (func $"~lib/map/Map<u32,~lib/arraybuffer/ArrayBuffer>#get:entriesCount" (param $this i32) (result i32)
  local.get $this
  i32.load offset=20
 )
 (func $"~lib/map/Map<u32,~lib/arraybuffer/ArrayBuffer>#get:entries" (param $this i32) (result i32)
  local.get $this
  i32.load offset=8
 )
 (func $"~lib/map/MapEntry<u32,~lib/arraybuffer/ArrayBuffer>#set:key" (param $this i32) (param $key i32)
  local.get $this
  local.get $key
  i32.store
 )
 (func $"~lib/map/MapEntry<u32,~lib/arraybuffer/ArrayBuffer>#get:value" (param $this i32) (result i32)
  local.get $this
  i32.load offset=4
 )
 (func $"~lib/map/MapEntry<u32,~lib/arraybuffer/ArrayBuffer>#set:taggedNext" (param $this i32) (param $taggedNext i32)
  local.get $this
  local.get $taggedNext
  i32.store offset=8
 )
 (func $"~lib/map/Map<u32,~lib/arraybuffer/ArrayBuffer>#rehash" (param $this i32) (param $newBucketsMask i32)
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
  block $"~lib/map/ENTRY_SIZE<u32,~lib/arraybuffer/ArrayBuffer>|inlined.1" (result i32)
   i32.const 12
   br $"~lib/map/ENTRY_SIZE<u32,~lib/arraybuffer/ArrayBuffer>|inlined.1"
  end
  i32.mul
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.set $newEntries
  local.get $this
  call $"~lib/map/Map<u32,~lib/arraybuffer/ArrayBuffer>#get:entries"
  local.set $oldPtr
  local.get $oldPtr
  local.get $this
  call $"~lib/map/Map<u32,~lib/arraybuffer/ArrayBuffer>#get:entriesOffset"
  block $"~lib/map/ENTRY_SIZE<u32,~lib/arraybuffer/ArrayBuffer>|inlined.2" (result i32)
   i32.const 12
   br $"~lib/map/ENTRY_SIZE<u32,~lib/arraybuffer/ArrayBuffer>|inlined.2"
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
    call $"~lib/map/MapEntry<u32,~lib/arraybuffer/ArrayBuffer>#get:taggedNext"
    i32.const 1
    i32.and
    i32.eqz
    if
     local.get $newPtr
     local.set $newEntry
     local.get $oldEntry
     call $"~lib/map/MapEntry<u32,~lib/arraybuffer/ArrayBuffer>#get:key"
     local.set $oldEntryKey
     local.get $newEntry
     local.get $oldEntryKey
     call $"~lib/map/MapEntry<u32,~lib/arraybuffer/ArrayBuffer>#set:key"
     local.get $newEntry
     local.get $oldEntry
     call $"~lib/map/MapEntry<u32,~lib/arraybuffer/ArrayBuffer>#get:value"
     call $"~lib/map/MapEntry<u32,~lib/arraybuffer/ArrayBuffer>#set:value"
     local.get $oldEntryKey
     call $~lib/util/hash/HASH<u32>
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
     call $"~lib/map/MapEntry<u32,~lib/arraybuffer/ArrayBuffer>#set:taggedNext"
     local.get $newBucketPtrBase
     local.get $newPtr
     i32.store
     local.get $newPtr
     block $"~lib/map/ENTRY_SIZE<u32,~lib/arraybuffer/ArrayBuffer>|inlined.3" (result i32)
      i32.const 12
      br $"~lib/map/ENTRY_SIZE<u32,~lib/arraybuffer/ArrayBuffer>|inlined.3"
     end
     i32.add
     local.set $newPtr
    end
    local.get $oldPtr
    block $"~lib/map/ENTRY_SIZE<u32,~lib/arraybuffer/ArrayBuffer>|inlined.4" (result i32)
     i32.const 12
     br $"~lib/map/ENTRY_SIZE<u32,~lib/arraybuffer/ArrayBuffer>|inlined.4"
    end
    i32.add
    local.set $oldPtr
    br $while-continue|0
   end
  end
  local.get $this
  local.get $newBuckets
  call $"~lib/map/Map<u32,~lib/arraybuffer/ArrayBuffer>#set:buckets"
  local.get $this
  local.get $newBucketsMask
  call $"~lib/map/Map<u32,~lib/arraybuffer/ArrayBuffer>#set:bucketsMask"
  local.get $this
  local.get $newEntries
  call $"~lib/map/Map<u32,~lib/arraybuffer/ArrayBuffer>#set:entries"
  local.get $this
  local.get $newEntriesCapacity
  call $"~lib/map/Map<u32,~lib/arraybuffer/ArrayBuffer>#set:entriesCapacity"
  local.get $this
  local.get $this
  call $"~lib/map/Map<u32,~lib/arraybuffer/ArrayBuffer>#get:entriesCount"
  call $"~lib/map/Map<u32,~lib/arraybuffer/ArrayBuffer>#set:entriesOffset"
 )
 (func $"~lib/map/Map<u32,~lib/arraybuffer/ArrayBuffer>#set" (param $this i32) (param $key i32) (param $value i32) (result i32)
  (local $hashCode i32)
  (local $entry i32)
  (local $entries i32)
  (local $6 i32)
  (local $bucketPtrBase i32)
  local.get $key
  call $~lib/util/hash/HASH<u32>
  local.set $hashCode
  local.get $this
  local.get $key
  local.get $hashCode
  call $"~lib/map/Map<u32,~lib/arraybuffer/ArrayBuffer>#find"
  local.set $entry
  local.get $entry
  if
   local.get $entry
   local.get $value
   call $"~lib/map/MapEntry<u32,~lib/arraybuffer/ArrayBuffer>#set:value"
   i32.const 1
   drop
   local.get $this
   local.get $value
   i32.const 1
   call $~lib/rt/stub/__link
  else
   local.get $this
   call $"~lib/map/Map<u32,~lib/arraybuffer/ArrayBuffer>#get:entriesOffset"
   local.get $this
   call $"~lib/map/Map<u32,~lib/arraybuffer/ArrayBuffer>#get:entriesCapacity"
   i32.eq
   if
    local.get $this
    local.get $this
    call $"~lib/map/Map<u32,~lib/arraybuffer/ArrayBuffer>#get:entriesCount"
    local.get $this
    call $"~lib/map/Map<u32,~lib/arraybuffer/ArrayBuffer>#get:entriesCapacity"
    i32.const 3
    i32.mul
    i32.const 4
    i32.div_s
    i32.lt_s
    if (result i32)
     local.get $this
     call $"~lib/map/Map<u32,~lib/arraybuffer/ArrayBuffer>#get:bucketsMask"
    else
     local.get $this
     call $"~lib/map/Map<u32,~lib/arraybuffer/ArrayBuffer>#get:bucketsMask"
     i32.const 1
     i32.shl
     i32.const 1
     i32.or
    end
    call $"~lib/map/Map<u32,~lib/arraybuffer/ArrayBuffer>#rehash"
   end
   local.get $this
   call $"~lib/map/Map<u32,~lib/arraybuffer/ArrayBuffer>#get:entries"
   local.set $entries
   local.get $entries
   local.get $this
   local.get $this
   call $"~lib/map/Map<u32,~lib/arraybuffer/ArrayBuffer>#get:entriesOffset"
   local.tee $6
   i32.const 1
   i32.add
   call $"~lib/map/Map<u32,~lib/arraybuffer/ArrayBuffer>#set:entriesOffset"
   local.get $6
   block $"~lib/map/ENTRY_SIZE<u32,~lib/arraybuffer/ArrayBuffer>|inlined.5" (result i32)
    i32.const 12
    br $"~lib/map/ENTRY_SIZE<u32,~lib/arraybuffer/ArrayBuffer>|inlined.5"
   end
   i32.mul
   i32.add
   local.set $entry
   local.get $entry
   local.get $key
   call $"~lib/map/MapEntry<u32,~lib/arraybuffer/ArrayBuffer>#set:key"
   i32.const 0
   drop
   local.get $entry
   local.get $value
   call $"~lib/map/MapEntry<u32,~lib/arraybuffer/ArrayBuffer>#set:value"
   i32.const 1
   drop
   local.get $this
   local.get $value
   i32.const 1
   call $~lib/rt/stub/__link
   local.get $this
   local.get $this
   call $"~lib/map/Map<u32,~lib/arraybuffer/ArrayBuffer>#get:entriesCount"
   i32.const 1
   i32.add
   call $"~lib/map/Map<u32,~lib/arraybuffer/ArrayBuffer>#set:entriesCount"
   local.get $this
   call $"~lib/map/Map<u32,~lib/arraybuffer/ArrayBuffer>#get:buckets"
   local.get $hashCode
   local.get $this
   call $"~lib/map/Map<u32,~lib/arraybuffer/ArrayBuffer>#get:bucketsMask"
   i32.and
   i32.const 4
   i32.mul
   i32.add
   local.set $bucketPtrBase
   local.get $entry
   local.get $bucketPtrBase
   i32.load
   call $"~lib/map/MapEntry<u32,~lib/arraybuffer/ArrayBuffer>#set:taggedNext"
   local.get $bucketPtrBase
   local.get $entry
   i32.store
  end
  local.get $this
  return
 )
 (func $"~lib/map/Map<u32,~lib/arraybuffer/ArrayBuffer>#get" (param $this i32) (param $key i32) (result i32)
  (local $entry i32)
  local.get $this
  local.get $key
  local.get $key
  call $~lib/util/hash/HASH<u32>
  call $"~lib/map/Map<u32,~lib/arraybuffer/ArrayBuffer>#find"
  local.set $entry
  local.get $entry
  i32.eqz
  if
   i32.const 5360
   i32.const 5424
   i32.const 105
   i32.const 17
   call $~lib/builtins/abort
   unreachable
  end
  local.get $entry
  call $"~lib/map/MapEntry<u32,~lib/arraybuffer/ArrayBuffer>#get:value"
  return
 )
 (func $~lib/metashrew-as/assembly/indexer/index/get (param $k i32) (result i32)
  (local $h i32)
  (local $result i32)
  local.get $k
  call $~lib/metashrew-as/assembly/utils/xxh32/xxh32
  local.set $h
  global.get $~lib/metashrew-as/assembly/indexer/index/_updates
  local.get $h
  call $"~lib/map/Map<u32,~lib/arraybuffer/ArrayBuffer>#has"
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
   call $"~lib/map/Map<u32,~lib/arraybuffer/ArrayBuffer>#set"
   drop
   global.get $~lib/metashrew-as/assembly/indexer/index/_updateKeys
   local.get $h
   local.get $result
   call $"~lib/map/Map<u32,~lib/arraybuffer/ArrayBuffer>#set"
   drop
   local.get $result
   return
  else
   global.get $~lib/metashrew-as/assembly/indexer/index/_updates
   local.get $h
   call $"~lib/map/Map<u32,~lib/arraybuffer/ArrayBuffer>#get"
   return
  end
  unreachable
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Output>#get:length (param $this i32) (result i32)
  local.get $this
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Output>#get:length_
  return
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Output>#__get (param $this i32) (param $index i32) (result i32)
  (local $value i32)
  local.get $index
  local.get $this
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Output>#get:length_
  i32.ge_u
  if
   i32.const 2464
   i32.const 2592
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
   i32.const 3008
   i32.const 2592
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
 (func $~lib/array/Array<~lib/array/Array<u64>>#get:length (param $this i32) (result i32)
  local.get $this
  call $~lib/array/Array<~lib/array/Array<u64>>#get:length_
  return
 )
 (func $~lib/array/Array<~lib/array/Array<u64>>#shift (param $this i32) (result i32)
  (local $len i32)
  (local $base i32)
  (local $element i32)
  (local $lastIndex i32)
  local.get $this
  call $~lib/array/Array<~lib/array/Array<u64>>#get:length_
  local.set $len
  local.get $len
  i32.const 1
  i32.lt_s
  if
   i32.const 5792
   i32.const 2592
   i32.const 330
   i32.const 18
   call $~lib/builtins/abort
   unreachable
  end
  local.get $this
  call $~lib/array/Array<~lib/array/Array<u64>>#get:dataStart
  local.set $base
  local.get $base
  i32.load
  local.set $element
  local.get $len
  i32.const 1
  i32.sub
  local.set $lastIndex
  local.get $base
  local.get $base
  i32.const 4
  i32.add
  local.get $lastIndex
  i32.const 2
  i32.shl
  memory.copy
  i32.const 1
  drop
  local.get $base
  local.get $lastIndex
  i32.const 2
  i32.shl
  i32.add
  i32.const 0
  i32.store
  local.get $this
  local.get $lastIndex
  call $~lib/array/Array<~lib/array/Array<u64>>#set:length_
  local.get $element
  return
 )
 (func $~lib/array/Array<u64>#__get (param $this i32) (param $index i32) (result i64)
  (local $value i64)
  local.get $index
  local.get $this
  call $~lib/array/Array<u64>#get:length_
  i32.ge_u
  if
   i32.const 2464
   i32.const 2592
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
    i32.const 3500
    local.get $c1
    i32.const 2
    i32.shl
    i32.add
    i64.load32_u
    local.set $digits1
    i32.const 3500
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
    i32.const 3500
    local.get $b1
    i32.const 2
    i32.shl
    i32.add
    i64.load32_u
    local.set $digits1
    i32.const 3500
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
   i32.const 3296
   i32.const 3424
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
   i32.const 3488
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
 (func $~lib/array/Array<u64>#constructor (param $this i32) (param $length i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $bufferSize i32)
  (local $buffer i32)
  local.get $this
  i32.eqz
  if
   i32.const 16
   i32.const 28
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
   i32.const 1168
   i32.const 2592
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
 (func $~lib/array/Array<~lib/array/Array<u64>>#unshift (param $this i32) (param $value i32) (result i32)
  (local $len i32)
  (local $ptr i32)
  local.get $this
  call $~lib/array/Array<~lib/array/Array<u64>>#get:length_
  i32.const 1
  i32.add
  local.set $len
  local.get $this
  local.get $len
  i32.const 2
  i32.const 1
  call $~lib/array/ensureCapacity
  local.get $this
  call $~lib/array/Array<~lib/array/Array<u64>>#get:dataStart
  local.set $ptr
  local.get $ptr
  i32.const 4
  i32.add
  local.get $ptr
  local.get $len
  i32.const 1
  i32.sub
  i32.const 2
  i32.shl
  memory.copy
  local.get $ptr
  local.get $value
  i32.store
  i32.const 1
  drop
  local.get $this
  local.get $value
  i32.const 1
  call $~lib/rt/stub/__link
  local.get $this
  local.get $len
  call $~lib/array/Array<~lib/array/Array<u64>>#set:length_
  local.get $len
  return
 )
 (func $~lib/metashrew-as/assembly/utils/utils/primitiveToBuffer<u64> (param $value i64) (result i32)
  (local $buffer i32)
  i32.const 0
  i32.const 8
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.set $buffer
  local.get $buffer
  local.get $value
  i64.store
  local.get $buffer
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
   i32.const 32
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
   i32.const 1168
   i32.const 2592
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
   block $~lib/metashrew-as/assembly/utils/pointer/Pointer#toBox|inlined.10 (result i32)
    local.get $this
    call $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#get:bytes
    call $~lib/metashrew-as/assembly/utils/box/Box#get:start
    call $~lib/metashrew-as/assembly/utils/pointer/toPointer
    local.set $this|1
    i32.const 4
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
   local.set $version
   block $~lib/metashrew-as/assembly/utils/pointer/Pointer#toBox|inlined.11 (result i32)
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
 (func $~lib/metashrew-as/assembly/utils/sha256/sha256d (param $data i32) (result i32)
  local.get $data
  call $~lib/metashrew-as/assembly/utils/sha256/sha256
  call $~lib/metashrew-as/assembly/utils/sha256/sha256
  call $~lib/metashrew-as/assembly/utils/utils/reverse
  return
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
 (func $~lib/array/Array<~lib/arraybuffer/ArrayBuffer>#get:length (param $this i32) (result i32)
  local.get $this
  call $~lib/array/Array<~lib/arraybuffer/ArrayBuffer>#get:length_
  return
 )
 (func $~lib/array/Array<~lib/arraybuffer/ArrayBuffer>#unshift (param $this i32) (param $value i32) (result i32)
  (local $len i32)
  (local $ptr i32)
  local.get $this
  call $~lib/array/Array<~lib/arraybuffer/ArrayBuffer>#get:length_
  i32.const 1
  i32.add
  local.set $len
  local.get $this
  local.get $len
  i32.const 2
  i32.const 1
  call $~lib/array/ensureCapacity
  local.get $this
  call $~lib/array/Array<~lib/arraybuffer/ArrayBuffer>#get:dataStart
  local.set $ptr
  local.get $ptr
  i32.const 4
  i32.add
  local.get $ptr
  local.get $len
  i32.const 1
  i32.sub
  i32.const 2
  i32.shl
  memory.copy
  local.get $ptr
  local.get $value
  i32.store
  i32.const 1
  drop
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
 (func $~lib/metashrew-as/assembly/indexer/index/set (param $k i32) (param $v i32)
  (local $h i32)
  local.get $k
  call $~lib/metashrew-as/assembly/utils/xxh32/xxh32
  local.set $h
  global.get $~lib/metashrew-as/assembly/indexer/index/_updates
  local.get $h
  local.get $v
  call $"~lib/map/Map<u32,~lib/arraybuffer/ArrayBuffer>#set"
  drop
  global.get $~lib/metashrew-as/assembly/indexer/index/_updateKeys
  local.get $h
  local.get $k
  call $"~lib/map/Map<u32,~lib/arraybuffer/ArrayBuffer>#set"
  drop
 )
 (func $~lib/array/Array<~lib/array/Array<u64>>#__get (param $this i32) (param $index i32) (result i32)
  (local $value i32)
  local.get $index
  local.get $this
  call $~lib/array/Array<~lib/array/Array<u64>>#get:length_
  i32.ge_u
  if
   i32.const 2464
   i32.const 2592
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
   i32.const 3008
   i32.const 2592
   i32.const 118
   i32.const 40
   call $~lib/builtins/abort
   unreachable
  end
  local.get $value
  return
 )
 (func $~lib/metashrew-as/assembly/blockdata/block/Block#coinbase (param $this i32) (result i32)
  local.get $this
  call $~lib/metashrew-as/assembly/blockdata/block/Block#get:transactions
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Transaction>#get:length
  i32.const 0
  i32.gt_s
  if
   local.get $this
   call $~lib/metashrew-as/assembly/blockdata/block/Block#get:transactions
   i32.const 0
   call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Transaction>#__get
   return
  else
   i32.const 0
   return
  end
  unreachable
 )
 (func $assembly/index/Index.indexRanges (param $height i32) (param $block i32)
  (local $2 i32)
  (local $3 i32)
  (local $h i32)
  (local $coinbase_inputs i32)
  (local $start i32)
  (local $7 i32)
  (local $8 i32)
  (local $tx_offset i32)
  (local $tx i32)
  (local $inputOrdinalsRange i32)
  (local $i i32)
  (local $input i32)
  (local $key i32)
  (local $response i32)
  (local $ordinalRanges i32)
  (local $numOfOrdinals i32)
  (local $i|18 i32)
  (local $start|19 i64)
  (local $end i64)
  (local $21 i32)
  (local $22 i32)
  (local $i|23 i32)
  (local $output i32)
  (local $25 i32)
  (local $26 i32)
  (local $ordinals i32)
  (local $remaining i64)
  (local $range i32)
  (local $count i64)
  (local $assigned i32)
  (local $middle i64)
  (local $33 i32)
  (local $34 i32)
  (local $35 i32)
  (local $36 i32)
  (local $start|37 i32)
  (local $end|38 i32)
  (local $39 i32)
  (local $40 i32)
  (local $ordinalRange i32)
  (local $key|42 i32)
  (local $numOrdinals i32)
  (local $ords i32)
  (local $i|45 i32)
  (local $coinbase i32)
  (local $vout i32)
  (local $output|48 i32)
  (local $49 i32)
  (local $50 i32)
  (local $ordinals|51 i32)
  (local $remaining|52 i64)
  (local $range|53 i32)
  (local $count|54 i64)
  (local $assigned|55 i32)
  (local $middle|56 i64)
  (local $57 i32)
  (local $58 i32)
  (local $59 i32)
  (local $60 i32)
  (local $start|61 i32)
  (local $end|62 i32)
  (local $63 i32)
  (local $64 i32)
  (local $ordinalRange|65 i32)
  (local $numOrdinals|66 i32)
  (local $ords|67 i32)
  (local $key|68 i32)
  global.get $~lib/metashrew-as/assembly/utils/logging/console
  local.get $height
  i32.const 10
  call $~lib/number/U32#toString
  local.set $2
  local.get $block
  call $~lib/metashrew-as/assembly/blockdata/block/Block#get:transactions
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Transaction>#get:length
  i32.const 10
  call $~lib/number/I32#toString
  local.set $3
  i32.const 3248
  i32.const 1
  local.get $2
  call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
  i32.const 3248
  i32.const 3
  local.get $3
  call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
  i32.const 3248
  i32.const 5072
  call $~lib/staticarray/StaticArray<~lib/string/String>#join
  call $~lib/metashrew-as/assembly/utils/logging/Console#log
  i32.const 0
  local.get $height
  call $~lib/metashrew-as/assembly/blockdata/height/Height#constructor
  local.set $h
  i32.const 0
  i32.const 0
  call $~lib/array/Array<~lib/array/Array<u64>>#constructor
  local.set $coinbase_inputs
  local.get $h
  call $~lib/metashrew-as/assembly/blockdata/height/Height#subsidy
  i64.const 0
  i64.gt_u
  if
   local.get $h
   call $~lib/metashrew-as/assembly/blockdata/height/Height#startingSat
   local.set $start
   local.get $coinbase_inputs
   i32.const 2
   i32.const 3
   i32.const 28
   i32.const 0
   call $~lib/rt/__newArray
   local.set $7
   local.get $7
   i32.load offset=4
   local.set $8
   local.get $7
   i32.const 0
   local.get $start
   call $~lib/metashrew-as/assembly/blockdata/sat/Sat#n
   call $~lib/array/Array<u64>#__set
   local.get $7
   i32.const 1
   local.get $start
   call $~lib/metashrew-as/assembly/blockdata/sat/Sat#n
   local.get $h
   call $~lib/metashrew-as/assembly/blockdata/height/Height#subsidy
   i64.add
   call $~lib/array/Array<u64>#__set
   local.get $7
   call $~lib/array/Array<~lib/array/Array<u64>>#push
   drop
  end
  i32.const 1
  local.set $tx_offset
  loop $for-loop|0
   local.get $tx_offset
   local.get $block
   call $~lib/metashrew-as/assembly/blockdata/block/Block#get:transactions
   call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Transaction>#get:length
   i32.lt_s
   if
    local.get $block
    call $~lib/metashrew-as/assembly/blockdata/block/Block#get:transactions
    local.get $tx_offset
    call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Transaction>#__get
    local.set $tx
    i32.const 0
    i32.const 0
    call $~lib/array/Array<~lib/array/Array<u64>>#constructor
    local.set $inputOrdinalsRange
    i32.const 0
    local.set $i
    loop $for-loop|1
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
      local.set $input
      local.get $input
      call $~lib/metashrew-as/assembly/blockdata/transaction/Input#previousOutput
      call $~lib/metashrew-as/assembly/blockdata/transaction/OutPoint#toBuffer
      local.set $key
      global.get $~lib/metashrew-as/assembly/utils/logging/console
      i32.const 5200
      local.get $tx_offset
      i32.const 10
      call $~lib/number/I32#toString
      call $~lib/string/String.__concat
      i32.const 5248
      call $~lib/string/String.__concat
      local.get $i
      i32.const 10
      call $~lib/number/I32#toString
      call $~lib/string/String.__concat
      i32.const 5296
      call $~lib/string/String.__concat
      local.get $key
      call $~lib/metashrew-as/assembly/utils/hex/encodeHexFromBuffer
      call $~lib/string/String.__concat
      call $~lib/metashrew-as/assembly/utils/logging/Console#log
      global.get $assembly/index/OUTPOINT_TO_ORDINALS_RANGE
      local.get $key
      call $assembly/index/Index.keyFor
      call $~lib/metashrew-as/assembly/indexer/index/get
      local.set $response
      local.get $response
      call $~lib/metashrew-as/assembly/utils/box/Box.from
      local.set $ordinalRanges
      local.get $ordinalRanges
      call $~lib/metashrew-as/assembly/utils/utils/parsePrimitive<u32>
      local.set $numOfOrdinals
      i32.const 0
      local.set $i|18
      loop $for-loop|2
       local.get $i|18
       local.get $numOfOrdinals
       i32.lt_s
       if
        local.get $ordinalRanges
        call $~lib/metashrew-as/assembly/utils/utils/parsePrimitive<u64>
        local.set $start|19
        local.get $ordinalRanges
        call $~lib/metashrew-as/assembly/utils/utils/parsePrimitive<u64>
        local.set $end
        local.get $inputOrdinalsRange
        i32.const 2
        i32.const 3
        i32.const 28
        i32.const 0
        call $~lib/rt/__newArray
        local.set $21
        local.get $21
        i32.load offset=4
        local.set $22
        local.get $21
        i32.const 0
        local.get $start|19
        call $~lib/array/Array<u64>#__set
        local.get $21
        i32.const 1
        local.get $end
        call $~lib/array/Array<u64>#__set
        local.get $21
        call $~lib/array/Array<~lib/array/Array<u64>>#push
        drop
        local.get $i|18
        i32.const 1
        i32.add
        local.set $i|18
        br $for-loop|2
       end
      end
      local.get $i
      i32.const 1
      i32.add
      local.set $i
      br $for-loop|1
     end
    end
    i32.const 0
    local.set $i|23
    loop $for-loop|3
     local.get $i|23
     local.get $tx
     call $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#get:outs
     call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Output>#get:length
     i32.lt_s
     if
      global.get $~lib/metashrew-as/assembly/utils/logging/console
      i32.const 5472
      call $~lib/metashrew-as/assembly/utils/logging/Console#log
      local.get $tx
      call $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#get:outs
      local.get $i|23
      call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Output>#__get
      local.set $output
      i32.const 0
      i32.const 2
      i32.const 31
      i32.const 5504
      call $~lib/rt/__newArray
      local.set $ordinals
      local.get $output
      call $~lib/metashrew-as/assembly/blockdata/transaction/Output#get:value
      local.set $remaining
      block $while-break|4
       loop $while-continue|4
        local.get $remaining
        i64.const 0
        i64.gt_u
        if
         global.get $~lib/metashrew-as/assembly/utils/logging/console
         i32.const 5536
         call $~lib/metashrew-as/assembly/utils/logging/Console#log
         local.get $inputOrdinalsRange
         call $~lib/array/Array<~lib/array/Array<u64>>#get:length
         i32.const 0
         i32.eq
         if
          global.get $~lib/metashrew-as/assembly/utils/logging/console
          i32.const 5568
          call $~lib/metashrew-as/assembly/utils/logging/Console#log
          br $while-break|4
         else
          global.get $~lib/metashrew-as/assembly/utils/logging/console
          i32.const 5680
          call $~lib/metashrew-as/assembly/utils/logging/Console#log
         end
         local.get $inputOrdinalsRange
         call $~lib/array/Array<~lib/array/Array<u64>>#shift
         local.set $range
         local.get $range
         i32.const 1
         call $~lib/array/Array<u64>#__get
         local.get $range
         i32.const 0
         call $~lib/array/Array<u64>#__get
         i64.sub
         local.set $count
         global.get $~lib/metashrew-as/assembly/utils/logging/console
         i32.const 5840
         local.get $count
         i32.const 10
         call $~lib/number/U64#toString
         call $~lib/string/String.__concat
         call $~lib/metashrew-as/assembly/utils/logging/Console#log
         i32.const 0
         i32.const 0
         call $~lib/array/Array<u64>#constructor
         local.set $assigned
         local.get $count
         local.get $remaining
         i64.gt_u
         if
          local.get $range
          i32.const 0
          call $~lib/array/Array<u64>#__get
          local.get $remaining
          i64.add
          local.set $middle
          local.get $inputOrdinalsRange
          i32.const 2
          i32.const 3
          i32.const 28
          i32.const 0
          call $~lib/rt/__newArray
          local.set $33
          local.get $33
          i32.load offset=4
          local.set $34
          local.get $33
          i32.const 0
          local.get $middle
          call $~lib/array/Array<u64>#__set
          local.get $33
          i32.const 1
          local.get $range
          i32.const 1
          call $~lib/array/Array<u64>#__get
          call $~lib/array/Array<u64>#__set
          local.get $33
          call $~lib/array/Array<~lib/array/Array<u64>>#unshift
          drop
          i32.const 2
          i32.const 3
          i32.const 28
          i32.const 0
          call $~lib/rt/__newArray
          local.set $35
          local.get $35
          i32.load offset=4
          local.set $36
          local.get $35
          i32.const 0
          local.get $range
          i32.const 0
          call $~lib/array/Array<u64>#__get
          call $~lib/array/Array<u64>#__set
          local.get $35
          i32.const 1
          local.get $middle
          call $~lib/array/Array<u64>#__set
          local.get $35
          local.set $assigned
         else
          local.get $range
          local.set $assigned
         end
         local.get $assigned
         i32.const 0
         call $~lib/array/Array<u64>#__get
         call $~lib/metashrew-as/assembly/utils/utils/primitiveToBuffer<u64>
         local.set $start|37
         local.get $assigned
         i32.const 1
         call $~lib/array/Array<u64>#__get
         call $~lib/metashrew-as/assembly/utils/utils/primitiveToBuffer<u64>
         local.set $end|38
         i32.const 2
         i32.const 2
         i32.const 31
         i32.const 0
         call $~lib/rt/__newArray
         local.set $39
         local.get $39
         i32.load offset=4
         local.set $40
         local.get $39
         i32.const 0
         local.get $start|37
         call $~lib/array/Array<~lib/arraybuffer/ArrayBuffer>#__set
         local.get $39
         i32.const 1
         local.get $end|38
         call $~lib/array/Array<~lib/arraybuffer/ArrayBuffer>#__set
         local.get $39
         call $~lib/metashrew-as/assembly/utils/utils/concat
         local.set $ordinalRange
         local.get $ordinals
         local.get $ordinalRange
         call $~lib/array/Array<~lib/arraybuffer/ArrayBuffer>#push
         drop
         local.get $remaining
         local.get $assigned
         i32.const 1
         call $~lib/array/Array<u64>#__get
         local.get $assigned
         i32.const 0
         call $~lib/array/Array<u64>#__get
         i64.sub
         i64.sub
         local.set $remaining
         br $while-continue|4
        end
       end
      end
      local.get $tx
      call $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#txid
      local.get $i|23
      call $~lib/metashrew-as/assembly/blockdata/transaction/OutPoint.from
      call $~lib/metashrew-as/assembly/blockdata/transaction/OutPoint#toBuffer
      local.set $key|42
      local.get $ordinals
      call $~lib/array/Array<~lib/arraybuffer/ArrayBuffer>#get:length
      call $~lib/metashrew-as/assembly/utils/utils/primitiveToBuffer<u32>
      local.set $numOrdinals
      local.get $ordinals
      local.get $numOrdinals
      call $~lib/array/Array<~lib/arraybuffer/ArrayBuffer>#unshift
      drop
      local.get $ordinals
      call $~lib/metashrew-as/assembly/utils/utils/concat
      local.set $ords
      global.get $assembly/index/OUTPOINT_TO_ORDINALS_RANGE
      local.get $key|42
      call $assembly/index/Index.keyFor
      local.get $ords
      call $~lib/metashrew-as/assembly/indexer/index/set
      local.get $i|23
      i32.const 1
      i32.add
      local.set $i|23
      br $for-loop|3
     end
    end
    i32.const 0
    local.set $i|45
    loop $for-loop|5
     local.get $i|45
     local.get $inputOrdinalsRange
     call $~lib/array/Array<~lib/array/Array<u64>>#get:length
     i32.lt_s
     if
      local.get $coinbase_inputs
      local.get $inputOrdinalsRange
      local.get $i|45
      call $~lib/array/Array<~lib/array/Array<u64>>#__get
      call $~lib/array/Array<~lib/array/Array<u64>>#push
      drop
      local.get $i|45
      i32.const 1
      i32.add
      local.set $i|45
      br $for-loop|5
     end
    end
    local.get $tx_offset
    i32.const 1
    i32.add
    local.set $tx_offset
    br $for-loop|0
   end
  end
  local.get $block
  call $~lib/metashrew-as/assembly/blockdata/block/Block#coinbase
  local.set $coinbase
  local.get $coinbase
  i32.const 0
  i32.eq
  if
   return
  else
  end
  i32.const 0
  local.set $vout
  loop $for-loop|6
   local.get $vout
   local.get $coinbase
   call $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#get:outs
   call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Output>#get:length
   i32.lt_s
   if
    local.get $coinbase
    call $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#get:outs
    local.get $vout
    call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Output>#__get
    local.set $output|48
    i32.const 0
    i32.const 2
    i32.const 31
    i32.const 5888
    call $~lib/rt/__newArray
    local.set $ordinals|51
    local.get $output|48
    call $~lib/metashrew-as/assembly/blockdata/transaction/Output#get:value
    local.set $remaining|52
    block $while-break|7
     loop $while-continue|7
      local.get $remaining|52
      i64.const 0
      i64.gt_u
      if
       local.get $coinbase_inputs
       call $~lib/array/Array<~lib/array/Array<u64>>#get:length
       i32.const 0
       i32.eq
       if
        br $while-break|7
       end
       local.get $coinbase_inputs
       call $~lib/array/Array<~lib/array/Array<u64>>#shift
       local.set $range|53
       local.get $range|53
       i32.const 1
       call $~lib/array/Array<u64>#__get
       local.get $range|53
       i32.const 0
       call $~lib/array/Array<u64>#__get
       i64.sub
       local.set $count|54
       i32.const 0
       i32.const 0
       call $~lib/array/Array<u64>#constructor
       local.set $assigned|55
       local.get $count|54
       local.get $remaining|52
       i64.gt_u
       if
        local.get $range|53
        i32.const 0
        call $~lib/array/Array<u64>#__get
        local.get $remaining|52
        i64.add
        local.set $middle|56
        local.get $coinbase_inputs
        i32.const 2
        i32.const 3
        i32.const 28
        i32.const 0
        call $~lib/rt/__newArray
        local.set $57
        local.get $57
        i32.load offset=4
        local.set $58
        local.get $57
        i32.const 0
        local.get $middle|56
        call $~lib/array/Array<u64>#__set
        local.get $57
        i32.const 1
        local.get $range|53
        i32.const 1
        call $~lib/array/Array<u64>#__get
        call $~lib/array/Array<u64>#__set
        local.get $57
        call $~lib/array/Array<~lib/array/Array<u64>>#unshift
        drop
        i32.const 2
        i32.const 3
        i32.const 28
        i32.const 0
        call $~lib/rt/__newArray
        local.set $59
        local.get $59
        i32.load offset=4
        local.set $60
        local.get $59
        i32.const 0
        local.get $range|53
        i32.const 0
        call $~lib/array/Array<u64>#__get
        call $~lib/array/Array<u64>#__set
        local.get $59
        i32.const 1
        local.get $middle|56
        call $~lib/array/Array<u64>#__set
        local.get $59
        local.set $assigned|55
       else
        local.get $range|53
        local.set $assigned|55
       end
       local.get $assigned|55
       i32.const 0
       call $~lib/array/Array<u64>#__get
       call $~lib/metashrew-as/assembly/utils/utils/primitiveToBuffer<u64>
       local.set $start|61
       local.get $assigned|55
       i32.const 1
       call $~lib/array/Array<u64>#__get
       call $~lib/metashrew-as/assembly/utils/utils/primitiveToBuffer<u64>
       local.set $end|62
       i32.const 2
       i32.const 2
       i32.const 31
       i32.const 0
       call $~lib/rt/__newArray
       local.set $63
       local.get $63
       i32.load offset=4
       local.set $64
       local.get $63
       i32.const 0
       local.get $start|61
       call $~lib/array/Array<~lib/arraybuffer/ArrayBuffer>#__set
       local.get $63
       i32.const 1
       local.get $end|62
       call $~lib/array/Array<~lib/arraybuffer/ArrayBuffer>#__set
       local.get $63
       call $~lib/metashrew-as/assembly/utils/utils/concat
       local.set $ordinalRange|65
       local.get $ordinals|51
       local.get $ordinalRange|65
       call $~lib/array/Array<~lib/arraybuffer/ArrayBuffer>#push
       drop
       local.get $remaining|52
       local.get $assigned|55
       i32.const 1
       call $~lib/array/Array<u64>#__get
       local.get $assigned|55
       i32.const 0
       call $~lib/array/Array<u64>#__get
       i64.sub
       i64.sub
       local.set $remaining|52
       br $while-continue|7
      end
     end
    end
    local.get $ordinals|51
    call $~lib/array/Array<~lib/arraybuffer/ArrayBuffer>#get:length
    call $~lib/metashrew-as/assembly/utils/utils/primitiveToBuffer<u32>
    local.set $numOrdinals|66
    local.get $ordinals|51
    local.get $numOrdinals|66
    call $~lib/array/Array<~lib/arraybuffer/ArrayBuffer>#unshift
    drop
    local.get $ordinals|51
    call $~lib/metashrew-as/assembly/utils/utils/concat
    local.set $ords|67
    local.get $coinbase
    call $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#txid
    local.get $vout
    call $~lib/metashrew-as/assembly/blockdata/transaction/OutPoint.from
    call $~lib/metashrew-as/assembly/blockdata/transaction/OutPoint#toBuffer
    local.set $key|68
    global.get $~lib/metashrew-as/assembly/utils/logging/console
    i32.const 5920
    local.get $key|68
    call $~lib/metashrew-as/assembly/utils/hex/encodeHexFromBuffer
    call $~lib/string/String.__concat
    call $~lib/metashrew-as/assembly/utils/logging/Console#log
    global.get $assembly/index/OUTPOINT_TO_ORDINALS_RANGE
    local.get $key|68
    call $assembly/index/Index.keyFor
    local.get $ords|67
    call $~lib/metashrew-as/assembly/indexer/index/set
    local.get $vout
    i32.const 1
    i32.add
    local.set $vout
    br $for-loop|6
   end
  end
 )
 (func $~lib/array/Array<u32>#set:buffer (param $this i32) (param $buffer i32)
  local.get $this
  local.get $buffer
  i32.store
  local.get $this
  local.get $buffer
  i32.const 0
  call $~lib/rt/stub/__link
 )
 (func $~lib/array/Array<u32>#set:dataStart (param $this i32) (param $dataStart i32)
  local.get $this
  local.get $dataStart
  i32.store offset=4
 )
 (func $~lib/array/Array<u32>#set:byteLength (param $this i32) (param $byteLength i32)
  local.get $this
  local.get $byteLength
  i32.store offset=8
 )
 (func $~lib/array/Array<u32>#set:length_ (param $this i32) (param $length_ i32)
  local.get $this
  local.get $length_
  i32.store offset=12
 )
 (func $~lib/array/Array<u32>#constructor (param $this i32) (param $length i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $bufferSize i32)
  (local $buffer i32)
  local.get $this
  i32.eqz
  if
   i32.const 16
   i32.const 7
   call $~lib/rt/stub/__new
   local.set $this
  end
  local.get $this
  i32.const 0
  call $~lib/array/Array<u32>#set:buffer
  local.get $this
  i32.const 0
  call $~lib/array/Array<u32>#set:dataStart
  local.get $this
  i32.const 0
  call $~lib/array/Array<u32>#set:byteLength
  local.get $this
  i32.const 0
  call $~lib/array/Array<u32>#set:length_
  local.get $length
  i32.const 1073741820
  i32.const 2
  i32.shr_u
  i32.gt_u
  if
   i32.const 1168
   i32.const 2592
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
  call $~lib/array/Array<u32>#set:buffer
  local.get $this
  local.get $buffer
  call $~lib/array/Array<u32>#set:dataStart
  local.get $this
  local.get $bufferSize
  call $~lib/array/Array<u32>#set:byteLength
  local.get $this
  local.get $length
  call $~lib/array/Array<u32>#set:length_
  local.get $this
 )
 (func $~lib/array/Array<u32>#get:length_ (param $this i32) (result i32)
  local.get $this
  i32.load offset=12
 )
 (func $~lib/array/Array<u32>#__set (param $this i32) (param $index i32) (param $value i32)
  local.get $index
  local.get $this
  call $~lib/array/Array<u32>#get:length_
  i32.ge_u
  if
   local.get $index
   i32.const 0
   i32.lt_s
   if
    i32.const 2464
    i32.const 2592
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
   call $~lib/array/Array<u32>#set:length_
  end
  local.get $this
  call $~lib/array/Array<u32>#get:dataStart
  local.get $index
  i32.const 2
  i32.shl
  i32.add
  local.get $value
  i32.store
  i32.const 0
  drop
 )
 (func $~lib/array/Array<u32>#set:length (param $this i32) (param $newLength i32)
  local.get $this
  local.get $newLength
  i32.const 2
  i32.const 0
  call $~lib/array/ensureCapacity
  local.get $this
  local.get $newLength
  call $~lib/array/Array<u32>#set:length_
 )
 (func $"~lib/map/Map<u32,~lib/arraybuffer/ArrayBuffer>#keys" (param $this i32) (result i32)
  (local $start i32)
  (local $size i32)
  (local $keys i32)
  (local $length i32)
  (local $i i32)
  (local $entry i32)
  (local $7 i32)
  local.get $this
  call $"~lib/map/Map<u32,~lib/arraybuffer/ArrayBuffer>#get:entries"
  local.set $start
  local.get $this
  call $"~lib/map/Map<u32,~lib/arraybuffer/ArrayBuffer>#get:entriesOffset"
  local.set $size
  i32.const 0
  local.get $size
  call $~lib/array/Array<u32>#constructor
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
    block $"~lib/map/ENTRY_SIZE<u32,~lib/arraybuffer/ArrayBuffer>|inlined.6" (result i32)
     i32.const 12
     br $"~lib/map/ENTRY_SIZE<u32,~lib/arraybuffer/ArrayBuffer>|inlined.6"
    end
    i32.mul
    i32.add
    local.set $entry
    local.get $entry
    call $"~lib/map/MapEntry<u32,~lib/arraybuffer/ArrayBuffer>#get:taggedNext"
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
     call $"~lib/map/MapEntry<u32,~lib/arraybuffer/ArrayBuffer>#get:key"
     call $~lib/array/Array<u32>#__set
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
  call $~lib/array/Array<u32>#set:length
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
   i32.const 37
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
   i32.const 1168
   i32.const 2592
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
   i32.const 36
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
  call $"~lib/map/Map<u32,~lib/arraybuffer/ArrayBuffer>#get"
  call $~lib/metashrew-as/assembly/utils/rlp/RLPItem.fromArrayBuffer
  call $~lib/array/Array<~lib/metashrew-as/assembly/utils/rlp/RLPItem>#push
  drop
  local.get $r
  global.get $~lib/metashrew-as/assembly/indexer/index/_updates
  local.get $v
  call $"~lib/map/Map<u32,~lib/arraybuffer/ArrayBuffer>#get"
  call $~lib/metashrew-as/assembly/utils/rlp/RLPItem.fromArrayBuffer
  call $~lib/array/Array<~lib/metashrew-as/assembly/utils/rlp/RLPItem>#push
  drop
  local.get $r
  return
 )
 (func $~lib/array/Array<u32>#reduce<~lib/array/Array<~lib/metashrew-as/assembly/utils/rlp/RLPItem>> (param $this i32) (param $fn i32) (param $initialValue i32) (result i32)
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
  call $~lib/array/Array<u32>#get:length_
  local.set $len
  loop $for-loop|0
   local.get $i
   local.get $len
   local.tee $6
   local.get $this
   call $~lib/array/Array<u32>#get:length_
   local.tee $7
   local.get $6
   local.get $7
   i32.lt_s
   select
   i32.lt_s
   if
    local.get $acc
    local.get $this
    call $~lib/array/Array<u32>#get:dataStart
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
    call_indirect (type $5)
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
  local.get $v
  call $~lib/metashrew-as/assembly/utils/rlp/toRLP
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
  i32.const 31
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
    call_indirect (type $5)
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
    call_indirect (type $5)
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
  (local $result|5 i32)
  (local $start i32)
  (local $len i32)
  (local $val i32)
  (local $val|9 i32)
  (local $byte i32)
  (local $result|11 i32)
  (local $result|12 i32)
  (local $length|13 i32)
  (local $result|14 i32)
  local.get $item
  call $~lib/metashrew-as/assembly/utils/rlp/RLPItem#get:typeFlag
  i32.const 3
  i32.eq
  if
   local.get $item
   call $~lib/metashrew-as/assembly/utils/rlp/RLPItem#asList
   i32.const 6032
   call $~lib/array/Array<~lib/metashrew-as/assembly/utils/rlp/RLPItem>#map<~lib/arraybuffer/ArrayBuffer>
   local.set $list
   local.get $list
   i32.const 6064
   i32.const 0
   call $~lib/array/Array<~lib/arraybuffer/ArrayBuffer>#reduce<i32>
   local.set $length
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
    local.get $result
    return
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
    local.set $result|5
    local.get $result|5
    i32.const 247
    local.get $byteLength
    i32.add
    i32.store8
    local.get $byteLength
    i32.const 1
    i32.eq
    if
     local.get $result|5
     i32.const 1
     i32.add
     local.get $length
     i32.store8
    else
     local.get $byteLength
     i32.const 2
     i32.eq
     if
      local.get $result|5
      i32.const 1
      i32.add
      local.get $length
      i32.const 65280
      i32.and
      i32.const 8
      i32.shr_s
      i32.store8
      local.get $result|5
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
       local.get $result|5
       i32.const 1
       i32.add
       local.get $length
       i32.const 16711680
       i32.and
       i32.const 16
       i32.shr_s
       i32.store8
       local.get $result|5
       i32.const 2
       i32.add
       local.get $length
       i32.const 65280
       i32.and
       i32.const 8
       i32.shr_s
       i32.store8
       local.get $result|5
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
        local.get $result|5
        i32.const 1
        i32.add
        local.get $length
        i32.const -16777216
        i32.and
        i32.const 24
        i32.shr_s
        i32.store8
        local.get $result|5
        i32.const 2
        i32.add
        local.get $length
        i32.const 16711680
        i32.and
        i32.const 16
        i32.shr_s
        i32.store8
        local.get $result|5
        i32.const 3
        i32.add
        local.get $length
        i32.const 65280
        i32.and
        i32.const 8
        i32.shr_s
        i32.store8
        local.get $result|5
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
    i32.const 6096
    local.get $result|5
    i32.const 1
    i32.add
    local.get $byteLength
    i32.add
    call $~lib/array/Array<~lib/arraybuffer/ArrayBuffer>#reduce<usize>
    drop
    local.get $result|5
    return
   end
   unreachable
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
     local.set $val|9
     local.get $val|9
     call $~lib/metashrew-as/assembly/utils/box/Box#get:start
     local.set $start
     local.get $val|9
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
     local.set $result|11
     local.get $result|11
     local.get $byte
     i32.store8
     local.get $result|11
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
    local.set $result|12
    local.get $result|12
    local.get $len
    i32.const 128
    i32.add
    i32.store8
    local.get $result|12
    i32.const 1
    i32.add
    local.get $start
    local.get $len
    call $~lib/metashrew-as/assembly/utils/memcpy/memcpy
    drop
    local.get $result|12
    return
   else
    local.get $len
    call $~lib/metashrew-as/assembly/utils/rlp/byteLengthForLength
    local.set $length|13
    i32.const 0
    local.get $len
    local.get $length|13
    i32.add
    i32.const 1
    i32.add
    call $~lib/arraybuffer/ArrayBuffer#constructor
    local.set $result|14
    local.get $result|14
    local.get $length|13
    i32.const 183
    i32.add
    i32.store8
    local.get $length|13
    i32.const 1
    i32.eq
    if
     local.get $result|14
     i32.const 1
     i32.add
     local.get $len
     i32.store8
    else
     local.get $length|13
     i32.const 2
     i32.eq
     if
      local.get $result|14
      i32.const 1
      i32.add
      local.get $len
      i32.const 65280
      i32.and
      i32.const 8
      i32.shr_s
      i32.store8
      local.get $result|14
      i32.const 2
      i32.add
      local.get $len
      i32.const 255
      i32.and
      i32.store8
     else
      local.get $length|13
      i32.const 3
      i32.eq
      if
       local.get $result|14
       i32.const 1
       i32.add
       local.get $len
       i32.const 16711680
       i32.and
       i32.const 16
       i32.shr_s
       i32.store8
       local.get $result|14
       i32.const 2
       i32.add
       local.get $len
       i32.const 65280
       i32.and
       i32.const 8
       i32.shr_s
       i32.store8
       local.get $result|14
       i32.const 3
       i32.add
       local.get $len
       i32.const 255
       i32.and
       i32.store8
      else
       local.get $length|13
       i32.const 4
       i32.eq
       if
        local.get $result|14
        i32.const 1
        i32.add
        local.get $len
        i32.const -16777216
        i32.and
        i32.const 24
        i32.shr_s
        i32.store8
        local.get $result|14
        i32.const 2
        i32.add
        local.get $len
        i32.const 16711680
        i32.and
        i32.const 16
        i32.shr_s
        i32.store8
        local.get $result|14
        i32.const 3
        i32.add
        local.get $len
        i32.const 65280
        i32.and
        i32.const 8
        i32.shr_s
        i32.store8
        local.get $result|14
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
    local.get $result|14
    i32.const 1
    i32.add
    local.get $length|13
    i32.add
    local.get $start
    local.get $len
    call $~lib/metashrew-as/assembly/utils/memcpy/memcpy
    drop
    local.get $result|14
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
  call $"~lib/map/Map<u32,~lib/arraybuffer/ArrayBuffer>#keys"
  local.set $hashKeys
  i32.const 0
  i32.const 0
  call $~lib/array/Array<~lib/metashrew-as/assembly/utils/rlp/RLPItem>#constructor
  local.set $rlpInput
  local.get $hashKeys
  i32.const 6000
  local.get $rlpInput
  call $~lib/array/Array<u32>#reduce<~lib/array/Array<~lib/metashrew-as/assembly/utils/rlp/RLPItem>>
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
  call $assembly/index/Index.indexRanges
  call $~lib/metashrew-as/assembly/indexer/index/_flush
 )
 (func $~start
  call $start:assembly/index
 )
)
