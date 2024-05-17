(module
 (type $0 (func (param i32) (result i32)))
 (type $1 (func (param i32 i32)))
 (type $2 (func (param i32 i32) (result i32)))
 (type $3 (func (param i32 i32 i32) (result i32)))
 (type $4 (func))
 (type $5 (func (param i32 i32 i32)))
 (type $6 (func (param i32 i32 i32 i32) (result i32)))
 (type $7 (func (param i32) (result i64)))
 (type $8 (func (param i32 i64)))
 (type $9 (func (result i32)))
 (type $10 (func (param i32)))
 (type $11 (func (param i32 i32 i32 i32 i32) (result i32)))
 (type $12 (func (param i32 i64 i32) (result i32)))
 (type $13 (func (param i32 i64) (result i32)))
 (type $14 (func (param i32 i32 i32 i32)))
 (type $15 (func (param i32 i32) (result f64)))
 (type $16 (func (param i64) (result i64)))
 (type $17 (func (param i32 i64 i32)))
 (type $18 (func (param i64 i32) (result i32)))
 (type $19 (func (param i32 i64 i32 i32)))
 (type $20 (func (param i32 i64 i64) (result i32)))
 (type $21 (func (param i64) (result i32)))
 (type $22 (func (param i32 i64 i64 i64 i64) (result i32)))
 (type $23 (func (param i32 i32 i32 i32 i32)))
 (type $24 (func (param i32 i32 i32 i32 i32 i32)))
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
 (global $assembly/index/HEIGHT_TO_BLOCKHASH (mut i32) (i32.const 0))
 (global $assembly/index/BLOCKHASH_TO_HEIGHT (mut i32) (i32.const 0))
 (global $assembly/index/OUTPOINT_TO_RUNES (mut i32) (i32.const 0))
 (global $assembly/index/OUTPOINT_TO_HEIGHT (mut i32) (i32.const 0))
 (global $assembly/index/HEIGHT_TO_TRANSACTION_IDS (mut i32) (i32.const 0))
 (global $assembly/index/SYMBOL (mut i32) (i32.const 0))
 (global $assembly/index/CAP (mut i32) (i32.const 0))
 (global $assembly/index/SPACERS (mut i32) (i32.const 0))
 (global $assembly/index/OFFSETEND (mut i32) (i32.const 0))
 (global $assembly/index/OFFSETSTART (mut i32) (i32.const 0))
 (global $assembly/index/HEIGHTSTART (mut i32) (i32.const 0))
 (global $assembly/index/HEIGHTEND (mut i32) (i32.const 0))
 (global $assembly/index/AMOUNT (mut i32) (i32.const 0))
 (global $assembly/index/MINTS_REMAINING (mut i32) (i32.const 0))
 (global $assembly/index/PREMINE (mut i32) (i32.const 0))
 (global $assembly/index/DIVISIBILITY (mut i32) (i32.const 0))
 (global $assembly/index/RUNE_ID_TO_HEIGHT (mut i32) (i32.const 0))
 (global $assembly/index/RUNE_ID_TO_ETCHING (mut i32) (i32.const 0))
 (global $assembly/index/ETCHING_TO_RUNE_ID (mut i32) (i32.const 0))
 (global $assembly/index/RUNESTONE_TAG i32 (i32.const 23914))
 (global $assembly/index/OP_RETURN i32 (i32.const 106))
 (global $assembly/index/Field.BODY (mut i64) (i64.const 0))
 (global $assembly/index/Field.FLAGS (mut i64) (i64.const 2))
 (global $assembly/index/Field.RUNE (mut i64) (i64.const 4))
 (global $assembly/index/Field.PREMINE (mut i64) (i64.const 6))
 (global $assembly/index/Field.CAP (mut i64) (i64.const 8))
 (global $assembly/index/Field.AMOUNT (mut i64) (i64.const 10))
 (global $assembly/index/Field.HEIGHTSTART (mut i64) (i64.const 12))
 (global $assembly/index/Field.HEIGHTEND (mut i64) (i64.const 14))
 (global $assembly/index/Field.OFFSETSTART (mut i64) (i64.const 16))
 (global $assembly/index/Field.OFFSETEND (mut i64) (i64.const 18))
 (global $assembly/index/Field.MINT (mut i64) (i64.const 20))
 (global $assembly/index/Field.POINTER (mut i64) (i64.const 22))
 (global $assembly/index/Field.CENOTAPH (mut i64) (i64.const 126))
 (global $assembly/index/Field.DIVISIBILITY (mut i64) (i64.const 1))
 (global $assembly/index/Field.SPACERS (mut i64) (i64.const 3))
 (global $assembly/index/Field.SYMBOL (mut i64) (i64.const 5))
 (global $assembly/index/Field.NOP (mut i64) (i64.const 127))
 (global $assembly/index/Flag.ETCHING (mut i64) (i64.const 0))
 (global $assembly/index/Flag.TERMS (mut i64) (i64.const 1))
 (global $assembly/index/Flag.CENOTAPH (mut i64) (i64.const 127))
 (global $~lib/native/ASC_SHRINK_LEVEL i32 (i32.const 0))
 (global $~lib/builtins/usize.MAX_VALUE i32 (i32.const -1))
 (global $~lib/builtins/i32.MAX_VALUE i32 (i32.const 2147483647))
 (global $~lib/builtins/u32.MAX_VALUE i32 (i32.const -1))
 (global $~lib/memory/__heap_base i32 (i32.const 9724))
 (memory $0 1)
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
 (data $18 (i32.const 2220) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00(\00\00\00/\00b\00l\00o\00c\00k\00h\00a\00s\00h\00/\00b\00y\00h\00e\00i\00g\00h\00t\00/\00\00\00\00\00")
 (data $19 (i32.const 2284) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00(\00\00\00/\00h\00e\00i\00g\00h\00t\00/\00b\00y\00b\00l\00o\00c\00k\00h\00a\00s\00h\00/\00\00\00\00\00")
 (data $20 (i32.const 2348) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00&\00\00\00/\00h\00e\00i\00g\00h\00t\00/\00b\00y\00o\00u\00t\00p\00o\00i\00n\00t\00/\00\00\00\00\00\00\00")
 (data $21 (i32.const 2412) "L\00\00\00\00\00\00\00\00\00\00\00\02\00\00\000\00\00\00/\00t\00r\00a\00n\00s\00a\00c\00t\00i\00o\00n\00i\00d\00s\00/\00b\00y\00h\00e\00i\00g\00h\00t\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $22 (i32.const 2492) ",\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\1c\00\00\00/\00r\00u\00n\00e\00s\00/\00s\00y\00m\00b\00o\00l\00/\00")
 (data $23 (i32.const 2540) ",\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\16\00\00\00/\00r\00u\00n\00e\00s\00/\00c\00a\00p\00/\00\00\00\00\00\00\00")
 (data $24 (i32.const 2588) ",\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\1c\00\00\00/\00r\00u\00n\00e\00s\00/\00s\00p\00a\00c\00e\00s\00/\00")
 (data $25 (i32.const 2636) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00$\00\00\00/\00r\00u\00n\00e\00s\00/\00o\00f\00f\00s\00e\00t\00/\00e\00n\00d\00/\00\00\00\00\00\00\00\00\00")
 (data $26 (i32.const 2700) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00(\00\00\00/\00r\00u\00n\00e\00s\00/\00o\00f\00f\00s\00e\00t\00/\00s\00t\00a\00r\00t\00/\00\00\00\00\00")
 (data $27 (i32.const 2764) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00(\00\00\00/\00r\00u\00n\00e\00s\00/\00h\00e\00i\00g\00h\00t\00/\00s\00t\00a\00r\00t\00/\00\00\00\00\00")
 (data $28 (i32.const 2828) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00$\00\00\00/\00r\00u\00n\00e\00s\00/\00h\00e\00i\00g\00h\00t\00/\00e\00n\00d\00/\00\00\00\00\00\00\00\00\00")
 (data $29 (i32.const 2892) ",\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\1c\00\00\00/\00r\00u\00n\00e\00s\00/\00a\00m\00o\00u\00n\00t\00/\00")
 (data $30 (i32.const 2940) "L\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00.\00\00\00/\00r\00u\00n\00e\00s\00/\00m\00i\00n\00t\00s\00-\00r\00e\00m\00a\00i\00n\00i\00n\00g\00/\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $31 (i32.const 3020) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\1e\00\00\00/\00r\00u\00n\00e\00s\00/\00p\00r\00e\00m\00i\00n\00e\00/\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $32 (i32.const 3084) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00(\00\00\00/\00r\00u\00n\00e\00s\00/\00d\00i\00v\00i\00s\00i\00b\00i\00l\00i\00t\00y\00/\00\00\00\00\00")
 (data $33 (i32.const 3148) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\"\00\00\00/\00h\00e\00i\00g\00h\00t\00/\00b\00y\00r\00u\00n\00e\00i\00d\00/\00\00\00\00\00\00\00\00\00\00\00")
 (data $34 (i32.const 3212) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00$\00\00\00/\00e\00t\00c\00h\00i\00n\00g\00/\00b\00y\00r\00u\00n\00e\00i\00d\00/\00\00\00\00\00\00\00\00\00")
 (data $35 (i32.const 3276) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00$\00\00\00/\00r\00u\00n\00e\00i\00d\00/\00b\00y\00e\00t\00c\00h\00i\00n\00g\00/\00\00\00\00\00\00\00\00\00")
 (data $36 (i32.const 3340) ",\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\1a\00\00\00~\00l\00i\00b\00/\00a\00r\00r\00a\00y\00.\00t\00s\00\00\00")
 (data $37 (i32.const 3388) "|\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00^\00\00\00E\00l\00e\00m\00e\00n\00t\00 \00t\00y\00p\00e\00 \00m\00u\00s\00t\00 \00b\00e\00 \00n\00u\00l\00l\00a\00b\00l\00e\00 \00i\00f\00 \00a\00r\00r\00a\00y\00 \00i\00s\00 \00h\00o\00l\00e\00y\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $38 (i32.const 3516) "\1c\00\00\00\00\00\00\00\00\00\00\00\19\00\00\00\08\00\00\00\01\00\00\00\00\00\00\00\00\00\00\00")
 (data $39 (i32.const 3548) "\1c\00\00\00\00\00\00\00\00\00\00\00\1a\00\00\00\08\00\00\00\02\00\00\00\00\00\00\00\00\00\00\00")
 (data $40 (i32.const 3580) "\1c\00\00\00\00\00\00\00\00\00\00\00\1c\00\00\00\08\00\00\00\03\00\00\00\00\00\00\00\00\00\00\00")
 (data $41 (i32.const 3612) ",\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\0e\00\00\00/\00l\00e\00n\00g\00t\00h\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $42 (i32.const 3660) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00$\00\00\00K\00e\00y\00 \00d\00o\00e\00s\00 \00n\00o\00t\00 \00e\00x\00i\00s\00t\00\00\00\00\00\00\00\00\00")
 (data $43 (i32.const 3724) ",\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\16\00\00\00~\00l\00i\00b\00/\00m\00a\00p\00.\00t\00s\00\00\00\00\00\00\00")
 (data $44 (i32.const 3772) "\1c\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\02\00\00\00/\00\00\00\00\00\00\00\00\00\00\00")
 (data $45 (i32.const 3804) "|\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00d\00\00\00t\00o\00S\00t\00r\00i\00n\00g\00(\00)\00 \00r\00a\00d\00i\00x\00 \00a\00r\00g\00u\00m\00e\00n\00t\00 \00m\00u\00s\00t\00 \00b\00e\00 \00b\00e\00t\00w\00e\00e\00n\00 \002\00 \00a\00n\00d\00 \003\006\00\00\00\00\00\00\00\00\00")
 (data $46 (i32.const 3932) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00&\00\00\00~\00l\00i\00b\00/\00u\00t\00i\00l\00/\00n\00u\00m\00b\00e\00r\00.\00t\00s\00\00\00\00\00\00\00")
 (data $47 (i32.const 3996) "\1c\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\02\00\00\000\00\00\00\00\00\00\00\00\00\00\00")
 (data $48 (i32.const 4028) "0\000\000\001\000\002\000\003\000\004\000\005\000\006\000\007\000\008\000\009\001\000\001\001\001\002\001\003\001\004\001\005\001\006\001\007\001\008\001\009\002\000\002\001\002\002\002\003\002\004\002\005\002\006\002\007\002\008\002\009\003\000\003\001\003\002\003\003\003\004\003\005\003\006\003\007\003\008\003\009\004\000\004\001\004\002\004\003\004\004\004\005\004\006\004\007\004\008\004\009\005\000\005\001\005\002\005\003\005\004\005\005\005\006\005\007\005\008\005\009\006\000\006\001\006\002\006\003\006\004\006\005\006\006\006\007\006\008\006\009\007\000\007\001\007\002\007\003\007\004\007\005\007\006\007\007\007\008\007\009\008\000\008\001\008\002\008\003\008\004\008\005\008\006\008\007\008\008\008\009\009\000\009\001\009\002\009\003\009\004\009\005\009\006\009\007\009\008\009\009\00")
 (data $49 (i32.const 4428) "\1c\04\00\00\00\00\00\00\00\00\00\00\02\00\00\00\00\04\00\000\000\000\001\000\002\000\003\000\004\000\005\000\006\000\007\000\008\000\009\000\00a\000\00b\000\00c\000\00d\000\00e\000\00f\001\000\001\001\001\002\001\003\001\004\001\005\001\006\001\007\001\008\001\009\001\00a\001\00b\001\00c\001\00d\001\00e\001\00f\002\000\002\001\002\002\002\003\002\004\002\005\002\006\002\007\002\008\002\009\002\00a\002\00b\002\00c\002\00d\002\00e\002\00f\003\000\003\001\003\002\003\003\003\004\003\005\003\006\003\007\003\008\003\009\003\00a\003\00b\003\00c\003\00d\003\00e\003\00f\004\000\004\001\004\002\004\003\004\004\004\005\004\006\004\007\004\008\004\009\004\00a\004\00b\004\00c\004\00d\004\00e\004\00f\005\000\005\001\005\002\005\003\005\004\005\005\005\006\005\007\005\008\005\009\005\00a\005\00b\005\00c\005\00d\005\00e\005\00f\006\000\006\001\006\002\006\003\006\004\006\005\006\006\006\007\006\008\006\009\006\00a\006\00b\006\00c\006\00d\006\00e\006\00f\007\000\007\001\007\002\007\003\007\004\007\005\007\006\007\007\007\008\007\009\007\00a\007\00b\007\00c\007\00d\007\00e\007\00f\008\000\008\001\008\002\008\003\008\004\008\005\008\006\008\007\008\008\008\009\008\00a\008\00b\008\00c\008\00d\008\00e\008\00f\009\000\009\001\009\002\009\003\009\004\009\005\009\006\009\007\009\008\009\009\009\00a\009\00b\009\00c\009\00d\009\00e\009\00f\00a\000\00a\001\00a\002\00a\003\00a\004\00a\005\00a\006\00a\007\00a\008\00a\009\00a\00a\00a\00b\00a\00c\00a\00d\00a\00e\00a\00f\00b\000\00b\001\00b\002\00b\003\00b\004\00b\005\00b\006\00b\007\00b\008\00b\009\00b\00a\00b\00b\00b\00c\00b\00d\00b\00e\00b\00f\00c\000\00c\001\00c\002\00c\003\00c\004\00c\005\00c\006\00c\007\00c\008\00c\009\00c\00a\00c\00b\00c\00c\00c\00d\00c\00e\00c\00f\00d\000\00d\001\00d\002\00d\003\00d\004\00d\005\00d\006\00d\007\00d\008\00d\009\00d\00a\00d\00b\00d\00c\00d\00d\00d\00e\00d\00f\00e\000\00e\001\00e\002\00e\003\00e\004\00e\005\00e\006\00e\007\00e\008\00e\009\00e\00a\00e\00b\00e\00c\00e\00d\00e\00e\00e\00f\00f\000\00f\001\00f\002\00f\003\00f\004\00f\005\00f\006\00f\007\00f\008\00f\009\00f\00a\00f\00b\00f\00c\00f\00d\00f\00e\00f\00f\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $50 (i32.const 5484) "\\\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00H\00\00\000\001\002\003\004\005\006\007\008\009\00a\00b\00c\00d\00e\00f\00g\00h\00i\00j\00k\00l\00m\00n\00o\00p\00q\00r\00s\00t\00u\00v\00w\00x\00y\00z\00\00\00\00\00")
 (data $51 (i32.const 5580) "\1c\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $52 (i32.const 5612) "\1c\00\00\00\00\00\00\00\00\00\00\00\1f\00\00\00\08\00\00\00\04\00\00\00\00\00\00\00\00\00\00\00")
 (data $53 (i32.const 5644) "\1c\00\00\00\00\00\00\00\00\00\00\00)\00\00\00\08\00\00\00\05\00\00\00\00\00\00\00\00\00\00\00")
 (data $54 (i32.const 5676) "\1c\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\0c\00\00\00/\00r\00u\00n\00e\00s\00")
 (data $55 (i32.const 5708) ",\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\12\00\00\00/\00b\00a\00l\00a\00n\00c\00e\00s\00\00\00\00\00\00\00\00\00\00\00")
 (data $56 (i32.const 5756) "l\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00N\00\00\00~\00l\00i\00b\00/\00a\00s\00-\00b\00i\00g\00n\00u\00m\00/\00a\00s\00s\00e\00m\00b\00l\00y\00/\00i\00n\00t\00e\00g\00e\00r\00/\00u\001\002\008\00.\00t\00s\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $57 (i32.const 5868) "\1c\00\00\00\00\00\00\00\00\00\00\00/\00\00\00\08\00\00\00\06\00\00\00\00\00\00\00\00\00\00\00")
 (data $58 (i32.const 5900) "\1c\00\00\00\00\00\00\00\00\00\00\000\00\00\00\08\00\00\00\07\00\00\00\00\00\00\00\00\00\00\00")
 (data $59 (i32.const 5932) "\1c\00\00\00\00\00\00\00\00\00\00\001\00\00\00\08\00\00\00\08\00\00\00\00\00\00\00\00\00\00\00")
 (data $60 (i32.const 5964) "\1c\00\00\00\00\00\00\00\00\00\00\007\00\00\00\08\00\00\00\t\00\00\00\00\00\00\00\00\00\00\00")
 (data $61 (i32.const 5996) "\1c\00\00\00\00\00\00\00\00\00\00\008\00\00\00\08\00\00\00\n\00\00\00\00\00\00\00\00\00\00\00")
 (data $62 (i32.const 6028) "\1c\00\00\00\00\00\00\00\00\00\00\009\00\00\00\08\00\00\00\0b\00\00\00\00\00\00\00\00\00\00\00")
 (data $63 (i32.const 6060) "\1c\00\00\00\00\00\00\00\00\00\00\00:\00\00\00\08\00\00\00\0c\00\00\00\00\00\00\00\00\00\00\00")
 (data $64 (i32.const 6092) "\1c\00\00\00\00\00\00\00\00\00\00\00:\00\00\00\08\00\00\00\r\00\00\00\00\00\00\00\00\00\00\00")
 (data $65 (i32.const 6124) "\8c\04\00\00\00\00\00\00\00\00\00\00\02\00\00\00t\04\00\000\001\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\003\00b\00a\003\00e\00d\00f\00d\007\00a\007\00b\001\002\00b\002\007\00a\00c\007\002\00c\003\00e\006\007\007\006\008\00f\006\001\007\00f\00c\008\001\00b\00c\003\008\008\008\00a\005\001\003\002\003\00a\009\00f\00b\008\00a\00a\004\00b\001\00e\005\00e\004\00a\002\009\00a\00b\005\00f\004\009\00f\00f\00f\00f\000\000\001\00d\001\00d\00a\00c\002\00b\007\00c\000\001\000\001\000\000\000\000\000\000\000\001\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\00f\00f\00f\00f\00f\00f\00f\00f\004\00d\000\004\00f\00f\00f\00f\000\000\001\00d\000\001\000\004\004\005\005\004\006\008\006\005\002\000\005\004\006\009\006\00d\006\005\007\003\002\000\003\000\003\003\002\00f\004\00a\006\001\006\00e\002\00f\003\002\003\000\003\000\003\009\002\000\004\003\006\008\006\001\006\00e\006\003\006\005\006\00c\006\00c\006\00f\007\002\002\000\006\00f\006\00e\002\000\006\002\007\002\006\009\006\00e\006\00b\002\000\006\00f\006\006\002\000\007\003\006\005\006\003\006\00f\006\00e\006\004\002\000\006\002\006\001\006\009\006\00c\006\00f\007\005\007\004\002\000\006\006\006\00f\007\002\002\000\006\002\006\001\006\00e\006\00b\007\003\00f\00f\00f\00f\00f\00f\00f\00f\000\001\000\000\00f\002\000\005\002\00a\000\001\000\000\000\000\000\000\004\003\004\001\000\004\006\007\008\00a\00f\00d\00b\000\00f\00e\005\005\004\008\002\007\001\009\006\007\00f\001\00a\006\007\001\003\000\00b\007\001\000\005\00c\00d\006\00a\008\002\008\00e\000\003\009\000\009\00a\006\007\009\006\002\00e\000\00e\00a\001\00f\006\001\00d\00e\00b\006\004\009\00f\006\00b\00c\003\00f\004\00c\00e\00f\003\008\00c\004\00f\003\005\005\000\004\00e\005\001\00e\00c\001\001\002\00d\00e\005\00c\003\008\004\00d\00f\007\00b\00a\000\00b\008\00d\005\007\008\00a\004\00c\007\000\002\00b\006\00b\00f\001\001\00d\005\00f\00a\00c\000\000\000\000\000\000\000\000\00\00\00\00\00\00\00\00\00")
 (data $66 (i32.const 7292) "|\t\00\00\00\00\00\00\00\00\00\00\02\00\00\00h\t\00\000\002\000\000\000\000\000\000\000\000\000\001\000\002\008\001\007\006\003\00d\006\000\007\00e\007\005\009\009\00d\00d\00e\007\003\002\00f\00a\002\00c\003\00e\007\00b\005\003\00f\00f\004\00c\003\00d\000\009\007\00c\00e\008\009\002\008\007\00f\00c\002\007\006\00d\008\00d\00f\00e\009\00e\008\008\006\004\009\002\000\002\000\000\000\000\000\000\000\000\000\005\000\000\000\000\000\000\00d\00f\009\00c\005\007\00a\008\003\00f\009\000\000\00c\000\009\00f\00a\00a\00e\009\003\006\008\006\00b\00d\00f\006\006\002\00d\009\00c\00c\00b\005\00e\00a\00b\002\002\00c\009\00b\003\001\008\004\00a\000\007\001\006\006\004\00e\00b\001\008\00e\008\006\005\000\000\000\000\000\000\000\000\000\000\000\005\000\000\000\000\000\000\000\005\007\008\000\003\000\000\000\000\000\000\000\000\000\000\000\000\002\002\005\001\002\000\001\00a\000\002\000\005\000\009\00b\00f\00f\004\009\006\00a\000\00e\00e\00f\004\00b\009\004\004\004\00f\008\000\004\00e\002\004\00c\009\003\009\004\00a\000\004\003\00e\008\00e\007\001\009\006\005\00b\00a\00a\002\000\000\00a\00b\00b\00c\004\00d\000\009\005\007\008\000\003\000\000\000\000\000\000\000\000\000\000\000\000\002\002\005\001\002\000\008\00f\004\004\002\005\007\000\00a\000\00d\00b\009\000\00e\005\00b\003\004\005\005\005\007\003\002\001\002\00c\008\00e\00d\00f\009\004\002\005\00c\00b\000\005\00b\00d\006\001\009\004\00e\007\000\007\006\006\00a\00a\001\007\00c\004\009\00b\003\00c\000\00c\001\000\002\007\000\000\000\000\000\000\000\000\000\000\000\000\002\002\005\001\002\000\00e\003\00a\002\00c\004\004\001\005\005\00e\008\000\00b\00b\00b\007\009\001\00f\000\001\002\001\008\009\003\003\009\002\00b\000\002\00f\008\000\004\00a\00a\000\007\003\006\000\00a\002\002\00b\001\008\008\006\001\00b\009\00b\008\00d\00d\001\003\005\00e\001\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\001\00f\006\00a\005\00d\001\00c\000\002\000\001\000\004\00c\004\00a\001\00a\008\00e\001\008\00b\00b\00d\008\00a\00f\005\008\00c\008\003\000\001\000\003\008\008\000\008\000\005\00c\008\005\003\000\006\008\000\00a\004\00c\00a\009\00d\004\00e\001\006\000\002\002\000\004\00e\000\000\000\000\000\000\000\000\000\000\000\000\002\002\005\001\002\000\000\000\00b\009\006\006\005\00e\003\00d\005\006\004\00a\009\009\00f\000\00f\002\000\00d\007\008\002\009\00f\005\008\00f\002\00a\004\003\00e\000\00a\006\000\00c\00c\004\000\009\002\001\00d\008\00b\003\002\00d\001\009\008\005\00c\000\00b\007\00b\004\00e\007\000\001\004\000\004\003\006\00f\002\005\009\00c\00a\004\003\00d\00c\00b\005\005\008\008\008\005\008\005\006\00e\009\00f\00e\003\00b\00e\00d\00e\00e\005\00b\00d\00e\00c\007\005\00b\007\001\004\00a\007\009\00c\005\004\004\005\00e\00d\003\00b\00b\005\006\00d\00c\004\001\004\00b\00a\00f\002\000\009\00a\00d\004\000\00e\00e\004\003\00a\008\000\001\001\005\00c\004\00c\007\006\003\009\001\001\005\009\007\00b\003\004\00e\009\00c\001\00a\004\009\00b\00f\00c\009\00d\005\002\00e\00b\003\004\004\00b\00d\008\00b\001\007\006\004\00c\005\000\003\004\000\002\005\001\00d\004\006\00d\009\006\009\001\004\00b\007\003\002\001\005\004\00c\00a\009\00c\001\002\007\008\005\002\009\00e\003\00c\00a\001\004\007\001\004\007\007\000\00e\006\00a\000\007\00a\002\00c\006\00d\005\00f\005\00b\009\00d\005\001\00f\009\00b\006\00e\006\003\001\000\001\00a\002\00c\008\007\005\00d\004\002\00a\008\004\004\006\00f\00a\002\00f\006\006\00a\00a\00c\002\007\009\00e\002\005\00f\00a\00d\007\009\007\004\004\007\00d\006\007\000\00e\00b\007\00c\00c\001\001\001\00c\009\00e\000\006\00b\000\00d\008\001\002\000\00e\00d\002\004\007\003\001\003\005\009\007\00e\005\00e\00a\00d\00c\009\005\00a\000\009\00e\006\00c\003\004\006\004\003\00f\00d\004\00f\006\00e\00d\00d\004\00d\00a\00d\000\004\006\00c\00c\001\005\005\00d\005\006\000\009\00c\000\005\00a\008\001\006\001\001\00a\00c\000\000\006\003\000\003\006\00f\007\002\006\004\000\001\000\003\002\001\008\001\007\006\003\00d\006\000\007\00e\007\005\009\009\00d\00d\00e\007\003\002\00f\00a\002\00c\003\00e\007\00b\005\003\00f\00f\004\00c\003\00d\000\009\007\00c\00e\008\009\002\008\007\00f\00c\002\007\006\00d\008\00d\00f\00e\009\00e\008\008\006\004\009\002\000\001\000\001\000\00b\002\000\006\004\00e\00c\008\002\00c\004\001\007\002\007\00c\006\00d\00b\00a\000\00d\009\00d\006\001\005\005\009\004\003\006\00a\006\005\007\00a\00e\006\002\00c\00d\00b\009\004\004\006\002\000\005\006\00c\002\009\007\003\003\001\00e\008\006\008\000\000\004\00d\004\000\001\000\002\000\002\007\008\000\003\000\001\000\00d\000\009\00c\004\001\000\002\00a\00b\00c\00e\008\002\009\00e\00a\008\00c\004\001\006\008\002\001\00c\000\00e\00d\002\004\007\003\001\003\005\009\007\00e\005\00e\00a\00d\00c\009\005\00a\000\009\00e\006\00c\003\004\006\004\003\00f\00d\004\00f\006\00e\00d\00d\004\00d\00a\00d\000\004\006\00c\00c\001\005\005\00d\005\006\000\009\00c\000\005\00a\008\001\006\001\001\003\00f\00d\001\000\00c\000\000\00\00\00\00\00")
 (table $0 14 14 funcref)
 (elem $0 (i32.const 1) $~lib/metashrew-as/assembly/utils/box/Box.concat~anonymous|0 $~lib/metashrew-as/assembly/utils/box/Box.concat~anonymous|1 $~lib/metashrew-as/assembly/utils/utils/concat~anonymous|0 $assembly/index/Index.indexBlock~anonymous|0 $assembly/index/Edict.fromDeltaSeries~anonymous|0 $assembly/index/Index.indexBlock~anonymous|1 $assembly/index/BalanceSheet.concat~anonymous|0 $assembly/index/fieldToArrayBuffer~anonymous|0 $~lib/metashrew-as/assembly/indexer/index/_flush~anonymous|0 $~lib/metashrew-as/assembly/utils/rlp/toRLP~anonymous|0 $~lib/metashrew-as/assembly/utils/rlp/toRLP~anonymous|1 $~lib/metashrew-as/assembly/utils/rlp/toRLP~anonymous|2 $~lib/metashrew-as/assembly/utils/rlp/toRLP~anonymous|3)
 (export "trap" (func $assembly/index/trap))
 (export "_start" (func $assembly/index/_start))
 (export "test_indexEtching" (func $assembly/index/test_indexEtching))
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
  call $start:~lib/metashrew-as/assembly/blockdata/address
 )
 (func $start:~lib/metashrew-as/assembly/blockdata/block
  call $start:~lib/metashrew-as/assembly/blockdata/transaction
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
 (func $start:assembly/index
  call $start:~lib/metashrew-as/assembly/indexer/index
  call $start:~lib/metashrew-as/assembly/utils/yabsp
  call $start:~lib/metashrew-as/assembly/blockdata/block
  i32.const 2240
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer.for
  global.set $assembly/index/HEIGHT_TO_BLOCKHASH
  i32.const 2304
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer.for
  global.set $assembly/index/BLOCKHASH_TO_HEIGHT
  i32.const 2304
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer.for
  global.set $assembly/index/OUTPOINT_TO_RUNES
  i32.const 2368
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer.for
  global.set $assembly/index/OUTPOINT_TO_HEIGHT
  i32.const 2432
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer.for
  global.set $assembly/index/HEIGHT_TO_TRANSACTION_IDS
  i32.const 2512
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer.for
  global.set $assembly/index/SYMBOL
  i32.const 2560
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer.for
  global.set $assembly/index/CAP
  i32.const 2608
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer.for
  global.set $assembly/index/SPACERS
  i32.const 2656
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer.for
  global.set $assembly/index/OFFSETEND
  i32.const 2720
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer.for
  global.set $assembly/index/OFFSETSTART
  i32.const 2784
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer.for
  global.set $assembly/index/HEIGHTSTART
  i32.const 2848
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer.for
  global.set $assembly/index/HEIGHTEND
  i32.const 2912
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer.for
  global.set $assembly/index/AMOUNT
  i32.const 2960
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer.for
  global.set $assembly/index/MINTS_REMAINING
  i32.const 3040
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer.for
  global.set $assembly/index/PREMINE
  i32.const 3104
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer.for
  global.set $assembly/index/DIVISIBILITY
  i32.const 3168
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer.for
  global.set $assembly/index/RUNE_ID_TO_HEIGHT
  i32.const 3232
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer.for
  global.set $assembly/index/RUNE_ID_TO_ETCHING
  i32.const 3296
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer.for
  global.set $assembly/index/ETCHING_TO_RUNE_ID
 )
 (func $assembly/index/trap
  unreachable
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
   i32.const 9
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
   i32.const 11
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
   i32.const 20
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
   i32.const 3360
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
   i32.const 17
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
   i32.const 3360
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
   i32.const 19
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
   i32.const 3360
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
   i32.const 13
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
    i32.const 3360
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
    i32.const 3360
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
   i32.const 18
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
   i32.const 16
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
   i32.const 3360
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
   i32.const 15
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
    i32.const 3360
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
   i32.const 14
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
   i32.const 3360
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
   i32.const 3408
   i32.const 3360
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
   i32.const 12
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
    i32.const 3360
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
   i32.const 10
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
    i32.const 3360
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
  i32.const 3536
  i32.const 0
  call $~lib/array/Array<~lib/metashrew-as/assembly/utils/box/Box>#reduce<i32>
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.set $result
  local.get $data
  i32.const 3568
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
  i32.const 23
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
    i32.const 3360
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
  i32.const 23
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
  i32.const 3600
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
  i32.const 27
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
   i32.const 3360
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
   i32.const 3408
   i32.const 3360
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
   i32.const 23
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
   i32.const 3360
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
 (func $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#lengthKey (param $this i32) (result i32)
  local.get $this
  i32.const 3632
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#keyword
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
   i32.const 3680
   i32.const 3744
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
 (func $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#append (param $this i32) (param $v i32)
  local.get $this
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#extend
  local.get $v
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#set
 )
 (func $assembly/index/RunesBlock#saveTransactions (param $this i32) (param $index i32)
  (local $i i32)
  (local $this|3 i32)
  (local $index|4 i32)
  i32.const 0
  local.set $i
  loop $for-loop|0
   local.get $i
   local.get $this
   call $~lib/metashrew-as/assembly/blockdata/block/Block#get:transactions
   call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Transaction>#get:length
   i32.lt_s
   if
    local.get $index
    block $assembly/index/RunesBlock#getTransaction|inlined.0 (result i32)
     local.get $this
     local.set $this|3
     local.get $i
     local.set $index|4
     local.get $this|3
     call $~lib/metashrew-as/assembly/blockdata/block/Block#get:transactions
     local.get $index|4
     call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Transaction>#__get
     br $assembly/index/RunesBlock#getTransaction|inlined.0
    end
    call $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#txid
    call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#append
    local.get $i
    i32.const 1
    i32.add
    local.set $i
    br $for-loop|0
   end
  end
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
  i32.const 27
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
 (func $assembly/index/Index.indexOutpoints (param $tx i32) (param $txid i32) (param $height i32)
  (local $i i32)
  i32.const 0
  local.set $i
  loop $for-loop|0
   local.get $i
   local.get $tx
   call $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#get:outs
   call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Output>#get:length
   i32.lt_s
   if
    global.get $assembly/index/OUTPOINT_TO_HEIGHT
    local.get $txid
    local.get $i
    call $~lib/metashrew-as/assembly/blockdata/transaction/OutPoint.from
    call $~lib/metashrew-as/assembly/blockdata/transaction/OutPoint#toArrayBuffer
    call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
    local.get $height
    call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#setValue<u32>
    local.get $i
    i32.const 1
    i32.add
    local.set $i
    br $for-loop|0
   end
  end
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Output>#__get (param $this i32) (param $index i32) (result i32)
  (local $value i32)
  local.get $index
  local.get $this
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Output>#get:length_
  i32.ge_u
  if
   i32.const 2112
   i32.const 3360
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
   i32.const 3408
   i32.const 3360
   i32.const 118
   i32.const 40
   call $~lib/builtins/abort
   unreachable
  end
  local.get $value
  return
 )
 (func $~lib/metashrew-as/assembly/blockdata/transaction/Output#get:script (param $this i32) (result i32)
  local.get $this
  i32.load offset=16
 )
 (func $assembly/index/RunesTransaction#runestoneOutputIndex (param $this i32) (result i32)
  (local $i i32)
  i32.const 0
  local.set $i
  loop $for-loop|0
   local.get $i
   local.get $this
   call $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#get:outs
   call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Output>#get:length
   i32.lt_s
   if
    local.get $this
    call $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#get:outs
    local.get $i
    call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Output>#__get
    call $~lib/metashrew-as/assembly/blockdata/transaction/Output#get:script
    call $~lib/metashrew-as/assembly/utils/box/Box#get:start
    i32.load16_u
    global.get $assembly/index/RUNESTONE_TAG
    i32.eq
    if
     local.get $i
     return
    end
    local.get $i
    i32.const 1
    i32.add
    local.set $i
    br $for-loop|0
   end
  end
  i32.const -1
  return
 )
 (func $assembly/index/RunesTransaction#outpoint (param $this i32) (param $vout i32) (result i32)
  local.get $this
  call $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#txid
  local.get $vout
  call $~lib/metashrew-as/assembly/blockdata/transaction/OutPoint.from
  call $~lib/metashrew-as/assembly/blockdata/transaction/OutPoint#toArrayBuffer
  return
 )
 (func $~lib/metashrew-as/assembly/utils/yabsp/scriptParse (param $data i32) (result i32)
  (local $stack i32)
  (local $view i32)
  (local $value i32)
  (local $opcode i32)
  (local $5 i32)
  i32.const 0
  i32.const 0
  call $~lib/array/Array<~lib/metashrew-as/assembly/utils/box/Box>#constructor
  local.set $stack
  local.get $data
  i32.const 0
  call $~lib/metashrew-as/assembly/utils/box/Box#sliceFrom
  local.set $view
  loop $while-continue|0
   local.get $view
   call $~lib/metashrew-as/assembly/utils/box/Box#get:len
   i32.const 0
   i32.gt_u
   if
    local.get $view
    call $~lib/metashrew-as/assembly/utils/utils/parsePrimitive<u8>
    local.set $value
    i32.const 0
    global.get $~lib/builtins/usize.MAX_VALUE
    local.get $value
    call $~lib/metashrew-as/assembly/utils/box/Box#constructor
    local.set $opcode
    local.get $value
    i32.const 1
    i32.ge_u
    if (result i32)
     local.get $value
     i32.const 78
     i32.le_u
    else
     i32.const 0
    end
    if
     block $break|1
      block $case3|1
       block $case2|1
        block $case1|1
         block $case0|1
          local.get $value
          local.set $5
          local.get $5
          i32.const 76
          i32.eq
          br_if $case0|1
          local.get $5
          i32.const 77
          i32.eq
          br_if $case1|1
          local.get $5
          i32.const 78
          i32.eq
          br_if $case2|1
          br $case3|1
         end
         local.get $stack
         local.get $view
         local.get $view
         call $~lib/metashrew-as/assembly/utils/utils/parsePrimitive<u8>
         call $~lib/metashrew-as/assembly/utils/utils/parseBytes
         call $~lib/array/Array<~lib/metashrew-as/assembly/utils/box/Box>#push
         drop
         br $break|1
        end
        local.get $stack
        local.get $view
        local.get $view
        call $~lib/metashrew-as/assembly/utils/utils/parsePrimitive<u16>
        call $~lib/metashrew-as/assembly/utils/utils/parseBytes
        call $~lib/array/Array<~lib/metashrew-as/assembly/utils/box/Box>#push
        drop
        br $break|1
       end
       local.get $stack
       local.get $view
       local.get $view
       call $~lib/metashrew-as/assembly/utils/utils/parsePrimitive<u32>
       call $~lib/metashrew-as/assembly/utils/utils/parseBytes
       call $~lib/array/Array<~lib/metashrew-as/assembly/utils/box/Box>#push
       drop
       br $break|1
      end
      local.get $stack
      local.get $view
      local.get $value
      call $~lib/metashrew-as/assembly/utils/utils/parseBytes
      call $~lib/array/Array<~lib/metashrew-as/assembly/utils/box/Box>#push
      drop
     end
    else
     local.get $stack
     local.get $opcode
     call $~lib/array/Array<~lib/metashrew-as/assembly/utils/box/Box>#push
     drop
    end
    br $while-continue|0
   end
  end
  local.get $stack
  return
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/utils/box/Box>#slice (param $this i32) (param $start i32) (param $end i32) (result i32)
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
  call $~lib/array/Array<~lib/metashrew-as/assembly/utils/box/Box>#get:length_
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
  i32.const 23
  i32.const 0
  call $~lib/rt/__newArray
  local.set $slice
  local.get $slice
  call $~lib/array/Array<~lib/metashrew-as/assembly/utils/box/Box>#get:dataStart
  local.set $sliceBase
  local.get $this
  call $~lib/array/Array<~lib/metashrew-as/assembly/utils/box/Box>#get:dataStart
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
 (func $~lib/array/Array<~lib/metashrew-as/assembly/utils/box/Box>#slice@varargs (param $this i32) (param $start i32) (param $end i32) (result i32)
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
  call $~lib/array/Array<~lib/metashrew-as/assembly/utils/box/Box>#slice
 )
 (func $assembly/index/Index.indexBlock~anonymous|0 (param $v i32) (param $i i32) (param $ary i32) (result i32)
  local.get $v
  call $~lib/metashrew-as/assembly/utils/box/Box#get:start
  global.get $~lib/builtins/usize.MAX_VALUE
  i32.eq
  return
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/utils/box/Box>#findIndex (param $this i32) (param $fn i32) (result i32)
  (local $i i32)
  (local $len i32)
  (local $4 i32)
  (local $5 i32)
  i32.const 0
  local.set $i
  local.get $this
  call $~lib/array/Array<~lib/metashrew-as/assembly/utils/box/Box>#get:length_
  local.set $len
  loop $for-loop|0
   local.get $i
   local.get $len
   local.tee $4
   local.get $this
   call $~lib/array/Array<~lib/metashrew-as/assembly/utils/box/Box>#get:length_
   local.tee $5
   local.get $4
   local.get $5
   i32.lt_s
   select
   i32.lt_s
   if
    local.get $this
    call $~lib/array/Array<~lib/metashrew-as/assembly/utils/box/Box>#get:dataStart
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
    if
     local.get $i
     return
    end
    local.get $i
    i32.const 1
    i32.add
    local.set $i
    br $for-loop|0
   end
  end
  i32.const -1
  return
 )
 (func $"~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#set:buckets" (param $this i32) (param $buckets i32)
  local.get $this
  local.get $buckets
  i32.store
  local.get $this
  local.get $buckets
  i32.const 0
  call $~lib/rt/stub/__link
 )
 (func $"~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#set:bucketsMask" (param $this i32) (param $bucketsMask i32)
  local.get $this
  local.get $bucketsMask
  i32.store offset=4
 )
 (func $"~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#set:entries" (param $this i32) (param $entries i32)
  local.get $this
  local.get $entries
  i32.store offset=8
  local.get $this
  local.get $entries
  i32.const 0
  call $~lib/rt/stub/__link
 )
 (func $"~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#set:entriesCapacity" (param $this i32) (param $entriesCapacity i32)
  local.get $this
  local.get $entriesCapacity
  i32.store offset=12
 )
 (func $"~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#set:entriesOffset" (param $this i32) (param $entriesOffset i32)
  local.get $this
  local.get $entriesOffset
  i32.store offset=16
 )
 (func $"~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#set:entriesCount" (param $this i32) (param $entriesCount i32)
  local.get $this
  local.get $entriesCount
  i32.store offset=20
 )
 (func $"~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#constructor" (param $this i32) (result i32)
  local.get $this
  i32.eqz
  if
   i32.const 24
   i32.const 35
   call $~lib/rt/stub/__new
   local.set $this
  end
  local.get $this
  i32.const 0
  i32.const 4
  i32.const 4
  i32.mul
  call $~lib/arraybuffer/ArrayBuffer#constructor
  call $"~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#set:buckets"
  local.get $this
  i32.const 4
  i32.const 1
  i32.sub
  call $"~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#set:bucketsMask"
  local.get $this
  i32.const 0
  i32.const 4
  block $"~lib/map/ENTRY_SIZE<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>|inlined.0" (result i32)
   i32.const 16
   br $"~lib/map/ENTRY_SIZE<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>|inlined.0"
  end
  i32.mul
  call $~lib/arraybuffer/ArrayBuffer#constructor
  call $"~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#set:entries"
  local.get $this
  i32.const 4
  call $"~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#set:entriesCapacity"
  local.get $this
  i32.const 0
  call $"~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#set:entriesOffset"
  local.get $this
  i32.const 0
  call $"~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#set:entriesCount"
  local.get $this
 )
 (func $~lib/array/Array<~lib/staticarray/StaticArray<~lib/as-bignum/assembly/integer/u128/u128>>#set:buffer (param $this i32) (param $buffer i32)
  local.get $this
  local.get $buffer
  i32.store
  local.get $this
  local.get $buffer
  i32.const 0
  call $~lib/rt/stub/__link
 )
 (func $~lib/array/Array<~lib/staticarray/StaticArray<~lib/as-bignum/assembly/integer/u128/u128>>#set:dataStart (param $this i32) (param $dataStart i32)
  local.get $this
  local.get $dataStart
  i32.store offset=4
 )
 (func $~lib/array/Array<~lib/staticarray/StaticArray<~lib/as-bignum/assembly/integer/u128/u128>>#set:byteLength (param $this i32) (param $byteLength i32)
  local.get $this
  local.get $byteLength
  i32.store offset=8
 )
 (func $~lib/array/Array<~lib/staticarray/StaticArray<~lib/as-bignum/assembly/integer/u128/u128>>#set:length_ (param $this i32) (param $length_ i32)
  local.get $this
  local.get $length_
  i32.store offset=12
 )
 (func $~lib/array/Array<~lib/staticarray/StaticArray<~lib/as-bignum/assembly/integer/u128/u128>>#constructor (param $this i32) (param $length i32) (result i32)
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
  call $~lib/array/Array<~lib/staticarray/StaticArray<~lib/as-bignum/assembly/integer/u128/u128>>#set:buffer
  local.get $this
  i32.const 0
  call $~lib/array/Array<~lib/staticarray/StaticArray<~lib/as-bignum/assembly/integer/u128/u128>>#set:dataStart
  local.get $this
  i32.const 0
  call $~lib/array/Array<~lib/staticarray/StaticArray<~lib/as-bignum/assembly/integer/u128/u128>>#set:byteLength
  local.get $this
  i32.const 0
  call $~lib/array/Array<~lib/staticarray/StaticArray<~lib/as-bignum/assembly/integer/u128/u128>>#set:length_
  local.get $length
  i32.const 1073741820
  i32.const 2
  i32.shr_u
  i32.gt_u
  if
   i32.const 1376
   i32.const 3360
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
  call $~lib/array/Array<~lib/staticarray/StaticArray<~lib/as-bignum/assembly/integer/u128/u128>>#set:buffer
  local.get $this
  local.get $buffer
  call $~lib/array/Array<~lib/staticarray/StaticArray<~lib/as-bignum/assembly/integer/u128/u128>>#set:dataStart
  local.get $this
  local.get $bufferSize
  call $~lib/array/Array<~lib/staticarray/StaticArray<~lib/as-bignum/assembly/integer/u128/u128>>#set:byteLength
  local.get $this
  local.get $length
  call $~lib/array/Array<~lib/staticarray/StaticArray<~lib/as-bignum/assembly/integer/u128/u128>>#set:length_
  local.get $this
 )
 (func $~lib/as-bignum/assembly/integer/u128/u128#set:lo (param $this i32) (param $lo i64)
  local.get $this
  local.get $lo
  i64.store
 )
 (func $~lib/as-bignum/assembly/integer/u128/u128#set:hi (param $this i32) (param $hi i64)
  local.get $this
  local.get $hi
  i64.store offset=8
 )
 (func $~lib/as-bignum/assembly/integer/u128/u128#constructor (param $this i32) (param $lo i64) (param $hi i64) (result i32)
  local.get $this
  i32.eqz
  if
   i32.const 16
   i32.const 33
   call $~lib/rt/stub/__new
   local.set $this
  end
  local.get $this
  local.get $lo
  call $~lib/as-bignum/assembly/integer/u128/u128#set:lo
  local.get $this
  local.get $hi
  call $~lib/as-bignum/assembly/integer/u128/u128#set:hi
  local.get $this
 )
 (func $~lib/as-bignum/assembly/integer/u128/u128#get:lo (param $this i32) (result i64)
  local.get $this
  i64.load
 )
 (func $~lib/as-bignum/assembly/integer/u128/u128#get:hi (param $this i32) (result i64)
  local.get $this
  i64.load offset=8
 )
 (func $assembly/leb128/readULEB128ToU128 (param $buf i32) (param $to i32) (result i32)
  (local $slice i32)
  (local $shift i32)
  (local $value i32)
  (local $value|5 i64)
  (local $result i32)
  (local $byte i32)
  (local $value|8 i32)
  (local $value|9 i64)
  (local $value|10 i32)
  (local $shift|11 i32)
  (local $shift64 i64)
  (local $mod1 i64)
  (local $mod2 i64)
  (local $vl i64)
  (local $lo i64)
  (local $hi i64)
  (local $a i32)
  (local $b i32)
  local.get $buf
  i32.const 0
  call $~lib/metashrew-as/assembly/utils/box/Box#sliceFrom
  local.set $slice
  i32.const 0
  local.set $shift
  block $~lib/as-bignum/assembly/integer/u128/u128.from<i32>|inlined.1 (result i32)
   i32.const 0
   local.set $value
   i32.const 0
   drop
   i32.const 0
   drop
   i32.const 0
   drop
   i32.const 0
   drop
   i32.const 0
   drop
   i32.const 1
   drop
   block $~lib/as-bignum/assembly/integer/u128/u128.fromI64|inlined.1 (result i32)
    local.get $value
    i64.extend_i32_s
    local.set $value|5
    i32.const 0
    local.get $value|5
    local.get $value|5
    i64.const 63
    i64.shr_s
    call $~lib/as-bignum/assembly/integer/u128/u128#constructor
    br $~lib/as-bignum/assembly/integer/u128/u128.fromI64|inlined.1
   end
   br $~lib/as-bignum/assembly/integer/u128/u128.from<i32>|inlined.1
  end
  local.set $result
  i32.const 0
  local.set $byte
  block $while-break|0
   loop $while-continue|0
    i32.const 1
    if
     local.get $slice
     call $~lib/metashrew-as/assembly/utils/box/Box#get:len
     i32.const 0
     i32.eq
     if
      i32.const 0
      return
     end
     local.get $slice
     call $~lib/metashrew-as/assembly/utils/box/Box#get:start
     i32.load8_u
     local.set $byte
     local.get $slice
     i32.const 1
     call $~lib/metashrew-as/assembly/utils/box/Box#shrinkFront
     drop
     block $~lib/as-bignum/assembly/integer/u128/u128.or|inlined.0 (result i32)
      local.get $result
      local.set $a
      block $~lib/as-bignum/assembly/integer/u128/u128.shl|inlined.0 (result i32)
       block $~lib/as-bignum/assembly/integer/u128/u128.from<i32>|inlined.2 (result i32)
        local.get $byte
        i32.const 127
        i32.and
        local.set $value|8
        i32.const 0
        drop
        i32.const 0
        drop
        i32.const 0
        drop
        i32.const 0
        drop
        i32.const 0
        drop
        i32.const 1
        drop
        block $~lib/as-bignum/assembly/integer/u128/u128.fromI64|inlined.2 (result i32)
         local.get $value|8
         i64.extend_i32_s
         local.set $value|9
         i32.const 0
         local.get $value|9
         local.get $value|9
         i64.const 63
         i64.shr_s
         call $~lib/as-bignum/assembly/integer/u128/u128#constructor
         br $~lib/as-bignum/assembly/integer/u128/u128.fromI64|inlined.2
        end
        br $~lib/as-bignum/assembly/integer/u128/u128.from<i32>|inlined.2
       end
       local.set $value|10
       local.get $shift
       local.set $shift|11
       local.get $shift|11
       i32.const 127
       i32.and
       local.set $shift|11
       local.get $shift|11
       i64.extend_i32_s
       local.set $shift64
       local.get $shift64
       i64.const 127
       i64.add
       local.get $shift64
       i64.or
       i64.const 64
       i64.and
       i64.const 6
       i64.shr_u
       i64.const 1
       i64.sub
       local.set $mod1
       local.get $shift64
       i64.const 6
       i64.shr_u
       i64.const 1
       i64.sub
       local.set $mod2
       local.get $shift64
       i64.const 63
       i64.and
       local.set $shift64
       local.get $value|10
       call $~lib/as-bignum/assembly/integer/u128/u128#get:lo
       local.set $vl
       local.get $vl
       local.get $shift64
       i64.shl
       local.set $lo
       local.get $lo
       local.get $mod2
       i64.const -1
       i64.xor
       i64.and
       local.set $hi
       local.get $hi
       local.get $value|10
       call $~lib/as-bignum/assembly/integer/u128/u128#get:hi
       local.get $shift64
       i64.shl
       local.get $vl
       i64.const 64
       local.get $shift64
       i64.sub
       i64.shr_u
       local.get $mod1
       i64.and
       i64.or
       local.get $mod2
       i64.and
       i64.or
       local.set $hi
       i32.const 0
       local.get $lo
       local.get $mod2
       i64.and
       local.get $hi
       call $~lib/as-bignum/assembly/integer/u128/u128#constructor
       br $~lib/as-bignum/assembly/integer/u128/u128.shl|inlined.0
      end
      local.set $b
      i32.const 0
      local.get $a
      call $~lib/as-bignum/assembly/integer/u128/u128#get:lo
      local.get $b
      call $~lib/as-bignum/assembly/integer/u128/u128#get:lo
      i64.or
      local.get $a
      call $~lib/as-bignum/assembly/integer/u128/u128#get:hi
      local.get $b
      call $~lib/as-bignum/assembly/integer/u128/u128#get:hi
      i64.or
      call $~lib/as-bignum/assembly/integer/u128/u128#constructor
      br $~lib/as-bignum/assembly/integer/u128/u128.or|inlined.0
     end
     local.set $result
     local.get $byte
     i32.const 128
     i32.and
     i32.const 0
     i32.eq
     if
      br $while-break|0
     end
     local.get $shift
     i32.const 7
     i32.add
     local.set $shift
     br $while-continue|0
    end
   end
  end
  local.get $to
  local.get $result
  call $~lib/as-bignum/assembly/integer/u128/u128#get:hi
  call $~lib/as-bignum/assembly/integer/u128/u128#set:hi
  local.get $to
  local.get $result
  call $~lib/as-bignum/assembly/integer/u128/u128#get:lo
  call $~lib/as-bignum/assembly/integer/u128/u128#set:lo
  local.get $slice
  call $~lib/metashrew-as/assembly/utils/box/Box#get:start
  local.get $buf
  call $~lib/metashrew-as/assembly/utils/box/Box#get:start
  i32.sub
  return
 )
 (func $~lib/staticarray/StaticArray<~lib/as-bignum/assembly/integer/u128/u128>#constructor (param $this i32) (param $length i32) (result i32)
  (local $outSize i32)
  (local $out i32)
  local.get $length
  i32.const 1073741820
  i32.const 2
  i32.shr_u
  i32.gt_u
  if
   i32.const 1376
   i32.const 2176
   i32.const 51
   i32.const 60
   call $~lib/builtins/abort
   unreachable
  end
  local.get $length
  i32.const 2
  i32.shl
  local.set $outSize
  local.get $outSize
  i32.const 36
  call $~lib/rt/stub/__new
  local.set $out
  i32.const 0
  global.get $~lib/shared/runtime/Runtime.Incremental
  i32.ne
  drop
  local.get $out
  i32.const 0
  local.get $outSize
  memory.fill
  local.get $out
  return
 )
 (func $~lib/staticarray/StaticArray<~lib/as-bignum/assembly/integer/u128/u128>#get:length (param $this i32) (result i32)
  local.get $this
  i32.const 20
  i32.sub
  call $~lib/rt/common/OBJECT#get:rtSize
  i32.const 2
  i32.shr_u
  return
 )
 (func $~lib/staticarray/StaticArray<~lib/as-bignum/assembly/integer/u128/u128>#__uset (param $this i32) (param $index i32) (param $value i32)
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
 (func $~lib/staticarray/StaticArray<~lib/as-bignum/assembly/integer/u128/u128>#__set (param $this i32) (param $index i32) (param $value i32)
  local.get $index
  local.get $this
  call $~lib/staticarray/StaticArray<~lib/as-bignum/assembly/integer/u128/u128>#get:length
  i32.ge_u
  if
   i32.const 2112
   i32.const 2176
   i32.const 93
   i32.const 41
   call $~lib/builtins/abort
   unreachable
  end
  local.get $this
  local.get $index
  local.get $value
  call $~lib/staticarray/StaticArray<~lib/as-bignum/assembly/integer/u128/u128>#__uset
 )
 (func $~lib/array/Array<~lib/staticarray/StaticArray<~lib/as-bignum/assembly/integer/u128/u128>>#get:length_ (param $this i32) (result i32)
  local.get $this
  i32.load offset=12
 )
 (func $~lib/array/Array<~lib/staticarray/StaticArray<~lib/as-bignum/assembly/integer/u128/u128>>#get:dataStart (param $this i32) (result i32)
  local.get $this
  i32.load offset=4
 )
 (func $~lib/array/Array<~lib/staticarray/StaticArray<~lib/as-bignum/assembly/integer/u128/u128>>#push (param $this i32) (param $value i32) (result i32)
  (local $oldLen i32)
  (local $len i32)
  local.get $this
  call $~lib/array/Array<~lib/staticarray/StaticArray<~lib/as-bignum/assembly/integer/u128/u128>>#get:length_
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
  call $~lib/array/Array<~lib/staticarray/StaticArray<~lib/as-bignum/assembly/integer/u128/u128>>#get:dataStart
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
  call $~lib/array/Array<~lib/staticarray/StaticArray<~lib/as-bignum/assembly/integer/u128/u128>>#set:length_
  local.get $len
  return
 )
 (func $~lib/util/hash/HASH<u64> (param $key i64) (result i32)
  (local $key|1 i64)
  (local $h i32)
  i32.const 0
  drop
  i32.const 0
  drop
  i32.const 0
  drop
  i32.const 8
  i32.const 4
  i32.le_u
  drop
  i32.const 8
  i32.const 8
  i32.eq
  drop
  block $~lib/util/hash/hash64|inlined.0 (result i32)
   local.get $key
   local.set $key|1
   i32.const 0
   i32.const 374761393
   i32.add
   i32.const 8
   i32.add
   local.set $h
   local.get $h
   local.get $key|1
   i32.wrap_i64
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
   local.get $key|1
   i64.const 32
   i64.shr_u
   i32.wrap_i64
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
   br $~lib/util/hash/hash64|inlined.0
  end
  return
 )
 (func $"~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#get:buckets" (param $this i32) (result i32)
  local.get $this
  i32.load
 )
 (func $"~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#get:bucketsMask" (param $this i32) (result i32)
  local.get $this
  i32.load offset=4
 )
 (func $"~lib/map/MapEntry<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#get:taggedNext" (param $this i32) (result i32)
  local.get $this
  i32.load offset=12
 )
 (func $"~lib/map/MapEntry<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#get:key" (param $this i32) (result i64)
  local.get $this
  i64.load
 )
 (func $"~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#find" (param $this i32) (param $key i64) (param $hashCode i32) (result i32)
  (local $entry i32)
  (local $taggedNext i32)
  local.get $this
  call $"~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#get:buckets"
  local.get $hashCode
  local.get $this
  call $"~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#get:bucketsMask"
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
    call $"~lib/map/MapEntry<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#get:taggedNext"
    local.set $taggedNext
    local.get $taggedNext
    i32.const 1
    i32.and
    i32.eqz
    if (result i32)
     local.get $entry
     call $"~lib/map/MapEntry<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#get:key"
     local.get $key
     i64.eq
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
 (func $"~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#has" (param $this i32) (param $key i64) (result i32)
  local.get $this
  local.get $key
  local.get $key
  call $~lib/util/hash/HASH<u64>
  call $"~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#find"
  i32.const 0
  i32.ne
  return
 )
 (func $~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>#set:buffer (param $this i32) (param $buffer i32)
  local.get $this
  local.get $buffer
  i32.store
  local.get $this
  local.get $buffer
  i32.const 0
  call $~lib/rt/stub/__link
 )
 (func $~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>#set:dataStart (param $this i32) (param $dataStart i32)
  local.get $this
  local.get $dataStart
  i32.store offset=4
 )
 (func $~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>#set:byteLength (param $this i32) (param $byteLength i32)
  local.get $this
  local.get $byteLength
  i32.store offset=8
 )
 (func $~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>#set:length_ (param $this i32) (param $length_ i32)
  local.get $this
  local.get $length_
  i32.store offset=12
 )
 (func $~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>#constructor (param $this i32) (param $length i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $bufferSize i32)
  (local $buffer i32)
  local.get $this
  i32.eqz
  if
   i32.const 16
   i32.const 34
   call $~lib/rt/stub/__new
   local.set $this
  end
  local.get $this
  i32.const 0
  call $~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>#set:buffer
  local.get $this
  i32.const 0
  call $~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>#set:dataStart
  local.get $this
  i32.const 0
  call $~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>#set:byteLength
  local.get $this
  i32.const 0
  call $~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>#set:length_
  local.get $length
  i32.const 1073741820
  i32.const 2
  i32.shr_u
  i32.gt_u
  if
   i32.const 1376
   i32.const 3360
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
  call $~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>#set:buffer
  local.get $this
  local.get $buffer
  call $~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>#set:dataStart
  local.get $this
  local.get $bufferSize
  call $~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>#set:byteLength
  local.get $this
  local.get $length
  call $~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>#set:length_
  local.get $this
 )
 (func $"~lib/map/MapEntry<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#set:value" (param $this i32) (param $value i32)
  local.get $this
  local.get $value
  i32.store offset=8
 )
 (func $"~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#get:entriesOffset" (param $this i32) (result i32)
  local.get $this
  i32.load offset=16
 )
 (func $"~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#get:entriesCapacity" (param $this i32) (result i32)
  local.get $this
  i32.load offset=12
 )
 (func $"~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#get:entriesCount" (param $this i32) (result i32)
  local.get $this
  i32.load offset=20
 )
 (func $"~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#get:entries" (param $this i32) (result i32)
  local.get $this
  i32.load offset=8
 )
 (func $"~lib/map/MapEntry<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#set:key" (param $this i32) (param $key i64)
  local.get $this
  local.get $key
  i64.store
 )
 (func $"~lib/map/MapEntry<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#get:value" (param $this i32) (result i32)
  local.get $this
  i32.load offset=8
 )
 (func $"~lib/map/MapEntry<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#set:taggedNext" (param $this i32) (param $taggedNext i32)
  local.get $this
  local.get $taggedNext
  i32.store offset=12
 )
 (func $"~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#rehash" (param $this i32) (param $newBucketsMask i32)
  (local $newBucketsCapacity i32)
  (local $newBuckets i32)
  (local $newEntriesCapacity i32)
  (local $newEntries i32)
  (local $oldPtr i32)
  (local $oldEnd i32)
  (local $newPtr i32)
  (local $oldEntry i32)
  (local $newEntry i32)
  (local $oldEntryKey i64)
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
  block $"~lib/map/ENTRY_SIZE<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>|inlined.1" (result i32)
   i32.const 16
   br $"~lib/map/ENTRY_SIZE<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>|inlined.1"
  end
  i32.mul
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.set $newEntries
  local.get $this
  call $"~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#get:entries"
  local.set $oldPtr
  local.get $oldPtr
  local.get $this
  call $"~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#get:entriesOffset"
  block $"~lib/map/ENTRY_SIZE<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>|inlined.2" (result i32)
   i32.const 16
   br $"~lib/map/ENTRY_SIZE<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>|inlined.2"
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
    call $"~lib/map/MapEntry<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#get:taggedNext"
    i32.const 1
    i32.and
    i32.eqz
    if
     local.get $newPtr
     local.set $newEntry
     local.get $oldEntry
     call $"~lib/map/MapEntry<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#get:key"
     local.set $oldEntryKey
     local.get $newEntry
     local.get $oldEntryKey
     call $"~lib/map/MapEntry<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#set:key"
     local.get $newEntry
     local.get $oldEntry
     call $"~lib/map/MapEntry<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#get:value"
     call $"~lib/map/MapEntry<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#set:value"
     local.get $oldEntryKey
     call $~lib/util/hash/HASH<u64>
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
     call $"~lib/map/MapEntry<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#set:taggedNext"
     local.get $newBucketPtrBase
     local.get $newPtr
     i32.store
     local.get $newPtr
     block $"~lib/map/ENTRY_SIZE<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>|inlined.3" (result i32)
      i32.const 16
      br $"~lib/map/ENTRY_SIZE<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>|inlined.3"
     end
     i32.add
     local.set $newPtr
    end
    local.get $oldPtr
    block $"~lib/map/ENTRY_SIZE<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>|inlined.4" (result i32)
     i32.const 16
     br $"~lib/map/ENTRY_SIZE<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>|inlined.4"
    end
    i32.add
    local.set $oldPtr
    br $while-continue|0
   end
  end
  local.get $this
  local.get $newBuckets
  call $"~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#set:buckets"
  local.get $this
  local.get $newBucketsMask
  call $"~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#set:bucketsMask"
  local.get $this
  local.get $newEntries
  call $"~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#set:entries"
  local.get $this
  local.get $newEntriesCapacity
  call $"~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#set:entriesCapacity"
  local.get $this
  local.get $this
  call $"~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#get:entriesCount"
  call $"~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#set:entriesOffset"
 )
 (func $"~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#set" (param $this i32) (param $key i64) (param $value i32) (result i32)
  (local $hashCode i32)
  (local $entry i32)
  (local $entries i32)
  (local $6 i32)
  (local $bucketPtrBase i32)
  local.get $key
  call $~lib/util/hash/HASH<u64>
  local.set $hashCode
  local.get $this
  local.get $key
  local.get $hashCode
  call $"~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#find"
  local.set $entry
  local.get $entry
  if
   local.get $entry
   local.get $value
   call $"~lib/map/MapEntry<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#set:value"
   i32.const 1
   drop
   local.get $this
   local.get $value
   i32.const 1
   call $~lib/rt/stub/__link
  else
   local.get $this
   call $"~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#get:entriesOffset"
   local.get $this
   call $"~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#get:entriesCapacity"
   i32.eq
   if
    local.get $this
    local.get $this
    call $"~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#get:entriesCount"
    local.get $this
    call $"~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#get:entriesCapacity"
    i32.const 3
    i32.mul
    i32.const 4
    i32.div_s
    i32.lt_s
    if (result i32)
     local.get $this
     call $"~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#get:bucketsMask"
    else
     local.get $this
     call $"~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#get:bucketsMask"
     i32.const 1
     i32.shl
     i32.const 1
     i32.or
    end
    call $"~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#rehash"
   end
   local.get $this
   call $"~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#get:entries"
   local.set $entries
   local.get $entries
   local.get $this
   local.get $this
   call $"~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#get:entriesOffset"
   local.tee $6
   i32.const 1
   i32.add
   call $"~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#set:entriesOffset"
   local.get $6
   block $"~lib/map/ENTRY_SIZE<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>|inlined.5" (result i32)
    i32.const 16
    br $"~lib/map/ENTRY_SIZE<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>|inlined.5"
   end
   i32.mul
   i32.add
   local.set $entry
   local.get $entry
   local.get $key
   call $"~lib/map/MapEntry<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#set:key"
   i32.const 0
   drop
   local.get $entry
   local.get $value
   call $"~lib/map/MapEntry<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#set:value"
   i32.const 1
   drop
   local.get $this
   local.get $value
   i32.const 1
   call $~lib/rt/stub/__link
   local.get $this
   local.get $this
   call $"~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#get:entriesCount"
   i32.const 1
   i32.add
   call $"~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#set:entriesCount"
   local.get $this
   call $"~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#get:buckets"
   local.get $hashCode
   local.get $this
   call $"~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#get:bucketsMask"
   i32.and
   i32.const 4
   i32.mul
   i32.add
   local.set $bucketPtrBase
   local.get $entry
   local.get $bucketPtrBase
   i32.load
   call $"~lib/map/MapEntry<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#set:taggedNext"
   local.get $bucketPtrBase
   local.get $entry
   i32.store
  end
  local.get $this
  return
 )
 (func $"~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#get" (param $this i32) (param $key i64) (result i32)
  (local $entry i32)
  local.get $this
  local.get $key
  local.get $key
  call $~lib/util/hash/HASH<u64>
  call $"~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#find"
  local.set $entry
  local.get $entry
  i32.eqz
  if
   i32.const 3680
   i32.const 3744
   i32.const 105
   i32.const 17
   call $~lib/builtins/abort
   unreachable
  end
  local.get $entry
  call $"~lib/map/MapEntry<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#get:value"
  return
 )
 (func $~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>#get:length_ (param $this i32) (result i32)
  local.get $this
  i32.load offset=12
 )
 (func $~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>#get:dataStart (param $this i32) (result i32)
  local.get $this
  i32.load offset=4
 )
 (func $~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>#push (param $this i32) (param $value i32) (result i32)
  (local $oldLen i32)
  (local $len i32)
  local.get $this
  call $~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>#get:length_
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
  call $~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>#get:dataStart
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
  call $~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>#set:length_
  local.get $len
  return
 )
 (func $assembly/index/RunestoneMessage#set:fields (param $this i32) (param $fields i32)
  local.get $this
  local.get $fields
  i32.store
  local.get $this
  local.get $fields
  i32.const 0
  call $~lib/rt/stub/__link
 )
 (func $assembly/index/RunestoneMessage#set:edicts (param $this i32) (param $edicts i32)
  local.get $this
  local.get $edicts
  i32.store offset=4
  local.get $this
  local.get $edicts
  i32.const 0
  call $~lib/rt/stub/__link
 )
 (func $assembly/index/RunestoneMessage#constructor (param $this i32) (param $fields i32) (param $edicts i32) (result i32)
  local.get $this
  i32.eqz
  if
   i32.const 8
   i32.const 32
   call $~lib/rt/stub/__new
   local.set $this
  end
  local.get $this
  i32.const 0
  call $assembly/index/RunestoneMessage#set:fields
  local.get $this
  i32.const 0
  call $assembly/index/RunestoneMessage#set:edicts
  local.get $this
  local.get $fields
  call $assembly/index/RunestoneMessage#set:fields
  local.get $this
  local.get $edicts
  call $assembly/index/RunestoneMessage#set:edicts
  local.get $this
 )
 (func $assembly/index/RunestoneMessage.parse (param $data i32) (result i32)
  (local $input i32)
  (local $fields i32)
  (local $edicts i32)
  (local $value i32)
  (local $value|5 i64)
  (local $fieldKeyHeap i32)
  (local $fieldKey i64)
  (local $edict i32)
  (local $i i32)
  (local $value|10 i32)
  (local $value|11 i64)
  (local $edictInt i32)
  (local $value|13 i32)
  (local $value|14 i64)
  (local $value|15 i32)
  (local $field i32)
  local.get $data
  call $~lib/metashrew-as/assembly/utils/box/Box.from
  local.set $input
  i32.const 0
  call $"~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#constructor"
  local.set $fields
  i32.const 0
  i32.const 0
  call $~lib/array/Array<~lib/staticarray/StaticArray<~lib/as-bignum/assembly/integer/u128/u128>>#constructor
  local.set $edicts
  loop $while-continue|0
   local.get $input
   call $~lib/metashrew-as/assembly/utils/box/Box#get:len
   i32.const 0
   i32.gt_u
   if
    block $~lib/as-bignum/assembly/integer/u128/u128.from<i32>|inlined.0 (result i32)
     i32.const 0
     local.set $value
     i32.const 0
     drop
     i32.const 0
     drop
     i32.const 0
     drop
     i32.const 0
     drop
     i32.const 0
     drop
     i32.const 1
     drop
     block $~lib/as-bignum/assembly/integer/u128/u128.fromI64|inlined.0 (result i32)
      local.get $value
      i64.extend_i32_s
      local.set $value|5
      i32.const 0
      local.get $value|5
      local.get $value|5
      i64.const 63
      i64.shr_s
      call $~lib/as-bignum/assembly/integer/u128/u128#constructor
      br $~lib/as-bignum/assembly/integer/u128/u128.fromI64|inlined.0
     end
     br $~lib/as-bignum/assembly/integer/u128/u128.from<i32>|inlined.0
    end
    local.set $fieldKeyHeap
    local.get $input
    local.get $input
    local.get $fieldKeyHeap
    call $assembly/leb128/readULEB128ToU128
    call $~lib/metashrew-as/assembly/utils/box/Box#shrinkFront
    drop
    local.get $fieldKeyHeap
    call $~lib/as-bignum/assembly/integer/u128/u128#get:lo
    local.set $fieldKey
    local.get $fieldKey
    i64.const 0
    i64.eq
    if
     loop $while-continue|1
      local.get $input
      call $~lib/metashrew-as/assembly/utils/box/Box#get:len
      i32.const 0
      i32.gt_u
      if
       i32.const 0
       i32.const 4
       call $~lib/staticarray/StaticArray<~lib/as-bignum/assembly/integer/u128/u128>#constructor
       local.set $edict
       i32.const 0
       local.set $i
       loop $for-loop|2
        local.get $i
        i32.const 4
        i32.lt_s
        if
         block $~lib/as-bignum/assembly/integer/u128/u128.from<i32>|inlined.3 (result i32)
          i32.const 0
          local.set $value|10
          i32.const 0
          drop
          i32.const 0
          drop
          i32.const 0
          drop
          i32.const 0
          drop
          i32.const 0
          drop
          i32.const 1
          drop
          block $~lib/as-bignum/assembly/integer/u128/u128.fromI64|inlined.3 (result i32)
           local.get $value|10
           i64.extend_i32_s
           local.set $value|11
           i32.const 0
           local.get $value|11
           local.get $value|11
           i64.const 63
           i64.shr_s
           call $~lib/as-bignum/assembly/integer/u128/u128#constructor
           br $~lib/as-bignum/assembly/integer/u128/u128.fromI64|inlined.3
          end
          br $~lib/as-bignum/assembly/integer/u128/u128.from<i32>|inlined.3
         end
         local.set $edictInt
         local.get $input
         local.get $input
         local.get $edictInt
         call $assembly/leb128/readULEB128ToU128
         call $~lib/metashrew-as/assembly/utils/box/Box#shrinkFront
         drop
         local.get $edict
         local.get $i
         local.get $edictInt
         call $~lib/staticarray/StaticArray<~lib/as-bignum/assembly/integer/u128/u128>#__set
         local.get $i
         i32.const 1
         i32.add
         local.set $i
         br $for-loop|2
        end
       end
       local.get $edicts
       local.get $edict
       call $~lib/array/Array<~lib/staticarray/StaticArray<~lib/as-bignum/assembly/integer/u128/u128>>#push
       drop
       br $while-continue|1
      end
     end
    else
     block $~lib/as-bignum/assembly/integer/u128/u128.from<i32>|inlined.4 (result i32)
      i32.const 0
      local.set $value|13
      i32.const 0
      drop
      i32.const 0
      drop
      i32.const 0
      drop
      i32.const 0
      drop
      i32.const 0
      drop
      i32.const 1
      drop
      block $~lib/as-bignum/assembly/integer/u128/u128.fromI64|inlined.4 (result i32)
       local.get $value|13
       i64.extend_i32_s
       local.set $value|14
       i32.const 0
       local.get $value|14
       local.get $value|14
       i64.const 63
       i64.shr_s
       call $~lib/as-bignum/assembly/integer/u128/u128#constructor
       br $~lib/as-bignum/assembly/integer/u128/u128.fromI64|inlined.4
      end
      br $~lib/as-bignum/assembly/integer/u128/u128.from<i32>|inlined.4
     end
     local.set $value|15
     local.get $input
     local.get $input
     local.get $value|15
     call $assembly/leb128/readULEB128ToU128
     call $~lib/metashrew-as/assembly/utils/box/Box#shrinkFront
     drop
     i32.const 0
     local.set $field
     local.get $fields
     local.get $fieldKey
     call $"~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#has"
     i32.eqz
     if
      i32.const 0
      i32.const 0
      call $~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>#constructor
      local.set $field
      local.get $fields
      local.get $fieldKey
      local.get $field
      call $"~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#set"
      drop
     else
      local.get $fields
      local.get $fieldKey
      call $"~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#get"
      local.set $field
     end
     local.get $field
     local.get $value|15
     call $~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>#push
     drop
    end
    br $while-continue|0
   end
  end
  i32.const 0
  local.get $fields
  local.get $edicts
  call $assembly/index/RunestoneMessage#constructor
  return
 )
 (func $assembly/index/RunestoneMessage#get:edicts (param $this i32) (result i32)
  local.get $this
  i32.load offset=4
 )
 (func $assembly/index/Edict#set:block (param $this i32) (param $block i32)
  local.get $this
  local.get $block
  i32.store
  local.get $this
  local.get $block
  i32.const 0
  call $~lib/rt/stub/__link
 )
 (func $assembly/index/Edict#set:transactionIndex (param $this i32) (param $transactionIndex i32)
  local.get $this
  local.get $transactionIndex
  i32.store offset=4
  local.get $this
  local.get $transactionIndex
  i32.const 0
  call $~lib/rt/stub/__link
 )
 (func $assembly/index/Edict#set:amount (param $this i32) (param $amount i32)
  local.get $this
  local.get $amount
  i32.store offset=8
  local.get $this
  local.get $amount
  i32.const 0
  call $~lib/rt/stub/__link
 )
 (func $assembly/index/Edict#set:output (param $this i32) (param $output i32)
  local.get $this
  local.get $output
  i32.store offset=12
  local.get $this
  local.get $output
  i32.const 0
  call $~lib/rt/stub/__link
 )
 (func $assembly/index/Edict#constructor (param $this i32) (param $block i32) (param $transactionIndex i32) (param $amount i32) (param $output i32) (result i32)
  local.get $this
  i32.eqz
  if
   i32.const 16
   i32.const 38
   call $~lib/rt/stub/__new
   local.set $this
  end
  local.get $this
  i32.const 0
  call $assembly/index/Edict#set:block
  local.get $this
  i32.const 0
  call $assembly/index/Edict#set:transactionIndex
  local.get $this
  i32.const 0
  call $assembly/index/Edict#set:amount
  local.get $this
  i32.const 0
  call $assembly/index/Edict#set:output
  local.get $this
  local.get $block
  call $assembly/index/Edict#set:block
  local.get $this
  local.get $transactionIndex
  call $assembly/index/Edict#set:transactionIndex
  local.get $this
  local.get $amount
  call $assembly/index/Edict#set:amount
  local.get $this
  local.get $output
  call $assembly/index/Edict#set:output
  local.get $this
 )
 (func $assembly/index/Edict.zero (result i32)
  (local $value i32)
  (local $value|1 i64)
  (local $value|2 i32)
  (local $value|3 i64)
  (local $value|4 i32)
  (local $value|5 i64)
  (local $value|6 i32)
  (local $value|7 i64)
  i32.const 0
  block $~lib/as-bignum/assembly/integer/u128/u128.from<i32>|inlined.5 (result i32)
   i32.const 0
   local.set $value
   i32.const 0
   drop
   i32.const 0
   drop
   i32.const 0
   drop
   i32.const 0
   drop
   i32.const 0
   drop
   i32.const 1
   drop
   block $~lib/as-bignum/assembly/integer/u128/u128.fromI64|inlined.5 (result i32)
    local.get $value
    i64.extend_i32_s
    local.set $value|1
    i32.const 0
    local.get $value|1
    local.get $value|1
    i64.const 63
    i64.shr_s
    call $~lib/as-bignum/assembly/integer/u128/u128#constructor
    br $~lib/as-bignum/assembly/integer/u128/u128.fromI64|inlined.5
   end
   br $~lib/as-bignum/assembly/integer/u128/u128.from<i32>|inlined.5
  end
  block $~lib/as-bignum/assembly/integer/u128/u128.from<i32>|inlined.6 (result i32)
   i32.const 0
   local.set $value|2
   i32.const 0
   drop
   i32.const 0
   drop
   i32.const 0
   drop
   i32.const 0
   drop
   i32.const 0
   drop
   i32.const 1
   drop
   block $~lib/as-bignum/assembly/integer/u128/u128.fromI64|inlined.6 (result i32)
    local.get $value|2
    i64.extend_i32_s
    local.set $value|3
    i32.const 0
    local.get $value|3
    local.get $value|3
    i64.const 63
    i64.shr_s
    call $~lib/as-bignum/assembly/integer/u128/u128#constructor
    br $~lib/as-bignum/assembly/integer/u128/u128.fromI64|inlined.6
   end
   br $~lib/as-bignum/assembly/integer/u128/u128.from<i32>|inlined.6
  end
  block $~lib/as-bignum/assembly/integer/u128/u128.from<i32>|inlined.7 (result i32)
   i32.const 0
   local.set $value|4
   i32.const 0
   drop
   i32.const 0
   drop
   i32.const 0
   drop
   i32.const 0
   drop
   i32.const 0
   drop
   i32.const 1
   drop
   block $~lib/as-bignum/assembly/integer/u128/u128.fromI64|inlined.7 (result i32)
    local.get $value|4
    i64.extend_i32_s
    local.set $value|5
    i32.const 0
    local.get $value|5
    local.get $value|5
    i64.const 63
    i64.shr_s
    call $~lib/as-bignum/assembly/integer/u128/u128#constructor
    br $~lib/as-bignum/assembly/integer/u128/u128.fromI64|inlined.7
   end
   br $~lib/as-bignum/assembly/integer/u128/u128.from<i32>|inlined.7
  end
  block $~lib/as-bignum/assembly/integer/u128/u128.from<i32>|inlined.8 (result i32)
   i32.const 0
   local.set $value|6
   i32.const 0
   drop
   i32.const 0
   drop
   i32.const 0
   drop
   i32.const 0
   drop
   i32.const 0
   drop
   i32.const 1
   drop
   block $~lib/as-bignum/assembly/integer/u128/u128.fromI64|inlined.8 (result i32)
    local.get $value|6
    i64.extend_i32_s
    local.set $value|7
    i32.const 0
    local.get $value|7
    local.get $value|7
    i64.const 63
    i64.shr_s
    call $~lib/as-bignum/assembly/integer/u128/u128#constructor
    br $~lib/as-bignum/assembly/integer/u128/u128.fromI64|inlined.8
   end
   br $~lib/as-bignum/assembly/integer/u128/u128.from<i32>|inlined.8
  end
  call $assembly/index/Edict#constructor
  return
 )
 (func $~lib/array/Array<assembly/index/Edict>#set:buffer (param $this i32) (param $buffer i32)
  local.get $this
  local.get $buffer
  i32.store
  local.get $this
  local.get $buffer
  i32.const 0
  call $~lib/rt/stub/__link
 )
 (func $~lib/array/Array<assembly/index/Edict>#set:dataStart (param $this i32) (param $dataStart i32)
  local.get $this
  local.get $dataStart
  i32.store offset=4
 )
 (func $~lib/array/Array<assembly/index/Edict>#set:byteLength (param $this i32) (param $byteLength i32)
  local.get $this
  local.get $byteLength
  i32.store offset=8
 )
 (func $~lib/array/Array<assembly/index/Edict>#set:length_ (param $this i32) (param $length_ i32)
  local.get $this
  local.get $length_
  i32.store offset=12
 )
 (func $~lib/array/Array<assembly/index/Edict>#constructor (param $this i32) (param $length i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $bufferSize i32)
  (local $buffer i32)
  local.get $this
  i32.eqz
  if
   i32.const 16
   i32.const 39
   call $~lib/rt/stub/__new
   local.set $this
  end
  local.get $this
  i32.const 0
  call $~lib/array/Array<assembly/index/Edict>#set:buffer
  local.get $this
  i32.const 0
  call $~lib/array/Array<assembly/index/Edict>#set:dataStart
  local.get $this
  i32.const 0
  call $~lib/array/Array<assembly/index/Edict>#set:byteLength
  local.get $this
  i32.const 0
  call $~lib/array/Array<assembly/index/Edict>#set:length_
  local.get $length
  i32.const 1073741820
  i32.const 2
  i32.shr_u
  i32.gt_u
  if
   i32.const 1376
   i32.const 3360
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
  call $~lib/array/Array<assembly/index/Edict>#set:buffer
  local.get $this
  local.get $buffer
  call $~lib/array/Array<assembly/index/Edict>#set:dataStart
  local.get $this
  local.get $bufferSize
  call $~lib/array/Array<assembly/index/Edict>#set:byteLength
  local.get $this
  local.get $length
  call $~lib/array/Array<assembly/index/Edict>#set:length_
  local.get $this
 )
 (func $~lib/staticarray/StaticArray<~lib/as-bignum/assembly/integer/u128/u128>#__get (param $this i32) (param $index i32) (result i32)
  (local $value i32)
  local.get $index
  local.get $this
  call $~lib/staticarray/StaticArray<~lib/as-bignum/assembly/integer/u128/u128>#get:length
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
   i32.const 3408
   i32.const 2176
   i32.const 82
   i32.const 40
   call $~lib/builtins/abort
   unreachable
  end
  local.get $value
  return
 )
 (func $~lib/as-bignum/assembly/integer/u256/u256#set:lo1 (param $this i32) (param $lo1 i64)
  local.get $this
  local.get $lo1
  i64.store
 )
 (func $~lib/as-bignum/assembly/integer/u256/u256#set:lo2 (param $this i32) (param $lo2 i64)
  local.get $this
  local.get $lo2
  i64.store offset=8
 )
 (func $~lib/as-bignum/assembly/integer/u256/u256#set:hi1 (param $this i32) (param $hi1 i64)
  local.get $this
  local.get $hi1
  i64.store offset=16
 )
 (func $~lib/as-bignum/assembly/integer/u256/u256#set:hi2 (param $this i32) (param $hi2 i64)
  local.get $this
  local.get $hi2
  i64.store offset=24
 )
 (func $~lib/as-bignum/assembly/integer/u256/u256#constructor (param $this i32) (param $lo1 i64) (param $lo2 i64) (param $hi1 i64) (param $hi2 i64) (result i32)
  local.get $this
  i32.eqz
  if
   i32.const 32
   i32.const 40
   call $~lib/rt/stub/__new
   local.set $this
  end
  local.get $this
  local.get $lo1
  call $~lib/as-bignum/assembly/integer/u256/u256#set:lo1
  local.get $this
  local.get $lo2
  call $~lib/as-bignum/assembly/integer/u256/u256#set:lo2
  local.get $this
  local.get $hi1
  call $~lib/as-bignum/assembly/integer/u256/u256#set:hi1
  local.get $this
  local.get $hi2
  call $~lib/as-bignum/assembly/integer/u256/u256#set:hi2
  local.get $this
 )
 (func $assembly/index/fromU128Pair (param $lo i32) (param $hi i32) (result i32)
  i32.const 0
  local.get $lo
  call $~lib/as-bignum/assembly/integer/u128/u128#get:lo
  local.get $lo
  call $~lib/as-bignum/assembly/integer/u128/u128#get:hi
  local.get $hi
  call $~lib/as-bignum/assembly/integer/u128/u128#get:lo
  local.get $hi
  call $~lib/as-bignum/assembly/integer/u128/u128#get:hi
  call $~lib/as-bignum/assembly/integer/u256/u256#constructor
  return
 )
 (func $~lib/as-bignum/assembly/integer/u256/u256#get:hi2 (param $this i32) (result i64)
  local.get $this
  i64.load offset=24
 )
 (func $~lib/as-bignum/assembly/integer/u256/u256#get:hi1 (param $this i32) (result i64)
  local.get $this
  i64.load offset=16
 )
 (func $~lib/as-bignum/assembly/integer/u256/u256#get:lo2 (param $this i32) (result i64)
  local.get $this
  i64.load offset=8
 )
 (func $~lib/as-bignum/assembly/integer/u256/u256#get:lo1 (param $this i32) (result i64)
  local.get $this
  i64.load
 )
 (func $~lib/as-bignum/assembly/integer/u256/u256.lt (param $a i32) (param $b i32) (result i32)
  (local $ah2 i64)
  (local $ah1 i64)
  (local $bh2 i64)
  (local $bh1 i64)
  (local $al2 i64)
  (local $bl2 i64)
  local.get $a
  call $~lib/as-bignum/assembly/integer/u256/u256#get:hi2
  local.set $ah2
  local.get $a
  call $~lib/as-bignum/assembly/integer/u256/u256#get:hi1
  local.set $ah1
  local.get $b
  call $~lib/as-bignum/assembly/integer/u256/u256#get:hi2
  local.set $bh2
  local.get $b
  call $~lib/as-bignum/assembly/integer/u256/u256#get:hi1
  local.set $bh1
  local.get $a
  call $~lib/as-bignum/assembly/integer/u256/u256#get:lo2
  local.set $al2
  local.get $b
  call $~lib/as-bignum/assembly/integer/u256/u256#get:lo2
  local.set $bl2
  local.get $ah2
  local.get $bh2
  i64.eq
  if
   local.get $ah1
   local.get $bh1
   i64.eq
   if
    local.get $al2
    local.get $bl2
    i64.eq
    if (result i32)
     local.get $a
     call $~lib/as-bignum/assembly/integer/u256/u256#get:lo1
     local.get $b
     call $~lib/as-bignum/assembly/integer/u256/u256#get:lo1
     i64.lt_u
    else
     local.get $al2
     local.get $bl2
     i64.lt_u
    end
    return
   else
    local.get $ah1
    local.get $bh1
    i64.lt_u
    return
   end
   unreachable
  else
   local.get $ah2
   local.get $bh2
   i64.lt_u
   return
  end
  unreachable
 )
 (func $assembly/index/Edict.fromDeltaSeries~anonymous|0 (param $a i32) (param $b i32) (result i32)
  (local $left i32)
  (local $right i32)
  (local $a|4 i32)
  (local $b|5 i32)
  local.get $a
  i32.const 0
  call $~lib/staticarray/StaticArray<~lib/as-bignum/assembly/integer/u128/u128>#__get
  local.get $a
  i32.const 1
  call $~lib/staticarray/StaticArray<~lib/as-bignum/assembly/integer/u128/u128>#__get
  call $assembly/index/fromU128Pair
  local.set $left
  local.get $b
  i32.const 0
  call $~lib/staticarray/StaticArray<~lib/as-bignum/assembly/integer/u128/u128>#__get
  local.get $b
  i32.const 1
  call $~lib/staticarray/StaticArray<~lib/as-bignum/assembly/integer/u128/u128>#__get
  call $assembly/index/fromU128Pair
  local.set $right
  local.get $left
  local.get $right
  call $~lib/as-bignum/assembly/integer/u256/u256.lt
  if
   i32.const -1
   return
  else
   block $~lib/as-bignum/assembly/integer/u256/u256.eq|inlined.0 (result i32)
    local.get $left
    local.set $a|4
    local.get $right
    local.set $b|5
    local.get $a|4
    call $~lib/as-bignum/assembly/integer/u256/u256#get:lo1
    local.get $b|5
    call $~lib/as-bignum/assembly/integer/u256/u256#get:lo1
    i64.eq
    if (result i32)
     local.get $a|4
     call $~lib/as-bignum/assembly/integer/u256/u256#get:lo2
     local.get $b|5
     call $~lib/as-bignum/assembly/integer/u256/u256#get:lo2
     i64.eq
    else
     i32.const 0
    end
    if (result i32)
     local.get $a|4
     call $~lib/as-bignum/assembly/integer/u256/u256#get:hi1
     local.get $b|5
     call $~lib/as-bignum/assembly/integer/u256/u256#get:hi1
     i64.eq
    else
     i32.const 0
    end
    if (result i32)
     local.get $a|4
     call $~lib/as-bignum/assembly/integer/u256/u256#get:hi2
     local.get $b|5
     call $~lib/as-bignum/assembly/integer/u256/u256#get:hi2
     i64.eq
    else
     i32.const 0
    end
    br $~lib/as-bignum/assembly/integer/u256/u256.eq|inlined.0
   end
   if
    i32.const 0
    return
   else
    i32.const 1
    return
   end
   unreachable
  end
  unreachable
 )
 (func $~lib/util/sort/insertionSort<~lib/staticarray/StaticArray<~lib/as-bignum/assembly/integer/u128/u128>> (param $ptr i32) (param $left i32) (param $right i32) (param $presorted i32) (param $comparator i32)
  (local $range i32)
  (local $i i32)
  (local $a i32)
  (local $b i32)
  (local $min i32)
  (local $max i32)
  (local $j i32)
  i32.const 0
  i32.const 1
  i32.ge_s
  drop
  local.get $right
  local.get $left
  i32.sub
  i32.const 1
  i32.add
  local.set $range
  local.get $left
  local.get $range
  i32.const 1
  i32.and
  local.get $presorted
  local.get $range
  local.get $presorted
  i32.sub
  i32.const 1
  i32.and
  i32.sub
  local.get $presorted
  i32.const 0
  i32.eq
  select
  i32.add
  local.set $i
  loop $for-loop|0
   local.get $i
   local.get $right
   i32.le_s
   if
    local.get $ptr
    local.get $i
    i32.const 2
    i32.shl
    i32.add
    i32.load
    local.set $a
    local.get $ptr
    local.get $i
    i32.const 2
    i32.shl
    i32.add
    i32.load offset=4
    local.set $b
    local.get $b
    local.set $min
    local.get $a
    local.set $max
    local.get $a
    local.get $b
    i32.const 2
    global.set $~argumentsLength
    local.get $comparator
    i32.load
    call_indirect (type $2)
    i32.const 0
    i32.le_s
    if
     local.get $a
     local.set $min
     local.get $b
     local.set $max
    end
    local.get $i
    i32.const 1
    i32.sub
    local.set $j
    block $while-break|1
     loop $while-continue|1
      local.get $j
      local.get $left
      i32.ge_s
      if
       local.get $ptr
       local.get $j
       i32.const 2
       i32.shl
       i32.add
       i32.load
       local.set $a
       local.get $a
       local.get $max
       i32.const 2
       global.set $~argumentsLength
       local.get $comparator
       i32.load
       call_indirect (type $2)
       i32.const 0
       i32.gt_s
       if
        local.get $ptr
        local.get $j
        i32.const 2
        i32.shl
        i32.add
        local.get $a
        i32.store offset=8
        local.get $j
        i32.const 1
        i32.sub
        local.set $j
       else
        br $while-break|1
       end
       br $while-continue|1
      end
     end
    end
    local.get $ptr
    local.get $j
    i32.const 2
    i32.shl
    i32.add
    local.get $max
    i32.store offset=8
    block $while-break|2
     loop $while-continue|2
      local.get $j
      local.get $left
      i32.ge_s
      if
       local.get $ptr
       local.get $j
       i32.const 2
       i32.shl
       i32.add
       i32.load
       local.set $a
       local.get $a
       local.get $min
       i32.const 2
       global.set $~argumentsLength
       local.get $comparator
       i32.load
       call_indirect (type $2)
       i32.const 0
       i32.gt_s
       if
        local.get $ptr
        local.get $j
        i32.const 2
        i32.shl
        i32.add
        local.get $a
        i32.store offset=4
        local.get $j
        i32.const 1
        i32.sub
        local.set $j
       else
        br $while-break|2
       end
       br $while-continue|2
      end
     end
    end
    local.get $ptr
    local.get $j
    i32.const 2
    i32.shl
    i32.add
    local.get $min
    i32.store offset=4
    local.get $i
    i32.const 2
    i32.add
    local.set $i
    br $for-loop|0
   end
  end
 )
 (func $~lib/util/sort/extendRunRight<~lib/staticarray/StaticArray<~lib/as-bignum/assembly/integer/u128/u128>> (param $ptr i32) (param $i i32) (param $right i32) (param $comparator i32) (result i32)
  (local $j i32)
  (local $k i32)
  (local $tmp i32)
  local.get $i
  local.get $right
  i32.eq
  if
   local.get $i
   return
  end
  local.get $i
  local.set $j
  local.get $ptr
  local.get $j
  i32.const 2
  i32.shl
  i32.add
  i32.load
  local.get $ptr
  local.get $j
  i32.const 1
  i32.add
  local.tee $j
  i32.const 2
  i32.shl
  i32.add
  i32.load
  i32.const 2
  global.set $~argumentsLength
  local.get $comparator
  i32.load
  call_indirect (type $2)
  i32.const 0
  i32.gt_s
  if
   loop $while-continue|0
    local.get $j
    local.get $right
    i32.lt_s
    if (result i32)
     local.get $ptr
     local.get $j
     i32.const 2
     i32.shl
     i32.add
     i32.load offset=4
     local.get $ptr
     local.get $j
     i32.const 2
     i32.shl
     i32.add
     i32.load
     i32.const 2
     global.set $~argumentsLength
     local.get $comparator
     i32.load
     call_indirect (type $2)
     i32.const 31
     i32.shr_u
    else
     i32.const 0
    end
    if
     local.get $j
     i32.const 1
     i32.add
     local.set $j
     br $while-continue|0
    end
   end
   local.get $j
   local.set $k
   loop $while-continue|1
    local.get $i
    local.get $k
    i32.lt_s
    if
     local.get $ptr
     local.get $i
     i32.const 2
     i32.shl
     i32.add
     i32.load
     local.set $tmp
     local.get $ptr
     local.get $i
     i32.const 2
     i32.shl
     i32.add
     local.get $ptr
     local.get $k
     i32.const 2
     i32.shl
     i32.add
     i32.load
     i32.store
     local.get $i
     i32.const 1
     i32.add
     local.set $i
     local.get $ptr
     local.get $k
     i32.const 2
     i32.shl
     i32.add
     local.get $tmp
     i32.store
     local.get $k
     i32.const 1
     i32.sub
     local.set $k
     br $while-continue|1
    end
   end
  else
   loop $while-continue|2
    local.get $j
    local.get $right
    i32.lt_s
    if (result i32)
     local.get $ptr
     local.get $j
     i32.const 2
     i32.shl
     i32.add
     i32.load offset=4
     local.get $ptr
     local.get $j
     i32.const 2
     i32.shl
     i32.add
     i32.load
     i32.const 2
     global.set $~argumentsLength
     local.get $comparator
     i32.load
     call_indirect (type $2)
     i32.const 0
     i32.ge_s
    else
     i32.const 0
    end
    if
     local.get $j
     i32.const 1
     i32.add
     local.set $j
     br $while-continue|2
    end
   end
  end
  local.get $j
  return
 )
 (func $~lib/util/sort/nodePower (param $left i32) (param $right i32) (param $startA i32) (param $startB i32) (param $endB i32) (result i32)
  (local $n i64)
  (local $s i32)
  (local $l i32)
  (local $r i32)
  (local $a i64)
  (local $b i64)
  local.get $right
  local.get $left
  i32.sub
  i32.const 1
  i32.add
  i64.extend_i32_u
  local.set $n
  local.get $startB
  local.get $left
  i32.const 1
  i32.shl
  i32.sub
  local.set $s
  local.get $startA
  local.get $s
  i32.add
  local.set $l
  local.get $endB
  local.get $s
  i32.add
  i32.const 1
  i32.add
  local.set $r
  local.get $l
  i64.extend_i32_u
  i64.const 30
  i64.shl
  local.get $n
  i64.div_u
  local.set $a
  local.get $r
  i64.extend_i32_u
  i64.const 30
  i64.shl
  local.get $n
  i64.div_u
  local.set $b
  local.get $a
  local.get $b
  i64.xor
  i32.wrap_i64
  i32.clz
  return
 )
 (func $~lib/util/sort/mergeRuns<~lib/staticarray/StaticArray<~lib/as-bignum/assembly/integer/u128/u128>> (param $ptr i32) (param $l i32) (param $m i32) (param $r i32) (param $buffer i32) (param $comparator i32)
  (local $i i32)
  (local $j i32)
  (local $t i32)
  (local $k i32)
  (local $a i32)
  (local $b i32)
  local.get $m
  i32.const 1
  i32.sub
  local.set $m
  local.get $r
  local.get $m
  i32.add
  local.set $t
  local.get $m
  i32.const 1
  i32.add
  local.set $i
  loop $for-loop|0
   local.get $i
   local.get $l
   i32.gt_s
   if
    local.get $buffer
    local.get $i
    i32.const 1
    i32.sub
    i32.const 2
    i32.shl
    i32.add
    local.get $ptr
    local.get $i
    i32.const 1
    i32.sub
    i32.const 2
    i32.shl
    i32.add
    i32.load
    i32.store
    local.get $i
    i32.const 1
    i32.sub
    local.set $i
    br $for-loop|0
   end
  end
  local.get $m
  local.set $j
  loop $for-loop|1
   local.get $j
   local.get $r
   i32.lt_s
   if
    local.get $buffer
    local.get $t
    local.get $j
    i32.sub
    i32.const 2
    i32.shl
    i32.add
    local.get $ptr
    local.get $j
    i32.const 2
    i32.shl
    i32.add
    i32.load offset=4
    i32.store
    local.get $j
    i32.const 1
    i32.add
    local.set $j
    br $for-loop|1
   end
  end
  local.get $l
  local.set $k
  loop $for-loop|2
   local.get $k
   local.get $r
   i32.le_s
   if
    local.get $buffer
    local.get $j
    i32.const 2
    i32.shl
    i32.add
    i32.load
    local.set $a
    local.get $buffer
    local.get $i
    i32.const 2
    i32.shl
    i32.add
    i32.load
    local.set $b
    local.get $a
    local.get $b
    i32.const 2
    global.set $~argumentsLength
    local.get $comparator
    i32.load
    call_indirect (type $2)
    i32.const 0
    i32.lt_s
    if
     local.get $ptr
     local.get $k
     i32.const 2
     i32.shl
     i32.add
     local.get $a
     i32.store
     local.get $j
     i32.const 1
     i32.sub
     local.set $j
    else
     local.get $ptr
     local.get $k
     i32.const 2
     i32.shl
     i32.add
     local.get $b
     i32.store
     local.get $i
     i32.const 1
     i32.add
     local.set $i
    end
    local.get $k
    i32.const 1
    i32.add
    local.set $k
    br $for-loop|2
   end
  end
 )
 (func $~lib/rt/stub/__free (param $ptr i32)
  (local $block i32)
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
   i32.const 70
   i32.const 3
   call $~lib/builtins/abort
   unreachable
  end
  local.get $ptr
  i32.const 4
  i32.sub
  local.set $block
  local.get $ptr
  local.get $block
  call $~lib/rt/common/BLOCK#get:mmInfo
  i32.add
  global.get $~lib/rt/stub/offset
  i32.eq
  if
   local.get $block
   global.set $~lib/rt/stub/offset
  end
 )
 (func $~lib/util/sort/SORT<~lib/staticarray/StaticArray<~lib/as-bignum/assembly/integer/u128/u128>> (param $ptr i32) (param $len i32) (param $comparator i32)
  (local $3 i32)
  (local $a i32)
  (local $b i32)
  (local $c i32)
  (local $a|7 i32)
  (local $b|8 i32)
  (local $c|9 i32)
  (local $n i32)
  (local $lgPlus2 i32)
  (local $lgPlus2Size i32)
  (local $leftRunStartBuf i32)
  (local $leftRunEndBuf i32)
  (local $i i32)
  (local $buffer i32)
  (local $hi i32)
  (local $endA i32)
  (local $lenA i32)
  (local $20 i32)
  (local $21 i32)
  (local $top i32)
  (local $startA i32)
  (local $startB i32)
  (local $endB i32)
  (local $lenB i32)
  (local $27 i32)
  (local $28 i32)
  (local $k i32)
  (local $i|30 i32)
  (local $start i32)
  (local $i|32 i32)
  (local $start|33 i32)
  local.get $len
  i32.const 48
  i32.le_s
  if
   local.get $len
   i32.const 1
   i32.le_s
   if
    return
   end
   i32.const 0
   i32.const 1
   i32.lt_s
   drop
   block $break|0
    block $case1|0
     block $case0|0
      local.get $len
      local.set $3
      local.get $3
      i32.const 3
      i32.eq
      br_if $case0|0
      local.get $3
      i32.const 2
      i32.eq
      br_if $case1|0
      br $break|0
     end
     local.get $ptr
     i32.load
     local.set $a
     local.get $ptr
     i32.load offset=4
     local.set $b
     local.get $a
     local.get $b
     i32.const 2
     global.set $~argumentsLength
     local.get $comparator
     i32.load
     call_indirect (type $2)
     i32.const 0
     i32.gt_s
     local.set $c
     local.get $ptr
     local.get $b
     local.get $a
     local.get $c
     select
     i32.store
     local.get $a
     local.get $b
     local.get $c
     select
     local.set $a
     local.get $ptr
     i32.load offset=8
     local.set $b
     local.get $a
     local.get $b
     i32.const 2
     global.set $~argumentsLength
     local.get $comparator
     i32.load
     call_indirect (type $2)
     i32.const 0
     i32.gt_s
     local.set $c
     local.get $ptr
     local.get $b
     local.get $a
     local.get $c
     select
     i32.store offset=4
     local.get $ptr
     local.get $a
     local.get $b
     local.get $c
     select
     i32.store offset=8
    end
    local.get $ptr
    i32.load
    local.set $a|7
    local.get $ptr
    i32.load offset=4
    local.set $b|8
    local.get $a|7
    local.get $b|8
    i32.const 2
    global.set $~argumentsLength
    local.get $comparator
    i32.load
    call_indirect (type $2)
    i32.const 0
    i32.gt_s
    local.set $c|9
    local.get $ptr
    local.get $b|8
    local.get $a|7
    local.get $c|9
    select
    i32.store
    local.get $ptr
    local.get $a|7
    local.get $b|8
    local.get $c|9
    select
    i32.store offset=4
    return
   end
   local.get $ptr
   i32.const 0
   local.get $len
   i32.const 1
   i32.sub
   i32.const 0
   local.get $comparator
   call $~lib/util/sort/insertionSort<~lib/staticarray/StaticArray<~lib/as-bignum/assembly/integer/u128/u128>>
   return
  end
  block $~lib/util/sort/log2u|inlined.0 (result i32)
   local.get $len
   local.set $n
   i32.const 31
   local.get $n
   i32.clz
   i32.sub
   br $~lib/util/sort/log2u|inlined.0
  end
  i32.const 2
  i32.add
  local.set $lgPlus2
  local.get $lgPlus2
  i32.const 2
  i32.shl
  local.set $lgPlus2Size
  local.get $lgPlus2Size
  i32.const 1
  i32.shl
  call $~lib/rt/stub/__alloc
  local.set $leftRunStartBuf
  local.get $leftRunStartBuf
  local.get $lgPlus2Size
  i32.add
  local.set $leftRunEndBuf
  i32.const 0
  local.set $i
  loop $for-loop|1
   local.get $i
   local.get $lgPlus2
   i32.lt_u
   if
    local.get $leftRunStartBuf
    local.get $i
    i32.const 2
    i32.shl
    i32.add
    i32.const -1
    i32.store
    local.get $i
    i32.const 1
    i32.add
    local.set $i
    br $for-loop|1
   end
  end
  local.get $len
  i32.const 2
  i32.shl
  call $~lib/rt/stub/__alloc
  local.set $buffer
  local.get $len
  i32.const 1
  i32.sub
  local.set $hi
  local.get $ptr
  i32.const 0
  local.get $hi
  local.get $comparator
  call $~lib/util/sort/extendRunRight<~lib/staticarray/StaticArray<~lib/as-bignum/assembly/integer/u128/u128>>
  local.set $endA
  local.get $endA
  i32.const 1
  i32.add
  local.set $lenA
  local.get $lenA
  i32.const 32
  i32.lt_s
  if
   local.get $hi
   local.tee $20
   i32.const 32
   i32.const 1
   i32.sub
   local.tee $21
   local.get $20
   local.get $21
   i32.lt_s
   select
   local.set $endA
   local.get $ptr
   i32.const 0
   local.get $endA
   local.get $lenA
   local.get $comparator
   call $~lib/util/sort/insertionSort<~lib/staticarray/StaticArray<~lib/as-bignum/assembly/integer/u128/u128>>
  end
  i32.const 0
  local.set $top
  i32.const 0
  local.set $startA
  loop $while-continue|2
   local.get $endA
   local.get $hi
   i32.lt_s
   if
    local.get $endA
    i32.const 1
    i32.add
    local.set $startB
    local.get $ptr
    local.get $startB
    local.get $hi
    local.get $comparator
    call $~lib/util/sort/extendRunRight<~lib/staticarray/StaticArray<~lib/as-bignum/assembly/integer/u128/u128>>
    local.set $endB
    local.get $endB
    local.get $startB
    i32.sub
    i32.const 1
    i32.add
    local.set $lenB
    local.get $lenB
    i32.const 32
    i32.lt_s
    if
     local.get $hi
     local.tee $27
     local.get $startB
     i32.const 32
     i32.add
     i32.const 1
     i32.sub
     local.tee $28
     local.get $27
     local.get $28
     i32.lt_s
     select
     local.set $endB
     local.get $ptr
     local.get $startB
     local.get $endB
     local.get $lenB
     local.get $comparator
     call $~lib/util/sort/insertionSort<~lib/staticarray/StaticArray<~lib/as-bignum/assembly/integer/u128/u128>>
    end
    i32.const 0
    local.get $hi
    local.get $startA
    local.get $startB
    local.get $endB
    call $~lib/util/sort/nodePower
    local.set $k
    local.get $top
    local.set $i|30
    loop $for-loop|3
     local.get $i|30
     local.get $k
     i32.gt_u
     if
      local.get $leftRunStartBuf
      local.get $i|30
      i32.const 2
      i32.shl
      i32.add
      i32.load
      local.set $start
      local.get $start
      i32.const -1
      i32.ne
      if
       local.get $ptr
       local.get $start
       local.get $leftRunEndBuf
       local.get $i|30
       i32.const 2
       i32.shl
       i32.add
       i32.load
       i32.const 1
       i32.add
       local.get $endA
       local.get $buffer
       local.get $comparator
       call $~lib/util/sort/mergeRuns<~lib/staticarray/StaticArray<~lib/as-bignum/assembly/integer/u128/u128>>
       local.get $start
       local.set $startA
       local.get $leftRunStartBuf
       local.get $i|30
       i32.const 2
       i32.shl
       i32.add
       i32.const -1
       i32.store
      end
      local.get $i|30
      i32.const 1
      i32.sub
      local.set $i|30
      br $for-loop|3
     end
    end
    local.get $leftRunStartBuf
    local.get $k
    i32.const 2
    i32.shl
    i32.add
    local.get $startA
    i32.store
    local.get $leftRunEndBuf
    local.get $k
    i32.const 2
    i32.shl
    i32.add
    local.get $endA
    i32.store
    local.get $startB
    local.set $startA
    local.get $endB
    local.set $endA
    local.get $k
    local.set $top
    br $while-continue|2
   end
  end
  local.get $top
  local.set $i|32
  loop $for-loop|4
   local.get $i|32
   i32.const 0
   i32.ne
   if
    local.get $leftRunStartBuf
    local.get $i|32
    i32.const 2
    i32.shl
    i32.add
    i32.load
    local.set $start|33
    local.get $start|33
    i32.const -1
    i32.ne
    if
     local.get $ptr
     local.get $start|33
     local.get $leftRunEndBuf
     local.get $i|32
     i32.const 2
     i32.shl
     i32.add
     i32.load
     i32.const 1
     i32.add
     local.get $hi
     local.get $buffer
     local.get $comparator
     call $~lib/util/sort/mergeRuns<~lib/staticarray/StaticArray<~lib/as-bignum/assembly/integer/u128/u128>>
    end
    local.get $i|32
    i32.const 1
    i32.sub
    local.set $i|32
    br $for-loop|4
   end
  end
  local.get $buffer
  call $~lib/rt/stub/__free
  local.get $leftRunStartBuf
  call $~lib/rt/stub/__free
 )
 (func $~lib/array/Array<~lib/staticarray/StaticArray<~lib/as-bignum/assembly/integer/u128/u128>>#sort (param $this i32) (param $comparator i32) (result i32)
  local.get $this
  call $~lib/array/Array<~lib/staticarray/StaticArray<~lib/as-bignum/assembly/integer/u128/u128>>#get:dataStart
  local.get $this
  call $~lib/array/Array<~lib/staticarray/StaticArray<~lib/as-bignum/assembly/integer/u128/u128>>#get:length_
  local.get $comparator
  call $~lib/util/sort/SORT<~lib/staticarray/StaticArray<~lib/as-bignum/assembly/integer/u128/u128>>
  local.get $this
  return
 )
 (func $~lib/array/Array<~lib/staticarray/StaticArray<~lib/as-bignum/assembly/integer/u128/u128>>#get:length (param $this i32) (result i32)
  local.get $this
  call $~lib/array/Array<~lib/staticarray/StaticArray<~lib/as-bignum/assembly/integer/u128/u128>>#get:length_
  return
 )
 (func $~lib/array/Array<~lib/staticarray/StaticArray<~lib/as-bignum/assembly/integer/u128/u128>>#__get (param $this i32) (param $index i32) (result i32)
  (local $value i32)
  local.get $index
  local.get $this
  call $~lib/array/Array<~lib/staticarray/StaticArray<~lib/as-bignum/assembly/integer/u128/u128>>#get:length_
  i32.ge_u
  if
   i32.const 2112
   i32.const 3360
   i32.const 114
   i32.const 42
   call $~lib/builtins/abort
   unreachable
  end
  local.get $this
  call $~lib/array/Array<~lib/staticarray/StaticArray<~lib/as-bignum/assembly/integer/u128/u128>>#get:dataStart
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
   i32.const 3408
   i32.const 3360
   i32.const 118
   i32.const 40
   call $~lib/builtins/abort
   unreachable
  end
  local.get $value
  return
 )
 (func $assembly/index/Edict#get:block (param $this i32) (result i32)
  local.get $this
  i32.load
 )
 (func $assembly/index/Edict#get:transactionIndex (param $this i32) (result i32)
  local.get $this
  i32.load offset=4
 )
 (func $assembly/index/Edict.diff (param $previous i32) (param $values i32) (result i32)
  (local $a i32)
  (local $b i32)
  (local $alo i64)
  (local $lo i64)
  (local $hi i64)
  (local $this i32)
  (local $a|8 i32)
  (local $b|9 i32)
  (local $alo|10 i64)
  (local $lo|11 i64)
  (local $hi|12 i64)
  i32.const 0
  block $~lib/as-bignum/assembly/integer/u128/u128.add|inlined.0 (result i32)
   local.get $previous
   call $assembly/index/Edict#get:block
   local.set $a
   local.get $values
   i32.const 0
   call $~lib/staticarray/StaticArray<~lib/as-bignum/assembly/integer/u128/u128>#__get
   local.set $b
   local.get $a
   call $~lib/as-bignum/assembly/integer/u128/u128#get:lo
   local.set $alo
   local.get $alo
   local.get $b
   call $~lib/as-bignum/assembly/integer/u128/u128#get:lo
   i64.add
   local.set $lo
   local.get $a
   call $~lib/as-bignum/assembly/integer/u128/u128#get:hi
   local.get $b
   call $~lib/as-bignum/assembly/integer/u128/u128#get:hi
   i64.add
   local.get $lo
   local.get $alo
   i64.lt_u
   i64.extend_i32_u
   i64.add
   local.set $hi
   i32.const 0
   local.get $lo
   local.get $hi
   call $~lib/as-bignum/assembly/integer/u128/u128#constructor
   br $~lib/as-bignum/assembly/integer/u128/u128.add|inlined.0
  end
  block $~lib/as-bignum/assembly/integer/u128/u128#isZero|inlined.0 (result i32)
   local.get $values
   i32.const 0
   call $~lib/staticarray/StaticArray<~lib/as-bignum/assembly/integer/u128/u128>#__get
   local.set $this
   local.get $this
   call $~lib/as-bignum/assembly/integer/u128/u128#get:lo
   local.get $this
   call $~lib/as-bignum/assembly/integer/u128/u128#get:hi
   i64.or
   i64.const 0
   i64.ne
   i32.eqz
   br $~lib/as-bignum/assembly/integer/u128/u128#isZero|inlined.0
  end
  if (result i32)
   local.get $values
   i32.const 1
   call $~lib/staticarray/StaticArray<~lib/as-bignum/assembly/integer/u128/u128>#__get
  else
   block $~lib/as-bignum/assembly/integer/u128/u128.add|inlined.1 (result i32)
    local.get $previous
    call $assembly/index/Edict#get:transactionIndex
    local.set $a|8
    local.get $values
    i32.const 1
    call $~lib/staticarray/StaticArray<~lib/as-bignum/assembly/integer/u128/u128>#__get
    local.set $b|9
    local.get $a|8
    call $~lib/as-bignum/assembly/integer/u128/u128#get:lo
    local.set $alo|10
    local.get $alo|10
    local.get $b|9
    call $~lib/as-bignum/assembly/integer/u128/u128#get:lo
    i64.add
    local.set $lo|11
    local.get $a|8
    call $~lib/as-bignum/assembly/integer/u128/u128#get:hi
    local.get $b|9
    call $~lib/as-bignum/assembly/integer/u128/u128#get:hi
    i64.add
    local.get $lo|11
    local.get $alo|10
    i64.lt_u
    i64.extend_i32_u
    i64.add
    local.set $hi|12
    i32.const 0
    local.get $lo|11
    local.get $hi|12
    call $~lib/as-bignum/assembly/integer/u128/u128#constructor
    br $~lib/as-bignum/assembly/integer/u128/u128.add|inlined.1
   end
  end
  local.get $values
  i32.const 2
  call $~lib/staticarray/StaticArray<~lib/as-bignum/assembly/integer/u128/u128>#__get
  local.get $values
  i32.const 3
  call $~lib/staticarray/StaticArray<~lib/as-bignum/assembly/integer/u128/u128>#__get
  call $assembly/index/Edict#constructor
  return
 )
 (func $~lib/array/Array<assembly/index/Edict>#get:length_ (param $this i32) (result i32)
  local.get $this
  i32.load offset=12
 )
 (func $~lib/array/Array<assembly/index/Edict>#get:dataStart (param $this i32) (result i32)
  local.get $this
  i32.load offset=4
 )
 (func $~lib/array/Array<assembly/index/Edict>#push (param $this i32) (param $value i32) (result i32)
  (local $oldLen i32)
  (local $len i32)
  local.get $this
  call $~lib/array/Array<assembly/index/Edict>#get:length_
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
  call $~lib/array/Array<assembly/index/Edict>#get:dataStart
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
  call $~lib/array/Array<assembly/index/Edict>#set:length_
  local.get $len
  return
 )
 (func $assembly/index/Edict.fromDeltaSeries (param $deltas i32) (result i32)
  (local $last i32)
  (local $result i32)
  (local $i i32)
  call $assembly/index/Edict.zero
  local.set $last
  i32.const 0
  i32.const 0
  call $~lib/array/Array<assembly/index/Edict>#constructor
  local.set $result
  local.get $deltas
  i32.const 5664
  call $~lib/array/Array<~lib/staticarray/StaticArray<~lib/as-bignum/assembly/integer/u128/u128>>#sort
  drop
  i32.const 0
  local.set $i
  loop $for-loop|0
   local.get $i
   local.get $deltas
   call $~lib/array/Array<~lib/staticarray/StaticArray<~lib/as-bignum/assembly/integer/u128/u128>>#get:length
   i32.lt_s
   if
    local.get $last
    local.get $deltas
    local.get $i
    call $~lib/array/Array<~lib/staticarray/StaticArray<~lib/as-bignum/assembly/integer/u128/u128>>#__get
    call $assembly/index/Edict.diff
    local.set $last
    local.get $result
    local.get $last
    call $~lib/array/Array<assembly/index/Edict>#push
    drop
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
 (func $"~lib/map/Map<~lib/string/String,i32>#set:buckets" (param $this i32) (param $buckets i32)
  local.get $this
  local.get $buckets
  i32.store
  local.get $this
  local.get $buckets
  i32.const 0
  call $~lib/rt/stub/__link
 )
 (func $"~lib/map/Map<~lib/string/String,i32>#set:bucketsMask" (param $this i32) (param $bucketsMask i32)
  local.get $this
  local.get $bucketsMask
  i32.store offset=4
 )
 (func $"~lib/map/Map<~lib/string/String,i32>#set:entries" (param $this i32) (param $entries i32)
  local.get $this
  local.get $entries
  i32.store offset=8
  local.get $this
  local.get $entries
  i32.const 0
  call $~lib/rt/stub/__link
 )
 (func $"~lib/map/Map<~lib/string/String,i32>#set:entriesCapacity" (param $this i32) (param $entriesCapacity i32)
  local.get $this
  local.get $entriesCapacity
  i32.store offset=12
 )
 (func $"~lib/map/Map<~lib/string/String,i32>#set:entriesOffset" (param $this i32) (param $entriesOffset i32)
  local.get $this
  local.get $entriesOffset
  i32.store offset=16
 )
 (func $"~lib/map/Map<~lib/string/String,i32>#set:entriesCount" (param $this i32) (param $entriesCount i32)
  local.get $this
  local.get $entriesCount
  i32.store offset=20
 )
 (func $"~lib/map/Map<~lib/string/String,i32>#constructor" (param $this i32) (result i32)
  local.get $this
  i32.eqz
  if
   i32.const 24
   i32.const 43
   call $~lib/rt/stub/__new
   local.set $this
  end
  local.get $this
  i32.const 0
  i32.const 4
  i32.const 4
  i32.mul
  call $~lib/arraybuffer/ArrayBuffer#constructor
  call $"~lib/map/Map<~lib/string/String,i32>#set:buckets"
  local.get $this
  i32.const 4
  i32.const 1
  i32.sub
  call $"~lib/map/Map<~lib/string/String,i32>#set:bucketsMask"
  local.get $this
  i32.const 0
  i32.const 4
  block $"~lib/map/ENTRY_SIZE<~lib/string/String,i32>|inlined.0" (result i32)
   i32.const 12
   br $"~lib/map/ENTRY_SIZE<~lib/string/String,i32>|inlined.0"
  end
  i32.mul
  call $~lib/arraybuffer/ArrayBuffer#constructor
  call $"~lib/map/Map<~lib/string/String,i32>#set:entries"
  local.get $this
  i32.const 4
  call $"~lib/map/Map<~lib/string/String,i32>#set:entriesCapacity"
  local.get $this
  i32.const 0
  call $"~lib/map/Map<~lib/string/String,i32>#set:entriesOffset"
  local.get $this
  i32.const 0
  call $"~lib/map/Map<~lib/string/String,i32>#set:entriesCount"
  local.get $this
 )
 (func $assembly/index/BalanceSheet#set:index (param $this i32) (param $index i32)
  local.get $this
  local.get $index
  i32.store offset=8
  local.get $this
  local.get $index
  i32.const 0
  call $~lib/rt/stub/__link
 )
 (func $assembly/index/BalanceSheet#set:balances (param $this i32) (param $balances i32)
  local.get $this
  local.get $balances
  i32.store offset=4
  local.get $this
  local.get $balances
  i32.const 0
  call $~lib/rt/stub/__link
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
   i32.const 27
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
   i32.const 3360
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
 (func $assembly/index/BalanceSheet#set:runes (param $this i32) (param $runes i32)
  local.get $this
  local.get $runes
  i32.store
  local.get $this
  local.get $runes
  i32.const 0
  call $~lib/rt/stub/__link
 )
 (func $assembly/index/BalanceSheet#constructor (param $this i32) (result i32)
  local.get $this
  i32.eqz
  if
   i32.const 12
   i32.const 42
   call $~lib/rt/stub/__new
   local.set $this
  end
  local.get $this
  i32.const 0
  call $assembly/index/BalanceSheet#set:runes
  local.get $this
  i32.const 0
  call $assembly/index/BalanceSheet#set:balances
  local.get $this
  i32.const 0
  call $assembly/index/BalanceSheet#set:index
  local.get $this
  i32.const 0
  call $"~lib/map/Map<~lib/string/String,i32>#constructor"
  call $assembly/index/BalanceSheet#set:index
  local.get $this
  i32.const 0
  i32.const 0
  call $~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>#constructor
  call $assembly/index/BalanceSheet#set:balances
  local.get $this
  i32.const 0
  i32.const 0
  call $~lib/array/Array<~lib/arraybuffer/ArrayBuffer>#constructor
  call $assembly/index/BalanceSheet#set:runes
  local.get $this
 )
 (func $~lib/typedarray/Uint8Array#get:length (param $this i32) (result i32)
  local.get $this
  call $~lib/arraybuffer/ArrayBufferView#get:byteLength
  return
 )
 (func $~lib/arraybuffer/ArrayBufferView#get:dataStart (param $this i32) (result i32)
  local.get $this
  i32.load offset=4
 )
 (func $assembly/index/fromArrayBuffer (param $data i32) (result i32)
  (local $array i32)
  (local $array|2 i32)
  (local $buffer i32)
  block $~lib/as-bignum/assembly/integer/u128/u128.fromBytesLE|inlined.0 (result i32)
   local.get $data
   local.set $array
   block $~lib/as-bignum/assembly/integer/u128/u128.fromUint8ArrayLE|inlined.0 (result i32)
    local.get $array
    local.set $array|2
    local.get $array|2
    call $~lib/typedarray/Uint8Array#get:length
    if (result i32)
     local.get $array|2
     call $~lib/typedarray/Uint8Array#get:length
     i32.const 15
     i32.and
     i32.const 0
     i32.eq
    else
     i32.const 0
    end
    i32.eqz
    if
     i32.const 0
     i32.const 5776
     i32.const 132
     i32.const 5
     call $~lib/builtins/abort
     unreachable
    end
    local.get $array|2
    call $~lib/arraybuffer/ArrayBufferView#get:dataStart
    local.set $buffer
    i32.const 0
    local.get $buffer
    i64.load
    local.get $buffer
    i64.load offset=8
    call $~lib/as-bignum/assembly/integer/u128/u128#constructor
    br $~lib/as-bignum/assembly/integer/u128/u128.fromUint8ArrayLE|inlined.0
   end
   br $~lib/as-bignum/assembly/integer/u128/u128.fromBytesLE|inlined.0
  end
  return
 )
 (func $assembly/index/BalanceSheet#get:index (param $this i32) (result i32)
  local.get $this
  i32.load offset=8
 )
 (func $"~lib/map/Map<~lib/string/String,i32>#get:buckets" (param $this i32) (result i32)
  local.get $this
  i32.load
 )
 (func $"~lib/map/Map<~lib/string/String,i32>#get:bucketsMask" (param $this i32) (result i32)
  local.get $this
  i32.load offset=4
 )
 (func $"~lib/map/MapEntry<~lib/string/String,i32>#get:taggedNext" (param $this i32) (result i32)
  local.get $this
  i32.load offset=8
 )
 (func $"~lib/map/MapEntry<~lib/string/String,i32>#get:key" (param $this i32) (result i32)
  local.get $this
  i32.load
 )
 (func $"~lib/map/Map<~lib/string/String,i32>#find" (param $this i32) (param $key i32) (param $hashCode i32) (result i32)
  (local $entry i32)
  (local $taggedNext i32)
  local.get $this
  call $"~lib/map/Map<~lib/string/String,i32>#get:buckets"
  local.get $hashCode
  local.get $this
  call $"~lib/map/Map<~lib/string/String,i32>#get:bucketsMask"
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
    call $"~lib/map/MapEntry<~lib/string/String,i32>#get:taggedNext"
    local.set $taggedNext
    local.get $taggedNext
    i32.const 1
    i32.and
    i32.eqz
    if (result i32)
     local.get $entry
     call $"~lib/map/MapEntry<~lib/string/String,i32>#get:key"
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
 (func $"~lib/map/Map<~lib/string/String,i32>#has" (param $this i32) (param $key i32) (result i32)
  local.get $this
  local.get $key
  local.get $key
  call $~lib/util/hash/HASH<~lib/string/String>
  call $"~lib/map/Map<~lib/string/String,i32>#find"
  i32.const 0
  i32.ne
  return
 )
 (func $"~lib/map/MapEntry<~lib/string/String,i32>#get:value" (param $this i32) (result i32)
  local.get $this
  i32.load offset=4
 )
 (func $"~lib/map/Map<~lib/string/String,i32>#get" (param $this i32) (param $key i32) (result i32)
  (local $entry i32)
  local.get $this
  local.get $key
  local.get $key
  call $~lib/util/hash/HASH<~lib/string/String>
  call $"~lib/map/Map<~lib/string/String,i32>#find"
  local.set $entry
  local.get $entry
  i32.eqz
  if
   i32.const 3680
   i32.const 3744
   i32.const 105
   i32.const 17
   call $~lib/builtins/abort
   unreachable
  end
  local.get $entry
  call $"~lib/map/MapEntry<~lib/string/String,i32>#get:value"
  return
 )
 (func $assembly/index/BalanceSheet#get:balances (param $this i32) (result i32)
  local.get $this
  i32.load offset=4
 )
 (func $~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>#__get (param $this i32) (param $index i32) (result i32)
  (local $value i32)
  local.get $index
  local.get $this
  call $~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>#get:length_
  i32.ge_u
  if
   i32.const 2112
   i32.const 3360
   i32.const 114
   i32.const 42
   call $~lib/builtins/abort
   unreachable
  end
  local.get $this
  call $~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>#get:dataStart
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
   i32.const 3408
   i32.const 3360
   i32.const 118
   i32.const 40
   call $~lib/builtins/abort
   unreachable
  end
  local.get $value
  return
 )
 (func $~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>#__set (param $this i32) (param $index i32) (param $value i32)
  local.get $index
  local.get $this
  call $~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>#get:length_
  i32.ge_u
  if
   local.get $index
   i32.const 0
   i32.lt_s
   if
    i32.const 2112
    i32.const 3360
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
   call $~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>#set:length_
  end
  local.get $this
  call $~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>#get:dataStart
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
 (func $assembly/index/BalanceSheet#get:runes (param $this i32) (result i32)
  local.get $this
  i32.load
 )
 (func $~lib/array/Array<~lib/arraybuffer/ArrayBuffer>#get:length (param $this i32) (result i32)
  local.get $this
  call $~lib/array/Array<~lib/arraybuffer/ArrayBuffer>#get:length_
  return
 )
 (func $"~lib/map/MapEntry<~lib/string/String,i32>#set:value" (param $this i32) (param $value i32)
  local.get $this
  local.get $value
  i32.store offset=4
 )
 (func $"~lib/map/Map<~lib/string/String,i32>#get:entriesOffset" (param $this i32) (result i32)
  local.get $this
  i32.load offset=16
 )
 (func $"~lib/map/Map<~lib/string/String,i32>#get:entriesCapacity" (param $this i32) (result i32)
  local.get $this
  i32.load offset=12
 )
 (func $"~lib/map/Map<~lib/string/String,i32>#get:entriesCount" (param $this i32) (result i32)
  local.get $this
  i32.load offset=20
 )
 (func $"~lib/map/Map<~lib/string/String,i32>#get:entries" (param $this i32) (result i32)
  local.get $this
  i32.load offset=8
 )
 (func $"~lib/map/MapEntry<~lib/string/String,i32>#set:key" (param $this i32) (param $key i32)
  local.get $this
  local.get $key
  i32.store
 )
 (func $"~lib/map/MapEntry<~lib/string/String,i32>#set:taggedNext" (param $this i32) (param $taggedNext i32)
  local.get $this
  local.get $taggedNext
  i32.store offset=8
 )
 (func $"~lib/map/Map<~lib/string/String,i32>#rehash" (param $this i32) (param $newBucketsMask i32)
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
  block $"~lib/map/ENTRY_SIZE<~lib/string/String,i32>|inlined.1" (result i32)
   i32.const 12
   br $"~lib/map/ENTRY_SIZE<~lib/string/String,i32>|inlined.1"
  end
  i32.mul
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.set $newEntries
  local.get $this
  call $"~lib/map/Map<~lib/string/String,i32>#get:entries"
  local.set $oldPtr
  local.get $oldPtr
  local.get $this
  call $"~lib/map/Map<~lib/string/String,i32>#get:entriesOffset"
  block $"~lib/map/ENTRY_SIZE<~lib/string/String,i32>|inlined.2" (result i32)
   i32.const 12
   br $"~lib/map/ENTRY_SIZE<~lib/string/String,i32>|inlined.2"
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
    call $"~lib/map/MapEntry<~lib/string/String,i32>#get:taggedNext"
    i32.const 1
    i32.and
    i32.eqz
    if
     local.get $newPtr
     local.set $newEntry
     local.get $oldEntry
     call $"~lib/map/MapEntry<~lib/string/String,i32>#get:key"
     local.set $oldEntryKey
     local.get $newEntry
     local.get $oldEntryKey
     call $"~lib/map/MapEntry<~lib/string/String,i32>#set:key"
     local.get $newEntry
     local.get $oldEntry
     call $"~lib/map/MapEntry<~lib/string/String,i32>#get:value"
     call $"~lib/map/MapEntry<~lib/string/String,i32>#set:value"
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
     call $"~lib/map/MapEntry<~lib/string/String,i32>#set:taggedNext"
     local.get $newBucketPtrBase
     local.get $newPtr
     i32.store
     local.get $newPtr
     block $"~lib/map/ENTRY_SIZE<~lib/string/String,i32>|inlined.3" (result i32)
      i32.const 12
      br $"~lib/map/ENTRY_SIZE<~lib/string/String,i32>|inlined.3"
     end
     i32.add
     local.set $newPtr
    end
    local.get $oldPtr
    block $"~lib/map/ENTRY_SIZE<~lib/string/String,i32>|inlined.4" (result i32)
     i32.const 12
     br $"~lib/map/ENTRY_SIZE<~lib/string/String,i32>|inlined.4"
    end
    i32.add
    local.set $oldPtr
    br $while-continue|0
   end
  end
  local.get $this
  local.get $newBuckets
  call $"~lib/map/Map<~lib/string/String,i32>#set:buckets"
  local.get $this
  local.get $newBucketsMask
  call $"~lib/map/Map<~lib/string/String,i32>#set:bucketsMask"
  local.get $this
  local.get $newEntries
  call $"~lib/map/Map<~lib/string/String,i32>#set:entries"
  local.get $this
  local.get $newEntriesCapacity
  call $"~lib/map/Map<~lib/string/String,i32>#set:entriesCapacity"
  local.get $this
  local.get $this
  call $"~lib/map/Map<~lib/string/String,i32>#get:entriesCount"
  call $"~lib/map/Map<~lib/string/String,i32>#set:entriesOffset"
 )
 (func $"~lib/map/Map<~lib/string/String,i32>#set" (param $this i32) (param $key i32) (param $value i32) (result i32)
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
  call $"~lib/map/Map<~lib/string/String,i32>#find"
  local.set $entry
  local.get $entry
  if
   local.get $entry
   local.get $value
   call $"~lib/map/MapEntry<~lib/string/String,i32>#set:value"
   i32.const 0
   drop
  else
   local.get $this
   call $"~lib/map/Map<~lib/string/String,i32>#get:entriesOffset"
   local.get $this
   call $"~lib/map/Map<~lib/string/String,i32>#get:entriesCapacity"
   i32.eq
   if
    local.get $this
    local.get $this
    call $"~lib/map/Map<~lib/string/String,i32>#get:entriesCount"
    local.get $this
    call $"~lib/map/Map<~lib/string/String,i32>#get:entriesCapacity"
    i32.const 3
    i32.mul
    i32.const 4
    i32.div_s
    i32.lt_s
    if (result i32)
     local.get $this
     call $"~lib/map/Map<~lib/string/String,i32>#get:bucketsMask"
    else
     local.get $this
     call $"~lib/map/Map<~lib/string/String,i32>#get:bucketsMask"
     i32.const 1
     i32.shl
     i32.const 1
     i32.or
    end
    call $"~lib/map/Map<~lib/string/String,i32>#rehash"
   end
   local.get $this
   call $"~lib/map/Map<~lib/string/String,i32>#get:entries"
   local.set $entries
   local.get $entries
   local.get $this
   local.get $this
   call $"~lib/map/Map<~lib/string/String,i32>#get:entriesOffset"
   local.tee $6
   i32.const 1
   i32.add
   call $"~lib/map/Map<~lib/string/String,i32>#set:entriesOffset"
   local.get $6
   block $"~lib/map/ENTRY_SIZE<~lib/string/String,i32>|inlined.5" (result i32)
    i32.const 12
    br $"~lib/map/ENTRY_SIZE<~lib/string/String,i32>|inlined.5"
   end
   i32.mul
   i32.add
   local.set $entry
   local.get $entry
   local.get $key
   call $"~lib/map/MapEntry<~lib/string/String,i32>#set:key"
   i32.const 1
   drop
   local.get $this
   local.get $key
   i32.const 1
   call $~lib/rt/stub/__link
   local.get $entry
   local.get $value
   call $"~lib/map/MapEntry<~lib/string/String,i32>#set:value"
   i32.const 0
   drop
   local.get $this
   local.get $this
   call $"~lib/map/Map<~lib/string/String,i32>#get:entriesCount"
   i32.const 1
   i32.add
   call $"~lib/map/Map<~lib/string/String,i32>#set:entriesCount"
   local.get $this
   call $"~lib/map/Map<~lib/string/String,i32>#get:buckets"
   local.get $hashCode
   local.get $this
   call $"~lib/map/Map<~lib/string/String,i32>#get:bucketsMask"
   i32.and
   i32.const 4
   i32.mul
   i32.add
   local.set $bucketPtrBase
   local.get $entry
   local.get $bucketPtrBase
   i32.load
   call $"~lib/map/MapEntry<~lib/string/String,i32>#set:taggedNext"
   local.get $bucketPtrBase
   local.get $entry
   i32.store
  end
  local.get $this
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
 (func $assembly/index/BalanceSheet#set (param $this i32) (param $rune i32) (param $v i32)
  (local $this|3 i32)
  (local $rune|4 i32)
  (local $this|5 i32)
  (local $rune|6 i32)
  (local $this|7 i32)
  (local $rune|8 i32)
  (local $i i32)
  (local $record i32)
  (local $a i32)
  (local $b i32)
  (local $alo i64)
  (local $lo i64)
  (local $hi i64)
  block $assembly/index/BalanceSheet#has|inlined.0 (result i32)
   local.get $this
   local.set $this|3
   local.get $rune
   local.set $rune|4
   local.get $this|3
   call $assembly/index/BalanceSheet#get:index
   local.get $rune|4
   call $"~lib/map/Map<~lib/string/String,i32>#has"
   br $assembly/index/BalanceSheet#has|inlined.0
  end
  if
   block $assembly/index/BalanceSheet#getIndex|inlined.0 (result i32)
    local.get $this
    local.set $this|5
    local.get $rune
    local.set $rune|6
    block $assembly/index/BalanceSheet#has|inlined.1 (result i32)
     local.get $this|5
     local.set $this|7
     local.get $rune|6
     local.set $rune|8
     local.get $this|7
     call $assembly/index/BalanceSheet#get:index
     local.get $rune|8
     call $"~lib/map/Map<~lib/string/String,i32>#has"
     br $assembly/index/BalanceSheet#has|inlined.1
    end
    if
     local.get $this|5
     call $assembly/index/BalanceSheet#get:index
     local.get $rune|6
     call $"~lib/map/Map<~lib/string/String,i32>#get"
     br $assembly/index/BalanceSheet#getIndex|inlined.0
    end
    i32.const -1
    br $assembly/index/BalanceSheet#getIndex|inlined.0
   end
   local.set $i
   local.get $this
   call $assembly/index/BalanceSheet#get:balances
   local.get $i
   call $~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>#__get
   local.set $record
   local.get $this
   call $assembly/index/BalanceSheet#get:balances
   local.get $i
   block $~lib/as-bignum/assembly/integer/u128/u128.add|inlined.2 (result i32)
    local.get $this
    call $assembly/index/BalanceSheet#get:balances
    local.get $i
    call $~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>#__get
    local.set $a
    local.get $record
    local.set $b
    local.get $a
    call $~lib/as-bignum/assembly/integer/u128/u128#get:lo
    local.set $alo
    local.get $alo
    local.get $b
    call $~lib/as-bignum/assembly/integer/u128/u128#get:lo
    i64.add
    local.set $lo
    local.get $a
    call $~lib/as-bignum/assembly/integer/u128/u128#get:hi
    local.get $b
    call $~lib/as-bignum/assembly/integer/u128/u128#get:hi
    i64.add
    local.get $lo
    local.get $alo
    i64.lt_u
    i64.extend_i32_u
    i64.add
    local.set $hi
    i32.const 0
    local.get $lo
    local.get $hi
    call $~lib/as-bignum/assembly/integer/u128/u128#constructor
    br $~lib/as-bignum/assembly/integer/u128/u128.add|inlined.2
   end
   call $~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>#__set
  else
   local.get $this
   call $assembly/index/BalanceSheet#get:index
   local.get $rune
   local.get $this
   call $assembly/index/BalanceSheet#get:runes
   call $~lib/array/Array<~lib/arraybuffer/ArrayBuffer>#get:length
   call $"~lib/map/Map<~lib/string/String,i32>#set"
   drop
   local.get $this
   call $assembly/index/BalanceSheet#get:runes
   local.get $rune
   call $~lib/array/Array<~lib/arraybuffer/ArrayBuffer>#push
   drop
   local.get $this
   call $assembly/index/BalanceSheet#get:balances
   local.get $v
   call $~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>#push
   drop
  end
 )
 (func $assembly/index/BalanceSheet.load (param $ptr i32) (result i32)
  (local $runesPtr i32)
  (local $balancesPtr i32)
  (local $length i32)
  (local $result i32)
  (local $i i32)
  local.get $ptr
  i32.const 5696
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#keyword
  local.set $runesPtr
  local.get $ptr
  i32.const 5728
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#keyword
  local.set $balancesPtr
  local.get $runesPtr
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#lengthKey
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#getValue<u32>
  local.set $length
  i32.const 0
  call $assembly/index/BalanceSheet#constructor
  local.set $result
  i32.const 0
  local.set $i
  loop $for-loop|0
   local.get $i
   local.get $length
   i32.lt_u
   if
    local.get $result
    local.get $runesPtr
    local.get $i
    call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#selectIndex
    call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#get
    local.get $balancesPtr
    local.get $i
    call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#selectIndex
    call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#get
    call $assembly/index/fromArrayBuffer
    call $assembly/index/BalanceSheet#set
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
 (func $assembly/index/Index.indexBlock~anonymous|1 (param $v i32) (param $i i32) (param $ary i32) (result i32)
  global.get $assembly/index/OUTPOINT_TO_RUNES
  local.get $v
  call $~lib/metashrew-as/assembly/blockdata/transaction/Input#previousOutput
  call $~lib/metashrew-as/assembly/blockdata/transaction/OutPoint#toArrayBuffer
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
  call $assembly/index/BalanceSheet.load
 )
 (func $~lib/array/Array<assembly/index/BalanceSheet>#get:dataStart (param $this i32) (result i32)
  local.get $this
  i32.load offset=4
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Input>#map<assembly/index/BalanceSheet> (param $this i32) (param $fn i32) (result i32)
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
  i32.const 44
  i32.const 0
  call $~lib/rt/__newArray
  local.set $out
  local.get $out
  call $~lib/array/Array<assembly/index/BalanceSheet>#get:dataStart
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
 (func $~lib/array/Array<~lib/arraybuffer/ArrayBuffer>#__get (param $this i32) (param $index i32) (result i32)
  (local $value i32)
  local.get $index
  local.get $this
  call $~lib/array/Array<~lib/arraybuffer/ArrayBuffer>#get:length_
  i32.ge_u
  if
   i32.const 2112
   i32.const 3360
   i32.const 114
   i32.const 42
   call $~lib/builtins/abort
   unreachable
  end
  local.get $this
  call $~lib/array/Array<~lib/arraybuffer/ArrayBuffer>#get:dataStart
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
   i32.const 3408
   i32.const 3360
   i32.const 118
   i32.const 40
   call $~lib/builtins/abort
   unreachable
  end
  local.get $value
  return
 )
 (func $assembly/index/BalanceSheet#get (param $this i32) (param $rune i32) (result i32)
  (local $this|2 i32)
  (local $rune|3 i32)
  (local $this|4 i32)
  (local $rune|5 i32)
  (local $i i32)
  (local $value i32)
  (local $value|8 i64)
  block $assembly/index/BalanceSheet#getIndex|inlined.1 (result i32)
   local.get $this
   local.set $this|2
   local.get $rune
   local.set $rune|3
   block $assembly/index/BalanceSheet#has|inlined.2 (result i32)
    local.get $this|2
    local.set $this|4
    local.get $rune|3
    local.set $rune|5
    local.get $this|4
    call $assembly/index/BalanceSheet#get:index
    local.get $rune|5
    call $"~lib/map/Map<~lib/string/String,i32>#has"
    br $assembly/index/BalanceSheet#has|inlined.2
   end
   if
    local.get $this|2
    call $assembly/index/BalanceSheet#get:index
    local.get $rune|3
    call $"~lib/map/Map<~lib/string/String,i32>#get"
    br $assembly/index/BalanceSheet#getIndex|inlined.1
   end
   i32.const -1
   br $assembly/index/BalanceSheet#getIndex|inlined.1
  end
  local.set $i
  local.get $i
  i32.const -1
  i32.ne
  if
   local.get $this
   call $assembly/index/BalanceSheet#get:balances
   local.get $i
   call $~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>#__get
   return
  end
  block $~lib/as-bignum/assembly/integer/u128/u128.from<i32>|inlined.9 (result i32)
   i32.const 0
   local.set $value
   i32.const 0
   drop
   i32.const 0
   drop
   i32.const 0
   drop
   i32.const 0
   drop
   i32.const 0
   drop
   i32.const 1
   drop
   block $~lib/as-bignum/assembly/integer/u128/u128.fromI64|inlined.9 (result i32)
    local.get $value
    i64.extend_i32_s
    local.set $value|8
    i32.const 0
    local.get $value|8
    local.get $value|8
    i64.const 63
    i64.shr_s
    call $~lib/as-bignum/assembly/integer/u128/u128#constructor
    br $~lib/as-bignum/assembly/integer/u128/u128.fromI64|inlined.9
   end
   br $~lib/as-bignum/assembly/integer/u128/u128.from<i32>|inlined.9
  end
  return
 )
 (func $assembly/index/BalanceSheet#increase (param $this i32) (param $rune i32) (param $v i32)
  (local $record i32)
  (local $a i32)
  (local $b i32)
  (local $alo i64)
  (local $lo i64)
  (local $hi i64)
  local.get $this
  local.get $rune
  call $assembly/index/BalanceSheet#get
  local.set $record
  local.get $this
  local.get $rune
  block $~lib/as-bignum/assembly/integer/u128/u128.add|inlined.3 (result i32)
   local.get $v
   local.set $a
   local.get $record
   local.set $b
   local.get $a
   call $~lib/as-bignum/assembly/integer/u128/u128#get:lo
   local.set $alo
   local.get $alo
   local.get $b
   call $~lib/as-bignum/assembly/integer/u128/u128#get:lo
   i64.add
   local.set $lo
   local.get $a
   call $~lib/as-bignum/assembly/integer/u128/u128#get:hi
   local.get $b
   call $~lib/as-bignum/assembly/integer/u128/u128#get:hi
   i64.add
   local.get $lo
   local.get $alo
   i64.lt_u
   i64.extend_i32_u
   i64.add
   local.set $hi
   i32.const 0
   local.get $lo
   local.get $hi
   call $~lib/as-bignum/assembly/integer/u128/u128#constructor
   br $~lib/as-bignum/assembly/integer/u128/u128.add|inlined.3
  end
  call $assembly/index/BalanceSheet#set
 )
 (func $assembly/index/BalanceSheet#pipe (param $this i32) (param $b i32)
  (local $i i32)
  i32.const 0
  local.set $i
  loop $for-loop|0
   local.get $i
   local.get $this
   call $assembly/index/BalanceSheet#get:runes
   call $~lib/array/Array<~lib/arraybuffer/ArrayBuffer>#get:length
   i32.lt_s
   if
    local.get $b
    local.get $this
    call $assembly/index/BalanceSheet#get:runes
    local.get $i
    call $~lib/array/Array<~lib/arraybuffer/ArrayBuffer>#__get
    local.get $this
    call $assembly/index/BalanceSheet#get:balances
    local.get $i
    call $~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>#__get
    call $assembly/index/BalanceSheet#increase
    local.get $i
    i32.const 1
    i32.add
    local.set $i
    br $for-loop|0
   end
  end
 )
 (func $assembly/index/BalanceSheet.merge (param $a i32) (param $b i32) (result i32)
  (local $balanceSheet i32)
  i32.const 0
  call $assembly/index/BalanceSheet#constructor
  local.set $balanceSheet
  local.get $a
  local.get $balanceSheet
  call $assembly/index/BalanceSheet#pipe
  local.get $b
  local.get $balanceSheet
  call $assembly/index/BalanceSheet#pipe
  local.get $balanceSheet
  return
 )
 (func $assembly/index/BalanceSheet.concat~anonymous|0 (param $r i32) (param $v i32) (param $i i32) (param $ary i32) (result i32)
  local.get $r
  local.get $v
  call $assembly/index/BalanceSheet.merge
  return
 )
 (func $~lib/array/Array<assembly/index/BalanceSheet>#get:length_ (param $this i32) (result i32)
  local.get $this
  i32.load offset=12
 )
 (func $~lib/array/Array<assembly/index/BalanceSheet>#reduce<assembly/index/BalanceSheet> (param $this i32) (param $fn i32) (param $initialValue i32) (result i32)
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
  call $~lib/array/Array<assembly/index/BalanceSheet>#get:length_
  local.set $len
  loop $for-loop|0
   local.get $i
   local.get $len
   local.tee $6
   local.get $this
   call $~lib/array/Array<assembly/index/BalanceSheet>#get:length_
   local.tee $7
   local.get $6
   local.get $7
   i32.lt_s
   select
   i32.lt_s
   if
    local.get $acc
    local.get $this
    call $~lib/array/Array<assembly/index/BalanceSheet>#get:dataStart
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
 (func $assembly/index/BalanceSheet.concat (param $ary i32) (result i32)
  local.get $ary
  i32.const 5920
  i32.const 0
  call $assembly/index/BalanceSheet#constructor
  call $~lib/array/Array<assembly/index/BalanceSheet>#reduce<assembly/index/BalanceSheet>
  return
 )
 (func $assembly/index/RunestoneMessage#get:fields (param $this i32) (result i32)
  local.get $this
  i32.load
 )
 (func $~lib/array/Array<u8>#set:buffer (param $this i32) (param $buffer i32)
  local.get $this
  local.get $buffer
  i32.store
  local.get $this
  local.get $buffer
  i32.const 0
  call $~lib/rt/stub/__link
 )
 (func $~lib/array/Array<u8>#set:dataStart (param $this i32) (param $dataStart i32)
  local.get $this
  local.get $dataStart
  i32.store offset=4
 )
 (func $~lib/array/Array<u8>#set:byteLength (param $this i32) (param $byteLength i32)
  local.get $this
  local.get $byteLength
  i32.store offset=8
 )
 (func $~lib/array/Array<u8>#set:length_ (param $this i32) (param $length_ i32)
  local.get $this
  local.get $length_
  i32.store offset=12
 )
 (func $~lib/array/Array<u8>#constructor (param $this i32) (param $length i32) (result i32)
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
  call $~lib/array/Array<u8>#set:buffer
  local.get $this
  i32.const 0
  call $~lib/array/Array<u8>#set:dataStart
  local.get $this
  i32.const 0
  call $~lib/array/Array<u8>#set:byteLength
  local.get $this
  i32.const 0
  call $~lib/array/Array<u8>#set:length_
  local.get $length
  i32.const 1073741820
  i32.const 0
  i32.shr_u
  i32.gt_u
  if
   i32.const 1376
   i32.const 3360
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
  i32.const 0
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
  call $~lib/array/Array<u8>#set:buffer
  local.get $this
  local.get $buffer
  call $~lib/array/Array<u8>#set:dataStart
  local.get $this
  local.get $bufferSize
  call $~lib/array/Array<u8>#set:byteLength
  local.get $this
  local.get $length
  call $~lib/array/Array<u8>#set:length_
  local.get $this
 )
 (func $~lib/array/Array<u8>#get:dataStart (param $this i32) (result i32)
  local.get $this
  i32.load offset=4
 )
 (func $assembly/index/toArrayBuffer (param $data i32) (result i32)
  (local $this i32)
  (local $bigEndian i32)
  (local $result i32)
  (local $this|4 i32)
  (local $buffer i32)
  (local $bigEndian|6 i32)
  (local $this|7 i32)
  (local $buffer|8 i32)
  (local $this|9 i32)
  (local $buffer|10 i32)
  block $~lib/as-bignum/assembly/integer/u128/u128#toBytes|inlined.0 (result i32)
   local.get $data
   local.set $this
   i32.const 0
   local.set $bigEndian
   i32.const 0
   i32.const 16
   call $~lib/array/Array<u8>#constructor
   local.set $result
   local.get $this
   local.set $this|4
   local.get $result
   call $~lib/array/Array<u8>#get:dataStart
   local.set $buffer
   local.get $bigEndian
   local.set $bigEndian|6
   local.get $bigEndian|6
   if
    local.get $this|4
    local.set $this|7
    local.get $buffer
    local.set $buffer|8
    local.get $buffer|8
    local.get $this|7
    call $~lib/as-bignum/assembly/integer/u128/u128#get:hi
    call $~lib/polyfills/bswap<u64>
    i64.store
    local.get $buffer|8
    local.get $this|7
    call $~lib/as-bignum/assembly/integer/u128/u128#get:lo
    call $~lib/polyfills/bswap<u64>
    i64.store offset=8
   else
    local.get $this|4
    local.set $this|9
    local.get $buffer
    local.set $buffer|10
    local.get $buffer|10
    local.get $this|9
    call $~lib/as-bignum/assembly/integer/u128/u128#get:lo
    i64.store
    local.get $buffer|10
    local.get $this|9
    call $~lib/as-bignum/assembly/integer/u128/u128#get:hi
    i64.store offset=8
   end
   local.get $result
   br $~lib/as-bignum/assembly/integer/u128/u128#toBytes|inlined.0
  end
  call $~lib/metashrew-as/assembly/utils/box/Box.from
  call $~lib/metashrew-as/assembly/utils/box/Box#toArrayBuffer
  return
 )
 (func $assembly/index/fieldToArrayBuffer~anonymous|0 (param $v i32) (param $i i32) (param $ary i32) (result i32)
  local.get $v
  call $assembly/index/toArrayBuffer
  call $~lib/metashrew-as/assembly/utils/box/Box.from
 )
 (func $~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>#map<~lib/metashrew-as/assembly/utils/box/Box> (param $this i32) (param $fn i32) (result i32)
  (local $len i32)
  (local $out i32)
  (local $outStart i32)
  (local $i i32)
  (local $6 i32)
  (local $7 i32)
  (local $result i32)
  local.get $this
  call $~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>#get:length_
  local.set $len
  local.get $len
  i32.const 2
  i32.const 23
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
   call $~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>#get:length_
   local.tee $7
   local.get $6
   local.get $7
   i32.lt_s
   select
   i32.lt_s
   if
    local.get $this
    call $~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>#get:dataStart
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
 (func $assembly/index/fieldToArrayBuffer (param $data i32) (result i32)
  local.get $data
  i32.const 5952
  call $~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>#map<~lib/metashrew-as/assembly/utils/box/Box>
  call $~lib/metashrew-as/assembly/utils/box/Box.concat
  return
 )
 (func $assembly/index/RunestoneMessage#mintTo (param $this i32) (result i32)
  local.get $this
  call $assembly/index/RunestoneMessage#get:fields
  global.get $assembly/index/Field.MINT
  call $"~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#has"
  i32.eqz
  if
   i32.const 0
   return
  end
  local.get $this
  call $assembly/index/RunestoneMessage#get:fields
  global.get $assembly/index/Field.MINT
  call $"~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#get"
  call $assembly/index/fieldToArrayBuffer
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
 (func $assembly/index/fieldToU128 (param $data i32) (result i32)
  local.get $data
  i32.const 0
  call $~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>#__get
  return
 )
 (func $assembly/index/RunestoneMessage#getFlag (param $this i32) (param $position i64) (result i32)
  (local $flags i32)
  (local $value i32)
  (local $value|4 i64)
  (local $value|5 i32)
  (local $shift i32)
  (local $shift64 i64)
  (local $mod1 i64)
  (local $mod2 i64)
  (local $vl i64)
  (local $lo i64)
  (local $hi i64)
  (local $a i32)
  (local $b i32)
  (local $this|15 i32)
  local.get $this
  call $assembly/index/RunestoneMessage#get:fields
  global.get $assembly/index/Field.FLAGS
  call $"~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#get"
  call $assembly/index/fieldToU128
  local.set $flags
  block $~lib/as-bignum/assembly/integer/u128/u128#isZero|inlined.2 (result i32)
   block $~lib/as-bignum/assembly/integer/u128/u128.and|inlined.0 (result i32)
    local.get $flags
    local.set $a
    block $~lib/as-bignum/assembly/integer/u128/u128.shl|inlined.1 (result i32)
     block $~lib/as-bignum/assembly/integer/u128/u128.from<i32>|inlined.11 (result i32)
      i32.const 1
      local.set $value
      i32.const 0
      drop
      i32.const 0
      drop
      i32.const 0
      drop
      i32.const 0
      drop
      i32.const 0
      drop
      i32.const 1
      drop
      block $~lib/as-bignum/assembly/integer/u128/u128.fromI64|inlined.11 (result i32)
       local.get $value
       i64.extend_i32_s
       local.set $value|4
       i32.const 0
       local.get $value|4
       local.get $value|4
       i64.const 63
       i64.shr_s
       call $~lib/as-bignum/assembly/integer/u128/u128#constructor
       br $~lib/as-bignum/assembly/integer/u128/u128.fromI64|inlined.11
      end
      br $~lib/as-bignum/assembly/integer/u128/u128.from<i32>|inlined.11
     end
     local.set $value|5
     local.get $position
     i32.wrap_i64
     local.set $shift
     local.get $shift
     i32.const 127
     i32.and
     local.set $shift
     local.get $shift
     i64.extend_i32_s
     local.set $shift64
     local.get $shift64
     i64.const 127
     i64.add
     local.get $shift64
     i64.or
     i64.const 64
     i64.and
     i64.const 6
     i64.shr_u
     i64.const 1
     i64.sub
     local.set $mod1
     local.get $shift64
     i64.const 6
     i64.shr_u
     i64.const 1
     i64.sub
     local.set $mod2
     local.get $shift64
     i64.const 63
     i64.and
     local.set $shift64
     local.get $value|5
     call $~lib/as-bignum/assembly/integer/u128/u128#get:lo
     local.set $vl
     local.get $vl
     local.get $shift64
     i64.shl
     local.set $lo
     local.get $lo
     local.get $mod2
     i64.const -1
     i64.xor
     i64.and
     local.set $hi
     local.get $hi
     local.get $value|5
     call $~lib/as-bignum/assembly/integer/u128/u128#get:hi
     local.get $shift64
     i64.shl
     local.get $vl
     i64.const 64
     local.get $shift64
     i64.sub
     i64.shr_u
     local.get $mod1
     i64.and
     i64.or
     local.get $mod2
     i64.and
     i64.or
     local.set $hi
     i32.const 0
     local.get $lo
     local.get $mod2
     i64.and
     local.get $hi
     call $~lib/as-bignum/assembly/integer/u128/u128#constructor
     br $~lib/as-bignum/assembly/integer/u128/u128.shl|inlined.1
    end
    local.set $b
    i32.const 0
    local.get $a
    call $~lib/as-bignum/assembly/integer/u128/u128#get:lo
    local.get $b
    call $~lib/as-bignum/assembly/integer/u128/u128#get:lo
    i64.and
    local.get $a
    call $~lib/as-bignum/assembly/integer/u128/u128#get:hi
    local.get $b
    call $~lib/as-bignum/assembly/integer/u128/u128#get:hi
    i64.and
    call $~lib/as-bignum/assembly/integer/u128/u128#constructor
    br $~lib/as-bignum/assembly/integer/u128/u128.and|inlined.0
   end
   local.set $this|15
   local.get $this|15
   call $~lib/as-bignum/assembly/integer/u128/u128#get:lo
   local.get $this|15
   call $~lib/as-bignum/assembly/integer/u128/u128#get:hi
   i64.or
   i64.const 0
   i64.ne
   i32.eqz
   br $~lib/as-bignum/assembly/integer/u128/u128#isZero|inlined.2
  end
  i32.eqz
  return
 )
 (func $assembly/index/RunestoneMessage#isEtching (param $this i32) (result i32)
  local.get $this
  global.get $assembly/index/Flag.ETCHING
  call $assembly/index/RunestoneMessage#getFlag
  return
 )
 (func $assembly/index/stripNullRight (param $data i32) (result i32)
  (local $box i32)
  local.get $data
  call $~lib/metashrew-as/assembly/utils/box/Box.from
  local.set $box
  block $while-break|0
   loop $while-continue|0
    local.get $box
    call $~lib/metashrew-as/assembly/utils/box/Box#get:len
    i32.const 0
    i32.gt_u
    if
     local.get $box
     call $~lib/metashrew-as/assembly/utils/box/Box#get:start
     local.get $box
     call $~lib/metashrew-as/assembly/utils/box/Box#get:len
     i32.add
     i32.const 1
     i32.sub
     i32.load8_u
     i32.const 0
     i32.eq
     if
      local.get $box
      local.get $box
      call $~lib/metashrew-as/assembly/utils/box/Box#get:len
      i32.const 1
      i32.sub
      call $~lib/metashrew-as/assembly/utils/box/Box#set:len
     else
      br $while-break|0
     end
     br $while-continue|0
    end
   end
  end
  local.get $box
  call $~lib/metashrew-as/assembly/utils/box/Box#toArrayBuffer
  return
 )
 (func $assembly/index/RuneId#set:block (param $this i32) (param $block i64)
  local.get $this
  local.get $block
  i64.store
 )
 (func $assembly/index/RuneId#set:tx (param $this i32) (param $tx i32)
  local.get $this
  local.get $tx
  i32.store offset=8
 )
 (func $assembly/index/RuneId#constructor (param $this i32) (param $block i64) (param $tx i32) (result i32)
  local.get $this
  i32.eqz
  if
   i32.const 12
   i32.const 50
   call $~lib/rt/stub/__new
   local.set $this
  end
  local.get $this
  i64.const 0
  call $assembly/index/RuneId#set:block
  local.get $this
  i32.const 0
  call $assembly/index/RuneId#set:tx
  local.get $this
  local.get $block
  call $assembly/index/RuneId#set:block
  local.get $this
  local.get $tx
  call $assembly/index/RuneId#set:tx
  local.get $this
 )
 (func $assembly/index/RuneId#get:tx (param $this i32) (result i32)
  local.get $this
  i32.load offset=8
 )
 (func $assembly/index/RuneId#get:block (param $this i32) (result i64)
  local.get $this
  i64.load
 )
 (func $assembly/index/RuneId#toU128 (param $this i32) (result i32)
  i32.const 0
  local.get $this
  call $assembly/index/RuneId#get:tx
  i64.extend_i32_u
  local.get $this
  call $assembly/index/RuneId#get:block
  call $~lib/as-bignum/assembly/integer/u128/u128#constructor
  return
 )
 (func $assembly/index/RuneId#toBytes (param $this i32) (result i32)
  local.get $this
  call $assembly/index/RuneId#toU128
  call $assembly/index/toArrayBuffer
  return
 )
 (func $assembly/index/toPrimitive<u8> (param $v i32) (result i32)
  local.get $v
  call $~lib/as-bignum/assembly/integer/u128/u128#get:lo
  i32.wrap_i64
  return
 )
 (func $assembly/index/fieldTo<u8> (param $data i32) (result i32)
  local.get $data
  i32.const 0
  call $~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>#__get
  call $assembly/index/toPrimitive<u8>
  return
 )
 (func $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#setValue<u8> (param $this i32) (param $v i32)
  (local $value i32)
  i32.const 0
  i32.const 1
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.set $value
  local.get $value
  local.get $v
  i32.store8
  local.get $this
  local.get $value
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#set
 )
 (func $assembly/index/BalanceSheet.fromPairs (param $runes i32) (param $balances i32) (result i32)
  (local $balanceSheet i32)
  (local $i i32)
  i32.const 0
  call $assembly/index/BalanceSheet#constructor
  local.set $balanceSheet
  i32.const 0
  local.set $i
  loop $for-loop|0
   local.get $i
   local.get $runes
   call $~lib/array/Array<~lib/arraybuffer/ArrayBuffer>#get:length
   i32.lt_s
   if
    local.get $balanceSheet
    local.get $runes
    local.get $i
    call $~lib/array/Array<~lib/arraybuffer/ArrayBuffer>#__get
    local.get $balances
    local.get $i
    call $~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>#__get
    call $assembly/index/BalanceSheet#set
    local.get $i
    i32.const 1
    i32.add
    local.set $i
    br $for-loop|0
   end
  end
  local.get $balanceSheet
  return
 )
 (func $assembly/index/toPrimitive<u64> (param $v i32) (result i64)
  local.get $v
  call $~lib/as-bignum/assembly/integer/u128/u128#get:lo
  return
 )
 (func $assembly/index/fieldTo<u64> (param $data i32) (result i64)
  local.get $data
  i32.const 0
  call $~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>#__get
  call $assembly/index/toPrimitive<u64>
  return
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
 (func $assembly/index/toPrimitive<u32> (param $v i32) (result i32)
  local.get $v
  call $~lib/as-bignum/assembly/integer/u128/u128#get:lo
  i32.wrap_i64
  return
 )
 (func $assembly/index/fieldTo<u32> (param $data i32) (result i32)
  local.get $data
  i32.const 0
  call $~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>#__get
  call $assembly/index/toPrimitive<u32>
  return
 )
 (func $"~lib/map/Map<u32,assembly/index/BalanceSheet>#set:buckets" (param $this i32) (param $buckets i32)
  local.get $this
  local.get $buckets
  i32.store
  local.get $this
  local.get $buckets
  i32.const 0
  call $~lib/rt/stub/__link
 )
 (func $"~lib/map/Map<u32,assembly/index/BalanceSheet>#set:bucketsMask" (param $this i32) (param $bucketsMask i32)
  local.get $this
  local.get $bucketsMask
  i32.store offset=4
 )
 (func $"~lib/map/Map<u32,assembly/index/BalanceSheet>#set:entries" (param $this i32) (param $entries i32)
  local.get $this
  local.get $entries
  i32.store offset=8
  local.get $this
  local.get $entries
  i32.const 0
  call $~lib/rt/stub/__link
 )
 (func $"~lib/map/Map<u32,assembly/index/BalanceSheet>#set:entriesCapacity" (param $this i32) (param $entriesCapacity i32)
  local.get $this
  local.get $entriesCapacity
  i32.store offset=12
 )
 (func $"~lib/map/Map<u32,assembly/index/BalanceSheet>#set:entriesOffset" (param $this i32) (param $entriesOffset i32)
  local.get $this
  local.get $entriesOffset
  i32.store offset=16
 )
 (func $"~lib/map/Map<u32,assembly/index/BalanceSheet>#set:entriesCount" (param $this i32) (param $entriesCount i32)
  local.get $this
  local.get $entriesCount
  i32.store offset=20
 )
 (func $"~lib/map/Map<u32,assembly/index/BalanceSheet>#constructor" (param $this i32) (result i32)
  local.get $this
  i32.eqz
  if
   i32.const 24
   i32.const 51
   call $~lib/rt/stub/__new
   local.set $this
  end
  local.get $this
  i32.const 0
  i32.const 4
  i32.const 4
  i32.mul
  call $~lib/arraybuffer/ArrayBuffer#constructor
  call $"~lib/map/Map<u32,assembly/index/BalanceSheet>#set:buckets"
  local.get $this
  i32.const 4
  i32.const 1
  i32.sub
  call $"~lib/map/Map<u32,assembly/index/BalanceSheet>#set:bucketsMask"
  local.get $this
  i32.const 0
  i32.const 4
  block $"~lib/map/ENTRY_SIZE<u32,assembly/index/BalanceSheet>|inlined.0" (result i32)
   i32.const 12
   br $"~lib/map/ENTRY_SIZE<u32,assembly/index/BalanceSheet>|inlined.0"
  end
  i32.mul
  call $~lib/arraybuffer/ArrayBuffer#constructor
  call $"~lib/map/Map<u32,assembly/index/BalanceSheet>#set:entries"
  local.get $this
  i32.const 4
  call $"~lib/map/Map<u32,assembly/index/BalanceSheet>#set:entriesCapacity"
  local.get $this
  i32.const 0
  call $"~lib/map/Map<u32,assembly/index/BalanceSheet>#set:entriesOffset"
  local.get $this
  i32.const 0
  call $"~lib/map/Map<u32,assembly/index/BalanceSheet>#set:entriesCount"
  local.get $this
 )
 (func $~lib/array/Array<assembly/index/Edict>#get:length (param $this i32) (result i32)
  local.get $this
  call $~lib/array/Array<assembly/index/Edict>#get:length_
  return
 )
 (func $~lib/array/Array<assembly/index/Edict>#__get (param $this i32) (param $index i32) (result i32)
  (local $value i32)
  local.get $index
  local.get $this
  call $~lib/array/Array<assembly/index/Edict>#get:length_
  i32.ge_u
  if
   i32.const 2112
   i32.const 3360
   i32.const 114
   i32.const 42
   call $~lib/builtins/abort
   unreachable
  end
  local.get $this
  call $~lib/array/Array<assembly/index/Edict>#get:dataStart
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
   i32.const 3408
   i32.const 3360
   i32.const 118
   i32.const 40
   call $~lib/builtins/abort
   unreachable
  end
  local.get $value
  return
 )
 (func $assembly/index/Edict#get:output (param $this i32) (result i32)
  local.get $this
  i32.load offset=12
 )
 (func $assembly/index/Edict#runeId (param $this i32) (result i32)
  i32.const 0
  local.get $this
  call $assembly/index/Edict#get:block
  call $~lib/as-bignum/assembly/integer/u128/u128#get:lo
  local.get $this
  call $assembly/index/Edict#get:transactionIndex
  call $~lib/as-bignum/assembly/integer/u128/u128#get:lo
  i32.wrap_i64
  call $assembly/index/RuneId#constructor
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
 (func $"~lib/map/Map<u32,assembly/index/BalanceSheet>#get:buckets" (param $this i32) (result i32)
  local.get $this
  i32.load
 )
 (func $"~lib/map/Map<u32,assembly/index/BalanceSheet>#get:bucketsMask" (param $this i32) (result i32)
  local.get $this
  i32.load offset=4
 )
 (func $"~lib/map/MapEntry<u32,assembly/index/BalanceSheet>#get:taggedNext" (param $this i32) (result i32)
  local.get $this
  i32.load offset=8
 )
 (func $"~lib/map/MapEntry<u32,assembly/index/BalanceSheet>#get:key" (param $this i32) (result i32)
  local.get $this
  i32.load
 )
 (func $"~lib/map/Map<u32,assembly/index/BalanceSheet>#find" (param $this i32) (param $key i32) (param $hashCode i32) (result i32)
  (local $entry i32)
  (local $taggedNext i32)
  local.get $this
  call $"~lib/map/Map<u32,assembly/index/BalanceSheet>#get:buckets"
  local.get $hashCode
  local.get $this
  call $"~lib/map/Map<u32,assembly/index/BalanceSheet>#get:bucketsMask"
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
    call $"~lib/map/MapEntry<u32,assembly/index/BalanceSheet>#get:taggedNext"
    local.set $taggedNext
    local.get $taggedNext
    i32.const 1
    i32.and
    i32.eqz
    if (result i32)
     local.get $entry
     call $"~lib/map/MapEntry<u32,assembly/index/BalanceSheet>#get:key"
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
 (func $"~lib/map/Map<u32,assembly/index/BalanceSheet>#has" (param $this i32) (param $key i32) (result i32)
  local.get $this
  local.get $key
  local.get $key
  call $~lib/util/hash/HASH<u32>
  call $"~lib/map/Map<u32,assembly/index/BalanceSheet>#find"
  i32.const 0
  i32.ne
  return
 )
 (func $"~lib/map/MapEntry<u32,assembly/index/BalanceSheet>#set:value" (param $this i32) (param $value i32)
  local.get $this
  local.get $value
  i32.store offset=4
 )
 (func $"~lib/map/Map<u32,assembly/index/BalanceSheet>#get:entriesOffset" (param $this i32) (result i32)
  local.get $this
  i32.load offset=16
 )
 (func $"~lib/map/Map<u32,assembly/index/BalanceSheet>#get:entriesCapacity" (param $this i32) (result i32)
  local.get $this
  i32.load offset=12
 )
 (func $"~lib/map/Map<u32,assembly/index/BalanceSheet>#get:entriesCount" (param $this i32) (result i32)
  local.get $this
  i32.load offset=20
 )
 (func $"~lib/map/Map<u32,assembly/index/BalanceSheet>#get:entries" (param $this i32) (result i32)
  local.get $this
  i32.load offset=8
 )
 (func $"~lib/map/MapEntry<u32,assembly/index/BalanceSheet>#set:key" (param $this i32) (param $key i32)
  local.get $this
  local.get $key
  i32.store
 )
 (func $"~lib/map/MapEntry<u32,assembly/index/BalanceSheet>#get:value" (param $this i32) (result i32)
  local.get $this
  i32.load offset=4
 )
 (func $"~lib/map/MapEntry<u32,assembly/index/BalanceSheet>#set:taggedNext" (param $this i32) (param $taggedNext i32)
  local.get $this
  local.get $taggedNext
  i32.store offset=8
 )
 (func $"~lib/map/Map<u32,assembly/index/BalanceSheet>#rehash" (param $this i32) (param $newBucketsMask i32)
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
  block $"~lib/map/ENTRY_SIZE<u32,assembly/index/BalanceSheet>|inlined.1" (result i32)
   i32.const 12
   br $"~lib/map/ENTRY_SIZE<u32,assembly/index/BalanceSheet>|inlined.1"
  end
  i32.mul
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.set $newEntries
  local.get $this
  call $"~lib/map/Map<u32,assembly/index/BalanceSheet>#get:entries"
  local.set $oldPtr
  local.get $oldPtr
  local.get $this
  call $"~lib/map/Map<u32,assembly/index/BalanceSheet>#get:entriesOffset"
  block $"~lib/map/ENTRY_SIZE<u32,assembly/index/BalanceSheet>|inlined.2" (result i32)
   i32.const 12
   br $"~lib/map/ENTRY_SIZE<u32,assembly/index/BalanceSheet>|inlined.2"
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
    call $"~lib/map/MapEntry<u32,assembly/index/BalanceSheet>#get:taggedNext"
    i32.const 1
    i32.and
    i32.eqz
    if
     local.get $newPtr
     local.set $newEntry
     local.get $oldEntry
     call $"~lib/map/MapEntry<u32,assembly/index/BalanceSheet>#get:key"
     local.set $oldEntryKey
     local.get $newEntry
     local.get $oldEntryKey
     call $"~lib/map/MapEntry<u32,assembly/index/BalanceSheet>#set:key"
     local.get $newEntry
     local.get $oldEntry
     call $"~lib/map/MapEntry<u32,assembly/index/BalanceSheet>#get:value"
     call $"~lib/map/MapEntry<u32,assembly/index/BalanceSheet>#set:value"
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
     call $"~lib/map/MapEntry<u32,assembly/index/BalanceSheet>#set:taggedNext"
     local.get $newBucketPtrBase
     local.get $newPtr
     i32.store
     local.get $newPtr
     block $"~lib/map/ENTRY_SIZE<u32,assembly/index/BalanceSheet>|inlined.3" (result i32)
      i32.const 12
      br $"~lib/map/ENTRY_SIZE<u32,assembly/index/BalanceSheet>|inlined.3"
     end
     i32.add
     local.set $newPtr
    end
    local.get $oldPtr
    block $"~lib/map/ENTRY_SIZE<u32,assembly/index/BalanceSheet>|inlined.4" (result i32)
     i32.const 12
     br $"~lib/map/ENTRY_SIZE<u32,assembly/index/BalanceSheet>|inlined.4"
    end
    i32.add
    local.set $oldPtr
    br $while-continue|0
   end
  end
  local.get $this
  local.get $newBuckets
  call $"~lib/map/Map<u32,assembly/index/BalanceSheet>#set:buckets"
  local.get $this
  local.get $newBucketsMask
  call $"~lib/map/Map<u32,assembly/index/BalanceSheet>#set:bucketsMask"
  local.get $this
  local.get $newEntries
  call $"~lib/map/Map<u32,assembly/index/BalanceSheet>#set:entries"
  local.get $this
  local.get $newEntriesCapacity
  call $"~lib/map/Map<u32,assembly/index/BalanceSheet>#set:entriesCapacity"
  local.get $this
  local.get $this
  call $"~lib/map/Map<u32,assembly/index/BalanceSheet>#get:entriesCount"
  call $"~lib/map/Map<u32,assembly/index/BalanceSheet>#set:entriesOffset"
 )
 (func $"~lib/map/Map<u32,assembly/index/BalanceSheet>#set" (param $this i32) (param $key i32) (param $value i32) (result i32)
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
  call $"~lib/map/Map<u32,assembly/index/BalanceSheet>#find"
  local.set $entry
  local.get $entry
  if
   local.get $entry
   local.get $value
   call $"~lib/map/MapEntry<u32,assembly/index/BalanceSheet>#set:value"
   i32.const 1
   drop
   local.get $this
   local.get $value
   i32.const 1
   call $~lib/rt/stub/__link
  else
   local.get $this
   call $"~lib/map/Map<u32,assembly/index/BalanceSheet>#get:entriesOffset"
   local.get $this
   call $"~lib/map/Map<u32,assembly/index/BalanceSheet>#get:entriesCapacity"
   i32.eq
   if
    local.get $this
    local.get $this
    call $"~lib/map/Map<u32,assembly/index/BalanceSheet>#get:entriesCount"
    local.get $this
    call $"~lib/map/Map<u32,assembly/index/BalanceSheet>#get:entriesCapacity"
    i32.const 3
    i32.mul
    i32.const 4
    i32.div_s
    i32.lt_s
    if (result i32)
     local.get $this
     call $"~lib/map/Map<u32,assembly/index/BalanceSheet>#get:bucketsMask"
    else
     local.get $this
     call $"~lib/map/Map<u32,assembly/index/BalanceSheet>#get:bucketsMask"
     i32.const 1
     i32.shl
     i32.const 1
     i32.or
    end
    call $"~lib/map/Map<u32,assembly/index/BalanceSheet>#rehash"
   end
   local.get $this
   call $"~lib/map/Map<u32,assembly/index/BalanceSheet>#get:entries"
   local.set $entries
   local.get $entries
   local.get $this
   local.get $this
   call $"~lib/map/Map<u32,assembly/index/BalanceSheet>#get:entriesOffset"
   local.tee $6
   i32.const 1
   i32.add
   call $"~lib/map/Map<u32,assembly/index/BalanceSheet>#set:entriesOffset"
   local.get $6
   block $"~lib/map/ENTRY_SIZE<u32,assembly/index/BalanceSheet>|inlined.5" (result i32)
    i32.const 12
    br $"~lib/map/ENTRY_SIZE<u32,assembly/index/BalanceSheet>|inlined.5"
   end
   i32.mul
   i32.add
   local.set $entry
   local.get $entry
   local.get $key
   call $"~lib/map/MapEntry<u32,assembly/index/BalanceSheet>#set:key"
   i32.const 0
   drop
   local.get $entry
   local.get $value
   call $"~lib/map/MapEntry<u32,assembly/index/BalanceSheet>#set:value"
   i32.const 1
   drop
   local.get $this
   local.get $value
   i32.const 1
   call $~lib/rt/stub/__link
   local.get $this
   local.get $this
   call $"~lib/map/Map<u32,assembly/index/BalanceSheet>#get:entriesCount"
   i32.const 1
   i32.add
   call $"~lib/map/Map<u32,assembly/index/BalanceSheet>#set:entriesCount"
   local.get $this
   call $"~lib/map/Map<u32,assembly/index/BalanceSheet>#get:buckets"
   local.get $hashCode
   local.get $this
   call $"~lib/map/Map<u32,assembly/index/BalanceSheet>#get:bucketsMask"
   i32.and
   i32.const 4
   i32.mul
   i32.add
   local.set $bucketPtrBase
   local.get $entry
   local.get $bucketPtrBase
   i32.load
   call $"~lib/map/MapEntry<u32,assembly/index/BalanceSheet>#set:taggedNext"
   local.get $bucketPtrBase
   local.get $entry
   i32.store
  end
  local.get $this
  return
 )
 (func $"~lib/map/Map<u32,assembly/index/BalanceSheet>#get" (param $this i32) (param $key i32) (result i32)
  (local $entry i32)
  local.get $this
  local.get $key
  local.get $key
  call $~lib/util/hash/HASH<u32>
  call $"~lib/map/Map<u32,assembly/index/BalanceSheet>#find"
  local.set $entry
  local.get $entry
  i32.eqz
  if
   i32.const 3680
   i32.const 3744
   i32.const 105
   i32.const 17
   call $~lib/builtins/abort
   unreachable
  end
  local.get $entry
  call $"~lib/map/MapEntry<u32,assembly/index/BalanceSheet>#get:value"
  return
 )
 (func $assembly/index/Edict#get:amount (param $this i32) (result i32)
  local.get $this
  i32.load offset=8
 )
 (func $assembly/index/min<~lib/as-bignum/assembly/integer/u128/u128> (param $a i32) (param $b i32) (result i32)
  (local $a|2 i32)
  (local $b|3 i32)
  (local $ah i64)
  (local $bh i64)
  block $~lib/as-bignum/assembly/integer/u128/u128.gt|inlined.0 (result i32)
   local.get $a
   local.set $a|2
   local.get $b
   local.set $b|3
   local.get $a|2
   call $~lib/as-bignum/assembly/integer/u128/u128#get:hi
   local.set $ah
   local.get $b|3
   call $~lib/as-bignum/assembly/integer/u128/u128#get:hi
   local.set $bh
   local.get $ah
   local.get $bh
   i64.eq
   if (result i32)
    local.get $a|2
    call $~lib/as-bignum/assembly/integer/u128/u128#get:lo
    local.get $b|3
    call $~lib/as-bignum/assembly/integer/u128/u128#get:lo
    i64.gt_u
   else
    local.get $ah
    local.get $bh
    i64.gt_u
   end
   br $~lib/as-bignum/assembly/integer/u128/u128.gt|inlined.0
  end
  if
   local.get $b
   return
  end
  local.get $a
  return
 )
 (func $assembly/index/BalanceSheet#decrease (param $this i32) (param $rune i32) (param $v i32) (result i32)
  (local $record i32)
  (local $a i32)
  (local $b i32)
  (local $ah i64)
  (local $bh i64)
  (local $a|8 i32)
  (local $b|9 i32)
  (local $alo i64)
  (local $lo i64)
  (local $hi i64)
  local.get $this
  local.get $rune
  call $assembly/index/BalanceSheet#get
  local.set $record
  block $~lib/as-bignum/assembly/integer/u128/u128.lt|inlined.0 (result i32)
   local.get $record
   local.set $a
   local.get $v
   local.set $b
   local.get $a
   call $~lib/as-bignum/assembly/integer/u128/u128#get:hi
   local.set $ah
   local.get $b
   call $~lib/as-bignum/assembly/integer/u128/u128#get:hi
   local.set $bh
   local.get $ah
   local.get $bh
   i64.eq
   if (result i32)
    local.get $a
    call $~lib/as-bignum/assembly/integer/u128/u128#get:lo
    local.get $b
    call $~lib/as-bignum/assembly/integer/u128/u128#get:lo
    i64.lt_u
   else
    local.get $ah
    local.get $bh
    i64.lt_u
   end
   br $~lib/as-bignum/assembly/integer/u128/u128.lt|inlined.0
  end
  if
   i32.const 0
   return
  end
  local.get $this
  local.get $rune
  block $~lib/as-bignum/assembly/integer/u128/u128.sub|inlined.1 (result i32)
   local.get $record
   local.set $a|8
   local.get $v
   local.set $b|9
   local.get $a|8
   call $~lib/as-bignum/assembly/integer/u128/u128#get:lo
   local.set $alo
   local.get $alo
   local.get $b|9
   call $~lib/as-bignum/assembly/integer/u128/u128#get:lo
   i64.sub
   local.set $lo
   local.get $a|8
   call $~lib/as-bignum/assembly/integer/u128/u128#get:hi
   local.get $b|9
   call $~lib/as-bignum/assembly/integer/u128/u128#get:hi
   i64.sub
   local.get $lo
   local.get $alo
   i64.gt_u
   i64.extend_i32_u
   i64.sub
   local.set $hi
   i32.const 0
   local.get $lo
   local.get $hi
   call $~lib/as-bignum/assembly/integer/u128/u128#constructor
   br $~lib/as-bignum/assembly/integer/u128/u128.sub|inlined.1
  end
  call $assembly/index/BalanceSheet#set
  i32.const 1
  return
 )
 (func $assembly/index/RunesTransaction#defaultOutput (param $this i32) (result i32)
  (local $i i32)
  i32.const 0
  local.set $i
  loop $for-loop|0
   local.get $i
   local.get $this
   call $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#get:outs
   call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Output>#get:length
   i32.lt_s
   if
    local.get $this
    call $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#get:outs
    local.get $i
    call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Output>#__get
    call $~lib/metashrew-as/assembly/blockdata/transaction/Output#get:script
    call $~lib/metashrew-as/assembly/utils/box/Box#get:start
    i32.load8_u
    global.get $assembly/index/OP_RETURN
    i32.ne
    if
     local.get $i
     return
    end
    local.get $i
    i32.const 1
    i32.add
    local.set $i
    br $for-loop|0
   end
  end
  i32.const -1
  return
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
   i32.const 6
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
   i32.const 1376
   i32.const 3360
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
    i32.const 2112
    i32.const 3360
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
 (func $"~lib/map/Map<u32,assembly/index/BalanceSheet>#keys" (param $this i32) (result i32)
  (local $start i32)
  (local $size i32)
  (local $keys i32)
  (local $length i32)
  (local $i i32)
  (local $entry i32)
  (local $7 i32)
  local.get $this
  call $"~lib/map/Map<u32,assembly/index/BalanceSheet>#get:entries"
  local.set $start
  local.get $this
  call $"~lib/map/Map<u32,assembly/index/BalanceSheet>#get:entriesOffset"
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
    block $"~lib/map/ENTRY_SIZE<u32,assembly/index/BalanceSheet>|inlined.6" (result i32)
     i32.const 12
     br $"~lib/map/ENTRY_SIZE<u32,assembly/index/BalanceSheet>|inlined.6"
    end
    i32.mul
    i32.add
    local.set $entry
    local.get $entry
    call $"~lib/map/MapEntry<u32,assembly/index/BalanceSheet>#get:taggedNext"
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
     call $"~lib/map/MapEntry<u32,assembly/index/BalanceSheet>#get:key"
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
 (func $~lib/array/Array<u32>#get:length (param $this i32) (result i32)
  local.get $this
  call $~lib/array/Array<u32>#get:length_
  return
 )
 (func $~lib/array/Array<u32>#__get (param $this i32) (param $index i32) (result i32)
  (local $value i32)
  local.get $index
  local.get $this
  call $~lib/array/Array<u32>#get:length_
  i32.ge_u
  if
   i32.const 2112
   i32.const 3360
   i32.const 114
   i32.const 42
   call $~lib/builtins/abort
   unreachable
  end
  local.get $this
  call $~lib/array/Array<u32>#get:dataStart
  local.get $index
  i32.const 2
  i32.shl
  i32.add
  i32.load
  local.set $value
  i32.const 0
  drop
  local.get $value
  return
 )
 (func $assembly/index/BalanceSheet#save (param $this i32) (param $ptr i32)
  (local $runesPtr i32)
  (local $balancesPtr i32)
  (local $i i32)
  (local $value i32)
  (local $value|6 i64)
  (local $a i32)
  (local $b i32)
  (local $this|9 i32)
  (local $bigEndian i32)
  (local $result i32)
  (local $this|12 i32)
  (local $buffer i32)
  (local $bigEndian|14 i32)
  (local $this|15 i32)
  (local $buffer|16 i32)
  (local $this|17 i32)
  (local $buffer|18 i32)
  local.get $ptr
  i32.const 5696
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#keyword
  local.set $runesPtr
  local.get $ptr
  i32.const 5728
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#keyword
  local.set $balancesPtr
  i32.const 0
  local.set $i
  loop $for-loop|0
   local.get $i
   local.get $this
   call $assembly/index/BalanceSheet#get:runes
   call $~lib/array/Array<~lib/arraybuffer/ArrayBuffer>#get:length
   i32.lt_s
   if
    block $~lib/as-bignum/assembly/integer/u128/u128.eq|inlined.0 (result i32)
     local.get $this
     call $assembly/index/BalanceSheet#get:balances
     local.get $i
     call $~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>#__get
     local.set $a
     block $~lib/as-bignum/assembly/integer/u128/u128.from<i32>|inlined.12 (result i32)
      i32.const 0
      local.set $value
      i32.const 0
      drop
      i32.const 0
      drop
      i32.const 0
      drop
      i32.const 0
      drop
      i32.const 0
      drop
      i32.const 1
      drop
      block $~lib/as-bignum/assembly/integer/u128/u128.fromI64|inlined.12 (result i32)
       local.get $value
       i64.extend_i32_s
       local.set $value|6
       i32.const 0
       local.get $value|6
       local.get $value|6
       i64.const 63
       i64.shr_s
       call $~lib/as-bignum/assembly/integer/u128/u128#constructor
       br $~lib/as-bignum/assembly/integer/u128/u128.fromI64|inlined.12
      end
      br $~lib/as-bignum/assembly/integer/u128/u128.from<i32>|inlined.12
     end
     local.set $b
     local.get $a
     call $~lib/as-bignum/assembly/integer/u128/u128#get:hi
     local.get $b
     call $~lib/as-bignum/assembly/integer/u128/u128#get:hi
     i64.eq
     if (result i32)
      local.get $a
      call $~lib/as-bignum/assembly/integer/u128/u128#get:lo
      local.get $b
      call $~lib/as-bignum/assembly/integer/u128/u128#get:lo
      i64.eq
     else
      i32.const 0
     end
     br $~lib/as-bignum/assembly/integer/u128/u128.eq|inlined.0
    end
    if
     local.get $runesPtr
     local.get $this
     call $assembly/index/BalanceSheet#get:runes
     local.get $i
     call $~lib/array/Array<~lib/arraybuffer/ArrayBuffer>#__get
     call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#append
     local.get $balancesPtr
     block $~lib/as-bignum/assembly/integer/u128/u128#toBytes|inlined.1 (result i32)
      local.get $this
      call $assembly/index/BalanceSheet#get:balances
      local.get $i
      call $~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>#__get
      local.set $this|9
      i32.const 0
      local.set $bigEndian
      i32.const 0
      i32.const 16
      call $~lib/array/Array<u8>#constructor
      local.set $result
      local.get $this|9
      local.set $this|12
      local.get $result
      call $~lib/array/Array<u8>#get:dataStart
      local.set $buffer
      local.get $bigEndian
      local.set $bigEndian|14
      local.get $bigEndian|14
      if
       local.get $this|12
       local.set $this|15
       local.get $buffer
       local.set $buffer|16
       local.get $buffer|16
       local.get $this|15
       call $~lib/as-bignum/assembly/integer/u128/u128#get:hi
       call $~lib/polyfills/bswap<u64>
       i64.store
       local.get $buffer|16
       local.get $this|15
       call $~lib/as-bignum/assembly/integer/u128/u128#get:lo
       call $~lib/polyfills/bswap<u64>
       i64.store offset=8
      else
       local.get $this|12
       local.set $this|17
       local.get $buffer
       local.set $buffer|18
       local.get $buffer|18
       local.get $this|17
       call $~lib/as-bignum/assembly/integer/u128/u128#get:lo
       i64.store
       local.get $buffer|18
       local.get $this|17
       call $~lib/as-bignum/assembly/integer/u128/u128#get:hi
       i64.store offset=8
      end
      local.get $result
      br $~lib/as-bignum/assembly/integer/u128/u128#toBytes|inlined.1
     end
     call $~lib/metashrew-as/assembly/utils/box/Box.from
     call $~lib/metashrew-as/assembly/utils/box/Box#toArrayBuffer
     call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#append
    end
    local.get $i
    i32.const 1
    i32.add
    local.set $i
    br $for-loop|0
   end
  end
 )
 (func $assembly/index/Index.indexBlock (param $height i32) (param $_block i32)
  (local $block i32)
  (local $i i32)
  (local $this i32)
  (local $index i32)
  (local $tx i32)
  (local $txid i32)
  (local $runestoneOutputIndex i32)
  (local $runestoneOutput i32)
  (local $outpoint i32)
  (local $parsed i32)
  (local $payload i32)
  (local $message i32)
  (local $edicts i32)
  (local $etchingBalanceSheet i32)
  (local $balanceSheet i32)
  (local $mintTo i32)
  (local $name i32)
  (local $remaining i32)
  (local $this|20 i32)
  (local $heightStart i64)
  (local $heightEnd i64)
  (local $offsetStart i64)
  (local $offsetEnd i64)
  (local $etchingHeight i32)
  (local $value i32)
  (local $value|27 i64)
  (local $a i32)
  (local $b i32)
  (local $alo i64)
  (local $lo i64)
  (local $hi i64)
  (local $name|33 i32)
  (local $runeId i32)
  (local $premine i32)
  (local $36 i32)
  (local $37 i32)
  (local $38 i32)
  (local $39 i32)
  (local $balancesByOutput i32)
  (local $i|41 i32)
  (local $edict i32)
  (local $edictOutput i32)
  (local $runeId|44 i32)
  (local $outputBalanceSheet i32)
  (local $amount i32)
  (local $unallocatedTo i32)
  (local $runesToOutputs i32)
  (local $i|49 i32)
  local.get $_block
  local.set $block
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
  global.get $assembly/index/HEIGHT_TO_TRANSACTION_IDS
  local.get $height
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#selectValue<u32>
  call $assembly/index/RunesBlock#saveTransactions
  i32.const 0
  local.set $i
  loop $for-loop|0
   local.get $i
   local.get $block
   call $~lib/metashrew-as/assembly/blockdata/block/Block#get:transactions
   call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Transaction>#get:length
   i32.lt_s
   if
    block $for-continue|0
     block $assembly/index/RunesBlock#getTransaction|inlined.1 (result i32)
      local.get $block
      local.set $this
      local.get $i
      local.set $index
      local.get $this
      call $~lib/metashrew-as/assembly/blockdata/block/Block#get:transactions
      local.get $index
      call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Transaction>#__get
      br $assembly/index/RunesBlock#getTransaction|inlined.1
     end
     local.set $tx
     local.get $tx
     call $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#txid
     local.set $txid
     local.get $tx
     local.get $txid
     local.get $height
     call $assembly/index/Index.indexOutpoints
     local.get $tx
     call $assembly/index/RunesTransaction#runestoneOutputIndex
     local.set $runestoneOutputIndex
     local.get $runestoneOutputIndex
     i32.const -1
     i32.ne
     if
      local.get $tx
      call $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#get:outs
      local.get $runestoneOutputIndex
      call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Output>#__get
      local.set $runestoneOutput
      local.get $tx
      local.get $runestoneOutputIndex
      call $assembly/index/RunesTransaction#outpoint
      local.set $outpoint
      local.get $runestoneOutput
      call $~lib/metashrew-as/assembly/blockdata/transaction/Output#get:script
      call $~lib/metashrew-as/assembly/utils/yabsp/scriptParse
      i32.const 2
      i32.const 1
      global.set $~argumentsLength
      i32.const 0
      call $~lib/array/Array<~lib/metashrew-as/assembly/utils/box/Box>#slice@varargs
      local.set $parsed
      local.get $parsed
      i32.const 5632
      call $~lib/array/Array<~lib/metashrew-as/assembly/utils/box/Box>#findIndex
      i32.const -1
      i32.ne
      if
       br $for-continue|0
      end
      local.get $parsed
      call $~lib/metashrew-as/assembly/utils/box/Box.concat
      local.set $payload
      local.get $payload
      call $assembly/index/RunestoneMessage.parse
      local.set $message
      local.get $message
      call $assembly/index/RunestoneMessage#get:edicts
      call $assembly/index/Edict.fromDeltaSeries
      local.set $edicts
      i32.const 0
      local.set $etchingBalanceSheet
      local.get $tx
      call $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#get:ins
      i32.const 5888
      call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Input>#map<assembly/index/BalanceSheet>
      call $assembly/index/BalanceSheet.concat
      local.set $balanceSheet
      local.get $message
      call $assembly/index/RunestoneMessage#mintTo
      local.set $mintTo
      local.get $mintTo
      i32.const 0
      i32.ne
      if
       global.get $assembly/index/RUNE_ID_TO_ETCHING
       local.get $mintTo
       call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
       call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#get
       local.set $name
       global.get $assembly/index/MINTS_REMAINING
       local.get $name
       call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
       call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#get
       call $assembly/index/fromArrayBuffer
       local.set $remaining
       block $~lib/as-bignum/assembly/integer/u128/u128#isZero|inlined.1 (result i32)
        local.get $remaining
        local.set $this|20
        local.get $this|20
        call $~lib/as-bignum/assembly/integer/u128/u128#get:lo
        local.get $this|20
        call $~lib/as-bignum/assembly/integer/u128/u128#get:hi
        i64.or
        i64.const 0
        i64.ne
        i32.eqz
        br $~lib/as-bignum/assembly/integer/u128/u128#isZero|inlined.1
       end
       i32.eqz
       if
        global.get $assembly/index/HEIGHTSTART
        local.get $name
        call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
        call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#getValue<u64>
        local.set $heightStart
        global.get $assembly/index/HEIGHTEND
        local.get $name
        call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
        call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#getValue<u64>
        local.set $heightEnd
        global.get $assembly/index/OFFSETSTART
        local.get $name
        call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
        call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#getValue<u64>
        local.set $offsetStart
        global.get $assembly/index/OFFSETEND
        local.get $name
        call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
        call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#getValue<u64>
        local.set $offsetEnd
        global.get $assembly/index/RUNE_ID_TO_HEIGHT
        local.get $mintTo
        call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
        call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#getValue<u32>
        local.set $etchingHeight
        local.get $heightStart
        i64.const 0
        i64.eq
        if (result i32)
         i32.const 1
        else
         local.get $height
         i64.extend_i32_u
         local.get $heightStart
         i64.ge_u
        end
        if (result i32)
         local.get $heightEnd
         i64.const 0
         i64.eq
         if (result i32)
          i32.const 1
         else
          local.get $height
          i64.extend_i32_u
          local.get $heightEnd
          i64.lt_u
         end
        else
         i32.const 0
        end
        if (result i32)
         local.get $offsetStart
         i64.const 0
         i64.eq
         if (result i32)
          i32.const 1
         else
          local.get $height
          i64.extend_i32_u
          local.get $offsetStart
          local.get $etchingHeight
          i64.extend_i32_u
          i64.add
          i64.ge_u
         end
        else
         i32.const 0
        end
        if (result i32)
         local.get $offsetEnd
         i64.const 0
         i64.eq
         if (result i32)
          i32.const 1
         else
          local.get $height
          i64.extend_i32_u
          local.get $etchingHeight
          i64.extend_i32_u
          local.get $offsetEnd
          i64.add
          i64.lt_u
         end
        else
         i32.const 0
        end
        if
         global.get $assembly/index/MINTS_REMAINING
         local.get $name
         call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
         block $~lib/as-bignum/assembly/integer/u128/u128.sub|inlined.0 (result i32)
          local.get $remaining
          local.set $a
          block $~lib/as-bignum/assembly/integer/u128/u128.from<i32>|inlined.10 (result i32)
           i32.const 1
           local.set $value
           i32.const 0
           drop
           i32.const 0
           drop
           i32.const 0
           drop
           i32.const 0
           drop
           i32.const 0
           drop
           i32.const 1
           drop
           block $~lib/as-bignum/assembly/integer/u128/u128.fromI64|inlined.10 (result i32)
            local.get $value
            i64.extend_i32_s
            local.set $value|27
            i32.const 0
            local.get $value|27
            local.get $value|27
            i64.const 63
            i64.shr_s
            call $~lib/as-bignum/assembly/integer/u128/u128#constructor
            br $~lib/as-bignum/assembly/integer/u128/u128.fromI64|inlined.10
           end
           br $~lib/as-bignum/assembly/integer/u128/u128.from<i32>|inlined.10
          end
          local.set $b
          local.get $a
          call $~lib/as-bignum/assembly/integer/u128/u128#get:lo
          local.set $alo
          local.get $alo
          local.get $b
          call $~lib/as-bignum/assembly/integer/u128/u128#get:lo
          i64.sub
          local.set $lo
          local.get $a
          call $~lib/as-bignum/assembly/integer/u128/u128#get:hi
          local.get $b
          call $~lib/as-bignum/assembly/integer/u128/u128#get:hi
          i64.sub
          local.get $lo
          local.get $alo
          i64.gt_u
          i64.extend_i32_u
          i64.sub
          local.set $hi
          i32.const 0
          local.get $lo
          local.get $hi
          call $~lib/as-bignum/assembly/integer/u128/u128#constructor
          br $~lib/as-bignum/assembly/integer/u128/u128.sub|inlined.0
         end
         call $assembly/index/toArrayBuffer
         call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#set
         local.get $balanceSheet
         local.get $mintTo
         global.get $assembly/index/AMOUNT
         local.get $name
         call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
         call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#get
         call $assembly/index/fromArrayBuffer
         call $assembly/index/BalanceSheet#increase
        end
       end
      end
      local.get $message
      call $assembly/index/RunestoneMessage#isEtching
      if
       local.get $message
       call $assembly/index/RunestoneMessage#get:fields
       global.get $assembly/index/Field.RUNE
       call $"~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#get"
       call $assembly/index/fieldToArrayBuffer
       call $assembly/index/stripNullRight
       local.set $name|33
       i32.const 0
       local.get $height
       i64.extend_i32_u
       local.get $i
       call $assembly/index/RuneId#constructor
       call $assembly/index/RuneId#toBytes
       local.set $runeId
       global.get $assembly/index/RUNE_ID_TO_ETCHING
       local.get $runeId
       call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
       local.get $name|33
       call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#set
       global.get $assembly/index/ETCHING_TO_RUNE_ID
       local.get $name|33
       call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
       local.get $runeId
       call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#set
       global.get $assembly/index/RUNE_ID_TO_HEIGHT
       local.get $runeId
       call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
       local.get $height
       call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#setValue<u32>
       local.get $message
       call $assembly/index/RunestoneMessage#get:fields
       global.get $assembly/index/Field.DIVISIBILITY
       call $"~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#has"
       if
        global.get $assembly/index/DIVISIBILITY
        local.get $name|33
        call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
        local.get $message
        call $assembly/index/RunestoneMessage#get:fields
        global.get $assembly/index/Field.DIVISIBILITY
        call $"~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#get"
        call $assembly/index/fieldTo<u8>
        call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#setValue<u8>
       end
       local.get $message
       call $assembly/index/RunestoneMessage#get:fields
       global.get $assembly/index/Field.PREMINE
       call $"~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#has"
       if
        local.get $message
        call $assembly/index/RunestoneMessage#get:fields
        global.get $assembly/index/Field.PREMINE
        call $"~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#get"
        call $assembly/index/fieldToU128
        local.set $premine
        i32.const 1
        i32.const 2
        i32.const 27
        i32.const 0
        call $~lib/rt/__newArray
        local.set $36
        local.get $36
        i32.load offset=4
        local.set $37
        local.get $36
        i32.const 0
        local.get $runeId
        call $~lib/array/Array<~lib/arraybuffer/ArrayBuffer>#__set
        local.get $36
        i32.const 1
        i32.const 2
        i32.const 34
        i32.const 0
        call $~lib/rt/__newArray
        local.set $38
        local.get $38
        i32.load offset=4
        local.set $39
        local.get $38
        i32.const 0
        local.get $premine
        call $~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>#__set
        local.get $38
        call $assembly/index/BalanceSheet.fromPairs
        local.get $balanceSheet
        call $assembly/index/BalanceSheet#pipe
        global.get $assembly/index/PREMINE
        local.get $name|33
        call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
        local.get $premine
        call $assembly/index/toArrayBuffer
        call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#set
       end
       local.get $message
       global.get $assembly/index/Flag.TERMS
       call $assembly/index/RunestoneMessage#getFlag
       if
        local.get $message
        call $assembly/index/RunestoneMessage#get:fields
        global.get $assembly/index/Field.AMOUNT
        call $"~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#has"
        if
         global.get $assembly/index/AMOUNT
         local.get $name|33
         call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
         local.get $message
         call $assembly/index/RunestoneMessage#get:fields
         global.get $assembly/index/Field.AMOUNT
         call $"~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#get"
         call $assembly/index/fieldToU128
         call $assembly/index/toArrayBuffer
         call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#set
        end
        local.get $message
        call $assembly/index/RunestoneMessage#get:fields
        global.get $assembly/index/Field.CAP
        call $"~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#has"
        if
         global.get $assembly/index/CAP
         local.get $name|33
         call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
         local.get $message
         call $assembly/index/RunestoneMessage#get:fields
         global.get $assembly/index/Field.CAP
         call $"~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#get"
         call $assembly/index/fieldToU128
         call $assembly/index/toArrayBuffer
         call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#set
         global.get $assembly/index/MINTS_REMAINING
         local.get $name|33
         call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
         local.get $message
         call $assembly/index/RunestoneMessage#get:fields
         global.get $assembly/index/Field.CAP
         call $"~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#get"
         call $assembly/index/fieldToArrayBuffer
         call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#set
        end
        local.get $message
        call $assembly/index/RunestoneMessage#get:fields
        global.get $assembly/index/Field.HEIGHTSTART
        call $"~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#has"
        if
         global.get $assembly/index/HEIGHTSTART
         local.get $name|33
         call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
         local.get $message
         call $assembly/index/RunestoneMessage#get:fields
         global.get $assembly/index/Field.HEIGHTSTART
         call $"~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#get"
         call $assembly/index/fieldTo<u64>
         call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#setValue<u64>
        end
        local.get $message
        call $assembly/index/RunestoneMessage#get:fields
        global.get $assembly/index/Field.HEIGHTEND
        call $"~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#has"
        if
         global.get $assembly/index/HEIGHTEND
         local.get $name|33
         call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
         local.get $message
         call $assembly/index/RunestoneMessage#get:fields
         global.get $assembly/index/Field.HEIGHTEND
         call $"~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#get"
         call $assembly/index/fieldTo<u64>
         call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#setValue<u64>
        end
        local.get $message
        call $assembly/index/RunestoneMessage#get:fields
        global.get $assembly/index/Field.OFFSETSTART
        call $"~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#has"
        if
         global.get $assembly/index/OFFSETSTART
         local.get $name|33
         call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
         local.get $message
         call $assembly/index/RunestoneMessage#get:fields
         global.get $assembly/index/Field.OFFSETSTART
         call $"~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#get"
         call $assembly/index/fieldTo<u64>
         call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#setValue<u64>
        end
        local.get $message
        call $assembly/index/RunestoneMessage#get:fields
        global.get $assembly/index/Field.OFFSETEND
        call $"~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#has"
        if
         global.get $assembly/index/OFFSETEND
         local.get $name|33
         call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
         local.get $message
         call $assembly/index/RunestoneMessage#get:fields
         global.get $assembly/index/Field.OFFSETEND
         call $"~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#get"
         call $assembly/index/fieldTo<u64>
         call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#setValue<u64>
        end
       end
       local.get $message
       call $assembly/index/RunestoneMessage#get:fields
       global.get $assembly/index/Field.SPACERS
       call $"~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#has"
       if
        global.get $assembly/index/SPACERS
        local.get $name|33
        call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
        local.get $message
        call $assembly/index/RunestoneMessage#get:fields
        global.get $assembly/index/Field.SPACERS
        call $"~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#get"
        call $assembly/index/fieldTo<u32>
        call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#setValue<u32>
       end
       local.get $message
       call $assembly/index/RunestoneMessage#get:fields
       global.get $assembly/index/Field.SYMBOL
       call $"~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#has"
       if
        global.get $assembly/index/SYMBOL
        local.get $name|33
        call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
        local.get $message
        call $assembly/index/RunestoneMessage#get:fields
        global.get $assembly/index/Field.SYMBOL
        call $"~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#get"
        call $assembly/index/fieldTo<u8>
        call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#setValue<u8>
       end
      end
      i32.const 0
      call $"~lib/map/Map<u32,assembly/index/BalanceSheet>#constructor"
      local.set $balancesByOutput
      i32.const 0
      local.set $i|41
      loop $for-loop|1
       local.get $i|41
       local.get $edicts
       call $~lib/array/Array<assembly/index/Edict>#get:length
       i32.lt_s
       if
        local.get $edicts
        local.get $i|41
        call $~lib/array/Array<assembly/index/Edict>#__get
        local.set $edict
        local.get $edict
        call $assembly/index/Edict#get:output
        call $assembly/index/toPrimitive<u32>
        local.set $edictOutput
        local.get $edict
        call $assembly/index/Edict#runeId
        call $assembly/index/RuneId#toBytes
        local.set $runeId|44
        i32.const 0
        local.set $outputBalanceSheet
        local.get $balancesByOutput
        local.get $edictOutput
        call $"~lib/map/Map<u32,assembly/index/BalanceSheet>#has"
        i32.eqz
        if
         local.get $balancesByOutput
         local.get $edictOutput
         i32.const 0
         call $assembly/index/BalanceSheet#constructor
         local.tee $outputBalanceSheet
         call $"~lib/map/Map<u32,assembly/index/BalanceSheet>#set"
         drop
        else
         local.get $balancesByOutput
         local.get $edictOutput
         call $"~lib/map/Map<u32,assembly/index/BalanceSheet>#get"
         local.set $outputBalanceSheet
        end
        local.get $edict
        call $assembly/index/Edict#get:amount
        local.get $balanceSheet
        local.get $runeId|44
        call $assembly/index/BalanceSheet#get
        call $assembly/index/min<~lib/as-bignum/assembly/integer/u128/u128>
        local.set $amount
        local.get $balanceSheet
        local.get $runeId|44
        local.get $amount
        call $assembly/index/BalanceSheet#decrease
        drop
        local.get $outputBalanceSheet
        local.get $runeId|44
        local.get $amount
        call $assembly/index/BalanceSheet#increase
        local.get $i|41
        i32.const 1
        i32.add
        local.set $i|41
        br $for-loop|1
       end
      end
      local.get $message
      call $assembly/index/RunestoneMessage#get:fields
      global.get $assembly/index/Field.POINTER
      call $"~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#has"
      if (result i32)
       local.get $message
       call $assembly/index/RunestoneMessage#get:fields
       global.get $assembly/index/Field.POINTER
       call $"~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#get"
       call $assembly/index/fieldTo<u32>
      else
       local.get $tx
       call $assembly/index/RunesTransaction#defaultOutput
      end
      local.set $unallocatedTo
      local.get $balancesByOutput
      local.get $unallocatedTo
      call $"~lib/map/Map<u32,assembly/index/BalanceSheet>#has"
      if
       local.get $balanceSheet
       local.get $balancesByOutput
       local.get $unallocatedTo
       call $"~lib/map/Map<u32,assembly/index/BalanceSheet>#get"
       call $assembly/index/BalanceSheet#pipe
      else
       local.get $balancesByOutput
       local.get $unallocatedTo
       local.get $balanceSheet
       call $"~lib/map/Map<u32,assembly/index/BalanceSheet>#set"
       drop
      end
      local.get $balancesByOutput
      call $"~lib/map/Map<u32,assembly/index/BalanceSheet>#keys"
      local.set $runesToOutputs
      i32.const 0
      local.set $i|49
      loop $for-loop|2
       local.get $i|49
       local.get $runesToOutputs
       call $~lib/array/Array<u32>#get:length
       i32.lt_s
       if
        local.get $balancesByOutput
        local.get $runesToOutputs
        local.get $i|49
        call $~lib/array/Array<u32>#__get
        call $"~lib/map/Map<u32,assembly/index/BalanceSheet>#get"
        global.get $assembly/index/OUTPOINT_TO_RUNES
        local.get $txid
        local.get $runesToOutputs
        local.get $i|49
        call $~lib/array/Array<u32>#__get
        call $~lib/metashrew-as/assembly/blockdata/transaction/OutPoint.from
        call $~lib/metashrew-as/assembly/blockdata/transaction/OutPoint#toArrayBuffer
        call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
        call $assembly/index/BalanceSheet#save
        local.get $i|49
        i32.const 1
        i32.add
        local.set $i|49
        br $for-loop|2
       end
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
   i32.const 52
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
   i32.const 3360
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
    i32.const 3360
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
   i32.const 54
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
   i32.const 3360
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
   i32.const 53
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
  i32.const 27
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
   i32.const 6016
   call $~lib/array/Array<~lib/metashrew-as/assembly/utils/rlp/RLPItem>#map<~lib/arraybuffer/ArrayBuffer>
   local.set $list
   local.get $list
   i32.const 6048
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
    i32.const 6080
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
    i32.const 6112
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
 (func $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#clear" (param $this i32)
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
  block $"~lib/map/ENTRY_SIZE<~lib/string/String,~lib/arraybuffer/ArrayBuffer>|inlined.7" (result i32)
   i32.const 12
   br $"~lib/map/ENTRY_SIZE<~lib/string/String,~lib/arraybuffer/ArrayBuffer>|inlined.7"
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
 )
 (func $~lib/rt/stub/__collect
 )
 (func $~lib/metashrew-as/assembly/indexer/index/_flush
  (local $hashKeys i32)
  (local $rlpInput i32)
  (local $buffer i32)
  global.get $~lib/metashrew-as/assembly/indexer/index/_updateKeys
  call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#keys"
  local.set $hashKeys
  i32.const 0
  i32.const 0
  call $~lib/array/Array<~lib/metashrew-as/assembly/utils/rlp/RLPItem>#constructor
  local.set $rlpInput
  local.get $hashKeys
  i32.const 5984
  local.get $rlpInput
  call $~lib/array/Array<~lib/string/String>#reduce<~lib/array/Array<~lib/metashrew-as/assembly/utils/rlp/RLPItem>>
  drop
  local.get $rlpInput
  call $~lib/metashrew-as/assembly/utils/rlp/RLPItem.fromList
  call $~lib/metashrew-as/assembly/utils/rlp/toRLP
  local.set $buffer
  global.get $~lib/metashrew-as/assembly/indexer/index/_updateKeys
  call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#clear"
  local.get $buffer
  call $~lib/metashrew-as/assembly/indexer/index/__flush
  call $~lib/rt/stub/__collect
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
 (func $~lib/string/String#substring (param $this i32) (param $start i32) (param $end i32) (result i32)
  (local $len i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $finalStart i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (local $12 i32)
  (local $finalEnd i32)
  (local $14 i32)
  (local $15 i32)
  (local $fromPos i32)
  (local $17 i32)
  (local $18 i32)
  (local $toPos i32)
  (local $size i32)
  (local $out i32)
  local.get $this
  call $~lib/string/String#get:length
  local.set $len
  local.get $start
  local.tee $4
  i32.const 0
  local.tee $5
  local.get $4
  local.get $5
  i32.gt_s
  select
  local.tee $6
  local.get $len
  local.tee $7
  local.get $6
  local.get $7
  i32.lt_s
  select
  local.set $finalStart
  local.get $end
  local.tee $9
  i32.const 0
  local.tee $10
  local.get $9
  local.get $10
  i32.gt_s
  select
  local.tee $11
  local.get $len
  local.tee $12
  local.get $11
  local.get $12
  i32.lt_s
  select
  local.set $finalEnd
  local.get $finalStart
  local.tee $14
  local.get $finalEnd
  local.tee $15
  local.get $14
  local.get $15
  i32.lt_s
  select
  i32.const 1
  i32.shl
  local.set $fromPos
  local.get $finalStart
  local.tee $17
  local.get $finalEnd
  local.tee $18
  local.get $17
  local.get $18
  i32.gt_s
  select
  i32.const 1
  i32.shl
  local.set $toPos
  local.get $toPos
  local.get $fromPos
  i32.sub
  local.set $size
  local.get $size
  i32.eqz
  if
   i32.const 5600
   return
  end
  local.get $fromPos
  i32.eqz
  if (result i32)
   local.get $toPos
   local.get $len
   i32.const 1
   i32.shl
   i32.eq
  else
   i32.const 0
  end
  if
   local.get $this
   return
  end
  local.get $size
  i32.const 2
  call $~lib/rt/stub/__new
  local.set $out
  local.get $out
  local.get $this
  local.get $fromPos
  i32.add
  local.get $size
  memory.copy
  local.get $out
  return
 )
 (func $~lib/util/string/isSpace (param $c i32) (result i32)
  (local $1 i32)
  local.get $c
  i32.const 5760
  i32.lt_u
  if
   local.get $c
   i32.const 128
   i32.or
   i32.const 160
   i32.eq
   if (result i32)
    i32.const 1
   else
    local.get $c
    i32.const 9
    i32.sub
    i32.const 13
    i32.const 9
    i32.sub
    i32.le_u
   end
   return
  end
  local.get $c
  i32.const 8192
  i32.sub
  i32.const 8202
  i32.const 8192
  i32.sub
  i32.le_u
  if
   i32.const 1
   return
  end
  block $break|0
   block $case6|0
    block $case5|0
     block $case4|0
      block $case3|0
       block $case2|0
        block $case1|0
         block $case0|0
          local.get $c
          local.set $1
          local.get $1
          i32.const 5760
          i32.eq
          br_if $case0|0
          local.get $1
          i32.const 8232
          i32.eq
          br_if $case1|0
          local.get $1
          i32.const 8233
          i32.eq
          br_if $case2|0
          local.get $1
          i32.const 8239
          i32.eq
          br_if $case3|0
          local.get $1
          i32.const 8287
          i32.eq
          br_if $case4|0
          local.get $1
          i32.const 12288
          i32.eq
          br_if $case5|0
          local.get $1
          i32.const 65279
          i32.eq
          br_if $case6|0
          br $break|0
         end
        end
       end
      end
     end
    end
   end
   i32.const 1
   return
  end
  i32.const 0
  return
 )
 (func $~lib/util/string/strtol<f64> (param $str i32) (param $radix i32) (result f64)
  (local $len i32)
  (local $ptr i32)
  (local $code i32)
  (local $sign f64)
  (local $6 i32)
  (local $num f64)
  (local $initial i32)
  (local $9 i32)
  local.get $str
  call $~lib/string/String#get:length
  local.set $len
  local.get $len
  i32.eqz
  if
   i32.const 1
   drop
   f64.const nan:0x8000000000000
   return
  end
  local.get $str
  local.set $ptr
  local.get $ptr
  i32.load16_u
  local.set $code
  loop $while-continue|0
   local.get $code
   call $~lib/util/string/isSpace
   if
    local.get $ptr
    i32.const 2
    i32.add
    local.tee $ptr
    i32.load16_u
    local.set $code
    local.get $len
    i32.const 1
    i32.sub
    local.set $len
    br $while-continue|0
   end
  end
  f64.const 1
  local.set $sign
  local.get $code
  i32.const 45
  i32.eq
  if (result i32)
   i32.const 1
  else
   local.get $code
   i32.const 43
   i32.eq
  end
  if
   local.get $len
   i32.const 1
   i32.sub
   local.tee $len
   i32.eqz
   if
    i32.const 1
    drop
    f64.const nan:0x8000000000000
    return
   end
   local.get $code
   i32.const 45
   i32.eq
   if
    f64.const -1
    local.set $sign
   end
   local.get $ptr
   i32.const 2
   i32.add
   local.tee $ptr
   i32.load16_u
   local.set $code
  end
  local.get $radix
  if
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
    i32.const 1
    drop
    f64.const nan:0x8000000000000
    return
   end
   local.get $radix
   i32.const 16
   i32.eq
   if
    local.get $len
    i32.const 2
    i32.gt_s
    if (result i32)
     local.get $code
     i32.const 48
     i32.eq
    else
     i32.const 0
    end
    if (result i32)
     local.get $ptr
     i32.load16_u offset=2
     i32.const 32
     i32.or
     i32.const 120
     i32.eq
    else
     i32.const 0
    end
    if
     local.get $ptr
     i32.const 4
     i32.add
     local.set $ptr
     local.get $len
     i32.const 2
     i32.sub
     local.set $len
    end
   end
  else
   local.get $code
   i32.const 48
   i32.eq
   if (result i32)
    local.get $len
    i32.const 2
    i32.gt_s
   else
    i32.const 0
   end
   if
    block $break|1
     block $case2|1
      block $case1|1
       block $case0|1
        local.get $ptr
        i32.load16_u offset=2
        i32.const 32
        i32.or
        local.set $6
        local.get $6
        i32.const 98
        i32.eq
        br_if $case0|1
        local.get $6
        i32.const 111
        i32.eq
        br_if $case1|1
        local.get $6
        i32.const 120
        i32.eq
        br_if $case2|1
        br $break|1
       end
       local.get $ptr
       i32.const 4
       i32.add
       local.set $ptr
       local.get $len
       i32.const 2
       i32.sub
       local.set $len
       i32.const 2
       local.set $radix
       br $break|1
      end
      local.get $ptr
      i32.const 4
      i32.add
      local.set $ptr
      local.get $len
      i32.const 2
      i32.sub
      local.set $len
      i32.const 8
      local.set $radix
      br $break|1
     end
     local.get $ptr
     i32.const 4
     i32.add
     local.set $ptr
     local.get $len
     i32.const 2
     i32.sub
     local.set $len
     i32.const 16
     local.set $radix
     br $break|1
    end
   end
   local.get $radix
   i32.eqz
   if
    i32.const 10
    local.set $radix
   end
  end
  f64.const 0
  local.set $num
  local.get $len
  i32.const 1
  i32.sub
  local.set $initial
  block $while-break|2
   loop $while-continue|2
    local.get $len
    local.tee $9
    i32.const 1
    i32.sub
    local.set $len
    local.get $9
    if
     local.get $ptr
     i32.load16_u
     local.set $code
     local.get $code
     i32.const 48
     i32.sub
     i32.const 10
     i32.lt_u
     if
      local.get $code
      i32.const 48
      i32.sub
      local.set $code
     else
      local.get $code
      i32.const 65
      i32.sub
      i32.const 90
      i32.const 65
      i32.sub
      i32.le_u
      if
       local.get $code
       i32.const 65
       i32.const 10
       i32.sub
       i32.sub
       local.set $code
      else
       local.get $code
       i32.const 97
       i32.sub
       i32.const 122
       i32.const 97
       i32.sub
       i32.le_u
       if
        local.get $code
        i32.const 97
        i32.const 10
        i32.sub
        i32.sub
        local.set $code
       end
      end
     end
     local.get $code
     local.get $radix
     i32.ge_u
     if
      local.get $initial
      local.get $len
      i32.eq
      if
       i32.const 1
       drop
       f64.const nan:0x8000000000000
       return
      end
      br $while-break|2
     end
     local.get $num
     local.get $radix
     f64.convert_i32_s
     f64.mul
     local.get $code
     f64.convert_i32_u
     f64.add
     local.set $num
     local.get $ptr
     i32.const 2
     i32.add
     local.set $ptr
     br $while-continue|2
    end
   end
  end
  local.get $sign
  local.get $num
  f64.mul
  return
 )
 (func $~lib/string/parseInt (param $str i32) (param $radix i32) (result f64)
  local.get $str
  local.get $radix
  call $~lib/util/string/strtol<f64>
  return
 )
 (func $assembly/index/decodeHex (param $hex i32) (result i32)
  (local $result i32)
  (local $i i32)
  i32.const 0
  local.get $hex
  call $~lib/string/String#get:length
  i32.const 2
  i32.div_s
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.set $result
  i32.const 0
  local.set $i
  loop $for-loop|0
   local.get $i
   local.get $hex
   call $~lib/string/String#get:length
   i32.lt_s
   if
    local.get $result
    local.get $i
    i32.const 2
    i32.div_s
    i32.add
    local.get $hex
    local.get $i
    local.get $i
    i32.const 2
    i32.add
    call $~lib/string/String#substring
    i32.const 16
    call $~lib/string/parseInt
    i32.trunc_sat_f64_u
    i32.store8
    local.get $i
    i32.const 2
    i32.add
    local.set $i
    br $for-loop|0
   end
  end
  local.get $result
  return
 )
 (func $assembly/index/test_indexEtching
  (local $block i32)
  i32.const 0
  i32.const 6144
  call $assembly/index/decodeHex
  call $~lib/metashrew-as/assembly/utils/box/Box.from
  call $~lib/metashrew-as/assembly/blockdata/block/Block#constructor
  local.set $block
  local.get $block
  i32.const 0
  i32.const 1
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Transaction>#constructor
  call $~lib/metashrew-as/assembly/blockdata/block/Block#set:transactions
  local.get $block
  call $~lib/metashrew-as/assembly/blockdata/block/Block#get:transactions
  i32.const 0
  i32.const 0
  i32.const 7312
  call $assembly/index/decodeHex
  call $~lib/metashrew-as/assembly/utils/box/Box.from
  call $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#constructor
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Transaction>#__set
  i32.const 6
  local.get $block
  call $assembly/index/Index.indexBlock
  call $~lib/metashrew-as/assembly/indexer/index/_flush
 )
 (func $~start
  call $start:assembly/index
 )
)
