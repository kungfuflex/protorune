(module
 (type $0 (func (param i32) (result i32)))
 (type $1 (func (param i32 i32) (result i32)))
 (type $2 (func (param i32 i32 i32) (result i32)))
 (type $3 (func (param i32 i32 i32 i32) (result i32)))
 (type $4 (func (result i32)))
 (type $5 (func (param i32 i32 i32)))
 (type $6 (func))
 (type $7 (func (param i32 i32)))
 (type $8 (func (param i32)))
 (type $9 (func (param i32) (result i64)))
 (type $10 (func (param i32 i32 i32 i32 i32) (result i32)))
 (type $11 (func (param i32 i32 i32 i32)))
 (type $12 (func (param i32 i64)))
 (type $13 (func (param i32 i64 i32) (result i32)))
 (type $14 (func (param i32 i64) (result i32)))
 (type $15 (func (param i64 i64 i64 i64) (result i64)))
 (type $16 (func (param i32 i64 i32)))
 (type $17 (func (param i32 i64 i32 i32)))
 (type $18 (func (param i32 i32 i32 i32 i32)))
 (type $19 (func (param i32 i32 i32 i32 i32 i32)))
 (type $20 (func (param i32 i32 i32 i32 i64 i32 i32 i32 i32 i32) (result i32)))
 (import "env" "abort" (func $~lib/builtins/abort (param i32 i32 i32 i32)))
 (import "env" "__host_len" (func $~lib/metashrew-as/assembly/indexer/index/__host_len (result i32)))
 (import "env" "__load_input" (func $~lib/metashrew-as/assembly/indexer/index/__load_input (param i32)))
 (import "env" "__flush" (func $~lib/metashrew-as/assembly/indexer/index/__flush (param i32)))
 (import "env" "__get_len" (func $~lib/metashrew-as/assembly/indexer/index/__get_len (param i32) (result i32)))
 (import "env" "__get" (func $~lib/metashrew-as/assembly/indexer/index/__get (param i32 i32)))
 (import "env" "__log" (func $~lib/metashrew-as/assembly/utils/logging/__log (param i32)))
 (global $~lib/rt/stub/offset (mut i32) (i32.const 0))
 (global $~lib/metashrew-as/assembly/indexer/index/_updates (mut i32) (i32.const 0))
 (global $~lib/metashrew-as/assembly/indexer/index/_updateKeys (mut i32) (i32.const 0))
 (global $~argumentsLength (mut i32) (i32.const 0))
 (global $~lib/metashrew-as/assembly/utils/b32/ONE (mut i32) (i32.const 0))
 (global $~lib/metashrew-as/assembly/utils/b58/LEADER (mut i32) (i32.const 0))
 (global $~lib/metashrew-runes/assembly/indexer/constants/index/HEIGHT_TO_BLOCKHASH (mut i32) (i32.const 0))
 (global $~lib/metashrew-runes/assembly/indexer/constants/index/BLOCKHASH_TO_HEIGHT (mut i32) (i32.const 0))
 (global $~lib/metashrew-runes/assembly/indexer/constants/index/OUTPOINT_TO_RUNES (mut i32) (i32.const 0))
 (global $~lib/metashrew-runes/assembly/indexer/constants/index/OUTPOINT_TO_HEIGHT (mut i32) (i32.const 0))
 (global $~lib/metashrew-runes/assembly/indexer/constants/index/HEIGHT_TO_TRANSACTION_IDS (mut i32) (i32.const 0))
 (global $~lib/metashrew-runes/assembly/indexer/constants/index/SYMBOL (mut i32) (i32.const 0))
 (global $~lib/metashrew-runes/assembly/indexer/constants/index/CAP (mut i32) (i32.const 0))
 (global $~lib/metashrew-runes/assembly/indexer/constants/index/SPACERS (mut i32) (i32.const 0))
 (global $~lib/metashrew-runes/assembly/indexer/constants/index/OFFSETEND (mut i32) (i32.const 0))
 (global $~lib/metashrew-runes/assembly/indexer/constants/index/OFFSETSTART (mut i32) (i32.const 0))
 (global $~lib/metashrew-runes/assembly/indexer/constants/index/HEIGHTSTART (mut i32) (i32.const 0))
 (global $~lib/metashrew-runes/assembly/indexer/constants/index/HEIGHTEND (mut i32) (i32.const 0))
 (global $~lib/metashrew-runes/assembly/indexer/constants/index/AMOUNT (mut i32) (i32.const 0))
 (global $~lib/metashrew-runes/assembly/indexer/constants/index/MINTS_REMAINING (mut i32) (i32.const 0))
 (global $~lib/metashrew-runes/assembly/indexer/constants/index/PREMINE (mut i32) (i32.const 0))
 (global $~lib/metashrew-runes/assembly/indexer/constants/index/DIVISIBILITY (mut i32) (i32.const 0))
 (global $~lib/metashrew-runes/assembly/indexer/constants/index/RUNE_ID_TO_HEIGHT (mut i32) (i32.const 0))
 (global $~lib/metashrew-runes/assembly/indexer/constants/index/ETCHINGS (mut i32) (i32.const 0))
 (global $~lib/metashrew-runes/assembly/indexer/constants/index/RUNE_ID_TO_ETCHING (mut i32) (i32.const 0))
 (global $~lib/metashrew-runes/assembly/indexer/constants/index/ETCHING_TO_RUNE_ID (mut i32) (i32.const 0))
 (global $~lib/as-bignum/assembly/globals/__res128_hi (mut i64) (i64.const 0))
 (global $~lib/metashrew-runes/assembly/indexer/constants/index/MINIMUM_NAME (mut i32) (i32.const 0))
 (global $~lib/metashrew-runes/assembly/indexer/constants/index/TWENTY_SIX (mut i32) (i32.const 0))
 (global $~lib/metashrew-runes/assembly/indexer/constants/index/RESERVED_NAME (mut i32) (i32.const 0))
 (global $assembly/indexer/tables/protorune/PROTOCOLS_TO_INDEX (mut i32) (i32.const 0))
 (global $~lib/metashrew-spendables/assembly/tables/OUTPOINTS_FOR_ADDRESS (mut i32) (i32.const 0))
 (global $~lib/metashrew-spendables/assembly/tables/OUTPOINT_SPENDABLE_BY (mut i32) (i32.const 0))
 (global $~lib/metashrew-spendables/assembly/tables/OUTPOINT_TO_OUTPUT (mut i32) (i32.const 0))
 (global $assembly/test/TEST_PROTORUNE_RUNEID (mut i32) (i32.const 0))
 (global $~lib/as-bignum/assembly/globals/__divmod_quot_hi (mut i64) (i64.const 0))
 (global $~lib/as-bignum/assembly/globals/__divmod_rem_lo (mut i64) (i64.const 0))
 (global $~lib/as-bignum/assembly/globals/__divmod_rem_hi (mut i64) (i64.const 0))
 (global $~lib/rt/__rtti_base i32 (i32.const 12064))
 (memory $0 1)
 (data $0 (i32.const 1036) "\1c\02")
 (data $0.1 (i32.const 1048) "\04\00\00\00\00\02\00\00000102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f202122232425262728292a2b2c2d2e2f303132333435363738393a3b3c3d3e3f404142434445464748494a4b4c4d4e4f505152535455565758595a5b5c5d5e5f606162636465666768696a6b6c6d6e6f707172737475767778797a7b7c7d7e7f808182838485868788898a8b8c8d8e8f909192939495969798999a9b9c9d9e9fa0a1a2a3a4a5a6a7a8a9aaabacadaeafb0b1b2b3b4b5b6b7b8b9babbbcbdbebfc0c1c2c3c4c5c6c7c8c9cacbcccdcecfd0d1d2d3d4d5d6d7d8d9dadbdcdddedfe0e1e2e3e4e5e6e7e8e9eaebecedeeeff0f1f2f3f4f5f6f7f8f9fafbfcfdfeff")
 (data $1 (i32.const 1580) "<")
 (data $1.1 (i32.const 1592) "\02\00\00\00(\00\00\00A\00l\00l\00o\00c\00a\00t\00i\00o\00n\00 \00t\00o\00o\00 \00l\00a\00r\00g\00e")
 (data $2 (i32.const 1644) "<")
 (data $2.1 (i32.const 1656) "\02\00\00\00\1e\00\00\00~\00l\00i\00b\00/\00r\00t\00/\00s\00t\00u\00b\00.\00t\00s")
 (data $3 (i32.const 1708) "\1c\02")
 (data $3.1 (i32.const 1720) "\04\00\00\00\00\02\00\00000102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f202122232425262728292a2b2c2d2e2f303132333435363738393a3b3c3d3e3f404142434445464748494a4b4c4d4e4f505152535455565758595a5b5c5d5e5f606162636465666768696a6b6c6d6e6f707172737475767778797a7b7c7d7e7f808182838485868788898a8b8c8d8e8f909192939495969798999a9b9c9d9e9fa0a1a2a3a4a5a6a7a8a9aaabacadaeafb0b1b2b3b4b5b6b7b8b9babbbcbdbebfc0c1c2c3c4c5c6c7c8c9cacbcccdcecfd0d1d2d3d4d5d6d7d8d9dadbdcdddedfe0e1e2e3e4e5e6e7e8e9eaebecedeeeff0f1f2f3f4f5f6f7f8f9fafbfcfdfeff")
 (data $4 (i32.const 2252) "\1c\01")
 (data $4.1 (i32.const 2264) "\01\00\00\00\00\01\00\00\98/\8aB\91D7q\cf\fb\c0\b5\a5\db\b5\e9[\c2V9\f1\11\f1Y\a4\82?\92\d5^\1c\ab\98\aa\07\d8\01[\83\12\be\851$\c3}\0cUt]\ber\fe\b1\de\80\a7\06\dc\9bt\f1\9b\c1\c1i\9b\e4\86G\be\ef\c6\9d\c1\0f\cc\a1\0c$o,\e9-\aa\84tJ\dc\a9\b0\\\da\88\f9vRQ>\98m\c61\a8\c8\'\03\b0\c7\7fY\bf\f3\0b\e0\c6G\91\a7\d5Qc\ca\06g))\14\85\n\b7\'8!\1b.\fcm,M\13\r8STs\ne\bb\njv.\c9\c2\81\85,r\92\a1\e8\bf\a2Kf\1a\a8p\8bK\c2\a3Ql\c7\19\e8\92\d1$\06\99\d6\855\0e\f4p\a0j\10\16\c1\a4\19\08l7\1eLwH\'\b5\bc\b04\b3\0c\1c9J\aa\d8NO\ca\9c[\f3o.h\ee\82\8ftoc\a5x\14x\c8\84\08\02\c7\8c\fa\ff\be\90\eblP\a4\f7\a3\f9\be\f2xq\c6")
 (data $5 (i32.const 2540) ",")
 (data $5.1 (i32.const 2552) "\06\00\00\00\10\00\00\00\e0\08\00\00\e0\08\00\00\00\01\00\00@")
 (data $6 (i32.const 2588) ",")
 (data $6.1 (i32.const 2600) "\02\00\00\00\1c\00\00\00I\00n\00v\00a\00l\00i\00d\00 \00l\00e\00n\00g\00t\00h")
 (data $7 (i32.const 2636) "<")
 (data $7.1 (i32.const 2648) "\02\00\00\00&\00\00\00~\00l\00i\00b\00/\00a\00r\00r\00a\00y\00b\00u\00f\00f\00e\00r\00.\00t\00s")
 (data $8 (i32.const 2700) ",")
 (data $8.1 (i32.const 2712) "\02\00\00\00\14\00\00\00u\00s\00e\00 \00s\00t\00r\00i\00c\00t")
 (data $9 (i32.const 2748) "\1c")
 (data $9.1 (i32.const 2760) "\02\00\00\00\02\00\00\001")
 (data $10 (i32.const 2780) "<")
 (data $10.1 (i32.const 2792) "\02\00\00\00$\00\00\00U\00n\00p\00a\00i\00r\00e\00d\00 \00s\00u\00r\00r\00o\00g\00a\00t\00e")
 (data $11 (i32.const 2844) ",")
 (data $11.1 (i32.const 2856) "\02\00\00\00\1c\00\00\00~\00l\00i\00b\00/\00s\00t\00r\00i\00n\00g\00.\00t\00s")
 (data $12 (i32.const 2892) "\1c\01")
 (data $12.1 (i32.const 2904) "\04\00\00\00\00\01")
 (data $12.2 (i32.const 2960) "\0f\00\n\11\15\14\1a\1e\07\05")
 (data $12.3 (i32.const 3009) "\1d\00\18\r\19\t\08\17\00\12\16\1f\1b\13\00\01\00\03\10\0b\1c\0c\0e\06\04\02")
 (data $13 (i32.const 3180) "<")
 (data $13.1 (i32.const 3192) "\04\00\00\00 \00\00\00qpzry9x8gf2tvdw0s3jn54khce6mua7l")
 (data $14 (i32.const 3244) "L")
 (data $14.1 (i32.const 3256) "\04\00\00\00:\00\00\00123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz")
 (data $15 (i32.const 3324) "<")
 (data $15.1 (i32.const 3336) "\02\00\00\00$\00\00\00I\00n\00d\00e\00x\00 \00o\00u\00t\00 \00o\00f\00 \00r\00a\00n\00g\00e")
 (data $16 (i32.const 3388) "<")
 (data $16.1 (i32.const 3400) "\02\00\00\00&\00\00\00~\00l\00i\00b\00/\00s\00t\00a\00t\00i\00c\00a\00r\00r\00a\00y\00.\00t\00s")
 (data $17 (i32.const 3452) "<")
 (data $17.1 (i32.const 3464) "\02\00\00\00(\00\00\00/\00b\00l\00o\00c\00k\00h\00a\00s\00h\00/\00b\00y\00h\00e\00i\00g\00h\00t\00/")
 (data $18 (i32.const 3516) "<")
 (data $18.1 (i32.const 3528) "\02\00\00\00(\00\00\00/\00h\00e\00i\00g\00h\00t\00/\00b\00y\00b\00l\00o\00c\00k\00h\00a\00s\00h\00/")
 (data $19 (i32.const 3580) "<")
 (data $19.1 (i32.const 3592) "\02\00\00\00$\00\00\00/\00r\00u\00n\00e\00s\00/\00b\00y\00o\00u\00t\00p\00o\00i\00n\00t\00/")
 (data $20 (i32.const 3644) "<")
 (data $20.1 (i32.const 3656) "\02\00\00\00&\00\00\00/\00h\00e\00i\00g\00h\00t\00/\00b\00y\00o\00u\00t\00p\00o\00i\00n\00t\00/")
 (data $21 (i32.const 3708) "<")
 (data $21.1 (i32.const 3720) "\02\00\00\00\1e\00\00\00/\00t\00x\00i\00d\00s\00/\00b\00y\00h\00e\00i\00g\00h\00t")
 (data $22 (i32.const 3772) ",")
 (data $22.1 (i32.const 3784) "\02\00\00\00\1c\00\00\00/\00r\00u\00n\00e\00s\00/\00s\00y\00m\00b\00o\00l\00/")
 (data $23 (i32.const 3820) ",")
 (data $23.1 (i32.const 3832) "\02\00\00\00\16\00\00\00/\00r\00u\00n\00e\00s\00/\00c\00a\00p\00/")
 (data $24 (i32.const 3868) ",")
 (data $24.1 (i32.const 3880) "\02\00\00\00\1c\00\00\00/\00r\00u\00n\00e\00s\00/\00s\00p\00a\00c\00e\00s\00/")
 (data $25 (i32.const 3916) "<")
 (data $25.1 (i32.const 3928) "\02\00\00\00$\00\00\00/\00r\00u\00n\00e\00s\00/\00o\00f\00f\00s\00e\00t\00/\00e\00n\00d\00/")
 (data $26 (i32.const 3980) "<")
 (data $26.1 (i32.const 3992) "\02\00\00\00(\00\00\00/\00r\00u\00n\00e\00s\00/\00o\00f\00f\00s\00e\00t\00/\00s\00t\00a\00r\00t\00/")
 (data $27 (i32.const 4044) "<")
 (data $27.1 (i32.const 4056) "\02\00\00\00(\00\00\00/\00r\00u\00n\00e\00s\00/\00h\00e\00i\00g\00h\00t\00/\00s\00t\00a\00r\00t\00/")
 (data $28 (i32.const 4108) "<")
 (data $28.1 (i32.const 4120) "\02\00\00\00$\00\00\00/\00r\00u\00n\00e\00s\00/\00h\00e\00i\00g\00h\00t\00/\00e\00n\00d\00/")
 (data $29 (i32.const 4172) ",")
 (data $29.1 (i32.const 4184) "\02\00\00\00\1c\00\00\00/\00r\00u\00n\00e\00s\00/\00a\00m\00o\00u\00n\00t\00/")
 (data $30 (i32.const 4220) "L")
 (data $30.1 (i32.const 4232) "\02\00\00\00.\00\00\00/\00r\00u\00n\00e\00s\00/\00m\00i\00n\00t\00s\00-\00r\00e\00m\00a\00i\00n\00i\00n\00g\00/")
 (data $31 (i32.const 4300) "<")
 (data $31.1 (i32.const 4312) "\02\00\00\00\1e\00\00\00/\00r\00u\00n\00e\00s\00/\00p\00r\00e\00m\00i\00n\00e\00/")
 (data $32 (i32.const 4364) "<")
 (data $32.1 (i32.const 4376) "\02\00\00\00(\00\00\00/\00r\00u\00n\00e\00s\00/\00d\00i\00v\00i\00s\00i\00b\00i\00l\00i\00t\00y\00/")
 (data $33 (i32.const 4428) "<")
 (data $33.1 (i32.const 4440) "\02\00\00\00\"\00\00\00/\00h\00e\00i\00g\00h\00t\00/\00b\00y\00r\00u\00n\00e\00i\00d\00/")
 (data $34 (i32.const 4492) ",")
 (data $34.1 (i32.const 4504) "\02\00\00\00\18\00\00\00/\00r\00u\00n\00e\00s\00/\00n\00a\00m\00e\00s")
 (data $35 (i32.const 4540) "<")
 (data $35.1 (i32.const 4552) "\02\00\00\00$\00\00\00/\00e\00t\00c\00h\00i\00n\00g\00/\00b\00y\00r\00u\00n\00e\00i\00d\00/")
 (data $36 (i32.const 4604) "<")
 (data $36.1 (i32.const 4616) "\02\00\00\00$\00\00\00/\00r\00u\00n\00e\00i\00d\00/\00b\00y\00e\00t\00c\00h\00i\00n\00g\00/")
 (data $37 (i32.const 4668) "<")
 (data $37.1 (i32.const 4680) "\02\00\00\00\"\00\00\009\009\002\004\006\001\001\004\009\002\008\001\004\009\004\006\002")
 (data $38 (i32.const 4732) ",")
 (data $38.1 (i32.const 4744) "\02\00\00\00\1a\00\00\00I\00n\00v\00a\00l\00i\00d\00 \00r\00a\00d\00i\00x")
 (data $39 (i32.const 4780) "\\")
 (data $39.1 (i32.const 4792) "\02\00\00\00@\00\00\00~\00l\00i\00b\00/\00a\00s\00-\00b\00i\00g\00n\00u\00m\00/\00a\00s\00s\00e\00m\00b\00l\00y\00/\00u\00t\00i\00l\00s\00.\00t\00s")
 (data $40 (i32.const 4877) "\01\02\03\04\05\06\07\08\t$$$$$$$\n\0b\0c\r\0e\0f\10\11\12\13\14\15\16\17\18\19\1a\1b\1c\1d\1e\1f !\"#$$$$$$\n\0b\0c\r\0e\0f\10\11\12\13\14\15\16\17\18\19\1a\1b\1c\1d\1e\1f !\"#")
 (data $41 (i32.const 4956) "\\")
 (data $41.1 (i32.const 4968) "\02\00\00\00J\00\00\006\004\000\002\003\006\004\003\006\003\004\001\005\004\004\003\006\000\003\002\002\008\005\004\001\002\005\009\009\003\006\002\001\001\009\002\006")
 (data $42 (i32.const 5052) "<")
 (data $42.1 (i32.const 5064) "\02\00\00\00*\00\00\00/\00o\00u\00t\00p\00o\00i\00n\00t\00s\00/\00b\00y\00a\00d\00d\00r\00e\00s\00s\00/")
 (data $43 (i32.const 5116) "<")
 (data $43.1 (i32.const 5128) "\02\00\00\00,\00\00\00/\00o\00u\00t\00p\00o\00i\00n\00t\00/\00s\00p\00e\00n\00d\00a\00b\00l\00e\00b\00y\00/")
 (data $44 (i32.const 5180) "<")
 (data $44.1 (i32.const 5192) "\02\00\00\00&\00\00\00/\00o\00u\00t\00p\00u\00t\00/\00b\00y\00o\00u\00t\00p\00o\00i\00n\00t\00/")
 (data $45 (i32.const 5244) "L")
 (data $45.1 (i32.const 5256) "\02\00\00\00.\00\00\00/\00t\00e\00s\00t\00/\00p\00r\00o\00t\00o\00r\00u\00n\00e\00/\00r\00u\00n\00e\00i\00d\00/")
 (data $46 (i32.const 5324) ",")
 (data $46.1 (i32.const 5336) "\02\00\00\00\1a\00\00\00~\00l\00i\00b\00/\00a\00r\00r\00a\00y\00.\00t\00s")
 (data $47 (i32.const 5372) "<")
 (data $47.1 (i32.const 5384) "\02\00\00\00$\00\00\00K\00e\00y\00 \00d\00o\00e\00s\00 \00n\00o\00t\00 \00e\00x\00i\00s\00t")
 (data $48 (i32.const 5436) ",")
 (data $48.1 (i32.const 5448) "\02\00\00\00\16\00\00\00~\00l\00i\00b\00/\00m\00a\00p\00.\00t\00s")
 (data $49 (i32.const 5484) "\1c")
 (data $49.1 (i32.const 5496) "\14\00\00\00\08\00\00\00\01")
 (data $50 (i32.const 5516) "|")
 (data $50.1 (i32.const 5528) "\02\00\00\00^\00\00\00E\00l\00e\00m\00e\00n\00t\00 \00t\00y\00p\00e\00 \00m\00u\00s\00t\00 \00b\00e\00 \00n\00u\00l\00l\00a\00b\00l\00e\00 \00i\00f\00 \00a\00r\00r\00a\00y\00 \00i\00s\00 \00h\00o\00l\00e\00y")
 (data $51 (i32.const 5644) "\1c")
 (data $51.1 (i32.const 5656) "+\00\00\00\08\00\00\00\02")
 (data $52 (i32.const 5676) "\1c")
 (data $52.1 (i32.const 5688) ",\00\00\00\08\00\00\00\03")
 (data $53 (i32.const 5708) "\1c")
 (data $53.1 (i32.const 5720) "-\00\00\00\08\00\00\00\04")
 (data $54 (i32.const 5740) "<")
 (data $54.1 (i32.const 5752) "\02\00\00\00$\00\00\00~\00l\00i\00b\00/\00t\00y\00p\00e\00d\00a\00r\00r\00a\00y\00.\00t\00s")
 (data $55 (i32.const 5804) "|")
 (data $55.1 (i32.const 5816) "\02\00\00\00^\00\00\00S\00H\00A\002\005\006\00:\00 \00c\00a\00n\00\'\00t\00 \00u\00p\00d\00a\00t\00e\00 \00b\00e\00c\00a\00u\00s\00e\00 \00h\00a\00s\00h\00 \00w\00a\00s\00 \00f\00i\00n\00i\00s\00h\00e\00d\00.")
 (data $56 (i32.const 5932) "\\")
 (data $56.1 (i32.const 5944) "\02\00\00\00L\00\00\00~\00l\00i\00b\00/\00f\00a\00s\00t\00-\00s\00h\00a\002\005\006\00-\00a\00s\00/\00a\00s\00s\00e\00m\00b\00l\00y\00/\00s\00h\00a\002\005\006\00.\00t\00s")
 (data $57 (i32.const 6028) "\1c")
 (data $57.1 (i32.const 6040) "\02\00\00\00\04\00\00\00b\00c")
 (data $58 (i32.const 6060) "l")
 (data $58.1 (i32.const 6072) "\02\00\00\00N\00\00\00~\00l\00i\00b\00/\00m\00e\00t\00a\00s\00h\00r\00e\00w\00-\00a\00s\00/\00a\00s\00s\00e\00m\00b\00l\00y\00/\00u\00t\00i\00l\00s\00/\00b\003\002\00.\00t\00s")
 (data $59 (i32.const 6172) "<")
 (data $59.1 (i32.const 6184) "\02\00\00\00(\00\00\00E\00x\00c\00e\00e\00d\00s\00 \00l\00e\00n\00g\00t\00h\00 \00l\00i\00m\00i\00t")
 (data $60 (i32.const 6236) ",")
 (data $60.1 (i32.const 6248) "\02\00\00\00\1c\00\00\00N\00o\00n\00 \005\00-\00b\00i\00t\00 \00w\00o\00r\00d")
 (data $61 (i32.const 6284) ",")
 (data $61.1 (i32.const 6296) "\02\00\00\00\0e\00\00\00/\00l\00e\00n\00g\00t\00h")
 (data $62 (i32.const 6332) "\1c")
 (data $62.1 (i32.const 6344) "\02\00\00\00\02\00\00\00/")
 (data $63 (i32.const 6364) "|")
 (data $63.1 (i32.const 6376) "\02\00\00\00d\00\00\00t\00o\00S\00t\00r\00i\00n\00g\00(\00)\00 \00r\00a\00d\00i\00x\00 \00a\00r\00g\00u\00m\00e\00n\00t\00 \00m\00u\00s\00t\00 \00b\00e\00 \00b\00e\00t\00w\00e\00e\00n\00 \002\00 \00a\00n\00d\00 \003\006")
 (data $64 (i32.const 6492) "<")
 (data $64.1 (i32.const 6504) "\02\00\00\00&\00\00\00~\00l\00i\00b\00/\00u\00t\00i\00l\00/\00n\00u\00m\00b\00e\00r\00.\00t\00s")
 (data $65 (i32.const 6556) "\1c")
 (data $65.1 (i32.const 6568) "\02\00\00\00\02\00\00\000")
 (data $66 (i32.const 6588) "0\000\000\001\000\002\000\003\000\004\000\005\000\006\000\007\000\008\000\009\001\000\001\001\001\002\001\003\001\004\001\005\001\006\001\007\001\008\001\009\002\000\002\001\002\002\002\003\002\004\002\005\002\006\002\007\002\008\002\009\003\000\003\001\003\002\003\003\003\004\003\005\003\006\003\007\003\008\003\009\004\000\004\001\004\002\004\003\004\004\004\005\004\006\004\007\004\008\004\009\005\000\005\001\005\002\005\003\005\004\005\005\005\006\005\007\005\008\005\009\006\000\006\001\006\002\006\003\006\004\006\005\006\006\006\007\006\008\006\009\007\000\007\001\007\002\007\003\007\004\007\005\007\006\007\007\007\008\007\009\008\000\008\001\008\002\008\003\008\004\008\005\008\006\008\007\008\008\008\009\009\000\009\001\009\002\009\003\009\004\009\005\009\006\009\007\009\008\009\009")
 (data $67 (i32.const 6988) "\1c\04")
 (data $67.1 (i32.const 7000) "\02\00\00\00\00\04\00\000\000\000\001\000\002\000\003\000\004\000\005\000\006\000\007\000\008\000\009\000\00a\000\00b\000\00c\000\00d\000\00e\000\00f\001\000\001\001\001\002\001\003\001\004\001\005\001\006\001\007\001\008\001\009\001\00a\001\00b\001\00c\001\00d\001\00e\001\00f\002\000\002\001\002\002\002\003\002\004\002\005\002\006\002\007\002\008\002\009\002\00a\002\00b\002\00c\002\00d\002\00e\002\00f\003\000\003\001\003\002\003\003\003\004\003\005\003\006\003\007\003\008\003\009\003\00a\003\00b\003\00c\003\00d\003\00e\003\00f\004\000\004\001\004\002\004\003\004\004\004\005\004\006\004\007\004\008\004\009\004\00a\004\00b\004\00c\004\00d\004\00e\004\00f\005\000\005\001\005\002\005\003\005\004\005\005\005\006\005\007\005\008\005\009\005\00a\005\00b\005\00c\005\00d\005\00e\005\00f\006\000\006\001\006\002\006\003\006\004\006\005\006\006\006\007\006\008\006\009\006\00a\006\00b\006\00c\006\00d\006\00e\006\00f\007\000\007\001\007\002\007\003\007\004\007\005\007\006\007\007\007\008\007\009\007\00a\007\00b\007\00c\007\00d\007\00e\007\00f\008\000\008\001\008\002\008\003\008\004\008\005\008\006\008\007\008\008\008\009\008\00a\008\00b\008\00c\008\00d\008\00e\008\00f\009\000\009\001\009\002\009\003\009\004\009\005\009\006\009\007\009\008\009\009\009\00a\009\00b\009\00c\009\00d\009\00e\009\00f\00a\000\00a\001\00a\002\00a\003\00a\004\00a\005\00a\006\00a\007\00a\008\00a\009\00a\00a\00a\00b\00a\00c\00a\00d\00a\00e\00a\00f\00b\000\00b\001\00b\002\00b\003\00b\004\00b\005\00b\006\00b\007\00b\008\00b\009\00b\00a\00b\00b\00b\00c\00b\00d\00b\00e\00b\00f\00c\000\00c\001\00c\002\00c\003\00c\004\00c\005\00c\006\00c\007\00c\008\00c\009\00c\00a\00c\00b\00c\00c\00c\00d\00c\00e\00c\00f\00d\000\00d\001\00d\002\00d\003\00d\004\00d\005\00d\006\00d\007\00d\008\00d\009\00d\00a\00d\00b\00d\00c\00d\00d\00d\00e\00d\00f\00e\000\00e\001\00e\002\00e\003\00e\004\00e\005\00e\006\00e\007\00e\008\00e\009\00e\00a\00e\00b\00e\00c\00e\00d\00e\00e\00e\00f\00f\000\00f\001\00f\002\00f\003\00f\004\00f\005\00f\006\00f\007\00f\008\00f\009\00f\00a\00f\00b\00f\00c\00f\00d\00f\00e\00f\00f")
 (data $68 (i32.const 8044) "\\")
 (data $68.1 (i32.const 8056) "\02\00\00\00H\00\00\000\001\002\003\004\005\006\007\008\009\00a\00b\00c\00d\00e\00f\00g\00h\00i\00j\00k\00l\00m\00n\00o\00p\00q\00r\00s\00t\00u\00v\00w\00x\00y\00z")
 (data $69 (i32.const 8140) "\1c")
 (data $69.1 (i32.const 8152) "\02")
 (data $70 (i32.const 8172) "l")
 (data $70.1 (i32.const 8184) "\02\00\00\00N\00\00\00r\00a\00d\00i\00x\00 \00a\00r\00g\00u\00m\00e\00n\00t\00 \00m\00u\00s\00t\00 \00b\00e\00 \00b\00e\00t\00w\00e\00e\00n\00 \001\000\00 \00o\00r\00 \001\006")
 (data $71 (i32.const 8284) "l")
 (data $71.1 (i32.const 8296) "\02\00\00\00N\00\00\00~\00l\00i\00b\00/\00a\00s\00-\00b\00i\00g\00n\00u\00m\00/\00a\00s\00s\00e\00m\00b\00l\00y\00/\00i\00n\00t\00e\00g\00e\00r\00/\00u\001\002\008\00.\00t\00s")
 (data $72 (i32.const 8396) "<")
 (data $72.1 (i32.const 8408) "\02\00\00\00 \00\00\000\001\002\003\004\005\006\007\008\009\00a\00b\00c\00d\00e\00f")
 (data $73 (i32.const 8460) ",")
 (data $73.1 (i32.const 8472) "\02\00\00\00\1a\00\00\00U\00N\00C\00O\00M\00M\00O\00N\00G\00O\00O\00D\00S")
 (data $74 (i32.const 8508) "\1c")
 (data $74.1 (i32.const 8520) "\02\00\00\00\02\00\00\00\c9)")
 (data $75 (i32.const 8540) "\1c")
 (data $75.1 (i32.const 8552) "F\00\00\00\08\00\00\00\05")
 (data $76 (i32.const 8572) "\1c")
 (data $76.1 (i32.const 8584) "\02\00\00\00\0c\00\00\00/\00r\00u\00n\00e\00s")
 (data $77 (i32.const 8604) ",")
 (data $77.1 (i32.const 8616) "\02\00\00\00\12\00\00\00/\00b\00a\00l\00a\00n\00c\00e\00s")
 (data $78 (i32.const 8652) "\1c")
 (data $78.1 (i32.const 8664) "I\00\00\00\08\00\00\00\06")
 (data $79 (i32.const 8684) "\1c")
 (data $79.1 (i32.const 8696) "J\00\00\00\08\00\00\00\07")
 (data $80 (i32.const 8716) "\1c")
 (data $80.1 (i32.const 8728) "K\00\00\00\08\00\00\00\08")
 (data $81 (i32.const 8748) "<")
 (data $81.1 (i32.const 8760) "\02\00\00\00 \00\00\00D\00i\00v\00i\00s\00i\00o\00n\00 \00b\00y\00 \00z\00e\00r\00o")
 (data $82 (i32.const 8812) "\\")
 (data $82.1 (i32.const 8824) "\02\00\00\00D\00\00\00~\00l\00i\00b\00/\00a\00s\00-\00b\00i\00g\00n\00u\00m\00/\00a\00s\00s\00e\00m\00b\00l\00y\00/\00g\00l\00o\00b\00a\00l\00s\00.\00t\00s")
 (data $83 (i32.const 8908) "\1c")
 (data $83.1 (i32.const 8920) "T\00\00\00\08\00\00\00\t")
 (data $84 (i32.const 8940) "\1c")
 (data $84.1 (i32.const 8952) "T\00\00\00\08\00\00\00\n")
 (data $85 (i32.const 8972) "\1c")
 (data $85.1 (i32.const 8984) "U\00\00\00\08\00\00\00\0b")
 (data $86 (i32.const 9004) "\1c")
 (data $86.1 (i32.const 9016) "V\00\00\00\08\00\00\00\0c")
 (data $87 (i32.const 9036) "\1c")
 (data $87.1 (i32.const 9048) "T\00\00\00\08\00\00\00\r")
 (data $88 (i32.const 9068) "\1c")
 (data $88.1 (i32.const 9080) "V\00\00\00\08\00\00\00\0e")
 (data $89 (i32.const 9100) ",")
 (data $89.1 (i32.const 9112) "\02\00\00\00\18\00\00\00/\00b\00y\00o\00u\00t\00p\00o\00i\00n\00t\00/")
 (data $90 (i32.const 9148) ",")
 (data $90.1 (i32.const 9160) "\02\00\00\00\10\00\00\00/\00s\00y\00m\00b\00o\00l\00/")
 (data $91 (i32.const 9196) ",")
 (data $91.1 (i32.const 9208) "\02\00\00\00\10\00\00\00/\00s\00p\00a\00c\00e\00s\00/")
 (data $92 (i32.const 9244) ",")
 (data $92.1 (i32.const 9256) "\02\00\00\00\1c\00\00\00/\00d\00i\00v\00i\00s\00i\00b\00i\00l\00i\00t\00y\00/")
 (data $93 (i32.const 9292) "\1c")
 (data $93.1 (i32.const 9304) "\02\00\00\00\0c\00\00\00/\00n\00a\00m\00e\00s")
 (data $94 (i32.const 9324) "<")
 (data $94.1 (i32.const 9336) "\02\00\00\00 \00\00\00/\00r\00u\00n\00t\00i\00m\00e\00/\00b\00a\00l\00a\00n\00c\00e")
 (data $95 (i32.const 9388) "<")
 (data $95.1 (i32.const 9400) "\02\00\00\00 \00\00\00/\00m\00i\00n\00t\00/\00i\00s\00i\00n\00t\00e\00r\00n\00a\00l")
 (data $96 (i32.const 9452) ",")
 (data $96.1 (i32.const 9464) "\02\00\00\00\1a\00\00\00/\00r\00u\00n\00e\00s\00/\00p\00r\00o\00t\00o\00/")
 (data $97 (i32.const 9500) "<")
 (data $97.1 (i32.const 9512) "\02\00\00\00 \00\00\00~\00l\00i\00b\00/\00d\00a\00t\00a\00v\00i\00e\00w\00.\00t\00s")
 (data $98 (i32.const 9564) "<")
 (data $98.1 (i32.const 9576) "\02\00\00\00\"\00\00\00D\00e\00c\00o\00d\00e\00r\00 \00p\00o\00s\00i\00t\00i\00o\00n\00 ")
 (data $99 (i32.const 9628) "<")
 (data $99.1 (i32.const 9640) "\02\00\00\00\"\00\00\00 \00i\00s\00 \00o\00u\00t\00 \00o\00f\00 \00r\00a\00n\00g\00e\00!")
 (data $100 (i32.const 9692) "\1c\00\00\00\03\00\00\00\00\00\00\00^\00\00\00\0c\00\00\00p%\00\00\00\00\00\00\b0%")
 (data $101 (i32.const 9724) "|")
 (data $101.1 (i32.const 9736) "\02\00\00\00l\00\00\00~\00l\00i\00b\00/\00m\00e\00t\00a\00s\00h\00r\00e\00w\00-\00r\00u\00n\00e\00s\00/\00a\00s\00s\00e\00m\00b\00l\00y\00/\00p\00r\00o\00t\00o\00/\00m\00e\00t\00a\00s\00h\00r\00e\00w\00-\00r\00u\00n\00e\00s\00.\00t\00s")
 (data $102 (i32.const 9852) "\1c")
 (data $102.1 (i32.const 9864) "T\00\00\00\08\00\00\00\0f")
 (data $103 (i32.const 9884) "\1c")
 (data $103.1 (i32.const 9896) "a\00\00\00\08\00\00\00\10")
 (data $104 (i32.const 9916) "\8c")
 (data $104.1 (i32.const 9928) "\02\00\00\00|\00\00\00b\00c\001\00p\00l\003\005\00w\00n\007\00k\005\007\008\00z\00g\005\005\00e\00x\00z\007\009\009\00m\006\00v\006\00p\00n\00u\005\006\003\00w\00g\003\004\00t\007\00y\00g\007\00j\00s\00n\00m\00x\00p\00m\00v\00w\005\00f\00d\00s\00c\00d\00s\00m\00v\00u")
 (data $105 (i32.const 10060) "\ac")
 (data $105.1 (i32.const 10072) "\02\00\00\00\90\00\00\00a\009\002\00b\00a\004\00a\00a\00b\006\00a\00c\003\00f\00e\002\006\006\006\007\006\006\005\00c\00a\006\00b\00c\00d\007\005\00e\00f\00f\002\00c\00d\000\005\009\006\003\00a\00b\006\006\005\00d\002\005\009\00a\003\001\001\001\003\00a\00e\008\003\001\00a\004\000\001\000\000\000\000\000\000")
 (data $106 (i32.const 10236) "\1c")
 (data $106.1 (i32.const 10248) "g\00\00\00\08\00\00\00\11")
 (data $107 (i32.const 10268) "\1c\00\00\00\03\00\00\00\00\00\00\00^\00\00\00\0c\00\00\00p%\00\00\00\00\00\00\b0%")
 (data $108 (i32.const 10300) "L")
 (data $108.1 (i32.const 10312) "\02\00\00\006\00\00\00a\00s\00s\00e\00m\00b\00l\00y\00/\00p\00r\00o\00t\00o\00/\00p\00r\00o\00t\00o\00r\00u\00n\00e\00.\00t\00s")
 (data $109 (i32.const 10380) "\1c")
 (data $109.1 (i32.const 10392) "g\00\00\00\08\00\00\00\12")
 (data $110 (i32.const 10412) "\1c")
 (data $110.1 (i32.const 10424) "\01")
 (data $111 (i32.const 10444) "\1c")
 (data $111.1 (i32.const 10456) "K\00\00\00\08\00\00\00\13")
 (data $112 (i32.const 10476) ",")
 (data $112.1 (i32.const 10488) "\02\00\00\00\12\00\00\00t\00h\00i\00s\00.\00M\00a\00x\00 ")
 (data $113 (i32.const 10524) "\1c")
 (data $113.1 (i32.const 10536) "\02\00\00\00\0c\00\00\00b\00l\00o\00c\00k\00 ")
 (data $114 (i32.const 10556) "\1c")
 (data $114.1 (i32.const 10568) "\02\00\00\00\06\00\00\00t\00x\00 ")
 (data $115 (i32.const 10588) "\1c")
 (data $115.1 (i32.const 10600) "\02\00\00\00\n\00\00\00b\00l\00o\00c\00k")
 (data $116 (i32.const 10620) "\1c")
 (data $116.1 (i32.const 10632) "\02\00\00\00\04\00\00\00t\00x")
 (data $117 (i32.const 10652) ",")
 (data $117.1 (i32.const 10664) "\02\00\00\00\10\00\00\00d\00e\00c\00o\00d\00e\00d\00[")
 (data $118 (i32.const 10700) "\1c")
 (data $118.1 (i32.const 10712) "\02\00\00\00\06\00\00\00]\00:\00 ")
 (data $119 (i32.const 10732) ",")
 (data $119.1 (i32.const 10744) "\02\00\00\00\10\00\00\00d\00e\00c\00o\00d\00e\00d\00/")
 (data $120 (i32.const 10780) "\1c")
 (data $120.1 (i32.const 10792) "K\00\00\00\08\00\00\00\14")
 (data $121 (i32.const 10812) "<")
 (data $121.1 (i32.const 10824) "\02\00\00\00(\00\00\00p\00t\00r\00 \00i\00s\00 \00o\00u\00t\00 \00o\00f\00 \00b\00o\00u\00n\00d\00s")
 (data $122 (i32.const 10876) "l")
 (data $122.1 (i32.const 10888) "\02\00\00\00N\00\00\00~\00l\00i\00b\00/\00m\00e\00t\00a\00s\00h\00r\00e\00w\00-\00a\00s\00/\00a\00s\00s\00e\00m\00b\00l\00y\00/\00u\00t\00i\00l\00s\00/\00b\00o\00x\00.\00t\00s")
 (data $123 (i32.const 10988) "\1c")
 (data $123.1 (i32.const 11000) "\85\00\00\00\08\00\00\00\15")
 (data $124 (i32.const 11020) "\1c")
 (data $124.1 (i32.const 11032) "\86\00\00\00\08\00\00\00\16")
 (data $125 (i32.const 11052) "\1c")
 (data $125.1 (i32.const 11064) "\01")
 (data $126 (i32.const 11084) "\1c")
 (data $126.1 (i32.const 11096) "\87\00\00\00\08\00\00\00\17")
 (data $127 (i32.const 11116) ",")
 (data $127.1 (i32.const 11128) "\02\00\00\00\12\00\00\00P\00r\00o\00t\00o\00b\00u\00r\00n")
 (data $128 (i32.const 11164) ",")
 (data $128.1 (i32.const 11176) "\02\00\00\00\12\00\00\00r\00u\00n\00e\00s\00:\00 \00[\00\n")
 (data $129 (i32.const 11212) "\1c")
 (data $129.1 (i32.const 11224) "\02\00\00\00\04\00\00\00 \00 ")
 (data $130 (i32.const 11244) "\1c")
 (data $130.1 (i32.const 11256) "\02\00\00\00\02\00\00\00:")
 (data $131 (i32.const 11276) "\1c")
 (data $131.1 (i32.const 11288) "\02\00\00\00\02\00\00\00\n")
 (data $132 (i32.const 11308) ",")
 (data $132.1 (i32.const 11320) "\02\00\00\00\1c\00\00\00]\00\n\00b\00a\00l\00a\00n\00c\00e\00s\00:\00 \00[\00\n")
 (data $133 (i32.const 11356) "\1c")
 (data $133.1 (i32.const 11368) "\02\00\00\00\02\00\00\00]")
 (data $134 (i32.const 11388) ",")
 (data $134.1 (i32.const 11400) "\02\00\00\00\18\00\00\00r\00e\00f\00u\00n\00d\00 \00s\00h\00e\00e\00t")
 (data $135 (i32.const 11436) ",")
 (data $135.1 (i32.const 11448) "\02\00\00\00\1a\00\00\00f\00o\00r\00w\00a\00r\00d\00 \00s\00h\00e\00e\00t")
 (data $136 (i32.const 11484) "<")
 (data $136.1 (i32.const 11496) "\02\00\00\00\1e\00\00\00r\00u\00n\00t\00i\00m\00e\00 \00b\00a\00l\00a\00n\00c\00e")
 (data $137 (i32.const 11548) "<")
 (data $137.1 (i32.const 11560) "\02\00\00\00\1e\00\00\00c\00o\00n\00t\00e\00x\00t\00 \00i\00n\00v\00a\00l\00i\00d")
 (data $138 (i32.const 11612) "\1c")
 (data $138.1 (i32.const 11624) "\8c\00\00\00\08\00\00\00\18")
 (data $139 (i32.const 11644) "\1c")
 (data $139.1 (i32.const 11656) "\8d\00\00\00\08\00\00\00\19")
 (data $140 (i32.const 11676) "\1c")
 (data $140.1 (i32.const 11688) "\8d\00\00\00\08\00\00\00\1a")
 (data $141 (i32.const 11708) "\1c")
 (data $141.1 (i32.const 11720) "\8d\00\00\00\08\00\00\00\1b")
 (data $142 (i32.const 11740) ",")
 (data $142.1 (i32.const 11752) "\02\00\00\00\14\00\00\00f\00o\00r\00w\00a\00r\00d\001\00:\00 ")
 (data $143 (i32.const 11788) "\1c")
 (data $143.1 (i32.const 11800) "\02\00\00\00\08\00\00\00t\00r\00u\00e")
 (data $144 (i32.const 11820) "\1c")
 (data $144.1 (i32.const 11832) "\02\00\00\00\n\00\00\00f\00a\00l\00s\00e")
 (data $145 (i32.const 11852) ",")
 (data $145.1 (i32.const 11864) "\02\00\00\00\14\00\00\00d\00e\00p\00o\00s\00i\00t\001\00:\00 ")
 (data $146 (i32.const 11900) "\1c")
 (data $146.1 (i32.const 11912) "\02\00\00\00\08\00\00\00 \00v\00s\00 ")
 (data $147 (i32.const 11932) ",")
 (data $147.1 (i32.const 11944) "\02\00\00\00\12\00\00\00r\00e\00f\00u\00n\00d\001\00:\00 ")
 (data $148 (i32.const 11980) ",")
 (data $148.1 (i32.const 11992) "\02\00\00\00\12\00\00\00r\00e\00f\00u\00n\00d\002\00:\00 ")
 (data $149 (i32.const 12028) "\1c")
 (data $149.1 (i32.const 12040) "\8d\00\00\00\08\00\00\00\1c")
 (data $150 (i32.const 12064) "\8e\00\00\00 \00\00\00 \00\00\00 \00\00\00\00\00\00\00d\00\00\00 \00\00\00\02\01\00\00\10A\82\00 \00\00\00 \00\00\00 \00\00\00 \00\00\00 \00\00\00B\00\00\00A\00\00\00\00\00\00\00\08A\00\00 \00\00\00\02A\00\00\02A")
 (data $150.1 (i32.const 12168) " ")
 (data $150.2 (i32.const 12196) "\02A\00\00\02A\00\00\00\00\00\00\02A\00\00\02A\00\00\02A\00\00 \00\00\00 \00\00\00\00\00\00\00\02A\00\00\02\t")
 (data $150.3 (i32.const 12256) "\01\t\00\00\00\00\00\00 ")
 (data $150.4 (i32.const 12284) " \00\00\00\02A")
 (data $150.5 (i32.const 12304) "\02A\00\00\10\t\82\00\10\t\82\00\10A\02\00 \00\00\00 ")
 (data $150.6 (i32.const 12336) "\10A\04\00\04A\00\00\02A\00\00\00\00\00\00\10A\02\00\02A")
 (data $150.7 (i32.const 12376) "\02A")
 (data $150.8 (i32.const 12392) " \00\00\00\02A\00\00\02A")
 (data $150.9 (i32.const 12444) "\04A\00\00\00\00\00\00 ")
 (data $150.10 (i32.const 12468) "\02A\00\00\02A")
 (data $150.11 (i32.const 12516) " \00\00\00\02A")
 (data $150.12 (i32.const 12532) " \00\00\00\00\00\00\00 \00\00\00 \00\00\00\00\00\00\00 \00\00\00 \00\00\00\00\00\00\00 \00\00\00 \00\00\00\00\00\00\00 ")
 (data $150.13 (i32.const 12588) "\02A\00\00\00\00\00\00\02A")
 (data $150.14 (i32.const 12616) "P\00\02")
 (table $0 29 29 funcref)
 (elem $0 (i32.const 1) $~lib/metashrew-as/assembly/indexer/index/_flush~anonymous|0 $~lib/metashrew-as/assembly/utils/utils/concat~anonymous|0 $~lib/metashrew-as/assembly/utils/box/Box.concat~anonymous|0 $~lib/metashrew-as/assembly/utils/box/Box.concat~anonymous|1 $~lib/metashrew-runes/assembly/indexer/RunesTransaction/RunesTransaction#runestone~anonymous|0 $~lib/metashrew-runes/assembly/indexer/RunestoneMessage/RunestoneMessage#loadBalanceSheet~anonymous|0 $~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet.concat~anonymous|0 $~lib/metashrew-runes/assembly/utils/fieldToArrayBuffer~anonymous|0 $~lib/metashrew-runes/assembly/indexer/RuneId/RuneId.fromBytes~anonymous|0 $assembly/view/outpoint/balanceSheetToProtobuf~anonymous|0~anonymous|0 $assembly/view/outpoint/balanceSheetToProtobuf~anonymous|0 $assembly/view/outpoint/balanceSheetToProtobuf~anonymous|1 $assembly/view/outpoint/balanceSheetToProtobuf~anonymous|0~anonymous|0 $assembly/view/outpoint/balanceSheetToProtobuf~anonymous|1 $assembly/view/outpoint/balanceSheetToProtobuf~anonymous|0~anonymous|0 $assembly/view/runes/runes~anonymous|0 $~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet.concat~anonymous|0 $~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet.concat~anonymous|0 $assembly/indexer/ProtoruneRuneId/ProtoruneRuneId.encode~anonymous|0 $assembly/utils/concatByteArray15BytesPerU128~anonymous|0 $assembly/indexer/Protostone/ProtostoneTable#burns~anonymous|0 $assembly/indexer/Protoburn/Protoburn#constructor~anonymous|0 $assembly/indexer/Protostone/ProtostoneTable#burns~anonymous|1 $assembly/indexer/Protostone/Protostone#loadBalanceSheet~anonymous|0 $assembly/test/DepositAllContext#handle~anonymous|0 $assembly/test/ForwardAllContext#handle~anonymous|0 $assembly/test/SimpleMessageContext#handle~anonymous|0 $assembly/test/RefundMessageContext#handle~anonymous|0)
 (export "trap" (func $assembly/index/trap))
 (export "_start" (func $assembly/index/_start))
 (export "txindexForOutpoint" (func $assembly/view/outpoint/txindexForOutpoint))
 (export "balanceSheetToProtobuf" (func $assembly/view/outpoint/balanceSheetToProtobuf))
 (export "balanceSheetToProtobufForProtocol" (func $assembly/view/outpoint/balanceSheetToProtobufForProtocol))
 (export "outpointBase" (func $assembly/view/outpoint/outpointBase))
 (export "outpointBaseForProtocol" (func $assembly/view/outpoint/outpointBaseForProtocol))
 (export "outpoint" (func $assembly/view/outpoint/outpoint))
 (export "runes" (func $assembly/view/runes/runes))
 (export "wallet_test" (func $assembly/view/wallet/wallet_test))
 (export "runesbyaddress" (func $assembly/view/wallet/runesbyaddress))
 (export "protorunesbyaddress" (func $assembly/view/wallet/protorunesbyaddress))
 (export "runtime" (func $assembly/view/runtime/runtime))
 (export "TEST_PROTORUNE_RUNEID" (global $assembly/test/TEST_PROTORUNE_RUNEID))
 (export "test_ProtoruneRuneId1" (func $assembly/test/test_ProtoruneRuneId1))
 (export "test_ProtoruneRuneId2" (func $assembly/test/test_ProtoruneRuneId2))
 (export "test_ProtoruneRuneId3" (func $assembly/test/test_ProtoruneRuneId3))
 (export "test_ProtoruneRuneId4" (func $assembly/test/test_ProtoruneRuneId4))
 (export "test_ProtoruneRuneId5" (func $assembly/test/test_ProtoruneRuneId5))
 (export "testProtomessageDepositAll" (func $assembly/test/testProtomessageDepositAll))
 (export "testProtomessageForwardAll" (func $assembly/test/testProtomessageForwardAll))
 (export "testSimpleProtorune" (func $assembly/test/testSimpleProtorune))
 (export "testRefundProtorune" (func $assembly/test/testRefundProtorune))
 (export "testEtching" (func $assembly/test/testEtching))
 (export "__new" (func $~lib/rt/stub/__new))
 (export "__pin" (func $~lib/metashrew-as/assembly/indexer/tables/IndexPointer.wrap))
 (export "__unpin" (func $~lib/rt/stub/__unpin))
 (export "__collect" (func $~lib/rt/stub/__collect))
 (export "__rtti_base" (global $~lib/rt/__rtti_base))
 (export "memory" (memory $0))
 (start $~start)
 (func $~lib/rt/stub/__alloc (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  local.get $0
  i32.const 1073741820
  i32.gt_u
  if
   i32.const 1600
   i32.const 1664
   i32.const 33
   i32.const 29
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/rt/stub/offset
  local.set $1
  global.get $~lib/rt/stub/offset
  i32.const 4
  i32.add
  local.tee $2
  local.get $0
  i32.const 19
  i32.add
  i32.const -16
  i32.and
  i32.const 4
  i32.sub
  local.tee $0
  i32.add
  local.tee $3
  memory.size
  local.tee $4
  i32.const 16
  i32.shl
  i32.const 15
  i32.add
  i32.const -16
  i32.and
  local.tee $5
  i32.gt_u
  if
   local.get $4
   local.get $3
   local.get $5
   i32.sub
   i32.const 65535
   i32.add
   i32.const -65536
   i32.and
   i32.const 16
   i32.shr_u
   local.tee $5
   local.get $4
   local.get $5
   i32.gt_s
   select
   memory.grow
   i32.const 0
   i32.lt_s
   if
    local.get $5
    memory.grow
    i32.const 0
    i32.lt_s
    if
     unreachable
    end
   end
  end
  local.get $3
  global.set $~lib/rt/stub/offset
  local.get $1
  local.get $0
  i32.store
  local.get $2
 )
 (func $~lib/rt/stub/__new (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  local.get $0
  i32.const 1073741804
  i32.gt_u
  if
   i32.const 1600
   i32.const 1664
   i32.const 86
   i32.const 30
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  i32.const 16
  i32.add
  call $~lib/rt/stub/__alloc
  local.tee $3
  i32.const 4
  i32.sub
  local.tee $2
  i32.const 0
  i32.store offset=4
  local.get $2
  i32.const 0
  i32.store offset=8
  local.get $2
  local.get $1
  i32.store offset=12
  local.get $2
  local.get $0
  i32.store offset=16
  local.get $3
  i32.const 16
  i32.add
 )
 (func $~lib/arraybuffer/ArrayBuffer#constructor (param $0 i32) (result i32)
  (local $1 i32)
  local.get $0
  i32.const 1073741820
  i32.gt_u
  if
   i32.const 2608
   i32.const 2656
   i32.const 52
   i32.const 43
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  i32.const 1
  call $~lib/rt/stub/__new
  local.tee $1
  i32.const 0
  local.get $0
  memory.fill
  local.get $1
 )
 (func $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#constructor" (result i32)
  (local $0 i32)
  i32.const 24
  i32.const 7
  call $~lib/rt/stub/__new
  local.tee $0
  i32.const 16
  call $~lib/arraybuffer/ArrayBuffer#constructor
  i32.store
  local.get $0
  i32.const 3
  i32.store offset=4
  local.get $0
  i32.const 48
  call $~lib/arraybuffer/ArrayBuffer#constructor
  i32.store offset=8
  local.get $0
  i32.const 4
  i32.store offset=12
  local.get $0
  i32.const 0
  i32.store offset=16
  local.get $0
  i32.const 0
  i32.store offset=20
  local.get $0
 )
 (func $~lib/string/String.UTF8.encode@varargs (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  block $2of2
   block $0of2
    block $outOfRange
     global.get $~argumentsLength
     i32.const 1
     i32.sub
     br_table $0of2 $2of2 $2of2 $outOfRange
    end
    unreachable
   end
   i32.const 0
   local.set $1
  end
  local.get $0
  local.set $3
  local.get $0
  i32.const 20
  i32.sub
  i32.load offset=16
  local.get $0
  i32.add
  local.set $4
  local.get $1
  i32.const 0
  i32.ne
  local.set $2
  loop $while-continue|0
   local.get $3
   local.get $4
   i32.lt_u
   if
    block $while-break|0
     local.get $3
     i32.load16_u
     local.tee $5
     i32.const 128
     i32.lt_u
     if (result i32)
      local.get $1
      local.get $5
      i32.eqz
      i32.and
      br_if $while-break|0
      local.get $2
      i32.const 1
      i32.add
     else
      local.get $5
      i32.const 2048
      i32.lt_u
      if (result i32)
       local.get $2
       i32.const 2
       i32.add
      else
       local.get $5
       i32.const 64512
       i32.and
       i32.const 55296
       i32.eq
       local.get $3
       i32.const 2
       i32.add
       local.get $4
       i32.lt_u
       i32.and
       if
        local.get $3
        i32.load16_u offset=2
        i32.const 64512
        i32.and
        i32.const 56320
        i32.eq
        if
         local.get $2
         i32.const 4
         i32.add
         local.set $2
         local.get $3
         i32.const 4
         i32.add
         local.set $3
         br $while-continue|0
        end
       end
       local.get $2
       i32.const 3
       i32.add
      end
     end
     local.set $2
     local.get $3
     i32.const 2
     i32.add
     local.set $3
     br $while-continue|0
    end
   end
  end
  local.get $2
  i32.const 1
  call $~lib/rt/stub/__new
  local.set $3
  local.get $0
  local.tee $2
  local.get $0
  i32.const 20
  i32.sub
  i32.load offset=16
  i32.const -2
  i32.and
  i32.add
  local.set $5
  local.get $3
  local.set $0
  block $__inlined_func$~lib/string/String.UTF8.encodeUnsafe
   loop $while-continue|00
    local.get $2
    local.get $5
    i32.lt_u
    if
     local.get $2
     i32.load16_u
     local.tee $4
     i32.const 128
     i32.lt_u
     if
      local.get $0
      local.get $4
      i32.store8
      local.get $0
      i32.const 1
      i32.add
      local.set $0
      local.get $1
      local.get $4
      i32.eqz
      i32.and
      br_if $__inlined_func$~lib/string/String.UTF8.encodeUnsafe
     else
      local.get $4
      i32.const 2048
      i32.lt_u
      if (result i32)
       local.get $0
       local.get $4
       i32.const 6
       i32.shr_u
       i32.const 192
       i32.or
       local.get $4
       i32.const 63
       i32.and
       i32.const 128
       i32.or
       i32.const 8
       i32.shl
       i32.or
       i32.store16
       local.get $0
       i32.const 2
       i32.add
      else
       local.get $4
       i32.const 63488
       i32.and
       i32.const 55296
       i32.eq
       if
        local.get $4
        i32.const 56320
        i32.lt_u
        local.get $2
        i32.const 2
        i32.add
        local.get $5
        i32.lt_u
        i32.and
        if
         local.get $2
         i32.load16_u offset=2
         local.tee $6
         i32.const 64512
         i32.and
         i32.const 56320
         i32.eq
         if
          local.get $0
          local.get $4
          i32.const 1023
          i32.and
          i32.const 10
          i32.shl
          i32.const 65536
          i32.add
          local.get $6
          i32.const 1023
          i32.and
          i32.or
          local.tee $4
          i32.const 63
          i32.and
          i32.const 128
          i32.or
          i32.const 24
          i32.shl
          local.get $4
          i32.const 6
          i32.shr_u
          i32.const 63
          i32.and
          i32.const 128
          i32.or
          i32.const 16
          i32.shl
          i32.or
          local.get $4
          i32.const 12
          i32.shr_u
          i32.const 63
          i32.and
          i32.const 128
          i32.or
          i32.const 8
          i32.shl
          i32.or
          local.get $4
          i32.const 18
          i32.shr_u
          i32.const 240
          i32.or
          i32.or
          i32.store
          local.get $0
          i32.const 4
          i32.add
          local.set $0
          local.get $2
          i32.const 4
          i32.add
          local.set $2
          br $while-continue|00
         end
        end
       end
       local.get $0
       local.get $4
       i32.const 12
       i32.shr_u
       i32.const 224
       i32.or
       local.get $4
       i32.const 6
       i32.shr_u
       i32.const 63
       i32.and
       i32.const 128
       i32.or
       i32.const 8
       i32.shl
       i32.or
       i32.store16
       local.get $0
       local.get $4
       i32.const 63
       i32.and
       i32.const 128
       i32.or
       i32.store8 offset=2
       local.get $0
       i32.const 3
       i32.add
      end
      local.set $0
     end
     local.get $2
     i32.const 2
     i32.add
     local.set $2
     br $while-continue|00
    end
   end
   local.get $1
   if
    local.get $0
    i32.const 0
    i32.store8
   end
  end
  local.get $3
 )
 (func $~lib/staticarray/StaticArray<u8>#__get (param $0 i32) (result i32)
  local.get $0
  i32.const 3260
  i32.load
  i32.ge_u
  if
   i32.const 3344
   i32.const 3408
   i32.const 78
   i32.const 41
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  i32.const 3264
  i32.add
  i32.load8_u
 )
 (func $~lib/metashrew-as/assembly/indexer/tables/IndexPointer.wrap (param $0 i32) (result i32)
  local.get $0
 )
 (func $~lib/as-bignum/assembly/utils/atou128 (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i64)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i64)
  (local $9 i64)
  (local $10 i32)
  (local $11 i64)
  (local $12 i64)
  (local $13 i64)
  (local $14 i64)
  (local $15 i32)
  i32.const 10
  local.set $4
  block $folding-inner0
   local.get $0
   i32.const 20
   i32.sub
   i32.load offset=16
   i32.const 1
   i32.shr_u
   local.tee $5
   i32.eqz
   br_if $folding-inner0
   local.get $0
   i32.const 20
   i32.sub
   i32.load offset=16
   i32.const 1
   i32.shr_u
   if (result i32)
    local.get $0
    i32.load16_u
   else
    i32.const -1
   end
   local.tee $1
   i32.const 48
   i32.eq
   local.get $5
   i32.const 1
   i32.eq
   i32.and
   br_if $folding-inner0
   local.get $1
   i32.const 45
   i32.eq
   local.tee $6
   local.get $1
   i32.const 43
   i32.eq
   i32.or
   local.tee $2
   local.get $0
   i32.const 20
   i32.sub
   i32.load offset=16
   i32.const 1
   i32.shr_u
   i32.ge_u
   if (result i32)
    i32.const -1
   else
    local.get $0
    local.get $2
    i32.const 1
    i32.shl
    i32.add
    i32.load16_u
   end
   i32.const 48
   i32.eq
   if
    local.get $2
    i32.const 1
    i32.add
    local.tee $2
    local.get $0
    i32.const 20
    i32.sub
    i32.load offset=16
    i32.const 1
    i32.shr_u
    i32.ge_u
    if (result i32)
     i32.const -1
    else
     local.get $0
     local.get $2
     i32.const 1
     i32.shl
     i32.add
     i32.load16_u
    end
    local.tee $1
    i32.const 32
    i32.or
    i32.const 120
    i32.eq
    if
     i32.const 16
     local.set $4
     local.get $2
     i32.const 1
     i32.add
     local.set $2
    else
     local.get $1
     i32.const 32
     i32.or
     i32.const 111
     i32.eq
     if
      i32.const 8
      local.set $4
      local.get $2
      i32.const 1
      i32.add
      local.set $2
     else
      local.get $1
      i32.const 32
      i32.or
      i32.const 98
      i32.eq
      if
       i32.const 2
       local.set $4
       local.get $2
       i32.const 1
       i32.add
       local.set $2
      else
       local.get $1
       i32.const 48
       i32.eq
       if
        loop $while-continue|0
         local.get $2
         local.get $5
         i32.lt_s
         if (result i32)
          local.get $2
          local.get $0
          i32.const 20
          i32.sub
          i32.load offset=16
          i32.const 1
          i32.shr_u
          i32.ge_u
          if (result i32)
           i32.const -1
          else
           local.get $0
           local.get $2
           i32.const 1
           i32.shl
           i32.add
           i32.load16_u
          end
          i32.const 48
          i32.eq
         else
          i32.const 0
         end
         if
          local.get $2
          i32.const 1
          i32.add
          local.set $2
          br $while-continue|0
         end
        end
       end
      end
     end
    end
   end
   i32.const 16
   i32.const 9
   call $~lib/rt/stub/__new
   local.tee $1
   i64.const 0
   i64.store
   local.get $1
   i64.const 0
   i64.store offset=8
   local.get $2
   local.get $5
   i32.ge_s
   if
    local.get $1
    return
   end
   block $break|1
    block $case3|1
     block $case2|1
      block $case1|1
       local.get $4
       i32.const 2
       i32.ne
       if
        local.get $4
        i32.const 10
        i32.eq
        br_if $case1|1
        local.get $4
        i32.const 16
        i32.eq
        br_if $case2|1
        br $case3|1
       end
       loop $do-loop|2
        local.get $2
        local.get $0
        i32.const 20
        i32.sub
        i32.load offset=16
        i32.const 1
        i32.shr_u
        i32.ge_u
        if (result i32)
         i32.const -1
        else
         local.get $0
         local.get $2
         i32.const 1
         i32.shl
         i32.add
         i32.load16_u
        end
        i32.const 48
        i32.sub
        local.tee $4
        i32.const 2
        i32.lt_u
        if
         local.get $1
         i64.load offset=8
         i64.const 1
         i64.shl
         local.get $1
         i64.load
         local.tee $3
         i64.const 63
         i64.shr_u
         i64.or
         local.set $8
         i32.const 16
         i32.const 9
         call $~lib/rt/stub/__new
         local.tee $1
         local.get $3
         i64.const 1
         i64.shl
         i64.store
         local.get $1
         local.get $8
         i64.store offset=8
         i32.const 16
         i32.const 9
         call $~lib/rt/stub/__new
         local.tee $7
         local.get $4
         i64.extend_i32_u
         i64.store
         local.get $7
         i64.const 0
         i64.store offset=8
         local.get $1
         i64.load
         local.get $7
         i64.load
         i64.or
         local.set $3
         local.get $1
         i64.load offset=8
         local.get $7
         i64.load offset=8
         i64.or
         local.set $8
         i32.const 16
         i32.const 9
         call $~lib/rt/stub/__new
         local.tee $1
         local.get $3
         i64.store
         local.get $1
         local.get $8
         i64.store offset=8
         local.get $5
         local.get $2
         i32.const 1
         i32.add
         local.tee $2
         i32.gt_s
         br_if $do-loop|2
        end
       end
       br $break|1
      end
      loop $do-loop|3
       local.get $2
       local.get $0
       i32.const 20
       i32.sub
       i32.load offset=16
       i32.const 1
       i32.shr_u
       i32.ge_u
       if (result i32)
        i32.const -1
       else
        local.get $0
        local.get $2
        i32.const 1
        i32.shl
        i32.add
        i32.load16_u
       end
       i32.const 48
       i32.sub
       local.tee $4
       i32.const 10
       i32.lt_u
       if
        local.get $1
        i64.load offset=8
        i64.const 3
        i64.shl
        local.get $1
        i64.load
        local.tee $3
        i64.const 61
        i64.shr_u
        i64.or
        local.set $8
        i32.const 16
        i32.const 9
        call $~lib/rt/stub/__new
        local.tee $7
        local.get $3
        i64.const 3
        i64.shl
        i64.store
        local.get $7
        local.get $8
        i64.store offset=8
        local.get $1
        i64.load offset=8
        i64.const 1
        i64.shl
        local.get $1
        i64.load
        local.tee $3
        i64.const 63
        i64.shr_u
        i64.or
        local.set $8
        i32.const 16
        i32.const 9
        call $~lib/rt/stub/__new
        local.tee $1
        local.get $3
        i64.const 1
        i64.shl
        i64.store
        local.get $1
        local.get $8
        i64.store offset=8
        local.get $7
        i64.load
        local.tee $3
        local.get $1
        i64.load
        i64.add
        local.set $8
        local.get $3
        local.get $8
        i64.gt_u
        i64.extend_i32_u
        local.get $7
        i64.load offset=8
        local.get $1
        i64.load offset=8
        i64.add
        i64.add
        local.set $3
        i32.const 16
        i32.const 9
        call $~lib/rt/stub/__new
        local.tee $1
        local.get $8
        i64.store
        local.get $1
        local.get $3
        i64.store offset=8
        i32.const 16
        i32.const 9
        call $~lib/rt/stub/__new
        local.tee $7
        local.get $4
        i64.extend_i32_u
        i64.store
        local.get $7
        i64.const 0
        i64.store offset=8
        local.get $1
        i64.load
        local.tee $3
        local.get $7
        i64.load
        i64.add
        local.set $8
        local.get $3
        local.get $8
        i64.gt_u
        i64.extend_i32_u
        local.get $1
        i64.load offset=8
        local.get $7
        i64.load offset=8
        i64.add
        i64.add
        local.set $3
        i32.const 16
        i32.const 9
        call $~lib/rt/stub/__new
        local.tee $1
        local.get $8
        i64.store
        local.get $1
        local.get $3
        i64.store offset=8
        local.get $5
        local.get $2
        i32.const 1
        i32.add
        local.tee $2
        i32.gt_s
        br_if $do-loop|3
       end
      end
      br $break|1
     end
     loop $do-loop|4
      block $do-break|4
       local.get $2
       local.get $0
       i32.const 20
       i32.sub
       i32.load offset=16
       i32.const 1
       i32.shr_u
       i32.ge_u
       if (result i32)
        i32.const -1
       else
        local.get $0
        local.get $2
        i32.const 1
        i32.shl
        i32.add
        i32.load16_u
       end
       i32.const 48
       i32.sub
       local.tee $4
       i32.const 74
       i32.gt_u
       br_if $do-break|4
       local.get $4
       i32.const 4876
       i32.add
       i32.load8_u
       local.tee $4
       i32.const 16
       i32.ge_u
       br_if $do-break|4
       local.get $1
       i64.load offset=8
       i64.const 4
       i64.shl
       local.get $1
       i64.load
       local.tee $3
       i64.const 60
       i64.shr_u
       i64.or
       local.set $8
       i32.const 16
       i32.const 9
       call $~lib/rt/stub/__new
       local.tee $1
       local.get $3
       i64.const 4
       i64.shl
       i64.store
       local.get $1
       local.get $8
       i64.store offset=8
       i32.const 16
       i32.const 9
       call $~lib/rt/stub/__new
       local.tee $7
       local.get $4
       i64.extend_i32_u
       i64.store
       local.get $7
       i64.const 0
       i64.store offset=8
       local.get $1
       i64.load
       local.get $7
       i64.load
       i64.or
       local.set $3
       local.get $1
       i64.load offset=8
       local.get $7
       i64.load offset=8
       i64.or
       local.set $8
       i32.const 16
       i32.const 9
       call $~lib/rt/stub/__new
       local.tee $1
       local.get $3
       i64.store
       local.get $1
       local.get $8
       i64.store offset=8
       local.get $5
       local.get $2
       i32.const 1
       i32.add
       local.tee $2
       i32.gt_s
       br_if $do-loop|4
      end
     end
     br $break|1
    end
    i32.const 16
    i32.const 9
    call $~lib/rt/stub/__new
    local.tee $7
    local.get $4
    i64.extend_i32_s
    i64.store
    local.get $7
    i64.const 0
    i64.store offset=8
    loop $do-loop|5
     block $do-break|5
      local.get $2
      local.get $0
      i32.const 20
      i32.sub
      i32.load offset=16
      i32.const 1
      i32.shr_u
      i32.ge_u
      if (result i32)
       i32.const -1
      else
       local.get $0
       local.get $2
       i32.const 1
       i32.shl
       i32.add
       i32.load16_u
      end
      i32.const 48
      i32.sub
      local.tee $10
      i32.const 74
      i32.gt_u
      br_if $do-break|5
      local.get $10
      i32.const 4876
      i32.add
      i32.load8_u
      local.tee $10
      local.get $4
      i32.ge_u
      br_if $do-break|5
      local.get $7
      i64.load
      local.tee $3
      i64.const 32
      i64.shr_u
      local.set $8
      local.get $1
      i64.load
      local.tee $11
      i64.const 4294967295
      i64.and
      local.tee $9
      local.get $3
      i64.const 4294967295
      i64.and
      local.tee $12
      i64.mul
      local.set $13
      local.get $8
      local.get $9
      i64.mul
      local.get $12
      local.get $11
      i64.const 32
      i64.shr_u
      local.tee $12
      i64.mul
      local.get $13
      i64.const 32
      i64.shr_u
      i64.add
      local.tee $14
      i64.const 4294967295
      i64.and
      i64.add
      local.set $9
      local.get $8
      local.get $12
      i64.mul
      local.get $14
      i64.const 32
      i64.shr_u
      i64.add
      local.get $3
      local.get $1
      i64.load offset=8
      i64.mul
      i64.add
      local.get $7
      i64.load offset=8
      local.get $11
      i64.mul
      i64.add
      local.get $9
      i64.const 32
      i64.shr_u
      i64.add
      global.set $~lib/as-bignum/assembly/globals/__res128_hi
      global.get $~lib/as-bignum/assembly/globals/__res128_hi
      local.set $3
      i32.const 16
      i32.const 9
      call $~lib/rt/stub/__new
      local.tee $15
      local.get $13
      i64.const 4294967295
      i64.and
      local.get $9
      i64.const 32
      i64.shl
      i64.or
      i64.store
      local.get $15
      local.get $3
      i64.store offset=8
      i32.const 16
      i32.const 9
      call $~lib/rt/stub/__new
      local.tee $1
      local.get $10
      i64.extend_i32_u
      i64.store
      local.get $1
      i64.const 0
      i64.store offset=8
      local.get $15
      i64.load
      local.tee $3
      local.get $1
      i64.load
      i64.add
      local.set $8
      local.get $3
      local.get $8
      i64.gt_u
      i64.extend_i32_u
      local.get $15
      i64.load offset=8
      local.get $1
      i64.load offset=8
      i64.add
      i64.add
      local.set $3
      i32.const 16
      i32.const 9
      call $~lib/rt/stub/__new
      local.tee $1
      local.get $8
      i64.store
      local.get $1
      local.get $3
      i64.store offset=8
      local.get $5
      local.get $2
      i32.const 1
      i32.add
      local.tee $2
      i32.gt_s
      br_if $do-loop|5
     end
    end
   end
   local.get $6
   if
    local.get $1
    i64.load
    i64.const -1
    i64.xor
    local.tee $3
    i64.const 1
    i64.add
    local.set $8
    local.get $3
    local.get $8
    i64.gt_u
    i64.extend_i32_u
    local.get $1
    i64.load offset=8
    i64.const -1
    i64.xor
    i64.add
    local.set $3
    i32.const 16
    i32.const 9
    call $~lib/rt/stub/__new
    local.tee $1
    local.get $8
    i64.store
    local.get $1
    local.get $3
    i64.store offset=8
   end
   local.get $1
   return
  end
  i32.const 16
  i32.const 9
  call $~lib/rt/stub/__new
  local.tee $0
  i64.const 0
  i64.store
  local.get $0
  i64.const 0
  i64.store offset=8
  local.get $0
 )
 (func $assembly/index/trap
  unreachable
 )
 (func $~lib/metashrew-as/assembly/utils/box/Box#constructor (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  i32.const 8
  i32.const 17
  call $~lib/rt/stub/__new
  local.tee $2
  i32.const 0
  i32.store
  local.get $2
  i32.const 0
  i32.store offset=4
  local.get $2
  local.get $0
  i32.store
  local.get $2
  local.get $1
  i32.store offset=4
  local.get $2
 )
 (func $~lib/rt/stub/__renew (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  local.get $1
  i32.const 1073741804
  i32.gt_u
  if
   i32.const 1600
   i32.const 1664
   i32.const 99
   i32.const 30
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  i32.const 16
  i32.sub
  local.tee $0
  i32.const 15
  i32.and
  i32.const 1
  local.get $0
  select
  if
   i32.const 0
   i32.const 1664
   i32.const 45
   i32.const 3
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/rt/stub/offset
  local.get $0
  i32.const 4
  i32.sub
  local.tee $3
  i32.load
  local.tee $4
  local.get $0
  i32.add
  i32.eq
  local.set $5
  local.get $1
  i32.const 16
  i32.add
  local.tee $6
  i32.const 19
  i32.add
  i32.const -16
  i32.and
  i32.const 4
  i32.sub
  local.set $2
  local.get $4
  local.get $6
  i32.lt_u
  if
   local.get $5
   if
    local.get $6
    i32.const 1073741820
    i32.gt_u
    if
     i32.const 1600
     i32.const 1664
     i32.const 52
     i32.const 33
     call $~lib/builtins/abort
     unreachable
    end
    local.get $0
    local.get $2
    i32.add
    local.tee $4
    memory.size
    local.tee $5
    i32.const 16
    i32.shl
    i32.const 15
    i32.add
    i32.const -16
    i32.and
    local.tee $6
    i32.gt_u
    if
     local.get $5
     local.get $4
     local.get $6
     i32.sub
     i32.const 65535
     i32.add
     i32.const -65536
     i32.and
     i32.const 16
     i32.shr_u
     local.tee $6
     local.get $5
     local.get $6
     i32.gt_s
     select
     memory.grow
     i32.const 0
     i32.lt_s
     if
      local.get $6
      memory.grow
      i32.const 0
      i32.lt_s
      if
       unreachable
      end
     end
    end
    local.get $4
    global.set $~lib/rt/stub/offset
    local.get $3
    local.get $2
    i32.store
   else
    local.get $2
    local.get $4
    i32.const 1
    i32.shl
    local.tee $3
    local.get $2
    local.get $3
    i32.gt_u
    select
    call $~lib/rt/stub/__alloc
    local.tee $2
    local.get $0
    local.get $4
    memory.copy
    local.get $2
    local.set $0
   end
  else
   local.get $5
   if
    local.get $0
    local.get $2
    i32.add
    global.set $~lib/rt/stub/offset
    local.get $3
    local.get $2
    i32.store
   end
  end
  local.get $0
  i32.const 4
  i32.sub
  local.get $1
  i32.store offset=16
  local.get $0
  i32.const 16
  i32.add
 )
 (func $~lib/array/ensureCapacity (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32)
  (local $4 i32)
  (local $5 i32)
  local.get $1
  local.get $0
  i32.load offset=8
  local.tee $4
  local.get $2
  i32.shr_u
  i32.gt_u
  if
   local.get $1
   i32.const 1073741820
   local.get $2
   i32.shr_u
   i32.gt_u
   if
    i32.const 2608
    i32.const 5344
    i32.const 19
    i32.const 48
    call $~lib/builtins/abort
    unreachable
   end
   i32.const 8
   local.get $1
   local.get $1
   i32.const 8
   i32.le_u
   select
   local.get $2
   i32.shl
   local.set $1
   local.get $3
   if
    i32.const 1073741820
    local.get $4
    i32.const 1
    i32.shl
    local.tee $2
    local.get $2
    i32.const 1073741820
    i32.ge_u
    select
    local.tee $2
    local.get $1
    local.get $1
    local.get $2
    i32.lt_u
    select
    local.set $1
   end
   local.get $0
   i32.load
   local.tee $5
   local.get $1
   call $~lib/rt/stub/__renew
   local.tee $2
   local.get $4
   i32.add
   i32.const 0
   local.get $1
   local.get $4
   i32.sub
   memory.fill
   local.get $2
   local.get $5
   i32.ne
   if
    local.get $0
    local.get $2
    i32.store
    local.get $0
    local.get $2
    i32.store offset=4
   end
   local.get $0
   local.get $1
   i32.store offset=8
  end
 )
 (func $~lib/array/Array<~lib/string/String>#__set (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  local.get $1
  local.get $0
  i32.load offset=12
  i32.ge_u
  if
   local.get $1
   i32.const 0
   i32.lt_s
   if
    i32.const 3344
    i32.const 5344
    i32.const 130
    i32.const 22
    call $~lib/builtins/abort
    unreachable
   end
   local.get $0
   local.get $1
   i32.const 1
   i32.add
   local.tee $3
   i32.const 2
   i32.const 1
   call $~lib/array/ensureCapacity
   local.get $0
   local.get $3
   i32.store offset=12
  end
  local.get $0
  i32.load offset=4
  local.get $1
  i32.const 2
  i32.shl
  i32.add
  local.get $2
  i32.store
 )
 (func $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#keys" (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  local.get $0
  i32.load offset=8
  local.set $2
  local.get $0
  i32.load offset=16
  local.set $3
  i32.const 16
  i32.const 18
  call $~lib/rt/stub/__new
  local.tee $1
  i32.const 0
  i32.store
  local.get $1
  i32.const 0
  i32.store offset=4
  local.get $1
  i32.const 0
  i32.store offset=8
  local.get $1
  i32.const 0
  i32.store offset=12
  local.get $3
  i32.const 268435455
  i32.gt_u
  if
   i32.const 2608
   i32.const 5344
   i32.const 70
   i32.const 60
   call $~lib/builtins/abort
   unreachable
  end
  i32.const 8
  local.get $3
  local.get $3
  i32.const 8
  i32.le_u
  select
  i32.const 2
  i32.shl
  local.tee $0
  i32.const 1
  call $~lib/rt/stub/__new
  local.tee $5
  i32.const 0
  local.get $0
  memory.fill
  local.get $1
  local.get $5
  i32.store
  local.get $1
  local.get $5
  i32.store offset=4
  local.get $1
  local.get $0
  i32.store offset=8
  local.get $1
  local.get $3
  i32.store offset=12
  i32.const 0
  local.set $0
  loop $for-loop|0
   local.get $3
   local.get $4
   i32.gt_s
   if
    local.get $2
    local.get $4
    i32.const 12
    i32.mul
    i32.add
    local.tee $5
    i32.load offset=8
    i32.const 1
    i32.and
    i32.eqz
    if
     local.get $1
     local.get $0
     local.get $5
     i32.load
     call $~lib/array/Array<~lib/string/String>#__set
     local.get $0
     i32.const 1
     i32.add
     local.set $0
    end
    local.get $4
    i32.const 1
    i32.add
    local.set $4
    br $for-loop|0
   end
  end
  local.get $1
  local.get $0
  i32.const 2
  i32.const 0
  call $~lib/array/ensureCapacity
  local.get $1
  local.get $0
  i32.store offset=12
  local.get $1
 )
 (func $~lib/array/Array<~lib/array/Array<u8>>#constructor (result i32)
  (local $0 i32)
  (local $1 i32)
  i32.const 16
  i32.const 19
  call $~lib/rt/stub/__new
  local.tee $0
  i32.const 0
  i32.store
  local.get $0
  i32.const 0
  i32.store offset=4
  local.get $0
  i32.const 0
  i32.store offset=8
  local.get $0
  i32.const 0
  i32.store offset=12
  i32.const 32
  i32.const 1
  call $~lib/rt/stub/__new
  local.tee $1
  i32.const 0
  i32.const 32
  memory.fill
  local.get $0
  local.get $1
  i32.store
  local.get $0
  local.get $1
  i32.store offset=4
  local.get $0
  i32.const 32
  i32.store offset=8
  local.get $0
  i32.const 0
  i32.store offset=12
  local.get $0
 )
 (func $~lib/util/hash/HASH<~lib/string/String> (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  local.get $0
  if (result i32)
   local.get $0
   local.tee $1
   i32.const 20
   i32.sub
   i32.load offset=16
   i32.const -2
   i32.and
   local.tee $3
   i32.const 16
   i32.ge_u
   if (result i32)
    i32.const 606290984
    local.set $2
    i32.const -2048144777
    local.set $4
    i32.const 1640531535
    local.set $5
    local.get $1
    local.get $3
    i32.add
    i32.const 16
    i32.sub
    local.set $7
    loop $while-continue|0
     local.get $1
     local.get $7
     i32.le_u
     if
      local.get $2
      local.get $1
      i32.load
      i32.const -2048144777
      i32.mul
      i32.add
      i32.const 13
      i32.rotl
      i32.const -1640531535
      i32.mul
      local.set $2
      local.get $4
      local.get $1
      i32.load offset=4
      i32.const -2048144777
      i32.mul
      i32.add
      i32.const 13
      i32.rotl
      i32.const -1640531535
      i32.mul
      local.set $4
      local.get $6
      local.get $1
      i32.load offset=8
      i32.const -2048144777
      i32.mul
      i32.add
      i32.const 13
      i32.rotl
      i32.const -1640531535
      i32.mul
      local.set $6
      local.get $5
      local.get $1
      i32.load offset=12
      i32.const -2048144777
      i32.mul
      i32.add
      i32.const 13
      i32.rotl
      i32.const -1640531535
      i32.mul
      local.set $5
      local.get $1
      i32.const 16
      i32.add
      local.set $1
      br $while-continue|0
     end
    end
    local.get $3
    local.get $2
    i32.const 1
    i32.rotl
    local.get $4
    i32.const 7
    i32.rotl
    i32.add
    local.get $6
    i32.const 12
    i32.rotl
    i32.add
    local.get $5
    i32.const 18
    i32.rotl
    i32.add
    i32.add
   else
    local.get $3
    i32.const 374761393
    i32.add
   end
   local.set $2
   local.get $0
   local.get $3
   i32.add
   i32.const 4
   i32.sub
   local.set $4
   loop $while-continue|1
    local.get $1
    local.get $4
    i32.le_u
    if
     local.get $2
     local.get $1
     i32.load
     i32.const -1028477379
     i32.mul
     i32.add
     i32.const 17
     i32.rotl
     i32.const 668265263
     i32.mul
     local.set $2
     local.get $1
     i32.const 4
     i32.add
     local.set $1
     br $while-continue|1
    end
   end
   local.get $0
   local.get $3
   i32.add
   local.set $0
   loop $while-continue|2
    local.get $0
    local.get $1
    i32.gt_u
    if
     local.get $2
     local.get $1
     i32.load8_u
     i32.const 374761393
     i32.mul
     i32.add
     i32.const 11
     i32.rotl
     i32.const -1640531535
     i32.mul
     local.set $2
     local.get $1
     i32.const 1
     i32.add
     local.set $1
     br $while-continue|2
    end
   end
   local.get $2
   local.get $2
   i32.const 15
   i32.shr_u
   i32.xor
   i32.const -2048144777
   i32.mul
   local.tee $0
   i32.const 13
   i32.shr_u
   local.get $0
   i32.xor
   i32.const -1028477379
   i32.mul
   local.tee $0
   i32.const 16
   i32.shr_u
   local.get $0
   i32.xor
  else
   i32.const 0
  end
 )
 (func $~lib/string/String.__eq (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  local.get $0
  local.get $1
  i32.eq
  if
   i32.const 1
   return
  end
  local.get $1
  i32.eqz
  local.get $0
  i32.eqz
  i32.or
  if
   i32.const 0
   return
  end
  local.get $0
  i32.const 20
  i32.sub
  i32.load offset=16
  i32.const 1
  i32.shr_u
  local.tee $3
  local.get $1
  i32.const 20
  i32.sub
  i32.load offset=16
  i32.const 1
  i32.shr_u
  i32.ne
  if
   i32.const 0
   return
  end
  local.get $0
  local.set $2
  local.get $3
  local.tee $0
  i32.const 4
  i32.ge_u
  if (result i32)
   local.get $2
   i32.const 7
   i32.and
   local.get $1
   i32.const 7
   i32.and
   i32.or
  else
   i32.const 1
  end
  i32.eqz
  if
   loop $do-loop|0
    local.get $2
    i64.load
    local.get $1
    i64.load
    i64.eq
    if
     local.get $2
     i32.const 8
     i32.add
     local.set $2
     local.get $1
     i32.const 8
     i32.add
     local.set $1
     local.get $0
     i32.const 4
     i32.sub
     local.tee $0
     i32.const 4
     i32.ge_u
     br_if $do-loop|0
    end
   end
  end
  block $__inlined_func$~lib/util/string/compareImpl$113
   loop $while-continue|1
    local.get $0
    local.tee $3
    i32.const 1
    i32.sub
    local.set $0
    local.get $3
    if
     local.get $2
     i32.load16_u
     local.tee $5
     local.get $1
     i32.load16_u
     local.tee $4
     i32.sub
     local.set $3
     local.get $4
     local.get $5
     i32.ne
     br_if $__inlined_func$~lib/util/string/compareImpl$113
     local.get $2
     i32.const 2
     i32.add
     local.set $2
     local.get $1
     i32.const 2
     i32.add
     local.set $1
     br $while-continue|1
    end
   end
   i32.const 0
   local.set $3
  end
  local.get $3
  i32.eqz
 )
 (func $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#find" (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  local.get $0
  i32.load
  local.get $2
  local.get $0
  i32.load offset=4
  i32.and
  i32.const 2
  i32.shl
  i32.add
  i32.load
  local.set $0
  loop $while-continue|0
   local.get $0
   if
    local.get $0
    i32.load offset=8
    local.tee $2
    i32.const 1
    i32.and
    if (result i32)
     i32.const 0
    else
     local.get $0
     i32.load
     local.get $1
     call $~lib/string/String.__eq
    end
    if
     local.get $0
     return
    end
    local.get $2
    i32.const -2
    i32.and
    local.set $0
    br $while-continue|0
   end
  end
  i32.const 0
 )
 (func $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#get" (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  local.get $1
  local.get $1
  call $~lib/util/hash/HASH<~lib/string/String>
  call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#find"
  local.tee $0
  i32.eqz
  if
   i32.const 5392
   i32.const 5456
   i32.const 105
   i32.const 17
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  i32.load offset=4
 )
 (func $~lib/array/Array<u8>#constructor (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  i32.const 16
  i32.const 13
  call $~lib/rt/stub/__new
  local.tee $1
  i32.const 0
  i32.store
  local.get $1
  i32.const 0
  i32.store offset=4
  local.get $1
  i32.const 0
  i32.store offset=8
  local.get $1
  i32.const 0
  i32.store offset=12
  local.get $0
  i32.const 1073741820
  i32.gt_u
  if
   i32.const 2608
   i32.const 5344
   i32.const 70
   i32.const 60
   call $~lib/builtins/abort
   unreachable
  end
  i32.const 8
  local.get $0
  local.get $0
  i32.const 8
  i32.le_u
  select
  local.tee $2
  i32.const 1
  call $~lib/rt/stub/__new
  local.tee $3
  i32.const 0
  local.get $2
  memory.fill
  local.get $1
  local.get $3
  i32.store
  local.get $1
  local.get $3
  i32.store offset=4
  local.get $1
  local.get $2
  i32.store offset=8
  local.get $1
  local.get $0
  i32.store offset=12
  local.get $1
 )
 (func $~lib/metashrew-as/assembly/indexer/index/arrayBufferToArray (param $0 i32) (result i32)
  (local $1 i32)
  local.get $0
  i32.const 20
  i32.sub
  i32.load offset=16
  call $~lib/array/Array<u8>#constructor
  local.tee $1
  local.get $0
  i32.store
  local.get $1
  local.get $0
  i32.store offset=4
  local.get $1
 )
 (func $~lib/array/Array<~lib/array/Array<u8>>#push (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  local.get $0
  local.get $0
  i32.load offset=12
  local.tee $3
  i32.const 1
  i32.add
  local.tee $2
  i32.const 2
  i32.const 1
  call $~lib/array/ensureCapacity
  local.get $0
  i32.load offset=4
  local.get $3
  i32.const 2
  i32.shl
  i32.add
  local.get $1
  i32.store
  local.get $0
  local.get $2
  i32.store offset=12
  local.get $2
 )
 (func $~lib/metashrew-as/assembly/indexer/index/_flush~anonymous|0 (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (result i32)
  local.get $0
  global.get $~lib/metashrew-as/assembly/indexer/index/_updateKeys
  local.get $1
  call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#get"
  call $~lib/metashrew-as/assembly/indexer/index/arrayBufferToArray
  call $~lib/array/Array<~lib/array/Array<u8>>#push
  drop
  local.get $0
  global.get $~lib/metashrew-as/assembly/indexer/index/_updates
  local.get $1
  call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#get"
  call $~lib/metashrew-as/assembly/indexer/index/arrayBufferToArray
  call $~lib/array/Array<~lib/array/Array<u8>>#push
  drop
  local.get $0
 )
 (func $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#clear" (param $0 i32)
  local.get $0
  i32.const 16
  call $~lib/arraybuffer/ArrayBuffer#constructor
  i32.store
  local.get $0
  i32.const 3
  i32.store offset=4
  local.get $0
  i32.const 48
  call $~lib/arraybuffer/ArrayBuffer#constructor
  i32.store offset=8
  local.get $0
  i32.const 4
  i32.store offset=12
  local.get $0
  i32.const 0
  i32.store offset=16
  local.get $0
  i32.const 0
  i32.store offset=20
 )
 (func $~lib/array/Array<u8>#push (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  local.get $0
  local.get $0
  i32.load offset=12
  local.tee $2
  i32.const 1
  i32.add
  local.tee $3
  i32.const 0
  i32.const 1
  call $~lib/array/ensureCapacity
  local.get $0
  i32.load offset=4
  local.get $2
  i32.add
  local.get $1
  i32.store8
  local.get $0
  local.get $3
  i32.store offset=12
 )
 (func $~lib/metashrew-as/assembly/proto/metashrew/__proto.Encoder#varint64 (param $0 i32) (param $1 i64)
  loop $while-continue|0
   local.get $1
   i64.const 127
   i64.gt_u
   if
    local.get $0
    i32.load
    local.get $1
    i64.const 127
    i64.and
    i64.const 128
    i64.or
    i32.wrap_i64
    call $~lib/array/Array<u8>#push
    local.get $1
    i64.const 7
    i64.shr_u
    local.set $1
    br $while-continue|0
   end
  end
  local.get $0
  i32.load
  local.get $1
  i32.wrap_i64
  call $~lib/array/Array<u8>#push
 )
 (func $~lib/array/Array<~lib/array/Array<u8>>#__get (param $0 i32) (param $1 i32) (result i32)
  local.get $1
  local.get $0
  i32.load offset=12
  i32.ge_u
  if
   i32.const 3344
   i32.const 5344
   i32.const 114
   i32.const 42
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  i32.load offset=4
  local.get $1
  i32.const 2
  i32.shl
  i32.add
  i32.load
  local.tee $0
  i32.eqz
  if
   i32.const 5536
   i32.const 5344
   i32.const 118
   i32.const 40
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
 )
 (func $~lib/array/Array<u8>#__get (param $0 i32) (param $1 i32) (result i32)
  local.get $1
  local.get $0
  i32.load offset=12
  i32.ge_u
  if
   i32.const 3344
   i32.const 5344
   i32.const 114
   i32.const 42
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  i32.load offset=4
  local.get $1
  i32.add
  i32.load8_u
 )
 (func $~lib/metashrew-as/assembly/indexer/index/_flush
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  global.get $~lib/metashrew-as/assembly/indexer/index/_updateKeys
  call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#keys"
  local.set $0
  call $~lib/array/Array<~lib/array/Array<u8>>#constructor
  local.tee $3
  local.set $2
  local.get $0
  i32.load offset=12
  local.set $4
  loop $for-loop|0
   local.get $1
   local.get $4
   local.get $0
   i32.load offset=12
   local.tee $5
   local.get $4
   local.get $5
   i32.lt_s
   select
   i32.lt_s
   if
    local.get $0
    i32.load offset=4
    local.get $1
    i32.const 2
    i32.shl
    i32.add
    i32.load
    local.set $5
    i32.const 4
    global.set $~argumentsLength
    local.get $2
    local.get $5
    local.get $1
    local.get $0
    i32.const 5504
    i32.load
    call_indirect (type $3)
    local.set $2
    local.get $1
    i32.const 1
    i32.add
    local.set $1
    br $for-loop|0
   end
  end
  i32.const 4
  i32.const 21
  call $~lib/rt/stub/__new
  local.tee $0
  i32.eqz
  if
   i32.const 0
   i32.const 0
   call $~lib/rt/stub/__new
   local.set $0
  end
  local.get $0
  call $~lib/array/Array<~lib/array/Array<u8>>#constructor
  i32.store
  local.get $0
  local.get $3
  i32.store
  global.get $~lib/metashrew-as/assembly/indexer/index/_updateKeys
  call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#clear"
  i32.const 0
  global.set $~argumentsLength
  i32.const 0
  local.set $2
  i32.const 0
  call $~lib/array/Array<u8>#constructor
  local.set $1
  i32.const 4
  i32.const 22
  call $~lib/rt/stub/__new
  local.tee $3
  i32.const 0
  i32.store
  local.get $3
  local.get $1
  i32.store
  local.get $3
  i32.load
  local.set $4
  local.get $0
  i32.load
  i32.load offset=12
  i32.const 0
  i32.gt_s
  if
   loop $for-loop|00
    local.get $2
    local.get $0
    i32.load
    i32.load offset=12
    i32.lt_s
    if
     local.get $3
     i64.const 10
     call $~lib/metashrew-as/assembly/proto/metashrew/__proto.Encoder#varint64
     local.get $3
     local.get $0
     i32.load
     local.get $2
     call $~lib/array/Array<~lib/array/Array<u8>>#__get
     i64.load32_s offset=12
     call $~lib/metashrew-as/assembly/proto/metashrew/__proto.Encoder#varint64
     local.get $0
     i32.load
     local.get $2
     call $~lib/array/Array<~lib/array/Array<u8>>#__get
     local.set $5
     i32.const 0
     local.set $1
     loop $for-loop|1
      local.get $1
      local.get $5
      i32.load offset=12
      i32.lt_s
      if
       local.get $3
       i32.load
       local.get $5
       local.get $1
       call $~lib/array/Array<u8>#__get
       call $~lib/array/Array<u8>#push
       local.get $1
       i32.const 1
       i32.add
       local.set $1
       br $for-loop|1
      end
     end
     local.get $2
     i32.const 1
     i32.add
     local.set $2
     br $for-loop|00
    end
   end
  end
  local.get $4
  i32.load offset=12
  local.tee $0
  i32.const 4
  call $~lib/rt/stub/__new
  local.tee $1
  local.get $4
  i32.load offset=4
  local.get $0
  memory.copy
  local.get $1
  call $~lib/metashrew-as/assembly/indexer/index/__flush
 )
 (func $~lib/metashrew-as/assembly/utils/utils/parseBytes (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  local.get $0
  i32.load
  local.get $0
  i32.load offset=4
  call $~lib/metashrew-as/assembly/utils/box/Box#constructor
  local.tee $2
  local.get $1
  i32.store offset=4
  local.get $0
  local.get $0
  i32.load
  local.get $1
  i32.add
  i32.store
  local.get $0
  local.get $0
  i32.load offset=4
  local.get $1
  i32.sub
  i32.store offset=4
  local.get $2
 )
 (func $~lib/metashrew-as/assembly/utils/utils/parseVarInt (param $0 i32) (result i64)
  (local $1 i64)
  (local $2 i32)
  (local $3 i32)
  local.get $0
  i32.load
  local.tee $2
  i32.load8_u
  local.set $3
  local.get $0
  local.get $2
  i32.const 1
  i32.add
  i32.store
  local.get $0
  local.get $0
  i32.load offset=4
  i32.const 1
  i32.sub
  i32.store offset=4
  block $case3|0
   block $case2|0
    block $case1|0
     block $case0|0
      local.get $3
      i32.const 253
      i32.sub
      br_table $case2|0 $case1|0 $case0|0 $case3|0
     end
     local.get $0
     i32.load
     local.tee $2
     i64.load
     local.set $1
     local.get $0
     local.get $2
     i32.const 8
     i32.add
     i32.store
     local.get $0
     local.get $0
     i32.load offset=4
     i32.const 8
     i32.sub
     i32.store offset=4
     local.get $1
     return
    end
    local.get $0
    i32.load
    local.tee $2
    i32.load
    local.set $3
    local.get $0
    local.get $2
    i32.const 4
    i32.add
    i32.store
    local.get $0
    local.get $0
    i32.load offset=4
    i32.const 4
    i32.sub
    i32.store offset=4
    local.get $3
    i64.extend_i32_u
    return
   end
   local.get $0
   i32.load
   local.tee $2
   i32.load16_u
   local.set $3
   local.get $0
   local.get $2
   i32.const 2
   i32.add
   i32.store
   local.get $0
   local.get $0
   i32.load offset=4
   i32.const 2
   i32.sub
   i32.store offset=4
   local.get $3
   i64.extend_i32_u
   return
  end
  local.get $3
  i64.extend_i32_u
 )
 (func $~lib/metashrew-as/assembly/blockdata/transaction/Output#constructor (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i64)
  i32.const 21
  i32.const 34
  call $~lib/rt/stub/__new
  local.tee $2
  i32.const 0
  i32.store
  local.get $2
  i64.const 0
  i64.store offset=8
  local.get $2
  i32.const 0
  i32.store offset=16
  local.get $2
  i32.const 0
  i32.store8 offset=20
  local.get $0
  i32.load
  local.tee $3
  i64.load
  local.set $4
  local.get $0
  local.get $3
  i32.const 8
  i32.add
  i32.store
  local.get $0
  local.get $0
  i32.load offset=4
  i32.const 8
  i32.sub
  i32.store offset=4
  local.get $2
  local.get $4
  i64.store offset=8
  local.get $2
  local.get $0
  local.get $0
  call $~lib/metashrew-as/assembly/utils/utils/parseVarInt
  i32.wrap_i64
  call $~lib/metashrew-as/assembly/utils/utils/parseBytes
  i32.store offset=16
  local.get $2
  local.get $3
  local.get $0
  i32.load
  local.get $3
  i32.sub
  call $~lib/metashrew-as/assembly/utils/box/Box#constructor
  i32.store
  local.get $2
  local.get $1
  i32.store8 offset=20
  local.get $2
 )
 (func $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#constructor (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
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
  local.get $0
  i32.eqz
  if
   i32.const 36
   i32.const 28
   call $~lib/rt/stub/__new
   local.set $0
  end
  local.get $0
  i32.const 0
  i32.store
  local.get $0
  i32.const 0
  i32.store offset=4
  local.get $0
  i32.const 0
  i32.store8 offset=8
  local.get $0
  i32.const 0
  i32.store offset=12
  local.get $0
  i32.const 0
  i32.store offset=16
  local.get $0
  i32.const 0
  i32.store offset=20
  local.get $0
  i32.const 0
  i32.store offset=24
  local.get $0
  i32.const 0
  i32.store offset=28
  local.get $0
  i32.const 0
  i32.store offset=32
  local.get $0
  i32.const 0
  i32.store
  i32.const 16
  i32.const 33
  call $~lib/rt/stub/__new
  local.tee $3
  i32.const 0
  i32.store
  local.get $3
  i32.const 0
  i32.store offset=4
  local.get $3
  i32.const 0
  i32.store offset=8
  local.get $3
  i32.const 0
  i32.store offset=12
  i32.const 32
  i32.const 1
  call $~lib/rt/stub/__new
  local.tee $4
  i32.const 0
  i32.const 32
  memory.fill
  local.get $3
  local.get $4
  i32.store
  local.get $3
  local.get $4
  i32.store offset=4
  local.get $3
  i32.const 32
  i32.store offset=8
  local.get $3
  i32.const 0
  i32.store offset=12
  local.get $0
  local.get $3
  i32.store offset=12
  i32.const 16
  i32.const 35
  call $~lib/rt/stub/__new
  local.tee $3
  i32.const 0
  i32.store
  local.get $3
  i32.const 0
  i32.store offset=4
  local.get $3
  i32.const 0
  i32.store offset=8
  local.get $3
  i32.const 0
  i32.store offset=12
  i32.const 32
  i32.const 1
  call $~lib/rt/stub/__new
  local.tee $4
  i32.const 0
  i32.const 32
  memory.fill
  local.get $3
  local.get $4
  i32.store
  local.get $3
  local.get $4
  i32.store offset=4
  local.get $3
  i32.const 32
  i32.store offset=8
  local.get $3
  i32.const 0
  i32.store offset=12
  local.get $0
  local.get $3
  i32.store offset=16
  local.get $0
  i32.const 0
  i32.store offset=24
  local.get $0
  i32.const 0
  i32.store offset=28
  local.get $0
  i32.const 0
  i32.store8 offset=8
  local.get $0
  i32.const 0
  call $~lib/arraybuffer/ArrayBuffer#constructor
  i32.store offset=32
  local.get $1
  i32.load
  local.tee $4
  i32.load
  local.set $3
  local.get $1
  local.get $4
  i32.const 4
  i32.add
  i32.store
  local.get $1
  local.get $1
  i32.load offset=4
  i32.const 4
  i32.sub
  i32.store offset=4
  local.get $0
  local.get $3
  i32.store offset=4
  local.get $1
  i32.load
  local.get $1
  i32.load offset=4
  call $~lib/metashrew-as/assembly/utils/box/Box#constructor
  local.set $3
  local.get $1
  i32.load
  i32.load8_u
  local.set $5
  local.get $1
  local.get $1
  i32.load
  i32.const 1
  i32.add
  i32.store
  local.get $1
  local.get $1
  i32.load offset=4
  i32.const 1
  i32.sub
  i32.store offset=4
  local.get $1
  i32.load
  i32.load8_u
  local.set $6
  local.get $1
  local.get $1
  i32.load
  i32.const 1
  i32.add
  i32.store
  local.get $1
  local.get $1
  i32.load offset=4
  i32.const 1
  i32.sub
  i32.store offset=4
  local.get $5
  i32.eqz
  local.get $6
  i32.const 1
  i32.eq
  i32.and
  if
   local.get $0
   i32.const 1
   i32.store8 offset=8
  else
   local.get $1
   local.get $3
   i32.load
   i32.store
   local.get $1
   local.get $3
   i32.load offset=4
   i32.store offset=4
  end
  local.get $1
  i32.load
  local.set $3
  local.get $1
  call $~lib/metashrew-as/assembly/utils/utils/parseVarInt
  i32.wrap_i64
  local.set $8
  loop $for-loop|0
   local.get $2
   local.get $8
   i32.lt_s
   if
    local.get $0
    i32.load offset=12
    local.get $2
    i32.const 24
    i32.const 29
    call $~lib/rt/stub/__new
    local.tee $5
    i32.const 0
    i32.store
    local.get $5
    i32.const 0
    i32.store offset=4
    local.get $5
    i32.const 0
    i32.store offset=8
    local.get $5
    i32.const 0
    i32.store offset=12
    local.get $5
    i32.const 0
    i32.store offset=16
    local.get $5
    i32.const 0
    i32.store offset=20
    local.get $1
    i32.load
    local.set $6
    local.get $5
    local.get $1
    i32.const 32
    call $~lib/metashrew-as/assembly/utils/utils/parseBytes
    i32.store offset=4
    local.get $1
    i32.load
    i32.load
    local.set $7
    local.get $1
    local.get $1
    i32.load
    i32.const 4
    i32.add
    i32.store
    local.get $1
    local.get $1
    i32.load offset=4
    i32.const 4
    i32.sub
    i32.store offset=4
    local.get $5
    local.get $7
    i32.store offset=8
    local.get $5
    local.get $1
    local.get $1
    call $~lib/metashrew-as/assembly/utils/utils/parseVarInt
    i32.wrap_i64
    call $~lib/metashrew-as/assembly/utils/utils/parseBytes
    i32.store offset=12
    local.get $1
    i32.load
    i32.load
    local.set $7
    local.get $1
    local.get $1
    i32.load
    i32.const 4
    i32.add
    i32.store
    local.get $1
    local.get $1
    i32.load offset=4
    i32.const 4
    i32.sub
    i32.store offset=4
    local.get $5
    local.get $7
    i32.store offset=16
    local.get $5
    i32.const 0
    i32.store offset=20
    local.get $5
    local.get $6
    local.get $1
    i32.load
    local.get $6
    i32.sub
    call $~lib/metashrew-as/assembly/utils/box/Box#constructor
    i32.store
    local.get $5
    call $~lib/array/Array<~lib/string/String>#__set
    local.get $2
    i32.const 1
    i32.add
    local.set $2
    br $for-loop|0
   end
  end
  local.get $1
  call $~lib/metashrew-as/assembly/utils/utils/parseVarInt
  i32.wrap_i64
  local.set $5
  i32.const 0
  local.set $2
  loop $for-loop|1
   local.get $2
   local.get $5
   i32.lt_s
   if
    local.get $0
    i32.load8_u offset=8
    if (result i32)
     local.get $0
     i32.load offset=16
     local.get $1
     i32.const 1
     call $~lib/metashrew-as/assembly/blockdata/transaction/Output#constructor
     call $~lib/array/Array<~lib/array/Array<u8>>#push
    else
     local.get $0
     i32.load offset=16
     local.get $1
     i32.const 0
     call $~lib/metashrew-as/assembly/blockdata/transaction/Output#constructor
     call $~lib/array/Array<~lib/array/Array<u8>>#push
    end
    drop
    local.get $2
    i32.const 1
    i32.add
    local.set $2
    br $for-loop|1
   end
  end
  local.get $0
  local.get $3
  local.get $1
  i32.load
  local.get $3
  i32.sub
  call $~lib/metashrew-as/assembly/utils/box/Box#constructor
  i32.store offset=28
  local.get $0
  i32.load8_u offset=8
  if
   local.get $1
   i32.load
   local.set $9
   i32.const 0
   local.set $2
   loop $for-loop|2
    local.get $2
    local.get $8
    i32.lt_s
    if
     local.get $0
     i32.load offset=12
     local.get $2
     call $~lib/array/Array<~lib/array/Array<u8>>#__get
     i32.const 8
     i32.const 30
     call $~lib/rt/stub/__new
     local.tee $5
     i32.const 0
     i32.store
     local.get $5
     i32.const 0
     i32.store offset=4
     local.get $5
     i32.const 0
     i32.store
     local.get $1
     i32.load
     local.set $10
     local.get $1
     call $~lib/metashrew-as/assembly/utils/utils/parseVarInt
     i32.wrap_i64
     local.set $11
     i32.const 16
     i32.const 32
     call $~lib/rt/stub/__new
     local.tee $3
     i32.const 0
     i32.store
     local.get $3
     i32.const 0
     i32.store offset=4
     local.get $3
     i32.const 0
     i32.store offset=8
     local.get $3
     i32.const 0
     i32.store offset=12
     local.get $11
     i32.const 268435455
     i32.gt_u
     if
      i32.const 2608
      i32.const 5344
      i32.const 70
      i32.const 60
      call $~lib/builtins/abort
      unreachable
     end
     i32.const 8
     local.get $11
     local.get $11
     i32.const 8
     i32.le_u
     select
     i32.const 2
     i32.shl
     local.tee $6
     i32.const 1
     call $~lib/rt/stub/__new
     local.tee $7
     i32.const 0
     local.get $6
     memory.fill
     local.get $3
     local.get $7
     i32.store
     local.get $3
     local.get $7
     i32.store offset=4
     local.get $3
     local.get $6
     i32.store offset=8
     local.get $3
     local.get $11
     i32.store offset=12
     local.get $5
     local.get $3
     i32.store offset=4
     i32.const 0
     local.set $3
     loop $for-loop|00
      local.get $3
      local.get $11
      i32.lt_s
      if
       local.get $5
       i32.load offset=4
       local.get $3
       i32.const 7
       i32.const 31
       call $~lib/rt/stub/__new
       local.tee $6
       i32.const 0
       i32.store
       local.get $6
       i32.const 0
       i32.store8 offset=4
       local.get $6
       i32.const 0
       i32.store8 offset=5
       local.get $6
       i32.const 0
       i32.store8 offset=6
       local.get $6
       local.get $1
       local.get $1
       call $~lib/metashrew-as/assembly/utils/utils/parseVarInt
       i32.wrap_i64
       call $~lib/metashrew-as/assembly/utils/utils/parseBytes
       i32.store
       local.get $6
       i32.load
       local.tee $7
       i32.load
       local.get $7
       i32.load offset=4
       call $~lib/metashrew-as/assembly/utils/box/Box#constructor
       local.tee $7
       i32.load
       local.tee $12
       i32.load8_u
       local.set $13
       local.get $7
       local.get $12
       i32.const 1
       i32.add
       i32.store
       local.get $7
       local.get $7
       i32.load offset=4
       i32.const 1
       i32.sub
       i32.store offset=4
       local.get $6
       local.get $13
       i32.store8 offset=4
       block $break|0
        block $case2|0
         block $case1|0
          local.get $6
          i32.load8_u offset=4
          local.tee $7
          i32.const 80
          i32.ne
          if
           local.get $7
           i32.const 48
           i32.eq
           br_if $case1|0
           br $case2|0
          end
          local.get $6
          i32.const 1
          i32.store8 offset=6
          local.get $6
          i32.const 0
          i32.store8 offset=5
          br $break|0
         end
         local.get $6
         i32.const 0
         i32.store8 offset=5
         local.get $6
         i32.const 0
         i32.store8 offset=6
         br $break|0
        end
        local.get $6
        i32.const 0
        i32.store8 offset=6
        local.get $6
        i32.const 1
        i32.store8 offset=5
       end
       local.get $6
       i32.load
       i32.load offset=4
       i32.const 1
       i32.le_u
       if
        local.get $6
        i32.const 0
        i32.store8 offset=5
       end
       local.get $6
       call $~lib/array/Array<~lib/string/String>#__set
       local.get $3
       i32.const 1
       i32.add
       local.set $3
       br $for-loop|00
      end
     end
     local.get $5
     local.get $10
     local.get $1
     i32.load
     local.get $10
     i32.sub
     call $~lib/metashrew-as/assembly/utils/box/Box#constructor
     i32.store
     local.get $5
     i32.store offset=20
     local.get $2
     i32.const 1
     i32.add
     local.set $2
     br $for-loop|2
    end
   end
   local.get $0
   local.get $9
   local.get $1
   i32.load
   local.get $9
   i32.sub
   call $~lib/metashrew-as/assembly/utils/box/Box#constructor
   i32.store offset=24
  end
  local.get $1
  i32.load
  local.tee $2
  i32.load
  local.set $3
  local.get $1
  local.get $2
  i32.const 4
  i32.add
  i32.store
  local.get $1
  local.get $1
  i32.load offset=4
  i32.const 4
  i32.sub
  i32.store offset=4
  local.get $0
  local.get $3
  i32.store offset=20
  local.get $0
  local.get $4
  local.get $1
  i32.load
  local.get $4
  i32.sub
  call $~lib/metashrew-as/assembly/utils/box/Box#constructor
  i32.store
  local.get $0
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/utils/box/Box>#constructor (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  i32.const 16
  i32.const 36
  call $~lib/rt/stub/__new
  local.tee $1
  i32.const 0
  i32.store
  local.get $1
  i32.const 0
  i32.store offset=4
  local.get $1
  i32.const 0
  i32.store offset=8
  local.get $1
  i32.const 0
  i32.store offset=12
  local.get $0
  i32.const 268435455
  i32.gt_u
  if
   i32.const 2608
   i32.const 5344
   i32.const 70
   i32.const 60
   call $~lib/builtins/abort
   unreachable
  end
  i32.const 8
  local.get $0
  local.get $0
  i32.const 8
  i32.le_u
  select
  i32.const 2
  i32.shl
  local.tee $2
  i32.const 1
  call $~lib/rt/stub/__new
  local.tee $3
  i32.const 0
  local.get $2
  memory.fill
  local.get $1
  local.get $3
  i32.store
  local.get $1
  local.get $3
  i32.store offset=4
  local.get $1
  local.get $2
  i32.store offset=8
  local.get $1
  local.get $0
  i32.store offset=12
  local.get $1
 )
 (func $~lib/metashrew-as/assembly/blockdata/block/Header#constructor (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  i32.const 32
  i32.const 24
  call $~lib/rt/stub/__new
  local.tee $2
  i32.const 0
  i32.store
  local.get $2
  i32.const 0
  i32.store offset=4
  local.get $2
  i32.const 0
  i32.store offset=8
  local.get $2
  i32.const 0
  i32.store offset=12
  local.get $2
  i32.const 0
  i32.store offset=16
  local.get $2
  i32.const 0
  i32.store offset=20
  local.get $2
  i32.const 0
  i32.store offset=24
  local.get $2
  i32.const 0
  i32.store offset=28
  local.get $0
  i32.load
  local.set $1
  local.get $2
  i32.const 0
  i32.store offset=28
  local.get $0
  i32.load
  i32.load
  local.set $5
  local.get $0
  local.get $0
  i32.load
  i32.const 4
  i32.add
  i32.store
  local.get $0
  local.get $0
  i32.load offset=4
  i32.const 4
  i32.sub
  i32.store offset=4
  i32.const 4
  i32.const 25
  call $~lib/rt/stub/__new
  local.tee $6
  i32.const 0
  i32.store
  local.get $6
  local.get $5
  i32.store
  local.get $2
  local.get $6
  i32.store
  local.get $2
  local.get $0
  i32.const 32
  call $~lib/metashrew-as/assembly/utils/utils/parseBytes
  i32.store offset=4
  local.get $2
  local.get $0
  i32.const 32
  call $~lib/metashrew-as/assembly/utils/utils/parseBytes
  i32.store offset=8
  local.get $0
  i32.load
  local.tee $5
  i32.load
  local.set $6
  local.get $0
  local.get $5
  i32.const 4
  i32.add
  i32.store
  local.get $0
  local.get $0
  i32.load offset=4
  i32.const 4
  i32.sub
  i32.store offset=4
  local.get $2
  local.get $6
  i32.store offset=12
  local.get $0
  i32.load
  i32.load
  local.set $5
  local.get $0
  local.get $0
  i32.load
  i32.const 4
  i32.add
  i32.store
  local.get $0
  local.get $0
  i32.load offset=4
  i32.const 4
  i32.sub
  i32.store offset=4
  local.get $2
  local.get $5
  i32.store offset=16
  local.get $0
  i32.load
  i32.load
  local.set $5
  local.get $0
  local.get $0
  i32.load
  i32.const 4
  i32.add
  i32.store
  local.get $0
  local.get $0
  i32.load offset=4
  i32.const 4
  i32.sub
  i32.store offset=4
  local.get $2
  local.get $5
  i32.store offset=20
  local.get $2
  local.get $1
  local.get $0
  i32.load
  local.get $1
  i32.sub
  call $~lib/metashrew-as/assembly/utils/box/Box#constructor
  i32.store offset=24
  local.get $2
  i32.load
  i32.load
  i32.const 256
  i32.and
  if (result i32)
   local.get $0
   i32.load offset=4
  else
   i32.const 0
  end
  if
   i32.const 60
   i32.const 26
   call $~lib/rt/stub/__new
   local.tee $1
   i32.const 0
   i32.store offset=48
   local.get $1
   i32.const 0
   i32.store offset=52
   local.get $1
   i32.const 0
   i32.store offset=56
   local.get $1
   i32.eqz
   if
    i32.const 48
    i32.const 27
    call $~lib/rt/stub/__new
    local.set $1
   end
   local.get $1
   i32.const 0
   i32.store offset=36
   local.get $1
   i32.const 0
   i32.store offset=40
   local.get $1
   i32.const 0
   i32.store offset=44
   local.get $1
   local.get $0
   call $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#constructor
   local.tee $1
   local.get $0
   i32.const 32
   call $~lib/metashrew-as/assembly/utils/utils/parseBytes
   i32.store offset=36
   local.get $1
   local.get $0
   call $~lib/metashrew-as/assembly/utils/utils/parseVarInt
   i32.wrap_i64
   call $~lib/array/Array<~lib/metashrew-as/assembly/utils/box/Box>#constructor
   i32.store offset=40
   loop $for-loop|0
    local.get $3
    local.get $1
    i32.load offset=40
    local.tee $5
    i32.load offset=12
    i32.lt_s
    if
     local.get $5
     local.get $3
     local.get $0
     i32.const 32
     call $~lib/metashrew-as/assembly/utils/utils/parseBytes
     call $~lib/array/Array<~lib/string/String>#__set
     local.get $3
     i32.const 1
     i32.add
     local.set $3
     br $for-loop|0
    end
   end
   local.get $0
   i32.load
   local.tee $3
   i32.load
   local.set $5
   local.get $0
   local.get $3
   i32.const 4
   i32.add
   i32.store
   local.get $0
   local.get $0
   i32.load offset=4
   i32.const 4
   i32.sub
   i32.store offset=4
   local.get $1
   local.get $5
   i32.store offset=44
   local.get $1
   i32.const 0
   i32.store offset=56
   local.get $1
   local.get $0
   call $~lib/metashrew-as/assembly/utils/utils/parseVarInt
   i32.wrap_i64
   call $~lib/array/Array<~lib/metashrew-as/assembly/utils/box/Box>#constructor
   i32.store offset=48
   loop $for-loop|00
    local.get $4
    local.get $1
    i32.load offset=48
    local.tee $3
    i32.load offset=12
    i32.lt_s
    if
     local.get $3
     local.get $4
     local.get $0
     i32.const 32
     call $~lib/metashrew-as/assembly/utils/utils/parseBytes
     call $~lib/array/Array<~lib/string/String>#__set
     local.get $4
     i32.const 1
     i32.add
     local.set $4
     br $for-loop|00
    end
   end
   local.get $0
   i32.load
   local.tee $3
   i32.load
   local.set $4
   local.get $0
   local.get $3
   i32.const 4
   i32.add
   i32.store
   local.get $0
   local.get $0
   i32.load offset=4
   i32.const 4
   i32.sub
   i32.store offset=4
   local.get $1
   local.get $4
   i32.store offset=52
   local.get $0
   i32.load
   local.get $0
   i32.load offset=4
   call $~lib/metashrew-as/assembly/utils/box/Box#constructor
   local.tee $3
   i32.const 80
   i32.store offset=4
   local.get $1
   local.get $3
   call $~lib/metashrew-as/assembly/blockdata/block/Header#constructor
   i32.store offset=56
   local.get $0
   local.get $0
   i32.load
   i32.const 80
   i32.add
   i32.store
   local.get $0
   local.get $0
   i32.load offset=4
   i32.const 80
   i32.sub
   i32.store offset=4
   local.get $2
   local.get $1
   i32.store offset=28
  end
  local.get $2
 )
 (func $~lib/metashrew-as/assembly/blockdata/block/Block#constructor (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i64)
  (local $8 i32)
  i32.const 20
  i32.const 23
  call $~lib/rt/stub/__new
  local.tee $1
  i32.const 0
  i32.store
  local.get $1
  i32.const 0
  i32.store offset=4
  local.get $1
  i32.const 0
  i32.store offset=8
  local.get $1
  i32.const 0
  i32.store offset=12
  local.get $1
  i32.const 0
  i32.store offset=16
  local.get $1
  i32.const 0
  i32.store offset=8
  local.get $1
  i32.const 0
  i32.store offset=12
  local.get $1
  i32.const 0
  i32.store offset=16
  local.get $0
  i32.load
  local.set $4
  local.get $1
  local.get $0
  call $~lib/metashrew-as/assembly/blockdata/block/Header#constructor
  i32.store offset=4
  local.get $0
  call $~lib/metashrew-as/assembly/utils/utils/parseVarInt
  local.tee $7
  i32.wrap_i64
  local.set $8
  i32.const 16
  i32.const 37
  call $~lib/rt/stub/__new
  local.tee $3
  i32.const 0
  i32.store
  local.get $3
  i32.const 0
  i32.store offset=4
  local.get $3
  i32.const 0
  i32.store offset=8
  local.get $3
  i32.const 0
  i32.store offset=12
  local.get $8
  i32.const 268435455
  i32.gt_u
  if
   i32.const 2608
   i32.const 5344
   i32.const 70
   i32.const 60
   call $~lib/builtins/abort
   unreachable
  end
  i32.const 8
  local.get $8
  local.get $8
  i32.const 8
  i32.le_u
  select
  i32.const 2
  i32.shl
  local.tee $5
  i32.const 1
  call $~lib/rt/stub/__new
  local.tee $6
  i32.const 0
  local.get $5
  memory.fill
  local.get $3
  local.get $6
  i32.store
  local.get $3
  local.get $6
  i32.store offset=4
  local.get $3
  local.get $5
  i32.store offset=8
  local.get $3
  local.get $8
  i32.store offset=12
  loop $for-loop|0
   local.get $2
   local.get $7
   i32.wrap_i64
   i32.lt_s
   if
    local.get $3
    local.get $2
    i32.const 0
    local.get $0
    call $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#constructor
    call $~lib/array/Array<~lib/string/String>#__set
    local.get $2
    i32.const 1
    i32.add
    local.set $2
    br $for-loop|0
   end
  end
  local.get $1
  local.get $3
  i32.store offset=8
  local.get $1
  local.get $4
  local.get $0
  i32.load
  local.get $4
  i32.sub
  call $~lib/metashrew-as/assembly/utils/box/Box#constructor
  i32.store
  local.get $1
 )
 (func $~lib/metashrew-as/assembly/utils/utils/reverse (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  local.get $0
  i32.const 20
  i32.sub
  i32.load offset=16
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.set $2
  loop $for-loop|0
   local.get $1
   local.get $2
   i32.const 20
   i32.sub
   i32.load offset=16
   local.tee $3
   i32.lt_s
   if
    local.get $1
    local.get $2
    i32.add
    local.get $0
    local.get $3
    i32.add
    local.get $1
    i32.sub
    i32.const 1
    i32.sub
    i32.load8_u
    i32.store8
    local.get $1
    i32.const 1
    i32.add
    local.set $1
    br $for-loop|0
   end
  end
  local.get $2
 )
 (func $~lib/rt/__newArray (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (result i32)
  (local $4 i32)
  local.get $0
  local.get $1
  i32.shl
  local.tee $4
  i32.const 1
  call $~lib/rt/stub/__new
  local.set $1
  local.get $3
  if
   local.get $1
   local.get $3
   local.get $4
   memory.copy
  end
  i32.const 16
  local.get $2
  call $~lib/rt/stub/__new
  local.tee $2
  local.get $1
  i32.store
  local.get $2
  local.get $1
  i32.store offset=4
  local.get $2
  local.get $4
  i32.store offset=8
  local.get $2
  local.get $0
  i32.store offset=12
  local.get $2
 )
 (func $~lib/metashrew-as/assembly/utils/utils/concat~anonymous|0 (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  local.get $0
  local.get $0
  i32.const 20
  i32.sub
  i32.load offset=16
  call $~lib/metashrew-as/assembly/utils/box/Box#constructor
 )
 (func $~lib/array/Array<~lib/arraybuffer/ArrayBuffer>#map<~lib/metashrew-as/assembly/utils/box/Box> (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  local.get $0
  i32.load offset=12
  local.tee $3
  i32.const 2
  i32.const 36
  i32.const 0
  call $~lib/rt/__newArray
  local.tee $4
  i32.load offset=4
  local.set $5
  loop $for-loop|0
   local.get $2
   local.get $3
   local.get $0
   i32.load offset=12
   local.tee $6
   local.get $3
   local.get $6
   i32.lt_s
   select
   i32.lt_s
   if
    local.get $2
    i32.const 2
    i32.shl
    local.tee $6
    local.get $0
    i32.load offset=4
    i32.add
    i32.load
    local.set $7
    i32.const 3
    global.set $~argumentsLength
    local.get $5
    local.get $6
    i32.add
    local.get $7
    local.get $2
    local.get $0
    local.get $1
    i32.load
    call_indirect (type $2)
    i32.store
    local.get $2
    i32.const 1
    i32.add
    local.set $2
    br $for-loop|0
   end
  end
  local.get $4
 )
 (func $~lib/metashrew-as/assembly/utils/box/Box.concat~anonymous|0 (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (result i32)
  local.get $0
  local.get $1
  i32.load offset=4
  i32.add
 )
 (func $~lib/metashrew-as/assembly/utils/box/Box.concat~anonymous|1 (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (result i32)
  local.get $0
  local.get $1
  i32.load
  local.get $1
  i32.load offset=4
  memory.copy
  local.get $0
  local.get $1
  i32.load offset=4
  i32.add
 )
 (func $~lib/metashrew-as/assembly/utils/box/Box.concat (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  local.get $0
  i32.load offset=12
  local.set $4
  loop $for-loop|0
   local.get $1
   local.get $4
   local.get $0
   i32.load offset=12
   local.tee $5
   local.get $4
   local.get $5
   i32.lt_s
   select
   i32.lt_s
   if
    local.get $0
    i32.load offset=4
    local.get $1
    i32.const 2
    i32.shl
    i32.add
    i32.load
    local.set $5
    i32.const 4
    global.set $~argumentsLength
    local.get $2
    local.get $5
    local.get $1
    local.get $0
    i32.const 5696
    i32.load
    call_indirect (type $3)
    local.set $2
    local.get $1
    i32.const 1
    i32.add
    local.set $1
    br $for-loop|0
   end
  end
  local.get $2
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.tee $2
  local.set $1
  local.get $0
  i32.load offset=12
  local.set $4
  loop $for-loop|01
   local.get $3
   local.get $4
   local.get $0
   i32.load offset=12
   local.tee $5
   local.get $4
   local.get $5
   i32.lt_s
   select
   i32.lt_s
   if
    local.get $0
    i32.load offset=4
    local.get $3
    i32.const 2
    i32.shl
    i32.add
    i32.load
    local.set $5
    i32.const 4
    global.set $~argumentsLength
    local.get $1
    local.get $5
    local.get $3
    local.get $0
    i32.const 5728
    i32.load
    call_indirect (type $3)
    local.set $1
    local.get $3
    i32.const 1
    i32.add
    local.set $3
    br $for-loop|01
   end
  end
  local.get $2
 )
 (func $~lib/metashrew-as/assembly/blockdata/transaction/OutPoint.from (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  i32.const 4
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.tee $2
  local.get $1
  i32.store
  i32.const 2
  i32.const 2
  i32.const 41
  i32.const 0
  call $~lib/rt/__newArray
  local.tee $1
  i32.load offset=4
  drop
  local.get $1
  i32.const 0
  local.get $0
  call $~lib/array/Array<~lib/string/String>#__set
  local.get $1
  i32.const 1
  local.get $2
  call $~lib/array/Array<~lib/string/String>#__set
  local.get $1
  i32.const 5664
  call $~lib/array/Array<~lib/arraybuffer/ArrayBuffer>#map<~lib/metashrew-as/assembly/utils/box/Box>
  call $~lib/metashrew-as/assembly/utils/box/Box.concat
  local.tee $0
  local.get $0
  i32.const 20
  i32.sub
  i32.load offset=16
  call $~lib/metashrew-as/assembly/utils/box/Box#constructor
  local.set $0
  i32.const 12
  i32.const 40
  call $~lib/rt/stub/__new
  local.tee $1
  i32.const 0
  i32.store
  local.get $1
  i32.const 0
  i32.store offset=4
  local.get $1
  i32.const 0
  i32.store offset=8
  local.get $1
  i32.const 0
  i32.store
  local.get $1
  i32.const 0
  i32.store offset=4
  local.get $1
  i32.const 0
  i32.store offset=8
  local.get $0
  i32.load offset=4
  i32.const 36
  i32.eq
  if
   local.get $1
   local.get $0
   i32.store
   local.get $0
   i32.load
   local.get $0
   i32.load offset=4
   call $~lib/metashrew-as/assembly/utils/box/Box#constructor
   local.tee $2
   local.get $2
   i32.load offset=4
   i32.const 4
   i32.sub
   i32.store offset=4
   local.get $1
   local.get $2
   i32.store offset=4
   local.get $0
   i32.load
   i32.const 32
   i32.add
   local.get $0
   i32.load offset=4
   i32.const 32
   i32.sub
   call $~lib/metashrew-as/assembly/utils/box/Box#constructor
   local.tee $0
   i32.load
   i32.load
   local.set $2
   local.get $0
   local.get $0
   i32.load
   i32.const 4
   i32.add
   i32.store
   local.get $0
   local.get $0
   i32.load offset=4
   i32.const 4
   i32.sub
   i32.store offset=4
   local.get $1
   local.get $2
   i32.store offset=8
  end
  local.get $1
 )
 (func $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  i32.const 2
  i32.const 2
  i32.const 36
  i32.const 0
  call $~lib/rt/__newArray
  local.tee $2
  i32.load offset=4
  drop
  local.get $2
  i32.const 0
  local.get $0
  local.get $0
  i32.const 20
  i32.sub
  i32.load offset=16
  call $~lib/metashrew-as/assembly/utils/box/Box#constructor
  call $~lib/array/Array<~lib/string/String>#__set
  local.get $2
  i32.const 1
  local.get $1
  local.get $1
  i32.const 20
  i32.sub
  i32.load offset=16
  call $~lib/metashrew-as/assembly/utils/box/Box#constructor
  call $~lib/array/Array<~lib/string/String>#__set
  local.get $2
  call $~lib/metashrew-as/assembly/utils/box/Box.concat
 )
 (func $~lib/metashrew-as/assembly/indexer/index/hash (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  local.get $0
  local.get $0
  i32.const 20
  i32.sub
  i32.load offset=16
  call $~lib/metashrew-as/assembly/utils/box/Box#constructor
  local.tee $0
  i32.load
  local.set $2
  local.get $0
  i32.load offset=4
  local.tee $3
  i32.const 1
  i32.shl
  i32.const 2
  i32.add
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.tee $1
  i32.const 30768
  i32.store16
  i32.const 0
  local.set $0
  loop $for-loop|0
   local.get $0
   local.get $3
   i32.lt_u
   if
    local.get $1
    i32.const 2
    i32.add
    local.get $0
    i32.const 1
    i32.shl
    i32.add
    local.get $0
    local.get $2
    i32.add
    i32.load8_u
    i32.const 1
    i32.shl
    i32.const 1056
    i32.add
    i32.load16_u
    i32.store16
    local.get $0
    i32.const 1
    i32.add
    local.set $0
    br $for-loop|0
   end
  end
  local.get $1
  local.get $1
  i32.const 20
  i32.sub
  i32.load offset=16
  local.tee $0
  i32.add
  local.tee $2
  local.get $1
  i32.lt_u
  if
   i32.const 0
   i32.const 2864
   i32.const 770
   i32.const 7
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  i32.const 1
  i32.shl
  i32.const 2
  call $~lib/rt/stub/__new
  local.tee $4
  local.set $3
  loop $while-continue|0
   local.get $1
   local.get $2
   i32.lt_u
   if
    block $while-break|0
     local.get $1
     i32.load8_u
     local.set $5
     local.get $1
     i32.const 1
     i32.add
     local.set $1
     local.get $5
     i32.const 128
     i32.and
     if
      local.get $1
      local.get $2
      i32.eq
      br_if $while-break|0
      local.get $1
      i32.load8_u
      i32.const 63
      i32.and
      local.set $0
      local.get $1
      i32.const 1
      i32.add
      local.set $1
      local.get $5
      i32.const 224
      i32.and
      i32.const 192
      i32.eq
      if
       local.get $3
       local.get $5
       i32.const 31
       i32.and
       i32.const 6
       i32.shl
       local.get $0
       i32.or
       i32.store16
      else
       local.get $1
       local.get $2
       i32.eq
       br_if $while-break|0
       local.get $1
       i32.load8_u
       i32.const 63
       i32.and
       local.set $6
       local.get $1
       i32.const 1
       i32.add
       local.set $1
       local.get $5
       i32.const 240
       i32.and
       i32.const 224
       i32.eq
       if
        local.get $5
        i32.const 15
        i32.and
        i32.const 12
        i32.shl
        local.get $0
        i32.const 6
        i32.shl
        i32.or
        local.get $6
        i32.or
        local.set $0
       else
        local.get $1
        local.get $2
        i32.eq
        br_if $while-break|0
        local.get $1
        i32.load8_u
        i32.const 63
        i32.and
        local.get $5
        i32.const 7
        i32.and
        i32.const 18
        i32.shl
        local.get $0
        i32.const 12
        i32.shl
        i32.or
        local.get $6
        i32.const 6
        i32.shl
        i32.or
        i32.or
        local.set $0
        local.get $1
        i32.const 1
        i32.add
        local.set $1
       end
       local.get $0
       i32.const 65536
       i32.lt_u
       if
        local.get $3
        local.get $0
        i32.store16
       else
        local.get $3
        local.get $0
        i32.const 65536
        i32.sub
        local.tee $0
        i32.const 10
        i32.shr_u
        i32.const 55296
        i32.or
        local.get $0
        i32.const 1023
        i32.and
        i32.const 56320
        i32.or
        i32.const 16
        i32.shl
        i32.or
        i32.store
        local.get $3
        i32.const 2
        i32.add
        local.set $3
       end
      end
     else
      local.get $3
      local.get $5
      i32.store16
     end
     local.get $3
     i32.const 2
     i32.add
     local.set $3
     br $while-continue|0
    end
   end
  end
  local.get $4
  local.get $3
  local.get $4
  i32.sub
  call $~lib/rt/stub/__renew
 )
 (func $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set" (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  local.get $0
  local.get $1
  local.get $1
  call $~lib/util/hash/HASH<~lib/string/String>
  local.tee $7
  call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#find"
  local.tee $3
  if
   local.get $3
   local.get $2
   i32.store offset=4
  else
   local.get $0
   i32.load offset=12
   local.tee $3
   local.get $0
   i32.load offset=16
   i32.eq
   if
    local.get $0
    i32.load offset=20
    local.get $3
    i32.const 3
    i32.mul
    i32.const 4
    i32.div_s
    i32.lt_s
    if (result i32)
     local.get $0
     i32.load offset=4
    else
     local.get $0
     i32.load offset=4
     i32.const 1
     i32.shl
     i32.const 1
     i32.or
    end
    local.tee $9
    i32.const 1
    i32.add
    local.tee $3
    i32.const 2
    i32.shl
    call $~lib/arraybuffer/ArrayBuffer#constructor
    local.set $8
    local.get $3
    i32.const 3
    i32.shl
    i32.const 3
    i32.div_s
    local.tee $6
    i32.const 12
    i32.mul
    call $~lib/arraybuffer/ArrayBuffer#constructor
    local.set $4
    local.get $0
    i32.load offset=8
    local.tee $10
    local.get $0
    i32.load offset=16
    i32.const 12
    i32.mul
    i32.add
    local.set $5
    local.get $4
    local.set $3
    loop $while-continue|0
     local.get $5
     local.get $10
     i32.ne
     if
      local.get $10
      i32.load offset=8
      i32.const 1
      i32.and
      i32.eqz
      if
       local.get $3
       local.get $10
       i32.load
       local.tee $11
       i32.store
       local.get $3
       local.get $10
       i32.load offset=4
       i32.store offset=4
       local.get $3
       local.get $8
       local.get $11
       call $~lib/util/hash/HASH<~lib/string/String>
       local.get $9
       i32.and
       i32.const 2
       i32.shl
       i32.add
       local.tee $11
       i32.load
       i32.store offset=8
       local.get $11
       local.get $3
       i32.store
       local.get $3
       i32.const 12
       i32.add
       local.set $3
      end
      local.get $10
      i32.const 12
      i32.add
      local.set $10
      br $while-continue|0
     end
    end
    local.get $0
    local.get $8
    i32.store
    local.get $0
    local.get $9
    i32.store offset=4
    local.get $0
    local.get $4
    i32.store offset=8
    local.get $0
    local.get $6
    i32.store offset=12
    local.get $0
    local.get $0
    i32.load offset=20
    i32.store offset=16
   end
   local.get $0
   i32.load offset=8
   local.set $3
   local.get $0
   local.get $0
   i32.load offset=16
   local.tee $4
   i32.const 1
   i32.add
   i32.store offset=16
   local.get $3
   local.get $4
   i32.const 12
   i32.mul
   i32.add
   local.tee $3
   local.get $1
   i32.store
   local.get $3
   local.get $2
   i32.store offset=4
   local.get $0
   local.get $0
   i32.load offset=20
   i32.const 1
   i32.add
   i32.store offset=20
   local.get $3
   local.get $0
   i32.load
   local.get $7
   local.get $0
   i32.load offset=4
   i32.and
   i32.const 2
   i32.shl
   i32.add
   local.tee $0
   i32.load
   i32.store offset=8
   local.get $0
   local.get $3
   i32.store
  end
 )
 (func $~lib/arraybuffer/ArrayBufferView#constructor (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  local.get $0
  i32.eqz
  if
   i32.const 12
   i32.const 3
   call $~lib/rt/stub/__new
   local.set $0
  end
  local.get $0
  i32.const 0
  i32.store
  local.get $0
  i32.const 0
  i32.store offset=4
  local.get $0
  i32.const 0
  i32.store offset=8
  local.get $1
  i32.const 1073741820
  local.get $2
  i32.shr_u
  i32.gt_u
  if
   i32.const 2608
   i32.const 2656
   i32.const 19
   i32.const 57
   call $~lib/builtins/abort
   unreachable
  end
  local.get $1
  local.get $2
  i32.shl
  local.tee $1
  i32.const 1
  call $~lib/rt/stub/__new
  local.tee $2
  i32.const 0
  local.get $1
  memory.fill
  local.get $0
  local.get $2
  i32.store
  local.get $0
  local.get $2
  i32.store offset=4
  local.get $0
  local.get $1
  i32.store offset=8
  local.get $0
 )
 (func $~lib/typedarray/Int32Array#__set (param $0 i32) (param $1 i32) (param $2 i32)
  local.get $1
  local.get $0
  i32.load offset=8
  i32.const 2
  i32.shr_u
  i32.ge_u
  if
   i32.const 3344
   i32.const 5760
   i32.const 747
   i32.const 64
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  i32.load offset=4
  local.get $1
  i32.const 2
  i32.shl
  i32.add
  local.get $2
  i32.store
 )
 (func $~lib/fast-sha256-as/assembly/sha256/Hash#reset (param $0 i32)
  local.get $0
  i32.load offset=8
  i32.const 0
  i32.const 1779033703
  call $~lib/typedarray/Int32Array#__set
  local.get $0
  i32.load offset=8
  i32.const 1
  i32.const -1150833019
  call $~lib/typedarray/Int32Array#__set
  local.get $0
  i32.load offset=8
  i32.const 2
  i32.const 1013904242
  call $~lib/typedarray/Int32Array#__set
  local.get $0
  i32.load offset=8
  i32.const 3
  i32.const -1521486534
  call $~lib/typedarray/Int32Array#__set
  local.get $0
  i32.load offset=8
  i32.const 4
  i32.const 1359893119
  call $~lib/typedarray/Int32Array#__set
  local.get $0
  i32.load offset=8
  i32.const 5
  i32.const -1694144372
  call $~lib/typedarray/Int32Array#__set
  local.get $0
  i32.load offset=8
  i32.const 6
  i32.const 528734635
  call $~lib/typedarray/Int32Array#__set
  local.get $0
  i32.load offset=8
  i32.const 7
  i32.const 1541459225
  call $~lib/typedarray/Int32Array#__set
  local.get $0
  i32.const 0
  i32.store offset=20
  local.get $0
  i32.const 0
  i32.store offset=24
  local.get $0
  i32.const 0
  i32.store8 offset=28
 )
 (func $~lib/typedarray/Uint8Array.wrap@varargs (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  block $2of2
   block $1of2
    block $outOfRange
     global.get $~argumentsLength
     i32.const 1
     i32.sub
     br_table $1of2 $1of2 $2of2 $outOfRange
    end
    unreachable
   end
   i32.const -1
   local.set $1
  end
  local.get $0
  i32.const 20
  i32.sub
  i32.load offset=16
  local.set $2
  local.get $1
  i32.const 0
  i32.lt_s
  if
   local.get $1
   i32.const -1
   i32.eq
   if (result i32)
    local.get $2
   else
    i32.const 2608
    i32.const 5760
    i32.const 1869
    i32.const 7
    call $~lib/builtins/abort
    unreachable
   end
   local.set $1
  else
   local.get $1
   local.get $2
   i32.gt_s
   if
    i32.const 2608
    i32.const 5760
    i32.const 1874
    i32.const 7
    call $~lib/builtins/abort
    unreachable
   end
  end
  i32.const 12
  i32.const 14
  call $~lib/rt/stub/__new
  local.tee $2
  local.get $0
  i32.store
  local.get $2
  local.get $1
  i32.store offset=8
  local.get $2
  local.get $0
  i32.store offset=4
  local.get $2
 )
 (func $~lib/typedarray/Uint8Array#__get (param $0 i32) (param $1 i32) (result i32)
  local.get $1
  local.get $0
  i32.load offset=8
  i32.ge_u
  if
   i32.const 3344
   i32.const 5760
   i32.const 167
   i32.const 45
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  i32.load offset=4
  local.get $1
  i32.add
  i32.load8_u
 )
 (func $~lib/typedarray/Uint8Array#__set (param $0 i32) (param $1 i32) (param $2 i32)
  local.get $1
  local.get $0
  i32.load offset=8
  i32.ge_u
  if
   i32.const 3344
   i32.const 5760
   i32.const 178
   i32.const 45
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  i32.load offset=4
  local.get $1
  i32.add
  local.get $2
  i32.store8
 )
 (func $~lib/typedarray/Int32Array#__get (param $0 i32) (param $1 i32) (result i32)
  local.get $1
  local.get $0
  i32.load offset=8
  i32.const 2
  i32.shr_u
  i32.ge_u
  if
   i32.const 3344
   i32.const 5760
   i32.const 736
   i32.const 64
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  i32.load offset=4
  local.get $1
  i32.const 2
  i32.shl
  i32.add
  i32.load
 )
 (func $~lib/array/Array<u32>#__get (param $0 i32) (param $1 i32) (result i32)
  local.get $1
  local.get $0
  i32.load offset=12
  i32.ge_u
  if
   i32.const 3344
   i32.const 5344
   i32.const 114
   i32.const 42
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  i32.load offset=4
  local.get $1
  i32.const 2
  i32.shl
  i32.add
  i32.load
 )
 (func $~lib/fast-sha256-as/assembly/sha256/hashBlocks (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (param $4 i32) (result i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (local $12 i32)
  (local $13 i32)
  (local $14 i32)
  (local $15 i32)
  loop $while-continue|0
   local.get $4
   i32.const 64
   i32.ge_s
   if
    local.get $1
    i32.const 0
    call $~lib/typedarray/Int32Array#__get
    local.set $9
    local.get $1
    i32.const 1
    call $~lib/typedarray/Int32Array#__get
    local.set $5
    local.get $1
    i32.const 2
    call $~lib/typedarray/Int32Array#__get
    local.set $6
    local.get $1
    i32.const 3
    call $~lib/typedarray/Int32Array#__get
    local.set $11
    local.get $1
    i32.const 4
    call $~lib/typedarray/Int32Array#__get
    local.set $10
    local.get $1
    i32.const 5
    call $~lib/typedarray/Int32Array#__get
    local.set $7
    local.get $1
    i32.const 6
    call $~lib/typedarray/Int32Array#__get
    local.set $8
    local.get $1
    i32.const 7
    call $~lib/typedarray/Int32Array#__get
    local.set $12
    i32.const 0
    local.set $13
    loop $for-loop|1
     local.get $13
     i32.const 16
     i32.lt_s
     if
      local.get $0
      local.get $13
      local.get $2
      local.get $3
      local.get $13
      i32.const 2
      i32.shl
      i32.add
      local.tee $14
      call $~lib/typedarray/Uint8Array#__get
      i32.const 255
      i32.and
      i32.const 24
      i32.shl
      local.get $2
      local.get $14
      i32.const 1
      i32.add
      call $~lib/typedarray/Uint8Array#__get
      i32.const 255
      i32.and
      i32.const 16
      i32.shl
      i32.or
      local.get $2
      local.get $14
      i32.const 2
      i32.add
      call $~lib/typedarray/Uint8Array#__get
      i32.const 255
      i32.and
      i32.const 8
      i32.shl
      i32.or
      local.get $2
      local.get $14
      i32.const 3
      i32.add
      call $~lib/typedarray/Uint8Array#__get
      i32.const 255
      i32.and
      i32.or
      call $~lib/typedarray/Int32Array#__set
      local.get $13
      i32.const 1
      i32.add
      local.set $13
      br $for-loop|1
     end
    end
    i32.const 16
    local.set $13
    loop $for-loop|2
     local.get $13
     i32.const 64
     i32.lt_s
     if
      local.get $0
      local.get $13
      i32.const 2
      i32.sub
      call $~lib/typedarray/Int32Array#__get
      local.set $14
      local.get $0
      local.get $13
      i32.const 15
      i32.sub
      call $~lib/typedarray/Int32Array#__get
      local.set $15
      local.get $0
      local.get $13
      local.get $0
      local.get $13
      i32.const 7
      i32.sub
      call $~lib/typedarray/Int32Array#__get
      local.get $14
      i32.const 15
      i32.shl
      local.get $14
      i32.const 17
      i32.shr_u
      i32.or
      local.get $14
      i32.const 13
      i32.shl
      local.get $14
      i32.const 19
      i32.shr_u
      i32.or
      i32.xor
      local.get $14
      i32.const 10
      i32.shr_u
      i32.xor
      i32.add
      local.get $0
      local.get $13
      i32.const 16
      i32.sub
      call $~lib/typedarray/Int32Array#__get
      local.get $15
      i32.const 25
      i32.shl
      local.get $15
      i32.const 7
      i32.shr_u
      i32.or
      local.get $15
      i32.const 14
      i32.shl
      local.get $15
      i32.const 18
      i32.shr_u
      i32.or
      i32.xor
      local.get $15
      i32.const 3
      i32.shr_u
      i32.xor
      i32.add
      i32.add
      call $~lib/typedarray/Int32Array#__set
      local.get $13
      i32.const 1
      i32.add
      local.set $13
      br $for-loop|2
     end
    end
    i32.const 0
    local.set $13
    loop $for-loop|3
     local.get $13
     i32.const 64
     i32.lt_s
     if
      local.get $10
      i32.const 7
      i32.shl
      local.get $10
      i32.const 25
      i32.shr_u
      i32.or
      local.get $10
      i32.const 26
      i32.shl
      local.get $10
      i32.const 6
      i32.shr_u
      i32.or
      local.get $10
      i32.const 21
      i32.shl
      local.get $10
      i32.const 11
      i32.shr_u
      i32.or
      i32.xor
      i32.xor
      local.get $7
      local.get $10
      i32.and
      local.get $10
      i32.const -1
      i32.xor
      local.get $8
      i32.and
      i32.xor
      i32.add
      i32.const 2560
      local.get $13
      call $~lib/array/Array<u32>#__get
      local.get $0
      local.get $13
      call $~lib/typedarray/Int32Array#__get
      i32.add
      local.get $12
      i32.add
      i32.add
      local.set $14
      local.get $9
      i32.const 10
      i32.shl
      local.get $9
      i32.const 22
      i32.shr_u
      i32.or
      local.get $9
      i32.const 30
      i32.shl
      local.get $9
      i32.const 2
      i32.shr_u
      i32.or
      local.get $9
      i32.const 19
      i32.shl
      local.get $9
      i32.const 13
      i32.shr_u
      i32.or
      i32.xor
      i32.xor
      local.get $5
      local.get $6
      i32.and
      local.get $5
      local.get $9
      i32.and
      local.get $6
      local.get $9
      i32.and
      i32.xor
      i32.xor
      i32.add
      local.set $15
      local.get $8
      local.set $12
      local.get $7
      local.set $8
      local.get $10
      local.set $7
      local.get $11
      local.get $14
      i32.add
      local.set $10
      local.get $6
      local.set $11
      local.get $5
      local.set $6
      local.get $9
      local.set $5
      local.get $14
      local.get $15
      i32.add
      local.set $9
      local.get $13
      i32.const 1
      i32.add
      local.set $13
      br $for-loop|3
     end
    end
    local.get $1
    i32.const 0
    local.get $1
    i32.const 0
    call $~lib/typedarray/Int32Array#__get
    local.get $9
    i32.add
    call $~lib/typedarray/Int32Array#__set
    local.get $1
    i32.const 1
    local.get $1
    i32.const 1
    call $~lib/typedarray/Int32Array#__get
    local.get $5
    i32.add
    call $~lib/typedarray/Int32Array#__set
    local.get $1
    i32.const 2
    local.get $1
    i32.const 2
    call $~lib/typedarray/Int32Array#__get
    local.get $6
    i32.add
    call $~lib/typedarray/Int32Array#__set
    local.get $1
    i32.const 3
    local.get $1
    i32.const 3
    call $~lib/typedarray/Int32Array#__get
    local.get $11
    i32.add
    call $~lib/typedarray/Int32Array#__set
    local.get $1
    i32.const 4
    local.get $1
    i32.const 4
    call $~lib/typedarray/Int32Array#__get
    local.get $10
    i32.add
    call $~lib/typedarray/Int32Array#__set
    local.get $1
    i32.const 5
    local.get $1
    i32.const 5
    call $~lib/typedarray/Int32Array#__get
    local.get $7
    i32.add
    call $~lib/typedarray/Int32Array#__set
    local.get $1
    i32.const 6
    local.get $1
    i32.const 6
    call $~lib/typedarray/Int32Array#__get
    local.get $8
    i32.add
    call $~lib/typedarray/Int32Array#__set
    local.get $1
    i32.const 7
    local.get $1
    i32.const 7
    call $~lib/typedarray/Int32Array#__get
    local.get $12
    i32.add
    call $~lib/typedarray/Int32Array#__set
    local.get $3
    i32.const -64
    i32.sub
    local.set $3
    local.get $4
    i32.const -64
    i32.add
    local.set $4
    br $while-continue|0
   end
  end
  local.get $3
 )
 (func $~lib/fast-sha256-as/assembly/sha256/Hash#finish (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  local.get $0
  i32.load8_u offset=28
  i32.eqz
  if
   local.get $0
   i32.load offset=24
   local.tee $3
   i32.const 536870912
   i32.div_s
   local.set $4
   local.get $3
   i32.const 3
   i32.shl
   local.set $5
   i32.const 64
   i32.const 128
   local.get $3
   i32.const 64
   i32.rem_s
   i32.const 56
   i32.lt_s
   select
   local.set $6
   local.get $0
   i32.load offset=16
   local.get $0
   i32.load offset=20
   local.tee $3
   i32.const 128
   call $~lib/typedarray/Uint8Array#__set
   local.get $3
   i32.const 1
   i32.add
   local.set $3
   loop $for-loop|0
    local.get $3
    local.get $6
    i32.const 8
    i32.sub
    i32.lt_s
    if
     local.get $0
     i32.load offset=16
     local.get $3
     i32.const 0
     call $~lib/typedarray/Uint8Array#__set
     local.get $3
     i32.const 1
     i32.add
     local.set $3
     br $for-loop|0
    end
   end
   local.get $0
   i32.load offset=16
   local.get $6
   i32.const 8
   i32.sub
   local.get $4
   i32.const 24
   i32.shr_u
   call $~lib/typedarray/Uint8Array#__set
   local.get $0
   i32.load offset=16
   local.get $6
   i32.const 7
   i32.sub
   local.get $4
   i32.const 16
   i32.shr_u
   i32.const 255
   i32.and
   call $~lib/typedarray/Uint8Array#__set
   local.get $0
   i32.load offset=16
   local.get $6
   i32.const 6
   i32.sub
   local.get $4
   i32.const 8
   i32.shr_u
   i32.const 255
   i32.and
   call $~lib/typedarray/Uint8Array#__set
   local.get $0
   i32.load offset=16
   local.get $6
   i32.const 5
   i32.sub
   local.get $4
   i32.const 255
   i32.and
   call $~lib/typedarray/Uint8Array#__set
   local.get $0
   i32.load offset=16
   local.get $6
   i32.const 4
   i32.sub
   local.get $5
   i32.const 24
   i32.shr_u
   call $~lib/typedarray/Uint8Array#__set
   local.get $0
   i32.load offset=16
   local.get $6
   i32.const 3
   i32.sub
   local.get $5
   i32.const 16
   i32.shr_u
   i32.const 255
   i32.and
   call $~lib/typedarray/Uint8Array#__set
   local.get $0
   i32.load offset=16
   local.get $6
   i32.const 2
   i32.sub
   local.get $5
   i32.const 8
   i32.shr_u
   i32.const 255
   i32.and
   call $~lib/typedarray/Uint8Array#__set
   local.get $0
   i32.load offset=16
   local.get $6
   i32.const 1
   i32.sub
   local.get $5
   i32.const 255
   i32.and
   call $~lib/typedarray/Uint8Array#__set
   local.get $0
   i32.load offset=12
   local.get $0
   i32.load offset=8
   local.get $0
   i32.load offset=16
   i32.const 0
   local.get $6
   call $~lib/fast-sha256-as/assembly/sha256/hashBlocks
   drop
   local.get $0
   i32.const 1
   i32.store8 offset=28
  end
  loop $for-loop|1
   local.get $2
   i32.const 8
   i32.lt_s
   if
    local.get $1
    local.get $2
    i32.const 2
    i32.shl
    local.tee $3
    local.get $0
    i32.load offset=8
    local.get $2
    call $~lib/typedarray/Int32Array#__get
    i32.const 24
    i32.shr_u
    call $~lib/typedarray/Uint8Array#__set
    local.get $1
    local.get $3
    i32.const 1
    i32.add
    local.get $0
    i32.load offset=8
    local.get $2
    call $~lib/typedarray/Int32Array#__get
    i32.const 16
    i32.shr_u
    i32.const 255
    i32.and
    call $~lib/typedarray/Uint8Array#__set
    local.get $1
    local.get $3
    i32.const 2
    i32.add
    local.get $0
    i32.load offset=8
    local.get $2
    call $~lib/typedarray/Int32Array#__get
    i32.const 8
    i32.shr_u
    i32.const 255
    i32.and
    call $~lib/typedarray/Uint8Array#__set
    local.get $1
    local.get $3
    i32.const 3
    i32.add
    local.get $0
    i32.load offset=8
    local.get $2
    call $~lib/typedarray/Int32Array#__get
    i32.const 255
    i32.and
    call $~lib/typedarray/Uint8Array#__set
    local.get $2
    i32.const 1
    i32.add
    local.set $2
    br $for-loop|1
   end
  end
 )
 (func $~lib/fast-sha256-as/assembly/sha256/sha256 (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  i32.const 29
  i32.const 46
  call $~lib/rt/stub/__new
  local.tee $3
  i32.const 0
  i32.store
  local.get $3
  i32.const 0
  i32.store offset=4
  local.get $3
  i32.const 0
  i32.store offset=8
  local.get $3
  i32.const 0
  i32.store offset=12
  local.get $3
  i32.const 0
  i32.store offset=16
  local.get $3
  i32.const 0
  i32.store offset=20
  local.get $3
  i32.const 0
  i32.store offset=24
  local.get $3
  i32.const 0
  i32.store8 offset=28
  local.get $3
  i32.const 32
  i32.store
  local.get $3
  i32.const 64
  i32.store offset=4
  local.get $3
  i32.const 12
  i32.const 47
  call $~lib/rt/stub/__new
  i32.const 8
  i32.const 2
  call $~lib/arraybuffer/ArrayBufferView#constructor
  i32.store offset=8
  local.get $3
  i32.const 12
  i32.const 47
  call $~lib/rt/stub/__new
  i32.const 64
  i32.const 2
  call $~lib/arraybuffer/ArrayBufferView#constructor
  i32.store offset=12
  local.get $3
  i32.const 12
  i32.const 14
  call $~lib/rt/stub/__new
  i32.const 128
  i32.const 0
  call $~lib/arraybuffer/ArrayBufferView#constructor
  i32.store offset=16
  local.get $3
  i32.const 0
  i32.store offset=20
  local.get $3
  i32.const 0
  i32.store offset=24
  local.get $3
  call $~lib/fast-sha256-as/assembly/sha256/Hash#reset
  i32.const 1
  global.set $~argumentsLength
  local.get $0
  call $~lib/typedarray/Uint8Array.wrap@varargs
  local.set $5
  i32.const 1
  global.set $~argumentsLength
  local.get $5
  i32.load offset=8
  local.set $1
  i32.const 0
  local.set $0
  local.get $3
  i32.load8_u offset=28
  if
   i32.const 5824
   i32.const 5952
   i32.const 196
   i32.const 7
   call $~lib/builtins/abort
   unreachable
  end
  local.get $3
  local.get $3
  i32.load offset=24
  local.get $1
  i32.add
  i32.store offset=24
  local.get $3
  i32.load offset=20
  i32.const 0
  i32.gt_s
  if
   loop $while-continue|0
    local.get $3
    i32.load offset=20
    local.tee $6
    i32.const 64
    i32.lt_s
    local.get $1
    i32.const 0
    i32.gt_s
    i32.and
    if
     local.get $0
     local.tee $2
     i32.const 1
     i32.add
     local.set $0
     local.get $3
     i32.load offset=16
     local.set $7
     local.get $3
     local.get $6
     i32.const 1
     i32.add
     i32.store offset=20
     local.get $7
     local.get $6
     local.get $5
     local.get $2
     call $~lib/typedarray/Uint8Array#__get
     call $~lib/typedarray/Uint8Array#__set
     local.get $1
     i32.const 1
     i32.sub
     local.set $1
     br $while-continue|0
    end
   end
   local.get $3
   i32.load offset=20
   i32.const 64
   i32.eq
   if
    local.get $3
    i32.load offset=12
    local.get $3
    i32.load offset=8
    local.get $3
    i32.load offset=16
    i32.const 0
    i32.const 64
    call $~lib/fast-sha256-as/assembly/sha256/hashBlocks
    drop
    local.get $3
    i32.const 0
    i32.store offset=20
   end
  end
  local.get $1
  i32.const 64
  i32.ge_s
  if
   local.get $3
   i32.load offset=12
   local.get $3
   i32.load offset=8
   local.get $5
   local.get $0
   local.get $1
   call $~lib/fast-sha256-as/assembly/sha256/hashBlocks
   local.set $0
   local.get $1
   i32.const 64
   i32.rem_s
   local.set $1
  end
  loop $while-continue|1
   local.get $1
   i32.const 0
   i32.gt_s
   if
    local.get $0
    local.tee $2
    i32.const 1
    i32.add
    local.set $0
    local.get $3
    i32.load offset=16
    local.set $6
    local.get $3
    local.get $3
    i32.load offset=20
    local.tee $7
    i32.const 1
    i32.add
    i32.store offset=20
    local.get $6
    local.get $7
    local.get $5
    local.get $2
    call $~lib/typedarray/Uint8Array#__get
    call $~lib/typedarray/Uint8Array#__set
    local.get $1
    i32.const 1
    i32.sub
    local.set $1
    br $while-continue|1
   end
  end
  local.get $3
  i32.load
  local.set $0
  local.get $3
  i32.const 12
  i32.const 14
  call $~lib/rt/stub/__new
  local.get $0
  i32.const 0
  call $~lib/arraybuffer/ArrayBufferView#constructor
  local.tee $0
  call $~lib/fast-sha256-as/assembly/sha256/Hash#finish
  loop $for-loop|0
   local.get $4
   local.get $3
   i32.load offset=16
   local.tee $1
   i32.load offset=8
   i32.lt_s
   if
    local.get $1
    local.get $4
    i32.const 0
    call $~lib/typedarray/Uint8Array#__set
    local.get $4
    i32.const 1
    i32.add
    local.set $4
    br $for-loop|0
   end
  end
  i32.const 0
  local.set $4
  loop $for-loop|1
   local.get $4
   local.get $3
   i32.load offset=12
   local.tee $1
   i32.load offset=8
   i32.const 2
   i32.shr_u
   i32.lt_s
   if
    local.get $1
    local.get $4
    i32.const 0
    call $~lib/typedarray/Int32Array#__set
    local.get $4
    i32.const 1
    i32.add
    local.set $4
    br $for-loop|1
   end
  end
  local.get $3
  call $~lib/fast-sha256-as/assembly/sha256/Hash#reset
  local.get $0
  i32.load
 )
 (func $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#txid (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  local.get $0
  i32.load offset=32
  local.tee $1
  i32.const 20
  i32.sub
  i32.load offset=16
  i32.const 0
  i32.gt_s
  if
   local.get $1
   return
  end
  local.get $0
  local.tee $1
  i32.load8_u offset=8
  if
   local.get $1
   i32.load
   i32.load
   i32.const 4
   call $~lib/metashrew-as/assembly/utils/box/Box#constructor
   local.set $2
   local.get $1
   i32.load
   i32.load
   local.get $1
   i32.load
   i32.load offset=4
   i32.add
   i32.const 4
   i32.sub
   i32.const 4
   call $~lib/metashrew-as/assembly/utils/box/Box#constructor
   local.set $3
   i32.const 0
   call $~lib/array/Array<~lib/metashrew-as/assembly/utils/box/Box>#constructor
   local.tee $0
   local.get $2
   call $~lib/array/Array<~lib/array/Array<u8>>#push
   drop
   local.get $0
   local.get $1
   i32.load offset=28
   call $~lib/array/Array<~lib/array/Array<u8>>#push
   drop
   local.get $0
   local.get $3
   call $~lib/array/Array<~lib/array/Array<u8>>#push
   drop
  else
   i32.const 0
   call $~lib/array/Array<~lib/metashrew-as/assembly/utils/box/Box>#constructor
   local.tee $0
   local.get $1
   i32.load
   call $~lib/array/Array<~lib/array/Array<u8>>#push
   drop
  end
  local.get $1
  local.get $0
  call $~lib/metashrew-as/assembly/utils/box/Box.concat
  call $~lib/fast-sha256-as/assembly/sha256/sha256
  call $~lib/fast-sha256-as/assembly/sha256/sha256
  call $~lib/metashrew-as/assembly/utils/utils/reverse
  i32.store offset=32
  local.get $1
  i32.load offset=32
 )
 (func $~lib/arraybuffer/ArrayBuffer#slice (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i32)
  local.get $0
  i32.const 20
  i32.sub
  i32.load offset=16
  local.set $3
  local.get $1
  i32.const 0
  i32.lt_s
  if (result i32)
   local.get $1
   local.get $3
   i32.add
   local.tee $1
   i32.const 0
   local.get $1
   i32.const 0
   i32.gt_s
   select
  else
   local.get $1
   local.get $3
   local.get $1
   local.get $3
   i32.lt_s
   select
  end
  local.set $1
  local.get $2
  i32.const 0
  i32.lt_s
  if (result i32)
   local.get $2
   local.get $3
   i32.add
   local.tee $2
   i32.const 0
   local.get $2
   i32.const 0
   i32.gt_s
   select
  else
   local.get $2
   local.get $3
   local.get $2
   local.get $3
   i32.lt_s
   select
  end
  local.get $1
  i32.sub
  local.tee $2
  i32.const 0
  local.get $2
  i32.const 0
  i32.gt_s
  select
  local.tee $2
  i32.const 1
  call $~lib/rt/stub/__new
  local.tee $3
  local.get $0
  local.get $1
  i32.add
  local.get $2
  memory.copy
  local.get $3
 )
 (func $~lib/metashrew-as/assembly/blockdata/address/Address.toBase58Check (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  i32.const 2
  i32.const 2
  i32.const 41
  i32.const 0
  call $~lib/rt/__newArray
  local.tee $4
  i32.load offset=4
  drop
  local.get $4
  i32.const 0
  local.get $0
  call $~lib/array/Array<~lib/string/String>#__set
  local.get $4
  i32.const 1
  local.get $1
  call $~lib/array/Array<~lib/string/String>#__set
  local.get $4
  i32.const 5664
  call $~lib/array/Array<~lib/arraybuffer/ArrayBuffer>#map<~lib/metashrew-as/assembly/utils/box/Box>
  call $~lib/metashrew-as/assembly/utils/box/Box.concat
  call $~lib/fast-sha256-as/assembly/sha256/sha256
  call $~lib/fast-sha256-as/assembly/sha256/sha256
  i32.const 0
  i32.const 4
  call $~lib/arraybuffer/ArrayBuffer#slice
  local.set $4
  i32.const 3
  i32.const 2
  i32.const 41
  i32.const 0
  call $~lib/rt/__newArray
  local.tee $5
  i32.load offset=4
  drop
  local.get $5
  i32.const 0
  local.get $0
  call $~lib/array/Array<~lib/string/String>#__set
  local.get $5
  i32.const 1
  local.get $1
  call $~lib/array/Array<~lib/string/String>#__set
  local.get $5
  i32.const 2
  local.get $4
  call $~lib/array/Array<~lib/string/String>#__set
  local.get $5
  i32.const 5664
  call $~lib/array/Array<~lib/arraybuffer/ArrayBuffer>#map<~lib/metashrew-as/assembly/utils/box/Box>
  call $~lib/metashrew-as/assembly/utils/box/Box.concat
  local.set $0
  i32.const 1
  global.set $~argumentsLength
  local.get $0
  call $~lib/typedarray/Uint8Array.wrap@varargs
  local.tee $9
  i32.load offset=8
  local.set $8
  loop $while-continue|0
   local.get $3
   local.get $8
   i32.ne
   if (result i32)
    local.get $9
    local.get $3
    call $~lib/typedarray/Uint8Array#__get
   else
    i32.const 1
   end
   i32.eqz
   if
    local.get $3
    i32.const 1
    i32.add
    local.set $3
    br $while-continue|0
   end
  end
  i32.const 12
  i32.const 14
  call $~lib/rt/stub/__new
  local.get $8
  local.get $3
  local.tee $0
  i32.sub
  i32.const 554
  i32.mul
  i32.const 405
  i32.div_s
  i32.const 1
  i32.add
  local.tee $7
  i32.const 0
  call $~lib/arraybuffer/ArrayBufferView#constructor
  local.set $6
  loop $while-continue|1
   local.get $3
   local.get $8
   i32.ne
   if
    local.get $9
    local.get $3
    call $~lib/typedarray/Uint8Array#__get
    local.set $5
    i32.const 0
    local.set $1
    local.get $7
    i32.const 1
    i32.sub
    local.set $4
    loop $for-loop|2
     i32.const 1
     local.get $1
     local.get $2
     i32.lt_s
     local.get $5
     select
     i32.const 0
     local.get $4
     i32.const -1
     i32.ne
     select
     if
      local.get $6
      local.get $4
      local.get $5
      local.get $6
      local.get $4
      call $~lib/typedarray/Uint8Array#__get
      i32.const 8
      i32.shl
      i32.add
      local.tee $5
      i32.const 58
      i32.rem_u
      call $~lib/typedarray/Uint8Array#__set
      local.get $5
      i32.const 58
      i32.div_u
      local.set $5
      local.get $4
      i32.const 1
      i32.sub
      local.set $4
      local.get $1
      i32.const 1
      i32.add
      local.set $1
      br $for-loop|2
     end
    end
    local.get $1
    local.set $2
    local.get $3
    i32.const 1
    i32.add
    local.set $3
    br $while-continue|1
   end
  end
  local.get $7
  local.get $2
  i32.sub
  local.set $1
  loop $while-continue|3
   local.get $1
   local.get $7
   i32.ne
   if (result i32)
    local.get $6
    local.get $1
    call $~lib/typedarray/Uint8Array#__get
   else
    i32.const 1
   end
   i32.eqz
   if
    local.get $1
    i32.const 1
    i32.add
    local.set $1
    br $while-continue|3
   end
  end
  local.get $0
  local.get $6
  i32.load offset=8
  i32.add
  local.set $2
  i32.const 12
  i32.const 14
  call $~lib/rt/stub/__new
  local.get $2
  i32.const 0
  call $~lib/arraybuffer/ArrayBufferView#constructor
  local.tee $3
  i32.load offset=4
  local.set $2
  local.get $3
  i32.load offset=8
  local.tee $4
  i32.const 0
  local.get $4
  i32.const 0
  i32.le_s
  select
  local.tee $5
  local.get $0
  local.get $4
  i32.add
  local.get $0
  local.get $4
  local.get $0
  local.get $4
  i32.lt_s
  select
  local.get $0
  i32.const 0
  i32.lt_s
  select
  local.tee $4
  i32.lt_s
  if
   local.get $2
   local.get $5
   i32.add
   global.get $~lib/metashrew-as/assembly/utils/b58/LEADER
   local.get $4
   local.get $5
   i32.sub
   memory.fill
  end
  loop $for-loop|4
   local.get $1
   local.get $7
   i32.lt_s
   if
    local.get $0
    local.tee $2
    i32.const 1
    i32.add
    local.set $0
    local.get $3
    local.get $2
    local.get $6
    local.get $1
    call $~lib/typedarray/Uint8Array#__get
    call $~lib/staticarray/StaticArray<u8>#__get
    call $~lib/typedarray/Uint8Array#__set
    local.get $1
    i32.const 1
    i32.add
    local.set $1
    br $for-loop|4
   end
  end
  local.get $3
  i32.load
 )
 (func $~lib/metashrew-as/assembly/utils/b32/prefixChk (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  i32.const 1
  local.set $1
  loop $for-loop|0
   local.get $2
   local.get $0
   i32.const 20
   i32.sub
   i32.load offset=16
   i32.lt_s
   if
    local.get $0
    local.get $2
    i32.add
    i32.load8_u
    local.tee $4
    i32.const 33
    i32.lt_u
    local.get $4
    i32.const 126
    i32.gt_u
    i32.or
    if
     i32.const 0
     i32.const 6080
     i32.const 60
     i32.const 7
     call $~lib/builtins/abort
     unreachable
    end
    i32.const 0
    local.get $1
    i32.const 25
    i32.shr_u
    local.tee $5
    i32.const 4
    i32.shr_u
    i32.sub
    i32.const 705979059
    i32.and
    i32.const 0
    local.get $5
    i32.const 3
    i32.shr_u
    i32.const 1
    i32.and
    i32.sub
    i32.const 1027748829
    i32.and
    i32.const 0
    local.get $5
    i32.const 2
    i32.shr_u
    i32.const 1
    i32.and
    i32.sub
    i32.const 513874426
    i32.and
    i32.const 0
    local.get $5
    i32.const 1
    i32.shr_u
    i32.const 1
    i32.and
    i32.sub
    i32.const 642813549
    i32.and
    i32.const 0
    local.get $5
    i32.const 1
    i32.and
    i32.sub
    i32.const 996825010
    i32.and
    local.get $1
    i32.const 33554431
    i32.and
    i32.const 5
    i32.shl
    i32.xor
    i32.xor
    i32.xor
    i32.xor
    i32.xor
    local.get $4
    i32.const 5
    i32.shr_u
    i32.xor
    local.set $1
    local.get $2
    i32.const 1
    i32.add
    local.set $2
    br $for-loop|0
   end
  end
  i32.const 0
  local.get $1
  i32.const 25
  i32.shr_u
  local.tee $2
  i32.const 4
  i32.shr_u
  i32.sub
  i32.const 705979059
  i32.and
  i32.const 0
  local.get $2
  i32.const 3
  i32.shr_u
  i32.const 1
  i32.and
  i32.sub
  i32.const 1027748829
  i32.and
  i32.const 0
  local.get $2
  i32.const 2
  i32.shr_u
  i32.const 1
  i32.and
  i32.sub
  i32.const 513874426
  i32.and
  i32.const 0
  local.get $2
  i32.const 1
  i32.shr_u
  i32.const 1
  i32.and
  i32.sub
  i32.const 642813549
  i32.and
  i32.const 0
  local.get $2
  i32.const 1
  i32.and
  i32.sub
  i32.const 996825010
  i32.and
  local.get $1
  i32.const 33554431
  i32.and
  i32.const 5
  i32.shl
  i32.xor
  i32.xor
  i32.xor
  i32.xor
  i32.xor
  local.set $1
  loop $for-loop|1
   local.get $3
   local.get $0
   i32.const 20
   i32.sub
   i32.load offset=16
   i32.lt_s
   if
    local.get $0
    local.get $3
    i32.add
    i32.load8_u
    i32.const 31
    i32.and
    i32.const 0
    local.get $1
    i32.const 25
    i32.shr_u
    local.tee $2
    i32.const 4
    i32.shr_u
    i32.sub
    i32.const 705979059
    i32.and
    i32.const 0
    local.get $2
    i32.const 3
    i32.shr_u
    i32.const 1
    i32.and
    i32.sub
    i32.const 1027748829
    i32.and
    i32.const 0
    local.get $2
    i32.const 2
    i32.shr_u
    i32.const 1
    i32.and
    i32.sub
    i32.const 513874426
    i32.and
    i32.const 0
    local.get $2
    i32.const 1
    i32.shr_u
    i32.const 1
    i32.and
    i32.sub
    i32.const 642813549
    i32.and
    i32.const 0
    local.get $2
    i32.const 1
    i32.and
    i32.sub
    i32.const 996825010
    i32.and
    local.get $1
    i32.const 33554431
    i32.and
    i32.const 5
    i32.shl
    i32.xor
    i32.xor
    i32.xor
    i32.xor
    i32.xor
    i32.xor
    local.set $1
    local.get $3
    i32.const 1
    i32.add
    local.set $3
    br $for-loop|1
   end
  end
  local.get $1
 )
 (func $~lib/metashrew-as/assembly/utils/b32/encode (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  local.get $1
  i32.load offset=12
  local.get $0
  i32.const 20
  i32.sub
  i32.load offset=16
  i32.const 7
  i32.add
  i32.add
  i32.const 90
  i32.gt_s
  if
   i32.const 6192
   i32.const 6080
   i32.const 120
   i32.const 5
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  call $~lib/metashrew-as/assembly/utils/b32/prefixChk
  local.set $4
  local.get $1
  i32.load offset=12
  local.get $0
  i32.const 20
  i32.sub
  i32.load offset=16
  i32.const 7
  i32.add
  i32.add
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.tee $5
  local.get $0
  local.get $0
  i32.const 20
  i32.sub
  i32.load offset=16
  memory.copy
  local.get $5
  local.get $0
  i32.const 20
  i32.sub
  i32.load offset=16
  i32.add
  local.tee $0
  global.get $~lib/metashrew-as/assembly/utils/b32/ONE
  i32.load8_u
  i32.store8
  local.get $0
  i32.const 1
  i32.add
  local.set $0
  loop $for-loop|0
   local.get $3
   local.get $1
   i32.load offset=12
   i32.lt_s
   if
    local.get $1
    local.get $3
    call $~lib/array/Array<u8>#__get
    local.tee $7
    i32.const 5
    i32.shr_u
    if
     i32.const 6256
     i32.const 6080
     i32.const 135
     i32.const 23
     call $~lib/builtins/abort
     unreachable
    end
    local.get $7
    i32.const 0
    local.get $4
    i32.const 25
    i32.shr_u
    local.tee $6
    i32.const 4
    i32.shr_u
    i32.const 1
    i32.and
    i32.sub
    i32.const 705979059
    i32.and
    i32.const 0
    local.get $6
    i32.const 3
    i32.shr_u
    i32.const 1
    i32.and
    i32.sub
    i32.const 1027748829
    i32.and
    i32.const 0
    local.get $6
    i32.const 2
    i32.shr_u
    i32.const 1
    i32.and
    i32.sub
    i32.const 513874426
    i32.and
    i32.const 0
    local.get $6
    i32.const 1
    i32.shr_u
    i32.const 1
    i32.and
    i32.sub
    i32.const 642813549
    i32.and
    i32.const 0
    local.get $6
    i32.const 1
    i32.and
    i32.sub
    i32.const 996825010
    i32.and
    local.get $4
    i32.const 33554431
    i32.and
    i32.const 5
    i32.shl
    i32.xor
    i32.xor
    i32.xor
    i32.xor
    i32.xor
    i32.xor
    local.set $4
    local.get $0
    local.get $3
    i32.add
    local.get $7
    i32.const 3200
    i32.add
    i32.load8_u
    i32.store8
    local.get $3
    i32.const 1
    i32.add
    local.set $3
    br $for-loop|0
   end
  end
  local.get $0
  local.get $1
  i32.load offset=12
  i32.add
  local.set $0
  i32.const 0
  local.set $3
  loop $for-loop|1
   local.get $3
   i32.const 6
   i32.lt_u
   if
    i32.const 0
    local.get $4
    i32.const 25
    i32.shr_u
    local.tee $1
    i32.const 4
    i32.shr_u
    i32.const 1
    i32.and
    i32.sub
    i32.const 705979059
    i32.and
    i32.const 0
    local.get $1
    i32.const 3
    i32.shr_u
    i32.const 1
    i32.and
    i32.sub
    i32.const 1027748829
    i32.and
    i32.const 0
    local.get $1
    i32.const 2
    i32.shr_u
    i32.const 1
    i32.and
    i32.sub
    i32.const 513874426
    i32.and
    i32.const 0
    local.get $1
    i32.const 1
    i32.shr_u
    i32.const 1
    i32.and
    i32.sub
    i32.const 642813549
    i32.and
    i32.const 0
    local.get $1
    i32.const 1
    i32.and
    i32.sub
    i32.const 996825010
    i32.and
    local.get $4
    i32.const 33554431
    i32.and
    i32.const 5
    i32.shl
    i32.xor
    i32.xor
    i32.xor
    i32.xor
    i32.xor
    local.set $4
    local.get $3
    i32.const 1
    i32.add
    local.set $3
    br $for-loop|1
   end
  end
  local.get $2
  local.get $4
  i32.xor
  local.set $2
  i32.const 0
  local.set $1
  loop $for-loop|2
   local.get $1
   i32.const 6
   i32.lt_s
   if
    local.get $0
    local.get $1
    i32.add
    local.get $2
    i32.const 5
    local.get $1
    i32.sub
    i32.const 5
    i32.mul
    i32.shr_u
    i32.const 31
    i32.and
    i32.const 3200
    i32.add
    i32.load8_u
    i32.store8
    local.get $1
    i32.const 1
    i32.add
    local.set $1
    br $for-loop|2
   end
  end
  local.get $5
 )
 (func $~lib/metashrew-as/assembly/blockdata/address/Address.from (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  block $__inlined_func$~lib/metashrew-as/assembly/utils/yabsp/Script#is_p2pkh$3061
   local.get $0
   i32.load
   local.tee $3
   i32.load offset=4
   i32.const 25
   i32.ne
   br_if $__inlined_func$~lib/metashrew-as/assembly/utils/yabsp/Script#is_p2pkh$3061
   i32.const 1
   local.set $1
   local.get $3
   i32.load
   local.tee $3
   i32.load8_u
   i32.const 118
   i32.eq
   if (result i32)
    local.get $3
    i32.load8_u offset=1
    i32.const 169
    i32.eq
   else
    i32.const 0
   end
   if (result i32)
    local.get $0
    i32.load
    i32.load
    i32.load8_u offset=2
    i32.const 20
    i32.eq
   else
    i32.const 0
   end
   if (result i32)
    local.get $0
    i32.load
    i32.load
    i32.load8_u offset=23
    i32.const 136
    i32.eq
   else
    i32.const 0
   end
   if (result i32)
    local.get $0
    i32.load
    i32.load
    i32.load8_u offset=24
    i32.const 172
    i32.eq
   else
    i32.const 0
   end
   br_if $__inlined_func$~lib/metashrew-as/assembly/utils/yabsp/Script#is_p2pkh$3061
   i32.const 0
   local.set $1
  end
  local.get $1
  if (result i32)
   local.get $0
   i32.load
   local.tee $0
   i32.load
   i32.const 3
   i32.add
   local.get $0
   i32.load offset=4
   i32.const 3
   i32.sub
   call $~lib/metashrew-as/assembly/utils/box/Box#constructor
   local.tee $0
   i32.const 20
   i32.store offset=4
   i32.const 12
   i32.const 14
   call $~lib/rt/stub/__new
   i32.const 1
   i32.const 0
   call $~lib/arraybuffer/ArrayBufferView#constructor
   local.tee $1
   i32.const 0
   i32.const 0
   call $~lib/typedarray/Uint8Array#__set
   local.get $1
   i32.load
   local.set $1
   local.get $0
   i32.load offset=4
   call $~lib/arraybuffer/ArrayBuffer#constructor
   local.tee $2
   local.get $0
   i32.load
   local.get $0
   i32.load offset=4
   memory.copy
   local.get $1
   local.get $2
   call $~lib/metashrew-as/assembly/blockdata/address/Address.toBase58Check
  else
   i32.const 0
   local.set $1
   block $__inlined_func$~lib/metashrew-as/assembly/utils/yabsp/Script#is_p2sh$3063
    local.get $0
    i32.load
    local.tee $3
    i32.load offset=4
    i32.const 23
    i32.ne
    br_if $__inlined_func$~lib/metashrew-as/assembly/utils/yabsp/Script#is_p2sh$3063
    i32.const 1
    local.set $1
    local.get $3
    i32.load
    local.tee $3
    i32.load8_u
    i32.const 169
    i32.eq
    if (result i32)
     local.get $3
     i32.load8_u offset=1
     i32.const 20
     i32.eq
    else
     i32.const 0
    end
    if (result i32)
     local.get $0
     i32.load
     i32.load
     i32.load8_u offset=22
     i32.const 135
     i32.eq
    else
     i32.const 0
    end
    br_if $__inlined_func$~lib/metashrew-as/assembly/utils/yabsp/Script#is_p2sh$3063
    i32.const 0
    local.set $1
   end
   local.get $1
   if (result i32)
    local.get $0
    i32.load
    local.tee $0
    i32.load
    i32.const 2
    i32.add
    local.get $0
    i32.load offset=4
    i32.const 2
    i32.sub
    call $~lib/metashrew-as/assembly/utils/box/Box#constructor
    local.tee $0
    i32.const 20
    i32.store offset=4
    i32.const 12
    i32.const 14
    call $~lib/rt/stub/__new
    i32.const 1
    i32.const 0
    call $~lib/arraybuffer/ArrayBufferView#constructor
    local.tee $1
    i32.const 0
    i32.const 5
    call $~lib/typedarray/Uint8Array#__set
    local.get $1
    i32.load
    local.set $1
    local.get $0
    i32.load offset=4
    call $~lib/arraybuffer/ArrayBuffer#constructor
    local.tee $2
    local.get $0
    i32.load
    local.get $0
    i32.load offset=4
    memory.copy
    local.get $1
    local.get $2
    call $~lib/metashrew-as/assembly/blockdata/address/Address.toBase58Check
   else
    block $__inlined_func$~lib/metashrew-as/assembly/utils/yabsp/Script#is_witness_program$50 (result i32)
     i32.const 0
     local.get $0
     i32.load
     local.tee $1
     i32.load offset=4
     local.tee $3
     i32.const 4
     i32.lt_u
     local.get $3
     i32.const 42
     i32.gt_u
     i32.or
     br_if $__inlined_func$~lib/metashrew-as/assembly/utils/yabsp/Script#is_witness_program$50
     drop
     local.get $1
     i32.load
     local.tee $1
     i32.load8_u offset=1
     local.set $3
     i32.const 0
     block $__inlined_func$~lib/metashrew-as/assembly/utils/yabsp/valid_witness_version_from_opcode$483 (result i32)
      i32.const 1
      local.get $1
      i32.load8_u
      local.tee $1
      i32.const 96
      i32.le_u
      local.get $1
      i32.const 82
      i32.ge_u
      i32.or
      br_if $__inlined_func$~lib/metashrew-as/assembly/utils/yabsp/valid_witness_version_from_opcode$483
      drop
      i32.const 1
      local.get $1
      i32.eqz
      local.get $1
      i32.const 81
      i32.eq
      i32.or
      br_if $__inlined_func$~lib/metashrew-as/assembly/utils/yabsp/valid_witness_version_from_opcode$483
      drop
      i32.const 0
     end
     i32.eqz
     br_if $__inlined_func$~lib/metashrew-as/assembly/utils/yabsp/Script#is_witness_program$50
     drop
     i32.const 0
     local.get $3
     i32.const 2
     i32.lt_u
     local.get $3
     i32.const 40
     i32.gt_u
     i32.or
     br_if $__inlined_func$~lib/metashrew-as/assembly/utils/yabsp/Script#is_witness_program$50
     drop
     i32.const 1
    end
    if (result i32)
     local.get $0
     i32.load
     local.tee $1
     i32.load
     i32.const 2
     i32.add
     local.get $1
     i32.load offset=4
     i32.const 2
     i32.sub
     call $~lib/metashrew-as/assembly/utils/box/Box#constructor
     local.tee $1
     i32.load offset=4
     call $~lib/arraybuffer/ArrayBuffer#constructor
     local.tee $4
     local.get $1
     i32.load
     local.get $1
     i32.load offset=4
     memory.copy
     local.get $0
     i32.load offset=4
     i32.load8_u
     i32.const 0
     i32.ne
     local.set $5
     i32.const 1
     global.set $~argumentsLength
     i32.const 6048
     i32.const 0
     call $~lib/string/String.UTF8.encode@varargs
     local.set $3
     i32.const 0
     local.set $0
     i32.const 0
     local.set $1
     i32.const 1
     global.set $~argumentsLength
     local.get $4
     call $~lib/typedarray/Uint8Array.wrap@varargs
     local.set $6
     i32.const 0
     call $~lib/array/Array<u8>#constructor
     local.set $4
     loop $for-loop|0
      local.get $1
      local.get $6
      i32.load offset=8
      i32.lt_s
      if
       local.get $6
       local.get $1
       call $~lib/typedarray/Uint8Array#__get
       local.get $2
       i32.const 8
       i32.shl
       i32.or
       local.set $2
       local.get $0
       i32.const 8
       i32.add
       local.set $0
       loop $while-continue|1
        local.get $0
        i32.const 5
        i32.ge_u
        if
         local.get $4
         local.get $2
         local.get $0
         i32.const 5
         i32.sub
         local.tee $0
         i32.shr_s
         i32.const 31
         i32.and
         call $~lib/array/Array<u8>#push
         br $while-continue|1
        end
       end
       local.get $1
       i32.const 1
       i32.add
       local.set $1
       br $for-loop|0
      end
     end
     local.get $0
     if
      local.get $4
      local.get $2
      i32.const 5
      local.get $0
      i32.sub
      i32.shl
      i32.const 31
      i32.and
      call $~lib/array/Array<u8>#push
     end
     local.get $4
     i32.load offset=4
     local.tee $0
     local.get $0
     i32.const 20
     i32.sub
     i32.load offset=16
     call $~lib/metashrew-as/assembly/utils/box/Box#constructor
     local.tee $0
     local.get $4
     i32.load offset=12
     i32.store offset=4
     local.get $0
     i32.load offset=4
     call $~lib/arraybuffer/ArrayBuffer#constructor
     local.tee $1
     local.get $0
     i32.load
     local.get $0
     i32.load offset=4
     memory.copy
     local.get $1
     call $~lib/metashrew-as/assembly/indexer/index/arrayBufferToArray
     local.tee $0
     i32.load offset=12
     i32.const 1
     i32.add
     local.set $1
     local.get $0
     local.get $1
     i32.const 0
     i32.const 1
     call $~lib/array/ensureCapacity
     local.get $0
     i32.load offset=4
     local.tee $2
     i32.const 1
     i32.add
     local.get $2
     local.get $1
     i32.const 1
     i32.sub
     memory.copy
     local.get $2
     local.get $5
     i32.store8
     local.get $0
     local.get $1
     i32.store offset=12
     local.get $5
     if (result i32)
      local.get $0
      i32.load offset=4
      local.get $0
      i32.load offset=12
      call $~lib/metashrew-as/assembly/utils/box/Box#constructor
      local.tee $0
      i32.load offset=4
      call $~lib/arraybuffer/ArrayBuffer#constructor
      local.tee $1
      local.get $0
      i32.load
      local.get $0
      i32.load offset=4
      memory.copy
      local.get $3
      local.get $1
      call $~lib/metashrew-as/assembly/indexer/index/arrayBufferToArray
      i32.const 734539939
      call $~lib/metashrew-as/assembly/utils/b32/encode
     else
      local.get $0
      i32.load offset=4
      local.get $0
      i32.load offset=12
      call $~lib/metashrew-as/assembly/utils/box/Box#constructor
      local.tee $0
      i32.load offset=4
      call $~lib/arraybuffer/ArrayBuffer#constructor
      local.tee $1
      local.get $0
      i32.load
      local.get $0
      i32.load offset=4
      memory.copy
      local.get $3
      local.get $1
      call $~lib/metashrew-as/assembly/indexer/index/arrayBufferToArray
      i32.const 1
      call $~lib/metashrew-as/assembly/utils/b32/encode
     end
    else
     i32.const 0
    end
   end
  end
 )
 (func $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#get (param $0 i32) (result i32)
  (local $1 i32)
  local.get $0
  call $~lib/metashrew-as/assembly/indexer/index/hash
  local.set $1
  global.get $~lib/metashrew-as/assembly/indexer/index/_updates
  local.get $1
  local.get $1
  call $~lib/util/hash/HASH<~lib/string/String>
  call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#find"
  if
   global.get $~lib/metashrew-as/assembly/indexer/index/_updates
   local.get $1
   call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#get"
   local.set $0
  else
   local.get $0
   local.get $0
   call $~lib/metashrew-as/assembly/indexer/index/__get_len
   call $~lib/arraybuffer/ArrayBuffer#constructor
   local.tee $0
   call $~lib/metashrew-as/assembly/indexer/index/__get
   global.get $~lib/metashrew-as/assembly/indexer/index/_updates
   local.get $1
   local.get $0
   call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set"
  end
  local.get $0
  local.get $0
  i32.const 20
  i32.sub
  i32.load offset=16
  call $~lib/metashrew-as/assembly/utils/box/Box#constructor
  local.tee $0
  i32.load offset=4
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.tee $1
  local.get $0
  i32.load
  local.get $0
  i32.load offset=4
  memory.copy
  local.get $1
 )
 (func $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#getValue<u32> (param $0 i32) (result i32)
  (local $1 i32)
  local.get $0
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#get
  local.tee $0
  i32.const 20
  i32.sub
  i32.load offset=16
  i32.eqz
  if
   i32.const 0
   return
  end
  i32.const 4
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.tee $1
  local.get $0
  local.get $0
  i32.const 20
  i32.sub
  i32.load offset=16
  memory.copy
  local.get $1
  i32.load
 )
 (func $~lib/util/number/utoa32_dec_lut (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  loop $while-continue|0
   local.get $1
   i32.const 10000
   i32.ge_u
   if
    local.get $1
    i32.const 10000
    i32.rem_u
    local.set $3
    local.get $1
    i32.const 10000
    i32.div_u
    local.set $1
    local.get $0
    local.get $2
    i32.const 4
    i32.sub
    local.tee $2
    i32.const 1
    i32.shl
    i32.add
    local.get $3
    i32.const 100
    i32.div_u
    i32.const 2
    i32.shl
    i32.const 6588
    i32.add
    i64.load32_u
    local.get $3
    i32.const 100
    i32.rem_u
    i32.const 2
    i32.shl
    i32.const 6588
    i32.add
    i64.load32_u
    i64.const 32
    i64.shl
    i64.or
    i64.store
    br $while-continue|0
   end
  end
  local.get $1
  i32.const 100
  i32.ge_u
  if
   local.get $0
   local.get $2
   i32.const 2
   i32.sub
   local.tee $2
   i32.const 1
   i32.shl
   i32.add
   local.get $1
   i32.const 100
   i32.rem_u
   i32.const 2
   i32.shl
   i32.const 6588
   i32.add
   i32.load
   i32.store
   local.get $1
   i32.const 100
   i32.div_u
   local.set $1
  end
  local.get $1
  i32.const 10
  i32.ge_u
  if
   local.get $0
   local.get $2
   i32.const 2
   i32.sub
   i32.const 1
   i32.shl
   i32.add
   local.get $1
   i32.const 2
   i32.shl
   i32.const 6588
   i32.add
   i32.load
   i32.store
  else
   local.get $0
   local.get $2
   i32.const 1
   i32.sub
   i32.const 1
   i32.shl
   i32.add
   local.get $1
   i32.const 48
   i32.add
   i32.store16
  end
 )
 (func $~lib/util/number/utoa32 (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  local.get $0
  i32.eqz
  if
   i32.const 6576
   return
  end
  local.get $0
  i32.const 100000
  i32.lt_u
  if (result i32)
   local.get $0
   i32.const 100
   i32.lt_u
   if (result i32)
    local.get $0
    i32.const 10
    i32.ge_u
    i32.const 1
    i32.add
   else
    local.get $0
    i32.const 10000
    i32.ge_u
    i32.const 3
    i32.add
    local.get $0
    i32.const 1000
    i32.ge_u
    i32.add
   end
  else
   local.get $0
   i32.const 10000000
   i32.lt_u
   if (result i32)
    local.get $0
    i32.const 1000000
    i32.ge_u
    i32.const 6
    i32.add
   else
    local.get $0
    i32.const 1000000000
    i32.ge_u
    i32.const 8
    i32.add
    local.get $0
    i32.const 100000000
    i32.ge_u
    i32.add
   end
  end
  local.tee $2
  i32.const 1
  i32.shl
  i32.const 2
  call $~lib/rt/stub/__new
  local.tee $1
  local.get $0
  local.get $2
  call $~lib/util/number/utoa32_dec_lut
  local.get $1
 )
 (func $~lib/string/String.__concat (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  i32.const 8160
  local.set $2
  local.get $0
  i32.const 20
  i32.sub
  i32.load offset=16
  i32.const -2
  i32.and
  local.tee $3
  local.get $1
  i32.const 20
  i32.sub
  i32.load offset=16
  i32.const -2
  i32.and
  local.tee $4
  i32.add
  local.tee $5
  if
   local.get $5
   i32.const 2
   call $~lib/rt/stub/__new
   local.tee $2
   local.get $0
   local.get $3
   memory.copy
   local.get $2
   local.get $3
   i32.add
   local.get $1
   local.get $4
   memory.copy
  end
  local.get $2
 )
 (func $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#selectIndex (param $0 i32) (param $1 i32) (result i32)
  i32.const 6352
  local.get $1
  call $~lib/util/number/utoa32
  call $~lib/string/String.__concat
  local.set $1
  i32.const 1
  global.set $~argumentsLength
  local.get $0
  local.get $1
  i32.const 0
  call $~lib/string/String.UTF8.encode@varargs
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
 )
 (func $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#extend (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  i32.const 1
  global.set $~argumentsLength
  local.get $0
  i32.const 6304
  i32.const 0
  call $~lib/string/String.UTF8.encode@varargs
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
  local.tee $1
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#getValue<u32>
  local.set $2
  i32.const 4
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.tee $4
  local.get $2
  i32.const 1
  i32.add
  i32.store
  local.get $1
  call $~lib/metashrew-as/assembly/indexer/index/hash
  local.set $3
  global.get $~lib/metashrew-as/assembly/indexer/index/_updates
  local.get $3
  local.get $4
  call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set"
  global.get $~lib/metashrew-as/assembly/indexer/index/_updateKeys
  local.get $3
  local.get $1
  call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set"
  local.get $0
  local.get $2
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#selectIndex
 )
 (func $~lib/metashrew-spendables/assembly/indexer/SpendablesIndex#indexBlock (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  loop $for-loop|0
   local.get $2
   local.get $0
   i32.load offset=8
   local.tee $1
   i32.load offset=12
   i32.lt_s
   if
    local.get $1
    local.get $2
    call $~lib/array/Array<~lib/array/Array<u8>>#__get
    local.set $3
    i32.const 0
    local.set $1
    loop $for-loop|1
     local.get $1
     local.get $0
     i32.load offset=8
     local.get $2
     call $~lib/array/Array<~lib/array/Array<u8>>#__get
     i32.load offset=12
     i32.load offset=12
     i32.lt_s
     if
      local.get $3
      i32.load offset=12
      local.get $1
      call $~lib/array/Array<~lib/array/Array<u8>>#__get
      local.tee $4
      i32.load offset=4
      i32.load
      i32.const 32
      call $~lib/metashrew-as/assembly/utils/box/Box#constructor
      local.tee $5
      i32.load offset=4
      call $~lib/arraybuffer/ArrayBuffer#constructor
      local.tee $6
      local.get $5
      i32.load
      local.get $5
      i32.load offset=4
      memory.copy
      local.get $6
      call $~lib/metashrew-as/assembly/utils/utils/reverse
      local.get $4
      i32.load offset=8
      call $~lib/metashrew-as/assembly/blockdata/transaction/OutPoint.from
      i32.load
      local.tee $4
      i32.load offset=4
      call $~lib/arraybuffer/ArrayBuffer#constructor
      local.tee $5
      local.get $4
      i32.load
      local.get $4
      i32.load offset=4
      memory.copy
      global.get $~lib/metashrew-spendables/assembly/tables/OUTPOINT_SPENDABLE_BY
      local.get $5
      call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
      local.set $4
      i32.const 0
      call $~lib/arraybuffer/ArrayBuffer#constructor
      local.set $5
      local.get $4
      call $~lib/metashrew-as/assembly/indexer/index/hash
      local.set $6
      global.get $~lib/metashrew-as/assembly/indexer/index/_updates
      local.get $6
      local.get $5
      call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set"
      global.get $~lib/metashrew-as/assembly/indexer/index/_updateKeys
      local.get $6
      local.get $4
      call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set"
      local.get $1
      i32.const 1
      i32.add
      local.set $1
      br $for-loop|1
     end
    end
    local.get $3
    call $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#txid
    local.set $4
    i32.const 0
    local.set $1
    loop $for-loop|2
     local.get $1
     local.get $3
     i32.load offset=16
     local.tee $5
     i32.load offset=12
     i32.lt_s
     if
      local.get $5
      local.get $1
      call $~lib/array/Array<~lib/array/Array<u8>>#__get
      local.set $5
      local.get $4
      local.get $1
      call $~lib/metashrew-as/assembly/blockdata/transaction/OutPoint.from
      i32.load
      local.tee $6
      i32.load offset=4
      call $~lib/arraybuffer/ArrayBuffer#constructor
      local.tee $7
      local.get $6
      i32.load
      local.get $6
      i32.load offset=4
      memory.copy
      local.get $5
      i32.load offset=16
      local.set $6
      i32.const 8
      i32.const 48
      call $~lib/rt/stub/__new
      local.tee $8
      i32.const 0
      i32.store
      local.get $8
      i32.const 0
      i32.store offset=4
      local.get $8
      local.get $6
      i32.store
      local.get $8
      i32.const -1
      i32.store offset=4
      block $__inlined_func$~lib/metashrew-as/assembly/utils/yabsp/Script#is_witness_program$59 (result i32)
       i32.const 0
       local.get $8
       i32.load
       local.tee $6
       i32.load offset=4
       local.tee $9
       i32.const 4
       i32.lt_u
       local.get $9
       i32.const 42
       i32.gt_u
       i32.or
       br_if $__inlined_func$~lib/metashrew-as/assembly/utils/yabsp/Script#is_witness_program$59
       drop
       local.get $6
       i32.load
       local.tee $6
       i32.load8_u offset=1
       local.set $9
       i32.const 0
       block $__inlined_func$~lib/metashrew-as/assembly/utils/yabsp/valid_witness_version_from_opcode$483 (result i32)
        i32.const 1
        local.get $6
        i32.load8_u
        local.tee $6
        i32.const 96
        i32.le_u
        local.get $6
        i32.const 82
        i32.ge_u
        i32.or
        br_if $__inlined_func$~lib/metashrew-as/assembly/utils/yabsp/valid_witness_version_from_opcode$483
        drop
        i32.const 1
        local.get $6
        i32.eqz
        local.get $6
        i32.const 81
        i32.eq
        i32.or
        br_if $__inlined_func$~lib/metashrew-as/assembly/utils/yabsp/valid_witness_version_from_opcode$483
        drop
        i32.const 0
       end
       i32.eqz
       br_if $__inlined_func$~lib/metashrew-as/assembly/utils/yabsp/Script#is_witness_program$59
       drop
       i32.const 0
       local.get $9
       i32.const 2
       i32.lt_u
       local.get $9
       i32.const 40
       i32.gt_u
       i32.or
       br_if $__inlined_func$~lib/metashrew-as/assembly/utils/yabsp/Script#is_witness_program$59
       drop
       i32.const 1
      end
      if
       local.get $8
       local.get $8
       i32.load
       i32.load
       i32.store offset=4
      end
      local.get $8
      call $~lib/metashrew-as/assembly/blockdata/address/Address.from
      local.set $6
      global.get $~lib/metashrew-spendables/assembly/tables/OUTPOINT_TO_OUTPUT
      local.get $7
      call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
      local.set $8
      local.get $5
      i32.load
      local.tee $5
      i32.load offset=4
      call $~lib/arraybuffer/ArrayBuffer#constructor
      local.tee $9
      local.get $5
      i32.load
      local.get $5
      i32.load offset=4
      memory.copy
      local.get $8
      call $~lib/metashrew-as/assembly/indexer/index/hash
      local.set $5
      global.get $~lib/metashrew-as/assembly/indexer/index/_updates
      local.get $5
      local.get $9
      call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set"
      global.get $~lib/metashrew-as/assembly/indexer/index/_updateKeys
      local.get $5
      local.get $8
      call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set"
      local.get $6
      if
       global.get $~lib/metashrew-spendables/assembly/tables/OUTPOINTS_FOR_ADDRESS
       local.get $6
       call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
       call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#extend
       local.tee $5
       call $~lib/metashrew-as/assembly/indexer/index/hash
       local.set $8
       global.get $~lib/metashrew-as/assembly/indexer/index/_updates
       local.get $8
       local.get $7
       call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set"
       global.get $~lib/metashrew-as/assembly/indexer/index/_updateKeys
       local.get $8
       local.get $5
       call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set"
       global.get $~lib/metashrew-spendables/assembly/tables/OUTPOINT_SPENDABLE_BY
       local.get $7
       call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
       local.tee $5
       call $~lib/metashrew-as/assembly/indexer/index/hash
       local.set $7
       global.get $~lib/metashrew-as/assembly/indexer/index/_updates
       local.get $7
       local.get $6
       call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set"
       global.get $~lib/metashrew-as/assembly/indexer/index/_updateKeys
       local.get $7
       local.get $5
       call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set"
      end
      local.get $1
      i32.const 1
      i32.add
      local.set $1
      br $for-loop|2
     end
    end
    local.get $2
    i32.const 1
    i32.add
    local.set $2
    br $for-loop|0
   end
  end
 )
 (func $~lib/metashrew-runes/assembly/indexer/Indexer/RunesIndex#constructor (param $0 i32) (result i32)
  local.get $0
  i32.eqz
  if
   i32.const 0
   i32.const 64
   call $~lib/rt/stub/__new
   local.set $0
  end
  local.get $0
  if (result i32)
   local.get $0
  else
   i32.const 0
   i32.const 0
   call $~lib/rt/stub/__new
  end
 )
 (func $assembly/indexer/Indexer/DefaultProtorune#constructor (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  i32.const 2
  i32.const 49
  call $~lib/rt/stub/__new
  local.tee $2
  i32.eqz
  if
   i32.const 2
   i32.const 63
   call $~lib/rt/stub/__new
   local.set $2
  end
  local.get $2
  i32.const 0
  i32.store8
  local.get $2
  i32.const 0
  i32.store8 offset=1
  local.get $2
  call $~lib/metashrew-runes/assembly/indexer/Indexer/RunesIndex#constructor
  local.tee $2
  local.get $0
  i32.store8
  local.get $2
  local.get $1
  i32.store8 offset=1
  local.get $2
 )
 (func $~lib/as-bignum/assembly/utils/processU64 (param $0 i32) (param $1 i64)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  local.get $0
  i32.load offset=8
  i32.const 1
  i32.sub
  local.set $3
  i32.const 63
  local.set $5
  loop $for-loop|0
   local.get $5
   i32.const -1
   i32.ne
   if
    i32.const 0
    local.set $4
    loop $for-loop|1
     local.get $3
     local.get $4
     i32.ge_s
     if
      local.get $0
      i32.load offset=4
      local.get $4
      i32.add
      local.tee $2
      local.get $2
      i32.load8_u
      local.tee $2
      local.get $2
      i32.const 5
      i32.ge_u
      i32.const 3
      i32.mul
      i32.add
      i32.store8
      local.get $4
      i32.const 1
      i32.add
      local.set $4
      br $for-loop|1
     end
    end
    local.get $3
    local.set $2
    loop $for-loop|2
     local.get $2
     i32.const -1
     i32.ne
     if
      local.get $0
      i32.load offset=4
      local.tee $4
      local.get $2
      i32.add
      i32.load8_u
      i32.const 1
      i32.shl
      local.set $6
      local.get $2
      local.get $3
      i32.lt_s
      if
       local.get $4
       local.get $2
       i32.const 1
       i32.add
       i32.add
       local.tee $4
       local.get $4
       i32.load8_u
       local.get $6
       i32.const 255
       i32.and
       i32.const 15
       i32.gt_u
       i32.or
       i32.store8
      end
      local.get $0
      i32.load offset=4
      local.get $2
      i32.add
      local.get $6
      i32.const 15
      i32.and
      i32.store8
      local.get $2
      i32.const 1
      i32.sub
      local.set $2
      br $for-loop|2
     end
    end
    local.get $0
    i32.load offset=4
    local.tee $2
    local.get $2
    i32.load8_u
    local.get $1
    i64.const 1
    local.get $5
    i64.extend_i32_s
    i64.shl
    i64.and
    i64.const 0
    i64.ne
    i32.add
    i32.store8
    local.get $5
    i32.const 1
    i32.sub
    local.set $5
    br $for-loop|0
   end
  end
 )
 (func $~lib/string/String.fromCharCode@varargs (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  block $1of1
   block $0of1
    block $outOfRange
     global.get $~argumentsLength
     i32.const 1
     i32.sub
     br_table $0of1 $1of1 $outOfRange
    end
    unreachable
   end
   i32.const -1
   local.set $1
  end
  i32.const 2
  local.get $1
  i32.const 0
  i32.gt_s
  local.tee $3
  i32.shl
  i32.const 2
  call $~lib/rt/stub/__new
  local.tee $2
  local.get $0
  i32.store16
  local.get $3
  if
   local.get $2
   local.get $1
   i32.store16 offset=2
  end
  local.get $2
 )
 (func $~lib/as-bignum/assembly/integer/u128/u128#toString (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  local.get $0
  i64.load
  local.get $0
  i64.load offset=8
  i64.or
  i64.eqz
  if
   i32.const 6576
   return
  end
  i32.const 8160
  local.set $1
  i32.const 12
  i32.const 14
  call $~lib/rt/stub/__new
  i32.const 40
  i32.const 0
  call $~lib/arraybuffer/ArrayBufferView#constructor
  local.tee $2
  local.get $0
  i64.load offset=8
  call $~lib/as-bignum/assembly/utils/processU64
  local.get $2
  local.get $0
  i64.load
  call $~lib/as-bignum/assembly/utils/processU64
  i32.const 39
  local.set $0
  loop $for-loop|0
   local.get $0
   i32.const -1
   i32.ne
   if
    i32.const 1
    local.get $3
    local.get $3
    i32.eqz
    local.get $0
    local.get $2
    i32.load offset=4
    i32.add
    i32.load8_u
    local.tee $4
    i32.const 0
    i32.ne
    i32.and
    select
    local.tee $3
    if
     local.get $4
     i32.const 9
     i32.gt_u
     if
      i32.const 0
      i32.const 4800
      i32.const 114
      i32.const 7
      call $~lib/builtins/abort
      unreachable
     end
     i32.const 1
     global.set $~argumentsLength
     local.get $1
     local.get $4
     i32.const 48
     i32.add
     call $~lib/string/String.fromCharCode@varargs
     call $~lib/string/String.__concat
     local.set $1
    end
    local.get $0
    i32.const 1
    i32.sub
    local.set $0
    br $for-loop|0
   end
  end
  local.get $1
 )
 (func $~lib/as-bignum/assembly/integer/u128/u128#postDec (param $0 i32) (result i32)
  (local $1 i64)
  (local $2 i64)
  local.get $0
  i32.const 8
  i32.sub
  i32.load
  drop
  local.get $0
  i64.load
  local.set $1
  local.get $0
  i64.load offset=8
  local.set $2
  i32.const 16
  i32.const 9
  call $~lib/rt/stub/__new
  local.tee $0
  local.get $1
  i64.store
  local.get $0
  local.get $2
  i64.store offset=8
  local.get $0
  i32.const 8
  i32.sub
  i32.load
  drop
  local.get $0
  local.get $0
  i64.load offset=8
  local.get $0
  i64.load
  local.tee $1
  i64.const 1
  i64.sub
  local.tee $2
  local.get $1
  i64.gt_u
  i64.extend_i32_u
  i64.sub
  i64.store offset=8
  local.get $0
  local.get $2
  i64.store
  local.get $0
 )
 (func $~lib/metashrew-runes/assembly/utils/toArrayBuffer (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  i32.const 16
  call $~lib/array/Array<u8>#constructor
  local.tee $1
  i32.load offset=4
  local.tee $2
  local.get $0
  i64.load
  i64.store
  local.get $2
  local.get $0
  i64.load offset=8
  i64.store offset=8
  local.get $1
  i32.load
 )
 (func $~lib/metashrew-runes/assembly/indexer/RuneId/RuneId#constructor (param $0 i32) (param $1 i64) (param $2 i32) (result i32)
  (local $3 i32)
  local.get $0
  i32.eqz
  if
   i32.const 8
   i32.const 53
   call $~lib/rt/stub/__new
   local.set $0
  end
  local.get $0
  i32.const 0
  i32.store
  local.get $0
  i32.const 0
  i32.store offset=4
  i32.const 16
  i32.const 9
  call $~lib/rt/stub/__new
  local.tee $3
  local.get $1
  i64.store
  local.get $3
  i64.const 0
  i64.store offset=8
  local.get $0
  local.get $3
  i32.store
  i32.const 16
  i32.const 9
  call $~lib/rt/stub/__new
  local.tee $3
  local.get $2
  i64.extend_i32_u
  i64.store
  local.get $3
  i64.const 0
  i64.store offset=8
  local.get $0
  local.get $3
  i32.store offset=4
  local.get $0
 )
 (func $~lib/metashrew-runes/assembly/indexer/RuneId/RuneId#toBytes (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  local.get $0
  i32.load
  local.set $2
  i32.const 16
  call $~lib/array/Array<u8>#constructor
  local.tee $1
  i32.load offset=4
  local.tee $3
  local.get $2
  i64.load
  i64.store
  local.get $3
  local.get $2
  i64.load offset=8
  i64.store offset=8
  local.get $0
  i32.load offset=4
  local.set $0
  i32.const 16
  call $~lib/array/Array<u8>#constructor
  local.tee $2
  i32.load offset=4
  local.tee $3
  local.get $0
  i64.load
  i64.store
  local.get $3
  local.get $0
  i64.load offset=8
  i64.store offset=8
  local.get $1
  i32.load offset=12
  local.tee $3
  local.get $2
  i32.load offset=12
  local.tee $4
  i32.add
  local.tee $0
  i32.const 1073741820
  i32.gt_u
  if
   i32.const 2608
   i32.const 5344
   i32.const 224
   i32.const 60
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  i32.const 0
  i32.const 13
  i32.const 0
  call $~lib/rt/__newArray
  local.tee $5
  i32.load offset=4
  local.tee $0
  local.get $1
  i32.load offset=4
  local.get $3
  memory.copy
  local.get $0
  local.get $3
  i32.add
  local.get $2
  i32.load offset=4
  local.get $4
  memory.copy
  local.get $5
  i32.load
 )
 (func $~lib/metashrew-runes/assembly/indexer/RunestoneMessage/RunestoneMessage.etchGenesisRune
  (local $0 i32)
  (local $1 i32)
  (local $2 i64)
  (local $3 i64)
  (local $4 i64)
  (local $5 i32)
  (local $6 i32)
  (local $7 i64)
  (local $8 i64)
  (local $9 i64)
  (local $10 i64)
  i32.const 16
  i32.const 9
  call $~lib/rt/stub/__new
  local.tee $1
  i64.const 0
  i64.store
  local.get $1
  i64.const 0
  i64.store offset=8
  i32.const 16
  i32.const 9
  call $~lib/rt/stub/__new
  local.tee $1
  i64.const 0
  i64.store
  local.get $1
  i64.const 0
  i64.store offset=8
  loop $for-loop|0
   i32.const 8476
   i32.load
   i32.const 1
   i32.shr_u
   local.tee $5
   local.get $0
   i32.gt_s
   if
    local.get $0
    local.get $5
    i32.ge_u
    if (result i32)
     i32.const -1
    else
     local.get $0
     i32.const 1
     i32.shl
     i32.const 8480
     i32.add
     i32.load16_u
    end
    local.set $5
    i32.const 16
    i32.const 9
    call $~lib/rt/stub/__new
    local.tee $6
    local.get $5
    i32.const -64
    i32.add
    local.tee $5
    i32.const 0
    local.get $5
    i32.const 26
    i32.ne
    select
    i64.extend_i32_s
    local.tee $2
    i64.store
    local.get $6
    local.get $2
    i64.const 63
    i64.shr_s
    i64.store offset=8
    global.get $~lib/metashrew-runes/assembly/indexer/constants/index/TWENTY_SIX
    local.tee $5
    i64.load
    local.tee $2
    i64.const 32
    i64.shr_u
    local.set $3
    local.get $1
    i64.load
    local.tee $7
    i64.const 4294967295
    i64.and
    local.tee $4
    local.get $2
    i64.const 4294967295
    i64.and
    local.tee $8
    i64.mul
    local.set $9
    local.get $3
    local.get $4
    i64.mul
    local.get $8
    local.get $7
    i64.const 32
    i64.shr_u
    local.tee $8
    i64.mul
    local.get $9
    i64.const 32
    i64.shr_u
    i64.add
    local.tee $10
    i64.const 4294967295
    i64.and
    i64.add
    local.set $4
    local.get $3
    local.get $8
    i64.mul
    local.get $10
    i64.const 32
    i64.shr_u
    i64.add
    local.get $2
    local.get $1
    i64.load offset=8
    i64.mul
    i64.add
    local.get $5
    i64.load offset=8
    local.get $7
    i64.mul
    i64.add
    local.get $4
    i64.const 32
    i64.shr_u
    i64.add
    global.set $~lib/as-bignum/assembly/globals/__res128_hi
    global.get $~lib/as-bignum/assembly/globals/__res128_hi
    local.set $2
    i32.const 16
    i32.const 9
    call $~lib/rt/stub/__new
    local.tee $1
    local.get $9
    i64.const 4294967295
    i64.and
    local.get $4
    i64.const 32
    i64.shl
    i64.or
    i64.store
    local.get $1
    local.get $2
    i64.store offset=8
    local.get $1
    i64.load
    local.tee $2
    local.get $6
    i64.load
    i64.add
    local.tee $3
    local.get $2
    i64.lt_u
    i64.extend_i32_u
    local.get $1
    i64.load offset=8
    local.get $6
    i64.load offset=8
    i64.add
    i64.add
    local.set $2
    i32.const 16
    i32.const 9
    call $~lib/rt/stub/__new
    local.tee $1
    local.get $3
    i64.store
    local.get $1
    local.get $2
    i64.store offset=8
    local.get $0
    i32.const 1
    i32.add
    local.set $0
    br $for-loop|0
   end
  end
  local.get $1
  i32.const 8
  i32.sub
  i32.load
  drop
  local.get $1
  call $~lib/as-bignum/assembly/integer/u128/u128#postDec
  call $~lib/metashrew-runes/assembly/utils/toArrayBuffer
  local.set $0
  i32.const 0
  i64.const 1
  i32.const 0
  call $~lib/metashrew-runes/assembly/indexer/RuneId/RuneId#constructor
  call $~lib/metashrew-runes/assembly/indexer/RuneId/RuneId#toBytes
  local.set $1
  global.get $~lib/metashrew-runes/assembly/indexer/constants/index/ETCHING_TO_RUNE_ID
  local.get $0
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
  local.tee $5
  call $~lib/metashrew-as/assembly/indexer/index/hash
  local.set $6
  global.get $~lib/metashrew-as/assembly/indexer/index/_updates
  local.get $6
  local.get $1
  call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set"
  global.get $~lib/metashrew-as/assembly/indexer/index/_updateKeys
  local.get $6
  local.get $5
  call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set"
  global.get $~lib/metashrew-runes/assembly/indexer/constants/index/RUNE_ID_TO_ETCHING
  local.get $1
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
  local.tee $5
  call $~lib/metashrew-as/assembly/indexer/index/hash
  local.set $6
  global.get $~lib/metashrew-as/assembly/indexer/index/_updates
  local.get $6
  local.get $0
  call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set"
  global.get $~lib/metashrew-as/assembly/indexer/index/_updateKeys
  local.get $6
  local.get $5
  call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set"
  global.get $~lib/metashrew-runes/assembly/indexer/constants/index/RUNE_ID_TO_HEIGHT
  local.get $1
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
  local.set $1
  i32.const 4
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.tee $5
  i32.const 840000
  i32.store
  local.get $1
  call $~lib/metashrew-as/assembly/indexer/index/hash
  local.set $6
  global.get $~lib/metashrew-as/assembly/indexer/index/_updates
  local.get $6
  local.get $5
  call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set"
  global.get $~lib/metashrew-as/assembly/indexer/index/_updateKeys
  local.get $6
  local.get $1
  call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set"
  global.get $~lib/metashrew-runes/assembly/indexer/constants/index/DIVISIBILITY
  local.get $0
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
  local.set $1
  i32.const 1
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.tee $5
  i32.const 1
  i32.store8
  local.get $1
  call $~lib/metashrew-as/assembly/indexer/index/hash
  local.set $6
  global.get $~lib/metashrew-as/assembly/indexer/index/_updates
  local.get $6
  local.get $5
  call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set"
  global.get $~lib/metashrew-as/assembly/indexer/index/_updateKeys
  local.get $6
  local.get $1
  call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set"
  global.get $~lib/metashrew-runes/assembly/indexer/constants/index/AMOUNT
  local.get $0
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
  local.set $1
  i32.const 16
  i32.const 9
  call $~lib/rt/stub/__new
  local.tee $5
  i64.const 1
  i64.store
  local.get $5
  i64.const 0
  i64.store offset=8
  local.get $5
  call $~lib/metashrew-runes/assembly/utils/toArrayBuffer
  local.set $5
  local.get $1
  call $~lib/metashrew-as/assembly/indexer/index/hash
  local.set $6
  global.get $~lib/metashrew-as/assembly/indexer/index/_updates
  local.get $6
  local.get $5
  call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set"
  global.get $~lib/metashrew-as/assembly/indexer/index/_updateKeys
  local.get $6
  local.get $1
  call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set"
  global.get $~lib/metashrew-runes/assembly/indexer/constants/index/CAP
  local.get $0
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
  local.set $1
  i32.const 16
  i32.const 9
  call $~lib/rt/stub/__new
  local.tee $5
  i64.const -1
  i64.store
  local.get $5
  i64.const -1
  i64.store offset=8
  local.get $5
  call $~lib/metashrew-runes/assembly/utils/toArrayBuffer
  local.set $5
  local.get $1
  call $~lib/metashrew-as/assembly/indexer/index/hash
  local.set $6
  global.get $~lib/metashrew-as/assembly/indexer/index/_updates
  local.get $6
  local.get $5
  call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set"
  global.get $~lib/metashrew-as/assembly/indexer/index/_updateKeys
  local.get $6
  local.get $1
  call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set"
  global.get $~lib/metashrew-runes/assembly/indexer/constants/index/MINTS_REMAINING
  local.get $0
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
  local.set $1
  i32.const 16
  i32.const 9
  call $~lib/rt/stub/__new
  local.tee $5
  i64.const -1
  i64.store
  local.get $5
  i64.const -1
  i64.store offset=8
  local.get $5
  call $~lib/metashrew-runes/assembly/utils/toArrayBuffer
  local.set $5
  local.get $1
  call $~lib/metashrew-as/assembly/indexer/index/hash
  local.set $6
  global.get $~lib/metashrew-as/assembly/indexer/index/_updates
  local.get $6
  local.get $5
  call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set"
  global.get $~lib/metashrew-as/assembly/indexer/index/_updateKeys
  local.get $6
  local.get $1
  call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set"
  global.get $~lib/metashrew-runes/assembly/indexer/constants/index/OFFSETEND
  local.get $0
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
  local.set $1
  i32.const 8
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.tee $5
  i64.const 210000
  i64.store
  local.get $1
  call $~lib/metashrew-as/assembly/indexer/index/hash
  local.set $6
  global.get $~lib/metashrew-as/assembly/indexer/index/_updates
  local.get $6
  local.get $5
  call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set"
  global.get $~lib/metashrew-as/assembly/indexer/index/_updateKeys
  local.get $6
  local.get $1
  call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set"
  global.get $~lib/metashrew-runes/assembly/indexer/constants/index/SPACERS
  local.get $0
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
  local.set $1
  i32.const 4
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.tee $5
  i32.const 128
  i32.store
  local.get $1
  call $~lib/metashrew-as/assembly/indexer/index/hash
  local.set $6
  global.get $~lib/metashrew-as/assembly/indexer/index/_updates
  local.get $6
  local.get $5
  call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set"
  global.get $~lib/metashrew-as/assembly/indexer/index/_updateKeys
  local.get $6
  local.get $1
  call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set"
  global.get $~lib/metashrew-runes/assembly/indexer/constants/index/SYMBOL
  local.get $0
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
  local.set $1
  i32.const 8524
  i32.load
  i32.const 1
  i32.shr_u
  if (result i32)
   i32.const 8528
   i32.load16_u
  else
   i32.const -1
  end
  local.set $5
  i32.const 1
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.tee $6
  local.get $5
  i32.store8
  local.get $1
  call $~lib/metashrew-as/assembly/indexer/index/hash
  local.set $5
  global.get $~lib/metashrew-as/assembly/indexer/index/_updates
  local.get $5
  local.get $6
  call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set"
  global.get $~lib/metashrew-as/assembly/indexer/index/_updateKeys
  local.get $5
  local.get $1
  call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set"
  global.get $~lib/metashrew-runes/assembly/indexer/constants/index/ETCHINGS
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#extend
  local.tee $1
  call $~lib/metashrew-as/assembly/indexer/index/hash
  local.set $5
  global.get $~lib/metashrew-as/assembly/indexer/index/_updates
  local.get $5
  local.get $0
  call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set"
  global.get $~lib/metashrew-as/assembly/indexer/index/_updateKeys
  local.get $5
  local.get $1
  call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set"
 )
 (func $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#selectValue<u32> (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  i32.const 4
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.tee $2
  local.get $1
  i32.const -16711936
  i32.and
  i32.const 8
  i32.rotl
  local.get $1
  i32.const 16711935
  i32.and
  i32.const 8
  i32.rotr
  i32.or
  i32.store
  local.get $0
  local.get $2
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
 )
 (func $~lib/metashrew-as/assembly/blockdata/block/Block#blockhash (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  local.get $0
  i32.load offset=4
  local.tee $0
  i32.load
  i32.load
  local.set $1
  i32.const 4
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.tee $2
  local.get $1
  i32.store
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.load offset=4
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.tee $3
  local.get $1
  i32.load
  local.get $1
  i32.load offset=4
  memory.copy
  local.get $0
  i32.load offset=8
  local.tee $1
  i32.load offset=4
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.tee $4
  local.get $1
  i32.load
  local.get $1
  i32.load offset=4
  memory.copy
  local.get $0
  i32.load offset=12
  local.set $1
  i32.const 4
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.tee $5
  local.get $1
  i32.store
  local.get $0
  i32.load offset=16
  local.set $1
  i32.const 4
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.tee $6
  local.get $1
  i32.store
  local.get $0
  i32.load offset=20
  local.set $0
  i32.const 4
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.tee $1
  local.get $0
  i32.store
  i32.const 6
  i32.const 2
  i32.const 41
  i32.const 0
  call $~lib/rt/__newArray
  local.tee $0
  i32.load offset=4
  drop
  local.get $0
  i32.const 0
  local.get $2
  call $~lib/array/Array<~lib/string/String>#__set
  local.get $0
  i32.const 1
  local.get $3
  call $~lib/array/Array<~lib/string/String>#__set
  local.get $0
  i32.const 2
  local.get $4
  call $~lib/array/Array<~lib/string/String>#__set
  local.get $0
  i32.const 3
  local.get $5
  call $~lib/array/Array<~lib/string/String>#__set
  local.get $0
  i32.const 4
  local.get $6
  call $~lib/array/Array<~lib/string/String>#__set
  local.get $0
  i32.const 5
  local.get $1
  call $~lib/array/Array<~lib/string/String>#__set
  local.get $0
  i32.const 5664
  call $~lib/array/Array<~lib/arraybuffer/ArrayBuffer>#map<~lib/metashrew-as/assembly/utils/box/Box>
  call $~lib/metashrew-as/assembly/utils/box/Box.concat
  call $~lib/fast-sha256-as/assembly/sha256/sha256
  call $~lib/fast-sha256-as/assembly/sha256/sha256
  call $~lib/metashrew-as/assembly/utils/utils/reverse
 )
 (func $~lib/metashrew-runes/assembly/indexer/RunesTransaction/RunesTransaction#runestoneOutputIndex (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  loop $for-loop|0
   local.get $1
   local.get $0
   i32.load offset=16
   local.tee $2
   i32.load offset=12
   i32.lt_s
   if
    local.get $2
    local.get $1
    call $~lib/array/Array<~lib/array/Array<u8>>#__get
    i32.load offset=16
    i32.load
    i32.load16_u
    i32.const 23914
    i32.eq
    if
     local.get $1
     return
    end
    local.get $1
    i32.const 1
    i32.add
    local.set $1
    br $for-loop|0
   end
  end
  i32.const -1
 )
 (func $~lib/metashrew-runes/assembly/indexer/RunesTransaction/RunesTransaction#runestone~anonymous|0 (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  local.get $0
  i32.load
  i32.const -1
  i32.eq
 )
 (func $~lib/metashrew-runes/assembly/indexer/RunesTransaction/RunesTransaction#defaultOutput (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  loop $for-loop|0
   local.get $1
   local.get $0
   i32.load offset=16
   local.tee $2
   i32.load offset=12
   i32.lt_s
   if
    local.get $2
    local.get $1
    call $~lib/array/Array<~lib/array/Array<u8>>#__get
    i32.load offset=16
    i32.load
    i32.load8_u
    i32.const 106
    i32.ne
    if
     local.get $1
     return
    end
    local.get $1
    i32.const 1
    i32.add
    local.set $1
    br $for-loop|0
   end
  end
  i32.const -1
 )
 (func $"~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#constructor" (result i32)
  (local $0 i32)
  i32.const 24
  i32.const 67
  call $~lib/rt/stub/__new
  local.tee $0
  i32.const 16
  call $~lib/arraybuffer/ArrayBuffer#constructor
  i32.store
  local.get $0
  i32.const 3
  i32.store offset=4
  local.get $0
  i32.const 64
  call $~lib/arraybuffer/ArrayBuffer#constructor
  i32.store offset=8
  local.get $0
  i32.const 4
  i32.store offset=12
  local.get $0
  i32.const 0
  i32.store offset=16
  local.get $0
  i32.const 0
  i32.store offset=20
  local.get $0
 )
 (func $~lib/array/Array<~lib/staticarray/StaticArray<~lib/as-bignum/assembly/integer/u128/u128>>#constructor (result i32)
  (local $0 i32)
  (local $1 i32)
  i32.const 16
  i32.const 69
  call $~lib/rt/stub/__new
  local.tee $0
  i32.const 0
  i32.store
  local.get $0
  i32.const 0
  i32.store offset=4
  local.get $0
  i32.const 0
  i32.store offset=8
  local.get $0
  i32.const 0
  i32.store offset=12
  i32.const 32
  i32.const 1
  call $~lib/rt/stub/__new
  local.tee $1
  i32.const 0
  i32.const 32
  memory.fill
  local.get $0
  local.get $1
  i32.store
  local.get $0
  local.get $1
  i32.store offset=4
  local.get $0
  i32.const 32
  i32.store offset=8
  local.get $0
  i32.const 0
  i32.store offset=12
  local.get $0
 )
 (func $~lib/metashrew-runes/assembly/leb128/readULEB128ToU128 (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i64)
  (local $5 i32)
  (local $6 i32)
  (local $7 i64)
  (local $8 i64)
  (local $9 i32)
  (local $10 i64)
  (local $11 i64)
  local.get $0
  i32.load
  local.get $0
  i32.load offset=4
  call $~lib/metashrew-as/assembly/utils/box/Box#constructor
  local.set $2
  i32.const 16
  i32.const 9
  call $~lib/rt/stub/__new
  local.tee $3
  i64.const 0
  i64.store
  local.get $3
  i64.const 0
  i64.store offset=8
  local.get $2
  i32.load offset=4
  i32.eqz
  if
   i32.const 0
   return
  end
  loop $while-continue|0
   local.get $2
   i32.load
   i32.load8_u
   local.set $5
   local.get $2
   i32.load offset=4
   i32.eqz
   if
    i32.const -1
    return
   end
   local.get $2
   local.get $2
   i32.load
   i32.const 1
   i32.add
   i32.store
   local.get $2
   local.get $2
   i32.load offset=4
   i32.const 1
   i32.sub
   i32.store offset=4
   local.get $6
   i32.const 127
   i32.and
   i64.extend_i32_s
   local.tee $4
   i64.const 6
   i64.shr_u
   i64.const 1
   i64.sub
   local.set $7
   i32.const 16
   i32.const 9
   call $~lib/rt/stub/__new
   local.tee $9
   local.get $5
   i32.const 127
   i32.and
   i64.extend_i32_s
   local.tee $8
   i64.store
   local.get $9
   local.get $8
   i64.const 63
   i64.shr_u
   i64.store offset=8
   local.get $9
   i64.load
   local.tee $10
   local.get $4
   i64.const 63
   i64.and
   local.tee $8
   i64.shl
   local.tee $11
   local.get $7
   i64.const -1
   i64.xor
   i64.and
   local.get $4
   local.get $4
   i64.const 127
   i64.add
   i64.or
   i64.const 64
   i64.and
   i64.const 6
   i64.shr_u
   i64.const 1
   i64.sub
   local.get $10
   i64.const 64
   local.get $8
   i64.sub
   i64.shr_u
   i64.and
   local.get $9
   i64.load offset=8
   local.get $8
   i64.shl
   i64.or
   local.get $7
   i64.and
   i64.or
   local.set $4
   i32.const 16
   i32.const 9
   call $~lib/rt/stub/__new
   local.tee $9
   local.get $7
   local.get $11
   i64.and
   i64.store
   local.get $9
   local.get $4
   i64.store offset=8
   local.get $3
   i64.load
   local.get $9
   i64.load
   i64.or
   local.set $4
   local.get $3
   i64.load offset=8
   local.get $9
   i64.load offset=8
   i64.or
   local.set $7
   i32.const 16
   i32.const 9
   call $~lib/rt/stub/__new
   local.tee $3
   local.get $4
   i64.store
   local.get $3
   local.get $7
   i64.store offset=8
   local.get $5
   i32.const 128
   i32.and
   if
    local.get $6
    i32.const 7
    i32.add
    local.set $6
    br $while-continue|0
   end
  end
  local.get $1
  local.get $3
  i64.load offset=8
  i64.store offset=8
  local.get $1
  local.get $3
  i64.load
  i64.store
  local.get $2
  i32.load
  local.get $0
  i32.load
  i32.sub
 )
 (func $~lib/staticarray/StaticArray<~lib/as-bignum/assembly/integer/u128/u128>#__set (param $0 i32) (param $1 i32) (param $2 i32)
  local.get $1
  local.get $0
  i32.const 20
  i32.sub
  i32.load offset=16
  i32.const 2
  i32.shr_u
  i32.ge_u
  if
   i32.const 3344
   i32.const 3408
   i32.const 93
   i32.const 41
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  local.get $1
  i32.const 2
  i32.shl
  i32.add
  local.get $2
  i32.store
 )
 (func $~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>#constructor (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  i32.const 16
  i32.const 59
  call $~lib/rt/stub/__new
  local.tee $1
  i32.const 0
  i32.store
  local.get $1
  i32.const 0
  i32.store offset=4
  local.get $1
  i32.const 0
  i32.store offset=8
  local.get $1
  i32.const 0
  i32.store offset=12
  local.get $0
  i32.const 268435455
  i32.gt_u
  if
   i32.const 2608
   i32.const 5344
   i32.const 70
   i32.const 60
   call $~lib/builtins/abort
   unreachable
  end
  i32.const 8
  local.get $0
  local.get $0
  i32.const 8
  i32.le_u
  select
  i32.const 2
  i32.shl
  local.tee $2
  i32.const 1
  call $~lib/rt/stub/__new
  local.tee $3
  i32.const 0
  local.get $2
  memory.fill
  local.get $1
  local.get $3
  i32.store
  local.get $1
  local.get $3
  i32.store offset=4
  local.get $1
  local.get $2
  i32.store offset=8
  local.get $1
  local.get $0
  i32.store offset=12
  local.get $1
 )
 (func $"~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#set" (param $0 i32) (param $1 i64) (param $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i64)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (local $12 i32)
  local.get $0
  i32.load
  local.get $1
  i32.wrap_i64
  i32.const -1028477379
  i32.mul
  i32.const 374761401
  i32.add
  i32.const 17
  i32.rotl
  i32.const 668265263
  i32.mul
  local.get $1
  i64.const 32
  i64.shr_u
  i32.wrap_i64
  i32.const -1028477379
  i32.mul
  i32.add
  i32.const 17
  i32.rotl
  i32.const 668265263
  i32.mul
  local.tee $3
  i32.const 15
  i32.shr_u
  local.get $3
  i32.xor
  i32.const -2048144777
  i32.mul
  local.tee $3
  i32.const 13
  i32.shr_u
  local.get $3
  i32.xor
  i32.const -1028477379
  i32.mul
  local.tee $3
  i32.const 16
  i32.shr_u
  local.get $3
  i32.xor
  local.tee $7
  local.get $0
  i32.load offset=4
  i32.and
  i32.const 2
  i32.shl
  i32.add
  i32.load
  local.set $3
  block $"__inlined_func$~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#find$3118"
   loop $while-continue|0
    local.get $3
    if
     local.get $3
     i32.load offset=12
     local.tee $4
     i32.const 1
     i32.and
     if (result i32)
      i32.const 0
     else
      local.get $3
      i64.load
      local.get $1
      i64.eq
     end
     br_if $"__inlined_func$~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#find$3118"
     local.get $4
     i32.const -2
     i32.and
     local.set $3
     br $while-continue|0
    end
   end
   i32.const 0
   local.set $3
  end
  local.get $3
  if
   local.get $3
   local.get $2
   i32.store offset=8
  else
   local.get $0
   i32.load offset=12
   local.tee $3
   local.get $0
   i32.load offset=16
   i32.eq
   if
    local.get $0
    i32.load offset=20
    local.get $3
    i32.const 3
    i32.mul
    i32.const 4
    i32.div_s
    i32.lt_s
    if (result i32)
     local.get $0
     i32.load offset=4
    else
     local.get $0
     i32.load offset=4
     i32.const 1
     i32.shl
     i32.const 1
     i32.or
    end
    local.tee $10
    i32.const 1
    i32.add
    local.tee $3
    i32.const 2
    i32.shl
    call $~lib/arraybuffer/ArrayBuffer#constructor
    local.set $9
    local.get $3
    i32.const 3
    i32.shl
    i32.const 3
    i32.div_s
    local.tee $6
    i32.const 4
    i32.shl
    call $~lib/arraybuffer/ArrayBuffer#constructor
    local.set $4
    local.get $0
    i32.load offset=8
    local.tee $11
    local.get $0
    i32.load offset=16
    i32.const 4
    i32.shl
    i32.add
    local.set $5
    local.get $4
    local.set $3
    loop $while-continue|00
     local.get $5
     local.get $11
     i32.ne
     if
      local.get $11
      i32.load offset=12
      i32.const 1
      i32.and
      i32.eqz
      if
       local.get $3
       local.get $11
       i64.load
       local.tee $8
       i64.store
       local.get $3
       local.get $11
       i32.load offset=8
       i32.store offset=8
       local.get $3
       local.get $9
       local.get $10
       local.get $8
       i32.wrap_i64
       i32.const -1028477379
       i32.mul
       i32.const 374761401
       i32.add
       i32.const 17
       i32.rotl
       i32.const 668265263
       i32.mul
       local.get $8
       i64.const 32
       i64.shr_u
       i32.wrap_i64
       i32.const -1028477379
       i32.mul
       i32.add
       i32.const 17
       i32.rotl
       i32.const 668265263
       i32.mul
       local.tee $12
       i32.const 15
       i32.shr_u
       local.get $12
       i32.xor
       i32.const -2048144777
       i32.mul
       local.tee $12
       i32.const 13
       i32.shr_u
       local.get $12
       i32.xor
       i32.const -1028477379
       i32.mul
       local.tee $12
       i32.const 16
       i32.shr_u
       local.get $12
       i32.xor
       i32.and
       i32.const 2
       i32.shl
       i32.add
       local.tee $12
       i32.load
       i32.store offset=12
       local.get $12
       local.get $3
       i32.store
       local.get $3
       i32.const 16
       i32.add
       local.set $3
      end
      local.get $11
      i32.const 16
      i32.add
      local.set $11
      br $while-continue|00
     end
    end
    local.get $0
    local.get $9
    i32.store
    local.get $0
    local.get $10
    i32.store offset=4
    local.get $0
    local.get $4
    i32.store offset=8
    local.get $0
    local.get $6
    i32.store offset=12
    local.get $0
    local.get $0
    i32.load offset=20
    i32.store offset=16
   end
   local.get $0
   i32.load offset=8
   local.set $3
   local.get $0
   local.get $0
   i32.load offset=16
   local.tee $4
   i32.const 1
   i32.add
   i32.store offset=16
   local.get $3
   local.get $4
   i32.const 4
   i32.shl
   i32.add
   local.tee $3
   local.get $1
   i64.store
   local.get $3
   local.get $2
   i32.store offset=8
   local.get $0
   local.get $0
   i32.load offset=20
   i32.const 1
   i32.add
   i32.store offset=20
   local.get $3
   local.get $0
   i32.load
   local.get $7
   local.get $0
   i32.load offset=4
   i32.and
   i32.const 2
   i32.shl
   i32.add
   local.tee $0
   i32.load
   i32.store offset=12
   local.get $0
   local.get $3
   i32.store
  end
 )
 (func $"~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#get" (param $0 i32) (param $1 i64) (result i32)
  (local $2 i32)
  local.get $0
  i32.load
  local.get $0
  i32.load offset=4
  local.get $1
  i32.wrap_i64
  i32.const -1028477379
  i32.mul
  i32.const 374761401
  i32.add
  i32.const 17
  i32.rotl
  i32.const 668265263
  i32.mul
  local.get $1
  i64.const 32
  i64.shr_u
  i32.wrap_i64
  i32.const -1028477379
  i32.mul
  i32.add
  i32.const 17
  i32.rotl
  i32.const 668265263
  i32.mul
  local.tee $0
  i32.const 15
  i32.shr_u
  local.get $0
  i32.xor
  i32.const -2048144777
  i32.mul
  local.tee $0
  i32.const 13
  i32.shr_u
  local.get $0
  i32.xor
  i32.const -1028477379
  i32.mul
  local.tee $0
  i32.const 16
  i32.shr_u
  local.get $0
  i32.xor
  i32.and
  i32.const 2
  i32.shl
  i32.add
  i32.load
  local.set $0
  block $"__inlined_func$~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#find$3119"
   loop $while-continue|0
    local.get $0
    if
     local.get $0
     i32.load offset=12
     local.tee $2
     i32.const 1
     i32.and
     if (result i32)
      i32.const 0
     else
      local.get $0
      i64.load
      local.get $1
      i64.eq
     end
     br_if $"__inlined_func$~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#find$3119"
     local.get $2
     i32.const -2
     i32.and
     local.set $0
     br $while-continue|0
    end
   end
   i32.const 0
   local.set $0
  end
  local.get $0
  i32.eqz
  if
   i32.const 5392
   i32.const 5456
   i32.const 105
   i32.const 17
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  i32.load offset=8
 )
 (func $~lib/metashrew-runes/assembly/indexer/RunestoneMessage/RunestoneMessage#constructor (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (result i32)
  local.get $0
  i32.eqz
  if
   i32.const 12
   i32.const 66
   call $~lib/rt/stub/__new
   local.set $0
  end
  local.get $0
  i32.const 0
  i32.store
  local.get $0
  i32.const 0
  i32.store offset=4
  local.get $0
  i32.const 0
  i32.store offset=8
  local.get $0
  local.get $1
  i32.store
  local.get $0
  local.get $2
  i32.store offset=4
  local.get $0
  i32.load
  local.tee $1
  i32.load
  local.get $1
  i32.load offset=4
  i32.const 857269166
  i32.and
  i32.const 2
  i32.shl
  i32.add
  i32.load
  local.set $1
  block $"__inlined_func$~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#find$3124"
   loop $while-continue|0
    local.get $1
    if
     local.get $1
     i32.load offset=12
     local.tee $2
     i32.const 1
     i32.and
     if (result i32)
      i32.const 0
     else
      local.get $1
      i64.load
      i64.const 22
      i64.eq
     end
     br_if $"__inlined_func$~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#find$3124"
     local.get $2
     i32.const -2
     i32.and
     local.set $1
     br $while-continue|0
    end
   end
   i32.const 0
   local.set $1
  end
  local.get $0
  local.get $1
  if (result i32)
   local.get $0
   i32.load
   i64.const 22
   call $"~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#get"
   i32.const 0
   call $~lib/array/Array<~lib/array/Array<u8>>#__get
   i64.load
   i32.wrap_i64
  else
   local.get $3
  end
  i32.store offset=8
  local.get $0
 )
 (func $~lib/metashrew-runes/assembly/indexer/RunestoneMessage/RunestoneMessage.parse (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i64)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  local.get $0
  local.get $0
  i32.const 20
  i32.sub
  i32.load offset=16
  call $~lib/metashrew-as/assembly/utils/box/Box#constructor
  local.set $2
  call $"~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#constructor"
  local.set $4
  call $~lib/array/Array<~lib/staticarray/StaticArray<~lib/as-bignum/assembly/integer/u128/u128>>#constructor
  local.set $5
  loop $while-continue|0
   local.get $2
   i32.load offset=4
   if
    i32.const 16
    i32.const 9
    call $~lib/rt/stub/__new
    local.tee $0
    i64.const 0
    i64.store
    local.get $0
    i64.const 0
    i64.store offset=8
    local.get $2
    local.get $0
    call $~lib/metashrew-runes/assembly/leb128/readULEB128ToU128
    local.tee $6
    i32.const 18
    i32.gt_u
    if
     i32.const 0
     return
    end
    local.get $2
    local.get $6
    local.get $2
    i32.load
    i32.add
    i32.store
    local.get $2
    local.get $2
    i32.load offset=4
    local.get $6
    i32.sub
    i32.store offset=4
    i64.const 1
    local.get $0
    i64.load
    local.tee $3
    i64.const 1
    i64.and
    local.get $3
    i64.const 22
    i64.le_u
    select
    i64.eqz
    if
     i32.const 0
     return
    end
    local.get $3
    i64.eqz
    if
     loop $while-continue|1
      local.get $2
      i32.load offset=4
      if
       i32.const 16
       i32.const 68
       call $~lib/rt/stub/__new
       local.tee $7
       i64.const 0
       i64.store align=1
       local.get $7
       i64.const 0
       i64.store offset=8 align=1
       i32.const 0
       local.set $0
       loop $for-loop|2
        local.get $0
        i32.const 4
        i32.lt_s
        if
         i32.const 16
         i32.const 9
         call $~lib/rt/stub/__new
         local.tee $6
         i64.const 0
         i64.store
         local.get $6
         i64.const 0
         i64.store offset=8
         local.get $2
         local.get $6
         call $~lib/metashrew-runes/assembly/leb128/readULEB128ToU128
         local.tee $8
         i32.const 18
         i32.gt_u
         if
          i32.const 0
          return
         end
         local.get $2
         local.get $8
         local.get $2
         i32.load
         i32.add
         i32.store
         local.get $2
         local.get $2
         i32.load offset=4
         local.get $8
         i32.sub
         i32.store offset=4
         local.get $7
         local.get $0
         local.get $6
         call $~lib/staticarray/StaticArray<~lib/as-bignum/assembly/integer/u128/u128>#__set
         local.get $0
         i32.const 1
         i32.add
         local.set $0
         br $for-loop|2
        end
       end
       local.get $5
       local.get $7
       call $~lib/array/Array<~lib/array/Array<u8>>#push
       drop
       br $while-continue|1
      end
     end
    else
     i32.const 16
     i32.const 9
     call $~lib/rt/stub/__new
     local.tee $6
     i64.const 0
     i64.store
     local.get $6
     i64.const 0
     i64.store offset=8
     local.get $2
     local.get $6
     call $~lib/metashrew-runes/assembly/leb128/readULEB128ToU128
     local.tee $0
     i32.const 18
     i32.gt_u
     if
      i32.const 0
      return
     end
     local.get $2
     local.get $0
     local.get $2
     i32.load
     i32.add
     i32.store
     local.get $2
     local.get $2
     i32.load offset=4
     local.get $0
     i32.sub
     i32.store offset=4
     local.get $4
     i32.load
     local.get $4
     i32.load offset=4
     local.get $3
     i32.wrap_i64
     i32.const -1028477379
     i32.mul
     i32.const 374761401
     i32.add
     i32.const 17
     i32.rotl
     i32.const 668265263
     i32.mul
     local.get $3
     i64.const 32
     i64.shr_u
     i32.wrap_i64
     i32.const -1028477379
     i32.mul
     i32.add
     i32.const 17
     i32.rotl
     i32.const 668265263
     i32.mul
     local.tee $0
     local.get $0
     i32.const 15
     i32.shr_u
     i32.xor
     i32.const -2048144777
     i32.mul
     local.tee $0
     local.get $0
     i32.const 13
     i32.shr_u
     i32.xor
     i32.const -1028477379
     i32.mul
     local.tee $0
     local.get $0
     i32.const 16
     i32.shr_u
     i32.xor
     i32.and
     i32.const 2
     i32.shl
     i32.add
     i32.load
     local.set $0
     block $"__inlined_func$~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#find$3130"
      loop $while-continue|01
       local.get $0
       if
        local.get $0
        i32.load offset=12
        local.tee $7
        i32.const 1
        i32.and
        if (result i32)
         i32.const 0
        else
         local.get $3
         local.get $0
         i64.load
         i64.eq
        end
        br_if $"__inlined_func$~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#find$3130"
        local.get $7
        i32.const -2
        i32.and
        local.set $0
        br $while-continue|01
       end
      end
      i32.const 0
      local.set $0
     end
     local.get $0
     if
      local.get $4
      local.get $3
      call $"~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#get"
      local.set $0
     else
      local.get $4
      local.get $3
      i32.const 0
      call $~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>#constructor
      local.tee $0
      call $"~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#set"
     end
     local.get $0
     local.get $6
     call $~lib/array/Array<~lib/array/Array<u8>>#push
     drop
    end
    br $while-continue|0
   end
  end
  i32.const 0
  local.get $4
  local.get $5
  local.get $1
  call $~lib/metashrew-runes/assembly/indexer/RunestoneMessage/RunestoneMessage#constructor
 )
 (func $~lib/metashrew-runes/assembly/indexer/RunesTransaction/RunesTransaction#runestone (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  local.get $0
  call $~lib/metashrew-runes/assembly/indexer/RunesTransaction/RunesTransaction#runestoneOutputIndex
  local.tee $1
  i32.const -1
  i32.ne
  if
   local.get $0
   i32.load offset=16
   local.get $1
   call $~lib/array/Array<~lib/array/Array<u8>>#__get
   i32.load offset=16
   local.set $1
   i32.const 0
   call $~lib/array/Array<~lib/metashrew-as/assembly/utils/box/Box>#constructor
   local.set $4
   local.get $1
   i32.load
   local.get $1
   i32.load offset=4
   call $~lib/metashrew-as/assembly/utils/box/Box#constructor
   local.set $5
   loop $while-continue|0
    local.get $5
    i32.load offset=4
    if
     local.get $5
     i32.load
     local.tee $6
     i32.load8_u
     local.set $1
     local.get $5
     local.get $6
     i32.const 1
     i32.add
     i32.store
     local.get $5
     local.get $5
     i32.load offset=4
     i32.const 1
     i32.sub
     i32.store offset=4
     i32.const -1
     local.get $1
     call $~lib/metashrew-as/assembly/utils/box/Box#constructor
     local.set $6
     local.get $1
     i32.const 78
     i32.le_u
     i32.const 0
     local.get $1
     select
     if
      block $break|1
       block $case2|1
        block $case1|1
         block $case0|1
          local.get $1
          i32.const 76
          i32.sub
          br_table $case0|1 $case1|1 $case2|1 $break|1
         end
         local.get $5
         i32.load
         local.tee $6
         i32.load8_u
         local.set $1
         local.get $5
         local.get $6
         i32.const 1
         i32.add
         i32.store
         local.get $5
         local.get $5
         i32.load offset=4
         i32.const 1
         i32.sub
         i32.store offset=4
         br $break|1
        end
        local.get $5
        i32.load
        local.tee $6
        i32.load16_u
        local.set $1
        local.get $5
        local.get $6
        i32.const 2
        i32.add
        i32.store
        local.get $5
        local.get $5
        i32.load offset=4
        i32.const 2
        i32.sub
        i32.store offset=4
        br $break|1
       end
       local.get $5
       i32.load
       local.tee $6
       i32.load
       local.set $1
       local.get $5
       local.get $6
       i32.const 4
       i32.add
       i32.store
       local.get $5
       local.get $5
       i32.load offset=4
       i32.const 4
       i32.sub
       i32.store offset=4
      end
      local.get $4
      local.get $5
      local.get $1
      call $~lib/metashrew-as/assembly/utils/utils/parseBytes
      call $~lib/array/Array<~lib/array/Array<u8>>#push
      drop
     else
      local.get $4
      local.get $6
      call $~lib/array/Array<~lib/array/Array<u8>>#push
      drop
     end
     br $while-continue|0
    end
   end
   i32.const 1
   global.set $~argumentsLength
   local.get $4
   i32.load offset=12
   local.tee $1
   i32.const 2
   local.get $1
   local.get $1
   i32.const 2
   i32.gt_s
   select
   local.tee $5
   i32.sub
   local.tee $1
   i32.const 0
   local.get $1
   i32.const 0
   i32.gt_s
   select
   local.tee $1
   i32.const 2
   i32.const 36
   i32.const 0
   call $~lib/rt/__newArray
   local.tee $6
   i32.load offset=4
   local.set $7
   local.get $4
   i32.load offset=4
   local.get $5
   i32.const 2
   i32.shl
   i32.add
   local.set $4
   local.get $1
   i32.const 2
   i32.shl
   local.set $1
   loop $while-continue|01
    local.get $1
    local.get $2
    i32.gt_u
    if
     local.get $2
     local.get $7
     i32.add
     local.get $2
     local.get $4
     i32.add
     i32.load
     i32.store
     local.get $2
     i32.const 4
     i32.add
     local.set $2
     br $while-continue|01
    end
   end
   local.get $6
   i32.load offset=12
   local.set $1
   block $__inlined_func$~lib/array/Array<~lib/metashrew-as/assembly/utils/box/Box>#findIndex$3133
    loop $for-loop|0
     local.get $3
     local.get $1
     local.get $6
     i32.load offset=12
     local.tee $2
     local.get $1
     local.get $2
     i32.lt_s
     select
     i32.lt_s
     if
      local.get $6
      i32.load offset=4
      local.get $3
      i32.const 2
      i32.shl
      i32.add
      i32.load
      local.set $2
      i32.const 3
      global.set $~argumentsLength
      local.get $2
      local.get $3
      local.get $6
      i32.const 8560
      i32.load
      call_indirect (type $2)
      br_if $__inlined_func$~lib/array/Array<~lib/metashrew-as/assembly/utils/box/Box>#findIndex$3133
      local.get $3
      i32.const 1
      i32.add
      local.set $3
      br $for-loop|0
     end
    end
    i32.const -1
    local.set $3
   end
   local.get $3
   i32.const -1
   i32.ne
   if
    i32.const 0
    return
   end
   local.get $6
   call $~lib/metashrew-as/assembly/utils/box/Box.concat
   local.get $0
   call $~lib/metashrew-runes/assembly/indexer/RunesTransaction/RunesTransaction#defaultOutput
   call $~lib/metashrew-runes/assembly/indexer/RunestoneMessage/RunestoneMessage.parse
   local.tee $0
   i32.eqz
   if
    i32.const 0
    return
   end
   local.get $0
   return
  end
  i32.const 0
 )
 (func $"~lib/map/Map<~lib/string/String,i32>#constructor" (result i32)
  (local $0 i32)
  i32.const 24
  i32.const 60
  call $~lib/rt/stub/__new
  local.tee $0
  i32.const 16
  call $~lib/arraybuffer/ArrayBuffer#constructor
  i32.store
  local.get $0
  i32.const 3
  i32.store offset=4
  local.get $0
  i32.const 48
  call $~lib/arraybuffer/ArrayBuffer#constructor
  i32.store offset=8
  local.get $0
  i32.const 4
  i32.store offset=12
  local.get $0
  i32.const 0
  i32.store offset=16
  local.get $0
  i32.const 0
  i32.store offset=20
  local.get $0
 )
 (func $~lib/array/Array<~lib/arraybuffer/ArrayBuffer>#constructor (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  i32.const 16
  i32.const 41
  call $~lib/rt/stub/__new
  local.tee $1
  i32.const 0
  i32.store
  local.get $1
  i32.const 0
  i32.store offset=4
  local.get $1
  i32.const 0
  i32.store offset=8
  local.get $1
  i32.const 0
  i32.store offset=12
  local.get $0
  i32.const 268435455
  i32.gt_u
  if
   i32.const 2608
   i32.const 5344
   i32.const 70
   i32.const 60
   call $~lib/builtins/abort
   unreachable
  end
  i32.const 8
  local.get $0
  local.get $0
  i32.const 8
  i32.le_u
  select
  i32.const 2
  i32.shl
  local.tee $2
  i32.const 1
  call $~lib/rt/stub/__new
  local.tee $3
  i32.const 0
  local.get $2
  memory.fill
  local.get $1
  local.get $3
  i32.store
  local.get $1
  local.get $3
  i32.store offset=4
  local.get $1
  local.get $2
  i32.store offset=8
  local.get $1
  local.get $0
  i32.store offset=12
  local.get $1
 )
 (func $~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet#constructor (param $0 i32) (result i32)
  local.get $0
  i32.eqz
  if
   i32.const 12
   i32.const 58
   call $~lib/rt/stub/__new
   local.set $0
  end
  local.get $0
  i32.const 0
  i32.store
  local.get $0
  i32.const 0
  i32.store offset=4
  local.get $0
  i32.const 0
  i32.store offset=8
  local.get $0
  call $"~lib/map/Map<~lib/string/String,i32>#constructor"
  i32.store offset=8
  local.get $0
  i32.const 0
  call $~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>#constructor
  i32.store offset=4
  local.get $0
  i32.const 0
  call $~lib/array/Array<~lib/arraybuffer/ArrayBuffer>#constructor
  i32.store
  local.get $0
 )
 (func $~lib/metashrew-runes/assembly/utils/fromArrayBuffer (param $0 i32) (result i32)
  (local $1 i64)
  (local $2 i64)
  (local $3 i32)
  local.get $0
  i32.const 20
  i32.sub
  i32.load offset=16
  i32.eqz
  if
   i32.const 16
   i32.const 9
   call $~lib/rt/stub/__new
   local.tee $0
   i64.const 0
   i64.store
   local.get $0
   i64.const 0
   i64.store offset=8
   local.get $0
   return
  end
  i32.const 1
  global.set $~argumentsLength
  local.get $0
  call $~lib/typedarray/Uint8Array.wrap@varargs
  local.tee $3
  i32.load offset=8
  local.tee $0
  if (result i32)
   local.get $0
   i32.const 15
   i32.and
  else
   i32.const 1
  end
  if
   i32.const 0
   i32.const 8304
   i32.const 132
   i32.const 5
   call $~lib/builtins/abort
   unreachable
  end
  local.get $3
  i32.load offset=4
  local.tee $0
  i64.load
  local.set $1
  local.get $0
  i64.load offset=8
  local.set $2
  i32.const 16
  i32.const 9
  call $~lib/rt/stub/__new
  local.tee $0
  local.get $1
  i64.store
  local.get $0
  local.get $2
  i64.store offset=8
  local.get $0
 )
 (func $"~lib/map/Map<~lib/string/String,i32>#get" (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  local.get $1
  local.get $1
  call $~lib/util/hash/HASH<~lib/string/String>
  call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#find"
  local.tee $0
  i32.eqz
  if
   i32.const 5392
   i32.const 5456
   i32.const 105
   i32.const 17
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  i32.load offset=4
 )
 (func $"~lib/map/Map<~lib/string/String,i32>#set" (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  local.get $0
  local.get $1
  local.get $1
  call $~lib/util/hash/HASH<~lib/string/String>
  local.tee $7
  call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#find"
  local.tee $3
  if
   local.get $3
   local.get $2
   i32.store offset=4
  else
   local.get $0
   i32.load offset=12
   local.tee $3
   local.get $0
   i32.load offset=16
   i32.eq
   if
    local.get $0
    i32.load offset=20
    local.get $3
    i32.const 3
    i32.mul
    i32.const 4
    i32.div_s
    i32.lt_s
    if (result i32)
     local.get $0
     i32.load offset=4
    else
     local.get $0
     i32.load offset=4
     i32.const 1
     i32.shl
     i32.const 1
     i32.or
    end
    local.tee $9
    i32.const 1
    i32.add
    local.tee $3
    i32.const 2
    i32.shl
    call $~lib/arraybuffer/ArrayBuffer#constructor
    local.set $8
    local.get $3
    i32.const 3
    i32.shl
    i32.const 3
    i32.div_s
    local.tee $6
    i32.const 12
    i32.mul
    call $~lib/arraybuffer/ArrayBuffer#constructor
    local.set $4
    local.get $0
    i32.load offset=8
    local.tee $10
    local.get $0
    i32.load offset=16
    i32.const 12
    i32.mul
    i32.add
    local.set $5
    local.get $4
    local.set $3
    loop $while-continue|0
     local.get $5
     local.get $10
     i32.ne
     if
      local.get $10
      i32.load offset=8
      i32.const 1
      i32.and
      i32.eqz
      if
       local.get $3
       local.get $10
       i32.load
       local.tee $11
       i32.store
       local.get $3
       local.get $10
       i32.load offset=4
       i32.store offset=4
       local.get $3
       local.get $8
       local.get $11
       call $~lib/util/hash/HASH<~lib/string/String>
       local.get $9
       i32.and
       i32.const 2
       i32.shl
       i32.add
       local.tee $11
       i32.load
       i32.store offset=8
       local.get $11
       local.get $3
       i32.store
       local.get $3
       i32.const 12
       i32.add
       local.set $3
      end
      local.get $10
      i32.const 12
      i32.add
      local.set $10
      br $while-continue|0
     end
    end
    local.get $0
    local.get $8
    i32.store
    local.get $0
    local.get $9
    i32.store offset=4
    local.get $0
    local.get $4
    i32.store offset=8
    local.get $0
    local.get $6
    i32.store offset=12
    local.get $0
    local.get $0
    i32.load offset=20
    i32.store offset=16
   end
   local.get $0
   i32.load offset=8
   local.set $3
   local.get $0
   local.get $0
   i32.load offset=16
   local.tee $4
   i32.const 1
   i32.add
   i32.store offset=16
   local.get $3
   local.get $4
   i32.const 12
   i32.mul
   i32.add
   local.tee $3
   local.get $1
   i32.store
   local.get $3
   local.get $2
   i32.store offset=4
   local.get $0
   local.get $0
   i32.load offset=20
   i32.const 1
   i32.add
   i32.store offset=20
   local.get $3
   local.get $0
   i32.load
   local.get $7
   local.get $0
   i32.load offset=4
   i32.and
   i32.const 2
   i32.shl
   i32.add
   local.tee $0
   i32.load
   i32.store offset=8
   local.get $0
   local.get $3
   i32.store
  end
 )
 (func $~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet#set (param $0 i32) (param $1 i32) (param $2 i32)
  local.get $0
  i32.load offset=8
  local.get $1
  local.get $1
  call $~lib/util/hash/HASH<~lib/string/String>
  call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#find"
  if
   block $~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet#getIndex|inlined.0 (result i32)
    local.get $0
    i32.load offset=8
    local.get $1
    local.get $1
    call $~lib/util/hash/HASH<~lib/string/String>
    call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#find"
    if
     local.get $0
     i32.load offset=8
     local.get $1
     call $"~lib/map/Map<~lib/string/String,i32>#get"
     br $~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet#getIndex|inlined.0
    end
    i32.const -1
   end
   local.set $1
   local.get $0
   i32.load offset=4
   local.get $1
   local.get $2
   call $~lib/array/Array<~lib/string/String>#__set
  else
   local.get $0
   i32.load offset=8
   local.get $1
   local.get $0
   i32.load
   i32.load offset=12
   call $"~lib/map/Map<~lib/string/String,i32>#set"
   local.get $0
   i32.load
   local.get $1
   call $~lib/array/Array<~lib/array/Array<u8>>#push
   drop
   local.get $0
   i32.load offset=4
   local.get $2
   call $~lib/array/Array<~lib/array/Array<u8>>#push
   drop
  end
 )
 (func $~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet.load (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  i32.const 1
  global.set $~argumentsLength
  local.get $0
  i32.const 8592
  i32.const 0
  call $~lib/string/String.UTF8.encode@varargs
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
  local.set $2
  i32.const 1
  global.set $~argumentsLength
  local.get $0
  i32.const 8624
  i32.const 0
  call $~lib/string/String.UTF8.encode@varargs
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
  local.set $4
  i32.const 1
  global.set $~argumentsLength
  local.get $2
  i32.const 6304
  i32.const 0
  call $~lib/string/String.UTF8.encode@varargs
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#getValue<u32>
  local.set $0
  i32.const 0
  call $~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet#constructor
  local.set $3
  loop $for-loop|0
   local.get $0
   local.get $1
   i32.gt_u
   if
    local.get $3
    local.get $2
    local.get $1
    call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#selectIndex
    call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#get
    local.get $4
    local.get $1
    call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#selectIndex
    call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#get
    call $~lib/metashrew-runes/assembly/utils/fromArrayBuffer
    call $~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet#set
    local.get $1
    i32.const 1
    i32.add
    local.set $1
    br $for-loop|0
   end
  end
  local.get $3
 )
 (func $~lib/metashrew-runes/assembly/indexer/RunestoneMessage/RunestoneMessage#loadBalanceSheet~anonymous|0 (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i32)
  global.get $~lib/metashrew-runes/assembly/indexer/constants/index/OUTPOINT_TO_RUNES
  local.set $2
  local.get $0
  i32.load offset=4
  i32.load
  i32.const 32
  call $~lib/metashrew-as/assembly/utils/box/Box#constructor
  local.tee $1
  i32.load offset=4
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.tee $3
  local.get $1
  i32.load
  local.get $1
  i32.load offset=4
  memory.copy
  local.get $3
  call $~lib/metashrew-as/assembly/utils/utils/reverse
  local.get $0
  i32.load offset=8
  call $~lib/metashrew-as/assembly/blockdata/transaction/OutPoint.from
  i32.load
  local.tee $0
  i32.load offset=4
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.tee $1
  local.get $0
  i32.load
  local.get $0
  i32.load offset=4
  memory.copy
  local.get $2
  local.get $1
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
  call $~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet.load
 )
 (func $~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet#get (param $0 i32) (param $1 i32) (result i32)
  block $~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet#getIndex|inlined.1 (result i32)
   local.get $0
   i32.load offset=8
   local.get $1
   local.get $1
   call $~lib/util/hash/HASH<~lib/string/String>
   call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#find"
   if
    local.get $0
    i32.load offset=8
    local.get $1
    call $"~lib/map/Map<~lib/string/String,i32>#get"
    br $~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet#getIndex|inlined.1
   end
   i32.const -1
  end
  local.tee $1
  i32.const -1
  i32.ne
  if
   local.get $0
   i32.load offset=4
   local.get $1
   call $~lib/array/Array<~lib/array/Array<u8>>#__get
   return
  end
  i32.const 16
  i32.const 9
  call $~lib/rt/stub/__new
  local.tee $0
  i64.const 0
  i64.store
  local.get $0
  i64.const 0
  i64.store offset=8
  local.get $0
 )
 (func $~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet#increase (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i64)
  (local $4 i32)
  (local $5 i64)
  local.get $0
  local.get $1
  call $~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet#get
  local.set $4
  local.get $2
  i64.load
  local.tee $5
  local.get $4
  i64.load
  i64.add
  local.set $3
  local.get $3
  local.get $5
  i64.lt_u
  i64.extend_i32_u
  local.get $2
  i64.load offset=8
  local.get $4
  i64.load offset=8
  i64.add
  i64.add
  local.set $5
  i32.const 16
  i32.const 9
  call $~lib/rt/stub/__new
  local.tee $2
  local.get $3
  i64.store
  local.get $2
  local.get $5
  i64.store offset=8
  local.get $0
  local.get $1
  local.get $2
  call $~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet#set
 )
 (func $~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet#pipe (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  loop $for-loop|0
   local.get $2
   local.get $0
   i32.load
   local.tee $3
   i32.load offset=12
   i32.lt_s
   if
    local.get $1
    local.get $3
    local.get $2
    call $~lib/array/Array<~lib/array/Array<u8>>#__get
    local.get $0
    i32.load offset=4
    local.get $2
    call $~lib/array/Array<~lib/array/Array<u8>>#__get
    call $~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet#increase
    local.get $2
    i32.const 1
    i32.add
    local.set $2
    br $for-loop|0
   end
  end
 )
 (func $~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet.concat~anonymous|0 (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (result i32)
  local.get $0
  i32.const 0
  call $~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet#constructor
  local.tee $2
  call $~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet#pipe
  local.get $1
  local.get $2
  call $~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet#pipe
  local.get $2
 )
 (func $~lib/metashrew-runes/assembly/utils/fieldToArrayBuffer~anonymous|0 (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  local.get $0
  call $~lib/metashrew-runes/assembly/utils/toArrayBuffer
  local.tee $0
  local.get $0
  i32.const 20
  i32.sub
  i32.load offset=16
  call $~lib/metashrew-as/assembly/utils/box/Box#constructor
 )
 (func $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#getValue<u64> (param $0 i32) (result i64)
  (local $1 i32)
  local.get $0
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#get
  local.tee $0
  i32.const 20
  i32.sub
  i32.load offset=16
  i32.eqz
  if
   i64.const 0
   return
  end
  i32.const 8
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.tee $1
  local.get $0
  local.get $0
  i32.const 20
  i32.sub
  i32.load offset=16
  memory.copy
  local.get $1
  i64.load
 )
 (func $~lib/metashrew-runes/assembly/indexer/RunestoneMessage/RunestoneMessage#mint (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local $4 i64)
  (local $5 i32)
  (local $6 i64)
  (local $7 i64)
  (local $8 i64)
  (local $9 i32)
  local.get $0
  i32.load
  local.tee $3
  i32.load
  local.get $3
  i32.load offset=4
  i32.const -1635318407
  i32.and
  i32.const 2
  i32.shl
  i32.add
  i32.load
  local.set $3
  block $"__inlined_func$~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#find$3159"
   loop $while-continue|0
    local.get $3
    if
     local.get $3
     i32.load offset=12
     local.tee $5
     i32.const 1
     i32.and
     if (result i32)
      i32.const 0
     else
      local.get $3
      i64.load
      i64.const 20
      i64.eq
     end
     br_if $"__inlined_func$~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#find$3159"
     local.get $5
     i32.const -2
     i32.and
     local.set $3
     br $while-continue|0
    end
   end
   i32.const 0
   local.set $3
  end
  local.get $3
  if (result i32)
   local.get $0
   i32.load
   i64.const 20
   call $"~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#get"
   i32.const 8736
   call $~lib/array/Array<~lib/arraybuffer/ArrayBuffer>#map<~lib/metashrew-as/assembly/utils/box/Box>
   call $~lib/metashrew-as/assembly/utils/box/Box.concat
  else
   i32.const 0
  end
  local.tee $0
  if (result i32)
   local.get $0
   i32.const 20
   i32.sub
   i32.load offset=16
   i32.const 32
   i32.eq
  else
   i32.const 0
  end
  if
   global.get $~lib/metashrew-runes/assembly/indexer/constants/index/RUNE_ID_TO_ETCHING
   local.get $0
   call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
   call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#get
   local.set $3
   global.get $~lib/metashrew-runes/assembly/indexer/constants/index/MINTS_REMAINING
   local.get $3
   call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
   call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#get
   call $~lib/metashrew-runes/assembly/utils/fromArrayBuffer
   local.tee $5
   i64.load
   local.get $5
   i64.load offset=8
   i64.or
   i64.const 0
   i64.ne
   if
    global.get $~lib/metashrew-runes/assembly/indexer/constants/index/HEIGHTSTART
    local.get $3
    call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
    call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#getValue<u64>
    local.set $4
    global.get $~lib/metashrew-runes/assembly/indexer/constants/index/HEIGHTEND
    local.get $3
    call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
    call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#getValue<u64>
    local.set $6
    global.get $~lib/metashrew-runes/assembly/indexer/constants/index/OFFSETSTART
    local.get $3
    call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
    call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#getValue<u64>
    local.set $7
    global.get $~lib/metashrew-runes/assembly/indexer/constants/index/OFFSETEND
    local.get $3
    call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
    call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#getValue<u64>
    local.set $8
    global.get $~lib/metashrew-runes/assembly/indexer/constants/index/RUNE_ID_TO_HEIGHT
    local.get $0
    call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
    call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#getValue<u32>
    local.set $9
    local.get $6
    i64.eqz
    local.get $6
    local.get $1
    i64.extend_i32_u
    local.tee $6
    i64.gt_u
    i32.or
    local.get $4
    i64.eqz
    local.get $4
    local.get $6
    i64.le_u
    i32.or
    i32.and
    if (result i32)
     local.get $7
     i64.eqz
     local.get $6
     local.get $7
     local.get $9
     i64.extend_i32_u
     i64.add
     i64.ge_u
     i32.or
    else
     i32.const 0
    end
    if (result i32)
     local.get $8
     i64.eqz
     local.get $1
     i64.extend_i32_u
     local.get $9
     i64.extend_i32_u
     local.get $8
     i64.add
     i64.lt_u
     i32.or
    else
     i32.const 0
    end
    if
     global.get $~lib/metashrew-runes/assembly/indexer/constants/index/MINTS_REMAINING
     local.get $3
     call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
     local.set $1
     i32.const 16
     i32.const 9
     call $~lib/rt/stub/__new
     local.tee $9
     i64.const 1
     i64.store
     local.get $9
     i64.const 0
     i64.store offset=8
     local.get $5
     i64.load
     local.tee $4
     local.get $9
     i64.load
     i64.sub
     local.set $6
     local.get $5
     i64.load offset=8
     local.get $9
     i64.load offset=8
     i64.sub
     local.get $4
     local.get $6
     i64.lt_u
     i64.extend_i32_u
     i64.sub
     local.set $4
     i32.const 16
     i32.const 9
     call $~lib/rt/stub/__new
     local.tee $5
     local.get $6
     i64.store
     local.get $5
     local.get $4
     i64.store offset=8
     local.get $5
     call $~lib/metashrew-runes/assembly/utils/toArrayBuffer
     local.set $5
     local.get $1
     call $~lib/metashrew-as/assembly/indexer/index/hash
     local.set $9
     global.get $~lib/metashrew-as/assembly/indexer/index/_updates
     local.get $9
     local.get $5
     call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set"
     global.get $~lib/metashrew-as/assembly/indexer/index/_updateKeys
     local.get $9
     local.get $1
     call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set"
     local.get $2
     local.get $0
     global.get $~lib/metashrew-runes/assembly/indexer/constants/index/AMOUNT
     local.get $3
     call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
     call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#get
     call $~lib/metashrew-runes/assembly/utils/fromArrayBuffer
     call $~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet#increase
    end
   end
  end
 )
 (func $~lib/metashrew-runes/assembly/indexer/RunestoneMessage/RunestoneMessage#getFlag (param $0 i32) (param $1 i64) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i64)
  (local $5 i64)
  (local $6 i64)
  (local $7 i64)
  local.get $0
  i32.load
  local.tee $2
  i32.load
  local.get $2
  i32.load offset=4
  i32.const -368796614
  i32.and
  i32.const 2
  i32.shl
  i32.add
  i32.load
  local.set $2
  block $"__inlined_func$~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#find$3164"
   loop $while-continue|0
    local.get $2
    if
     local.get $2
     i32.load offset=12
     local.tee $3
     i32.const 1
     i32.and
     if (result i32)
      i32.const 0
     else
      local.get $2
      i64.load
      i64.const 2
      i64.eq
     end
     br_if $"__inlined_func$~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#find$3164"
     local.get $3
     i32.const -2
     i32.and
     local.set $2
     br $while-continue|0
    end
   end
   i32.const 0
   local.set $2
  end
  local.get $2
  i32.eqz
  if
   i32.const 0
   return
  end
  block $__inlined_func$~lib/metashrew-runes/assembly/utils/fieldToU128$91
   local.get $0
   i32.load
   i64.const 2
   call $"~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#get"
   local.tee $0
   i32.load offset=12
   i32.eqz
   if
    i32.const 16
    i32.const 9
    call $~lib/rt/stub/__new
    local.tee $0
    i64.const 0
    i64.store
    local.get $0
    i64.const 0
    i64.store offset=8
    br $__inlined_func$~lib/metashrew-runes/assembly/utils/fieldToU128$91
   end
   local.get $0
   i32.const 0
   call $~lib/array/Array<~lib/array/Array<u8>>#__get
   local.set $0
  end
  local.get $1
  i32.wrap_i64
  i32.const 127
  i32.and
  i64.extend_i32_s
  local.tee $4
  i64.const 6
  i64.shr_u
  i64.const 1
  i64.sub
  local.set $5
  i32.const 16
  i32.const 9
  call $~lib/rt/stub/__new
  local.tee $2
  i64.const 1
  i64.store
  local.get $2
  i64.const 0
  i64.store offset=8
  local.get $2
  i64.load
  local.tee $6
  local.get $4
  i64.const 63
  i64.and
  local.tee $7
  i64.shl
  local.tee $1
  local.get $5
  i64.const -1
  i64.xor
  i64.and
  local.get $4
  local.get $4
  i64.const 127
  i64.add
  i64.or
  i64.const 64
  i64.and
  i64.const 6
  i64.shr_u
  i64.const 1
  i64.sub
  local.get $6
  i64.const 64
  local.get $7
  i64.sub
  i64.shr_u
  i64.and
  local.get $2
  i64.load offset=8
  local.get $7
  i64.shl
  i64.or
  local.get $5
  i64.and
  i64.or
  local.set $4
  i32.const 16
  i32.const 9
  call $~lib/rt/stub/__new
  local.tee $2
  local.get $1
  local.get $5
  i64.and
  i64.store
  local.get $2
  local.get $4
  i64.store offset=8
  local.get $0
  i64.load
  local.get $2
  i64.load
  i64.and
  local.set $1
  local.get $0
  i64.load offset=8
  local.get $2
  i64.load offset=8
  i64.and
  local.set $4
  i32.const 16
  i32.const 9
  call $~lib/rt/stub/__new
  local.tee $0
  local.get $1
  i64.store
  local.get $0
  local.get $4
  i64.store offset=8
  local.get $0
  i64.load
  local.get $0
  i64.load offset=8
  i64.or
  i64.const 0
  i64.ne
 )
 (func $~lib/as-bignum/assembly/globals/__udivmod128core (param $0 i64) (param $1 i64) (param $2 i64) (param $3 i64) (result i64)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (local $12 i64)
  (local $13 i64)
  (local $14 i64)
  (local $15 i64)
  (local $16 i32)
  i32.const 16
  i32.const 9
  call $~lib/rt/stub/__new
  local.tee $4
  local.get $0
  i64.store
  local.get $4
  local.get $1
  i64.store offset=8
  i32.const 16
  i32.const 9
  call $~lib/rt/stub/__new
  local.tee $8
  local.get $2
  i64.store
  local.get $8
  local.get $3
  i64.store offset=8
  local.get $3
  local.get $3
  local.get $3
  i64.const 1
  i64.sub
  i64.xor
  i64.const 63
  i64.shr_s
  local.tee $3
  i64.const -1
  i64.xor
  i64.and
  local.get $2
  local.get $3
  i64.and
  i64.or
  i64.clz
  i32.wrap_i64
  local.get $3
  i32.wrap_i64
  i32.const 64
  i32.and
  i32.add
  local.tee $9
  local.get $1
  local.get $1
  local.get $1
  i64.const 1
  i64.sub
  i64.xor
  i64.const 63
  i64.shr_s
  local.tee $1
  i64.const -1
  i64.xor
  i64.and
  local.get $0
  local.get $1
  i64.and
  i64.or
  i64.clz
  i32.wrap_i64
  local.get $1
  i32.wrap_i64
  i32.const 64
  i32.and
  i32.add
  local.tee $11
  i32.sub
  i32.const 127
  i32.and
  i64.extend_i32_s
  local.tee $3
  i64.const 6
  i64.shr_u
  i64.const 1
  i64.sub
  local.tee $0
  i64.const -1
  i64.xor
  local.get $8
  i64.load
  local.tee $1
  local.get $3
  i64.const 63
  i64.and
  local.tee $12
  i64.shl
  local.tee $13
  i64.and
  local.get $3
  i64.const 127
  i64.add
  local.get $3
  i64.or
  i64.const 64
  i64.and
  i64.const 6
  i64.shr_u
  i64.const 1
  i64.sub
  local.tee $2
  local.get $1
  i64.const 64
  local.get $12
  i64.sub
  i64.shr_u
  i64.and
  local.get $8
  i64.load offset=8
  local.get $12
  i64.shl
  i64.or
  local.get $0
  i64.and
  i64.or
  local.set $1
  i32.const 16
  i32.const 9
  call $~lib/rt/stub/__new
  local.tee $5
  local.get $0
  local.get $13
  i64.and
  i64.store
  local.get $5
  local.get $1
  i64.store offset=8
  i32.const 16
  i32.const 9
  call $~lib/rt/stub/__new
  local.tee $6
  i64.const 0
  i64.store
  local.get $6
  i64.const 0
  i64.store offset=8
  local.get $4
  i32.const 8
  i32.sub
  i32.load
  drop
  local.get $4
  i64.load
  local.set $0
  local.get $4
  i64.load offset=8
  local.set $1
  i32.const 16
  i32.const 9
  call $~lib/rt/stub/__new
  local.tee $7
  local.get $0
  i64.store
  local.get $7
  local.get $1
  i64.store offset=8
  i32.const 16
  i32.const 9
  call $~lib/rt/stub/__new
  local.tee $4
  i64.const 1
  i64.store
  local.get $4
  i64.const 0
  i64.store offset=8
  i32.const 128
  local.get $9
  i32.sub
  i32.const 127
  i32.and
  i64.extend_i32_s
  local.tee $13
  i64.const 6
  i64.shr_u
  i64.const 1
  i64.sub
  local.tee $14
  i64.const -1
  i64.xor
  local.get $4
  i64.load
  local.tee $0
  local.get $13
  i64.const 63
  i64.and
  local.tee $1
  i64.shl
  local.tee $15
  i64.and
  local.get $13
  i64.const 127
  i64.add
  local.get $13
  i64.or
  i64.const 64
  i64.and
  i64.const 6
  i64.shr_u
  i64.const 1
  i64.sub
  local.get $0
  i64.const 64
  local.get $1
  i64.sub
  i64.shr_u
  i64.and
  local.get $4
  i64.load offset=8
  local.get $1
  i64.shl
  i64.or
  local.get $14
  i64.and
  i64.or
  local.set $0
  i32.const 16
  i32.const 9
  call $~lib/rt/stub/__new
  local.tee $4
  local.get $14
  local.get $15
  i64.and
  i64.store
  local.get $4
  local.get $0
  i64.store offset=8
  local.get $4
  i32.const 8
  i32.sub
  i32.load
  drop
  local.get $4
  local.get $4
  i64.load offset=8
  local.get $4
  i64.load
  local.tee $0
  i64.const 1
  i64.sub
  local.tee $1
  local.get $0
  i64.gt_u
  i64.extend_i32_u
  i64.sub
  i64.store offset=8
  local.get $4
  local.get $1
  i64.store
  local.get $4
  i64.load
  local.tee $0
  local.get $12
  i64.shl
  local.tee $1
  local.get $3
  i64.const 6
  i64.shr_u
  i64.const 1
  i64.sub
  local.tee $3
  i64.const -1
  i64.xor
  i64.and
  local.get $2
  local.get $0
  i64.const 64
  local.get $12
  i64.sub
  i64.shr_u
  i64.and
  local.get $4
  i64.load offset=8
  local.get $12
  i64.shl
  i64.or
  local.get $3
  i64.and
  i64.or
  local.set $0
  i32.const 16
  i32.const 9
  call $~lib/rt/stub/__new
  local.tee $4
  local.get $1
  local.get $3
  i64.and
  i64.store
  local.get $4
  local.get $0
  i64.store offset=8
  loop $while-continue|0
   local.get $7
   i64.load offset=8
   local.tee $0
   local.get $8
   i64.load offset=8
   local.tee $1
   i64.eq
   if (result i32)
    local.get $7
    i64.load
    local.get $8
    i64.load
    i64.lt_u
   else
    local.get $0
    local.get $1
    i64.lt_u
   end
   i32.eqz
   if
    local.get $10
    i32.const 1
    i32.add
    local.set $10
    local.get $6
    i64.load offset=8
    i64.const 1
    i64.shl
    local.get $6
    i64.load
    local.tee $0
    i64.const 63
    i64.shr_u
    i64.or
    local.set $1
    i32.const 16
    i32.const 9
    call $~lib/rt/stub/__new
    local.tee $6
    local.get $0
    i64.const 1
    i64.shl
    i64.store
    local.get $6
    local.get $1
    i64.store offset=8
    local.get $7
    i64.load
    local.get $4
    i64.load
    i64.and
    local.set $0
    local.get $7
    i64.load offset=8
    local.get $4
    i64.load offset=8
    i64.and
    local.set $1
    i32.const 16
    i32.const 9
    call $~lib/rt/stub/__new
    local.tee $16
    local.get $0
    i64.store
    local.get $16
    local.get $1
    i64.store offset=8
    local.get $16
    i64.load offset=8
    local.tee $0
    local.get $5
    i64.load offset=8
    local.tee $1
    i64.eq
    if (result i32)
     local.get $16
     i64.load
     local.get $5
     i64.load
     i64.lt_u
    else
     local.get $0
     local.get $1
     i64.lt_u
    end
    i32.eqz
    if
     local.get $6
     i32.const 8
     i32.sub
     i32.load
     drop
     local.get $6
     local.get $6
     i64.load offset=8
     local.get $6
     i64.load
     local.tee $0
     i64.const 1
     i64.add
     local.tee $1
     local.get $0
     i64.lt_u
     i64.extend_i32_u
     i64.add
     i64.store offset=8
     local.get $6
     local.get $1
     i64.store
     local.get $7
     i64.load offset=8
     local.get $5
     i64.load offset=8
     i64.sub
     local.get $7
     i64.load
     local.tee $0
     local.get $5
     i64.load
     i64.sub
     local.tee $1
     local.get $0
     i64.gt_u
     i64.extend_i32_u
     i64.sub
     local.set $0
     i32.const 16
     i32.const 9
     call $~lib/rt/stub/__new
     local.tee $7
     local.get $1
     i64.store
     local.get $7
     local.get $0
     i64.store offset=8
    end
    local.get $4
    i64.load offset=8
    local.tee $0
    i64.const 63
    i64.shl
    local.get $4
    i64.load
    i64.const 1
    i64.shr_u
    i64.or
    local.set $1
    i32.const 16
    i32.const 9
    call $~lib/rt/stub/__new
    local.tee $16
    local.get $1
    i64.store
    local.get $16
    local.get $0
    i64.const 1
    i64.shr_u
    i64.store offset=8
    local.get $4
    i64.load
    local.get $16
    i64.load
    i64.or
    local.set $0
    local.get $4
    i64.load offset=8
    local.get $16
    i64.load offset=8
    i64.or
    local.set $1
    i32.const 16
    i32.const 9
    call $~lib/rt/stub/__new
    local.tee $4
    local.get $0
    i64.store
    local.get $4
    local.get $1
    i64.store offset=8
    local.get $5
    i64.load offset=8
    local.tee $0
    i64.const 63
    i64.shl
    local.get $5
    i64.load
    i64.const 1
    i64.shr_u
    i64.or
    local.set $1
    i32.const 16
    i32.const 9
    call $~lib/rt/stub/__new
    local.tee $5
    local.get $1
    i64.store
    local.get $5
    local.get $0
    i64.const 1
    i64.shr_u
    i64.store offset=8
    br $while-continue|0
   end
  end
  local.get $9
  local.get $11
  i32.sub
  local.get $10
  i32.sub
  i32.const 1
  i32.add
  i32.const 127
  i32.and
  i64.extend_i32_s
  local.tee $0
  i64.const 6
  i64.shr_u
  i64.const 1
  i64.sub
  local.tee $1
  i64.const -1
  i64.xor
  local.get $6
  i64.load
  local.tee $2
  local.get $0
  i64.const 63
  i64.and
  local.tee $3
  i64.shl
  local.tee $12
  i64.and
  local.get $0
  i64.const 127
  i64.add
  local.get $0
  i64.or
  i64.const 64
  i64.and
  i64.const 6
  i64.shr_u
  i64.const 1
  i64.sub
  local.get $2
  i64.const 64
  local.get $3
  i64.sub
  i64.shr_u
  i64.and
  local.get $6
  i64.load offset=8
  local.get $3
  i64.shl
  i64.or
  local.get $1
  i64.and
  i64.or
  local.set $0
  i32.const 16
  i32.const 9
  call $~lib/rt/stub/__new
  local.tee $4
  local.get $1
  local.get $12
  i64.and
  i64.store
  local.get $4
  local.get $0
  i64.store offset=8
  local.get $4
  i64.load offset=8
  global.set $~lib/as-bignum/assembly/globals/__divmod_quot_hi
  local.get $7
  i64.load
  global.set $~lib/as-bignum/assembly/globals/__divmod_rem_lo
  local.get $7
  i64.load offset=8
  global.set $~lib/as-bignum/assembly/globals/__divmod_rem_hi
  local.get $4
  i64.load
 )
 (func $~lib/as-bignum/assembly/globals/__udivmod128 (param $0 i64) (param $1 i64) (param $2 i64) (param $3 i64) (result i64)
  (local $4 i32)
  (local $5 i32)
  (local $6 i64)
  local.get $3
  local.get $3
  local.get $3
  i64.const 1
  i64.sub
  i64.xor
  i64.const 63
  i64.shr_s
  local.tee $6
  i64.const -1
  i64.xor
  i64.and
  local.get $2
  local.get $6
  i64.and
  i64.or
  i64.clz
  i32.wrap_i64
  local.get $6
  i32.wrap_i64
  i32.const 64
  i32.and
  i32.add
  local.tee $4
  i32.const 128
  i32.eq
  if
   i32.const 8768
   i32.const 8832
   i32.const 253
   i32.const 5
   call $~lib/builtins/abort
   unreachable
  end
  local.get $2
  local.get $2
  i64.const 1
  i64.sub
  i64.xor
  i64.const 63
  i64.shr_s
  local.tee $6
  local.get $3
  i64.and
  local.get $2
  local.get $6
  i64.const -1
  i64.xor
  i64.and
  i64.or
  i64.ctz
  i32.wrap_i64
  local.get $6
  i32.wrap_i64
  i32.const 64
  i32.and
  i32.add
  local.set $5
  local.get $0
  local.get $1
  i64.or
  i64.eqz
  if
   i64.const 0
   global.set $~lib/as-bignum/assembly/globals/__divmod_quot_hi
   i64.const 0
   global.set $~lib/as-bignum/assembly/globals/__divmod_rem_lo
   i64.const 0
   global.set $~lib/as-bignum/assembly/globals/__divmod_rem_hi
   i64.const 0
   return
  end
  local.get $4
  i32.const 127
  i32.eq
  if
   local.get $1
   global.set $~lib/as-bignum/assembly/globals/__divmod_quot_hi
   i64.const 0
   global.set $~lib/as-bignum/assembly/globals/__divmod_rem_lo
   i64.const 0
   global.set $~lib/as-bignum/assembly/globals/__divmod_rem_hi
   local.get $0
   return
  end
  local.get $1
  local.get $3
  i64.eq
  local.get $0
  local.get $2
  i64.eq
  i32.and
  if
   i64.const 0
   global.set $~lib/as-bignum/assembly/globals/__divmod_quot_hi
   i64.const 0
   global.set $~lib/as-bignum/assembly/globals/__divmod_rem_lo
   i64.const 0
   global.set $~lib/as-bignum/assembly/globals/__divmod_rem_hi
   i64.const 1
   return
  end
  local.get $1
  local.get $3
  i64.or
  i64.eqz
  if
   i64.const 0
   global.set $~lib/as-bignum/assembly/globals/__divmod_quot_hi
   i64.const 0
   global.set $~lib/as-bignum/assembly/globals/__divmod_rem_hi
   local.get $2
   i64.const 1
   i64.sub
   local.tee $1
   local.get $2
   i64.and
   i64.eqz
   if
    local.get $0
    local.get $1
    i64.and
    global.set $~lib/as-bignum/assembly/globals/__divmod_rem_lo
    local.get $0
    local.get $5
    i64.extend_i32_s
    i64.shr_u
    return
   else
    local.get $0
    local.get $0
    local.get $2
    i64.div_u
    local.tee $0
    local.get $2
    i64.mul
    i64.sub
    global.set $~lib/as-bignum/assembly/globals/__divmod_rem_lo
    local.get $0
    return
   end
   unreachable
  end
  local.get $0
  local.get $1
  local.get $2
  local.get $3
  call $~lib/as-bignum/assembly/globals/__udivmod128core
 )
 (func $~lib/metashrew-runes/assembly/indexer/RunestoneMessage/RunestoneMessage#getReservedNameFor (param $0 i32) (param $1 i64) (param $2 i32) (result i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i64)
  (local $6 i64)
  local.get $0
  i32.load
  local.tee $3
  i32.load
  local.get $3
  i32.load offset=4
  i32.const -134288509
  i32.and
  i32.const 2
  i32.shl
  i32.add
  i32.load
  local.set $3
  block $"__inlined_func$~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#find$3167"
   loop $while-continue|0
    local.get $3
    if
     local.get $3
     i32.load offset=12
     local.tee $4
     i32.const 1
     i32.and
     if (result i32)
      i32.const 0
     else
      local.get $3
      i64.load
      i64.const 4
      i64.eq
     end
     br_if $"__inlined_func$~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#find$3167"
     local.get $4
     i32.const -2
     i32.and
     local.set $3
     br $while-continue|0
    end
   end
   i32.const 0
   local.set $3
  end
  local.get $3
  if
   local.get $0
   i32.load
   i64.const 4
   call $"~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#get"
   i32.const 0
   call $~lib/array/Array<~lib/array/Array<u8>>#__get
   local.set $0
  else
   i32.const 16
   i32.const 9
   call $~lib/rt/stub/__new
   local.tee $0
   local.get $1
   i64.store
   local.get $0
   i64.const 0
   i64.store offset=8
   local.get $0
   i64.load offset=8
   i64.const 32
   i64.shl
   local.get $0
   i64.load
   local.tee $5
   i64.const 32
   i64.shr_u
   i64.or
   local.set $6
   i32.const 16
   i32.const 9
   call $~lib/rt/stub/__new
   local.tee $0
   local.get $5
   i64.const 32
   i64.shl
   i64.store
   local.get $0
   local.get $6
   i64.store offset=8
   i32.const 16
   i32.const 9
   call $~lib/rt/stub/__new
   local.tee $3
   local.get $2
   i64.extend_i32_u
   i64.store
   local.get $3
   i64.const 0
   i64.store offset=8
   local.get $0
   i64.load
   local.get $3
   i64.load
   i64.or
   local.set $5
   local.get $0
   i64.load offset=8
   local.get $3
   i64.load offset=8
   i64.or
   local.set $6
   i32.const 16
   i32.const 9
   call $~lib/rt/stub/__new
   local.tee $0
   local.get $5
   i64.store
   local.get $0
   local.get $6
   i64.store offset=8
   global.get $~lib/metashrew-runes/assembly/indexer/constants/index/RESERVED_NAME
   local.tee $2
   i64.load
   local.tee $5
   local.get $0
   i64.load
   i64.add
   local.tee $6
   local.get $5
   i64.lt_u
   i64.extend_i32_u
   local.get $2
   i64.load offset=8
   local.get $0
   i64.load offset=8
   i64.add
   i64.add
   local.set $5
   i32.const 16
   i32.const 9
   call $~lib/rt/stub/__new
   local.tee $0
   local.get $6
   i64.store
   local.get $0
   local.get $5
   i64.store offset=8
  end
  local.get $0
  local.set $2
  global.get $~lib/metashrew-runes/assembly/indexer/constants/index/MINIMUM_NAME
  local.set $0
  local.get $1
  i64.const 840000
  i64.sub
  i64.const 17500
  i64.div_u
  local.tee $1
  i64.const 0
  i64.ne
  if
   loop $while-continue|01
    local.get $1
    i64.const 0
    i64.gt_s
    if
     local.get $0
     i32.const 8
     i32.sub
     i32.load
     drop
     local.get $0
     local.get $0
     i64.load offset=8
     local.get $0
     i64.load
     local.tee $5
     i64.const 1
     i64.sub
     local.tee $6
     local.get $5
     i64.gt_u
     i64.extend_i32_u
     i64.sub
     i64.store offset=8
     local.get $0
     local.get $6
     i64.store
     local.get $0
     i64.load
     local.get $0
     i64.load offset=8
     global.get $~lib/metashrew-runes/assembly/indexer/constants/index/TWENTY_SIX
     local.tee $0
     i64.load
     local.get $0
     i64.load offset=8
     call $~lib/as-bignum/assembly/globals/__udivmod128
     local.set $5
     global.get $~lib/as-bignum/assembly/globals/__divmod_quot_hi
     local.set $6
     i32.const 16
     i32.const 9
     call $~lib/rt/stub/__new
     local.tee $0
     local.get $5
     i64.store
     local.get $0
     local.get $6
     i64.store offset=8
     local.get $1
     i64.const 1
     i64.sub
     local.set $1
     br $while-continue|01
    end
   end
  end
  local.get $2
  i64.load offset=8
  local.tee $1
  local.get $0
  i64.load offset=8
  local.tee $5
  i64.eq
  if (result i32)
   local.get $2
   i64.load
   local.get $0
   i64.load
   i64.lt_u
  else
   local.get $1
   local.get $5
   i64.lt_u
  end
  if (result i32)
   i32.const 0
  else
   local.get $2
   i64.load offset=8
   local.tee $1
   global.get $~lib/metashrew-runes/assembly/indexer/constants/index/RESERVED_NAME
   local.tee $0
   i64.load offset=8
   local.tee $5
   i64.eq
   if (result i32)
    local.get $2
    i64.load
    local.get $0
    i64.load
    i64.lt_u
   else
    local.get $1
    local.get $5
    i64.lt_u
   end
  end
  i32.eqz
  if
   i32.const 0
   return
  end
  local.get $2
  call $~lib/metashrew-runes/assembly/utils/toArrayBuffer
 )
 (func $~lib/metashrew-runes/assembly/indexer/RunestoneMessage/RunestoneMessage#etch (param $0 i32) (param $1 i64) (param $2 i32) (param $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  local.get $0
  i64.const 0
  call $~lib/metashrew-runes/assembly/indexer/RunestoneMessage/RunestoneMessage#getFlag
  i32.eqz
  if
   return
  end
  block $__inlined_func$~lib/metashrew-runes/assembly/indexer/RunestoneMessage/RunestoneMessage#getReservedNameFor@override$955 (result i32)
   local.get $0
   i32.const 8
   i32.sub
   i32.load
   i32.const 128
   i32.eq
   if
    local.get $0
    local.get $1
    local.get $2
    call $~lib/metashrew-runes/assembly/indexer/RunestoneMessage/RunestoneMessage#getReservedNameFor
    br $__inlined_func$~lib/metashrew-runes/assembly/indexer/RunestoneMessage/RunestoneMessage#getReservedNameFor@override$955
   end
   local.get $0
   local.get $1
   local.get $2
   call $~lib/metashrew-runes/assembly/indexer/RunestoneMessage/RunestoneMessage#getReservedNameFor
  end
  local.tee $5
  i32.eqz
  if
   return
  end
  global.get $~lib/metashrew-runes/assembly/indexer/constants/index/ETCHING_TO_RUNE_ID
  local.get $5
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#get
  i32.const 20
  i32.sub
  i32.load offset=16
  if
   return
  end
  block $__inlined_func$~lib/metashrew-runes/assembly/indexer/RunestoneMessage/RunestoneMessage#buildRuneId@override$957 (result i32)
   local.get $0
   i32.const 8
   i32.sub
   i32.load
   i32.const 128
   i32.eq
   if
    i32.const 8
    i32.const 115
    call $~lib/rt/stub/__new
    local.get $1
    local.get $2
    call $~lib/metashrew-runes/assembly/indexer/RuneId/RuneId#constructor
    call $~lib/metashrew-runes/assembly/indexer/RuneId/RuneId#toBytes
    br $__inlined_func$~lib/metashrew-runes/assembly/indexer/RunestoneMessage/RunestoneMessage#buildRuneId@override$957
   end
   i32.const 0
   local.get $1
   local.get $2
   call $~lib/metashrew-runes/assembly/indexer/RuneId/RuneId#constructor
   call $~lib/metashrew-runes/assembly/indexer/RuneId/RuneId#toBytes
  end
  local.set $4
  global.get $~lib/metashrew-runes/assembly/indexer/constants/index/RUNE_ID_TO_ETCHING
  local.get $4
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
  local.tee $2
  call $~lib/metashrew-as/assembly/indexer/index/hash
  local.set $6
  global.get $~lib/metashrew-as/assembly/indexer/index/_updates
  local.get $6
  local.get $5
  call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set"
  global.get $~lib/metashrew-as/assembly/indexer/index/_updateKeys
  local.get $6
  local.get $2
  call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set"
  global.get $~lib/metashrew-runes/assembly/indexer/constants/index/ETCHING_TO_RUNE_ID
  local.get $5
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
  local.tee $2
  call $~lib/metashrew-as/assembly/indexer/index/hash
  local.set $6
  global.get $~lib/metashrew-as/assembly/indexer/index/_updates
  local.get $6
  local.get $4
  call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set"
  global.get $~lib/metashrew-as/assembly/indexer/index/_updateKeys
  local.get $6
  local.get $2
  call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set"
  global.get $~lib/metashrew-runes/assembly/indexer/constants/index/RUNE_ID_TO_HEIGHT
  local.get $4
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
  local.set $2
  i32.const 4
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.tee $6
  local.get $1
  i64.store32
  local.get $2
  call $~lib/metashrew-as/assembly/indexer/index/hash
  local.set $7
  global.get $~lib/metashrew-as/assembly/indexer/index/_updates
  local.get $7
  local.get $6
  call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set"
  global.get $~lib/metashrew-as/assembly/indexer/index/_updateKeys
  local.get $7
  local.get $2
  call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set"
  local.get $0
  i32.load
  local.tee $2
  i32.load
  local.get $2
  i32.load offset=4
  i32.const 149775153
  i32.and
  i32.const 2
  i32.shl
  i32.add
  i32.load
  local.set $2
  block $"__inlined_func$~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#find$3173"
   loop $while-continue|0
    local.get $2
    if
     local.get $2
     i32.load offset=12
     local.tee $6
     i32.const 1
     i32.and
     if (result i32)
      i32.const 0
     else
      local.get $2
      i64.load
      i64.const 1
      i64.eq
     end
     br_if $"__inlined_func$~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#find$3173"
     local.get $6
     i32.const -2
     i32.and
     local.set $2
     br $while-continue|0
    end
   end
   i32.const 0
   local.set $2
  end
  local.get $2
  if
   global.get $~lib/metashrew-runes/assembly/indexer/constants/index/DIVISIBILITY
   local.get $5
   call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
   local.set $2
   local.get $0
   i32.load
   i64.const 1
   call $"~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#get"
   i32.const 0
   call $~lib/array/Array<~lib/array/Array<u8>>#__get
   i64.load
   i32.wrap_i64
   local.set $6
   i32.const 1
   call $~lib/arraybuffer/ArrayBuffer#constructor
   local.tee $7
   local.get $6
   i32.store8
   local.get $2
   call $~lib/metashrew-as/assembly/indexer/index/hash
   local.set $6
   global.get $~lib/metashrew-as/assembly/indexer/index/_updates
   local.get $6
   local.get $7
   call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set"
   global.get $~lib/metashrew-as/assembly/indexer/index/_updateKeys
   local.get $6
   local.get $2
   call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set"
  end
  local.get $0
  i32.load
  local.tee $2
  i32.load
  local.get $2
  i32.load offset=4
  i32.const -1233072437
  i32.and
  i32.const 2
  i32.shl
  i32.add
  i32.load
  local.set $2
  block $"__inlined_func$~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#find$3175"
   loop $while-continue|03
    local.get $2
    if
     local.get $2
     i32.load offset=12
     local.tee $6
     i32.const 1
     i32.and
     if (result i32)
      i32.const 0
     else
      local.get $2
      i64.load
      i64.const 6
      i64.eq
     end
     br_if $"__inlined_func$~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#find$3175"
     local.get $6
     i32.const -2
     i32.and
     local.set $2
     br $while-continue|03
    end
   end
   i32.const 0
   local.set $2
  end
  local.get $2
  if
   block $__inlined_func$~lib/metashrew-runes/assembly/utils/fieldToU128$102
    local.get $0
    i32.load
    i64.const 6
    call $"~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#get"
    local.tee $2
    i32.load offset=12
    i32.eqz
    if
     i32.const 16
     i32.const 9
     call $~lib/rt/stub/__new
     local.tee $2
     i64.const 0
     i64.store
     local.get $2
     i64.const 0
     i64.store offset=8
     br $__inlined_func$~lib/metashrew-runes/assembly/utils/fieldToU128$102
    end
    local.get $2
    i32.const 0
    call $~lib/array/Array<~lib/array/Array<u8>>#__get
    local.set $2
   end
   i32.const 1
   i32.const 2
   i32.const 41
   i32.const 0
   call $~lib/rt/__newArray
   local.tee $7
   i32.load offset=4
   drop
   local.get $7
   i32.const 0
   local.get $4
   call $~lib/array/Array<~lib/string/String>#__set
   i32.const 1
   i32.const 2
   i32.const 59
   i32.const 0
   call $~lib/rt/__newArray
   local.tee $6
   i32.load offset=4
   drop
   local.get $6
   i32.const 0
   local.get $2
   local.tee $4
   call $~lib/array/Array<~lib/string/String>#__set
   i32.const 0
   call $~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet#constructor
   local.set $8
   i32.const 0
   local.set $2
   loop $for-loop|0
    local.get $2
    local.get $7
    i32.load offset=12
    i32.lt_s
    if
     local.get $8
     local.get $7
     local.get $2
     call $~lib/array/Array<~lib/array/Array<u8>>#__get
     local.get $6
     local.get $2
     call $~lib/array/Array<~lib/array/Array<u8>>#__get
     call $~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet#set
     local.get $2
     i32.const 1
     i32.add
     local.set $2
     br $for-loop|0
    end
   end
   local.get $8
   local.get $3
   call $~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet#pipe
   global.get $~lib/metashrew-runes/assembly/indexer/constants/index/PREMINE
   local.get $5
   call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
   local.set $2
   local.get $4
   call $~lib/metashrew-runes/assembly/utils/toArrayBuffer
   local.set $3
   local.get $2
   call $~lib/metashrew-as/assembly/indexer/index/hash
   local.set $4
   global.get $~lib/metashrew-as/assembly/indexer/index/_updates
   local.get $4
   local.get $3
   call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set"
   global.get $~lib/metashrew-as/assembly/indexer/index/_updateKeys
   local.get $4
   local.get $2
   call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set"
  end
  local.get $0
  i64.const 1
  call $~lib/metashrew-runes/assembly/indexer/RunestoneMessage/RunestoneMessage#getFlag
  if
   local.get $0
   i32.load
   local.tee $2
   i32.load
   local.get $2
   i32.load offset=4
   i32.const 1165796466
   i32.and
   i32.const 2
   i32.shl
   i32.add
   i32.load
   local.set $2
   block $"__inlined_func$~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#find$3177"
    loop $while-continue|04
     local.get $2
     if
      local.get $2
      i32.load offset=12
      local.tee $3
      i32.const 1
      i32.and
      if (result i32)
       i32.const 0
      else
       local.get $2
       i64.load
       i64.const 10
       i64.eq
      end
      br_if $"__inlined_func$~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#find$3177"
      local.get $3
      i32.const -2
      i32.and
      local.set $2
      br $while-continue|04
     end
    end
    i32.const 0
    local.set $2
   end
   local.get $2
   if
    global.get $~lib/metashrew-runes/assembly/indexer/constants/index/AMOUNT
    local.get $5
    call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
    local.set $3
    block $__inlined_func$~lib/metashrew-runes/assembly/utils/fieldToU128$105
     local.get $0
     i32.load
     i64.const 10
     call $"~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#get"
     local.tee $2
     i32.load offset=12
     i32.eqz
     if
      i32.const 16
      i32.const 9
      call $~lib/rt/stub/__new
      local.tee $2
      i64.const 0
      i64.store
      local.get $2
      i64.const 0
      i64.store offset=8
      br $__inlined_func$~lib/metashrew-runes/assembly/utils/fieldToU128$105
     end
     local.get $2
     i32.const 0
     call $~lib/array/Array<~lib/array/Array<u8>>#__get
     local.set $2
    end
    local.get $2
    call $~lib/metashrew-runes/assembly/utils/toArrayBuffer
    local.set $2
    local.get $3
    call $~lib/metashrew-as/assembly/indexer/index/hash
    local.set $4
    global.get $~lib/metashrew-as/assembly/indexer/index/_updates
    local.get $4
    local.get $2
    call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set"
    global.get $~lib/metashrew-as/assembly/indexer/index/_updateKeys
    local.get $4
    local.get $3
    call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set"
   end
   local.get $0
   i32.load
   local.tee $2
   i32.load
   local.get $2
   i32.load offset=4
   i32.const 825563442
   i32.and
   i32.const 2
   i32.shl
   i32.add
   i32.load
   local.set $2
   block $"__inlined_func$~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#find$3178"
    loop $while-continue|05
     local.get $2
     if
      local.get $2
      i32.load offset=12
      local.tee $3
      i32.const 1
      i32.and
      if (result i32)
       i32.const 0
      else
       local.get $2
       i64.load
       i64.const 8
       i64.eq
      end
      br_if $"__inlined_func$~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#find$3178"
      local.get $3
      i32.const -2
      i32.and
      local.set $2
      br $while-continue|05
     end
    end
    i32.const 0
    local.set $2
   end
   local.get $2
   if
    global.get $~lib/metashrew-runes/assembly/indexer/constants/index/CAP
    local.get $5
    call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
    local.set $3
    block $__inlined_func$~lib/metashrew-runes/assembly/utils/fieldToU128$108
     local.get $0
     i32.load
     i64.const 8
     call $"~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#get"
     local.tee $2
     i32.load offset=12
     i32.eqz
     if
      i32.const 16
      i32.const 9
      call $~lib/rt/stub/__new
      local.tee $2
      i64.const 0
      i64.store
      local.get $2
      i64.const 0
      i64.store offset=8
      br $__inlined_func$~lib/metashrew-runes/assembly/utils/fieldToU128$108
     end
     local.get $2
     i32.const 0
     call $~lib/array/Array<~lib/array/Array<u8>>#__get
     local.set $2
    end
    local.get $2
    call $~lib/metashrew-runes/assembly/utils/toArrayBuffer
    local.set $2
    local.get $3
    call $~lib/metashrew-as/assembly/indexer/index/hash
    local.set $4
    global.get $~lib/metashrew-as/assembly/indexer/index/_updates
    local.get $4
    local.get $2
    call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set"
    global.get $~lib/metashrew-as/assembly/indexer/index/_updateKeys
    local.get $4
    local.get $3
    call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set"
    global.get $~lib/metashrew-runes/assembly/indexer/constants/index/MINTS_REMAINING
    local.get $5
    call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
    local.set $2
    local.get $0
    i32.load
    i64.const 8
    call $"~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#get"
    i32.const 8736
    call $~lib/array/Array<~lib/arraybuffer/ArrayBuffer>#map<~lib/metashrew-as/assembly/utils/box/Box>
    call $~lib/metashrew-as/assembly/utils/box/Box.concat
    local.set $3
    local.get $2
    call $~lib/metashrew-as/assembly/indexer/index/hash
    local.set $4
    global.get $~lib/metashrew-as/assembly/indexer/index/_updates
    local.get $4
    local.get $3
    call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set"
    global.get $~lib/metashrew-as/assembly/indexer/index/_updateKeys
    local.get $4
    local.get $2
    call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set"
   end
   local.get $0
   i32.load
   local.tee $2
   i32.load
   local.get $2
   i32.load offset=4
   i32.const -501640975
   i32.and
   i32.const 2
   i32.shl
   i32.add
   i32.load
   local.set $2
   block $"__inlined_func$~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#find$3179"
    loop $while-continue|06
     local.get $2
     if
      local.get $2
      i32.load offset=12
      local.tee $3
      i32.const 1
      i32.and
      if (result i32)
       i32.const 0
      else
       local.get $2
       i64.load
       i64.const 12
       i64.eq
      end
      br_if $"__inlined_func$~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#find$3179"
      local.get $3
      i32.const -2
      i32.and
      local.set $2
      br $while-continue|06
     end
    end
    i32.const 0
    local.set $2
   end
   local.get $2
   if
    global.get $~lib/metashrew-runes/assembly/indexer/constants/index/HEIGHTSTART
    local.get $5
    call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
    local.set $2
    local.get $0
    i32.load
    i64.const 12
    call $"~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#get"
    i32.const 0
    call $~lib/array/Array<~lib/array/Array<u8>>#__get
    i64.load
    local.set $1
    i32.const 8
    call $~lib/arraybuffer/ArrayBuffer#constructor
    local.tee $3
    local.get $1
    i64.store
    local.get $2
    call $~lib/metashrew-as/assembly/indexer/index/hash
    local.set $4
    global.get $~lib/metashrew-as/assembly/indexer/index/_updates
    local.get $4
    local.get $3
    call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set"
    global.get $~lib/metashrew-as/assembly/indexer/index/_updateKeys
    local.get $4
    local.get $2
    call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set"
   end
   local.get $0
   i32.load
   local.tee $2
   i32.load
   local.get $2
   i32.load offset=4
   i32.const -1725757104
   i32.and
   i32.const 2
   i32.shl
   i32.add
   i32.load
   local.set $2
   block $"__inlined_func$~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#find$3181"
    loop $while-continue|07
     local.get $2
     if
      local.get $2
      i32.load offset=12
      local.tee $3
      i32.const 1
      i32.and
      if (result i32)
       i32.const 0
      else
       local.get $2
       i64.load
       i64.const 14
       i64.eq
      end
      br_if $"__inlined_func$~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#find$3181"
      local.get $3
      i32.const -2
      i32.and
      local.set $2
      br $while-continue|07
     end
    end
    i32.const 0
    local.set $2
   end
   local.get $2
   if
    global.get $~lib/metashrew-runes/assembly/indexer/constants/index/HEIGHTEND
    local.get $5
    call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
    local.set $2
    local.get $0
    i32.load
    i64.const 14
    call $"~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#get"
    i32.const 0
    call $~lib/array/Array<~lib/array/Array<u8>>#__get
    i64.load
    local.set $1
    i32.const 8
    call $~lib/arraybuffer/ArrayBuffer#constructor
    local.tee $3
    local.get $1
    i64.store
    local.get $2
    call $~lib/metashrew-as/assembly/indexer/index/hash
    local.set $4
    global.get $~lib/metashrew-as/assembly/indexer/index/_updates
    local.get $4
    local.get $3
    call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set"
    global.get $~lib/metashrew-as/assembly/indexer/index/_updateKeys
    local.get $4
    local.get $2
    call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set"
   end
   local.get $0
   i32.load
   local.tee $2
   i32.load
   local.get $2
   i32.load offset=4
   i32.const 620430493
   i32.and
   i32.const 2
   i32.shl
   i32.add
   i32.load
   local.set $2
   block $"__inlined_func$~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#find$3183"
    loop $while-continue|08
     local.get $2
     if
      local.get $2
      i32.load offset=12
      local.tee $3
      i32.const 1
      i32.and
      if (result i32)
       i32.const 0
      else
       local.get $2
       i64.load
       i64.const 16
       i64.eq
      end
      br_if $"__inlined_func$~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#find$3183"
      local.get $3
      i32.const -2
      i32.and
      local.set $2
      br $while-continue|08
     end
    end
    i32.const 0
    local.set $2
   end
   local.get $2
   if
    global.get $~lib/metashrew-runes/assembly/indexer/constants/index/OFFSETSTART
    local.get $5
    call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
    local.set $2
    local.get $0
    i32.load
    i64.const 16
    call $"~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#get"
    i32.const 0
    call $~lib/array/Array<~lib/array/Array<u8>>#__get
    i64.load
    local.set $1
    i32.const 8
    call $~lib/arraybuffer/ArrayBuffer#constructor
    local.tee $3
    local.get $1
    i64.store
    local.get $2
    call $~lib/metashrew-as/assembly/indexer/index/hash
    local.set $4
    global.get $~lib/metashrew-as/assembly/indexer/index/_updates
    local.get $4
    local.get $3
    call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set"
    global.get $~lib/metashrew-as/assembly/indexer/index/_updateKeys
    local.get $4
    local.get $2
    call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set"
   end
   local.get $0
   i32.load
   local.tee $2
   i32.load
   local.get $2
   i32.load offset=4
   i32.const -1530175746
   i32.and
   i32.const 2
   i32.shl
   i32.add
   i32.load
   local.set $2
   block $"__inlined_func$~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#find$3185"
    loop $while-continue|09
     local.get $2
     if
      local.get $2
      i32.load offset=12
      local.tee $3
      i32.const 1
      i32.and
      if (result i32)
       i32.const 0
      else
       local.get $2
       i64.load
       i64.const 18
       i64.eq
      end
      br_if $"__inlined_func$~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#find$3185"
      local.get $3
      i32.const -2
      i32.and
      local.set $2
      br $while-continue|09
     end
    end
    i32.const 0
    local.set $2
   end
   local.get $2
   if
    global.get $~lib/metashrew-runes/assembly/indexer/constants/index/OFFSETEND
    local.get $5
    call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
    local.set $2
    local.get $0
    i32.load
    i64.const 18
    call $"~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#get"
    i32.const 0
    call $~lib/array/Array<~lib/array/Array<u8>>#__get
    i64.load
    local.set $1
    i32.const 8
    call $~lib/arraybuffer/ArrayBuffer#constructor
    local.tee $3
    local.get $1
    i64.store
    local.get $2
    call $~lib/metashrew-as/assembly/indexer/index/hash
    local.set $4
    global.get $~lib/metashrew-as/assembly/indexer/index/_updates
    local.get $4
    local.get $3
    call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set"
    global.get $~lib/metashrew-as/assembly/indexer/index/_updateKeys
    local.get $4
    local.get $2
    call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set"
   end
  end
  local.get $0
  i32.load
  local.tee $2
  i32.load
  local.get $2
  i32.load offset=4
  i32.const 1629217451
  i32.and
  i32.const 2
  i32.shl
  i32.add
  i32.load
  local.set $2
  block $"__inlined_func$~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#find$3187"
   loop $while-continue|010
    local.get $2
    if
     local.get $2
     i32.load offset=12
     local.tee $3
     i32.const 1
     i32.and
     if (result i32)
      i32.const 0
     else
      local.get $2
      i64.load
      i64.const 3
      i64.eq
     end
     br_if $"__inlined_func$~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#find$3187"
     local.get $3
     i32.const -2
     i32.and
     local.set $2
     br $while-continue|010
    end
   end
   i32.const 0
   local.set $2
  end
  local.get $2
  if
   global.get $~lib/metashrew-runes/assembly/indexer/constants/index/SPACERS
   local.get $5
   call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
   local.set $2
   local.get $0
   i32.load
   i64.const 3
   call $"~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#get"
   i32.const 0
   call $~lib/array/Array<~lib/array/Array<u8>>#__get
   i64.load
   i32.wrap_i64
   local.set $3
   i32.const 4
   call $~lib/arraybuffer/ArrayBuffer#constructor
   local.tee $4
   local.get $3
   i32.store
   local.get $2
   call $~lib/metashrew-as/assembly/indexer/index/hash
   local.set $3
   global.get $~lib/metashrew-as/assembly/indexer/index/_updates
   local.get $3
   local.get $4
   call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set"
   global.get $~lib/metashrew-as/assembly/indexer/index/_updateKeys
   local.get $3
   local.get $2
   call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set"
  end
  local.get $0
  i32.load
  local.tee $2
  i32.load
  local.get $2
  i32.load offset=4
  i32.const 40084857
  i32.and
  i32.const 2
  i32.shl
  i32.add
  i32.load
  local.set $2
  block $"__inlined_func$~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#find$3189"
   loop $while-continue|011
    local.get $2
    if
     local.get $2
     i32.load offset=12
     local.tee $3
     i32.const 1
     i32.and
     if (result i32)
      i32.const 0
     else
      local.get $2
      i64.load
      i64.const 5
      i64.eq
     end
     br_if $"__inlined_func$~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#find$3189"
     local.get $3
     i32.const -2
     i32.and
     local.set $2
     br $while-continue|011
    end
   end
   i32.const 0
   local.set $2
  end
  local.get $2
  if
   global.get $~lib/metashrew-runes/assembly/indexer/constants/index/SYMBOL
   local.get $5
   call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
   local.set $2
   local.get $0
   i32.load
   i64.const 5
   call $"~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#get"
   i32.const 0
   call $~lib/array/Array<~lib/array/Array<u8>>#__get
   i64.load
   i32.wrap_i64
   local.set $0
   i32.const 1
   call $~lib/arraybuffer/ArrayBuffer#constructor
   local.tee $3
   local.get $0
   i32.store8
   local.get $2
   call $~lib/metashrew-as/assembly/indexer/index/hash
   local.set $0
   global.get $~lib/metashrew-as/assembly/indexer/index/_updates
   local.get $0
   local.get $3
   call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set"
   global.get $~lib/metashrew-as/assembly/indexer/index/_updateKeys
   local.get $0
   local.get $2
   call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set"
  end
  global.get $~lib/metashrew-runes/assembly/indexer/constants/index/ETCHINGS
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#extend
  local.tee $0
  call $~lib/metashrew-as/assembly/indexer/index/hash
  local.set $2
  global.get $~lib/metashrew-as/assembly/indexer/index/_updates
  local.get $2
  local.get $5
  call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set"
  global.get $~lib/metashrew-as/assembly/indexer/index/_updateKeys
  local.get $2
  local.get $0
  call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set"
 )
 (func $~lib/metashrew-runes/assembly/indexer/Edict/Edict#constructor (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (result i32)
  (local $4 i32)
  i32.const 16
  i32.const 76
  call $~lib/rt/stub/__new
  local.tee $4
  i32.const 0
  i32.store
  local.get $4
  i32.const 0
  i32.store offset=4
  local.get $4
  i32.const 0
  i32.store offset=8
  local.get $4
  i32.const 0
  i32.store offset=12
  local.get $4
  local.get $0
  i32.store
  local.get $4
  local.get $1
  i32.store offset=4
  local.get $4
  local.get $2
  i32.store offset=8
  local.get $4
  local.get $3
  i32.store offset=12
  local.get $4
 )
 (func $~lib/array/Array<~lib/metashrew-runes/assembly/indexer/Edict/Edict>#constructor (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  i32.const 16
  i32.const 77
  call $~lib/rt/stub/__new
  local.tee $1
  i32.const 0
  i32.store
  local.get $1
  i32.const 0
  i32.store offset=4
  local.get $1
  i32.const 0
  i32.store offset=8
  local.get $1
  i32.const 0
  i32.store offset=12
  local.get $0
  i32.const 268435455
  i32.gt_u
  if
   i32.const 2608
   i32.const 5344
   i32.const 70
   i32.const 60
   call $~lib/builtins/abort
   unreachable
  end
  i32.const 8
  local.get $0
  local.get $0
  i32.const 8
  i32.le_u
  select
  i32.const 2
  i32.shl
  local.tee $2
  i32.const 1
  call $~lib/rt/stub/__new
  local.tee $3
  i32.const 0
  local.get $2
  memory.fill
  local.get $1
  local.get $3
  i32.store
  local.get $1
  local.get $3
  i32.store offset=4
  local.get $1
  local.get $2
  i32.store offset=8
  local.get $1
  local.get $0
  i32.store offset=12
  local.get $1
 )
 (func $~lib/staticarray/StaticArray<~lib/as-bignum/assembly/integer/u128/u128>#__get (param $0 i32) (param $1 i32) (result i32)
  local.get $1
  local.get $0
  i32.const 20
  i32.sub
  i32.load offset=16
  i32.const 2
  i32.shr_u
  i32.ge_u
  if
   i32.const 3344
   i32.const 3408
   i32.const 78
   i32.const 41
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  local.get $1
  i32.const 2
  i32.shl
  i32.add
  i32.load
  local.tee $0
  i32.eqz
  if
   i32.const 5536
   i32.const 3408
   i32.const 82
   i32.const 40
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
 )
 (func $~lib/metashrew-runes/assembly/indexer/Edict/Edict.fromDeltaSeries (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i64)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i64)
  i32.const 16
  i32.const 9
  call $~lib/rt/stub/__new
  local.tee $1
  i64.const 0
  i64.store
  local.get $1
  i64.const 0
  i64.store offset=8
  i32.const 16
  i32.const 9
  call $~lib/rt/stub/__new
  local.tee $4
  i64.const 0
  i64.store
  local.get $4
  i64.const 0
  i64.store offset=8
  i32.const 16
  i32.const 9
  call $~lib/rt/stub/__new
  local.tee $5
  i64.const 0
  i64.store
  local.get $5
  i64.const 0
  i64.store offset=8
  i32.const 16
  i32.const 9
  call $~lib/rt/stub/__new
  local.tee $6
  i64.const 0
  i64.store
  local.get $6
  i64.const 0
  i64.store offset=8
  local.get $1
  local.get $4
  local.get $5
  local.get $6
  call $~lib/metashrew-runes/assembly/indexer/Edict/Edict#constructor
  local.set $1
  i32.const 0
  call $~lib/array/Array<~lib/metashrew-runes/assembly/indexer/Edict/Edict>#constructor
  local.set $4
  loop $for-loop|0
   local.get $3
   local.get $0
   i32.load offset=12
   i32.lt_s
   if
    local.get $0
    local.get $3
    call $~lib/array/Array<~lib/array/Array<u8>>#__get
    local.set $5
    local.get $1
    i32.load
    local.set $6
    local.get $5
    i32.const 0
    call $~lib/staticarray/StaticArray<~lib/as-bignum/assembly/integer/u128/u128>#__get
    local.set $7
    local.get $6
    i64.load
    local.tee $2
    local.get $7
    i64.load
    i64.add
    local.set $8
    local.get $2
    local.get $8
    i64.gt_u
    i64.extend_i32_u
    local.get $6
    i64.load offset=8
    local.get $7
    i64.load offset=8
    i64.add
    i64.add
    local.set $2
    i32.const 16
    i32.const 9
    call $~lib/rt/stub/__new
    local.tee $6
    local.get $8
    i64.store
    local.get $6
    local.get $2
    i64.store offset=8
    local.get $5
    i32.const 0
    call $~lib/staticarray/StaticArray<~lib/as-bignum/assembly/integer/u128/u128>#__get
    local.tee $7
    i64.load
    local.get $7
    i64.load offset=8
    i64.or
    i64.const 0
    i64.ne
    if
     local.get $5
     i32.const 1
     call $~lib/staticarray/StaticArray<~lib/as-bignum/assembly/integer/u128/u128>#__get
     local.set $1
    else
     local.get $1
     i32.load offset=4
     local.set $1
     local.get $5
     i32.const 1
     call $~lib/staticarray/StaticArray<~lib/as-bignum/assembly/integer/u128/u128>#__get
     local.set $7
     local.get $1
     i64.load
     local.tee $2
     local.get $7
     i64.load
     i64.add
     local.set $8
     local.get $2
     local.get $8
     i64.gt_u
     i64.extend_i32_u
     local.get $1
     i64.load offset=8
     local.get $7
     i64.load offset=8
     i64.add
     i64.add
     local.set $2
     i32.const 16
     i32.const 9
     call $~lib/rt/stub/__new
     local.tee $1
     local.get $8
     i64.store
     local.get $1
     local.get $2
     i64.store offset=8
    end
    local.get $4
    local.get $6
    local.get $1
    local.get $5
    i32.const 2
    call $~lib/staticarray/StaticArray<~lib/as-bignum/assembly/integer/u128/u128>#__get
    local.get $5
    i32.const 3
    call $~lib/staticarray/StaticArray<~lib/as-bignum/assembly/integer/u128/u128>#__get
    call $~lib/metashrew-runes/assembly/indexer/Edict/Edict#constructor
    local.tee $1
    call $~lib/array/Array<~lib/array/Array<u8>>#push
    drop
    local.get $3
    i32.const 1
    i32.add
    local.set $3
    br $for-loop|0
   end
  end
  local.get $4
 )
 (func $~lib/metashrew-runes/assembly/indexer/RunestoneMessage/RunestoneMessage#isNonOpReturnOutput (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  local.get $0
  i32.load offset=16
  local.tee $0
  i32.load
  local.get $0
  i32.load offset=4
  call $~lib/metashrew-as/assembly/utils/box/Box#constructor
  local.tee $1
  i32.load
  local.tee $2
  i32.load8_u
  local.set $0
  local.get $1
  local.get $2
  i32.const 1
  i32.add
  i32.store
  local.get $1
  local.get $1
  i32.load offset=4
  i32.const 1
  i32.sub
  i32.store offset=4
  local.get $0
  i32.const 106
  i32.ne
 )
 (func $~lib/metashrew-runes/assembly/indexer/RunestoneMessage/RunestoneMessage#numNonOpReturnOutputs (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  loop $for-loop|0
   local.get $1
   local.get $0
   i32.load offset=12
   i32.lt_s
   if
    local.get $2
    i32.const 1
    i32.add
    local.get $2
    local.get $0
    local.get $1
    call $~lib/array/Array<~lib/array/Array<u8>>#__get
    call $~lib/metashrew-runes/assembly/indexer/RunestoneMessage/RunestoneMessage#isNonOpReturnOutput
    select
    local.set $2
    local.get $1
    i32.const 1
    i32.add
    local.set $1
    br $for-loop|0
   end
  end
  i32.const 16
  i32.const 9
  call $~lib/rt/stub/__new
  local.tee $0
  local.get $2
  i64.extend_i32_s
  i64.store
  local.get $0
  i64.const 0
  i64.store offset=8
  local.get $0
 )
 (func $"~lib/map/Map<u32,~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet>#set" (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  local.get $0
  i32.load
  local.get $1
  local.tee $3
  i32.const -1028477379
  i32.mul
  i32.const 374761397
  i32.add
  i32.const 17
  i32.rotl
  i32.const 668265263
  i32.mul
  local.tee $1
  local.get $1
  i32.const 15
  i32.shr_u
  i32.xor
  i32.const -2048144777
  i32.mul
  local.tee $1
  local.get $1
  i32.const 13
  i32.shr_u
  i32.xor
  i32.const -1028477379
  i32.mul
  local.tee $1
  local.get $1
  i32.const 16
  i32.shr_u
  i32.xor
  local.tee $8
  local.get $0
  i32.load offset=4
  i32.and
  i32.const 2
  i32.shl
  i32.add
  i32.load
  local.set $1
  block $"__inlined_func$~lib/map/Map<u32,~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet>#find$3208"
   loop $while-continue|0
    local.get $1
    if
     local.get $1
     i32.load offset=8
     local.tee $4
     i32.const 1
     i32.and
     if (result i32)
      i32.const 0
     else
      local.get $1
      i32.load
      local.get $3
      i32.eq
     end
     br_if $"__inlined_func$~lib/map/Map<u32,~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet>#find$3208"
     local.get $4
     i32.const -2
     i32.and
     local.set $1
     br $while-continue|0
    end
   end
   i32.const 0
   local.set $1
  end
  local.get $1
  if
   local.get $1
   local.get $2
   i32.store offset=4
  else
   local.get $0
   i32.load offset=12
   local.tee $1
   local.get $0
   i32.load offset=16
   i32.eq
   if
    local.get $0
    i32.load offset=20
    local.get $1
    i32.const 3
    i32.mul
    i32.const 4
    i32.div_s
    i32.lt_s
    if (result i32)
     local.get $0
     i32.load offset=4
    else
     local.get $0
     i32.load offset=4
     i32.const 1
     i32.shl
     i32.const 1
     i32.or
    end
    local.tee $6
    i32.const 1
    i32.add
    local.tee $1
    i32.const 2
    i32.shl
    call $~lib/arraybuffer/ArrayBuffer#constructor
    local.set $7
    local.get $1
    i32.const 3
    i32.shl
    i32.const 3
    i32.div_s
    local.tee $9
    i32.const 12
    i32.mul
    call $~lib/arraybuffer/ArrayBuffer#constructor
    local.set $4
    local.get $0
    i32.load offset=8
    local.tee $5
    local.get $0
    i32.load offset=16
    i32.const 12
    i32.mul
    i32.add
    local.set $10
    local.get $4
    local.set $1
    loop $while-continue|00
     local.get $5
     local.get $10
     i32.ne
     if
      local.get $5
      i32.load offset=8
      i32.const 1
      i32.and
      i32.eqz
      if
       local.get $1
       local.get $5
       i32.load
       local.tee $11
       i32.store
       local.get $1
       local.get $5
       i32.load offset=4
       i32.store offset=4
       local.get $1
       local.get $7
       local.get $11
       i32.const -1028477379
       i32.mul
       i32.const 374761397
       i32.add
       i32.const 17
       i32.rotl
       i32.const 668265263
       i32.mul
       local.tee $11
       i32.const 15
       i32.shr_u
       local.get $11
       i32.xor
       i32.const -2048144777
       i32.mul
       local.tee $11
       i32.const 13
       i32.shr_u
       local.get $11
       i32.xor
       i32.const -1028477379
       i32.mul
       local.tee $11
       i32.const 16
       i32.shr_u
       local.get $11
       i32.xor
       local.get $6
       i32.and
       i32.const 2
       i32.shl
       i32.add
       local.tee $11
       i32.load
       i32.store offset=8
       local.get $11
       local.get $1
       i32.store
       local.get $1
       i32.const 12
       i32.add
       local.set $1
      end
      local.get $5
      i32.const 12
      i32.add
      local.set $5
      br $while-continue|00
     end
    end
    local.get $0
    local.get $7
    i32.store
    local.get $0
    local.get $6
    i32.store offset=4
    local.get $0
    local.get $4
    i32.store offset=8
    local.get $0
    local.get $9
    i32.store offset=12
    local.get $0
    local.get $0
    i32.load offset=20
    i32.store offset=16
   end
   local.get $0
   i32.load offset=8
   local.set $1
   local.get $0
   local.get $0
   i32.load offset=16
   local.tee $4
   i32.const 1
   i32.add
   i32.store offset=16
   local.get $1
   local.get $4
   i32.const 12
   i32.mul
   i32.add
   local.tee $1
   local.get $3
   i32.store
   local.get $1
   local.get $2
   i32.store offset=4
   local.get $0
   local.get $0
   i32.load offset=20
   i32.const 1
   i32.add
   i32.store offset=20
   local.get $1
   local.get $0
   i32.load
   local.get $8
   local.get $0
   i32.load offset=4
   i32.and
   i32.const 2
   i32.shl
   i32.add
   local.tee $0
   i32.load
   i32.store offset=8
   local.get $0
   local.get $1
   i32.store
  end
 )
 (func $"~lib/map/Map<u32,~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet>#get" (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  local.get $0
  i32.load
  local.get $0
  i32.load offset=4
  local.get $1
  i32.const -1028477379
  i32.mul
  i32.const 374761397
  i32.add
  i32.const 17
  i32.rotl
  i32.const 668265263
  i32.mul
  local.tee $0
  i32.const 15
  i32.shr_u
  local.get $0
  i32.xor
  i32.const -2048144777
  i32.mul
  local.tee $0
  i32.const 13
  i32.shr_u
  local.get $0
  i32.xor
  i32.const -1028477379
  i32.mul
  local.tee $0
  i32.const 16
  i32.shr_u
  local.get $0
  i32.xor
  i32.and
  i32.const 2
  i32.shl
  i32.add
  i32.load
  local.set $0
  block $"__inlined_func$~lib/map/Map<u32,~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet>#find$3209"
   loop $while-continue|0
    local.get $0
    if
     local.get $0
     i32.load offset=8
     local.tee $2
     i32.const 1
     i32.and
     if (result i32)
      i32.const 0
     else
      local.get $0
      i32.load
      local.get $1
      i32.eq
     end
     br_if $"__inlined_func$~lib/map/Map<u32,~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet>#find$3209"
     local.get $2
     i32.const -2
     i32.and
     local.set $0
     br $while-continue|0
    end
   end
   i32.const 0
   local.set $0
  end
  local.get $0
  i32.eqz
  if
   i32.const 5392
   i32.const 5456
   i32.const 105
   i32.const 17
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  i32.load offset=4
 )
 (func $~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet#decrease (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i64)
  (local $4 i32)
  (local $5 i64)
  local.get $0
  local.get $1
  call $~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet#get
  local.tee $4
  i64.load offset=8
  local.tee $3
  local.get $2
  i64.load offset=8
  local.tee $5
  i64.eq
  if (result i32)
   local.get $4
   i64.load
   local.get $2
   i64.load
   i64.lt_u
  else
   local.get $3
   local.get $5
   i64.lt_u
  end
  if
   return
  end
  local.get $4
  i64.load
  local.tee $3
  local.get $2
  i64.load
  i64.sub
  local.set $5
  local.get $4
  i64.load offset=8
  local.get $2
  i64.load offset=8
  i64.sub
  local.get $3
  local.get $5
  i64.lt_u
  i64.extend_i32_u
  i64.sub
  local.set $3
  i32.const 16
  i32.const 9
  call $~lib/rt/stub/__new
  local.tee $2
  local.get $5
  i64.store
  local.get $2
  local.get $3
  i64.store offset=8
  local.get $0
  local.get $1
  local.get $2
  call $~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet#set
 )
 (func $~lib/metashrew-runes/assembly/indexer/RunestoneMessage/RunestoneMessage#updateBalancesForEdict (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (param $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i64)
  (local $8 i64)
  local.get $0
  i32.load
  local.get $0
  i32.load offset=4
  local.get $3
  i32.const -1028477379
  i32.mul
  i32.const 374761397
  i32.add
  i32.const 17
  i32.rotl
  i32.const 668265263
  i32.mul
  local.tee $5
  local.get $5
  i32.const 15
  i32.shr_u
  i32.xor
  i32.const -2048144777
  i32.mul
  local.tee $5
  local.get $5
  i32.const 13
  i32.shr_u
  i32.xor
  i32.const -1028477379
  i32.mul
  local.tee $5
  local.get $5
  i32.const 16
  i32.shr_u
  i32.xor
  i32.and
  i32.const 2
  i32.shl
  i32.add
  i32.load
  local.set $5
  block $"__inlined_func$~lib/map/Map<u32,~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet>#find$3205"
   loop $while-continue|0
    local.get $5
    if
     local.get $5
     i32.load offset=8
     local.tee $6
     i32.const 1
     i32.and
     if (result i32)
      i32.const 0
     else
      local.get $5
      i32.load
      local.get $3
      i32.eq
     end
     br_if $"__inlined_func$~lib/map/Map<u32,~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet>#find$3205"
     local.get $6
     i32.const -2
     i32.and
     local.set $5
     br $while-continue|0
    end
   end
   i32.const 0
   local.set $5
  end
  local.get $5
  if
   local.get $0
   local.get $3
   call $"~lib/map/Map<u32,~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet>#get"
   local.set $3
  else
   local.get $0
   local.get $3
   i32.const 0
   call $~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet#constructor
   local.tee $3
   call $"~lib/map/Map<u32,~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet>#set"
  end
  local.get $2
  i64.load
  local.get $2
  i64.load offset=8
  i64.or
  i64.eqz
  if
   local.get $1
   local.get $4
   call $~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet#get
   local.set $0
  else
   block $__inlined_func$~lib/metashrew-runes/assembly/utils/min<~lib/as-bignum/assembly/integer/u128/u128>$3210
    local.get $1
    local.get $4
    call $~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet#get
    local.set $0
    local.get $2
    i64.load offset=8
    local.tee $7
    local.get $0
    i64.load offset=8
    local.tee $8
    i64.eq
    if (result i32)
     local.get $2
     i64.load
     local.get $0
     i64.load
     i64.gt_u
    else
     local.get $7
     local.get $8
     i64.gt_u
    end
    br_if $__inlined_func$~lib/metashrew-runes/assembly/utils/min<~lib/as-bignum/assembly/integer/u128/u128>$3210
    local.get $2
    local.set $0
   end
  end
  local.get $1
  local.get $4
  local.get $0
  call $~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet#decrease
  local.get $3
  local.get $4
  local.get $0
  call $~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet#increase
 )
 (func $~lib/metashrew-runes/assembly/indexer/RunestoneMessage/RunestoneMessage#processEdict (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (result i32)
  (local $4 i32)
  (local $5 i64)
  (local $6 i32)
  (local $7 i32)
  (local $8 i64)
  (local $9 i64)
  (local $10 i32)
  local.get $2
  i32.load
  local.tee $6
  i64.load
  local.get $6
  i64.load offset=8
  i64.or
  i64.eqz
  if (result i32)
   local.get $2
   i32.load offset=4
   local.tee $6
   i64.load
   local.get $6
   i64.load offset=8
   i64.or
   i64.const 0
   i64.ne
  else
   i32.const 0
  end
  if
   i32.const 1
   return
  end
  i32.const 0
  local.get $2
  i32.load
  i64.load
  local.get $2
  i32.load offset=4
  i64.load
  i32.wrap_i64
  call $~lib/metashrew-runes/assembly/indexer/RuneId/RuneId#constructor
  call $~lib/metashrew-runes/assembly/indexer/RuneId/RuneId#toBytes
  local.set $6
  local.get $2
  i32.load offset=12
  i64.load
  i32.wrap_i64
  local.tee $7
  local.get $3
  i32.load offset=12
  i32.gt_u
  if (result i32)
   i32.const 1
  else
   local.get $7
   local.get $3
   i32.load offset=12
   i32.eq
   if
    local.get $2
    i32.load offset=8
    local.tee $7
    i64.load
    local.get $7
    i64.load offset=8
    i64.or
    i64.eqz
    if
     local.get $3
     call $~lib/metashrew-runes/assembly/indexer/RunestoneMessage/RunestoneMessage#numNonOpReturnOutputs
     local.tee $7
     i64.load
     local.get $7
     i64.load offset=8
     i64.or
     i64.const 0
     i64.ne
     if
      local.get $1
      local.get $6
      call $~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet#get
      local.tee $2
      i64.load
      local.get $2
      i64.load offset=8
      local.get $7
      i64.load
      local.get $7
      i64.load offset=8
      call $~lib/as-bignum/assembly/globals/__udivmod128
      local.set $8
      global.get $~lib/as-bignum/assembly/globals/__divmod_quot_hi
      local.set $9
      i32.const 16
      i32.const 9
      call $~lib/rt/stub/__new
      local.tee $10
      local.get $8
      i64.store
      local.get $10
      local.get $9
      i64.store offset=8
      local.get $10
      i32.const 8
      i32.sub
      i32.load
      drop
      local.get $10
      local.get $10
      i64.load offset=8
      local.get $10
      i64.load
      local.tee $8
      i64.const 1
      i64.add
      local.tee $9
      local.get $8
      i64.lt_u
      i64.extend_i32_u
      i64.add
      i64.store offset=8
      local.get $10
      local.get $9
      i64.store
      local.get $1
      local.get $6
      call $~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet#get
      local.tee $2
      i64.load
      local.get $2
      i64.load offset=8
      local.get $7
      i64.load
      local.get $7
      i64.load offset=8
      call $~lib/as-bignum/assembly/globals/__udivmod128
      drop
      global.get $~lib/as-bignum/assembly/globals/__divmod_rem_lo
      local.set $8
      global.get $~lib/as-bignum/assembly/globals/__divmod_rem_hi
      local.set $9
      i32.const 16
      i32.const 9
      call $~lib/rt/stub/__new
      local.tee $2
      local.get $8
      i64.store
      local.get $2
      local.get $9
      i64.store offset=8
      loop $for-loop|0
       local.get $4
       local.get $3
       i32.load offset=12
       i32.lt_s
       if
        local.get $3
        local.get $4
        call $~lib/array/Array<~lib/array/Array<u8>>#__get
        call $~lib/metashrew-runes/assembly/indexer/RunestoneMessage/RunestoneMessage#isNonOpReturnOutput
        if
         local.get $5
         local.get $2
         i64.load
         i64.lt_u
         if
          local.get $0
          local.get $1
          local.get $10
          local.get $4
          local.get $6
          call $~lib/metashrew-runes/assembly/indexer/RunestoneMessage/RunestoneMessage#updateBalancesForEdict
          local.get $5
          i64.const 1
          i64.add
          local.set $5
         else
          local.get $0
          local.get $1
          local.get $10
          local.get $4
          local.get $6
          call $~lib/metashrew-runes/assembly/indexer/RunestoneMessage/RunestoneMessage#updateBalancesForEdict
         end
        end
        local.get $4
        i32.const 1
        i32.add
        local.set $4
        br $for-loop|0
       end
      end
     end
    else
     loop $for-loop|1
      local.get $4
      local.get $3
      i32.load offset=12
      i32.lt_s
      if
       local.get $3
       local.get $4
       call $~lib/array/Array<~lib/array/Array<u8>>#__get
       call $~lib/metashrew-runes/assembly/indexer/RunestoneMessage/RunestoneMessage#isNonOpReturnOutput
       if
        local.get $0
        local.get $1
        local.get $2
        i32.load offset=8
        local.get $4
        local.get $6
        call $~lib/metashrew-runes/assembly/indexer/RunestoneMessage/RunestoneMessage#updateBalancesForEdict
       end
       local.get $4
       i32.const 1
       i32.add
       local.set $4
       br $for-loop|1
      end
     end
    end
   else
    local.get $0
    local.get $1
    local.get $2
    i32.load offset=8
    local.get $7
    local.get $6
    call $~lib/metashrew-runes/assembly/indexer/RunestoneMessage/RunestoneMessage#updateBalancesForEdict
   end
   i32.const 0
  end
 )
 (func $~lib/array/Array<u32>#constructor (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  i32.const 16
  i32.const 6
  call $~lib/rt/stub/__new
  local.tee $1
  i32.const 0
  i32.store
  local.get $1
  i32.const 0
  i32.store offset=4
  local.get $1
  i32.const 0
  i32.store offset=8
  local.get $1
  i32.const 0
  i32.store offset=12
  local.get $0
  i32.const 268435455
  i32.gt_u
  if
   i32.const 2608
   i32.const 5344
   i32.const 70
   i32.const 60
   call $~lib/builtins/abort
   unreachable
  end
  i32.const 8
  local.get $0
  local.get $0
  i32.const 8
  i32.le_u
  select
  i32.const 2
  i32.shl
  local.tee $2
  i32.const 1
  call $~lib/rt/stub/__new
  local.tee $3
  i32.const 0
  local.get $2
  memory.fill
  local.get $1
  local.get $3
  i32.store
  local.get $1
  local.get $3
  i32.store offset=4
  local.get $1
  local.get $2
  i32.store offset=8
  local.get $1
  local.get $0
  i32.store offset=12
  local.get $1
 )
 (func $~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet#save (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  i32.const 1
  global.set $~argumentsLength
  local.get $1
  i32.const 8592
  i32.const 0
  call $~lib/string/String.UTF8.encode@varargs
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
  local.set $4
  i32.const 1
  global.set $~argumentsLength
  local.get $1
  i32.const 8624
  i32.const 0
  call $~lib/string/String.UTF8.encode@varargs
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
  local.set $1
  loop $for-loop|0
   local.get $3
   local.get $0
   i32.load
   i32.load offset=12
   i32.lt_s
   if
    local.get $0
    i32.load offset=4
    local.get $3
    call $~lib/array/Array<~lib/array/Array<u8>>#__get
    local.set $5
    i32.const 16
    i32.const 9
    call $~lib/rt/stub/__new
    local.tee $6
    i64.const 0
    i64.store
    local.get $6
    i64.const 0
    i64.store offset=8
    local.get $5
    i64.load offset=8
    local.get $6
    i64.load offset=8
    i64.eq
    if (result i32)
     local.get $5
     i64.load
     local.get $6
     i64.load
     i64.eq
    else
     i32.const 0
    end
    local.get $2
    i32.or
    i32.eqz
    if
     local.get $0
     i32.load
     local.get $3
     call $~lib/array/Array<~lib/array/Array<u8>>#__get
     local.set $5
     local.get $4
     call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#extend
     local.tee $6
     call $~lib/metashrew-as/assembly/indexer/index/hash
     local.set $7
     global.get $~lib/metashrew-as/assembly/indexer/index/_updates
     local.get $7
     local.get $5
     call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set"
     global.get $~lib/metashrew-as/assembly/indexer/index/_updateKeys
     local.get $7
     local.get $6
     call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set"
     local.get $0
     i32.load offset=4
     local.get $3
     call $~lib/array/Array<~lib/array/Array<u8>>#__get
     local.set $5
     i32.const 16
     call $~lib/array/Array<u8>#constructor
     local.tee $6
     i32.load offset=4
     local.tee $7
     local.get $5
     i64.load
     i64.store
     local.get $7
     local.get $5
     i64.load offset=8
     i64.store offset=8
     local.get $6
     i32.load
     local.set $5
     local.get $1
     call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#extend
     local.tee $6
     call $~lib/metashrew-as/assembly/indexer/index/hash
     local.set $7
     global.get $~lib/metashrew-as/assembly/indexer/index/_updates
     local.get $7
     local.get $5
     call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set"
     global.get $~lib/metashrew-as/assembly/indexer/index/_updateKeys
     local.get $7
     local.get $6
     call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set"
    end
    local.get $3
    i32.const 1
    i32.add
    local.set $3
    br $for-loop|0
   end
  end
 )
 (func $~lib/metashrew-runes/assembly/indexer/RunestoneMessage/RunestoneMessage#process (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (param $4 i32) (result i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i64)
  (local $11 i64)
  (local $12 i32)
  (local $13 i32)
  (local $14 i64)
  (local $15 i32)
  block $__inlined_func$~lib/metashrew-runes/assembly/indexer/RunestoneMessage/RunestoneMessage#loadBalanceSheet@override$1145
   local.get $0
   i32.const 8
   i32.sub
   i32.load
   i32.const 128
   i32.eq
   if
    local.get $1
    i32.load offset=12
    local.set $8
    local.get $0
    i32.load offset=20
    local.set $5
    i32.const 8
    i32.const 139
    call $~lib/rt/stub/__new
    local.tee $6
    i32.const 0
    i32.store
    local.get $6
    i32.const 0
    i32.store offset=4
    local.get $6
    local.get $5
    i32.store
    i32.const 16
    i32.const 72
    call $~lib/rt/stub/__new
    local.tee $7
    i32.const 0
    i32.store
    local.get $7
    i32.const 0
    i32.store offset=4
    local.get $7
    i32.const 0
    i32.store offset=8
    local.get $7
    i32.const 0
    i32.store offset=12
    i32.const 32
    i32.const 1
    call $~lib/rt/stub/__new
    local.tee $5
    i32.const 0
    i32.const 32
    memory.fill
    local.get $7
    local.get $5
    i32.store
    local.get $7
    local.get $5
    i32.store offset=4
    local.get $7
    i32.const 32
    i32.store offset=8
    local.get $7
    i32.const 0
    i32.store offset=12
    local.get $6
    local.get $7
    i32.store offset=4
    local.get $8
    i32.load offset=12
    local.set $7
    loop $for-loop|0
     local.get $13
     local.get $7
     local.get $8
     i32.load offset=12
     local.tee $5
     local.get $5
     local.get $7
     i32.gt_s
     select
     i32.lt_s
     if
      local.get $8
      i32.load offset=4
      local.get $13
      i32.const 2
      i32.shl
      i32.add
      i32.load
      local.set $5
      i32.const 4
      global.set $~argumentsLength
      local.get $6
      local.get $5
      local.get $13
      local.get $8
      i32.const 11632
      i32.load
      call_indirect (type $3)
      local.set $6
      local.get $13
      i32.const 1
      i32.add
      local.set $13
      br $for-loop|0
     end
    end
    local.get $6
    i32.load offset=4
    local.set $8
    i32.const 0
    call $~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet#constructor
    local.set $6
    i32.const 0
    local.set $13
    local.get $8
    i32.load offset=12
    local.set $7
    loop $for-loop|01
     local.get $13
     local.get $7
     local.get $8
     i32.load offset=12
     local.tee $5
     local.get $5
     local.get $7
     i32.gt_s
     select
     i32.lt_s
     if
      local.get $8
      i32.load offset=4
      local.get $13
      i32.const 2
      i32.shl
      i32.add
      i32.load
      local.set $5
      i32.const 4
      global.set $~argumentsLength
      local.get $6
      local.get $5
      local.get $13
      local.get $8
      i32.const 8704
      i32.load
      call_indirect (type $3)
      local.set $6
      local.get $13
      i32.const 1
      i32.add
      local.set $13
      br $for-loop|01
     end
    end
    br $__inlined_func$~lib/metashrew-runes/assembly/indexer/RunestoneMessage/RunestoneMessage#loadBalanceSheet@override$1145
   end
   local.get $1
   i32.load offset=12
   local.tee $12
   i32.load offset=12
   local.tee $9
   i32.const 2
   i32.const 72
   i32.const 0
   call $~lib/rt/__newArray
   local.tee $8
   i32.load offset=4
   local.set $7
   loop $for-loop|00
    local.get $5
    local.get $9
    local.get $12
    i32.load offset=12
    local.tee $6
    local.get $6
    local.get $9
    i32.gt_s
    select
    i32.lt_s
    if
     local.get $5
     i32.const 2
     i32.shl
     local.tee $6
     local.get $12
     i32.load offset=4
     i32.add
     i32.load
     local.set $15
     i32.const 3
     global.set $~argumentsLength
     local.get $6
     local.get $7
     i32.add
     local.get $15
     local.get $5
     local.get $12
     i32.const 8672
     i32.load
     call_indirect (type $2)
     i32.store
     local.get $5
     i32.const 1
     i32.add
     local.set $5
     br $for-loop|00
    end
   end
   i32.const 0
   call $~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet#constructor
   local.set $5
   local.get $8
   i32.load offset=12
   local.set $7
   loop $for-loop|001
    local.get $13
    local.get $7
    local.get $8
    i32.load offset=12
    local.tee $6
    local.get $6
    local.get $7
    i32.gt_s
    select
    i32.lt_s
    if
     local.get $8
     i32.load offset=4
     local.get $13
     i32.const 2
     i32.shl
     i32.add
     i32.load
     local.set $6
     i32.const 4
     global.set $~argumentsLength
     local.get $5
     local.get $6
     local.get $13
     local.get $8
     i32.const 8704
     i32.load
     call_indirect (type $3)
     local.set $5
     local.get $13
     i32.const 1
     i32.add
     local.set $13
     br $for-loop|001
    end
   end
   local.get $5
   local.set $6
  end
  i32.const 24
  i32.const 71
  call $~lib/rt/stub/__new
  local.tee $12
  i32.const 16
  call $~lib/arraybuffer/ArrayBuffer#constructor
  i32.store
  local.get $12
  i32.const 3
  i32.store offset=4
  local.get $12
  i32.const 48
  call $~lib/arraybuffer/ArrayBuffer#constructor
  i32.store offset=8
  local.get $12
  i32.const 4
  i32.store offset=12
  local.get $12
  i32.const 0
  i32.store offset=16
  local.get $12
  i32.const 0
  i32.store offset=20
  block $__inlined_func$~lib/metashrew-runes/assembly/indexer/RunestoneMessage/RunestoneMessage#mint@override$1146
   local.get $0
   i32.const 8
   i32.sub
   i32.load
   i32.const 128
   i32.eq
   if
    local.get $0
    i32.load8_u offset=25
    i32.eqz
    br_if $__inlined_func$~lib/metashrew-runes/assembly/indexer/RunestoneMessage/RunestoneMessage#mint@override$1146
    local.get $0
    local.get $3
    local.get $6
    call $~lib/metashrew-runes/assembly/indexer/RunestoneMessage/RunestoneMessage#mint
    br $__inlined_func$~lib/metashrew-runes/assembly/indexer/RunestoneMessage/RunestoneMessage#mint@override$1146
   end
   local.get $0
   local.get $3
   local.get $6
   call $~lib/metashrew-runes/assembly/indexer/RunestoneMessage/RunestoneMessage#mint
  end
  local.get $3
  i64.extend_i32_u
  local.set $10
  block $__inlined_func$~lib/metashrew-runes/assembly/indexer/RunestoneMessage/RunestoneMessage#etch@override$1147
   local.get $0
   i32.const 8
   i32.sub
   i32.load
   i32.const 128
   i32.eq
   if
    local.get $0
    i32.load8_u offset=24
    i32.eqz
    br_if $__inlined_func$~lib/metashrew-runes/assembly/indexer/RunestoneMessage/RunestoneMessage#etch@override$1147
    local.get $0
    local.get $10
    local.get $4
    local.get $6
    call $~lib/metashrew-runes/assembly/indexer/RunestoneMessage/RunestoneMessage#etch
    local.get $0
    i32.load offset=20
    i32.load offset=40
    i32.const 0
    local.get $10
    local.get $4
    call $~lib/metashrew-runes/assembly/indexer/RuneId/RuneId#constructor
    call $~lib/metashrew-runes/assembly/indexer/RuneId/RuneId#toBytes
    call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
    local.set $5
    i32.const 1
    call $~lib/arraybuffer/ArrayBuffer#constructor
    local.tee $4
    i32.const 1
    i32.store8
    local.get $5
    call $~lib/metashrew-as/assembly/indexer/index/hash
    local.set $3
    global.get $~lib/metashrew-as/assembly/indexer/index/_updates
    local.get $3
    local.get $4
    call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set"
    global.get $~lib/metashrew-as/assembly/indexer/index/_updateKeys
    local.get $3
    local.get $5
    call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set"
    br $__inlined_func$~lib/metashrew-runes/assembly/indexer/RunestoneMessage/RunestoneMessage#etch@override$1147
   end
   local.get $0
   local.get $10
   local.get $4
   local.get $6
   call $~lib/metashrew-runes/assembly/indexer/RunestoneMessage/RunestoneMessage#etch
  end
  block $__inlined_func$~lib/metashrew-runes/assembly/indexer/RunestoneMessage/RunestoneMessage#processEdicts$3719 (result i32)
   local.get $1
   i32.load offset=16
   local.set $9
   local.get $0
   i32.load offset=4
   call $~lib/metashrew-runes/assembly/indexer/Edict/Edict.fromDeltaSeries
   local.set $8
   i32.const 0
   local.set $13
   loop $for-loop|002
    local.get $13
    local.get $8
    i32.load offset=12
    i32.lt_s
    if
     i32.const 1
     block $__inlined_func$~lib/metashrew-runes/assembly/indexer/RunestoneMessage/RunestoneMessage#processEdict@override$1110 (result i32)
      local.get $8
      local.get $13
      call $~lib/array/Array<~lib/array/Array<u8>>#__get
      local.set $3
      local.get $0
      i32.const 8
      i32.sub
      i32.load
      i32.const 128
      i32.eq
      if
       block $__inlined_func$assembly/indexer/Protostone/Protostone#processEdict$131 (result i32)
        i32.const 0
        local.set $5
        i64.const 0
        local.set $14
        i32.const 1
        local.get $3
        i32.load
        local.tee $1
        i64.load
        local.get $1
        i64.load offset=8
        i64.or
        i64.eqz
        if (result i32)
         local.get $3
         i32.load offset=4
         local.tee $1
         i64.load
         local.get $1
         i64.load offset=8
         i64.or
         i64.const 0
         i64.ne
        else
         i32.const 0
        end
        br_if $__inlined_func$assembly/indexer/Protostone/Protostone#processEdict$131
        drop
        i32.const 0
        local.get $3
        i32.load
        i64.load
        local.get $3
        i32.load offset=4
        i64.load
        i32.wrap_i64
        call $~lib/metashrew-runes/assembly/indexer/RuneId/RuneId#constructor
        call $~lib/metashrew-runes/assembly/indexer/RuneId/RuneId#toBytes
        local.set $7
        local.get $3
        i32.load offset=12
        i64.load
        i32.wrap_i64
        local.tee $1
        local.get $9
        i32.load offset=12
        i32.eq
        if
         local.get $3
         i32.load offset=8
         local.tee $1
         i64.load
         local.get $1
         i64.load offset=8
         i64.or
         i64.eqz
         if
          local.get $9
          call $~lib/metashrew-runes/assembly/indexer/RunestoneMessage/RunestoneMessage#numNonOpReturnOutputs
          local.tee $4
          i64.load
          local.get $4
          i64.load offset=8
          i64.or
          i64.const 0
          i64.ne
          if
           local.get $6
           local.get $7
           call $~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet#get
           local.tee $1
           i64.load
           local.get $1
           i64.load offset=8
           local.get $4
           i64.load
           local.get $4
           i64.load offset=8
           call $~lib/as-bignum/assembly/globals/__udivmod128
           local.set $11
           global.get $~lib/as-bignum/assembly/globals/__divmod_quot_hi
           local.set $10
           i32.const 16
           i32.const 9
           call $~lib/rt/stub/__new
           local.tee $3
           local.get $11
           i64.store
           local.get $3
           local.get $10
           i64.store offset=8
           local.get $3
           i32.const 8
           i32.sub
           i32.load
           drop
           local.get $3
           local.get $3
           i64.load offset=8
           local.get $3
           i64.load
           local.tee $11
           i64.const 1
           i64.add
           local.tee $10
           local.get $11
           i64.lt_u
           i64.extend_i32_u
           i64.add
           i64.store offset=8
           local.get $3
           local.get $10
           i64.store
           local.get $6
           local.get $7
           call $~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet#get
           local.tee $1
           i64.load
           local.get $1
           i64.load offset=8
           local.get $4
           i64.load
           local.get $4
           i64.load offset=8
           call $~lib/as-bignum/assembly/globals/__udivmod128
           drop
           global.get $~lib/as-bignum/assembly/globals/__divmod_rem_lo
           local.set $11
           global.get $~lib/as-bignum/assembly/globals/__divmod_rem_hi
           local.set $10
           i32.const 16
           i32.const 9
           call $~lib/rt/stub/__new
           local.tee $1
           local.get $11
           i64.store
           local.get $1
           local.get $10
           i64.store offset=8
           loop $for-loop|02
            local.get $5
            local.get $9
            i32.load offset=12
            i32.lt_s
            if
             local.get $9
             local.get $5
             call $~lib/array/Array<~lib/array/Array<u8>>#__get
             call $~lib/metashrew-runes/assembly/indexer/RunestoneMessage/RunestoneMessage#isNonOpReturnOutput
             if
              local.get $14
              local.get $1
              i64.load
              i64.lt_u
              if
               local.get $12
               local.get $6
               local.get $3
               local.get $5
               local.get $7
               call $~lib/metashrew-runes/assembly/indexer/RunestoneMessage/RunestoneMessage#updateBalancesForEdict
               local.get $14
               i64.const 1
               i64.add
               local.set $14
              else
               local.get $12
               local.get $6
               local.get $3
               local.get $5
               local.get $7
               call $~lib/metashrew-runes/assembly/indexer/RunestoneMessage/RunestoneMessage#updateBalancesForEdict
              end
             end
             local.get $5
             i32.const 1
             i32.add
             local.set $5
             br $for-loop|02
            end
           end
          end
         else
          loop $for-loop|1
           local.get $5
           local.get $9
           i32.load offset=12
           i32.lt_s
           if
            local.get $9
            local.get $5
            call $~lib/array/Array<~lib/array/Array<u8>>#__get
            call $~lib/metashrew-runes/assembly/indexer/RunestoneMessage/RunestoneMessage#isNonOpReturnOutput
            if
             local.get $12
             local.get $6
             local.get $3
             i32.load offset=8
             local.get $5
             local.get $7
             call $~lib/metashrew-runes/assembly/indexer/RunestoneMessage/RunestoneMessage#updateBalancesForEdict
            end
            local.get $5
            i32.const 1
            i32.add
            local.set $5
            br $for-loop|1
           end
          end
         end
        else
         local.get $12
         local.get $6
         local.get $3
         i32.load offset=8
         local.get $1
         local.get $7
         call $~lib/metashrew-runes/assembly/indexer/RunestoneMessage/RunestoneMessage#updateBalancesForEdict
        end
        i32.const 0
       end
       br $__inlined_func$~lib/metashrew-runes/assembly/indexer/RunestoneMessage/RunestoneMessage#processEdict@override$1110
      end
      local.get $12
      local.get $6
      local.get $3
      local.get $9
      call $~lib/metashrew-runes/assembly/indexer/RunestoneMessage/RunestoneMessage#processEdict
     end
     br_if $__inlined_func$~lib/metashrew-runes/assembly/indexer/RunestoneMessage/RunestoneMessage#processEdicts$3719
     drop
     local.get $13
     i32.const 1
     i32.add
     local.set $13
     br $for-loop|002
    end
   end
   i32.const 0
  end
  local.set $9
  local.get $12
  i32.load
  local.get $12
  i32.load offset=4
  local.get $0
  i32.load offset=8
  local.tee $4
  i32.const -1028477379
  i32.mul
  i32.const 374761397
  i32.add
  i32.const 17
  i32.rotl
  i32.const 668265263
  i32.mul
  local.tee $1
  i32.const 15
  i32.shr_u
  local.get $1
  i32.xor
  i32.const -2048144777
  i32.mul
  local.tee $1
  i32.const 13
  i32.shr_u
  local.get $1
  i32.xor
  i32.const -1028477379
  i32.mul
  local.tee $1
  i32.const 16
  i32.shr_u
  local.get $1
  i32.xor
  i32.and
  i32.const 2
  i32.shl
  i32.add
  i32.load
  local.set $1
  block $"__inlined_func$~lib/map/Map<u32,~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet>#find$3205"
   loop $while-continue|0
    local.get $1
    if
     local.get $1
     i32.load offset=8
     local.tee $3
     i32.const 1
     i32.and
     if (result i32)
      i32.const 0
     else
      local.get $1
      i32.load
      local.get $4
      i32.eq
     end
     br_if $"__inlined_func$~lib/map/Map<u32,~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet>#find$3205"
     local.get $3
     i32.const -2
     i32.and
     local.set $1
     br $while-continue|0
    end
   end
   i32.const 0
   local.set $1
  end
  local.get $1
  if
   local.get $6
   local.get $12
   local.get $4
   call $"~lib/map/Map<u32,~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet>#get"
   call $~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet#pipe
  else
   local.get $12
   local.get $4
   local.get $6
   call $"~lib/map/Map<u32,~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet>#set"
  end
  local.get $12
  i32.load offset=8
  local.set $8
  local.get $12
  i32.load offset=16
  local.tee $6
  call $~lib/array/Array<u32>#constructor
  local.set $7
  i32.const 0
  local.set $3
  i32.const 0
  local.set $13
  loop $for-loop|023
   local.get $6
   local.get $13
   i32.gt_s
   if
    local.get $8
    local.get $13
    i32.const 12
    i32.mul
    i32.add
    local.tee $1
    i32.load offset=8
    i32.const 1
    i32.and
    i32.eqz
    if
     local.get $1
     i32.load
     local.set $5
     local.get $3
     local.tee $1
     i32.const 1
     i32.add
     local.set $3
     local.get $1
     local.get $7
     i32.load offset=12
     i32.ge_u
     if
      local.get $1
      i32.const 0
      i32.lt_s
      if
       i32.const 3344
       i32.const 5344
       i32.const 130
       i32.const 22
       call $~lib/builtins/abort
       unreachable
      end
      local.get $7
      local.get $1
      i32.const 1
      i32.add
      local.tee $4
      i32.const 2
      i32.const 1
      call $~lib/array/ensureCapacity
      local.get $7
      local.get $4
      i32.store offset=12
     end
     local.get $7
     i32.load offset=4
     local.get $1
     i32.const 2
     i32.shl
     i32.add
     local.get $5
     i32.store
    end
    local.get $13
    i32.const 1
    i32.add
    local.set $13
    br $for-loop|023
   end
  end
  local.get $7
  local.get $3
  i32.const 2
  i32.const 0
  call $~lib/array/ensureCapacity
  local.get $7
  local.get $3
  i32.store offset=12
  i32.const 0
  local.set $3
  loop $for-loop|004
   local.get $3
   local.get $7
   i32.load offset=12
   i32.lt_s
   if
    local.get $12
    local.get $7
    local.get $3
    call $~lib/array/Array<u32>#__get
    call $"~lib/map/Map<u32,~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet>#get"
    local.set $6
    local.get $7
    local.get $3
    call $~lib/array/Array<u32>#__get
    local.set $1
    block $__inlined_func$~lib/metashrew-runes/assembly/indexer/RunestoneMessage/RunestoneMessage#saveBalanceSheet@override$1149 (result i32)
     local.get $0
     i32.const 8
     i32.sub
     i32.load
     i32.const 128
     i32.eq
     if
      local.get $0
      i32.load offset=20
      i32.load offset=4
      br $__inlined_func$~lib/metashrew-runes/assembly/indexer/RunestoneMessage/RunestoneMessage#saveBalanceSheet@override$1149
     end
     global.get $~lib/metashrew-runes/assembly/indexer/constants/index/OUTPOINT_TO_RUNES
    end
    local.set $5
    local.get $2
    local.get $1
    call $~lib/metashrew-as/assembly/blockdata/transaction/OutPoint.from
    i32.load
    local.tee $4
    i32.load offset=4
    call $~lib/arraybuffer/ArrayBuffer#constructor
    local.tee $1
    local.get $4
    i32.load
    local.get $4
    i32.load offset=4
    memory.copy
    local.get $5
    local.get $1
    call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
    local.set $1
    block $__inlined_func$~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet#save@override$264
     local.get $6
     i32.const 8
     i32.sub
     i32.load
     i32.const 57
     i32.eq
     br_if $__inlined_func$~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet#save@override$264
    end
    local.get $6
    local.get $1
    local.get $9
    call $~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet#save
    local.get $3
    i32.const 1
    i32.add
    local.set $3
    br $for-loop|004
   end
  end
  local.get $12
 )
 (func $~lib/metashrew-runes/assembly/indexer/Indexer/RunesIndex#indexBlock (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i64)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (local $12 i32)
  (local $13 i32)
  local.get $1
  i32.const 840000
  i32.eq
  if
   call $~lib/metashrew-runes/assembly/indexer/RunestoneMessage/RunestoneMessage.etchGenesisRune
  end
  global.get $~lib/metashrew-runes/assembly/indexer/constants/index/HEIGHT_TO_BLOCKHASH
  local.get $1
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#selectValue<u32>
  local.set $4
  local.get $2
  local.tee $3
  call $~lib/metashrew-as/assembly/blockdata/block/Block#blockhash
  local.set $7
  local.get $4
  call $~lib/metashrew-as/assembly/indexer/index/hash
  local.set $8
  global.get $~lib/metashrew-as/assembly/indexer/index/_updates
  local.get $8
  local.get $7
  call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set"
  global.get $~lib/metashrew-as/assembly/indexer/index/_updateKeys
  local.get $8
  local.get $4
  call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set"
  global.get $~lib/metashrew-runes/assembly/indexer/constants/index/BLOCKHASH_TO_HEIGHT
  local.get $2
  call $~lib/metashrew-as/assembly/blockdata/block/Block#blockhash
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
  local.set $2
  i32.const 4
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.tee $4
  local.get $1
  i32.store
  local.get $2
  call $~lib/metashrew-as/assembly/indexer/index/hash
  local.set $7
  global.get $~lib/metashrew-as/assembly/indexer/index/_updates
  local.get $7
  local.get $4
  call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set"
  global.get $~lib/metashrew-as/assembly/indexer/index/_updateKeys
  local.get $7
  local.get $2
  call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set"
  global.get $~lib/metashrew-runes/assembly/indexer/constants/index/HEIGHT_TO_TRANSACTION_IDS
  local.get $1
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#selectValue<u32>
  local.set $4
  i32.const 0
  local.set $2
  loop $for-loop|0
   local.get $2
   local.get $3
   i32.load offset=8
   local.tee $7
   i32.load offset=12
   i32.lt_s
   if
    local.get $7
    local.get $2
    call $~lib/array/Array<~lib/array/Array<u8>>#__get
    call $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#txid
    local.set $7
    local.get $4
    call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#extend
    local.tee $8
    call $~lib/metashrew-as/assembly/indexer/index/hash
    local.set $9
    global.get $~lib/metashrew-as/assembly/indexer/index/_updates
    local.get $9
    local.get $7
    call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set"
    global.get $~lib/metashrew-as/assembly/indexer/index/_updateKeys
    local.get $9
    local.get $8
    call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set"
    local.get $2
    i32.const 1
    i32.add
    local.set $2
    br $for-loop|0
   end
  end
  loop $for-loop|00
   local.get $5
   local.get $3
   i32.load offset=8
   local.tee $2
   i32.load offset=12
   i32.lt_s
   if
    local.get $2
    local.get $5
    call $~lib/array/Array<~lib/array/Array<u8>>#__get
    local.tee $7
    call $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#txid
    local.set $8
    i32.const 0
    local.set $2
    loop $for-loop|01
     local.get $2
     local.get $7
     i32.load offset=16
     i32.load offset=12
     i32.lt_s
     if
      global.get $~lib/metashrew-runes/assembly/indexer/constants/index/OUTPOINT_TO_HEIGHT
      local.set $4
      local.get $8
      local.get $2
      call $~lib/metashrew-as/assembly/blockdata/transaction/OutPoint.from
      i32.load
      local.tee $9
      i32.load offset=4
      call $~lib/arraybuffer/ArrayBuffer#constructor
      local.tee $10
      local.get $9
      i32.load
      local.get $9
      i32.load offset=4
      memory.copy
      local.get $4
      local.get $10
      call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
      local.set $4
      i32.const 4
      call $~lib/arraybuffer/ArrayBuffer#constructor
      local.tee $9
      local.get $1
      i32.store
      local.get $4
      call $~lib/metashrew-as/assembly/indexer/index/hash
      local.set $10
      global.get $~lib/metashrew-as/assembly/indexer/index/_updates
      local.get $10
      local.get $9
      call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set"
      global.get $~lib/metashrew-as/assembly/indexer/index/_updateKeys
      local.get $10
      local.get $4
      call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set"
      local.get $2
      i32.const 1
      i32.add
      local.set $2
      br $for-loop|01
     end
    end
    block $__inlined_func$~lib/metashrew-runes/assembly/indexer/Indexer/RunesIndex#processRunestone@override$1153
     block $default
      block $case4
       block $case3
        block $case2
         block $case1
          block $case0
           local.get $0
           i32.const 8
           i32.sub
           i32.load
           local.tee $2
           i32.const 63
           i32.eq
           br_if $case0
           local.get $2
           i32.const 49
           i32.eq
           br_if $case0
           local.get $2
           i32.const 118
           i32.eq
           br_if $case1
           local.get $2
           i32.const 116
           i32.eq
           br_if $case1
           local.get $2
           i32.const 121
           i32.eq
           br_if $case2
           local.get $2
           i32.const 119
           i32.eq
           br_if $case2
           local.get $2
           i32.const 124
           i32.eq
           br_if $case3
           local.get $2
           i32.const 122
           i32.eq
           br_if $case3
           local.get $2
           i32.const 127
           i32.eq
           br_if $case4
           local.get $2
           i32.const 125
           i32.eq
           br_if $case4
           br $default
          end
          local.get $7
          call $~lib/metashrew-runes/assembly/indexer/RunesTransaction/RunesTransaction#runestone
          local.tee $4
          local.get $0
          i32.load8_u
          i32.store8 offset=24
          local.get $4
          local.get $0
          i32.load8_u offset=1
          i32.store8 offset=25
          local.get $4
          i32.load
          local.tee $2
          i32.load
          local.get $2
          i32.load offset=4
          i32.const 857269166
          i32.and
          i32.const 2
          i32.shl
          i32.add
          i32.load
          local.set $2
          block $"__inlined_func$~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#find$3725"
           loop $while-continue|0
            local.get $2
            if
             local.get $2
             i32.load offset=12
             local.tee $9
             i32.const 1
             i32.and
             if (result i32)
              i32.const 0
             else
              local.get $2
              i64.load
              i64.const 22
              i64.eq
             end
             br_if $"__inlined_func$~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#find$3725"
             local.get $9
             i32.const -2
             i32.and
             local.set $2
             br $while-continue|0
            end
           end
           i32.const 0
           local.set $2
          end
          local.get $2
          if (result i32)
           local.get $4
           i32.load
           i64.const 22
           call $"~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#get"
           i32.const 0
           call $~lib/array/Array<~lib/array/Array<u8>>#__get
           i64.load
           i32.wrap_i64
          else
           local.get $7
           call $~lib/metashrew-runes/assembly/indexer/RunesTransaction/RunesTransaction#defaultOutput
          end
          local.set $2
          local.get $4
          if
           local.get $4
           local.get $7
           local.get $8
           local.get $1
           local.get $5
           call $~lib/metashrew-runes/assembly/indexer/RunestoneMessage/RunestoneMessage#process
           local.set $9
           local.get $4
           local.get $7
           i32.load offset=16
           i32.load offset=12
           i32.const 1
           i32.add
           call $assembly/indexer/Protostone/Protostone#protostones
           local.tee $10
           call $assembly/indexer/Protostone/ProtostoneTable#burns
           local.set $11
           local.get $7
           call $~lib/metashrew-runes/assembly/indexer/RunesTransaction/RunesTransaction#runestoneOutputIndex
           local.set $12
           local.get $4
           i32.load offset=4
           call $~lib/metashrew-runes/assembly/indexer/Edict/Edict.fromDeltaSeries
           local.set $4
           local.get $11
           i32.load offset=12
           i32.const 0
           i32.gt_s
           if
            local.get $2
            local.get $9
            local.get $8
            local.get $12
            local.get $4
            local.get $11
            call $assembly/indexer/Indexer/Protorune<assembly/indexer/protomessage/MessageContext/MessageContext>#processProtoburns<assembly/indexer/Protoburn/Protoburn>
           end
           local.get $10
           i32.load
           local.set $9
           local.get $1
           i64.extend_i32_u
           local.set $6
           i32.const 0
           local.set $2
           loop $for-loop|02
            local.get $2
            local.get $9
            i32.load offset=12
            i32.lt_s
            if
             local.get $9
             local.get $2
             call $~lib/array/Array<~lib/array/Array<u8>>#__get
             local.tee $10
             i32.load offset=16
             local.set $4
             i32.const 16
             i32.const 9
             call $~lib/rt/stub/__new
             local.tee $11
             i64.const 0
             i64.store
             local.get $11
             i64.const 64
             i64.store offset=8
             local.get $4
             i64.load offset=8
             local.get $11
             i64.load offset=8
             i64.eq
             if (result i32)
              local.get $4
              i64.load
              local.get $11
              i64.load
              i64.eq
             else
              i32.const 0
             end
             if
              local.get $10
              i32.load
              local.tee $4
              i32.load
              local.get $4
              i32.load offset=4
              i32.const 1720617444
              i32.and
              i32.const 2
              i32.shl
              i32.add
              i32.load
              local.set $4
              block $"__inlined_func$~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#find$3506"
               loop $while-continue|00
                local.get $4
                if
                 local.get $4
                 i32.load offset=12
                 local.tee $11
                 i32.const 1
                 i32.and
                 if (result i32)
                  i32.const 0
                 else
                  local.get $4
                  i64.load
                  i64.const 81
                  i64.eq
                 end
                 br_if $"__inlined_func$~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#find$3506"
                 local.get $11
                 i32.const -2
                 i32.and
                 local.set $4
                 br $while-continue|00
                end
               end
               i32.const 0
               local.set $4
              end
              local.get $4
              if
               local.get $10
               local.get $7
               i32.load offset=16
               i32.load offset=12
               i32.const 1
               i32.add
               local.get $2
               i32.add
               call $assembly/indexer/protomessage/ProtoMessage/ProtoMessage.from
               local.set $4
               i32.const 16
               i32.const 9
               call $~lib/rt/stub/__new
               local.tee $10
               i64.const 0
               i64.store
               local.get $10
               i64.const 64
               i64.store offset=8
               i32.const 0
               local.get $10
               local.get $7
               local.get $3
               local.get $6
               local.get $5
               local.get $4
               i32.load
               local.get $4
               i32.load offset=8
               local.get $4
               i32.load offset=12
               local.get $4
               i32.load offset=4
               call $assembly/indexer/protomessage/MessageContext/MessageContext#constructor
               call $assembly/indexer/protomessage/MessageContext/MessageContext#run
              else
               local.get $10
               i32.load offset=4
               i32.load offset=12
               if
                local.get $10
                local.get $7
                local.get $8
                local.get $6
                i32.wrap_i64
                local.get $5
                call $~lib/metashrew-runes/assembly/indexer/RunestoneMessage/RunestoneMessage#process
                drop
               end
              end
             end
             local.get $2
             i32.const 1
             i32.add
             local.set $2
             br $for-loop|02
            end
           end
          end
          br $__inlined_func$~lib/metashrew-runes/assembly/indexer/Indexer/RunesIndex#processRunestone@override$1153
         end
         local.get $7
         call $~lib/metashrew-runes/assembly/indexer/RunesTransaction/RunesTransaction#runestone
         local.tee $4
         local.get $0
         i32.load8_u
         i32.store8 offset=24
         local.get $4
         local.get $0
         i32.load8_u offset=1
         i32.store8 offset=25
         local.get $4
         i32.load
         local.tee $2
         i32.load
         local.get $2
         i32.load offset=4
         i32.const 857269166
         i32.and
         i32.const 2
         i32.shl
         i32.add
         i32.load
         local.set $2
         block $"__inlined_func$~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#find$3730"
          loop $while-continue|03
           local.get $2
           if
            local.get $2
            i32.load offset=12
            local.tee $9
            i32.const 1
            i32.and
            if (result i32)
             i32.const 0
            else
             local.get $2
             i64.load
             i64.const 22
             i64.eq
            end
            br_if $"__inlined_func$~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#find$3730"
            local.get $9
            i32.const -2
            i32.and
            local.set $2
            br $while-continue|03
           end
          end
          i32.const 0
          local.set $2
         end
         local.get $2
         if (result i32)
          local.get $4
          i32.load
          i64.const 22
          call $"~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#get"
          i32.const 0
          call $~lib/array/Array<~lib/array/Array<u8>>#__get
          i64.load
          i32.wrap_i64
         else
          local.get $7
          call $~lib/metashrew-runes/assembly/indexer/RunesTransaction/RunesTransaction#defaultOutput
         end
         local.set $2
         local.get $4
         if
          local.get $4
          local.get $7
          local.get $8
          local.get $1
          local.get $5
          call $~lib/metashrew-runes/assembly/indexer/RunestoneMessage/RunestoneMessage#process
          local.set $9
          local.get $4
          local.get $7
          i32.load offset=16
          i32.load offset=12
          i32.const 1
          i32.add
          call $assembly/indexer/Protostone/Protostone#protostones
          local.tee $10
          call $assembly/indexer/Protostone/ProtostoneTable#burns
          local.set $11
          local.get $7
          call $~lib/metashrew-runes/assembly/indexer/RunesTransaction/RunesTransaction#runestoneOutputIndex
          local.set $12
          local.get $4
          i32.load offset=4
          call $~lib/metashrew-runes/assembly/indexer/Edict/Edict.fromDeltaSeries
          local.set $4
          local.get $11
          i32.load offset=12
          i32.const 0
          i32.gt_s
          if
           local.get $2
           local.get $9
           local.get $8
           local.get $12
           local.get $4
           local.get $11
           call $assembly/indexer/Indexer/Protorune<assembly/indexer/protomessage/MessageContext/MessageContext>#processProtoburns<assembly/indexer/Protoburn/Protoburn>
          end
          local.get $10
          i32.load
          local.set $9
          local.get $1
          i64.extend_i32_u
          local.set $6
          i32.const 0
          local.set $2
          loop $for-loop|03
           local.get $2
           local.get $9
           i32.load offset=12
           i32.lt_s
           if
            local.get $9
            local.get $2
            call $~lib/array/Array<~lib/array/Array<u8>>#__get
            local.tee $10
            i32.load offset=16
            local.set $4
            i32.const 16
            i32.const 9
            call $~lib/rt/stub/__new
            local.tee $11
            i64.const 0
            i64.store
            local.get $11
            i64.const 64
            i64.store offset=8
            local.get $4
            i64.load offset=8
            local.get $11
            i64.load offset=8
            i64.eq
            if (result i32)
             local.get $4
             i64.load
             local.get $11
             i64.load
             i64.eq
            else
             i32.const 0
            end
            if
             local.get $10
             i32.load
             local.tee $4
             i32.load
             local.get $4
             i32.load offset=4
             i32.const 1720617444
             i32.and
             i32.const 2
             i32.shl
             i32.add
             i32.load
             local.set $4
             block $"__inlined_func$~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#find$35060"
              loop $while-continue|01
               local.get $4
               if
                local.get $4
                i32.load offset=12
                local.tee $11
                i32.const 1
                i32.and
                if (result i32)
                 i32.const 0
                else
                 local.get $4
                 i64.load
                 i64.const 81
                 i64.eq
                end
                br_if $"__inlined_func$~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#find$35060"
                local.get $11
                i32.const -2
                i32.and
                local.set $4
                br $while-continue|01
               end
              end
              i32.const 0
              local.set $4
             end
             local.get $4
             if
              local.get $10
              local.get $7
              i32.load offset=16
              i32.load offset=12
              i32.const 1
              i32.add
              local.get $2
              i32.add
              call $assembly/indexer/protomessage/ProtoMessage/ProtoMessage.from
              local.set $4
              i32.const 16
              i32.const 9
              call $~lib/rt/stub/__new
              local.tee $10
              i64.const 0
              i64.store
              local.get $10
              i64.const 64
              i64.store offset=8
              local.get $4
              i32.load
              local.set $11
              local.get $4
              i32.load offset=8
              local.set $12
              local.get $4
              i32.load offset=12
              local.set $13
              local.get $4
              i32.load offset=4
              local.set $4
              i32.const 68
              i32.const 117
              call $~lib/rt/stub/__new
              local.get $10
              local.get $7
              local.get $3
              local.get $6
              local.get $5
              local.get $11
              local.get $12
              local.get $13
              local.get $4
              call $assembly/indexer/protomessage/MessageContext/MessageContext#constructor
              call $assembly/indexer/protomessage/MessageContext/MessageContext#run
             else
              local.get $10
              i32.load offset=4
              i32.load offset=12
              if
               local.get $10
               local.get $7
               local.get $8
               local.get $6
               i32.wrap_i64
               local.get $5
               call $~lib/metashrew-runes/assembly/indexer/RunestoneMessage/RunestoneMessage#process
               drop
              end
             end
            end
            local.get $2
            i32.const 1
            i32.add
            local.set $2
            br $for-loop|03
           end
          end
         end
         br $__inlined_func$~lib/metashrew-runes/assembly/indexer/Indexer/RunesIndex#processRunestone@override$1153
        end
        local.get $7
        call $~lib/metashrew-runes/assembly/indexer/RunesTransaction/RunesTransaction#runestone
        local.tee $4
        local.get $0
        i32.load8_u
        i32.store8 offset=24
        local.get $4
        local.get $0
        i32.load8_u offset=1
        i32.store8 offset=25
        local.get $4
        i32.load
        local.tee $2
        i32.load
        local.get $2
        i32.load offset=4
        i32.const 857269166
        i32.and
        i32.const 2
        i32.shl
        i32.add
        i32.load
        local.set $2
        block $"__inlined_func$~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#find$3735"
         loop $while-continue|04
          local.get $2
          if
           local.get $2
           i32.load offset=12
           local.tee $9
           i32.const 1
           i32.and
           if (result i32)
            i32.const 0
           else
            local.get $2
            i64.load
            i64.const 22
            i64.eq
           end
           br_if $"__inlined_func$~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#find$3735"
           local.get $9
           i32.const -2
           i32.and
           local.set $2
           br $while-continue|04
          end
         end
         i32.const 0
         local.set $2
        end
        local.get $2
        if (result i32)
         local.get $4
         i32.load
         i64.const 22
         call $"~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#get"
         i32.const 0
         call $~lib/array/Array<~lib/array/Array<u8>>#__get
         i64.load
         i32.wrap_i64
        else
         local.get $7
         call $~lib/metashrew-runes/assembly/indexer/RunesTransaction/RunesTransaction#defaultOutput
        end
        local.set $2
        local.get $4
        if
         local.get $4
         local.get $7
         local.get $8
         local.get $1
         local.get $5
         call $~lib/metashrew-runes/assembly/indexer/RunestoneMessage/RunestoneMessage#process
         local.set $9
         local.get $4
         local.get $7
         i32.load offset=16
         i32.load offset=12
         i32.const 1
         i32.add
         call $assembly/indexer/Protostone/Protostone#protostones
         local.tee $10
         call $assembly/indexer/Protostone/ProtostoneTable#burns
         local.set $11
         local.get $7
         call $~lib/metashrew-runes/assembly/indexer/RunesTransaction/RunesTransaction#runestoneOutputIndex
         local.set $12
         local.get $4
         i32.load offset=4
         call $~lib/metashrew-runes/assembly/indexer/Edict/Edict.fromDeltaSeries
         local.set $4
         local.get $11
         i32.load offset=12
         i32.const 0
         i32.gt_s
         if
          local.get $2
          local.get $9
          local.get $8
          local.get $12
          local.get $4
          local.get $11
          call $assembly/indexer/Indexer/Protorune<assembly/indexer/protomessage/MessageContext/MessageContext>#processProtoburns<assembly/indexer/Protoburn/Protoburn>
         end
         local.get $10
         i32.load
         local.set $9
         local.get $1
         i64.extend_i32_u
         local.set $6
         i32.const 0
         local.set $2
         loop $for-loop|04
          local.get $2
          local.get $9
          i32.load offset=12
          i32.lt_s
          if
           local.get $9
           local.get $2
           call $~lib/array/Array<~lib/array/Array<u8>>#__get
           local.tee $10
           i32.load offset=16
           local.set $4
           i32.const 16
           i32.const 9
           call $~lib/rt/stub/__new
           local.tee $11
           i64.const 0
           i64.store
           local.get $11
           i64.const 64
           i64.store offset=8
           local.get $4
           i64.load offset=8
           local.get $11
           i64.load offset=8
           i64.eq
           if (result i32)
            local.get $4
            i64.load
            local.get $11
            i64.load
            i64.eq
           else
            i32.const 0
           end
           if
            local.get $10
            i32.load
            local.tee $4
            i32.load
            local.get $4
            i32.load offset=4
            i32.const 1720617444
            i32.and
            i32.const 2
            i32.shl
            i32.add
            i32.load
            local.set $4
            block $"__inlined_func$~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#find$35061"
             loop $while-continue|02
              local.get $4
              if
               local.get $4
               i32.load offset=12
               local.tee $11
               i32.const 1
               i32.and
               if (result i32)
                i32.const 0
               else
                local.get $4
                i64.load
                i64.const 81
                i64.eq
               end
               br_if $"__inlined_func$~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#find$35061"
               local.get $11
               i32.const -2
               i32.and
               local.set $4
               br $while-continue|02
              end
             end
             i32.const 0
             local.set $4
            end
            local.get $4
            if
             local.get $10
             local.get $7
             i32.load offset=16
             i32.load offset=12
             i32.const 1
             i32.add
             local.get $2
             i32.add
             call $assembly/indexer/protomessage/ProtoMessage/ProtoMessage.from
             local.set $4
             i32.const 16
             i32.const 9
             call $~lib/rt/stub/__new
             local.tee $10
             i64.const 0
             i64.store
             local.get $10
             i64.const 64
             i64.store offset=8
             local.get $4
             i32.load
             local.set $11
             local.get $4
             i32.load offset=8
             local.set $12
             local.get $4
             i32.load offset=12
             local.set $13
             local.get $4
             i32.load offset=4
             local.set $4
             i32.const 68
             i32.const 120
             call $~lib/rt/stub/__new
             local.get $10
             local.get $7
             local.get $3
             local.get $6
             local.get $5
             local.get $11
             local.get $12
             local.get $13
             local.get $4
             call $assembly/indexer/protomessage/MessageContext/MessageContext#constructor
             call $assembly/indexer/protomessage/MessageContext/MessageContext#run
            else
             local.get $10
             i32.load offset=4
             i32.load offset=12
             if
              local.get $10
              local.get $7
              local.get $8
              local.get $6
              i32.wrap_i64
              local.get $5
              call $~lib/metashrew-runes/assembly/indexer/RunestoneMessage/RunestoneMessage#process
              drop
             end
            end
           end
           local.get $2
           i32.const 1
           i32.add
           local.set $2
           br $for-loop|04
          end
         end
        end
        br $__inlined_func$~lib/metashrew-runes/assembly/indexer/Indexer/RunesIndex#processRunestone@override$1153
       end
       local.get $7
       call $~lib/metashrew-runes/assembly/indexer/RunesTransaction/RunesTransaction#runestone
       local.tee $4
       local.get $0
       i32.load8_u
       i32.store8 offset=24
       local.get $4
       local.get $0
       i32.load8_u offset=1
       i32.store8 offset=25
       local.get $4
       i32.load
       local.tee $2
       i32.load
       local.get $2
       i32.load offset=4
       i32.const 857269166
       i32.and
       i32.const 2
       i32.shl
       i32.add
       i32.load
       local.set $2
       block $"__inlined_func$~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#find$3740"
        loop $while-continue|05
         local.get $2
         if
          local.get $2
          i32.load offset=12
          local.tee $9
          i32.const 1
          i32.and
          if (result i32)
           i32.const 0
          else
           local.get $2
           i64.load
           i64.const 22
           i64.eq
          end
          br_if $"__inlined_func$~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#find$3740"
          local.get $9
          i32.const -2
          i32.and
          local.set $2
          br $while-continue|05
         end
        end
        i32.const 0
        local.set $2
       end
       local.get $2
       if (result i32)
        local.get $4
        i32.load
        i64.const 22
        call $"~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#get"
        i32.const 0
        call $~lib/array/Array<~lib/array/Array<u8>>#__get
        i64.load
        i32.wrap_i64
       else
        local.get $7
        call $~lib/metashrew-runes/assembly/indexer/RunesTransaction/RunesTransaction#defaultOutput
       end
       local.set $2
       local.get $4
       if
        local.get $4
        local.get $7
        local.get $8
        local.get $1
        local.get $5
        call $~lib/metashrew-runes/assembly/indexer/RunestoneMessage/RunestoneMessage#process
        local.set $9
        local.get $4
        local.get $7
        i32.load offset=16
        i32.load offset=12
        i32.const 1
        i32.add
        call $assembly/indexer/Protostone/Protostone#protostones
        local.tee $10
        call $assembly/indexer/Protostone/ProtostoneTable#burns
        local.set $11
        local.get $7
        call $~lib/metashrew-runes/assembly/indexer/RunesTransaction/RunesTransaction#runestoneOutputIndex
        local.set $12
        local.get $4
        i32.load offset=4
        call $~lib/metashrew-runes/assembly/indexer/Edict/Edict.fromDeltaSeries
        local.set $4
        local.get $11
        i32.load offset=12
        i32.const 0
        i32.gt_s
        if
         local.get $2
         local.get $9
         local.get $8
         local.get $12
         local.get $4
         local.get $11
         call $assembly/indexer/Indexer/Protorune<assembly/indexer/protomessage/MessageContext/MessageContext>#processProtoburns<assembly/indexer/Protoburn/Protoburn>
        end
        local.get $10
        i32.load
        local.set $9
        local.get $1
        i64.extend_i32_u
        local.set $6
        i32.const 0
        local.set $2
        loop $for-loop|05
         local.get $2
         local.get $9
         i32.load offset=12
         i32.lt_s
         if
          local.get $9
          local.get $2
          call $~lib/array/Array<~lib/array/Array<u8>>#__get
          local.tee $10
          i32.load offset=16
          local.set $4
          i32.const 16
          i32.const 9
          call $~lib/rt/stub/__new
          local.tee $11
          i64.const 0
          i64.store
          local.get $11
          i64.const 64
          i64.store offset=8
          local.get $4
          i64.load offset=8
          local.get $11
          i64.load offset=8
          i64.eq
          if (result i32)
           local.get $4
           i64.load
           local.get $11
           i64.load
           i64.eq
          else
           i32.const 0
          end
          if
           local.get $10
           i32.load
           local.tee $4
           i32.load
           local.get $4
           i32.load offset=4
           i32.const 1720617444
           i32.and
           i32.const 2
           i32.shl
           i32.add
           i32.load
           local.set $4
           block $"__inlined_func$~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#find$35062"
            loop $while-continue|06
             local.get $4
             if
              local.get $4
              i32.load offset=12
              local.tee $11
              i32.const 1
              i32.and
              if (result i32)
               i32.const 0
              else
               local.get $4
               i64.load
               i64.const 81
               i64.eq
              end
              br_if $"__inlined_func$~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#find$35062"
              local.get $11
              i32.const -2
              i32.and
              local.set $4
              br $while-continue|06
             end
            end
            i32.const 0
            local.set $4
           end
           local.get $4
           if
            local.get $10
            local.get $7
            i32.load offset=16
            i32.load offset=12
            i32.const 1
            i32.add
            local.get $2
            i32.add
            call $assembly/indexer/protomessage/ProtoMessage/ProtoMessage.from
            local.set $4
            i32.const 16
            i32.const 9
            call $~lib/rt/stub/__new
            local.tee $10
            i64.const 0
            i64.store
            local.get $10
            i64.const 64
            i64.store offset=8
            local.get $4
            i32.load
            local.set $11
            local.get $4
            i32.load offset=8
            local.set $12
            local.get $4
            i32.load offset=12
            local.set $13
            local.get $4
            i32.load offset=4
            local.set $4
            i32.const 68
            i32.const 123
            call $~lib/rt/stub/__new
            local.get $10
            local.get $7
            local.get $3
            local.get $6
            local.get $5
            local.get $11
            local.get $12
            local.get $13
            local.get $4
            call $assembly/indexer/protomessage/MessageContext/MessageContext#constructor
            call $assembly/indexer/protomessage/MessageContext/MessageContext#run
           else
            local.get $10
            i32.load offset=4
            i32.load offset=12
            if
             local.get $10
             local.get $7
             local.get $8
             local.get $6
             i32.wrap_i64
             local.get $5
             call $~lib/metashrew-runes/assembly/indexer/RunestoneMessage/RunestoneMessage#process
             drop
            end
           end
          end
          local.get $2
          i32.const 1
          i32.add
          local.set $2
          br $for-loop|05
         end
        end
       end
       br $__inlined_func$~lib/metashrew-runes/assembly/indexer/Indexer/RunesIndex#processRunestone@override$1153
      end
      local.get $7
      call $~lib/metashrew-runes/assembly/indexer/RunesTransaction/RunesTransaction#runestone
      local.tee $4
      local.get $0
      i32.load8_u
      i32.store8 offset=24
      local.get $4
      local.get $0
      i32.load8_u offset=1
      i32.store8 offset=25
      local.get $4
      i32.load
      local.tee $2
      i32.load
      local.get $2
      i32.load offset=4
      i32.const 857269166
      i32.and
      i32.const 2
      i32.shl
      i32.add
      i32.load
      local.set $2
      block $"__inlined_func$~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#find$3745"
       loop $while-continue|067
        local.get $2
        if
         local.get $2
         i32.load offset=12
         local.tee $9
         i32.const 1
         i32.and
         if (result i32)
          i32.const 0
         else
          local.get $2
          i64.load
          i64.const 22
          i64.eq
         end
         br_if $"__inlined_func$~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#find$3745"
         local.get $9
         i32.const -2
         i32.and
         local.set $2
         br $while-continue|067
        end
       end
       i32.const 0
       local.set $2
      end
      local.get $2
      if (result i32)
       local.get $4
       i32.load
       i64.const 22
       call $"~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#get"
       i32.const 0
       call $~lib/array/Array<~lib/array/Array<u8>>#__get
       i64.load
       i32.wrap_i64
      else
       local.get $7
       call $~lib/metashrew-runes/assembly/indexer/RunesTransaction/RunesTransaction#defaultOutput
      end
      local.set $2
      local.get $4
      if
       local.get $4
       local.get $7
       local.get $8
       local.get $1
       local.get $5
       call $~lib/metashrew-runes/assembly/indexer/RunestoneMessage/RunestoneMessage#process
       local.set $9
       local.get $4
       local.get $7
       i32.load offset=16
       i32.load offset=12
       i32.const 1
       i32.add
       call $assembly/indexer/Protostone/Protostone#protostones
       local.tee $10
       call $assembly/indexer/Protostone/ProtostoneTable#burns
       local.set $11
       local.get $7
       call $~lib/metashrew-runes/assembly/indexer/RunesTransaction/RunesTransaction#runestoneOutputIndex
       local.set $12
       local.get $4
       i32.load offset=4
       call $~lib/metashrew-runes/assembly/indexer/Edict/Edict.fromDeltaSeries
       local.set $4
       local.get $11
       i32.load offset=12
       i32.const 0
       i32.gt_s
       if
        local.get $2
        local.get $9
        local.get $8
        local.get $12
        local.get $4
        local.get $11
        call $assembly/indexer/Indexer/Protorune<assembly/indexer/protomessage/MessageContext/MessageContext>#processProtoburns<assembly/indexer/Protoburn/Protoburn>
       end
       local.get $10
       i32.load
       local.set $9
       local.get $1
       i64.extend_i32_u
       local.set $6
       i32.const 0
       local.set $2
       loop $for-loop|06
        local.get $2
        local.get $9
        i32.load offset=12
        i32.lt_s
        if
         local.get $9
         local.get $2
         call $~lib/array/Array<~lib/array/Array<u8>>#__get
         local.tee $10
         i32.load offset=16
         local.set $4
         i32.const 16
         i32.const 9
         call $~lib/rt/stub/__new
         local.tee $11
         i64.const 0
         i64.store
         local.get $11
         i64.const 64
         i64.store offset=8
         local.get $4
         i64.load offset=8
         local.get $11
         i64.load offset=8
         i64.eq
         if (result i32)
          local.get $4
          i64.load
          local.get $11
          i64.load
          i64.eq
         else
          i32.const 0
         end
         if
          local.get $10
          i32.load
          local.tee $4
          i32.load
          local.get $4
          i32.load offset=4
          i32.const 1720617444
          i32.and
          i32.const 2
          i32.shl
          i32.add
          i32.load
          local.set $4
          block $"__inlined_func$~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#find$35063"
           loop $while-continue|07
            local.get $4
            if
             local.get $4
             i32.load offset=12
             local.tee $11
             i32.const 1
             i32.and
             if (result i32)
              i32.const 0
             else
              local.get $4
              i64.load
              i64.const 81
              i64.eq
             end
             br_if $"__inlined_func$~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#find$35063"
             local.get $11
             i32.const -2
             i32.and
             local.set $4
             br $while-continue|07
            end
           end
           i32.const 0
           local.set $4
          end
          local.get $4
          if
           local.get $10
           local.get $7
           i32.load offset=16
           i32.load offset=12
           i32.const 1
           i32.add
           local.get $2
           i32.add
           call $assembly/indexer/protomessage/ProtoMessage/ProtoMessage.from
           local.set $4
           i32.const 16
           i32.const 9
           call $~lib/rt/stub/__new
           local.tee $10
           i64.const 0
           i64.store
           local.get $10
           i64.const 64
           i64.store offset=8
           local.get $4
           i32.load
           local.set $11
           local.get $4
           i32.load offset=8
           local.set $12
           local.get $4
           i32.load offset=12
           local.set $13
           local.get $4
           i32.load offset=4
           local.set $4
           i32.const 68
           i32.const 126
           call $~lib/rt/stub/__new
           local.get $10
           local.get $7
           local.get $3
           local.get $6
           local.get $5
           local.get $11
           local.get $12
           local.get $13
           local.get $4
           call $assembly/indexer/protomessage/MessageContext/MessageContext#constructor
           call $assembly/indexer/protomessage/MessageContext/MessageContext#run
          else
           local.get $10
           i32.load offset=4
           i32.load offset=12
           if
            local.get $10
            local.get $7
            local.get $8
            local.get $6
            i32.wrap_i64
            local.get $5
            call $~lib/metashrew-runes/assembly/indexer/RunestoneMessage/RunestoneMessage#process
            drop
           end
          end
         end
         local.get $2
         i32.const 1
         i32.add
         local.set $2
         br $for-loop|06
        end
       end
      end
      br $__inlined_func$~lib/metashrew-runes/assembly/indexer/Indexer/RunesIndex#processRunestone@override$1153
     end
     local.get $7
     call $~lib/metashrew-runes/assembly/indexer/RunesTransaction/RunesTransaction#runestone
     local.tee $2
     if
      local.get $2
      local.get $7
      local.get $8
      local.get $1
      local.get $5
      call $~lib/metashrew-runes/assembly/indexer/RunestoneMessage/RunestoneMessage#process
      drop
     end
    end
    local.get $5
    i32.const 1
    i32.add
    local.set $5
    br $for-loop|00
   end
  end
 )
 (func $assembly/indexer/Indexer/Protorune<assembly/indexer/protomessage/MessageContext/MessageContext>#indexBlock (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
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
  i32.const 16
  i32.const 9
  call $~lib/rt/stub/__new
  local.tee $3
  i64.const 0
  i64.store
  local.get $3
  i64.const 64
  i64.store offset=8
  global.get $assembly/indexer/tables/protorune/PROTOCOLS_TO_INDEX
  i32.load
  local.set $12
  local.get $3
  call $~lib/as-bignum/assembly/integer/u128/u128#toString
  local.tee $6
  call $~lib/util/hash/HASH<~lib/string/String>
  local.set $10
  local.get $12
  i32.load
  local.get $10
  local.get $12
  i32.load offset=4
  i32.and
  i32.const 2
  i32.shl
  i32.add
  i32.load
  local.set $3
  block $__inlined_func$~lib/set/Set<~lib/string/String>#find$3092
   loop $while-continue|0
    local.get $3
    if
     local.get $3
     i32.load offset=4
     local.tee $4
     i32.const 1
     i32.and
     if (result i32)
      i32.const 0
     else
      local.get $3
      i32.load
      local.get $6
      call $~lib/string/String.__eq
     end
     br_if $__inlined_func$~lib/set/Set<~lib/string/String>#find$3092
     local.get $4
     i32.const -2
     i32.and
     local.set $3
     br $while-continue|0
    end
   end
   i32.const 0
   local.set $3
  end
  local.get $3
  i32.eqz
  if
   local.get $12
   i32.load offset=12
   local.tee $3
   local.get $12
   i32.load offset=16
   i32.eq
   if
    local.get $12
    i32.load offset=20
    local.get $3
    i32.const 3
    i32.mul
    i32.const 4
    i32.div_s
    i32.lt_s
    if (result i32)
     local.get $12
     i32.load offset=4
    else
     local.get $12
     i32.load offset=4
     i32.const 1
     i32.shl
     i32.const 1
     i32.or
    end
    local.tee $5
    i32.const 1
    i32.add
    local.tee $3
    i32.const 2
    i32.shl
    call $~lib/arraybuffer/ArrayBuffer#constructor
    local.set $9
    local.get $3
    i32.const 3
    i32.shl
    i32.const 3
    i32.div_s
    local.tee $8
    i32.const 3
    i32.shl
    call $~lib/arraybuffer/ArrayBuffer#constructor
    local.set $4
    local.get $12
    i32.load offset=8
    local.tee $11
    local.get $12
    i32.load offset=16
    i32.const 3
    i32.shl
    i32.add
    local.set $7
    local.get $4
    local.set $3
    loop $while-continue|00
     local.get $7
     local.get $11
     i32.ne
     if
      local.get $11
      i32.load offset=4
      i32.const 1
      i32.and
      i32.eqz
      if
       local.get $3
       local.get $11
       i32.load
       local.tee $13
       i32.store
       local.get $3
       local.get $9
       local.get $13
       call $~lib/util/hash/HASH<~lib/string/String>
       local.get $5
       i32.and
       i32.const 2
       i32.shl
       i32.add
       local.tee $13
       i32.load
       i32.store offset=4
       local.get $13
       local.get $3
       i32.store
       local.get $3
       i32.const 8
       i32.add
       local.set $3
      end
      local.get $11
      i32.const 8
      i32.add
      local.set $11
      br $while-continue|00
     end
    end
    local.get $12
    local.get $9
    i32.store
    local.get $12
    local.get $5
    i32.store offset=4
    local.get $12
    local.get $4
    i32.store offset=8
    local.get $12
    local.get $8
    i32.store offset=12
    local.get $12
    local.get $12
    i32.load offset=20
    i32.store offset=16
   end
   local.get $12
   i32.load offset=8
   local.set $3
   local.get $12
   local.get $12
   i32.load offset=16
   local.tee $4
   i32.const 1
   i32.add
   i32.store offset=16
   local.get $3
   local.get $4
   i32.const 3
   i32.shl
   i32.add
   local.tee $3
   local.get $6
   i32.store
   local.get $12
   local.get $12
   i32.load offset=20
   i32.const 1
   i32.add
   i32.store offset=20
   local.get $3
   local.get $12
   i32.load
   local.get $10
   local.get $12
   i32.load offset=4
   i32.and
   i32.const 2
   i32.shl
   i32.add
   local.tee $4
   i32.load
   i32.store offset=4
   local.get $4
   local.get $3
   i32.store
  end
  local.get $0
  local.get $1
  local.get $2
  call $~lib/metashrew-runes/assembly/indexer/Indexer/RunesIndex#indexBlock
 )
 (func $assembly/index/_start
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  call $~lib/metashrew-as/assembly/indexer/index/__host_len
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.tee $0
  call $~lib/metashrew-as/assembly/indexer/index/__load_input
  local.get $0
  local.get $0
  i32.const 20
  i32.sub
  i32.load offset=16
  call $~lib/metashrew-as/assembly/utils/box/Box#constructor
  local.tee $1
  i32.load
  local.tee $0
  i32.load
  local.set $2
  local.get $1
  local.get $0
  i32.const 4
  i32.add
  i32.store
  local.get $1
  local.get $1
  i32.load offset=4
  i32.const 4
  i32.sub
  i32.store offset=4
  local.get $2
  i32.const 839994
  i32.lt_u
  if
   call $~lib/metashrew-as/assembly/indexer/index/_flush
   return
  end
  local.get $1
  call $~lib/metashrew-as/assembly/blockdata/block/Block#constructor
  local.set $0
  local.get $2
  i32.const 840000
  i32.ge_u
  if
   i32.const 0
   i32.const 39
   call $~lib/rt/stub/__new
   i32.eqz
   if
    i32.const 0
    i32.const 0
    call $~lib/rt/stub/__new
    drop
   end
   local.get $0
   call $~lib/metashrew-spendables/assembly/indexer/SpendablesIndex#indexBlock
  end
  i32.const 0
  i32.const 0
  call $assembly/indexer/Indexer/DefaultProtorune#constructor
  local.get $2
  local.get $0
  call $assembly/indexer/Indexer/Protorune<assembly/indexer/protomessage/MessageContext/MessageContext>#indexBlock
  call $~lib/metashrew-as/assembly/indexer/index/_flush
 )
 (func $assembly/view/outpoint/txindexForOutpoint (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  local.get $0
  local.get $0
  i32.const 20
  i32.sub
  i32.load offset=16
  call $~lib/metashrew-as/assembly/utils/box/Box#constructor
  local.tee $1
  local.get $1
  i32.load offset=4
  i32.const 4
  i32.sub
  i32.store offset=4
  local.get $1
  i32.load offset=4
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.tee $2
  local.get $1
  i32.load
  local.get $1
  i32.load offset=4
  memory.copy
  global.get $~lib/metashrew-runes/assembly/indexer/constants/index/HEIGHT_TO_TRANSACTION_IDS
  global.get $~lib/metashrew-runes/assembly/indexer/constants/index/OUTPOINT_TO_HEIGHT
  local.get $0
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#getValue<u32>
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#selectValue<u32>
  local.set $6
  i32.const 1
  global.set $~argumentsLength
  local.get $6
  i32.const 6304
  i32.const 0
  call $~lib/string/String.UTF8.encode@varargs
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#getValue<u32>
  local.set $5
  loop $for-loop|0
   local.get $5
   local.get $7
   i32.gt_s
   if
    local.get $6
    local.get $7
    call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#selectIndex
    call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#get
    local.set $8
    local.get $2
    i32.const 20
    i32.sub
    i32.load offset=16
    local.set $3
    i32.const 0
    local.set $9
    block $~lib/util/memory/memcmp|inlined.0
     local.get $8
     local.get $2
     local.tee $0
     i32.eq
     br_if $~lib/util/memory/memcmp|inlined.0
     local.get $0
     i32.const 7
     i32.and
     local.get $8
     i32.const 7
     i32.and
     i32.eq
     if
      loop $while-continue|1
       local.get $0
       i32.const 7
       i32.and
       if
        i32.const 0
        local.set $9
        local.get $3
        i32.eqz
        br_if $~lib/util/memory/memcmp|inlined.0
        local.get $0
        i32.load8_u
        local.tee $4
        local.get $8
        i32.load8_u
        local.tee $1
        i32.sub
        local.set $9
        local.get $1
        local.get $4
        i32.ne
        br_if $~lib/util/memory/memcmp|inlined.0
        local.get $3
        i32.const 1
        i32.sub
        local.set $3
        local.get $0
        i32.const 1
        i32.add
        local.set $0
        local.get $8
        i32.const 1
        i32.add
        local.set $8
        br $while-continue|1
       end
      end
      loop $while-continue|2
       local.get $3
       i32.const 8
       i32.ge_u
       if
        local.get $0
        i64.load
        local.get $8
        i64.load
        i64.eq
        if
         local.get $0
         i32.const 8
         i32.add
         local.set $0
         local.get $8
         i32.const 8
         i32.add
         local.set $8
         local.get $3
         i32.const 8
         i32.sub
         local.set $3
         br $while-continue|2
        end
       end
      end
     end
     loop $while-continue|3
      local.get $3
      local.tee $1
      i32.const 1
      i32.sub
      local.set $3
      local.get $1
      if
       local.get $0
       i32.load8_u
       local.tee $4
       local.get $8
       i32.load8_u
       local.tee $1
       i32.sub
       local.set $9
       local.get $1
       local.get $4
       i32.ne
       br_if $~lib/util/memory/memcmp|inlined.0
       local.get $0
       i32.const 1
       i32.add
       local.set $0
       local.get $8
       i32.const 1
       i32.add
       local.set $8
       br $while-continue|3
      end
     end
     i32.const 0
     local.set $9
    end
    local.get $9
    i32.eqz
    if
     local.get $7
     return
    end
    local.get $7
    i32.const 1
    i32.add
    local.set $7
    br $for-loop|0
   end
  end
  i32.const -1
 )
 (func $~lib/array/Array<u8>#__set (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  local.get $1
  local.get $0
  i32.load offset=12
  i32.ge_u
  if
   local.get $1
   i32.const 0
   i32.lt_s
   if
    i32.const 3344
    i32.const 5344
    i32.const 130
    i32.const 22
    call $~lib/builtins/abort
    unreachable
   end
   local.get $0
   local.get $1
   i32.const 1
   i32.add
   local.tee $3
   i32.const 0
   i32.const 1
   call $~lib/array/ensureCapacity
   local.get $0
   local.get $3
   i32.store offset=12
  end
  local.get $0
  i32.load offset=4
  local.get $1
  i32.add
  local.get $2
  i32.store8
 )
 (func $~lib/metashrew-runes/assembly/indexer/RuneId/RuneId.fromBytes~anonymous|0 (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (result i32)
  local.get $0
  local.get $2
  local.get $1
  call $~lib/array/Array<u8>#__set
  local.get $0
 )
 (func $~lib/array/Array<u8>#slice (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i32)
  local.get $0
  i32.load offset=12
  local.set $3
  local.get $1
  i32.const 0
  i32.lt_s
  if (result i32)
   local.get $1
   local.get $3
   i32.add
   local.tee $1
   i32.const 0
   local.get $1
   i32.const 0
   i32.gt_s
   select
  else
   local.get $1
   local.get $3
   local.get $1
   local.get $3
   i32.lt_s
   select
  end
  local.set $1
  local.get $2
  i32.const 0
  i32.lt_s
  if (result i32)
   local.get $2
   local.get $3
   i32.add
   local.tee $2
   i32.const 0
   local.get $2
   i32.const 0
   i32.gt_s
   select
  else
   local.get $2
   local.get $3
   local.get $2
   local.get $3
   i32.lt_s
   select
  end
  local.get $1
  i32.sub
  local.tee $2
  i32.const 0
  local.get $2
  i32.const 0
  i32.gt_s
  select
  local.tee $2
  i32.const 0
  i32.const 13
  i32.const 0
  call $~lib/rt/__newArray
  local.tee $3
  i32.load offset=4
  local.get $0
  i32.load offset=4
  local.get $1
  i32.add
  local.get $2
  memory.copy
  local.get $3
 )
 (func $~lib/metashrew-runes/assembly/indexer/RuneId/RuneId.fromBytes (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i64)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i64)
  (local $8 i64)
  i32.const 1
  global.set $~argumentsLength
  local.get $0
  call $~lib/typedarray/Uint8Array.wrap@varargs
  local.tee $5
  i32.load offset=8
  call $~lib/array/Array<u8>#constructor
  local.set $1
  local.get $5
  i32.load offset=4
  local.set $6
  i32.const 0
  local.set $0
  local.get $5
  i32.load offset=8
  local.set $3
  loop $for-loop|0
   local.get $0
   local.get $3
   i32.lt_s
   if
    local.get $0
    local.get $6
    i32.add
    i32.load8_u
    local.set $4
    i32.const 4
    global.set $~argumentsLength
    local.get $1
    local.get $4
    local.get $0
    local.get $5
    i32.const 8928
    i32.load
    call_indirect (type $3)
    local.set $1
    local.get $0
    i32.const 1
    i32.add
    local.set $0
    br $for-loop|0
   end
  end
  block $folding-inner0
   local.get $1
   i32.const 0
   i32.const 16
   call $~lib/array/Array<u8>#slice
   local.tee $0
   i32.load offset=8
   local.tee $3
   if (result i32)
    local.get $3
    i32.const 15
    i32.and
   else
    i32.const 1
   end
   br_if $folding-inner0
   local.get $0
   i32.load offset=4
   local.tee $0
   i64.load
   local.set $2
   local.get $0
   i64.load offset=8
   local.set $7
   i32.const 16
   i32.const 9
   call $~lib/rt/stub/__new
   local.tee $0
   local.get $2
   i64.store
   local.get $0
   local.get $7
   i64.store offset=8
   local.get $0
   i64.load
   local.set $7
   i32.const 1
   global.set $~argumentsLength
   local.get $1
   i32.const 16
   i32.const 2147483647
   call $~lib/array/Array<u8>#slice
   local.tee $0
   i32.load offset=8
   local.tee $1
   if (result i32)
    local.get $1
    i32.const 15
    i32.and
   else
    i32.const 1
   end
   br_if $folding-inner0
   local.get $0
   i32.load offset=4
   local.tee $0
   i64.load
   local.set $2
   local.get $0
   i64.load offset=8
   local.set $8
   i32.const 16
   i32.const 9
   call $~lib/rt/stub/__new
   local.tee $0
   local.get $2
   i64.store
   local.get $0
   local.get $8
   i64.store offset=8
   i32.const 0
   local.get $7
   local.get $0
   i64.load
   i32.wrap_i64
   call $~lib/metashrew-runes/assembly/indexer/RuneId/RuneId#constructor
   return
  end
  i32.const 0
  i32.const 8304
  i32.const 132
  i32.const 5
  call $~lib/builtins/abort
  unreachable
 )
 (func $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#getValue<u8> (param $0 i32) (result i32)
  (local $1 i32)
  local.get $0
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#get
  local.tee $0
  i32.const 20
  i32.sub
  i32.load offset=16
  i32.eqz
  if
   i32.const 0
   return
  end
  i32.const 1
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.tee $1
  local.get $0
  local.get $0
  i32.const 20
  i32.sub
  i32.load offset=16
  memory.copy
  local.get $1
  i32.load8_u
 )
 (func $~lib/metashrew-runes/assembly/proto/metashrew-runes/metashrew_runes.RuneId#constructor (result i32)
  (local $0 i32)
  i32.const 8
  i32.const 81
  call $~lib/rt/stub/__new
  local.tee $0
  i32.eqz
  if
   i32.const 0
   i32.const 0
   call $~lib/rt/stub/__new
   local.set $0
  end
  local.get $0
  i32.const 0
  i32.store
  local.get $0
  i32.const 0
  i32.store offset=4
  local.get $0
 )
 (func $~lib/metashrew-runes/assembly/proto/metashrew-runes/metashrew_runes.Rune#constructor (result i32)
  (local $0 i32)
  i32.const 20
  i32.const 80
  call $~lib/rt/stub/__new
  local.tee $0
  i32.eqz
  if
   i32.const 0
   i32.const 0
   call $~lib/rt/stub/__new
   local.set $0
  end
  local.get $0
  call $~lib/metashrew-runes/assembly/proto/metashrew-runes/metashrew_runes.RuneId#constructor
  i32.store
  local.get $0
  i32.const 0
  call $~lib/array/Array<u8>#constructor
  i32.store offset=4
  local.get $0
  i32.const 0
  i32.store offset=8
  local.get $0
  i32.const 0
  i32.store offset=12
  local.get $0
  i32.const 0
  i32.store offset=16
  local.get $0
 )
 (func $~lib/metashrew-runes/assembly/utils/fieldToName (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i64)
  (local $3 i32)
  (local $4 i64)
  i32.const 16
  i32.const 9
  call $~lib/rt/stub/__new
  local.tee $1
  i64.const 1
  i64.store
  local.get $1
  i64.const 0
  i64.store offset=8
  local.get $0
  i64.load
  local.tee $2
  local.get $1
  i64.load
  i64.add
  local.set $4
  local.get $2
  local.get $4
  i64.gt_u
  i64.extend_i32_u
  local.get $0
  i64.load offset=8
  local.get $1
  i64.load offset=8
  i64.add
  i64.add
  local.set $2
  i32.const 16
  i32.const 9
  call $~lib/rt/stub/__new
  local.tee $0
  local.get $4
  i64.store
  local.get $0
  local.get $2
  i64.store offset=8
  i32.const 8160
  local.set $3
  loop $while-continue|0
   local.get $0
   i64.load
   local.tee $2
   local.get $0
   i64.load offset=8
   local.tee $4
   i64.or
   i64.const 0
   i64.ne
   if
    local.get $2
    local.get $4
    global.get $~lib/metashrew-runes/assembly/indexer/constants/index/TWENTY_SIX
    local.tee $1
    i64.load
    local.get $1
    i64.load offset=8
    call $~lib/as-bignum/assembly/globals/__udivmod128
    drop
    global.get $~lib/as-bignum/assembly/globals/__divmod_rem_lo
    local.set $2
    global.get $~lib/as-bignum/assembly/globals/__divmod_rem_hi
    local.set $4
    i32.const 16
    i32.const 9
    call $~lib/rt/stub/__new
    local.tee $1
    local.get $2
    i64.store
    local.get $1
    local.get $4
    i64.store offset=8
    local.get $1
    i64.load
    i32.wrap_i64
    local.tee $1
    i32.eqz
    if
     i32.const 26
     local.set $1
    end
    i32.const 1
    global.set $~argumentsLength
    local.get $1
    i32.const -64
    i32.sub
    call $~lib/string/String.fromCharCode@varargs
    local.get $3
    call $~lib/string/String.__concat
    local.set $3
    local.get $0
    i32.const 8
    i32.sub
    i32.load
    drop
    local.get $0
    call $~lib/as-bignum/assembly/integer/u128/u128#postDec
    local.tee $0
    i64.load
    local.get $0
    i64.load offset=8
    global.get $~lib/metashrew-runes/assembly/indexer/constants/index/TWENTY_SIX
    local.tee $0
    i64.load
    local.get $0
    i64.load offset=8
    call $~lib/as-bignum/assembly/globals/__udivmod128
    local.set $2
    global.get $~lib/as-bignum/assembly/globals/__divmod_quot_hi
    local.set $4
    i32.const 16
    i32.const 9
    call $~lib/rt/stub/__new
    local.tee $0
    local.get $2
    i64.store
    local.get $0
    local.get $4
    i64.store offset=8
    br $while-continue|0
   end
  end
  local.get $3
 )
 (func $assembly/view/outpoint/balanceSheetToProtobuf~anonymous|0~anonymous|0 (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (result i32)
  local.get $0
  local.get $1
  call $~lib/array/Array<u8>#push
  local.get $0
 )
 (func $assembly/view/outpoint/balanceSheetToProtobuf~anonymous|0 (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (result i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  local.get $1
  call $~lib/metashrew-runes/assembly/indexer/RuneId/RuneId.fromBytes
  local.set $5
  global.get $~lib/metashrew-runes/assembly/indexer/constants/index/RUNE_ID_TO_ETCHING
  local.get $1
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#get
  local.set $2
  global.get $~lib/metashrew-runes/assembly/indexer/constants/index/SPACERS
  local.get $2
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
  drop
  global.get $~lib/metashrew-runes/assembly/indexer/constants/index/DIVISIBILITY
  local.get $2
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#getValue<u8>
  local.set $3
  call $~lib/metashrew-runes/assembly/proto/metashrew-runes/metashrew_runes.Rune#constructor
  local.set $7
  call $~lib/metashrew-runes/assembly/proto/metashrew-runes/metashrew_runes.RuneId#constructor
  local.tee $1
  local.get $5
  i32.load
  i64.load
  i64.store32
  local.get $1
  local.get $5
  i32.load offset=4
  i64.load
  i64.store32 offset=4
  local.get $7
  local.get $1
  i32.store
  local.get $2
  call $~lib/metashrew-runes/assembly/utils/fromArrayBuffer
  call $~lib/metashrew-runes/assembly/utils/fieldToName
  local.set $1
  i32.const 1
  global.set $~argumentsLength
  local.get $1
  i32.const 0
  call $~lib/string/String.UTF8.encode@varargs
  local.set $1
  i32.const 1
  global.set $~argumentsLength
  local.get $1
  call $~lib/typedarray/Uint8Array.wrap@varargs
  local.set $8
  i32.const 0
  call $~lib/array/Array<u8>#constructor
  local.set $1
  local.get $8
  i32.load offset=4
  local.set $9
  local.get $8
  i32.load offset=8
  local.set $5
  loop $for-loop|0
   local.get $4
   local.get $5
   i32.lt_s
   if
    local.get $4
    local.get $9
    i32.add
    i32.load8_u
    local.set $6
    i32.const 4
    global.set $~argumentsLength
    local.get $1
    local.get $6
    local.get $4
    local.get $8
    i32.const 8960
    i32.load
    call_indirect (type $3)
    local.set $1
    local.get $4
    i32.const 1
    i32.add
    local.set $4
    br $for-loop|0
   end
  end
  local.get $7
  local.get $1
  i32.store offset=4
  local.get $7
  local.get $3
  i32.store offset=8
  local.get $7
  global.get $~lib/metashrew-runes/assembly/indexer/constants/index/SYMBOL
  local.get $2
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#getValue<u8>
  i32.store offset=16
  local.get $7
  global.get $~lib/metashrew-runes/assembly/indexer/constants/index/SPACERS
  local.get $2
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#getValue<u32>
  i32.store offset=12
  local.get $0
  local.get $7
  call $~lib/array/Array<~lib/array/Array<u8>>#push
  drop
  local.get $0
 )
 (func $~lib/array/Array<~lib/metashrew-runes/assembly/proto/metashrew-runes/metashrew_runes.Rune>#constructor (result i32)
  (local $0 i32)
  (local $1 i32)
  i32.const 16
  i32.const 83
  call $~lib/rt/stub/__new
  local.tee $0
  i32.const 0
  i32.store
  local.get $0
  i32.const 0
  i32.store offset=4
  local.get $0
  i32.const 0
  i32.store offset=8
  local.get $0
  i32.const 0
  i32.store offset=12
  i32.const 32
  i32.const 1
  call $~lib/rt/stub/__new
  local.tee $1
  i32.const 0
  i32.const 32
  memory.fill
  local.get $0
  local.get $1
  i32.store
  local.get $0
  local.get $1
  i32.store offset=4
  local.get $0
  i32.const 32
  i32.store offset=8
  local.get $0
  i32.const 0
  i32.store offset=12
  local.get $0
 )
 (func $assembly/view/outpoint/balanceSheetToProtobuf~anonymous|1 (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i64)
  i32.const 16
  call $~lib/array/Array<u8>#constructor
  local.tee $1
  i32.load offset=4
  local.tee $2
  local.get $0
  i64.load offset=8
  local.tee $3
  i64.const 8
  i64.shr_u
  i64.const 71777214294589695
  i64.and
  local.get $3
  i64.const 71777214294589695
  i64.and
  i64.const 8
  i64.shl
  i64.or
  local.tee $3
  i64.const 16
  i64.shr_u
  i64.const 281470681808895
  i64.and
  local.get $3
  i64.const 281470681808895
  i64.and
  i64.const 16
  i64.shl
  i64.or
  i64.const 32
  i64.rotr
  i64.store
  local.get $2
  local.get $0
  i64.load
  local.tee $3
  i64.const 8
  i64.shr_u
  i64.const 71777214294589695
  i64.and
  local.get $3
  i64.const 71777214294589695
  i64.and
  i64.const 8
  i64.shl
  i64.or
  local.tee $3
  i64.const 16
  i64.shr_u
  i64.const 281470681808895
  i64.and
  local.get $3
  i64.const 281470681808895
  i64.and
  i64.const 16
  i64.shl
  i64.or
  i64.const 32
  i64.rotr
  i64.store offset=8
  local.get $1
 )
 (func $~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>#map<~lib/array/Array<u8>> (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  local.get $0
  i32.load offset=12
  local.tee $3
  i32.const 2
  i32.const 19
  i32.const 0
  call $~lib/rt/__newArray
  local.tee $4
  i32.load offset=4
  local.set $5
  loop $for-loop|0
   local.get $2
   local.get $3
   local.get $0
   i32.load offset=12
   local.tee $6
   local.get $3
   local.get $6
   i32.lt_s
   select
   i32.lt_s
   if
    local.get $2
    i32.const 2
    i32.shl
    local.tee $6
    local.get $0
    i32.load offset=4
    i32.add
    i32.load
    local.set $7
    i32.const 3
    global.set $~argumentsLength
    local.get $5
    local.get $6
    i32.add
    local.get $7
    local.get $2
    local.get $0
    local.get $1
    i32.load
    call_indirect (type $2)
    i32.store
    local.get $2
    i32.const 1
    i32.add
    local.set $2
    br $for-loop|0
   end
  end
  local.get $4
 )
 (func $~lib/metashrew-runes/assembly/proto/metashrew-runes/metashrew_runes.BalanceSheet#constructor (result i32)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  i32.const 4
  i32.const 78
  call $~lib/rt/stub/__new
  local.tee $0
  i32.eqz
  if
   i32.const 0
   i32.const 0
   call $~lib/rt/stub/__new
   local.set $0
  end
  i32.const 16
  i32.const 82
  call $~lib/rt/stub/__new
  local.tee $1
  i32.const 0
  i32.store
  local.get $1
  i32.const 0
  i32.store offset=4
  local.get $1
  i32.const 0
  i32.store offset=8
  local.get $1
  i32.const 0
  i32.store offset=12
  i32.const 32
  i32.const 1
  call $~lib/rt/stub/__new
  local.tee $2
  i32.const 0
  i32.const 32
  memory.fill
  local.get $1
  local.get $2
  i32.store
  local.get $1
  local.get $2
  i32.store offset=4
  local.get $1
  i32.const 32
  i32.store offset=8
  local.get $1
  i32.const 0
  i32.store offset=12
  local.get $0
  local.get $1
  i32.store
  local.get $0
 )
 (func $~lib/metashrew-runes/assembly/proto/metashrew-runes/metashrew_runes.BalanceSheetItem#constructor (result i32)
  (local $0 i32)
  i32.const 8
  i32.const 79
  call $~lib/rt/stub/__new
  local.tee $0
  i32.eqz
  if
   i32.const 0
   i32.const 0
   call $~lib/rt/stub/__new
   local.set $0
  end
  local.get $0
  call $~lib/metashrew-runes/assembly/proto/metashrew-runes/metashrew_runes.Rune#constructor
  i32.store
  local.get $0
  i32.const 0
  call $~lib/array/Array<u8>#constructor
  i32.store offset=4
  local.get $0
 )
 (func $assembly/view/outpoint/balanceSheetToProtobuf (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  local.get $0
  i32.load
  local.set $4
  call $~lib/array/Array<~lib/metashrew-runes/assembly/proto/metashrew-runes/metashrew_runes.Rune>#constructor
  local.set $3
  local.get $4
  i32.load offset=12
  local.set $5
  loop $for-loop|0
   local.get $1
   local.get $5
   local.get $4
   i32.load offset=12
   local.tee $6
   local.get $5
   local.get $6
   i32.lt_s
   select
   i32.lt_s
   if
    local.get $4
    i32.load offset=4
    local.get $1
    i32.const 2
    i32.shl
    i32.add
    i32.load
    local.set $6
    i32.const 4
    global.set $~argumentsLength
    local.get $3
    local.get $6
    local.get $1
    local.get $4
    i32.const 8992
    i32.load
    call_indirect (type $3)
    local.set $3
    local.get $1
    i32.const 1
    i32.add
    local.set $1
    br $for-loop|0
   end
  end
  local.get $0
  i32.load offset=4
  i32.const 9024
  call $~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>#map<~lib/array/Array<u8>>
  local.set $0
  call $~lib/metashrew-runes/assembly/proto/metashrew-runes/metashrew_runes.BalanceSheet#constructor
  local.set $1
  loop $for-loop|00
   local.get $2
   local.get $0
   i32.load offset=12
   i32.lt_s
   if
    call $~lib/metashrew-runes/assembly/proto/metashrew-runes/metashrew_runes.BalanceSheetItem#constructor
    local.tee $4
    local.get $3
    local.get $2
    call $~lib/array/Array<~lib/array/Array<u8>>#__get
    i32.store
    local.get $4
    local.get $0
    local.get $2
    call $~lib/array/Array<~lib/array/Array<u8>>#__get
    i32.store offset=4
    local.get $1
    i32.load
    local.get $4
    call $~lib/array/Array<~lib/array/Array<u8>>#push
    drop
    local.get $2
    i32.const 1
    i32.add
    local.set $2
    br $for-loop|00
   end
  end
  local.get $1
 )
 (func $assembly/view/outpoint/balanceSheetToProtobufForProtocol (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
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
  call $~lib/array/Array<~lib/metashrew-runes/assembly/proto/metashrew-runes/metashrew_runes.Rune>#constructor
  local.set $7
  loop $for-loop|0
   local.get $5
   local.get $0
   i32.load
   local.tee $2
   i32.load offset=12
   i32.lt_s
   if
    local.get $2
    local.get $5
    call $~lib/array/Array<~lib/array/Array<u8>>#__get
    local.tee $2
    call $~lib/metashrew-runes/assembly/indexer/RuneId/RuneId.fromBytes
    local.set $6
    local.get $1
    i32.load offset=28
    local.get $2
    call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
    call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#get
    local.set $3
    local.get $1
    i32.load offset=16
    local.get $3
    call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
    drop
    local.get $1
    i32.load offset=20
    local.get $3
    call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
    call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#getValue<u8>
    local.set $8
    call $~lib/metashrew-runes/assembly/proto/metashrew-runes/metashrew_runes.Rune#constructor
    local.set $12
    call $~lib/metashrew-runes/assembly/proto/metashrew-runes/metashrew_runes.RuneId#constructor
    local.tee $2
    local.get $6
    i32.load
    i64.load
    i64.store32
    local.get $2
    local.get $6
    i32.load offset=4
    i64.load
    i64.store32 offset=4
    local.get $12
    local.get $2
    i32.store
    i32.const 0
    local.set $2
    local.get $3
    call $~lib/metashrew-runes/assembly/utils/fromArrayBuffer
    call $~lib/metashrew-runes/assembly/utils/fieldToName
    local.set $6
    i32.const 1
    global.set $~argumentsLength
    local.get $6
    i32.const 0
    call $~lib/string/String.UTF8.encode@varargs
    local.set $6
    i32.const 1
    global.set $~argumentsLength
    local.get $6
    call $~lib/typedarray/Uint8Array.wrap@varargs
    local.set $13
    i32.const 0
    call $~lib/array/Array<u8>#constructor
    local.set $6
    local.get $13
    i32.load offset=4
    local.set $9
    local.get $13
    i32.load offset=8
    local.set $10
    loop $for-loop|00
     local.get $2
     local.get $10
     i32.lt_s
     if
      local.get $2
      local.get $9
      i32.add
      i32.load8_u
      local.set $11
      i32.const 4
      global.set $~argumentsLength
      local.get $6
      local.get $11
      local.get $2
      local.get $13
      i32.const 9056
      i32.load
      call_indirect (type $3)
      local.set $6
      local.get $2
      i32.const 1
      i32.add
      local.set $2
      br $for-loop|00
     end
    end
    local.get $12
    local.get $6
    i32.store offset=4
    local.get $12
    local.get $8
    i32.store offset=8
    local.get $12
    local.get $1
    i32.load offset=12
    local.get $3
    call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
    call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#getValue<u8>
    i32.store offset=16
    local.get $12
    local.get $1
    i32.load offset=16
    local.get $3
    call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
    call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#getValue<u32>
    i32.store offset=12
    local.get $7
    local.get $12
    call $~lib/array/Array<~lib/array/Array<u8>>#push
    drop
    local.get $5
    i32.const 1
    i32.add
    local.set $5
    br $for-loop|0
   end
  end
  local.get $0
  i32.load offset=4
  i32.const 9088
  call $~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>#map<~lib/array/Array<u8>>
  local.set $0
  call $~lib/metashrew-runes/assembly/proto/metashrew-runes/metashrew_runes.BalanceSheet#constructor
  local.set $1
  loop $for-loop|1
   local.get $4
   local.get $0
   i32.load offset=12
   i32.lt_s
   if
    call $~lib/metashrew-runes/assembly/proto/metashrew-runes/metashrew_runes.BalanceSheetItem#constructor
    local.tee $2
    local.get $7
    local.get $4
    call $~lib/array/Array<~lib/array/Array<u8>>#__get
    i32.store
    local.get $2
    local.get $0
    local.get $4
    call $~lib/array/Array<~lib/array/Array<u8>>#__get
    i32.store offset=4
    local.get $1
    i32.load
    local.get $2
    call $~lib/array/Array<~lib/array/Array<u8>>#push
    drop
    local.get $4
    i32.const 1
    i32.add
    local.set $4
    br $for-loop|1
   end
  end
  local.get $1
 )
 (func $~lib/metashrew-runes/assembly/proto/metashrew-runes/metashrew_runes.Outpoint#constructor (result i32)
  (local $0 i32)
  i32.const 8
  i32.const 87
  call $~lib/rt/stub/__new
  local.tee $0
  i32.eqz
  if
   i32.const 0
   i32.const 0
   call $~lib/rt/stub/__new
   local.set $0
  end
  local.get $0
  i32.const 0
  call $~lib/array/Array<u8>#constructor
  i32.store
  local.get $0
  i32.const 0
  i32.store offset=4
  local.get $0
 )
 (func $~lib/metashrew-runes/assembly/proto/metashrew-runes/metashrew_runes.OutpointResponse#constructor (result i32)
  (local $0 i32)
  (local $1 i32)
  i32.const 20
  i32.const 88
  call $~lib/rt/stub/__new
  local.tee $0
  i32.eqz
  if
   i32.const 0
   i32.const 0
   call $~lib/rt/stub/__new
   local.set $0
  end
  local.get $0
  call $~lib/metashrew-runes/assembly/proto/metashrew-runes/metashrew_runes.BalanceSheet#constructor
  i32.store
  local.get $0
  call $~lib/metashrew-runes/assembly/proto/metashrew-runes/metashrew_runes.Outpoint#constructor
  i32.store offset=4
  i32.const 16
  i32.const 89
  call $~lib/rt/stub/__new
  local.tee $1
  i32.eqz
  if
   i32.const 0
   i32.const 0
   call $~lib/rt/stub/__new
   local.set $1
  end
  local.get $1
  i32.const 0
  call $~lib/array/Array<u8>#constructor
  i32.store
  local.get $1
  i64.const 0
  i64.store offset=8
  local.get $0
  local.get $1
  i32.store offset=8
  local.get $0
  i32.const 0
  i32.store offset=12
  local.get $0
  i32.const 0
  i32.store offset=16
  local.get $0
 )
 (func $assembly/view/outpoint/outpointBase (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  local.get $0
  i32.load
  i32.load
  local.get $0
  i32.load offset=4
  call $~lib/metashrew-as/assembly/blockdata/transaction/OutPoint.from
  i32.load
  local.tee $2
  i32.load offset=4
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.tee $1
  local.get $2
  i32.load
  local.get $2
  i32.load offset=4
  memory.copy
  global.get $~lib/metashrew-runes/assembly/indexer/constants/index/OUTPOINT_TO_RUNES
  local.get $1
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
  local.set $3
  global.get $~lib/metashrew-spendables/assembly/tables/OUTPOINT_TO_OUTPUT
  local.get $1
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#get
  local.tee $2
  local.get $2
  i32.const 20
  i32.sub
  i32.load offset=16
  call $~lib/metashrew-as/assembly/utils/box/Box#constructor
  i32.const 0
  call $~lib/metashrew-as/assembly/blockdata/transaction/Output#constructor
  local.set $2
  local.get $3
  call $~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet.load
  call $assembly/view/outpoint/balanceSheetToProtobuf
  local.set $4
  call $~lib/metashrew-runes/assembly/proto/metashrew-runes/metashrew_runes.OutpointResponse#constructor
  local.tee $3
  local.get $0
  i32.store offset=4
  local.get $3
  i32.load offset=8
  local.set $5
  local.get $2
  i32.load offset=16
  local.tee $0
  i32.load offset=4
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.tee $6
  local.get $0
  i32.load
  local.get $0
  i32.load offset=4
  memory.copy
  local.get $5
  local.get $6
  call $~lib/metashrew-as/assembly/indexer/index/arrayBufferToArray
  i32.store
  local.get $3
  i32.load offset=8
  local.get $2
  i64.load offset=8
  i64.store offset=8
  local.get $3
  local.get $4
  i32.store
  local.get $3
  global.get $~lib/metashrew-runes/assembly/indexer/constants/index/OUTPOINT_TO_HEIGHT
  local.get $1
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#getValue<u32>
  i32.store offset=12
  local.get $3
  local.get $1
  call $assembly/view/outpoint/txindexForOutpoint
  i32.store offset=16
  local.get $3
 )
 (func $assembly/indexer/tables/protorune/ProtoruneTable.for (param $0 i32) (result i32)
  (local $1 i32)
  i32.const 1
  global.set $~argumentsLength
  i32.const 9472
  i32.const 0
  call $~lib/string/String.UTF8.encode@varargs
  local.set $1
  local.get $0
  call $~lib/as-bignum/assembly/integer/u128/u128#toString
  local.set $0
  i32.const 1
  global.set $~argumentsLength
  local.get $1
  local.get $0
  i32.const 0
  call $~lib/string/String.UTF8.encode@varargs
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
  local.set $0
  i32.const 44
  i32.const 54
  call $~lib/rt/stub/__new
  local.tee $1
  i32.const 0
  i32.store
  local.get $1
  i32.const 0
  i32.store offset=4
  local.get $1
  i32.const 0
  i32.store offset=8
  local.get $1
  i32.const 0
  i32.store offset=12
  local.get $1
  i32.const 0
  i32.store offset=16
  local.get $1
  i32.const 0
  i32.store offset=20
  local.get $1
  i32.const 0
  i32.store offset=24
  local.get $1
  i32.const 0
  i32.store offset=28
  local.get $1
  i32.const 0
  i32.store offset=32
  local.get $1
  i32.const 0
  i32.store offset=36
  local.get $1
  i32.const 0
  i32.store offset=40
  local.get $1
  local.get $0
  i32.store
  i32.const 1
  global.set $~argumentsLength
  local.get $1
  local.get $0
  i32.const 9120
  i32.const 0
  call $~lib/string/String.UTF8.encode@varargs
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
  i32.store offset=4
  i32.const 1
  global.set $~argumentsLength
  local.get $1
  local.get $0
  i32.const 3728
  i32.const 0
  call $~lib/string/String.UTF8.encode@varargs
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
  i32.store offset=8
  i32.const 1
  global.set $~argumentsLength
  local.get $1
  local.get $0
  i32.const 9168
  i32.const 0
  call $~lib/string/String.UTF8.encode@varargs
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
  i32.store offset=12
  i32.const 1
  global.set $~argumentsLength
  local.get $1
  local.get $0
  i32.const 9216
  i32.const 0
  call $~lib/string/String.UTF8.encode@varargs
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
  i32.store offset=16
  i32.const 1
  global.set $~argumentsLength
  local.get $1
  local.get $0
  i32.const 9264
  i32.const 0
  call $~lib/string/String.UTF8.encode@varargs
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
  i32.store offset=20
  i32.const 1
  global.set $~argumentsLength
  local.get $1
  local.get $0
  i32.const 9312
  i32.const 0
  call $~lib/string/String.UTF8.encode@varargs
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
  i32.store offset=24
  i32.const 1
  global.set $~argumentsLength
  local.get $1
  local.get $0
  i32.const 4560
  i32.const 0
  call $~lib/string/String.UTF8.encode@varargs
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
  i32.store offset=28
  i32.const 1
  global.set $~argumentsLength
  local.get $1
  local.get $0
  i32.const 4624
  i32.const 0
  call $~lib/string/String.UTF8.encode@varargs
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
  i32.store offset=32
  i32.const 1
  global.set $~argumentsLength
  local.get $1
  local.get $0
  i32.const 9344
  i32.const 0
  call $~lib/string/String.UTF8.encode@varargs
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
  i32.store offset=36
  i32.const 1
  global.set $~argumentsLength
  local.get $1
  local.get $0
  i32.const 9408
  i32.const 0
  call $~lib/string/String.UTF8.encode@varargs
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
  i32.store offset=40
  local.get $1
 )
 (func $assembly/view/outpoint/outpointBaseForProtocol (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  local.get $0
  i32.load
  i32.load
  local.get $0
  i32.load offset=4
  call $~lib/metashrew-as/assembly/blockdata/transaction/OutPoint.from
  i32.load
  local.tee $2
  i32.load offset=4
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.tee $1
  local.get $2
  i32.load
  local.get $2
  i32.load offset=4
  memory.copy
  local.get $0
  i32.load offset=8
  i32.load
  local.set $2
  i32.const 16
  i32.const 9
  call $~lib/rt/stub/__new
  local.tee $3
  i64.const 0
  i64.store
  local.get $3
  i64.const 0
  i64.store offset=8
  local.get $2
  local.get $2
  i32.const 20
  i32.sub
  i32.load offset=16
  call $~lib/metashrew-as/assembly/utils/box/Box#constructor
  local.get $3
  call $~lib/metashrew-runes/assembly/leb128/readULEB128ToU128
  drop
  local.get $3
  call $assembly/indexer/tables/protorune/ProtoruneTable.for
  i32.load offset=4
  local.get $1
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
  local.set $3
  global.get $~lib/metashrew-spendables/assembly/tables/OUTPOINT_TO_OUTPUT
  local.get $1
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#get
  local.tee $2
  local.get $2
  i32.const 20
  i32.sub
  i32.load offset=16
  call $~lib/metashrew-as/assembly/utils/box/Box#constructor
  i32.const 0
  call $~lib/metashrew-as/assembly/blockdata/transaction/Output#constructor
  local.set $2
  local.get $3
  call $~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet.load
  call $assembly/view/outpoint/balanceSheetToProtobuf
  local.set $4
  call $~lib/metashrew-runes/assembly/proto/metashrew-runes/metashrew_runes.OutpointResponse#constructor
  local.tee $3
  call $~lib/metashrew-runes/assembly/proto/metashrew-runes/metashrew_runes.Outpoint#constructor
  i32.store offset=4
  local.get $3
  i32.load offset=4
  local.get $0
  i32.load
  i32.store
  local.get $3
  i32.load offset=4
  local.get $0
  i32.load offset=4
  i32.store offset=4
  local.get $3
  i32.load offset=8
  local.set $5
  local.get $2
  i32.load offset=16
  local.tee $0
  i32.load offset=4
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.tee $6
  local.get $0
  i32.load
  local.get $0
  i32.load offset=4
  memory.copy
  local.get $5
  local.get $6
  call $~lib/metashrew-as/assembly/indexer/index/arrayBufferToArray
  i32.store
  local.get $3
  i32.load offset=8
  local.get $2
  i64.load offset=8
  i64.store offset=8
  local.get $3
  local.get $4
  i32.store
  local.get $3
  global.get $~lib/metashrew-runes/assembly/indexer/constants/index/OUTPOINT_TO_HEIGHT
  local.get $1
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#getValue<u32>
  i32.store offset=12
  local.get $3
  local.get $1
  call $assembly/view/outpoint/txindexForOutpoint
  i32.store offset=16
  local.get $3
 )
 (func $~lib/dataview/DataView#constructor@varargs (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  block $2of2
   block $1of2
    block $outOfRange
     global.get $~argumentsLength
     i32.const 1
     i32.sub
     br_table $1of2 $1of2 $2of2 $outOfRange
    end
    unreachable
   end
   local.get $0
   i32.const 20
   i32.sub
   i32.load offset=16
   local.set $2
  end
  i32.const 12
  i32.const 91
  call $~lib/rt/stub/__new
  local.tee $1
  i32.const 0
  i32.store
  local.get $1
  i32.const 0
  i32.store offset=4
  local.get $1
  i32.const 0
  i32.store offset=8
  local.get $2
  local.get $0
  i32.const 20
  i32.sub
  i32.load offset=16
  i32.gt_u
  local.get $2
  i32.const 1073741820
  i32.gt_u
  i32.or
  if
   i32.const 2608
   i32.const 9520
   i32.const 25
   i32.const 7
   call $~lib/builtins/abort
   unreachable
  end
  local.get $1
  local.get $0
  i32.store
  local.get $1
  local.get $0
  i32.store offset=4
  local.get $1
  local.get $2
  i32.store offset=8
  local.get $1
 )
 (func $~lib/metashrew-runes/assembly/proto/metashrew-runes/__proto.SafeDecoder#constructor (param $0 i32) (result i32)
  (local $1 i32)
  i32.const 9
  i32.const 92
  call $~lib/rt/stub/__new
  local.tee $1
  i32.eqz
  if
   i32.const 8
   i32.const 93
   call $~lib/rt/stub/__new
   local.set $1
  end
  local.get $1
  i32.const 0
  i32.store
  local.get $1
  i32.const 0
  i32.store offset=4
  local.get $1
  local.get $0
  i32.store
  local.get $1
  i32.const 0
  i32.store offset=4
  local.get $1
  i32.const 0
  i32.store8 offset=8
  local.get $1
 )
 (func $~lib/dataview/DataView#getUint8 (param $0 i32) (param $1 i32) (result i32)
  local.get $1
  local.get $0
  i32.load offset=8
  i32.ge_u
  if
   i32.const 3344
   i32.const 9520
   i32.const 72
   i32.const 50
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  i32.load offset=4
  local.get $1
  i32.add
  i32.load8_u
 )
 (func $~lib/util/number/itoa32 (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  local.get $0
  i32.eqz
  if
   i32.const 6576
   return
  end
  i32.const 0
  local.get $0
  i32.sub
  local.get $0
  local.get $0
  i32.const 31
  i32.shr_u
  i32.const 1
  i32.shl
  local.tee $0
  select
  local.tee $3
  i32.const 100000
  i32.lt_u
  if (result i32)
   local.get $3
   i32.const 100
   i32.lt_u
   if (result i32)
    local.get $3
    i32.const 10
    i32.ge_u
    i32.const 1
    i32.add
   else
    local.get $3
    i32.const 10000
    i32.ge_u
    i32.const 3
    i32.add
    local.get $3
    i32.const 1000
    i32.ge_u
    i32.add
   end
  else
   local.get $3
   i32.const 10000000
   i32.lt_u
   if (result i32)
    local.get $3
    i32.const 1000000
    i32.ge_u
    i32.const 6
    i32.add
   else
    local.get $3
    i32.const 1000000000
    i32.ge_u
    i32.const 8
    i32.add
    local.get $3
    i32.const 100000000
    i32.ge_u
    i32.add
   end
  end
  local.tee $2
  i32.const 1
  i32.shl
  local.get $0
  i32.add
  i32.const 2
  call $~lib/rt/stub/__new
  local.tee $1
  local.get $0
  i32.add
  local.get $3
  local.get $2
  call $~lib/util/number/utoa32_dec_lut
  local.get $0
  if
   local.get $1
   i32.const 45
   i32.store16
  end
  local.get $1
 )
 (func $~lib/staticarray/StaticArray<~lib/string/String>#join (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  i32.const 8160
  local.set $3
  block $__inlined_func$~lib/util/string/joinStringArray$1351
   local.get $0
   i32.const 20
   i32.sub
   i32.load offset=16
   i32.const 2
   i32.shr_u
   local.tee $7
   i32.const 1
   i32.sub
   local.tee $5
   i32.const 0
   i32.lt_s
   br_if $__inlined_func$~lib/util/string/joinStringArray$1351
   local.get $5
   i32.eqz
   if
    local.get $0
    i32.load
    local.tee $3
    i32.eqz
    if
     i32.const 8160
     local.set $3
    end
    br $__inlined_func$~lib/util/string/joinStringArray$1351
   end
   loop $for-loop|0
    local.get $4
    local.get $7
    i32.lt_s
    if
     local.get $0
     local.get $4
     i32.const 2
     i32.shl
     i32.add
     i32.load
     local.tee $3
     if
      local.get $1
      local.get $3
      i32.const 20
      i32.sub
      i32.load offset=16
      i32.const 1
      i32.shr_u
      i32.add
      local.set $1
     end
     local.get $4
     i32.const 1
     i32.add
     local.set $4
     br $for-loop|0
    end
   end
   local.get $1
   local.get $5
   i32.const 8156
   i32.load
   i32.const 1
   i32.shr_u
   local.tee $1
   i32.mul
   i32.add
   i32.const 1
   i32.shl
   i32.const 2
   call $~lib/rt/stub/__new
   local.set $3
   loop $for-loop|1
    local.get $5
    local.get $6
    i32.gt_s
    if
     local.get $0
     local.get $6
     i32.const 2
     i32.shl
     i32.add
     i32.load
     local.tee $4
     if
      local.get $3
      local.get $2
      i32.const 1
      i32.shl
      i32.add
      local.get $4
      local.get $4
      i32.const 20
      i32.sub
      i32.load offset=16
      i32.const 1
      i32.shr_u
      local.tee $4
      i32.const 1
      i32.shl
      memory.copy
      local.get $2
      local.get $4
      i32.add
      local.set $2
     end
     local.get $1
     if
      local.get $3
      local.get $2
      i32.const 1
      i32.shl
      i32.add
      i32.const 8160
      local.get $1
      i32.const 1
      i32.shl
      memory.copy
      local.get $1
      local.get $2
      i32.add
      local.set $2
     end
     local.get $6
     i32.const 1
     i32.add
     local.set $6
     br $for-loop|1
    end
   end
   local.get $0
   local.get $5
   i32.const 2
   i32.shl
   i32.add
   i32.load
   local.tee $0
   if
    local.get $3
    local.get $2
    i32.const 1
    i32.shl
    i32.add
    local.get $0
    local.get $0
    i32.const 20
    i32.sub
    i32.load offset=16
    i32.const -2
    i32.and
    memory.copy
   end
  end
  local.get $3
 )
 (func $~lib/metashrew-runes/assembly/proto/metashrew-runes/__proto.Decoder#varint (param $0 i32) (result i64)
  (local $1 i64)
  (local $2 i32)
  local.get $0
  i32.load
  local.get $0
  i32.load offset=4
  call $~lib/dataview/DataView#getUint8
  i32.const 255
  i32.and
  i64.extend_i32_u
  i64.const 127
  i64.and
  local.set $1
  local.get $0
  local.get $0
  i32.load offset=4
  local.tee $2
  i32.const 1
  i32.add
  i32.store offset=4
  block $folding-inner0
   local.get $0
   i32.load
   local.get $2
   call $~lib/dataview/DataView#getUint8
   i32.const 255
   i32.and
   i32.const 128
   i32.lt_u
   br_if $folding-inner0
   local.get $0
   i32.load
   local.get $0
   i32.load offset=4
   call $~lib/dataview/DataView#getUint8
   i32.const 255
   i32.and
   i64.extend_i32_u
   i64.const 127
   i64.and
   i64.const 7
   i64.shl
   local.get $1
   i64.or
   local.set $1
   local.get $0
   local.get $0
   i32.load offset=4
   local.tee $2
   i32.const 1
   i32.add
   i32.store offset=4
   local.get $0
   i32.load
   local.get $2
   call $~lib/dataview/DataView#getUint8
   i32.const 255
   i32.and
   i32.const 128
   i32.lt_u
   br_if $folding-inner0
   local.get $0
   i32.load
   local.get $0
   i32.load offset=4
   call $~lib/dataview/DataView#getUint8
   i32.const 255
   i32.and
   i64.extend_i32_u
   i64.const 127
   i64.and
   i64.const 14
   i64.shl
   local.get $1
   i64.or
   local.set $1
   local.get $0
   local.get $0
   i32.load offset=4
   local.tee $2
   i32.const 1
   i32.add
   i32.store offset=4
   local.get $0
   i32.load
   local.get $2
   call $~lib/dataview/DataView#getUint8
   i32.const 255
   i32.and
   i32.const 128
   i32.lt_u
   br_if $folding-inner0
   local.get $0
   i32.load
   local.get $0
   i32.load offset=4
   call $~lib/dataview/DataView#getUint8
   i32.const 255
   i32.and
   i64.extend_i32_u
   i64.const 127
   i64.and
   i64.const 21
   i64.shl
   local.get $1
   i64.or
   local.set $1
   local.get $0
   local.get $0
   i32.load offset=4
   local.tee $2
   i32.const 1
   i32.add
   i32.store offset=4
   local.get $0
   i32.load
   local.get $2
   call $~lib/dataview/DataView#getUint8
   i32.const 255
   i32.and
   i32.const 128
   i32.lt_u
   br_if $folding-inner0
   local.get $0
   i32.load
   local.get $0
   i32.load offset=4
   call $~lib/dataview/DataView#getUint8
   i32.const 255
   i32.and
   i64.extend_i32_u
   i64.const 127
   i64.and
   i64.const 28
   i64.shl
   local.get $1
   i64.or
   local.set $1
   local.get $0
   local.get $0
   i32.load offset=4
   local.tee $2
   i32.const 1
   i32.add
   i32.store offset=4
   local.get $0
   i32.load
   local.get $2
   call $~lib/dataview/DataView#getUint8
   i32.const 255
   i32.and
   i32.const 128
   i32.lt_u
   br_if $folding-inner0
   local.get $0
   i32.load
   local.get $0
   i32.load offset=4
   call $~lib/dataview/DataView#getUint8
   i32.const 255
   i32.and
   i64.extend_i32_u
   i64.const 127
   i64.and
   i64.const 35
   i64.shl
   local.get $1
   i64.or
   local.set $1
   local.get $0
   local.get $0
   i32.load offset=4
   local.tee $2
   i32.const 1
   i32.add
   i32.store offset=4
   local.get $0
   i32.load
   local.get $2
   call $~lib/dataview/DataView#getUint8
   i32.const 255
   i32.and
   i32.const 128
   i32.lt_u
   br_if $folding-inner0
   local.get $0
   i32.load
   local.get $0
   i32.load offset=4
   call $~lib/dataview/DataView#getUint8
   i32.const 255
   i32.and
   i64.extend_i32_u
   i64.const 127
   i64.and
   i64.const 42
   i64.shl
   local.get $1
   i64.or
   local.set $1
   local.get $0
   local.get $0
   i32.load offset=4
   local.tee $2
   i32.const 1
   i32.add
   i32.store offset=4
   local.get $0
   i32.load
   local.get $2
   call $~lib/dataview/DataView#getUint8
   i32.const 255
   i32.and
   i32.const 128
   i32.lt_u
   br_if $folding-inner0
   local.get $0
   i32.load
   local.get $0
   i32.load offset=4
   call $~lib/dataview/DataView#getUint8
   i32.const 255
   i32.and
   i64.extend_i32_u
   i64.const 127
   i64.and
   i64.const 49
   i64.shl
   local.get $1
   i64.or
   local.set $1
   local.get $0
   local.get $0
   i32.load offset=4
   local.tee $2
   i32.const 1
   i32.add
   i32.store offset=4
   local.get $0
   i32.load
   local.get $2
   call $~lib/dataview/DataView#getUint8
   i32.const 255
   i32.and
   i32.const 128
   i32.lt_u
   br_if $folding-inner0
   local.get $0
   i32.load
   local.get $0
   i32.load offset=4
   call $~lib/dataview/DataView#getUint8
   i32.const 255
   i32.and
   i64.extend_i32_u
   i64.const 127
   i64.and
   i64.const 28
   i64.shl
   local.get $1
   i64.or
   local.set $1
   local.get $0
   local.get $0
   i32.load offset=4
   local.tee $2
   i32.const 1
   i32.add
   i32.store offset=4
   local.get $0
   i32.load
   local.get $2
   call $~lib/dataview/DataView#getUint8
   i32.const 255
   i32.and
   i32.const 128
   i32.lt_u
   br_if $folding-inner0
   local.get $0
   i32.load
   local.get $0
   i32.load offset=4
   call $~lib/dataview/DataView#getUint8
   i32.const 255
   i32.and
   i64.extend_i32_u
   i64.const 127
   i64.and
   i64.const 35
   i64.shl
   local.get $1
   i64.or
   local.set $1
   local.get $0
   local.get $0
   i32.load offset=4
   local.tee $2
   i32.const 1
   i32.add
   i32.store offset=4
   local.get $0
   i32.load
   local.get $2
   call $~lib/dataview/DataView#getUint8
   i32.const 255
   i32.and
   i32.const 128
   i32.lt_u
   br_if $folding-inner0
   local.get $0
   i32.load offset=4
   local.get $0
   i32.load
   i32.load offset=8
   i32.gt_s
   if
    i32.const 9716
    local.get $0
    i32.load offset=4
    call $~lib/util/number/itoa32
    i32.store
    i32.const 9712
    call $~lib/staticarray/StaticArray<~lib/string/String>#join
    i32.const 9744
    i32.const 278
    i32.const 7
    call $~lib/builtins/abort
    unreachable
   end
  end
  local.get $1
 )
 (func $~lib/metashrew-runes/assembly/proto/metashrew-runes/__proto.SafeDecoder#bytes (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  block $__inlined_func$~lib/metashrew-runes/assembly/proto/metashrew-runes/__proto.SafeDecoder#invalid$3301 (result i32)
   i32.const 1
   local.get $0
   i32.load8_u offset=8
   br_if $__inlined_func$~lib/metashrew-runes/assembly/proto/metashrew-runes/__proto.SafeDecoder#invalid$3301
   drop
   local.get $0
   i32.load offset=4
   i32.const 4096
   i32.gt_s
   if
    local.get $0
    i32.const 1
    i32.store8 offset=8
    i32.const 1
    br $__inlined_func$~lib/metashrew-runes/assembly/proto/metashrew-runes/__proto.SafeDecoder#invalid$3301
   end
   i32.const 0
  end
  if
   i32.const 0
   call $~lib/array/Array<u8>#constructor
   return
  end
  local.get $0
  call $~lib/metashrew-runes/assembly/proto/metashrew-runes/__proto.Decoder#varint@override
  i32.wrap_i64
  local.set $1
  local.get $0
  i32.load
  i32.load offset=8
  local.get $1
  local.get $0
  i32.load offset=4
  i32.add
  i32.lt_s
  if (result i32)
   i32.const 1
  else
   local.get $1
   local.get $0
   i32.load offset=4
   i32.add
   i32.const 4096
   i32.gt_s
  end
  if
   local.get $0
   i32.const 1
   i32.store8 offset=8
   i32.const 0
   call $~lib/array/Array<u8>#constructor
   return
  end
  local.get $1
  call $~lib/array/Array<u8>#constructor
  local.set $3
  loop $for-loop|0
   local.get $1
   local.get $2
   i32.gt_u
   if
    local.get $0
    local.get $0
    i32.load offset=4
    local.tee $4
    i32.const 1
    i32.add
    i32.store offset=4
    local.get $3
    local.get $2
    local.get $0
    i32.load
    local.get $4
    call $~lib/dataview/DataView#getUint8
    call $~lib/array/Array<u8>#__set
    local.get $2
    i32.const 1
    i32.add
    local.set $2
    br $for-loop|0
   end
  end
  local.get $3
 )
 (func $~lib/metashrew-runes/assembly/proto/metashrew-runes/__proto.SafeDecoder#varint (param $0 i32) (result i64)
  (local $1 i64)
  (local $2 i32)
  block $__inlined_func$~lib/metashrew-runes/assembly/proto/metashrew-runes/__proto.SafeDecoder#invalid$3302 (result i32)
   i32.const 1
   local.get $0
   i32.load8_u offset=8
   br_if $__inlined_func$~lib/metashrew-runes/assembly/proto/metashrew-runes/__proto.SafeDecoder#invalid$3302
   drop
   local.get $0
   i32.load offset=4
   i32.const 4096
   i32.gt_s
   if
    local.get $0
    i32.const 1
    i32.store8 offset=8
    i32.const 1
    br $__inlined_func$~lib/metashrew-runes/assembly/proto/metashrew-runes/__proto.SafeDecoder#invalid$3302
   end
   i32.const 0
  end
  if
   i64.const 0
   return
  end
  local.get $0
  i32.load
  local.get $0
  i32.load offset=4
  call $~lib/dataview/DataView#getUint8
  i32.const 255
  i32.and
  i64.extend_i32_u
  i64.const 127
  i64.and
  local.set $1
  local.get $0
  local.get $0
  i32.load offset=4
  local.tee $2
  i32.const 1
  i32.add
  i32.store offset=4
  block $folding-inner1
   local.get $0
   i32.load
   local.get $2
   call $~lib/dataview/DataView#getUint8
   i32.const 255
   i32.and
   i32.const 128
   i32.lt_u
   br_if $folding-inner1
   local.get $0
   i32.load
   local.get $0
   i32.load offset=4
   call $~lib/dataview/DataView#getUint8
   i32.const 255
   i32.and
   i64.extend_i32_u
   i64.const 127
   i64.and
   i64.const 7
   i64.shl
   local.get $1
   i64.or
   local.set $1
   block $folding-inner0
    local.get $0
    i32.load offset=4
    i32.const 1
    i32.add
    i32.const 4096
    i32.gt_s
    br_if $folding-inner0
    local.get $0
    local.get $0
    i32.load offset=4
    local.tee $2
    i32.const 1
    i32.add
    i32.store offset=4
    local.get $0
    i32.load
    local.get $2
    call $~lib/dataview/DataView#getUint8
    i32.const 255
    i32.and
    i32.const 128
    i32.lt_u
    br_if $folding-inner1
    local.get $0
    i32.load
    local.get $0
    i32.load offset=4
    call $~lib/dataview/DataView#getUint8
    i32.const 255
    i32.and
    i64.extend_i32_u
    i64.const 127
    i64.and
    i64.const 14
    i64.shl
    local.get $1
    i64.or
    local.set $1
    local.get $0
    i32.load offset=4
    i32.const 1
    i32.add
    i32.const 4096
    i32.gt_s
    br_if $folding-inner0
    local.get $0
    local.get $0
    i32.load offset=4
    local.tee $2
    i32.const 1
    i32.add
    i32.store offset=4
    local.get $0
    i32.load
    local.get $2
    call $~lib/dataview/DataView#getUint8
    i32.const 255
    i32.and
    i32.const 128
    i32.lt_u
    br_if $folding-inner1
    local.get $0
    i32.load
    local.get $0
    i32.load offset=4
    call $~lib/dataview/DataView#getUint8
    i32.const 255
    i32.and
    i64.extend_i32_u
    i64.const 127
    i64.and
    i64.const 21
    i64.shl
    local.get $1
    i64.or
    local.set $1
    local.get $0
    i32.load offset=4
    i32.const 1
    i32.add
    i32.const 4096
    i32.gt_s
    br_if $folding-inner0
    local.get $0
    local.get $0
    i32.load offset=4
    local.tee $2
    i32.const 1
    i32.add
    i32.store offset=4
    local.get $0
    i32.load
    local.get $2
    call $~lib/dataview/DataView#getUint8
    i32.const 255
    i32.and
    i32.const 128
    i32.lt_u
    br_if $folding-inner1
    local.get $0
    i32.load
    local.get $0
    i32.load offset=4
    call $~lib/dataview/DataView#getUint8
    i32.const 255
    i32.and
    i64.extend_i32_u
    i64.const 127
    i64.and
    i64.const 28
    i64.shl
    local.get $1
    i64.or
    local.set $1
    local.get $0
    i32.load offset=4
    i32.const 1
    i32.add
    i32.const 4096
    i32.gt_s
    br_if $folding-inner0
    local.get $0
    local.get $0
    i32.load offset=4
    local.tee $2
    i32.const 1
    i32.add
    i32.store offset=4
    local.get $0
    i32.load
    local.get $2
    call $~lib/dataview/DataView#getUint8
    i32.const 255
    i32.and
    i32.const 128
    i32.lt_u
    br_if $folding-inner1
    local.get $0
    i32.load
    local.get $0
    i32.load offset=4
    call $~lib/dataview/DataView#getUint8
    i32.const 255
    i32.and
    i64.extend_i32_u
    i64.const 127
    i64.and
    i64.const 35
    i64.shl
    local.get $1
    i64.or
    local.set $1
    local.get $0
    i32.load offset=4
    i32.const 1
    i32.add
    i32.const 4096
    i32.gt_s
    br_if $folding-inner0
    local.get $0
    local.get $0
    i32.load offset=4
    local.tee $2
    i32.const 1
    i32.add
    i32.store offset=4
    local.get $0
    i32.load
    local.get $2
    call $~lib/dataview/DataView#getUint8
    i32.const 255
    i32.and
    i32.const 128
    i32.lt_u
    br_if $folding-inner1
    local.get $0
    i32.load
    local.get $0
    i32.load offset=4
    call $~lib/dataview/DataView#getUint8
    i32.const 255
    i32.and
    i64.extend_i32_u
    i64.const 127
    i64.and
    i64.const 42
    i64.shl
    local.get $1
    i64.or
    local.set $1
    local.get $0
    local.get $0
    i32.load offset=4
    local.tee $2
    i32.const 1
    i32.add
    i32.store offset=4
    local.get $0
    i32.load
    local.get $2
    call $~lib/dataview/DataView#getUint8
    i32.const 255
    i32.and
    i32.const 128
    i32.lt_u
    br_if $folding-inner1
    local.get $0
    i32.load
    local.get $0
    i32.load offset=4
    call $~lib/dataview/DataView#getUint8
    i32.const 255
    i32.and
    i64.extend_i32_u
    i64.const 127
    i64.and
    i64.const 49
    i64.shl
    local.get $1
    i64.or
    local.set $1
    local.get $0
    local.get $0
    i32.load offset=4
    local.tee $2
    i32.const 1
    i32.add
    i32.store offset=4
    local.get $0
    i32.load
    local.get $2
    call $~lib/dataview/DataView#getUint8
    i32.const 255
    i32.and
    i32.const 128
    i32.lt_u
    br_if $folding-inner1
    local.get $0
    i32.load
    local.get $0
    i32.load offset=4
    call $~lib/dataview/DataView#getUint8
    i32.const 255
    i32.and
    i64.extend_i32_u
    i64.const 127
    i64.and
    i64.const 28
    i64.shl
    local.get $1
    i64.or
    local.set $1
    local.get $0
    local.get $0
    i32.load offset=4
    local.tee $2
    i32.const 1
    i32.add
    i32.store offset=4
    local.get $0
    i32.load
    local.get $2
    call $~lib/dataview/DataView#getUint8
    i32.const 255
    i32.and
    i32.const 128
    i32.lt_u
    br_if $folding-inner1
    local.get $0
    i32.load
    local.get $0
    i32.load offset=4
    call $~lib/dataview/DataView#getUint8
    i32.const 255
    i32.and
    i64.extend_i32_u
    i64.const 127
    i64.and
    i64.const 35
    i64.shl
    local.get $1
    i64.or
    local.set $1
    local.get $0
    i32.load offset=4
    i32.const 1
    i32.add
    i32.const 4096
    i32.gt_s
    br_if $folding-inner0
    local.get $0
    local.get $0
    i32.load offset=4
    local.tee $2
    i32.const 1
    i32.add
    i32.store offset=4
    local.get $0
    i32.load
    local.get $2
    call $~lib/dataview/DataView#getUint8
    i32.const 255
    i32.and
    i32.const 128
    i32.lt_u
    br_if $folding-inner1
    local.get $0
    i32.load offset=4
    local.get $0
    i32.load
    i32.load offset=8
    i32.gt_s
    if (result i32)
     i32.const 1
    else
     local.get $0
     i32.load offset=4
     i32.const 4096
     i32.gt_s
    end
    br_if $folding-inner0
    local.get $1
    return
   end
   local.get $0
   i32.const 1
   i32.store8 offset=8
   i64.const 0
   return
  end
  local.get $1
 )
 (func $~lib/metashrew-runes/assembly/proto/metashrew-runes/__proto.SafeDecoder#skipType (param $0 i32) (param $1 i32)
  block $__inlined_func$~lib/metashrew-runes/assembly/proto/metashrew-runes/__proto.SafeDecoder#invalid$3304 (result i32)
   i32.const 1
   local.get $0
   i32.load8_u offset=8
   br_if $__inlined_func$~lib/metashrew-runes/assembly/proto/metashrew-runes/__proto.SafeDecoder#invalid$3304
   drop
   local.get $0
   i32.load offset=4
   i32.const 4096
   i32.gt_s
   if
    local.get $0
    i32.const 1
    i32.store8 offset=8
    i32.const 1
    br $__inlined_func$~lib/metashrew-runes/assembly/proto/metashrew-runes/__proto.SafeDecoder#invalid$3304
   end
   i32.const 0
  end
  if
   return
  end
  block $break|0
   block $case5|0
    block $case4|0
     block $case3|0
      block $case2|0
       block $case1|0
        block $case0|0
         local.get $1
         br_table $case0|0 $case1|0 $case2|0 $case3|0 $case5|0 $case4|0 $case5|0
        end
        local.get $0
        call $~lib/metashrew-runes/assembly/proto/metashrew-runes/__proto.SafeDecoder#varint
        drop
        br $break|0
       end
       block $__inlined_func$~lib/metashrew-runes/assembly/proto/metashrew-runes/__proto.SafeDecoder#invalid$3303 (result i32)
        i32.const 1
        local.get $0
        i32.load8_u offset=8
        br_if $__inlined_func$~lib/metashrew-runes/assembly/proto/metashrew-runes/__proto.SafeDecoder#invalid$3303
        drop
        local.get $0
        i32.load offset=4
        i32.const 4096
        i32.gt_s
        if
         local.get $0
         i32.const 1
         i32.store8 offset=8
         i32.const 1
         br $__inlined_func$~lib/metashrew-runes/assembly/proto/metashrew-runes/__proto.SafeDecoder#invalid$3303
        end
        i32.const 0
       end
       i32.eqz
       if
        local.get $0
        i32.load
        i32.load offset=8
        local.get $0
        i32.load offset=4
        i32.const 8
        i32.add
        i32.lt_s
        if (result i32)
         i32.const 1
        else
         local.get $0
         i32.load offset=4
         i32.const 8
         i32.add
         i32.const 4096
         i32.gt_s
        end
        if
         local.get $0
         i32.const 1
         i32.store8 offset=8
        end
        local.get $0
        local.get $0
        i32.load offset=4
        i32.const 8
        i32.add
        i32.store offset=4
       end
       br $break|0
      end
      local.get $0
      call $~lib/metashrew-runes/assembly/proto/metashrew-runes/__proto.Decoder#varint@override
      i32.wrap_i64
      local.set $1
      block $__inlined_func$~lib/metashrew-runes/assembly/proto/metashrew-runes/__proto.SafeDecoder#invalid$33030 (result i32)
       i32.const 1
       local.get $0
       i32.load8_u offset=8
       br_if $__inlined_func$~lib/metashrew-runes/assembly/proto/metashrew-runes/__proto.SafeDecoder#invalid$33030
       drop
       local.get $0
       i32.load offset=4
       i32.const 4096
       i32.gt_s
       if
        local.get $0
        i32.const 1
        i32.store8 offset=8
        i32.const 1
        br $__inlined_func$~lib/metashrew-runes/assembly/proto/metashrew-runes/__proto.SafeDecoder#invalid$33030
       end
       i32.const 0
      end
      i32.eqz
      if
       local.get $0
       i32.load
       i32.load offset=8
       local.get $1
       local.get $0
       i32.load offset=4
       i32.add
       i32.lt_s
       if (result i32)
        i32.const 1
       else
        local.get $1
        local.get $0
        i32.load offset=4
        i32.add
        i32.const 4096
        i32.gt_s
       end
       if
        local.get $0
        i32.const 1
        i32.store8 offset=8
       end
       local.get $0
       local.get $1
       local.get $0
       i32.load offset=4
       i32.add
       i32.store offset=4
      end
      br $break|0
     end
     loop $while-continue|1
      local.get $0
      call $~lib/metashrew-runes/assembly/proto/metashrew-runes/__proto.Decoder#varint@override
      i32.wrap_i64
      i32.const 7
      i32.and
      local.tee $1
      i32.const 4
      i32.ne
      if
       local.get $0
       local.get $1
       call $~lib/metashrew-runes/assembly/proto/metashrew-runes/__proto.SafeDecoder#skipType
       br $while-continue|1
      end
     end
     br $break|0
    end
    block $__inlined_func$~lib/metashrew-runes/assembly/proto/metashrew-runes/__proto.SafeDecoder#invalid$33031 (result i32)
     i32.const 1
     local.get $0
     i32.load8_u offset=8
     br_if $__inlined_func$~lib/metashrew-runes/assembly/proto/metashrew-runes/__proto.SafeDecoder#invalid$33031
     drop
     local.get $0
     i32.load offset=4
     i32.const 4096
     i32.gt_s
     if
      local.get $0
      i32.const 1
      i32.store8 offset=8
      i32.const 1
      br $__inlined_func$~lib/metashrew-runes/assembly/proto/metashrew-runes/__proto.SafeDecoder#invalid$33031
     end
     i32.const 0
    end
    i32.eqz
    if
     local.get $0
     i32.load
     i32.load offset=8
     local.get $0
     i32.load offset=4
     i32.const 4
     i32.add
     i32.lt_s
     if (result i32)
      i32.const 1
     else
      local.get $0
      i32.load offset=4
      i32.const 4
      i32.add
      i32.const 4096
      i32.gt_s
     end
     if
      local.get $0
      i32.const 1
      i32.store8 offset=8
     end
     local.get $0
     local.get $0
     i32.load offset=4
     i32.const 4
     i32.add
     i32.store offset=4
    end
    br $break|0
   end
   local.get $0
   i32.const 1
   i32.store8 offset=8
  end
 )
 (func $~lib/metashrew-runes/assembly/proto/metashrew-runes/metashrew_runes.Rune#size (param $0 i32) (result i32)
  (local $1 i64)
  (local $2 i32)
  (local $3 i32)
  local.get $0
  i32.load
  local.tee $2
  if (result i32)
   local.get $2
   i32.load
   if (result i32)
    local.get $2
    i64.load32_u
    local.tee $1
    i64.const 128
    i64.lt_u
    if (result i32)
     i32.const 1
    else
     local.get $1
     i64.const 16384
     i64.lt_u
     if (result i32)
      i32.const 2
     else
      local.get $1
      i64.const 2097152
      i64.lt_u
      if (result i32)
       i32.const 3
      else
       i32.const 4
       i32.const 5
       local.get $1
       i64.const 268435456
       i64.lt_u
       select
      end
     end
    end
    i32.const 1
    i32.add
   else
    i32.const 0
   end
   local.get $2
   i32.load offset=4
   if (result i32)
    local.get $2
    i64.load32_u offset=4
    local.tee $1
    i64.const 128
    i64.lt_u
    if (result i32)
     i32.const 1
    else
     local.get $1
     i64.const 16384
     i64.lt_u
     if (result i32)
      i32.const 2
     else
      local.get $1
      i64.const 2097152
      i64.lt_u
      if (result i32)
       i32.const 3
      else
       i32.const 4
       i32.const 5
       local.get $1
       i64.const 268435456
       i64.lt_u
       select
      end
     end
    end
    i32.const 1
    i32.add
   else
    i32.const 0
   end
   i32.add
   local.tee $2
   if (result i32)
    local.get $2
    local.get $2
    i64.extend_i32_u
    local.tee $1
    i64.const 128
    i64.lt_u
    if (result i32)
     i32.const 1
    else
     local.get $1
     i64.const 16384
     i64.lt_u
     if (result i32)
      i32.const 2
     else
      local.get $1
      i64.const 2097152
      i64.lt_u
      if (result i32)
       i32.const 3
      else
       i32.const 4
       i32.const 5
       local.get $1
       i64.const 268435456
       i64.lt_u
       select
      end
     end
    end
    i32.const 1
    i32.add
    i32.add
   else
    i32.const 0
   end
  else
   i32.const 0
  end
  local.get $0
  i32.load offset=4
  local.tee $3
  i32.load offset=12
  local.tee $2
  i32.const 0
  i32.gt_s
  if (result i32)
   local.get $2
   local.get $3
   i64.load32_s offset=12
   local.tee $1
   i64.const 128
   i64.lt_u
   if (result i32)
    i32.const 1
   else
    local.get $1
    i64.const 16384
    i64.lt_u
    if (result i32)
     i32.const 2
    else
     local.get $1
     i64.const 2097152
     i64.lt_u
     if (result i32)
      i32.const 3
     else
      local.get $1
      i64.const 268435456
      i64.lt_u
      if (result i32)
       i32.const 4
      else
       local.get $1
       i64.const 34359738368
       i64.lt_u
       if (result i32)
        i32.const 5
       else
        local.get $1
        i64.const 4398046511104
        i64.lt_u
        if (result i32)
         i32.const 6
        else
         local.get $1
         i64.const 562949953421312
         i64.lt_u
         if (result i32)
          i32.const 7
         else
          local.get $1
          i64.const 72057594037927936
          i64.lt_u
          if (result i32)
           i32.const 8
          else
           i32.const 9
           i32.const 10
           local.get $1
           i64.const -9223372036854775808
           i64.lt_u
           select
          end
         end
        end
       end
      end
     end
    end
   end
   i32.const 1
   i32.add
   i32.add
  else
   i32.const 0
  end
  i32.add
  local.get $0
  i32.load offset=8
  if (result i32)
   local.get $0
   i64.load32_u offset=8
   local.tee $1
   i64.const 128
   i64.lt_u
   if (result i32)
    i32.const 1
   else
    local.get $1
    i64.const 16384
    i64.lt_u
    if (result i32)
     i32.const 2
    else
     local.get $1
     i64.const 2097152
     i64.lt_u
     if (result i32)
      i32.const 3
     else
      i32.const 4
      i32.const 5
      local.get $1
      i64.const 268435456
      i64.lt_u
      select
     end
    end
   end
   i32.const 1
   i32.add
  else
   i32.const 0
  end
  i32.add
  local.get $0
  i32.load offset=12
  if (result i32)
   local.get $0
   i64.load32_u offset=12
   local.tee $1
   i64.const 128
   i64.lt_u
   if (result i32)
    i32.const 1
   else
    local.get $1
    i64.const 16384
    i64.lt_u
    if (result i32)
     i32.const 2
    else
     local.get $1
     i64.const 2097152
     i64.lt_u
     if (result i32)
      i32.const 3
     else
      i32.const 4
      i32.const 5
      local.get $1
      i64.const 268435456
      i64.lt_u
      select
     end
    end
   end
   i32.const 1
   i32.add
  else
   i32.const 0
  end
  i32.add
  local.get $0
  i32.load offset=16
  if (result i32)
   local.get $0
   i64.load32_u offset=16
   local.tee $1
   i64.const 128
   i64.lt_u
   if (result i32)
    i32.const 1
   else
    local.get $1
    i64.const 16384
    i64.lt_u
    if (result i32)
     i32.const 2
    else
     local.get $1
     i64.const 2097152
     i64.lt_u
     if (result i32)
      i32.const 3
     else
      i32.const 4
      i32.const 5
      local.get $1
      i64.const 268435456
      i64.lt_u
      select
     end
    end
   end
   i32.const 1
   i32.add
  else
   i32.const 0
  end
  i32.add
 )
 (func $~lib/metashrew-runes/assembly/proto/metashrew-runes/metashrew_runes.BalanceSheetItem#size (param $0 i32) (result i32)
  (local $1 i64)
  (local $2 i32)
  local.get $0
  i32.load
  local.tee $2
  if (result i32)
   local.get $2
   call $~lib/metashrew-runes/assembly/proto/metashrew-runes/metashrew_runes.Rune#size
   local.tee $2
   if (result i32)
    local.get $2
    local.get $2
    i64.extend_i32_u
    local.tee $1
    i64.const 128
    i64.lt_u
    if (result i32)
     i32.const 1
    else
     local.get $1
     i64.const 16384
     i64.lt_u
     if (result i32)
      i32.const 2
     else
      local.get $1
      i64.const 2097152
      i64.lt_u
      if (result i32)
       i32.const 3
      else
       i32.const 4
       i32.const 5
       local.get $1
       i64.const 268435456
       i64.lt_u
       select
      end
     end
    end
    i32.const 1
    i32.add
    i32.add
   else
    i32.const 0
   end
  else
   i32.const 0
  end
  local.set $2
  local.get $0
  i32.load offset=4
  local.tee $0
  i32.load offset=12
  i32.const 0
  i32.gt_s
  if (result i32)
   local.get $0
   i32.load offset=12
   local.get $0
   i64.load32_s offset=12
   local.tee $1
   i64.const 128
   i64.lt_u
   if (result i32)
    i32.const 1
   else
    local.get $1
    i64.const 16384
    i64.lt_u
    if (result i32)
     i32.const 2
    else
     local.get $1
     i64.const 2097152
     i64.lt_u
     if (result i32)
      i32.const 3
     else
      local.get $1
      i64.const 268435456
      i64.lt_u
      if (result i32)
       i32.const 4
      else
       local.get $1
       i64.const 34359738368
       i64.lt_u
       if (result i32)
        i32.const 5
       else
        local.get $1
        i64.const 4398046511104
        i64.lt_u
        if (result i32)
         i32.const 6
        else
         local.get $1
         i64.const 562949953421312
         i64.lt_u
         if (result i32)
          i32.const 7
         else
          local.get $1
          i64.const 72057594037927936
          i64.lt_u
          if (result i32)
           i32.const 8
          else
           i32.const 9
           i32.const 10
           local.get $1
           i64.const -9223372036854775808
           i64.lt_u
           select
          end
         end
        end
       end
      end
     end
    end
   end
   i32.const 1
   i32.add
   i32.add
  else
   i32.const 0
  end
  local.get $2
  i32.add
 )
 (func $~lib/metashrew-runes/assembly/proto/metashrew-runes/metashrew_runes.BalanceSheet#size (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i64)
  (local $4 i32)
  loop $for-loop|0
   local.get $2
   local.get $0
   i32.load
   local.tee $4
   i32.load offset=12
   i32.lt_s
   if
    local.get $4
    local.get $2
    call $~lib/array/Array<~lib/array/Array<u8>>#__get
    call $~lib/metashrew-runes/assembly/proto/metashrew-runes/metashrew_runes.BalanceSheetItem#size
    local.tee $4
    if
     local.get $1
     local.get $4
     i64.extend_i32_u
     local.tee $3
     i64.const 128
     i64.lt_u
     if (result i32)
      i32.const 1
     else
      local.get $3
      i64.const 16384
      i64.lt_u
      if (result i32)
       i32.const 2
      else
       local.get $3
       i64.const 2097152
       i64.lt_u
       if (result i32)
        i32.const 3
       else
        i32.const 4
        i32.const 5
        local.get $3
        i64.const 268435456
        i64.lt_u
        select
       end
      end
     end
     i32.const 1
     i32.add
     local.get $4
     i32.add
     i32.add
     local.set $1
    end
    local.get $2
    i32.const 1
    i32.add
    local.set $2
    br $for-loop|0
   end
  end
  local.get $1
 )
 (func $~lib/metashrew-runes/assembly/proto/metashrew-runes/metashrew_runes.Rune#encodeU8Array (param $0 i32) (param $1 i32)
  (local $2 i64)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  local.get $1
  i32.load
  drop
  local.get $0
  i32.load
  local.tee $5
  if
   local.get $5
   i32.load
   if (result i32)
    local.get $5
    i64.load32_u
    local.tee $2
    i64.const 128
    i64.lt_u
    if (result i32)
     i32.const 1
    else
     local.get $2
     i64.const 16384
     i64.lt_u
     if (result i32)
      i32.const 2
     else
      local.get $2
      i64.const 2097152
      i64.lt_u
      if (result i32)
       i32.const 3
      else
       i32.const 4
       i32.const 5
       local.get $2
       i64.const 268435456
       i64.lt_u
       select
      end
     end
    end
    i32.const 1
    i32.add
   else
    i32.const 0
   end
   local.get $5
   i32.load offset=4
   if (result i32)
    local.get $5
    i64.load32_u offset=4
    local.tee $2
    i64.const 128
    i64.lt_u
    if (result i32)
     i32.const 1
    else
     local.get $2
     i64.const 16384
     i64.lt_u
     if (result i32)
      i32.const 2
     else
      local.get $2
      i64.const 2097152
      i64.lt_u
      if (result i32)
       i32.const 3
      else
       i32.const 4
       i32.const 5
       local.get $2
       i64.const 268435456
       i64.lt_u
       select
      end
     end
    end
    i32.const 1
    i32.add
   else
    i32.const 0
   end
   i32.add
   local.tee $4
   if
    local.get $1
    i64.const 10
    call $~lib/metashrew-as/assembly/proto/metashrew/__proto.Encoder#varint64
    local.get $1
    local.get $4
    i64.extend_i32_u
    call $~lib/metashrew-as/assembly/proto/metashrew/__proto.Encoder#varint64
    local.get $1
    i32.load
    drop
    local.get $5
    i32.load
    if
     local.get $1
     i64.const 8
     call $~lib/metashrew-as/assembly/proto/metashrew/__proto.Encoder#varint64
     local.get $1
     local.get $5
     i64.load32_u
     call $~lib/metashrew-as/assembly/proto/metashrew/__proto.Encoder#varint64
    end
    local.get $5
    i32.load offset=4
    if
     local.get $1
     i64.const 16
     call $~lib/metashrew-as/assembly/proto/metashrew/__proto.Encoder#varint64
     local.get $1
     local.get $5
     i64.load32_u offset=4
     call $~lib/metashrew-as/assembly/proto/metashrew/__proto.Encoder#varint64
    end
   end
  end
  local.get $0
  i32.load offset=4
  i32.load offset=12
  i32.const 0
  i32.gt_s
  if
   local.get $1
   i64.const 18
   call $~lib/metashrew-as/assembly/proto/metashrew/__proto.Encoder#varint64
   local.get $1
   local.get $0
   i32.load offset=4
   i64.load32_s offset=12
   call $~lib/metashrew-as/assembly/proto/metashrew/__proto.Encoder#varint64
   local.get $0
   i32.load offset=4
   local.set $4
   loop $for-loop|0
    local.get $3
    local.get $4
    i32.load offset=12
    i32.lt_s
    if
     local.get $1
     i32.load
     local.get $4
     local.get $3
     call $~lib/array/Array<u8>#__get
     call $~lib/array/Array<u8>#push
     local.get $3
     i32.const 1
     i32.add
     local.set $3
     br $for-loop|0
    end
   end
  end
  local.get $0
  i32.load offset=8
  if
   local.get $1
   i64.const 24
   call $~lib/metashrew-as/assembly/proto/metashrew/__proto.Encoder#varint64
   local.get $1
   local.get $0
   i64.load32_u offset=8
   call $~lib/metashrew-as/assembly/proto/metashrew/__proto.Encoder#varint64
  end
  local.get $0
  i32.load offset=12
  if
   local.get $1
   i64.const 32
   call $~lib/metashrew-as/assembly/proto/metashrew/__proto.Encoder#varint64
   local.get $1
   local.get $0
   i64.load32_u offset=12
   call $~lib/metashrew-as/assembly/proto/metashrew/__proto.Encoder#varint64
  end
  local.get $0
  i32.load offset=16
  if
   local.get $1
   i64.const 40
   call $~lib/metashrew-as/assembly/proto/metashrew/__proto.Encoder#varint64
   local.get $1
   local.get $0
   i64.load32_u offset=16
   call $~lib/metashrew-as/assembly/proto/metashrew/__proto.Encoder#varint64
  end
 )
 (func $~lib/metashrew-runes/assembly/proto/metashrew-runes/metashrew_runes.BalanceSheet#encodeU8Array (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  local.get $1
  i32.load
  drop
  loop $for-loop|0
   local.get $2
   local.get $0
   i32.load
   local.tee $3
   i32.load offset=12
   i32.lt_s
   if
    local.get $3
    local.get $2
    call $~lib/array/Array<~lib/array/Array<u8>>#__get
    call $~lib/metashrew-runes/assembly/proto/metashrew-runes/metashrew_runes.BalanceSheetItem#size
    local.tee $3
    if
     local.get $1
     i64.const 10
     call $~lib/metashrew-as/assembly/proto/metashrew/__proto.Encoder#varint64
     local.get $1
     local.get $3
     i64.extend_i32_u
     call $~lib/metashrew-as/assembly/proto/metashrew/__proto.Encoder#varint64
     local.get $0
     i32.load
     local.get $2
     call $~lib/array/Array<~lib/array/Array<u8>>#__get
     local.set $5
     i32.const 0
     local.set $3
     local.get $1
     i32.load
     drop
     local.get $5
     i32.load
     local.tee $6
     if
      local.get $6
      call $~lib/metashrew-runes/assembly/proto/metashrew-runes/metashrew_runes.Rune#size
      local.tee $4
      if
       local.get $1
       i64.const 10
       call $~lib/metashrew-as/assembly/proto/metashrew/__proto.Encoder#varint64
       local.get $1
       local.get $4
       i64.extend_i32_u
       call $~lib/metashrew-as/assembly/proto/metashrew/__proto.Encoder#varint64
       local.get $6
       local.get $1
       call $~lib/metashrew-runes/assembly/proto/metashrew-runes/metashrew_runes.Rune#encodeU8Array
      end
     end
     local.get $5
     i32.load offset=4
     i32.load offset=12
     i32.const 0
     i32.gt_s
     if
      local.get $1
      i64.const 18
      call $~lib/metashrew-as/assembly/proto/metashrew/__proto.Encoder#varint64
      local.get $1
      local.get $5
      i32.load offset=4
      i64.load32_s offset=12
      call $~lib/metashrew-as/assembly/proto/metashrew/__proto.Encoder#varint64
      local.get $5
      i32.load offset=4
      local.set $4
      loop $for-loop|02
       local.get $3
       local.get $4
       i32.load offset=12
       i32.lt_s
       if
        local.get $1
        i32.load
        local.get $4
        local.get $3
        call $~lib/array/Array<u8>#__get
        call $~lib/array/Array<u8>#push
        local.get $3
        i32.const 1
        i32.add
        local.set $3
        br $for-loop|02
       end
      end
     end
    end
    local.get $2
    i32.const 1
    i32.add
    local.set $2
    br $for-loop|0
   end
  end
 )
 (func $~lib/metashrew-runes/assembly/proto/metashrew-runes/metashrew_runes.Outpoint#size (param $0 i32) (result i32)
  (local $1 i64)
  (local $2 i32)
  local.get $0
  i32.load
  local.tee $2
  i32.load offset=12
  i32.const 0
  i32.gt_s
  if (result i32)
   local.get $2
   i32.load offset=12
   local.get $2
   i64.load32_s offset=12
   local.tee $1
   i64.const 128
   i64.lt_u
   if (result i32)
    i32.const 1
   else
    local.get $1
    i64.const 16384
    i64.lt_u
    if (result i32)
     i32.const 2
    else
     local.get $1
     i64.const 2097152
     i64.lt_u
     if (result i32)
      i32.const 3
     else
      local.get $1
      i64.const 268435456
      i64.lt_u
      if (result i32)
       i32.const 4
      else
       local.get $1
       i64.const 34359738368
       i64.lt_u
       if (result i32)
        i32.const 5
       else
        local.get $1
        i64.const 4398046511104
        i64.lt_u
        if (result i32)
         i32.const 6
        else
         local.get $1
         i64.const 562949953421312
         i64.lt_u
         if (result i32)
          i32.const 7
         else
          local.get $1
          i64.const 72057594037927936
          i64.lt_u
          if (result i32)
           i32.const 8
          else
           i32.const 9
           i32.const 10
           local.get $1
           i64.const -9223372036854775808
           i64.lt_u
           select
          end
         end
        end
       end
      end
     end
    end
   end
   i32.const 1
   i32.add
   i32.add
  else
   i32.const 0
  end
  local.set $2
  local.get $0
  i32.load offset=4
  if (result i32)
   local.get $0
   i64.load32_u offset=4
   local.tee $1
   i64.const 128
   i64.lt_u
   if (result i32)
    i32.const 1
   else
    local.get $1
    i64.const 16384
    i64.lt_u
    if (result i32)
     i32.const 2
    else
     local.get $1
     i64.const 2097152
     i64.lt_u
     if (result i32)
      i32.const 3
     else
      i32.const 4
      i32.const 5
      local.get $1
      i64.const 268435456
      i64.lt_u
      select
     end
    end
   end
   i32.const 1
   i32.add
  else
   i32.const 0
  end
  local.get $2
  i32.add
 )
 (func $~lib/metashrew-runes/assembly/proto/metashrew-runes/metashrew_runes.Output#size (param $0 i32) (result i32)
  (local $1 i64)
  (local $2 i32)
  local.get $0
  i32.load
  local.tee $2
  i32.load offset=12
  i32.const 0
  i32.gt_s
  if (result i32)
   local.get $2
   i32.load offset=12
   local.get $2
   i64.load32_s offset=12
   local.tee $1
   i64.const 128
   i64.lt_u
   if (result i32)
    i32.const 1
   else
    local.get $1
    i64.const 16384
    i64.lt_u
    if (result i32)
     i32.const 2
    else
     local.get $1
     i64.const 2097152
     i64.lt_u
     if (result i32)
      i32.const 3
     else
      local.get $1
      i64.const 268435456
      i64.lt_u
      if (result i32)
       i32.const 4
      else
       local.get $1
       i64.const 34359738368
       i64.lt_u
       if (result i32)
        i32.const 5
       else
        local.get $1
        i64.const 4398046511104
        i64.lt_u
        if (result i32)
         i32.const 6
        else
         local.get $1
         i64.const 562949953421312
         i64.lt_u
         if (result i32)
          i32.const 7
         else
          local.get $1
          i64.const 72057594037927936
          i64.lt_u
          if (result i32)
           i32.const 8
          else
           i32.const 9
           i32.const 10
           local.get $1
           i64.const -9223372036854775808
           i64.lt_u
           select
          end
         end
        end
       end
      end
     end
    end
   end
   i32.const 1
   i32.add
   i32.add
  else
   i32.const 0
  end
  local.set $2
  local.get $0
  i64.load offset=8
  i64.eqz
  if (result i32)
   i32.const 0
  else
   local.get $0
   i64.load offset=8
   local.tee $1
   i64.const 128
   i64.lt_u
   if (result i32)
    i32.const 1
   else
    local.get $1
    i64.const 16384
    i64.lt_u
    if (result i32)
     i32.const 2
    else
     local.get $1
     i64.const 2097152
     i64.lt_u
     if (result i32)
      i32.const 3
     else
      local.get $1
      i64.const 268435456
      i64.lt_u
      if (result i32)
       i32.const 4
      else
       local.get $1
       i64.const 34359738368
       i64.lt_u
       if (result i32)
        i32.const 5
       else
        local.get $1
        i64.const 4398046511104
        i64.lt_u
        if (result i32)
         i32.const 6
        else
         local.get $1
         i64.const 562949953421312
         i64.lt_u
         if (result i32)
          i32.const 7
         else
          local.get $1
          i64.const 72057594037927936
          i64.lt_u
          if (result i32)
           i32.const 8
          else
           i32.const 9
           i32.const 10
           local.get $1
           i64.const -9223372036854775808
           i64.lt_u
           select
          end
         end
        end
       end
      end
     end
    end
   end
   i32.const 1
   i32.add
  end
  local.get $2
  i32.add
 )
 (func $~lib/metashrew-runes/assembly/proto/metashrew-runes/metashrew_runes.OutpointResponse#encodeU8Array (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  local.get $1
  i32.load
  local.set $4
  local.get $0
  i32.load
  local.tee $5
  if
   local.get $5
   call $~lib/metashrew-runes/assembly/proto/metashrew-runes/metashrew_runes.BalanceSheet#size
   local.tee $6
   if
    local.get $1
    i64.const 10
    call $~lib/metashrew-as/assembly/proto/metashrew/__proto.Encoder#varint64
    local.get $1
    local.get $6
    i64.extend_i32_u
    call $~lib/metashrew-as/assembly/proto/metashrew/__proto.Encoder#varint64
    local.get $5
    local.get $1
    call $~lib/metashrew-runes/assembly/proto/metashrew-runes/metashrew_runes.BalanceSheet#encodeU8Array
   end
  end
  local.get $0
  i32.load offset=4
  local.tee $5
  if
   local.get $5
   call $~lib/metashrew-runes/assembly/proto/metashrew-runes/metashrew_runes.Outpoint#size
   local.tee $6
   if
    local.get $1
    i64.const 18
    call $~lib/metashrew-as/assembly/proto/metashrew/__proto.Encoder#varint64
    local.get $1
    local.get $6
    i64.extend_i32_u
    call $~lib/metashrew-as/assembly/proto/metashrew/__proto.Encoder#varint64
    local.get $1
    i32.load
    drop
    local.get $5
    i32.load
    i32.load offset=12
    i32.const 0
    i32.gt_s
    if
     local.get $1
     i64.const 10
     call $~lib/metashrew-as/assembly/proto/metashrew/__proto.Encoder#varint64
     local.get $1
     local.get $5
     i32.load
     i64.load32_s offset=12
     call $~lib/metashrew-as/assembly/proto/metashrew/__proto.Encoder#varint64
     local.get $5
     i32.load
     local.set $6
     loop $for-loop|0
      local.get $2
      local.get $6
      i32.load offset=12
      i32.lt_s
      if
       local.get $1
       i32.load
       local.get $6
       local.get $2
       call $~lib/array/Array<u8>#__get
       call $~lib/array/Array<u8>#push
       local.get $2
       i32.const 1
       i32.add
       local.set $2
       br $for-loop|0
      end
     end
    end
    local.get $5
    i32.load offset=4
    if
     local.get $1
     i64.const 16
     call $~lib/metashrew-as/assembly/proto/metashrew/__proto.Encoder#varint64
     local.get $1
     local.get $5
     i64.load32_u offset=4
     call $~lib/metashrew-as/assembly/proto/metashrew/__proto.Encoder#varint64
    end
   end
  end
  local.get $0
  i32.load offset=8
  local.tee $2
  if
   local.get $2
   call $~lib/metashrew-runes/assembly/proto/metashrew-runes/metashrew_runes.Output#size
   local.tee $5
   if
    local.get $1
    i64.const 26
    call $~lib/metashrew-as/assembly/proto/metashrew/__proto.Encoder#varint64
    local.get $1
    local.get $5
    i64.extend_i32_u
    call $~lib/metashrew-as/assembly/proto/metashrew/__proto.Encoder#varint64
    local.get $1
    i32.load
    drop
    local.get $2
    i32.load
    i32.load offset=12
    i32.const 0
    i32.gt_s
    if
     local.get $1
     i64.const 10
     call $~lib/metashrew-as/assembly/proto/metashrew/__proto.Encoder#varint64
     local.get $1
     local.get $2
     i32.load
     i64.load32_s offset=12
     call $~lib/metashrew-as/assembly/proto/metashrew/__proto.Encoder#varint64
     local.get $2
     i32.load
     local.set $5
     loop $for-loop|04
      local.get $3
      local.get $5
      i32.load offset=12
      i32.lt_s
      if
       local.get $1
       i32.load
       local.get $5
       local.get $3
       call $~lib/array/Array<u8>#__get
       call $~lib/array/Array<u8>#push
       local.get $3
       i32.const 1
       i32.add
       local.set $3
       br $for-loop|04
      end
     end
    end
    local.get $2
    i64.load offset=8
    i64.const 0
    i64.ne
    if
     local.get $1
     i64.const 16
     call $~lib/metashrew-as/assembly/proto/metashrew/__proto.Encoder#varint64
     local.get $1
     local.get $2
     i64.load offset=8
     call $~lib/metashrew-as/assembly/proto/metashrew/__proto.Encoder#varint64
    end
   end
  end
  local.get $0
  i32.load offset=12
  if
   local.get $1
   i64.const 32
   call $~lib/metashrew-as/assembly/proto/metashrew/__proto.Encoder#varint64
   local.get $1
   local.get $0
   i64.load32_u offset=12
   call $~lib/metashrew-as/assembly/proto/metashrew/__proto.Encoder#varint64
  end
  local.get $0
  i32.load offset=16
  if
   local.get $1
   i64.const 40
   call $~lib/metashrew-as/assembly/proto/metashrew/__proto.Encoder#varint64
   local.get $1
   local.get $0
   i64.load32_u offset=16
   call $~lib/metashrew-as/assembly/proto/metashrew/__proto.Encoder#varint64
  end
  local.get $4
 )
 (func $assembly/view/outpoint/outpoint (result i32)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  block $__inlined_func$~lib/metashrew-runes/assembly/proto/metashrew-runes/metashrew_runes.Outpoint.decodeDataView$3762 (result i32)
   call $~lib/metashrew-as/assembly/indexer/index/__host_len
   call $~lib/arraybuffer/ArrayBuffer#constructor
   local.tee $0
   call $~lib/metashrew-as/assembly/indexer/index/__load_input
   local.get $0
   i32.const 4
   i32.const 1073741820
   call $~lib/arraybuffer/ArrayBuffer#slice
   local.set $0
   i32.const 1
   global.set $~argumentsLength
   local.get $0
   call $~lib/dataview/DataView#constructor@varargs
   call $~lib/metashrew-runes/assembly/proto/metashrew-runes/__proto.SafeDecoder#constructor
   local.set $1
   call $~lib/metashrew-runes/assembly/proto/metashrew-runes/metashrew_runes.Outpoint#constructor
   local.set $2
   loop $while-continue|0
    block $__inlined_func$~lib/metashrew-runes/assembly/proto/metashrew-runes/__proto.SafeDecoder#invalid$3294 (result i32)
     i32.const 1
     local.get $1
     i32.load8_u offset=8
     br_if $__inlined_func$~lib/metashrew-runes/assembly/proto/metashrew-runes/__proto.SafeDecoder#invalid$3294
     drop
     local.get $1
     i32.load offset=4
     i32.const 4096
     i32.gt_s
     if
      local.get $1
      i32.const 1
      i32.store8 offset=8
      i32.const 1
      br $__inlined_func$~lib/metashrew-runes/assembly/proto/metashrew-runes/__proto.SafeDecoder#invalid$3294
     end
     i32.const 0
    end
    if (result i32)
     i32.const 1
    else
     local.get $1
     i32.load offset=4
     local.get $1
     i32.load
     i32.load offset=8
     i32.ge_s
    end
    i32.eqz
    if
     block $case2|1
      block $case1|1
       local.get $1
       call $~lib/metashrew-runes/assembly/proto/metashrew-runes/__proto.Decoder#varint@override
       i32.wrap_i64
       local.tee $0
       i32.const 3
       i32.shr_u
       local.tee $3
       i32.const 1
       i32.ne
       if
        local.get $3
        i32.const 2
        i32.eq
        br_if $case1|1
        br $case2|1
       end
       local.get $2
       local.get $1
       call $~lib/metashrew-runes/assembly/proto/metashrew-runes/__proto.SafeDecoder#bytes
       i32.store
       br $while-continue|0
      end
      local.get $2
      local.get $1
      call $~lib/metashrew-runes/assembly/proto/metashrew-runes/__proto.Decoder#varint@override
      i64.store32 offset=4
      br $while-continue|0
     end
     local.get $1
     local.get $0
     i32.const 7
     i32.and
     call $~lib/metashrew-runes/assembly/proto/metashrew-runes/__proto.SafeDecoder#skipType
     br $while-continue|0
    end
   end
   i32.const 0
   block $__inlined_func$~lib/metashrew-runes/assembly/proto/metashrew-runes/__proto.SafeDecoder#invalid$3306 (result i32)
    i32.const 1
    local.get $1
    i32.load8_u offset=8
    br_if $__inlined_func$~lib/metashrew-runes/assembly/proto/metashrew-runes/__proto.SafeDecoder#invalid$3306
    drop
    local.get $1
    i32.load offset=4
    i32.const 4096
    i32.gt_s
    if
     local.get $1
     i32.const 1
     i32.store8 offset=8
     i32.const 1
     br $__inlined_func$~lib/metashrew-runes/assembly/proto/metashrew-runes/__proto.SafeDecoder#invalid$3306
    end
    i32.const 0
   end
   br_if $__inlined_func$~lib/metashrew-runes/assembly/proto/metashrew-runes/metashrew_runes.Outpoint.decodeDataView$3762
   drop
   local.get $2
  end
  call $assembly/view/outpoint/outpointBase
  local.set $0
  i32.const 0
  global.set $~argumentsLength
  i32.const 0
  call $~lib/array/Array<u8>#constructor
  local.set $1
  i32.const 4
  i32.const 95
  call $~lib/rt/stub/__new
  local.tee $2
  i32.const 0
  i32.store
  local.get $2
  local.get $1
  i32.store
  local.get $0
  local.get $2
  call $~lib/metashrew-runes/assembly/proto/metashrew-runes/metashrew_runes.OutpointResponse#encodeU8Array
  local.tee $0
  i32.load offset=12
  local.tee $1
  i32.const 4
  call $~lib/rt/stub/__new
  local.tee $2
  local.get $0
  i32.load offset=4
  local.get $1
  memory.copy
  local.get $2
 )
 (func $assembly/view/runes/runes~anonymous|0 (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  local.get $0
  call $~lib/metashrew-runes/assembly/utils/fromArrayBuffer
  local.set $2
  call $~lib/metashrew-runes/assembly/proto/metashrew-runes/metashrew_runes.Rune#constructor
  local.set $1
  call $~lib/metashrew-runes/assembly/proto/metashrew-runes/metashrew_runes.RuneId#constructor
  local.tee $4
  global.get $~lib/metashrew-runes/assembly/indexer/constants/index/ETCHING_TO_RUNE_ID
  local.get $0
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#get
  call $~lib/metashrew-runes/assembly/indexer/RuneId/RuneId.fromBytes
  local.tee $5
  i32.load
  i64.load
  i64.store32
  local.get $4
  local.get $5
  i32.load offset=4
  i64.load
  i64.store32 offset=4
  local.get $1
  local.get $4
  i32.store
  local.get $2
  call $~lib/metashrew-runes/assembly/utils/fieldToName
  local.set $2
  i32.const 1
  global.set $~argumentsLength
  local.get $2
  i32.const 0
  call $~lib/string/String.UTF8.encode@varargs
  local.set $2
  i32.const 1
  global.set $~argumentsLength
  local.get $2
  call $~lib/typedarray/Uint8Array.wrap@varargs
  local.set $4
  i32.const 0
  call $~lib/array/Array<u8>#constructor
  local.set $2
  local.get $4
  i32.load offset=4
  local.set $5
  local.get $4
  i32.load offset=8
  local.set $6
  loop $for-loop|0
   local.get $3
   local.get $6
   i32.lt_s
   if
    local.get $3
    local.get $5
    i32.add
    i32.load8_u
    local.set $7
    i32.const 4
    global.set $~argumentsLength
    local.get $2
    local.get $7
    local.get $3
    local.get $4
    i32.const 9872
    i32.load
    call_indirect (type $3)
    local.set $2
    local.get $3
    i32.const 1
    i32.add
    local.set $3
    br $for-loop|0
   end
  end
  local.get $1
  local.get $2
  i32.store offset=4
  local.get $1
  global.get $~lib/metashrew-runes/assembly/indexer/constants/index/DIVISIBILITY
  local.get $0
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#getValue<u8>
  i32.store offset=8
  local.get $1
  global.get $~lib/metashrew-runes/assembly/indexer/constants/index/SYMBOL
  local.get $0
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#getValue<u8>
  i32.store offset=16
  local.get $1
  global.get $~lib/metashrew-runes/assembly/indexer/constants/index/SPACERS
  local.get $0
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#getValue<u32>
  i32.store offset=12
  local.get $1
 )
 (func $assembly/view/runes/runes (result i32)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  block $__inlined_func$~lib/metashrew-runes/assembly/proto/metashrew-runes/metashrew_runes.PaginationInput.decodeDataView$3764 (result i32)
   call $~lib/metashrew-as/assembly/indexer/index/__host_len
   call $~lib/arraybuffer/ArrayBuffer#constructor
   local.tee $0
   call $~lib/metashrew-as/assembly/indexer/index/__load_input
   local.get $0
   i32.const 4
   i32.const 1073741820
   call $~lib/arraybuffer/ArrayBuffer#slice
   local.set $0
   i32.const 1
   global.set $~argumentsLength
   local.get $0
   call $~lib/dataview/DataView#constructor@varargs
   call $~lib/metashrew-runes/assembly/proto/metashrew-runes/__proto.SafeDecoder#constructor
   local.set $1
   i32.const 8
   i32.const 96
   call $~lib/rt/stub/__new
   local.tee $0
   i32.eqz
   if
    i32.const 0
    i32.const 0
    call $~lib/rt/stub/__new
    local.set $0
   end
   local.get $0
   i32.const 0
   i32.store
   local.get $0
   i32.const 0
   i32.store offset=4
   loop $while-continue|0
    block $__inlined_func$~lib/metashrew-runes/assembly/proto/metashrew-runes/__proto.SafeDecoder#invalid$3294 (result i32)
     i32.const 1
     local.get $1
     i32.load8_u offset=8
     br_if $__inlined_func$~lib/metashrew-runes/assembly/proto/metashrew-runes/__proto.SafeDecoder#invalid$3294
     drop
     local.get $1
     i32.load offset=4
     i32.const 4096
     i32.gt_s
     if
      local.get $1
      i32.const 1
      i32.store8 offset=8
      i32.const 1
      br $__inlined_func$~lib/metashrew-runes/assembly/proto/metashrew-runes/__proto.SafeDecoder#invalid$3294
     end
     i32.const 0
    end
    if (result i32)
     i32.const 1
    else
     local.get $1
     i32.load offset=4
     local.get $1
     i32.load
     i32.load offset=8
     i32.ge_s
    end
    i32.eqz
    if
     block $case2|1
      block $case1|1
       local.get $1
       call $~lib/metashrew-runes/assembly/proto/metashrew-runes/__proto.Decoder#varint@override
       i32.wrap_i64
       local.tee $2
       i32.const 3
       i32.shr_u
       local.tee $3
       i32.const 1
       i32.ne
       if
        local.get $3
        i32.const 2
        i32.eq
        br_if $case1|1
        br $case2|1
       end
       local.get $0
       local.get $1
       call $~lib/metashrew-runes/assembly/proto/metashrew-runes/__proto.Decoder#varint@override
       i64.store32
       br $while-continue|0
      end
      local.get $0
      local.get $1
      call $~lib/metashrew-runes/assembly/proto/metashrew-runes/__proto.Decoder#varint@override
      i64.store32 offset=4
      br $while-continue|0
     end
     local.get $1
     local.get $2
     i32.const 7
     i32.and
     call $~lib/metashrew-runes/assembly/proto/metashrew-runes/__proto.SafeDecoder#skipType
     br $while-continue|0
    end
   end
   i32.const 0
   block $__inlined_func$~lib/metashrew-runes/assembly/proto/metashrew-runes/__proto.SafeDecoder#invalid$3338 (result i32)
    i32.const 1
    local.get $1
    i32.load8_u offset=8
    br_if $__inlined_func$~lib/metashrew-runes/assembly/proto/metashrew-runes/__proto.SafeDecoder#invalid$3338
    drop
    local.get $1
    i32.load offset=4
    i32.const 4096
    i32.gt_s
    if
     local.get $1
     i32.const 1
     i32.store8 offset=8
     i32.const 1
     br $__inlined_func$~lib/metashrew-runes/assembly/proto/metashrew-runes/__proto.SafeDecoder#invalid$3338
    end
    i32.const 0
   end
   br_if $__inlined_func$~lib/metashrew-runes/assembly/proto/metashrew-runes/metashrew_runes.PaginationInput.decodeDataView$3764
   drop
   local.get $0
  end
  local.tee $2
  i32.load
  local.set $0
  local.get $2
  i32.load offset=4
  local.set $3
  i32.const 0
  call $~lib/array/Array<~lib/arraybuffer/ArrayBuffer>#constructor
  local.set $1
  local.get $2
  i32.load offset=4
  if
   loop $for-loop|00
    local.get $0
    local.get $3
    i32.lt_u
    if
     local.get $1
     global.get $~lib/metashrew-runes/assembly/indexer/constants/index/ETCHINGS
     local.get $0
     call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#selectIndex
     call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#get
     call $~lib/array/Array<~lib/array/Array<u8>>#push
     drop
     local.get $0
     i32.const 1
     i32.add
     local.set $0
     br $for-loop|00
    end
   end
  else
   i32.const 1
   global.set $~argumentsLength
   global.get $~lib/metashrew-runes/assembly/indexer/constants/index/ETCHINGS
   local.tee $2
   i32.const 6304
   i32.const 0
   call $~lib/string/String.UTF8.encode@varargs
   call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
   call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#getValue<u32>
   call $~lib/array/Array<~lib/arraybuffer/ArrayBuffer>#constructor
   local.set $1
   i32.const 0
   local.set $0
   loop $for-loop|0
    local.get $0
    local.get $1
    i32.load offset=12
    i32.lt_s
    if
     local.get $1
     local.get $0
     local.get $2
     local.get $0
     call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#selectIndex
     call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#get
     call $~lib/array/Array<~lib/string/String>#__set
     local.get $0
     i32.const 1
     i32.add
     local.set $0
     br $for-loop|0
    end
   end
  end
  local.get $1
  i32.load offset=12
  local.tee $4
  i32.const 2
  i32.const 83
  i32.const 0
  call $~lib/rt/__newArray
  local.tee $5
  i32.load offset=4
  local.set $2
  i32.const 0
  local.set $0
  loop $for-loop|001
   local.get $0
   local.get $4
   local.get $1
   i32.load offset=12
   local.tee $3
   local.get $3
   local.get $4
   i32.gt_s
   select
   i32.lt_s
   if
    local.get $0
    i32.const 2
    i32.shl
    local.tee $3
    local.get $1
    i32.load offset=4
    i32.add
    i32.load
    local.set $6
    i32.const 3
    global.set $~argumentsLength
    local.get $2
    local.get $3
    i32.add
    local.get $6
    local.get $0
    local.get $1
    i32.const 9904
    i32.load
    call_indirect (type $2)
    i32.store
    local.get $0
    i32.const 1
    i32.add
    local.set $0
    br $for-loop|001
   end
  end
  i32.const 4
  i32.const 98
  call $~lib/rt/stub/__new
  local.tee $0
  i32.eqz
  if
   i32.const 0
   i32.const 0
   call $~lib/rt/stub/__new
   local.set $0
  end
  local.get $0
  call $~lib/array/Array<~lib/metashrew-runes/assembly/proto/metashrew-runes/metashrew_runes.Rune>#constructor
  i32.store
  local.get $0
  local.get $5
  i32.store
  i32.const 0
  global.set $~argumentsLength
  i32.const 0
  call $~lib/array/Array<u8>#constructor
  local.set $1
  i32.const 4
  i32.const 95
  call $~lib/rt/stub/__new
  local.tee $2
  i32.const 0
  i32.store
  local.get $2
  local.get $1
  i32.store
  local.get $2
  i32.load
  local.set $3
  i32.const 0
  local.set $1
  loop $for-loop|01
   local.get $1
   local.get $0
   i32.load
   local.tee $4
   i32.load offset=12
   i32.lt_s
   if
    local.get $4
    local.get $1
    call $~lib/array/Array<~lib/array/Array<u8>>#__get
    call $~lib/metashrew-runes/assembly/proto/metashrew-runes/metashrew_runes.Rune#size
    local.tee $4
    if
     local.get $2
     i64.const 10
     call $~lib/metashrew-as/assembly/proto/metashrew/__proto.Encoder#varint64
     local.get $2
     local.get $4
     i64.extend_i32_u
     call $~lib/metashrew-as/assembly/proto/metashrew/__proto.Encoder#varint64
     local.get $0
     i32.load
     local.get $1
     call $~lib/array/Array<~lib/array/Array<u8>>#__get
     local.get $2
     call $~lib/metashrew-runes/assembly/proto/metashrew-runes/metashrew_runes.Rune#encodeU8Array
    end
    local.get $1
    i32.const 1
    i32.add
    local.set $1
    br $for-loop|01
   end
  end
  local.get $3
  i32.load offset=12
  local.tee $0
  i32.const 4
  call $~lib/rt/stub/__new
  local.tee $1
  local.get $3
  i32.load offset=4
  local.get $0
  memory.copy
  local.get $1
 )
 (func $~lib/metashrew-spendables/assembly/indexer/SpendablesIndex#findOutpointsForAddress (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  global.get $~lib/metashrew-spendables/assembly/tables/OUTPOINTS_FOR_ADDRESS
  local.get $0
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
  local.set $6
  i32.const 0
  call $~lib/array/Array<~lib/arraybuffer/ArrayBuffer>#constructor
  local.set $7
  loop $for-loop|0
   i32.const 1
   global.set $~argumentsLength
   local.get $6
   i32.const 6304
   i32.const 0
   call $~lib/string/String.UTF8.encode@varargs
   call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
   call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#getValue<u32>
   local.get $5
   i32.gt_u
   if
    local.get $6
    local.get $5
    call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#selectIndex
    call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#get
    local.set $8
    global.get $~lib/metashrew-spendables/assembly/tables/OUTPOINT_SPENDABLE_BY
    local.get $8
    call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
    call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#get
    local.set $4
    local.get $0
    i32.const 20
    i32.sub
    i32.load offset=16
    local.set $2
    i32.const 0
    local.set $3
    block $~lib/util/memory/memcmp|inlined.1
     local.get $0
     local.tee $1
     local.get $4
     i32.eq
     br_if $~lib/util/memory/memcmp|inlined.1
     local.get $1
     i32.const 7
     i32.and
     local.get $4
     i32.const 7
     i32.and
     i32.eq
     if
      loop $while-continue|1
       local.get $1
       i32.const 7
       i32.and
       if
        i32.const 0
        local.set $3
        local.get $2
        i32.eqz
        br_if $~lib/util/memory/memcmp|inlined.1
        local.get $1
        i32.load8_u
        local.tee $9
        local.get $4
        i32.load8_u
        local.tee $10
        i32.sub
        local.set $3
        local.get $9
        local.get $10
        i32.ne
        br_if $~lib/util/memory/memcmp|inlined.1
        local.get $2
        i32.const 1
        i32.sub
        local.set $2
        local.get $1
        i32.const 1
        i32.add
        local.set $1
        local.get $4
        i32.const 1
        i32.add
        local.set $4
        br $while-continue|1
       end
      end
      loop $while-continue|2
       local.get $2
       i32.const 8
       i32.ge_u
       if
        local.get $1
        i64.load
        local.get $4
        i64.load
        i64.eq
        if
         local.get $1
         i32.const 8
         i32.add
         local.set $1
         local.get $4
         i32.const 8
         i32.add
         local.set $4
         local.get $2
         i32.const 8
         i32.sub
         local.set $2
         br $while-continue|2
        end
       end
      end
     end
     loop $while-continue|3
      local.get $2
      local.tee $3
      i32.const 1
      i32.sub
      local.set $2
      local.get $3
      if
       local.get $1
       i32.load8_u
       local.tee $9
       local.get $4
       i32.load8_u
       local.tee $10
       i32.sub
       local.set $3
       local.get $9
       local.get $10
       i32.ne
       br_if $~lib/util/memory/memcmp|inlined.1
       local.get $1
       i32.const 1
       i32.add
       local.set $1
       local.get $4
       i32.const 1
       i32.add
       local.set $4
       br $while-continue|3
      end
     end
     i32.const 0
     local.set $3
    end
    local.get $3
    i32.eqz
    if
     local.get $7
     local.get $8
     call $~lib/array/Array<~lib/array/Array<u8>>#push
     drop
    end
    local.get $5
    i32.const 1
    i32.add
    local.set $5
    br $for-loop|0
   end
  end
  local.get $7
 )
 (func $assembly/view/wallet/wallet_test (result i32)
  (local $0 i32)
  i32.const 1
  global.set $~argumentsLength
  i32.const 9936
  i32.const 0
  call $~lib/string/String.UTF8.encode@varargs
  local.set $0
  i32.const 0
  i32.const 39
  call $~lib/rt/stub/__new
  i32.eqz
  if
   i32.const 0
   i32.const 0
   call $~lib/rt/stub/__new
   drop
  end
  local.get $0
  call $~lib/metashrew-spendables/assembly/indexer/SpendablesIndex#findOutpointsForAddress
  drop
  i32.const 0
  call $~lib/arraybuffer/ArrayBuffer#constructor
 )
 (func $~lib/array/Array<~lib/metashrew-runes/assembly/proto/metashrew-runes/metashrew_runes.OutpointResponse>#constructor (result i32)
  (local $0 i32)
  (local $1 i32)
  i32.const 16
  i32.const 100
  call $~lib/rt/stub/__new
  local.tee $0
  i32.const 0
  i32.store
  local.get $0
  i32.const 0
  i32.store offset=4
  local.get $0
  i32.const 0
  i32.store offset=8
  local.get $0
  i32.const 0
  i32.store offset=12
  i32.const 32
  i32.const 1
  call $~lib/rt/stub/__new
  local.tee $1
  i32.const 0
  i32.const 32
  memory.fill
  local.get $0
  local.get $1
  i32.store
  local.get $0
  local.get $1
  i32.store offset=4
  local.get $0
  i32.const 32
  i32.store offset=8
  local.get $0
  i32.const 0
  i32.store offset=12
  local.get $0
 )
 (func $~lib/array/Array<assembly/indexer/ProtoruneBalanceSheet/ProtoruneBalanceSheet>#constructor (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  i32.const 16
  i32.const 101
  call $~lib/rt/stub/__new
  local.tee $1
  i32.const 0
  i32.store
  local.get $1
  i32.const 0
  i32.store offset=4
  local.get $1
  i32.const 0
  i32.store offset=8
  local.get $1
  i32.const 0
  i32.store offset=12
  local.get $0
  i32.const 268435455
  i32.gt_u
  if
   i32.const 2608
   i32.const 5344
   i32.const 70
   i32.const 60
   call $~lib/builtins/abort
   unreachable
  end
  i32.const 8
  local.get $0
  local.get $0
  i32.const 8
  i32.le_u
  select
  i32.const 2
  i32.shl
  local.tee $2
  i32.const 1
  call $~lib/rt/stub/__new
  local.tee $3
  i32.const 0
  local.get $2
  memory.fill
  local.get $1
  local.get $3
  i32.store
  local.get $1
  local.get $3
  i32.store offset=4
  local.get $1
  local.get $2
  i32.store offset=8
  local.get $1
  local.get $0
  i32.store offset=12
  local.get $1
 )
 (func $~lib/metashrew-runes/assembly/proto/metashrew-runes/metashrew_runes.WalletResponse#constructor (result i32)
  (local $0 i32)
  i32.const 8
  i32.const 102
  call $~lib/rt/stub/__new
  local.tee $0
  i32.eqz
  if
   i32.const 0
   i32.const 0
   call $~lib/rt/stub/__new
   local.set $0
  end
  local.get $0
  call $~lib/array/Array<~lib/metashrew-runes/assembly/proto/metashrew-runes/metashrew_runes.OutpointResponse>#constructor
  i32.store
  local.get $0
  call $~lib/metashrew-runes/assembly/proto/metashrew-runes/metashrew_runes.BalanceSheet#constructor
  i32.store offset=4
  local.get $0
 )
 (func $~lib/metashrew-runes/assembly/proto/metashrew-runes/metashrew_runes.WalletResponse#encode (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i64)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  i32.const 0
  global.set $~argumentsLength
  i32.const 0
  call $~lib/array/Array<u8>#constructor
  local.set $1
  i32.const 4
  i32.const 95
  call $~lib/rt/stub/__new
  local.tee $3
  i32.const 0
  i32.store
  local.get $3
  local.get $1
  i32.store
  local.get $3
  i32.load
  local.set $5
  loop $for-loop|0
   local.get $4
   local.get $0
   i32.load
   local.tee $1
   i32.load offset=12
   i32.lt_s
   if
    local.get $1
    local.get $4
    call $~lib/array/Array<~lib/array/Array<u8>>#__get
    local.tee $6
    i32.load
    local.tee $1
    if (result i32)
     local.get $1
     call $~lib/metashrew-runes/assembly/proto/metashrew-runes/metashrew_runes.BalanceSheet#size
     local.tee $1
     if (result i32)
      local.get $1
      local.get $1
      i64.extend_i32_u
      local.tee $2
      i64.const 128
      i64.lt_u
      if (result i32)
       i32.const 1
      else
       local.get $2
       i64.const 16384
       i64.lt_u
       if (result i32)
        i32.const 2
       else
        local.get $2
        i64.const 2097152
        i64.lt_u
        if (result i32)
         i32.const 3
        else
         i32.const 4
         i32.const 5
         local.get $2
         i64.const 268435456
         i64.lt_u
         select
        end
       end
      end
      i32.const 1
      i32.add
      i32.add
     else
      i32.const 0
     end
    else
     i32.const 0
    end
    local.set $1
    local.get $6
    i32.load offset=4
    local.tee $7
    if
     local.get $7
     call $~lib/metashrew-runes/assembly/proto/metashrew-runes/metashrew_runes.Outpoint#size
     local.tee $7
     if
      local.get $1
      local.get $7
      i64.extend_i32_u
      local.tee $2
      i64.const 128
      i64.lt_u
      if (result i32)
       i32.const 1
      else
       local.get $2
       i64.const 16384
       i64.lt_u
       if (result i32)
        i32.const 2
       else
        local.get $2
        i64.const 2097152
        i64.lt_u
        if (result i32)
         i32.const 3
        else
         i32.const 4
         i32.const 5
         local.get $2
         i64.const 268435456
         i64.lt_u
         select
        end
       end
      end
      i32.const 1
      i32.add
      local.get $7
      i32.add
      i32.add
      local.set $1
     end
    end
    local.get $6
    i32.load offset=8
    local.tee $7
    if
     local.get $7
     call $~lib/metashrew-runes/assembly/proto/metashrew-runes/metashrew_runes.Output#size
     local.tee $7
     if
      local.get $1
      local.get $7
      i64.extend_i32_u
      local.tee $2
      i64.const 128
      i64.lt_u
      if (result i32)
       i32.const 1
      else
       local.get $2
       i64.const 16384
       i64.lt_u
       if (result i32)
        i32.const 2
       else
        local.get $2
        i64.const 2097152
        i64.lt_u
        if (result i32)
         i32.const 3
        else
         i32.const 4
         i32.const 5
         local.get $2
         i64.const 268435456
         i64.lt_u
         select
        end
       end
      end
      i32.const 1
      i32.add
      local.get $7
      i32.add
      i32.add
      local.set $1
     end
    end
    local.get $6
    i32.load offset=12
    if (result i32)
     local.get $6
     i64.load32_u offset=12
     local.tee $2
     i64.const 128
     i64.lt_u
     if (result i32)
      i32.const 1
     else
      local.get $2
      i64.const 16384
      i64.lt_u
      if (result i32)
       i32.const 2
      else
       local.get $2
       i64.const 2097152
       i64.lt_u
       if (result i32)
        i32.const 3
       else
        i32.const 4
        i32.const 5
        local.get $2
        i64.const 268435456
        i64.lt_u
        select
       end
      end
     end
     i32.const 1
     i32.add
    else
     i32.const 0
    end
    local.get $1
    i32.add
    local.get $6
    i32.load offset=16
    if (result i32)
     local.get $6
     i64.load32_u offset=16
     local.tee $2
     i64.const 128
     i64.lt_u
     if (result i32)
      i32.const 1
     else
      local.get $2
      i64.const 16384
      i64.lt_u
      if (result i32)
       i32.const 2
      else
       local.get $2
       i64.const 2097152
       i64.lt_u
       if (result i32)
        i32.const 3
       else
        i32.const 4
        i32.const 5
        local.get $2
        i64.const 268435456
        i64.lt_u
        select
       end
      end
     end
     i32.const 1
     i32.add
    else
     i32.const 0
    end
    i32.add
    local.tee $1
    if
     local.get $3
     i64.const 10
     call $~lib/metashrew-as/assembly/proto/metashrew/__proto.Encoder#varint64
     local.get $3
     local.get $1
     i64.extend_i32_u
     call $~lib/metashrew-as/assembly/proto/metashrew/__proto.Encoder#varint64
     local.get $0
     i32.load
     local.get $4
     call $~lib/array/Array<~lib/array/Array<u8>>#__get
     local.get $3
     call $~lib/metashrew-runes/assembly/proto/metashrew-runes/metashrew_runes.OutpointResponse#encodeU8Array
     drop
    end
    local.get $4
    i32.const 1
    i32.add
    local.set $4
    br $for-loop|0
   end
  end
  local.get $0
  i32.load offset=4
  local.tee $0
  if
   local.get $0
   call $~lib/metashrew-runes/assembly/proto/metashrew-runes/metashrew_runes.BalanceSheet#size
   local.tee $1
   if
    local.get $3
    i64.const 18
    call $~lib/metashrew-as/assembly/proto/metashrew/__proto.Encoder#varint64
    local.get $3
    local.get $1
    i64.extend_i32_u
    call $~lib/metashrew-as/assembly/proto/metashrew/__proto.Encoder#varint64
    local.get $0
    local.get $3
    call $~lib/metashrew-runes/assembly/proto/metashrew-runes/metashrew_runes.BalanceSheet#encodeU8Array
   end
  end
  local.get $5
  i32.load offset=12
  local.tee $0
  i32.const 4
  call $~lib/rt/stub/__new
  local.tee $1
  local.get $5
  i32.load offset=4
  local.get $0
  memory.copy
  local.get $1
 )
 (func $assembly/view/wallet/runesbyaddress (result i32)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  call $~lib/metashrew-as/assembly/indexer/index/__host_len
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.tee $0
  call $~lib/metashrew-as/assembly/indexer/index/__load_input
  local.get $0
  i32.const 4
  i32.const 1073741820
  call $~lib/arraybuffer/ArrayBuffer#slice
  local.set $0
  block $__inlined_func$~lib/metashrew-runes/assembly/proto/metashrew-runes/metashrew_runes.WalletRequest.decodeDataView$1628 (result i32)
   i32.const 1
   global.set $~argumentsLength
   local.get $0
   call $~lib/dataview/DataView#constructor@varargs
   call $~lib/metashrew-runes/assembly/proto/metashrew-runes/__proto.SafeDecoder#constructor
   local.set $3
   i32.const 4
   i32.const 99
   call $~lib/rt/stub/__new
   local.tee $0
   i32.eqz
   if
    i32.const 0
    i32.const 0
    call $~lib/rt/stub/__new
    local.set $0
   end
   local.get $0
   i32.const 0
   call $~lib/array/Array<u8>#constructor
   i32.store
   loop $while-continue|0
    block $__inlined_func$~lib/metashrew-runes/assembly/proto/metashrew-runes/__proto.SafeDecoder#invalid$3294 (result i32)
     i32.const 1
     local.get $3
     i32.load8_u offset=8
     br_if $__inlined_func$~lib/metashrew-runes/assembly/proto/metashrew-runes/__proto.SafeDecoder#invalid$3294
     drop
     local.get $3
     i32.load offset=4
     i32.const 4096
     i32.gt_s
     if
      local.get $3
      i32.const 1
      i32.store8 offset=8
      i32.const 1
      br $__inlined_func$~lib/metashrew-runes/assembly/proto/metashrew-runes/__proto.SafeDecoder#invalid$3294
     end
     i32.const 0
    end
    if (result i32)
     i32.const 1
    else
     local.get $3
     i32.load offset=4
     local.get $3
     i32.load
     i32.load offset=8
     i32.ge_s
    end
    i32.eqz
    if
     local.get $3
     call $~lib/metashrew-runes/assembly/proto/metashrew-runes/__proto.Decoder#varint@override
     i32.wrap_i64
     local.tee $4
     i32.const 3
     i32.shr_u
     i32.const 1
     i32.eq
     if
      local.get $0
      local.get $3
      call $~lib/metashrew-runes/assembly/proto/metashrew-runes/__proto.SafeDecoder#bytes
      i32.store
      br $while-continue|0
     end
     local.get $3
     local.get $4
     i32.const 7
     i32.and
     call $~lib/metashrew-runes/assembly/proto/metashrew-runes/__proto.SafeDecoder#skipType
     br $while-continue|0
    end
   end
   i32.const 0
   block $__inlined_func$~lib/metashrew-runes/assembly/proto/metashrew-runes/__proto.SafeDecoder#invalid$3350 (result i32)
    i32.const 1
    local.get $3
    i32.load8_u offset=8
    br_if $__inlined_func$~lib/metashrew-runes/assembly/proto/metashrew-runes/__proto.SafeDecoder#invalid$3350
    drop
    local.get $3
    i32.load offset=4
    i32.const 4096
    i32.gt_s
    if
     local.get $3
     i32.const 1
     i32.store8 offset=8
     i32.const 1
     br $__inlined_func$~lib/metashrew-runes/assembly/proto/metashrew-runes/__proto.SafeDecoder#invalid$3350
    end
    i32.const 0
   end
   br_if $__inlined_func$~lib/metashrew-runes/assembly/proto/metashrew-runes/metashrew_runes.WalletRequest.decodeDataView$1628
   drop
   local.get $0
  end
  i32.load
  i32.load
  local.set $0
  i32.const 0
  i32.const 39
  call $~lib/rt/stub/__new
  i32.eqz
  if
   i32.const 0
   i32.const 0
   call $~lib/rt/stub/__new
   drop
  end
  local.get $0
  call $~lib/metashrew-spendables/assembly/indexer/SpendablesIndex#findOutpointsForAddress
  local.set $0
  call $~lib/array/Array<~lib/metashrew-runes/assembly/proto/metashrew-runes/metashrew_runes.OutpointResponse>#constructor
  local.set $6
  i32.const 0
  call $~lib/array/Array<assembly/indexer/ProtoruneBalanceSheet/ProtoruneBalanceSheet>#constructor
  local.set $3
  loop $for-loop|0
   local.get $1
   local.get $0
   i32.load offset=12
   i32.lt_s
   if
    call $~lib/metashrew-runes/assembly/proto/metashrew-runes/metashrew_runes.Outpoint#constructor
    local.set $4
    local.get $0
    local.get $1
    call $~lib/array/Array<~lib/array/Array<u8>>#__get
    i32.const 0
    i32.const 32
    call $~lib/arraybuffer/ArrayBuffer#slice
    local.set $5
    i32.const 1
    global.set $~argumentsLength
    local.get $4
    local.get $5
    call $~lib/typedarray/Uint8Array.wrap@varargs
    i32.store
    local.get $0
    local.get $1
    call $~lib/array/Array<~lib/array/Array<u8>>#__get
    i32.const 32
    i32.const 1073741820
    call $~lib/arraybuffer/ArrayBuffer#slice
    local.tee $5
    local.get $5
    i32.const 20
    i32.sub
    i32.load offset=16
    call $~lib/metashrew-as/assembly/utils/box/Box#constructor
    local.tee $5
    i32.load
    local.tee $7
    i32.load
    local.set $8
    local.get $5
    local.get $7
    i32.const 4
    i32.add
    i32.store
    local.get $5
    local.get $5
    i32.load offset=4
    i32.const 4
    i32.sub
    i32.store offset=4
    local.get $4
    local.get $8
    i32.store offset=4
    local.get $4
    call $assembly/view/outpoint/outpointBase
    local.tee $4
    i32.load
    i32.load
    i32.load offset=12
    if
     local.get $3
     global.get $~lib/metashrew-runes/assembly/indexer/constants/index/OUTPOINT_TO_RUNES
     local.get $0
     local.get $1
     call $~lib/array/Array<~lib/array/Array<u8>>#__get
     call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
     call $~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet.load
     call $~lib/array/Array<~lib/array/Array<u8>>#push
     drop
     local.get $6
     local.get $4
     call $~lib/array/Array<~lib/array/Array<u8>>#push
     drop
    end
    local.get $1
    i32.const 1
    i32.add
    local.set $1
    br $for-loop|0
   end
  end
  call $~lib/metashrew-runes/assembly/proto/metashrew-runes/metashrew_runes.WalletResponse#constructor
  local.tee $1
  local.get $6
  i32.store
  i32.const 12
  i32.const 57
  call $~lib/rt/stub/__new
  call $~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet#constructor
  local.set $0
  local.get $3
  i32.load offset=12
  local.set $4
  loop $for-loop|00
   local.get $2
   local.get $4
   local.get $3
   i32.load offset=12
   local.tee $5
   local.get $4
   local.get $5
   i32.lt_s
   select
   i32.lt_s
   if
    local.get $3
    i32.load offset=4
    local.get $2
    i32.const 2
    i32.shl
    i32.add
    i32.load
    local.set $5
    i32.const 4
    global.set $~argumentsLength
    local.get $0
    local.get $5
    local.get $2
    local.get $3
    i32.const 10256
    i32.load
    call_indirect (type $3)
    local.set $0
    local.get $2
    i32.const 1
    i32.add
    local.set $2
    br $for-loop|00
   end
  end
  local.get $1
  local.get $0
  call $assembly/view/outpoint/balanceSheetToProtobuf
  i32.store offset=4
  local.get $1
  call $~lib/metashrew-runes/assembly/proto/metashrew-runes/metashrew_runes.WalletResponse#encode
 )
 (func $assembly/proto/protorune/__proto.SafeDecoder#constructor (param $0 i32) (result i32)
  (local $1 i32)
  i32.const 9
  i32.const 105
  call $~lib/rt/stub/__new
  local.tee $1
  i32.eqz
  if
   i32.const 8
   i32.const 106
   call $~lib/rt/stub/__new
   local.set $1
  end
  local.get $1
  i32.const 0
  i32.store
  local.get $1
  i32.const 0
  i32.store offset=4
  local.get $1
  local.get $0
  i32.store
  local.get $1
  i32.const 0
  i32.store offset=4
  local.get $1
  i32.const 0
  i32.store8 offset=8
  local.get $1
 )
 (func $assembly/proto/protorune/__proto.Decoder#varint (param $0 i32) (result i64)
  (local $1 i64)
  (local $2 i32)
  local.get $0
  i32.load
  local.get $0
  i32.load offset=4
  call $~lib/dataview/DataView#getUint8
  i32.const 255
  i32.and
  i64.extend_i32_u
  i64.const 127
  i64.and
  local.set $1
  local.get $0
  local.get $0
  i32.load offset=4
  local.tee $2
  i32.const 1
  i32.add
  i32.store offset=4
  block $folding-inner0
   local.get $0
   i32.load
   local.get $2
   call $~lib/dataview/DataView#getUint8
   i32.const 255
   i32.and
   i32.const 128
   i32.lt_u
   br_if $folding-inner0
   local.get $0
   i32.load
   local.get $0
   i32.load offset=4
   call $~lib/dataview/DataView#getUint8
   i32.const 255
   i32.and
   i64.extend_i32_u
   i64.const 127
   i64.and
   i64.const 7
   i64.shl
   local.get $1
   i64.or
   local.set $1
   local.get $0
   local.get $0
   i32.load offset=4
   local.tee $2
   i32.const 1
   i32.add
   i32.store offset=4
   local.get $0
   i32.load
   local.get $2
   call $~lib/dataview/DataView#getUint8
   i32.const 255
   i32.and
   i32.const 128
   i32.lt_u
   br_if $folding-inner0
   local.get $0
   i32.load
   local.get $0
   i32.load offset=4
   call $~lib/dataview/DataView#getUint8
   i32.const 255
   i32.and
   i64.extend_i32_u
   i64.const 127
   i64.and
   i64.const 14
   i64.shl
   local.get $1
   i64.or
   local.set $1
   local.get $0
   local.get $0
   i32.load offset=4
   local.tee $2
   i32.const 1
   i32.add
   i32.store offset=4
   local.get $0
   i32.load
   local.get $2
   call $~lib/dataview/DataView#getUint8
   i32.const 255
   i32.and
   i32.const 128
   i32.lt_u
   br_if $folding-inner0
   local.get $0
   i32.load
   local.get $0
   i32.load offset=4
   call $~lib/dataview/DataView#getUint8
   i32.const 255
   i32.and
   i64.extend_i32_u
   i64.const 127
   i64.and
   i64.const 21
   i64.shl
   local.get $1
   i64.or
   local.set $1
   local.get $0
   local.get $0
   i32.load offset=4
   local.tee $2
   i32.const 1
   i32.add
   i32.store offset=4
   local.get $0
   i32.load
   local.get $2
   call $~lib/dataview/DataView#getUint8
   i32.const 255
   i32.and
   i32.const 128
   i32.lt_u
   br_if $folding-inner0
   local.get $0
   i32.load
   local.get $0
   i32.load offset=4
   call $~lib/dataview/DataView#getUint8
   i32.const 255
   i32.and
   i64.extend_i32_u
   i64.const 127
   i64.and
   i64.const 28
   i64.shl
   local.get $1
   i64.or
   local.set $1
   local.get $0
   local.get $0
   i32.load offset=4
   local.tee $2
   i32.const 1
   i32.add
   i32.store offset=4
   local.get $0
   i32.load
   local.get $2
   call $~lib/dataview/DataView#getUint8
   i32.const 255
   i32.and
   i32.const 128
   i32.lt_u
   br_if $folding-inner0
   local.get $0
   i32.load
   local.get $0
   i32.load offset=4
   call $~lib/dataview/DataView#getUint8
   i32.const 255
   i32.and
   i64.extend_i32_u
   i64.const 127
   i64.and
   i64.const 35
   i64.shl
   local.get $1
   i64.or
   local.set $1
   local.get $0
   local.get $0
   i32.load offset=4
   local.tee $2
   i32.const 1
   i32.add
   i32.store offset=4
   local.get $0
   i32.load
   local.get $2
   call $~lib/dataview/DataView#getUint8
   i32.const 255
   i32.and
   i32.const 128
   i32.lt_u
   br_if $folding-inner0
   local.get $0
   i32.load
   local.get $0
   i32.load offset=4
   call $~lib/dataview/DataView#getUint8
   i32.const 255
   i32.and
   i64.extend_i32_u
   i64.const 127
   i64.and
   i64.const 42
   i64.shl
   local.get $1
   i64.or
   local.set $1
   local.get $0
   local.get $0
   i32.load offset=4
   local.tee $2
   i32.const 1
   i32.add
   i32.store offset=4
   local.get $0
   i32.load
   local.get $2
   call $~lib/dataview/DataView#getUint8
   i32.const 255
   i32.and
   i32.const 128
   i32.lt_u
   br_if $folding-inner0
   local.get $0
   i32.load
   local.get $0
   i32.load offset=4
   call $~lib/dataview/DataView#getUint8
   i32.const 255
   i32.and
   i64.extend_i32_u
   i64.const 127
   i64.and
   i64.const 49
   i64.shl
   local.get $1
   i64.or
   local.set $1
   local.get $0
   local.get $0
   i32.load offset=4
   local.tee $2
   i32.const 1
   i32.add
   i32.store offset=4
   local.get $0
   i32.load
   local.get $2
   call $~lib/dataview/DataView#getUint8
   i32.const 255
   i32.and
   i32.const 128
   i32.lt_u
   br_if $folding-inner0
   local.get $0
   i32.load
   local.get $0
   i32.load offset=4
   call $~lib/dataview/DataView#getUint8
   i32.const 255
   i32.and
   i64.extend_i32_u
   i64.const 127
   i64.and
   i64.const 28
   i64.shl
   local.get $1
   i64.or
   local.set $1
   local.get $0
   local.get $0
   i32.load offset=4
   local.tee $2
   i32.const 1
   i32.add
   i32.store offset=4
   local.get $0
   i32.load
   local.get $2
   call $~lib/dataview/DataView#getUint8
   i32.const 255
   i32.and
   i32.const 128
   i32.lt_u
   br_if $folding-inner0
   local.get $0
   i32.load
   local.get $0
   i32.load offset=4
   call $~lib/dataview/DataView#getUint8
   i32.const 255
   i32.and
   i64.extend_i32_u
   i64.const 127
   i64.and
   i64.const 35
   i64.shl
   local.get $1
   i64.or
   local.set $1
   local.get $0
   local.get $0
   i32.load offset=4
   local.tee $2
   i32.const 1
   i32.add
   i32.store offset=4
   local.get $0
   i32.load
   local.get $2
   call $~lib/dataview/DataView#getUint8
   i32.const 255
   i32.and
   i32.const 128
   i32.lt_u
   br_if $folding-inner0
   local.get $0
   i32.load offset=4
   local.get $0
   i32.load
   i32.load offset=8
   i32.gt_s
   if
    i32.const 10292
    local.get $0
    i32.load offset=4
    call $~lib/util/number/itoa32
    i32.store
    i32.const 10288
    call $~lib/staticarray/StaticArray<~lib/string/String>#join
    i32.const 10320
    i32.const 278
    i32.const 7
    call $~lib/builtins/abort
    unreachable
   end
  end
  local.get $1
 )
 (func $assembly/proto/protorune/__proto.SafeDecoder#bytes (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  block $__inlined_func$assembly/proto/protorune/__proto.SafeDecoder#invalid$3373 (result i32)
   i32.const 1
   local.get $0
   i32.load8_u offset=8
   br_if $__inlined_func$assembly/proto/protorune/__proto.SafeDecoder#invalid$3373
   drop
   local.get $0
   i32.load offset=4
   i32.const 4096
   i32.gt_s
   if
    local.get $0
    i32.const 1
    i32.store8 offset=8
    i32.const 1
    br $__inlined_func$assembly/proto/protorune/__proto.SafeDecoder#invalid$3373
   end
   i32.const 0
  end
  if
   i32.const 0
   call $~lib/array/Array<u8>#constructor
   return
  end
  local.get $0
  call $assembly/proto/protorune/__proto.Decoder#varint@override
  i32.wrap_i64
  local.set $1
  local.get $0
  i32.load
  i32.load offset=8
  local.get $1
  local.get $0
  i32.load offset=4
  i32.add
  i32.lt_s
  if (result i32)
   i32.const 1
  else
   local.get $1
   local.get $0
   i32.load offset=4
   i32.add
   i32.const 4096
   i32.gt_s
  end
  if
   local.get $0
   i32.const 1
   i32.store8 offset=8
   i32.const 0
   call $~lib/array/Array<u8>#constructor
   return
  end
  local.get $1
  call $~lib/array/Array<u8>#constructor
  local.set $3
  loop $for-loop|0
   local.get $1
   local.get $2
   i32.gt_u
   if
    local.get $0
    local.get $0
    i32.load offset=4
    local.tee $4
    i32.const 1
    i32.add
    i32.store offset=4
    local.get $3
    local.get $2
    local.get $0
    i32.load
    local.get $4
    call $~lib/dataview/DataView#getUint8
    call $~lib/array/Array<u8>#__set
    local.get $2
    i32.const 1
    i32.add
    local.set $2
    br $for-loop|0
   end
  end
  local.get $3
 )
 (func $assembly/proto/protorune/__proto.SafeDecoder#skipType (param $0 i32) (param $1 i32)
  block $__inlined_func$assembly/proto/protorune/__proto.SafeDecoder#invalid$3376 (result i32)
   i32.const 1
   local.get $0
   i32.load8_u offset=8
   br_if $__inlined_func$assembly/proto/protorune/__proto.SafeDecoder#invalid$3376
   drop
   local.get $0
   i32.load offset=4
   i32.const 4096
   i32.gt_s
   if
    local.get $0
    i32.const 1
    i32.store8 offset=8
    i32.const 1
    br $__inlined_func$assembly/proto/protorune/__proto.SafeDecoder#invalid$3376
   end
   i32.const 0
  end
  if
   return
  end
  block $break|0
   block $case5|0
    block $case4|0
     block $case3|0
      block $case2|0
       block $case1|0
        block $case0|0
         local.get $1
         br_table $case0|0 $case1|0 $case2|0 $case3|0 $case5|0 $case4|0 $case5|0
        end
        local.get $0
        call $~lib/metashrew-runes/assembly/proto/metashrew-runes/__proto.SafeDecoder#varint
        drop
        br $break|0
       end
       block $__inlined_func$assembly/proto/protorune/__proto.SafeDecoder#invalid$3375 (result i32)
        i32.const 1
        local.get $0
        i32.load8_u offset=8
        br_if $__inlined_func$assembly/proto/protorune/__proto.SafeDecoder#invalid$3375
        drop
        local.get $0
        i32.load offset=4
        i32.const 4096
        i32.gt_s
        if
         local.get $0
         i32.const 1
         i32.store8 offset=8
         i32.const 1
         br $__inlined_func$assembly/proto/protorune/__proto.SafeDecoder#invalid$3375
        end
        i32.const 0
       end
       i32.eqz
       if
        local.get $0
        i32.load
        i32.load offset=8
        local.get $0
        i32.load offset=4
        i32.const 8
        i32.add
        i32.lt_s
        if (result i32)
         i32.const 1
        else
         local.get $0
         i32.load offset=4
         i32.const 8
         i32.add
         i32.const 4096
         i32.gt_s
        end
        if
         local.get $0
         i32.const 1
         i32.store8 offset=8
        end
        local.get $0
        local.get $0
        i32.load offset=4
        i32.const 8
        i32.add
        i32.store offset=4
       end
       br $break|0
      end
      local.get $0
      call $assembly/proto/protorune/__proto.Decoder#varint@override
      i32.wrap_i64
      local.set $1
      block $__inlined_func$assembly/proto/protorune/__proto.SafeDecoder#invalid$33750 (result i32)
       i32.const 1
       local.get $0
       i32.load8_u offset=8
       br_if $__inlined_func$assembly/proto/protorune/__proto.SafeDecoder#invalid$33750
       drop
       local.get $0
       i32.load offset=4
       i32.const 4096
       i32.gt_s
       if
        local.get $0
        i32.const 1
        i32.store8 offset=8
        i32.const 1
        br $__inlined_func$assembly/proto/protorune/__proto.SafeDecoder#invalid$33750
       end
       i32.const 0
      end
      i32.eqz
      if
       local.get $0
       i32.load
       i32.load offset=8
       local.get $1
       local.get $0
       i32.load offset=4
       i32.add
       i32.lt_s
       if (result i32)
        i32.const 1
       else
        local.get $1
        local.get $0
        i32.load offset=4
        i32.add
        i32.const 4096
        i32.gt_s
       end
       if
        local.get $0
        i32.const 1
        i32.store8 offset=8
       end
       local.get $0
       local.get $1
       local.get $0
       i32.load offset=4
       i32.add
       i32.store offset=4
      end
      br $break|0
     end
     loop $while-continue|1
      local.get $0
      call $assembly/proto/protorune/__proto.Decoder#varint@override
      i32.wrap_i64
      i32.const 7
      i32.and
      local.tee $1
      i32.const 4
      i32.ne
      if
       local.get $0
       local.get $1
       call $assembly/proto/protorune/__proto.SafeDecoder#skipType
       br $while-continue|1
      end
     end
     br $break|0
    end
    block $__inlined_func$assembly/proto/protorune/__proto.SafeDecoder#invalid$33751 (result i32)
     i32.const 1
     local.get $0
     i32.load8_u offset=8
     br_if $__inlined_func$assembly/proto/protorune/__proto.SafeDecoder#invalid$33751
     drop
     local.get $0
     i32.load offset=4
     i32.const 4096
     i32.gt_s
     if
      local.get $0
      i32.const 1
      i32.store8 offset=8
      i32.const 1
      br $__inlined_func$assembly/proto/protorune/__proto.SafeDecoder#invalid$33751
     end
     i32.const 0
    end
    i32.eqz
    if
     local.get $0
     i32.load
     i32.load offset=8
     local.get $0
     i32.load offset=4
     i32.const 4
     i32.add
     i32.lt_s
     if (result i32)
      i32.const 1
     else
      local.get $0
      i32.load offset=4
      i32.const 4
      i32.add
      i32.const 4096
      i32.gt_s
     end
     if
      local.get $0
      i32.const 1
      i32.store8 offset=8
     end
     local.get $0
     local.get $0
     i32.load offset=4
     i32.const 4
     i32.add
     i32.store offset=4
    end
    br $break|0
   end
   local.get $0
   i32.const 1
   i32.store8 offset=8
  end
 )
 (func $assembly/view/wallet/protorunesbyaddress (result i32)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  call $~lib/metashrew-as/assembly/indexer/index/__host_len
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.tee $0
  call $~lib/metashrew-as/assembly/indexer/index/__load_input
  local.get $0
  i32.const 4
  i32.const 1073741820
  call $~lib/arraybuffer/ArrayBuffer#slice
  local.set $0
  block $__inlined_func$assembly/proto/protorune/protorune.ProtorunesWalletRequest.decodeDataView$1823 (result i32)
   i32.const 1
   global.set $~argumentsLength
   local.get $0
   call $~lib/dataview/DataView#constructor@varargs
   call $assembly/proto/protorune/__proto.SafeDecoder#constructor
   local.set $3
   i32.const 8
   i32.const 104
   call $~lib/rt/stub/__new
   local.tee $0
   i32.eqz
   if
    i32.const 0
    i32.const 0
    call $~lib/rt/stub/__new
    local.set $0
   end
   local.get $0
   i32.const 0
   call $~lib/array/Array<u8>#constructor
   i32.store
   local.get $0
   i32.const 0
   call $~lib/array/Array<u8>#constructor
   i32.store offset=4
   loop $while-continue|0
    block $__inlined_func$assembly/proto/protorune/__proto.SafeDecoder#invalid$3371 (result i32)
     i32.const 1
     local.get $3
     i32.load8_u offset=8
     br_if $__inlined_func$assembly/proto/protorune/__proto.SafeDecoder#invalid$3371
     drop
     local.get $3
     i32.load offset=4
     i32.const 4096
     i32.gt_s
     if
      local.get $3
      i32.const 1
      i32.store8 offset=8
      i32.const 1
      br $__inlined_func$assembly/proto/protorune/__proto.SafeDecoder#invalid$3371
     end
     i32.const 0
    end
    if (result i32)
     i32.const 1
    else
     local.get $3
     i32.load offset=4
     local.get $3
     i32.load
     i32.load offset=8
     i32.ge_s
    end
    i32.eqz
    if
     block $case2|1
      block $case1|1
       local.get $3
       call $assembly/proto/protorune/__proto.Decoder#varint@override
       i32.wrap_i64
       local.tee $4
       i32.const 3
       i32.shr_u
       local.tee $5
       i32.const 1
       i32.ne
       if
        local.get $5
        i32.const 2
        i32.eq
        br_if $case1|1
        br $case2|1
       end
       local.get $0
       local.get $3
       call $assembly/proto/protorune/__proto.SafeDecoder#bytes
       i32.store
       br $while-continue|0
      end
      local.get $0
      local.get $3
      call $assembly/proto/protorune/__proto.SafeDecoder#bytes
      i32.store offset=4
      br $while-continue|0
     end
     local.get $3
     local.get $4
     i32.const 7
     i32.and
     call $assembly/proto/protorune/__proto.SafeDecoder#skipType
     br $while-continue|0
    end
   end
   i32.const 0
   block $__inlined_func$assembly/proto/protorune/__proto.SafeDecoder#invalid$3379 (result i32)
    i32.const 1
    local.get $3
    i32.load8_u offset=8
    br_if $__inlined_func$assembly/proto/protorune/__proto.SafeDecoder#invalid$3379
    drop
    local.get $3
    i32.load offset=4
    i32.const 4096
    i32.gt_s
    if
     local.get $3
     i32.const 1
     i32.store8 offset=8
     i32.const 1
     br $__inlined_func$assembly/proto/protorune/__proto.SafeDecoder#invalid$3379
    end
    i32.const 0
   end
   br_if $__inlined_func$assembly/proto/protorune/protorune.ProtorunesWalletRequest.decodeDataView$1823
   drop
   local.get $0
  end
  local.tee $4
  i32.load
  i32.load
  local.set $0
  local.get $4
  i32.load offset=4
  i32.load
  local.set $3
  i32.const 16
  i32.const 9
  call $~lib/rt/stub/__new
  local.tee $5
  i64.const 0
  i64.store
  local.get $5
  i64.const 0
  i64.store offset=8
  local.get $3
  local.get $3
  i32.const 20
  i32.sub
  i32.load offset=16
  call $~lib/metashrew-as/assembly/utils/box/Box#constructor
  local.get $5
  call $~lib/metashrew-runes/assembly/leb128/readULEB128ToU128
  drop
  local.get $5
  call $assembly/indexer/tables/protorune/ProtoruneTable.for
  local.set $8
  i32.const 0
  i32.const 39
  call $~lib/rt/stub/__new
  i32.eqz
  if
   i32.const 0
   i32.const 0
   call $~lib/rt/stub/__new
   drop
  end
  local.get $0
  call $~lib/metashrew-spendables/assembly/indexer/SpendablesIndex#findOutpointsForAddress
  local.set $5
  call $~lib/array/Array<~lib/metashrew-runes/assembly/proto/metashrew-runes/metashrew_runes.OutpointResponse>#constructor
  local.set $9
  i32.const 0
  call $~lib/array/Array<assembly/indexer/ProtoruneBalanceSheet/ProtoruneBalanceSheet>#constructor
  local.set $6
  loop $for-loop|0
   local.get $1
   local.get $5
   i32.load offset=12
   i32.lt_s
   if
    i32.const 12
    i32.const 90
    call $~lib/rt/stub/__new
    local.tee $0
    i32.eqz
    if
     i32.const 0
     i32.const 0
     call $~lib/rt/stub/__new
     local.set $0
    end
    local.get $0
    i32.const 0
    call $~lib/array/Array<u8>#constructor
    i32.store
    local.get $0
    i32.const 0
    i32.store offset=4
    local.get $0
    i32.const 0
    call $~lib/array/Array<u8>#constructor
    i32.store offset=8
    local.get $5
    local.get $1
    call $~lib/array/Array<~lib/array/Array<u8>>#__get
    i32.const 0
    i32.const 32
    call $~lib/arraybuffer/ArrayBuffer#slice
    local.set $3
    i32.const 1
    global.set $~argumentsLength
    local.get $0
    local.get $3
    call $~lib/typedarray/Uint8Array.wrap@varargs
    i32.store
    local.get $5
    local.get $1
    call $~lib/array/Array<~lib/array/Array<u8>>#__get
    i32.const 32
    i32.const 1073741820
    call $~lib/arraybuffer/ArrayBuffer#slice
    local.tee $3
    local.get $3
    i32.const 20
    i32.sub
    i32.load offset=16
    call $~lib/metashrew-as/assembly/utils/box/Box#constructor
    local.tee $7
    i32.load
    local.tee $10
    i32.load
    local.set $3
    local.get $7
    local.get $10
    i32.const 4
    i32.add
    i32.store
    local.get $7
    local.get $7
    i32.load offset=4
    i32.const 4
    i32.sub
    i32.store offset=4
    local.get $0
    local.get $3
    i32.store offset=4
    local.get $0
    local.get $4
    i32.load offset=4
    i32.store offset=8
    local.get $0
    call $assembly/view/outpoint/outpointBaseForProtocol
    local.tee $0
    i32.load
    i32.load
    i32.load offset=12
    if
     local.get $6
     local.get $8
     i32.load offset=4
     local.get $5
     local.get $1
     call $~lib/array/Array<~lib/array/Array<u8>>#__get
     call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
     call $~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet.load
     call $~lib/array/Array<~lib/array/Array<u8>>#push
     drop
     local.get $9
     local.get $0
     call $~lib/array/Array<~lib/array/Array<u8>>#push
     drop
    end
    local.get $1
    i32.const 1
    i32.add
    local.set $1
    br $for-loop|0
   end
  end
  call $~lib/metashrew-runes/assembly/proto/metashrew-runes/metashrew_runes.WalletResponse#constructor
  local.tee $1
  local.get $9
  i32.store
  i32.const 12
  i32.const 57
  call $~lib/rt/stub/__new
  call $~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet#constructor
  local.set $0
  local.get $6
  i32.load offset=12
  local.set $3
  loop $for-loop|00
   local.get $2
   local.get $3
   local.get $6
   i32.load offset=12
   local.tee $4
   local.get $3
   local.get $4
   i32.lt_s
   select
   i32.lt_s
   if
    local.get $6
    i32.load offset=4
    local.get $2
    i32.const 2
    i32.shl
    i32.add
    i32.load
    local.set $4
    i32.const 4
    global.set $~argumentsLength
    local.get $0
    local.get $4
    local.get $2
    local.get $6
    i32.const 10400
    i32.load
    call_indirect (type $3)
    local.set $0
    local.get $2
    i32.const 1
    i32.add
    local.set $2
    br $for-loop|00
   end
  end
  local.get $1
  local.get $0
  call $assembly/view/outpoint/balanceSheetToProtobuf
  i32.store offset=4
  local.get $1
  call $~lib/metashrew-runes/assembly/proto/metashrew-runes/metashrew_runes.WalletResponse#encode
 )
 (func $assembly/view/runtime/runtime (result i32)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  call $~lib/metashrew-as/assembly/indexer/index/__host_len
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.tee $0
  call $~lib/metashrew-as/assembly/indexer/index/__load_input
  local.get $0
  i32.const 4
  i32.const 1073741820
  call $~lib/arraybuffer/ArrayBuffer#slice
  local.set $0
  block $__inlined_func$assembly/proto/protorune/protorune.RuntimeInput.decodeDataView$1840 (result i32)
   i32.const 1
   global.set $~argumentsLength
   local.get $0
   call $~lib/dataview/DataView#constructor@varargs
   call $assembly/proto/protorune/__proto.SafeDecoder#constructor
   local.set $1
   i32.const 4
   i32.const 107
   call $~lib/rt/stub/__new
   local.tee $0
   i32.eqz
   if
    i32.const 0
    i32.const 0
    call $~lib/rt/stub/__new
    local.set $0
   end
   local.get $0
   i32.const 0
   call $~lib/array/Array<u8>#constructor
   i32.store
   loop $while-continue|0
    block $__inlined_func$assembly/proto/protorune/__proto.SafeDecoder#invalid$3371 (result i32)
     i32.const 1
     local.get $1
     i32.load8_u offset=8
     br_if $__inlined_func$assembly/proto/protorune/__proto.SafeDecoder#invalid$3371
     drop
     local.get $1
     i32.load offset=4
     i32.const 4096
     i32.gt_s
     if
      local.get $1
      i32.const 1
      i32.store8 offset=8
      i32.const 1
      br $__inlined_func$assembly/proto/protorune/__proto.SafeDecoder#invalid$3371
     end
     i32.const 0
    end
    if (result i32)
     i32.const 1
    else
     local.get $1
     i32.load offset=4
     local.get $1
     i32.load
     i32.load offset=8
     i32.ge_s
    end
    i32.eqz
    if
     local.get $1
     call $assembly/proto/protorune/__proto.Decoder#varint@override
     i32.wrap_i64
     local.tee $2
     i32.const 3
     i32.shr_u
     i32.const 1
     i32.eq
     if
      local.get $0
      local.get $1
      call $assembly/proto/protorune/__proto.SafeDecoder#bytes
      i32.store
      br $while-continue|0
     end
     local.get $1
     local.get $2
     i32.const 7
     i32.and
     call $assembly/proto/protorune/__proto.SafeDecoder#skipType
     br $while-continue|0
    end
   end
   i32.const 0
   block $__inlined_func$assembly/proto/protorune/__proto.SafeDecoder#invalid$3394 (result i32)
    i32.const 1
    local.get $1
    i32.load8_u offset=8
    br_if $__inlined_func$assembly/proto/protorune/__proto.SafeDecoder#invalid$3394
    drop
    local.get $1
    i32.load offset=4
    i32.const 4096
    i32.gt_s
    if
     local.get $1
     i32.const 1
     i32.store8 offset=8
     i32.const 1
     br $__inlined_func$assembly/proto/protorune/__proto.SafeDecoder#invalid$3394
    end
    i32.const 0
   end
   br_if $__inlined_func$assembly/proto/protorune/protorune.RuntimeInput.decodeDataView$1840
   drop
   local.get $0
  end
  i32.load
  i32.load
  local.set $0
  i32.const 16
  i32.const 9
  call $~lib/rt/stub/__new
  local.tee $1
  i64.const 0
  i64.store
  local.get $1
  i64.const 0
  i64.store offset=8
  local.get $0
  local.get $0
  i32.const 20
  i32.sub
  i32.load offset=16
  call $~lib/metashrew-as/assembly/utils/box/Box#constructor
  local.get $1
  call $~lib/metashrew-runes/assembly/leb128/readULEB128ToU128
  drop
  local.get $1
  call $assembly/indexer/tables/protorune/ProtoruneTable.for
  local.set $3
  i32.const 4
  i32.const 108
  call $~lib/rt/stub/__new
  local.tee $0
  i32.eqz
  if
   i32.const 0
   i32.const 0
   call $~lib/rt/stub/__new
   local.set $0
  end
  i32.const 4
  i32.const 109
  call $~lib/rt/stub/__new
  local.tee $1
  i32.eqz
  if
   i32.const 0
   i32.const 0
   call $~lib/rt/stub/__new
   local.set $1
  end
  i32.const 16
  i32.const 113
  call $~lib/rt/stub/__new
  local.tee $2
  i32.const 0
  i32.store
  local.get $2
  i32.const 0
  i32.store offset=4
  local.get $2
  i32.const 0
  i32.store offset=8
  local.get $2
  i32.const 0
  i32.store offset=12
  i32.const 32
  i32.const 1
  call $~lib/rt/stub/__new
  local.tee $4
  i32.const 0
  i32.const 32
  memory.fill
  local.get $2
  local.get $4
  i32.store
  local.get $2
  local.get $4
  i32.store offset=4
  local.get $2
  i32.const 32
  i32.store offset=8
  local.get $2
  i32.const 0
  i32.store offset=12
  local.get $1
  local.get $2
  i32.store
  local.get $0
  local.get $1
  i32.store
  local.get $0
  local.get $3
  i32.load offset=36
  call $~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet.load
  local.get $3
  call $assembly/view/outpoint/balanceSheetToProtobufForProtocol
  i32.store
  i32.const 0
  global.set $~argumentsLength
  i32.const 0
  call $~lib/array/Array<u8>#constructor
  local.set $1
  i32.const 4
  i32.const 114
  call $~lib/rt/stub/__new
  local.tee $2
  i32.const 0
  i32.store
  local.get $2
  local.get $1
  i32.store
  local.get $2
  i32.load
  local.set $1
  local.get $0
  i32.load
  local.tee $0
  if
   local.get $0
   call $~lib/metashrew-runes/assembly/proto/metashrew-runes/metashrew_runes.BalanceSheet#size
   local.tee $3
   if
    local.get $2
    i64.const 10
    call $~lib/metashrew-as/assembly/proto/metashrew/__proto.Encoder#varint64
    local.get $2
    local.get $3
    i64.extend_i32_u
    call $~lib/metashrew-as/assembly/proto/metashrew/__proto.Encoder#varint64
    local.get $0
    local.get $2
    call $~lib/metashrew-runes/assembly/proto/metashrew-runes/metashrew_runes.BalanceSheet#encodeU8Array
   end
  end
  local.get $1
  i32.load offset=12
  local.tee $0
  i32.const 4
  call $~lib/rt/stub/__new
  local.tee $2
  local.get $1
  i32.load offset=4
  local.get $0
  memory.copy
  local.get $2
 )
 (func $assembly/indexer/ProtoruneRuneId/ProtoruneRuneId.encode~anonymous|0 (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i64)
  (local $4 i32)
  (local $5 i64)
  (local $6 i32)
  i32.const 0
  i32.const 0
  i32.const 13
  i32.const 10432
  call $~lib/rt/__newArray
  local.set $2
  i32.const 16
  i32.const 9
  call $~lib/rt/stub/__new
  local.tee $1
  i64.const 127
  i64.store
  local.get $1
  i64.const 0
  i64.store offset=8
  i32.const 16
  i32.const 9
  call $~lib/rt/stub/__new
  local.tee $4
  i64.const 128
  i64.store
  local.get $4
  i64.const 0
  i64.store offset=8
  loop $while-continue|0
   local.get $1
   i64.load offset=8
   local.tee $3
   local.get $0
   i64.load offset=8
   local.tee $5
   i64.eq
   if (result i32)
    local.get $0
    i64.load
    local.get $1
    i64.load
    i64.gt_u
   else
    local.get $3
    local.get $5
    i64.lt_u
   end
   if
    local.get $0
    i64.load
    local.get $1
    i64.load
    i64.and
    local.set $3
    local.get $0
    i64.load offset=8
    local.get $1
    i64.load offset=8
    i64.and
    local.set $5
    i32.const 16
    i32.const 9
    call $~lib/rt/stub/__new
    local.tee $6
    local.get $3
    i64.store
    local.get $6
    local.get $5
    i64.store offset=8
    local.get $6
    i64.load
    local.get $4
    i64.load
    i64.or
    local.set $3
    local.get $6
    i64.load offset=8
    local.get $4
    i64.load offset=8
    i64.or
    local.set $5
    i32.const 16
    i32.const 9
    call $~lib/rt/stub/__new
    local.tee $6
    local.get $3
    i64.store
    local.get $6
    local.get $5
    i64.store offset=8
    local.get $2
    local.get $6
    i64.load
    i32.wrap_i64
    call $~lib/array/Array<u8>#push
    local.get $0
    i64.load offset=8
    local.tee $3
    i64.const 57
    i64.shl
    local.get $0
    i64.load
    i64.const 7
    i64.shr_u
    i64.or
    local.set $5
    i32.const 16
    i32.const 9
    call $~lib/rt/stub/__new
    local.tee $0
    local.get $5
    i64.store
    local.get $0
    local.get $3
    i64.const 7
    i64.shr_u
    i64.store offset=8
    br $while-continue|0
   end
  end
  local.get $0
  i64.load
  local.get $1
  i64.load
  i64.and
  local.set $3
  local.get $0
  i64.load offset=8
  local.get $1
  i64.load offset=8
  i64.and
  local.set $5
  i32.const 16
  i32.const 9
  call $~lib/rt/stub/__new
  local.tee $0
  local.get $3
  i64.store
  local.get $0
  local.get $5
  i64.store offset=8
  local.get $2
  local.get $0
  i64.load
  i32.wrap_i64
  call $~lib/array/Array<u8>#push
  local.get $2
  i32.load offset=12
  local.tee $0
  i32.const 4
  call $~lib/rt/stub/__new
  local.tee $1
  local.get $2
  i32.load offset=4
  local.get $0
  memory.copy
  local.get $1
  local.get $1
  i32.const 20
  i32.sub
  i32.load offset=16
  call $~lib/metashrew-as/assembly/utils/box/Box#constructor
 )
 (func $assembly/indexer/ProtoruneRuneId/ProtoruneRuneId.encode (param $0 i32) (result i32)
  (local $1 i64)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i64)
  local.get $0
  i32.const 10464
  call $~lib/array/Array<~lib/arraybuffer/ArrayBuffer>#map<~lib/metashrew-as/assembly/utils/box/Box>
  call $~lib/metashrew-as/assembly/utils/box/Box.concat
  local.set $0
  i32.const 8
  i32.const 115
  call $~lib/rt/stub/__new
  i64.const 0
  i32.const 0
  call $~lib/metashrew-runes/assembly/indexer/RuneId/RuneId#constructor
  local.set $2
  i32.const 10496
  i32.const 31
  call $~lib/util/number/utoa32
  call $~lib/string/String.__concat
  local.set $3
  i32.const 2
  global.set $~argumentsLength
  local.get $3
  i32.const 1
  call $~lib/string/String.UTF8.encode@varargs
  call $~lib/metashrew-as/assembly/utils/logging/__log
  local.get $0
  i32.const 20
  i32.sub
  i32.load offset=16
  i32.const 31
  i32.gt_u
  if
   local.get $2
   return
  end
  i32.const 32
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.set $3
  local.get $0
  i32.const 20
  i32.sub
  i32.load offset=16
  local.tee $4
  i32.const 16
  i32.le_s
  if
   local.get $3
   i32.const 32
   local.get $4
   i32.sub
   i32.add
   local.get $0
   local.get $4
   memory.copy
  else
   local.get $3
   i32.const 16
   i32.add
   local.get $0
   local.get $0
   i32.const 20
   i32.sub
   i32.load offset=16
   i32.const 16
   i32.sub
   i32.add
   i32.const 16
   memory.copy
   local.get $3
   i32.const 31
   local.get $0
   i32.const 20
   i32.sub
   i32.load offset=16
   i32.sub
   i32.add
   local.get $0
   local.get $0
   i32.const 20
   i32.sub
   i32.load offset=16
   i32.const 16
   i32.sub
   memory.copy
  end
  local.get $3
  local.get $3
  i32.const 20
  i32.sub
  i32.load offset=16
  call $~lib/metashrew-as/assembly/utils/box/Box#constructor
  local.tee $0
  local.get $0
  i32.load offset=4
  i32.const 16
  i32.sub
  i32.store offset=4
  local.get $0
  i32.load offset=4
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.tee $4
  local.get $0
  i32.load
  local.get $0
  i32.load offset=4
  memory.copy
  i32.const 1
  global.set $~argumentsLength
  local.get $4
  call $~lib/typedarray/Uint8Array.wrap@varargs
  local.tee $0
  i32.const 15
  i32.const 127
  call $~lib/typedarray/Uint8Array#__set
  block $folding-inner0
   local.get $0
   i32.load offset=8
   local.tee $4
   i32.const 15
   i32.and
   i32.const 1
   local.get $4
   select
   br_if $folding-inner0
   local.get $0
   i32.load offset=4
   local.tee $0
   i64.load offset=8
   local.tee $1
   i64.const 8
   i64.shr_u
   i64.const 71777214294589695
   i64.and
   local.get $1
   i64.const 71777214294589695
   i64.and
   i64.const 8
   i64.shl
   i64.or
   local.set $1
   local.get $0
   i64.load
   local.tee $5
   i64.const 8
   i64.shr_u
   i64.const 71777214294589695
   i64.and
   local.get $5
   i64.const 71777214294589695
   i64.and
   i64.const 8
   i64.shl
   i64.or
   local.set $5
   i32.const 16
   i32.const 9
   call $~lib/rt/stub/__new
   local.tee $0
   local.get $1
   i64.const 16
   i64.shr_u
   i64.const 281470681808895
   i64.and
   local.get $1
   i64.const 281470681808895
   i64.and
   i64.const 16
   i64.shl
   i64.or
   i64.const 32
   i64.rotr
   i64.store
   local.get $0
   local.get $5
   i64.const 16
   i64.shr_u
   i64.const 281470681808895
   i64.and
   local.get $5
   i64.const 281470681808895
   i64.and
   i64.const 16
   i64.shl
   i64.or
   i64.const 32
   i64.rotr
   i64.store offset=8
   local.get $2
   local.get $0
   i32.store
   i32.const 10544
   local.get $2
   i32.load
   call $~lib/as-bignum/assembly/integer/u128/u128#toString
   call $~lib/string/String.__concat
   local.set $0
   i32.const 2
   global.set $~argumentsLength
   local.get $0
   i32.const 1
   call $~lib/string/String.UTF8.encode@varargs
   call $~lib/metashrew-as/assembly/utils/logging/__log
   local.get $3
   local.get $3
   i32.const 20
   i32.sub
   i32.load offset=16
   call $~lib/metashrew-as/assembly/utils/box/Box#constructor
   local.tee $0
   local.get $0
   i32.load
   i32.const 16
   i32.add
   i32.store
   local.get $0
   local.get $0
   i32.load offset=4
   i32.const 16
   i32.sub
   i32.store offset=4
   local.get $0
   i32.load offset=4
   call $~lib/arraybuffer/ArrayBuffer#constructor
   local.tee $3
   local.get $0
   i32.load
   local.get $0
   i32.load offset=4
   memory.copy
   i32.const 1
   global.set $~argumentsLength
   local.get $3
   call $~lib/typedarray/Uint8Array.wrap@varargs
   local.tee $0
   i32.load offset=8
   local.tee $3
   if (result i32)
    local.get $3
    i32.const 15
    i32.and
   else
    i32.const 1
   end
   br_if $folding-inner0
   local.get $0
   i32.load offset=4
   local.tee $0
   i64.load offset=8
   local.tee $1
   i64.const 8
   i64.shr_u
   i64.const 71777214294589695
   i64.and
   local.get $1
   i64.const 71777214294589695
   i64.and
   i64.const 8
   i64.shl
   i64.or
   local.set $1
   local.get $0
   i64.load
   local.tee $5
   i64.const 8
   i64.shr_u
   i64.const 71777214294589695
   i64.and
   local.get $5
   i64.const 71777214294589695
   i64.and
   i64.const 8
   i64.shl
   i64.or
   local.set $5
   i32.const 16
   i32.const 9
   call $~lib/rt/stub/__new
   local.tee $0
   local.get $1
   i64.const 16
   i64.shr_u
   i64.const 281470681808895
   i64.and
   local.get $1
   i64.const 281470681808895
   i64.and
   i64.const 16
   i64.shl
   i64.or
   i64.const 32
   i64.rotr
   i64.store
   local.get $0
   local.get $5
   i64.const 16
   i64.shr_u
   i64.const 281470681808895
   i64.and
   local.get $5
   i64.const 281470681808895
   i64.and
   i64.const 16
   i64.shl
   i64.or
   i64.const 32
   i64.rotr
   i64.store offset=8
   local.get $2
   local.get $0
   i32.store offset=4
   i32.const 10576
   local.get $2
   i32.load offset=4
   call $~lib/as-bignum/assembly/integer/u128/u128#toString
   call $~lib/string/String.__concat
   local.set $0
   i32.const 2
   global.set $~argumentsLength
   local.get $0
   i32.const 1
   call $~lib/string/String.UTF8.encode@varargs
   call $~lib/metashrew-as/assembly/utils/logging/__log
   local.get $2
   return
  end
  i32.const 0
  i32.const 8304
  i32.const 143
  i32.const 5
  call $~lib/builtins/abort
  unreachable
 )
 (func $assembly/utils/alignArrayBuffer (param $0 i32) (result i32)
  (local $1 i32)
  local.get $0
  local.get $0
  i32.const 20
  i32.sub
  i32.load offset=16
  call $~lib/metashrew-as/assembly/utils/box/Box#constructor
  local.set $0
  loop $while-continue|0
   local.get $0
   i32.load offset=4
   if
    local.get $0
    i32.load
    local.tee $1
    i32.load8_u
    i32.eqz
    if
     local.get $0
     local.get $1
     i32.const 1
     i32.add
     i32.store
     local.get $0
     local.get $0
     i32.load offset=4
     i32.const 1
     i32.sub
     i32.store offset=4
     br $while-continue|0
    end
   end
  end
  local.get $0
 )
 (func $assembly/test/_test_ProtoruneRuneId (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i64)
  (local $4 i64)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  local.get $0
  i32.load
  call $~lib/as-bignum/assembly/integer/u128/u128#toString
  local.set $5
  i32.const 2
  global.set $~argumentsLength
  local.get $5
  i32.const 1
  call $~lib/string/String.UTF8.encode@varargs
  call $~lib/metashrew-as/assembly/utils/logging/__log
  local.get $0
  i32.load offset=4
  call $~lib/as-bignum/assembly/integer/u128/u128#toString
  local.set $5
  i32.const 2
  global.set $~argumentsLength
  local.get $5
  i32.const 1
  call $~lib/string/String.UTF8.encode@varargs
  call $~lib/metashrew-as/assembly/utils/logging/__log
  i32.const 1
  global.set $~argumentsLength
  global.get $assembly/test/TEST_PROTORUNE_RUNEID
  i32.const 10608
  i32.const 0
  call $~lib/string/String.UTF8.encode@varargs
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
  local.set $5
  local.get $0
  i32.load
  local.set $6
  i32.const 12
  i32.const 14
  call $~lib/rt/stub/__new
  i32.const 16
  i32.const 0
  call $~lib/arraybuffer/ArrayBufferView#constructor
  local.tee $7
  i32.load offset=4
  local.tee $8
  local.get $6
  i64.load
  i64.store
  local.get $8
  local.get $6
  i64.load offset=8
  i64.store offset=8
  local.get $7
  i32.load
  local.set $6
  local.get $5
  call $~lib/metashrew-as/assembly/indexer/index/hash
  local.set $7
  global.get $~lib/metashrew-as/assembly/indexer/index/_updates
  local.get $7
  local.get $6
  call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set"
  global.get $~lib/metashrew-as/assembly/indexer/index/_updateKeys
  local.get $7
  local.get $5
  call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set"
  i32.const 1
  global.set $~argumentsLength
  global.get $assembly/test/TEST_PROTORUNE_RUNEID
  i32.const 10640
  i32.const 0
  call $~lib/string/String.UTF8.encode@varargs
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
  local.set $5
  local.get $0
  i32.load offset=4
  local.set $6
  i32.const 12
  i32.const 14
  call $~lib/rt/stub/__new
  i32.const 16
  i32.const 0
  call $~lib/arraybuffer/ArrayBufferView#constructor
  local.tee $7
  i32.load offset=4
  local.tee $8
  local.get $6
  i64.load
  i64.store
  local.get $8
  local.get $6
  i64.load offset=8
  i64.store offset=8
  local.get $7
  i32.load
  local.set $6
  local.get $5
  call $~lib/metashrew-as/assembly/indexer/index/hash
  local.set $7
  global.get $~lib/metashrew-as/assembly/indexer/index/_updates
  local.get $7
  local.get $6
  call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set"
  global.get $~lib/metashrew-as/assembly/indexer/index/_updateKeys
  local.get $7
  local.get $5
  call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set"
  block $__inlined_func$assembly/indexer/ProtoruneRuneId/ProtoruneRuneId#decode$170 (result i32)
   i32.const 2
   call $~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>#constructor
   local.set $5
   local.get $0
   i32.load
   local.tee $6
   i64.load offset=8
   local.tee $3
   i64.const 56
   i64.shl
   local.get $6
   i64.load
   i64.const 8
   i64.shr_u
   i64.or
   local.set $4
   i32.const 16
   i32.const 9
   call $~lib/rt/stub/__new
   local.tee $6
   local.get $4
   i64.store
   local.get $6
   local.get $3
   i64.const 8
   i64.shr_u
   i64.store offset=8
   local.get $5
   i32.const 0
   local.get $6
   call $~lib/array/Array<~lib/string/String>#__set
   local.get $5
   i32.const 1
   local.get $0
   i32.load offset=4
   call $~lib/array/Array<~lib/string/String>#__set
   i32.const 0
   call $~lib/array/Array<~lib/metashrew-as/assembly/utils/box/Box>#constructor
   local.set $6
   i32.const 0
   local.set $0
   loop $for-loop|0
    local.get $0
    local.get $5
    i32.load offset=12
    i32.lt_s
    if
     local.get $5
     local.get $0
     call $~lib/array/Array<~lib/array/Array<u8>>#__get
     local.set $7
     block $for-continue|0
      local.get $1
      i32.eqz
      if
       local.get $7
       i64.load
       local.get $7
       i64.load offset=8
       i64.or
       i64.const 0
       i64.ne
       if
        local.get $6
        local.get $7
        call $~lib/metashrew-runes/assembly/utils/toArrayBuffer
        call $~lib/metashrew-as/assembly/utils/utils/reverse
        call $assembly/utils/alignArrayBuffer
        call $~lib/array/Array<~lib/array/Array<u8>>#push
        drop
        i32.const 1
        local.set $1
       end
       br $for-continue|0
      end
      local.get $6
      local.get $7
      call $~lib/metashrew-runes/assembly/utils/toArrayBuffer
      call $~lib/metashrew-as/assembly/utils/utils/reverse
      local.tee $7
      local.get $7
      i32.const 20
      i32.sub
      i32.load offset=16
      call $~lib/metashrew-as/assembly/utils/box/Box#constructor
      call $~lib/array/Array<~lib/array/Array<u8>>#push
      drop
     end
     local.get $0
     i32.const 1
     i32.add
     local.set $0
     br $for-loop|0
    end
   end
   local.get $6
   call $~lib/metashrew-as/assembly/utils/box/Box.concat
   local.tee $0
   local.get $0
   i32.const 20
   i32.sub
   i32.load offset=16
   call $~lib/metashrew-as/assembly/utils/box/Box#constructor
   local.set $0
   i32.const 0
   call $~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>#constructor
   local.set $1
   loop $while-continue|0
    local.get $0
    i32.load offset=4
    if
     i32.const 16
     i32.const 9
     call $~lib/rt/stub/__new
     local.tee $5
     i64.const 0
     i64.store
     local.get $5
     i64.const 0
     i64.store offset=8
     i32.const 0
     local.get $0
     local.get $5
     call $~lib/metashrew-runes/assembly/leb128/readULEB128ToU128
     local.tee $6
     i32.const -1
     i32.eq
     br_if $__inlined_func$assembly/indexer/ProtoruneRuneId/ProtoruneRuneId#decode$170
     drop
     local.get $0
     local.get $6
     local.get $0
     i32.load
     i32.add
     i32.store
     local.get $0
     local.get $0
     i32.load offset=4
     local.get $6
     i32.sub
     i32.store offset=4
     local.get $1
     local.get $5
     call $~lib/array/Array<~lib/array/Array<u8>>#push
     drop
     br $while-continue|0
    end
   end
   local.get $1
  end
  local.set $0
  loop $for-loop|00
   local.get $2
   local.get $0
   i32.load offset=12
   i32.lt_s
   if
    i32.const 10672
    local.get $2
    call $~lib/util/number/itoa32
    call $~lib/string/String.__concat
    i32.const 10720
    call $~lib/string/String.__concat
    local.get $0
    local.get $2
    call $~lib/array/Array<~lib/array/Array<u8>>#__get
    call $~lib/as-bignum/assembly/integer/u128/u128#toString
    call $~lib/string/String.__concat
    local.set $1
    i32.const 2
    global.set $~argumentsLength
    local.get $1
    i32.const 1
    call $~lib/string/String.UTF8.encode@varargs
    call $~lib/metashrew-as/assembly/utils/logging/__log
    i32.const 1
    global.set $~argumentsLength
    global.get $assembly/test/TEST_PROTORUNE_RUNEID
    i32.const 10752
    i32.const 0
    call $~lib/string/String.UTF8.encode@varargs
    call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
    local.set $1
    local.get $2
    call $~lib/util/number/itoa32
    local.set $5
    i32.const 1
    global.set $~argumentsLength
    local.get $1
    local.get $5
    i32.const 0
    call $~lib/string/String.UTF8.encode@varargs
    call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
    local.set $1
    local.get $0
    local.get $2
    call $~lib/array/Array<~lib/array/Array<u8>>#__get
    local.set $5
    i32.const 12
    i32.const 14
    call $~lib/rt/stub/__new
    i32.const 16
    i32.const 0
    call $~lib/arraybuffer/ArrayBufferView#constructor
    local.tee $6
    i32.load offset=4
    local.tee $7
    local.get $5
    i64.load
    i64.store
    local.get $7
    local.get $5
    i64.load offset=8
    i64.store offset=8
    local.get $6
    i32.load
    local.set $5
    local.get $1
    call $~lib/metashrew-as/assembly/indexer/index/hash
    local.set $6
    global.get $~lib/metashrew-as/assembly/indexer/index/_updates
    local.get $6
    local.get $5
    call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set"
    global.get $~lib/metashrew-as/assembly/indexer/index/_updateKeys
    local.get $6
    local.get $1
    call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set"
    local.get $2
    i32.const 1
    i32.add
    local.set $2
    br $for-loop|00
   end
  end
  call $~lib/metashrew-as/assembly/indexer/index/_flush
 )
 (func $assembly/test/test_ProtoruneRuneId1
  (local $0 i32)
  (local $1 i32)
  i32.const 2
  i32.const 2
  i32.const 59
  i32.const 0
  call $~lib/rt/__newArray
  local.tee $0
  i32.load offset=4
  drop
  i32.const 16
  i32.const 9
  call $~lib/rt/stub/__new
  local.tee $1
  i64.const 50
  i64.store
  local.get $1
  i64.const 0
  i64.store offset=8
  local.get $0
  i32.const 0
  local.get $1
  call $~lib/array/Array<~lib/string/String>#__set
  i32.const 16
  i32.const 9
  call $~lib/rt/stub/__new
  local.tee $1
  i64.const 100
  i64.store
  local.get $1
  i64.const 0
  i64.store offset=8
  local.get $0
  i32.const 1
  local.get $1
  call $~lib/array/Array<~lib/string/String>#__set
  local.get $0
  call $assembly/indexer/ProtoruneRuneId/ProtoruneRuneId.encode
  call $assembly/test/_test_ProtoruneRuneId
 )
 (func $assembly/test/test_ProtoruneRuneId2
  (local $0 i32)
  (local $1 i32)
  i32.const 2
  i32.const 2
  i32.const 59
  i32.const 0
  call $~lib/rt/__newArray
  local.tee $0
  i32.load offset=4
  drop
  i32.const 16
  i32.const 9
  call $~lib/rt/stub/__new
  local.tee $1
  i64.const 50000000
  i64.store
  local.get $1
  i64.const 0
  i64.store offset=8
  local.get $0
  i32.const 0
  local.get $1
  call $~lib/array/Array<~lib/string/String>#__set
  i32.const 16
  i32.const 9
  call $~lib/rt/stub/__new
  local.tee $1
  i64.const 1000000000
  i64.store
  local.get $1
  i64.const 0
  i64.store offset=8
  local.get $0
  i32.const 1
  local.get $1
  call $~lib/array/Array<~lib/string/String>#__set
  local.get $0
  call $assembly/indexer/ProtoruneRuneId/ProtoruneRuneId.encode
  call $assembly/test/_test_ProtoruneRuneId
 )
 (func $assembly/test/test_ProtoruneRuneId3
  (local $0 i32)
  (local $1 i32)
  i32.const 3
  i32.const 2
  i32.const 59
  i32.const 0
  call $~lib/rt/__newArray
  local.tee $0
  i32.load offset=4
  drop
  i32.const 16
  i32.const 9
  call $~lib/rt/stub/__new
  local.tee $1
  i64.const 50000000
  i64.store
  local.get $1
  i64.const 0
  i64.store offset=8
  local.get $0
  i32.const 0
  local.get $1
  call $~lib/array/Array<~lib/string/String>#__set
  i32.const 16
  i32.const 9
  call $~lib/rt/stub/__new
  local.tee $1
  i64.const 1000000000
  i64.store
  local.get $1
  i64.const 0
  i64.store offset=8
  local.get $0
  i32.const 1
  local.get $1
  call $~lib/array/Array<~lib/string/String>#__set
  i32.const 16
  i32.const 9
  call $~lib/rt/stub/__new
  local.tee $1
  i64.const 1500000000
  i64.store
  local.get $1
  i64.const 0
  i64.store offset=8
  local.get $0
  i32.const 2
  local.get $1
  call $~lib/array/Array<~lib/string/String>#__set
  local.get $0
  call $assembly/indexer/ProtoruneRuneId/ProtoruneRuneId.encode
  call $assembly/test/_test_ProtoruneRuneId
 )
 (func $assembly/test/test_ProtoruneRuneId4
  (local $0 i32)
  (local $1 i32)
  i32.const 4
  i32.const 2
  i32.const 59
  i32.const 0
  call $~lib/rt/__newArray
  local.tee $0
  i32.load offset=4
  drop
  i32.const 16
  i32.const 9
  call $~lib/rt/stub/__new
  local.tee $1
  i64.const 50000000
  i64.store
  local.get $1
  i64.const 0
  i64.store offset=8
  local.get $0
  i32.const 0
  local.get $1
  call $~lib/array/Array<~lib/string/String>#__set
  i32.const 16
  i32.const 9
  call $~lib/rt/stub/__new
  local.tee $1
  i64.const 1000000000
  i64.store
  local.get $1
  i64.const 0
  i64.store offset=8
  local.get $0
  i32.const 1
  local.get $1
  call $~lib/array/Array<~lib/string/String>#__set
  i32.const 16
  i32.const 9
  call $~lib/rt/stub/__new
  local.tee $1
  i64.const 1500000000
  i64.store
  local.get $1
  i64.const 0
  i64.store offset=8
  local.get $0
  i32.const 2
  local.get $1
  call $~lib/array/Array<~lib/string/String>#__set
  i32.const 16
  i32.const 9
  call $~lib/rt/stub/__new
  local.tee $1
  i64.const 2000000000
  i64.store
  local.get $1
  i64.const 0
  i64.store offset=8
  local.get $0
  i32.const 3
  local.get $1
  call $~lib/array/Array<~lib/string/String>#__set
  local.get $0
  call $assembly/indexer/ProtoruneRuneId/ProtoruneRuneId.encode
  call $assembly/test/_test_ProtoruneRuneId
 )
 (func $assembly/test/test_ProtoruneRuneId5
  (local $0 i32)
  (local $1 i32)
  i32.const 8
  i32.const 2
  i32.const 59
  i32.const 0
  call $~lib/rt/__newArray
  local.tee $0
  i32.load offset=4
  drop
  i32.const 16
  i32.const 9
  call $~lib/rt/stub/__new
  local.tee $1
  i64.const 50000000
  i64.store
  local.get $1
  i64.const 0
  i64.store offset=8
  local.get $0
  i32.const 0
  local.get $1
  call $~lib/array/Array<~lib/string/String>#__set
  i32.const 16
  i32.const 9
  call $~lib/rt/stub/__new
  local.tee $1
  i64.const 1000000000
  i64.store
  local.get $1
  i64.const 0
  i64.store offset=8
  local.get $0
  i32.const 1
  local.get $1
  call $~lib/array/Array<~lib/string/String>#__set
  i32.const 16
  i32.const 9
  call $~lib/rt/stub/__new
  local.tee $1
  i64.const 1500000000
  i64.store
  local.get $1
  i64.const 0
  i64.store offset=8
  local.get $0
  i32.const 2
  local.get $1
  call $~lib/array/Array<~lib/string/String>#__set
  i32.const 16
  i32.const 9
  call $~lib/rt/stub/__new
  local.tee $1
  i64.const 2000000000
  i64.store
  local.get $1
  i64.const 0
  i64.store offset=8
  local.get $0
  i32.const 3
  local.get $1
  call $~lib/array/Array<~lib/string/String>#__set
  i32.const 16
  i32.const 9
  call $~lib/rt/stub/__new
  local.tee $1
  i64.const 50000000
  i64.store
  local.get $1
  i64.const 0
  i64.store offset=8
  local.get $0
  i32.const 4
  local.get $1
  call $~lib/array/Array<~lib/string/String>#__set
  i32.const 16
  i32.const 9
  call $~lib/rt/stub/__new
  local.tee $1
  i64.const 1000000000
  i64.store
  local.get $1
  i64.const 0
  i64.store offset=8
  local.get $0
  i32.const 5
  local.get $1
  call $~lib/array/Array<~lib/string/String>#__set
  i32.const 16
  i32.const 9
  call $~lib/rt/stub/__new
  local.tee $1
  i64.const 1500000000
  i64.store
  local.get $1
  i64.const 0
  i64.store offset=8
  local.get $0
  i32.const 6
  local.get $1
  call $~lib/array/Array<~lib/string/String>#__set
  i32.const 16
  i32.const 9
  call $~lib/rt/stub/__new
  local.tee $1
  i64.const 2000000000
  i64.store
  local.get $1
  i64.const 0
  i64.store offset=8
  local.get $0
  i32.const 7
  local.get $1
  call $~lib/array/Array<~lib/string/String>#__set
  local.get $0
  call $assembly/indexer/ProtoruneRuneId/ProtoruneRuneId.encode
  call $assembly/test/_test_ProtoruneRuneId
 )
 (func $assembly/test/testProtomessageDepositAll
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  call $~lib/metashrew-as/assembly/indexer/index/__host_len
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.tee $0
  call $~lib/metashrew-as/assembly/indexer/index/__load_input
  local.get $0
  local.get $0
  i32.const 20
  i32.sub
  i32.load offset=16
  call $~lib/metashrew-as/assembly/utils/box/Box#constructor
  local.tee $0
  i32.load
  local.tee $2
  i32.load
  local.set $1
  local.get $0
  local.get $2
  i32.const 4
  i32.add
  i32.store
  local.get $0
  local.get $0
  i32.load offset=4
  i32.const 4
  i32.sub
  i32.store offset=4
  local.get $1
  i32.const 839994
  i32.lt_u
  if
   call $~lib/metashrew-as/assembly/indexer/index/_flush
   return
  end
  local.get $0
  call $~lib/metashrew-as/assembly/blockdata/block/Block#constructor
  local.set $2
  local.get $1
  i32.const 840000
  i32.ge_u
  if
   i32.const 0
   i32.const 39
   call $~lib/rt/stub/__new
   i32.eqz
   if
    i32.const 0
    i32.const 0
    call $~lib/rt/stub/__new
    drop
   end
   local.get $2
   call $~lib/metashrew-spendables/assembly/indexer/SpendablesIndex#indexBlock
  end
  i32.const 2
  i32.const 116
  call $~lib/rt/stub/__new
  local.tee $0
  i32.eqz
  if
   i32.const 2
   i32.const 118
   call $~lib/rt/stub/__new
   local.set $0
  end
  local.get $0
  i32.const 0
  i32.store8
  local.get $0
  i32.const 0
  i32.store8 offset=1
  local.get $0
  call $~lib/metashrew-runes/assembly/indexer/Indexer/RunesIndex#constructor
  local.tee $0
  i32.const 0
  i32.store8
  local.get $0
  i32.const 0
  i32.store8 offset=1
  local.get $0
  local.get $1
  local.get $2
  call $assembly/indexer/Indexer/Protorune<assembly/indexer/protomessage/MessageContext/MessageContext>#indexBlock
  call $~lib/metashrew-as/assembly/indexer/index/_flush
 )
 (func $assembly/test/testProtomessageForwardAll
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  call $~lib/metashrew-as/assembly/indexer/index/__host_len
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.tee $0
  call $~lib/metashrew-as/assembly/indexer/index/__load_input
  local.get $0
  local.get $0
  i32.const 20
  i32.sub
  i32.load offset=16
  call $~lib/metashrew-as/assembly/utils/box/Box#constructor
  local.tee $0
  i32.load
  local.tee $2
  i32.load
  local.set $1
  local.get $0
  local.get $2
  i32.const 4
  i32.add
  i32.store
  local.get $0
  local.get $0
  i32.load offset=4
  i32.const 4
  i32.sub
  i32.store offset=4
  local.get $1
  i32.const 839994
  i32.lt_u
  if
   call $~lib/metashrew-as/assembly/indexer/index/_flush
   return
  end
  local.get $0
  call $~lib/metashrew-as/assembly/blockdata/block/Block#constructor
  local.set $2
  local.get $1
  i32.const 840000
  i32.ge_u
  if
   i32.const 0
   i32.const 39
   call $~lib/rt/stub/__new
   i32.eqz
   if
    i32.const 0
    i32.const 0
    call $~lib/rt/stub/__new
    drop
   end
   local.get $2
   call $~lib/metashrew-spendables/assembly/indexer/SpendablesIndex#indexBlock
  end
  i32.const 2
  i32.const 119
  call $~lib/rt/stub/__new
  local.tee $0
  i32.eqz
  if
   i32.const 2
   i32.const 121
   call $~lib/rt/stub/__new
   local.set $0
  end
  local.get $0
  i32.const 0
  i32.store8
  local.get $0
  i32.const 0
  i32.store8 offset=1
  local.get $0
  call $~lib/metashrew-runes/assembly/indexer/Indexer/RunesIndex#constructor
  local.tee $0
  i32.const 0
  i32.store8
  local.get $0
  i32.const 0
  i32.store8 offset=1
  local.get $0
  local.get $1
  local.get $2
  call $assembly/indexer/Indexer/Protorune<assembly/indexer/protomessage/MessageContext/MessageContext>#indexBlock
  call $~lib/metashrew-as/assembly/indexer/index/_flush
 )
 (func $assembly/test/testSimpleProtorune
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  call $~lib/metashrew-as/assembly/indexer/index/__host_len
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.tee $0
  call $~lib/metashrew-as/assembly/indexer/index/__load_input
  local.get $0
  local.get $0
  i32.const 20
  i32.sub
  i32.load offset=16
  call $~lib/metashrew-as/assembly/utils/box/Box#constructor
  local.tee $0
  i32.load
  local.tee $2
  i32.load
  local.set $1
  local.get $0
  local.get $2
  i32.const 4
  i32.add
  i32.store
  local.get $0
  local.get $0
  i32.load offset=4
  i32.const 4
  i32.sub
  i32.store offset=4
  local.get $1
  i32.const 839994
  i32.lt_u
  if
   call $~lib/metashrew-as/assembly/indexer/index/_flush
   return
  end
  local.get $0
  call $~lib/metashrew-as/assembly/blockdata/block/Block#constructor
  local.set $2
  local.get $1
  i32.const 840000
  i32.ge_u
  if
   i32.const 0
   i32.const 39
   call $~lib/rt/stub/__new
   i32.eqz
   if
    i32.const 0
    i32.const 0
    call $~lib/rt/stub/__new
    drop
   end
   local.get $2
   call $~lib/metashrew-spendables/assembly/indexer/SpendablesIndex#indexBlock
  end
  i32.const 2
  i32.const 122
  call $~lib/rt/stub/__new
  local.tee $0
  i32.eqz
  if
   i32.const 2
   i32.const 124
   call $~lib/rt/stub/__new
   local.set $0
  end
  local.get $0
  i32.const 0
  i32.store8
  local.get $0
  i32.const 0
  i32.store8 offset=1
  local.get $0
  call $~lib/metashrew-runes/assembly/indexer/Indexer/RunesIndex#constructor
  local.tee $0
  i32.const 0
  i32.store8
  local.get $0
  i32.const 0
  i32.store8 offset=1
  local.get $0
  local.get $1
  local.get $2
  call $assembly/indexer/Indexer/Protorune<assembly/indexer/protomessage/MessageContext/MessageContext>#indexBlock
  call $~lib/metashrew-as/assembly/indexer/index/_flush
 )
 (func $assembly/test/testRefundProtorune
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  call $~lib/metashrew-as/assembly/indexer/index/__host_len
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.tee $0
  call $~lib/metashrew-as/assembly/indexer/index/__load_input
  local.get $0
  local.get $0
  i32.const 20
  i32.sub
  i32.load offset=16
  call $~lib/metashrew-as/assembly/utils/box/Box#constructor
  local.tee $0
  i32.load
  local.tee $2
  i32.load
  local.set $1
  local.get $0
  local.get $2
  i32.const 4
  i32.add
  i32.store
  local.get $0
  local.get $0
  i32.load offset=4
  i32.const 4
  i32.sub
  i32.store offset=4
  local.get $1
  i32.const 839994
  i32.lt_u
  if
   call $~lib/metashrew-as/assembly/indexer/index/_flush
   return
  end
  local.get $0
  call $~lib/metashrew-as/assembly/blockdata/block/Block#constructor
  local.set $2
  local.get $1
  i32.const 840000
  i32.ge_u
  if
   i32.const 0
   i32.const 39
   call $~lib/rt/stub/__new
   i32.eqz
   if
    i32.const 0
    i32.const 0
    call $~lib/rt/stub/__new
    drop
   end
   local.get $2
   call $~lib/metashrew-spendables/assembly/indexer/SpendablesIndex#indexBlock
  end
  i32.const 2
  i32.const 125
  call $~lib/rt/stub/__new
  local.tee $0
  i32.eqz
  if
   i32.const 2
   i32.const 127
   call $~lib/rt/stub/__new
   local.set $0
  end
  local.get $0
  i32.const 0
  i32.store8
  local.get $0
  i32.const 0
  i32.store8 offset=1
  local.get $0
  call $~lib/metashrew-runes/assembly/indexer/Indexer/RunesIndex#constructor
  local.tee $0
  i32.const 0
  i32.store8
  local.get $0
  i32.const 0
  i32.store8 offset=1
  local.get $0
  local.get $1
  local.get $2
  call $assembly/indexer/Indexer/Protorune<assembly/indexer/protomessage/MessageContext/MessageContext>#indexBlock
  call $~lib/metashrew-as/assembly/indexer/index/_flush
 )
 (func $assembly/test/testEtching
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  call $~lib/metashrew-as/assembly/indexer/index/__host_len
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.tee $0
  call $~lib/metashrew-as/assembly/indexer/index/__load_input
  local.get $0
  local.get $0
  i32.const 20
  i32.sub
  i32.load offset=16
  call $~lib/metashrew-as/assembly/utils/box/Box#constructor
  local.tee $1
  i32.load
  local.tee $0
  i32.load
  local.set $2
  local.get $1
  local.get $0
  i32.const 4
  i32.add
  i32.store
  local.get $1
  local.get $1
  i32.load offset=4
  i32.const 4
  i32.sub
  i32.store offset=4
  local.get $2
  i32.const 839994
  i32.lt_u
  if
   call $~lib/metashrew-as/assembly/indexer/index/_flush
   return
  end
  local.get $1
  call $~lib/metashrew-as/assembly/blockdata/block/Block#constructor
  local.set $0
  local.get $2
  i32.const 840000
  i32.ge_u
  if
   i32.const 0
   i32.const 39
   call $~lib/rt/stub/__new
   i32.eqz
   if
    i32.const 0
    i32.const 0
    call $~lib/rt/stub/__new
    drop
   end
   local.get $0
   call $~lib/metashrew-spendables/assembly/indexer/SpendablesIndex#indexBlock
  end
  i32.const 1
  i32.const 1
  call $assembly/indexer/Indexer/DefaultProtorune#constructor
  local.get $2
  local.get $0
  call $assembly/indexer/Indexer/Protorune<assembly/indexer/protomessage/MessageContext/MessageContext>#indexBlock
  call $~lib/metashrew-as/assembly/indexer/index/_flush
 )
 (func $~lib/rt/stub/__unpin (param $0 i32)
 )
 (func $~lib/rt/stub/__collect
 )
 (func $assembly/utils/concatByteArray15BytesPerU128~anonymous|0 (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  local.get $1
  local.get $2
  i32.load offset=12
  i32.const 1
  i32.sub
  i32.eq
  if
   local.get $0
   call $~lib/metashrew-runes/assembly/utils/toArrayBuffer
   call $~lib/metashrew-as/assembly/utils/utils/reverse
   call $assembly/utils/alignArrayBuffer
   local.set $0
  else
   local.get $0
   call $~lib/metashrew-runes/assembly/utils/toArrayBuffer
   call $~lib/metashrew-as/assembly/utils/utils/reverse
   local.tee $0
   local.get $0
   i32.const 20
   i32.sub
   i32.load offset=16
   call $~lib/metashrew-as/assembly/utils/box/Box#constructor
   local.tee $0
   i32.load
   local.get $0
   i32.load offset=4
   call $~lib/metashrew-as/assembly/utils/box/Box#constructor
   local.tee $0
   local.get $0
   i32.load
   i32.const 1
   i32.add
   i32.store
   local.get $0
   local.get $0
   i32.load offset=4
   i32.const 1
   i32.sub
   i32.store offset=4
  end
  local.get $0
 )
 (func $assembly/indexer/Protostone/Protostone.parseIntoProtostone (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i64)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  call $"~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#constructor"
  local.set $4
  call $~lib/array/Array<~lib/staticarray/StaticArray<~lib/as-bignum/assembly/integer/u128/u128>>#constructor
  local.set $6
  loop $while-continue|0
   local.get $0
   i32.load offset=4
   if
    i32.const 16
    i32.const 9
    call $~lib/rt/stub/__new
    local.tee $3
    i64.const 0
    i64.store
    local.get $3
    i64.const 0
    i64.store offset=8
    local.get $0
    local.get $3
    call $~lib/metashrew-runes/assembly/leb128/readULEB128ToU128
    local.tee $7
    i32.const -1
    i32.eq
    if
     i32.const 0
     return
    end
    local.get $0
    local.get $7
    local.get $0
    i32.load
    i32.add
    i32.store
    local.get $0
    local.get $0
    i32.load offset=4
    local.get $7
    i32.sub
    i32.store offset=4
    local.get $3
    i64.load
    local.tee $5
    i64.eqz
    if
     loop $while-continue|1
      local.get $0
      i32.load offset=4
      if
       i32.const 16
       i32.const 68
       call $~lib/rt/stub/__new
       local.tee $8
       i64.const 0
       i64.store align=1
       local.get $8
       i64.const 0
       i64.store offset=8 align=1
       i32.const 0
       local.set $3
       loop $for-loop|2
        local.get $3
        i32.const 4
        i32.lt_s
        if
         i32.const 16
         i32.const 9
         call $~lib/rt/stub/__new
         local.tee $7
         i64.const 0
         i64.store
         local.get $7
         i64.const 0
         i64.store offset=8
         local.get $0
         local.get $7
         call $~lib/metashrew-runes/assembly/leb128/readULEB128ToU128
         local.tee $9
         i32.const -1
         i32.eq
         if
          i32.const 0
          return
         end
         local.get $0
         local.get $9
         local.get $0
         i32.load
         i32.add
         i32.store
         local.get $0
         local.get $0
         i32.load offset=4
         local.get $9
         i32.sub
         i32.store offset=4
         local.get $8
         local.get $3
         local.get $7
         call $~lib/staticarray/StaticArray<~lib/as-bignum/assembly/integer/u128/u128>#__set
         local.get $3
         i32.const 1
         i32.add
         local.set $3
         br $for-loop|2
        end
       end
       local.get $6
       local.get $8
       call $~lib/array/Array<~lib/array/Array<u8>>#push
       drop
       br $while-continue|1
      end
     end
    else
     i32.const 16
     i32.const 9
     call $~lib/rt/stub/__new
     local.tee $7
     i64.const 0
     i64.store
     local.get $7
     i64.const 0
     i64.store offset=8
     local.get $0
     local.get $7
     call $~lib/metashrew-runes/assembly/leb128/readULEB128ToU128
     local.tee $3
     i32.const -1
     i32.eq
     if
      i32.const 0
      return
     end
     local.get $0
     local.get $3
     local.get $0
     i32.load
     i32.add
     i32.store
     local.get $0
     local.get $0
     i32.load offset=4
     local.get $3
     i32.sub
     i32.store offset=4
     local.get $4
     i32.load
     local.get $4
     i32.load offset=4
     local.get $5
     i32.wrap_i64
     i32.const -1028477379
     i32.mul
     i32.const 374761401
     i32.add
     i32.const 17
     i32.rotl
     i32.const 668265263
     i32.mul
     local.get $5
     i64.const 32
     i64.shr_u
     i32.wrap_i64
     i32.const -1028477379
     i32.mul
     i32.add
     i32.const 17
     i32.rotl
     i32.const 668265263
     i32.mul
     local.tee $3
     local.get $3
     i32.const 15
     i32.shr_u
     i32.xor
     i32.const -2048144777
     i32.mul
     local.tee $3
     local.get $3
     i32.const 13
     i32.shr_u
     i32.xor
     i32.const -1028477379
     i32.mul
     local.tee $3
     local.get $3
     i32.const 16
     i32.shr_u
     i32.xor
     i32.and
     i32.const 2
     i32.shl
     i32.add
     i32.load
     local.set $3
     block $"__inlined_func$~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#find$3460"
      loop $while-continue|01
       local.get $3
       if
        local.get $3
        i32.load offset=12
        local.tee $8
        i32.const 1
        i32.and
        if (result i32)
         i32.const 0
        else
         local.get $5
         local.get $3
         i64.load
         i64.eq
        end
        br_if $"__inlined_func$~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#find$3460"
        local.get $8
        i32.const -2
        i32.and
        local.set $3
        br $while-continue|01
       end
      end
      i32.const 0
      local.set $3
     end
     local.get $3
     if
      local.get $4
      local.get $5
      call $"~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#get"
      local.set $3
     else
      local.get $4
      local.get $5
      i32.const 0
      call $~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>#constructor
      local.tee $3
      call $"~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#set"
     end
     local.get $3
     local.get $7
     call $~lib/array/Array<~lib/array/Array<u8>>#push
     drop
    end
    br $while-continue|0
   end
  end
  i32.const 26
  i32.const 128
  call $~lib/rt/stub/__new
  local.tee $0
  i32.const 0
  i32.store
  local.get $0
  i32.const 0
  i32.store offset=4
  local.get $0
  i32.const -1
  i32.store offset=12
  i32.const 16
  i32.const 9
  call $~lib/rt/stub/__new
  local.tee $3
  i64.const 0
  i64.store
  local.get $3
  i64.const 0
  i64.store offset=8
  local.get $0
  local.get $3
  i32.store offset=16
  local.get $0
  i32.const 0
  i32.store offset=20
  local.get $0
  i32.const 0
  i32.store8 offset=24
  local.get $0
  i32.const 0
  i32.store8 offset=25
  local.get $0
  local.get $4
  local.get $6
  local.get $2
  call $~lib/metashrew-runes/assembly/indexer/RunestoneMessage/RunestoneMessage#constructor
  local.tee $0
  local.get $4
  i32.store
  local.get $0
  local.get $6
  i32.store offset=4
  local.get $0
  local.get $1
  i32.store offset=16
  local.get $0
  local.get $1
  call $assembly/indexer/tables/protorune/ProtoruneTable.for
  i32.store offset=20
  local.get $0
 )
 (func $assembly/indexer/Protostone/Protostone.parseFromFieldData (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i64)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  local.get $0
  i32.const 10800
  call $~lib/array/Array<~lib/arraybuffer/ArrayBuffer>#map<~lib/metashrew-as/assembly/utils/box/Box>
  call $~lib/metashrew-as/assembly/utils/box/Box.concat
  local.tee $0
  local.get $0
  i32.const 20
  i32.sub
  i32.load offset=16
  call $~lib/metashrew-as/assembly/utils/box/Box#constructor
  local.set $5
  i32.const 16
  i32.const 130
  call $~lib/rt/stub/__new
  local.tee $0
  i32.const 0
  i32.store
  local.get $0
  i32.const 0
  i32.store offset=4
  local.get $0
  i32.const 0
  i32.store offset=8
  local.get $0
  i32.const 0
  i32.store offset=12
  i32.const 32
  i32.const 1
  call $~lib/rt/stub/__new
  local.tee $2
  i32.const 0
  i32.const 32
  memory.fill
  local.get $0
  local.get $2
  i32.store
  local.get $0
  local.get $2
  i32.store offset=4
  local.get $0
  i32.const 32
  i32.store offset=8
  local.get $0
  i32.const 0
  i32.store offset=12
  loop $while-continue|0
   local.get $5
   i32.load offset=4
   if
    block $while-break|0
     i32.const 16
     i32.const 9
     call $~lib/rt/stub/__new
     local.tee $4
     i64.const 0
     i64.store
     local.get $4
     i64.const 0
     i64.store offset=8
     local.get $5
     local.get $4
     call $~lib/metashrew-runes/assembly/leb128/readULEB128ToU128
     local.set $2
     local.get $4
     i64.load
     local.get $4
     i64.load offset=8
     i64.or
     i64.eqz
     br_if $while-break|0
     local.get $2
     i32.const -1
     i32.eq
     if
      i32.const 0
      return
     end
     local.get $5
     local.get $2
     local.get $5
     i32.load
     i32.add
     i32.store
     local.get $5
     local.get $5
     i32.load offset=4
     local.get $2
     i32.sub
     i32.store offset=4
     i32.const 16
     i32.const 9
     call $~lib/rt/stub/__new
     local.tee $2
     i64.const 0
     i64.store
     local.get $2
     i64.const 0
     i64.store offset=8
     local.get $5
     local.get $2
     call $~lib/metashrew-runes/assembly/leb128/readULEB128ToU128
     local.tee $6
     i32.const -1
     i32.eq
     if
      i32.const 0
      return
     end
     local.get $5
     local.get $6
     local.get $5
     i32.load
     i32.add
     i32.store
     local.get $5
     local.get $5
     i32.load offset=4
     local.get $6
     i32.sub
     i32.store offset=4
     local.get $2
     i64.load
     local.set $3
     local.get $5
     i32.load
     local.get $5
     i32.load offset=4
     call $~lib/metashrew-as/assembly/utils/box/Box#constructor
     local.tee $6
     i32.load
     local.set $7
     i32.const 0
     local.set $2
     loop $for-loop|0
      local.get $2
      local.get $3
      i32.wrap_i64
      i32.lt_s
      if
       i32.const 16
       i32.const 9
       call $~lib/rt/stub/__new
       local.tee $8
       i64.const 0
       i64.store
       local.get $8
       i64.const 0
       i64.store offset=8
       local.get $6
       local.get $6
       local.get $8
       call $~lib/metashrew-runes/assembly/leb128/readULEB128ToU128
       local.tee $8
       local.get $6
       i32.load
       i32.add
       i32.store
       local.get $6
       local.get $6
       i32.load offset=4
       local.get $8
       i32.sub
       i32.store offset=4
       local.get $2
       i32.const 1
       i32.add
       local.set $2
       br $for-loop|0
      end
     end
     local.get $6
     i32.load
     local.get $7
     i32.sub
     local.tee $2
     local.get $5
     i32.load
     local.tee $6
     i32.add
     local.tee $7
     local.get $6
     local.get $5
     i32.load offset=4
     i32.add
     i32.gt_u
     if
      i32.const 10832
      i32.const 10896
      i32.const 46
      i32.const 7
      call $~lib/builtins/abort
      unreachable
     end
     local.get $0
     local.get $5
     i32.load
     local.tee $6
     local.get $7
     local.get $6
     i32.sub
     call $~lib/metashrew-as/assembly/utils/box/Box#constructor
     local.get $4
     local.get $1
     call $assembly/indexer/Protostone/Protostone.parseIntoProtostone
     call $~lib/array/Array<~lib/array/Array<u8>>#push
     drop
     local.get $5
     local.get $2
     local.get $5
     i32.load
     i32.add
     i32.store
     local.get $5
     local.get $5
     i32.load offset=4
     local.get $2
     i32.sub
     i32.store offset=4
     br $while-continue|0
    end
   end
  end
  local.get $0
 )
 (func $assembly/indexer/Protostone/ProtostoneTable#constructor (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  i32.const 8
  i32.const 129
  call $~lib/rt/stub/__new
  local.tee $2
  i32.const 0
  i32.store
  local.get $2
  i32.const 0
  i32.store offset=4
  local.get $2
  local.get $0
  i32.store
  local.get $2
  local.get $1
  i32.store offset=4
  local.get $2
 )
 (func $assembly/indexer/Protostone/Protostone#protostones (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  local.get $0
  i32.load
  local.tee $2
  i32.load
  local.get $2
  i32.load offset=4
  i32.const -1751861268
  i32.and
  i32.const 2
  i32.shl
  i32.add
  i32.load
  local.set $2
  block $"__inlined_func$~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#find$3468"
   loop $while-continue|0
    local.get $2
    if
     local.get $2
     i32.load offset=12
     local.tee $3
     i32.const 1
     i32.and
     if (result i32)
      i32.const 0
     else
      local.get $2
      i64.load
      i64.const 16383
      i64.eq
     end
     br_if $"__inlined_func$~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#find$3468"
     local.get $3
     i32.const -2
     i32.and
     local.set $2
     br $while-continue|0
    end
   end
   i32.const 0
   local.set $2
  end
  local.get $2
  i32.eqz
  if
   i32.const 0
   call $~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>#constructor
   local.get $0
   i32.load offset=8
   call $assembly/indexer/Protostone/Protostone.parseFromFieldData
   local.get $1
   call $assembly/indexer/Protostone/ProtostoneTable#constructor
   return
  end
  local.get $0
  i32.load
  i64.const 16383
  call $"~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#get"
  local.get $0
  i32.load offset=8
  call $assembly/indexer/Protostone/Protostone.parseFromFieldData
  local.get $1
  call $assembly/indexer/Protostone/ProtostoneTable#constructor
 )
 (func $assembly/indexer/Protostone/ProtostoneTable#burns~anonymous|0 (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  local.get $0
  i32.load offset=16
  local.set $2
  i32.const 16
  i32.const 9
  call $~lib/rt/stub/__new
  local.tee $1
  i64.const 13
  i64.store
  local.get $1
  i64.const 0
  i64.store offset=8
  local.get $2
  i64.load offset=8
  local.get $1
  i64.load offset=8
  i64.eq
  if (result i32)
   local.get $2
   i64.load
   local.get $1
   i64.load
   i64.eq
  else
   i32.const 0
  end
  if (result i32)
   local.get $0
   i32.load
   local.tee $0
   i32.load
   local.get $0
   i32.load offset=4
   i32.const -2715771
   i32.and
   i32.const 2
   i32.shl
   i32.add
   i32.load
   local.set $0
   block $"__inlined_func$~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#find$3469"
    loop $while-continue|0
     local.get $0
     if
      local.get $0
      i32.load offset=12
      local.tee $1
      i32.const 1
      i32.and
      if (result i32)
       i32.const 0
      else
       local.get $0
       i64.load
       i64.const 83
       i64.eq
      end
      br_if $"__inlined_func$~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#find$3469"
      local.get $1
      i32.const -2
      i32.and
      local.set $0
      br $while-continue|0
     end
    end
    i32.const 0
    local.set $0
   end
   local.get $0
   i32.const 0
   i32.ne
  else
   i32.const 0
  end
 )
 (func $assembly/indexer/Protoburn/Protoburn#constructor~anonymous|0 (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  local.get $0
  i64.load
  i32.wrap_i64
 )
 (func $assembly/indexer/Protostone/ProtostoneTable#burns~anonymous|1 (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  i32.const 2
  i32.const 2
  i32.const 59
  i32.const 0
  call $~lib/rt/__newArray
  local.tee $2
  i32.load offset=4
  drop
  local.get $2
  i32.const 0
  local.get $0
  i32.load
  i64.const 83
  call $"~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#get"
  i32.const 0
  call $~lib/array/Array<~lib/array/Array<u8>>#__get
  call $~lib/array/Array<~lib/string/String>#__set
  local.get $2
  i32.const 1
  local.get $0
  i32.load
  i64.const 91
  call $"~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#get"
  i32.const 0
  call $~lib/array/Array<~lib/array/Array<u8>>#__get
  call $~lib/array/Array<~lib/string/String>#__set
  local.get $0
  i32.load
  local.tee $1
  i32.load
  local.get $1
  i32.load offset=4
  i32.const -1529342340
  i32.and
  i32.const 2
  i32.shl
  i32.add
  i32.load
  local.set $1
  block $"__inlined_func$~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#find$3478"
   loop $while-continue|0
    local.get $1
    if
     local.get $1
     i32.load offset=12
     local.tee $3
     i32.const 1
     i32.and
     if (result i32)
      i32.const 0
     else
      local.get $1
      i64.load
      i64.const 95
      i64.eq
     end
     br_if $"__inlined_func$~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#find$3478"
     local.get $3
     i32.const -2
     i32.and
     local.set $1
     br $while-continue|0
    end
   end
   i32.const 0
   local.set $1
  end
  local.get $1
  if (result i32)
   local.get $0
   i32.load
   i64.const 95
   call $"~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#get"
  else
   i32.const 0
   i32.const 2
   i32.const 59
   i32.const 11072
   call $~lib/rt/__newArray
  end
  local.set $1
  local.get $2
  i32.load offset=12
  local.tee $0
  local.get $1
  i32.load offset=12
  local.tee $3
  i32.add
  local.tee $4
  i32.const 268435455
  i32.gt_u
  if
   i32.const 2608
   i32.const 5344
   i32.const 224
   i32.const 60
   call $~lib/builtins/abort
   unreachable
  end
  local.get $4
  i32.const 2
  i32.const 59
  i32.const 0
  call $~lib/rt/__newArray
  local.tee $4
  i32.load offset=4
  local.set $5
  local.get $0
  i32.const 2
  i32.shl
  local.set $6
  local.get $2
  i32.load offset=4
  local.set $2
  i32.const 0
  local.set $0
  loop $for-loop|0
   local.get $0
   local.get $6
   i32.lt_u
   if
    local.get $0
    local.get $5
    i32.add
    local.get $0
    local.get $2
    i32.add
    i32.load
    i32.store
    local.get $0
    i32.const 4
    i32.add
    local.set $0
    br $for-loop|0
   end
  end
  local.get $5
  local.get $6
  i32.add
  local.set $2
  local.get $1
  i32.load offset=4
  local.set $1
  local.get $3
  i32.const 2
  i32.shl
  local.set $3
  i32.const 0
  local.set $0
  loop $for-loop|1
   local.get $0
   local.get $3
   i32.lt_u
   if
    local.get $0
    local.get $2
    i32.add
    local.get $0
    local.get $1
    i32.add
    i32.load
    i32.store
    local.get $0
    i32.const 4
    i32.add
    local.set $0
    br $for-loop|1
   end
  end
  i32.const 16
  i32.const 131
  call $~lib/rt/stub/__new
  local.tee $2
  i32.const 0
  i32.store
  local.get $2
  i32.const 0
  i32.store offset=4
  local.get $2
  i32.const 0
  i32.store offset=8
  local.get $2
  i32.const 0
  i32.store offset=12
  local.get $4
  i32.const 0
  call $~lib/array/Array<~lib/array/Array<u8>>#__get
  local.set $3
  local.get $2
  local.get $4
  i32.const 1
  call $~lib/array/Array<~lib/array/Array<u8>>#__get
  i64.load
  i64.store32 offset=4
  local.get $2
  local.get $3
  i32.store
  i32.const 1
  global.set $~argumentsLength
  i32.const 2
  local.get $4
  i32.load offset=12
  local.tee $0
  local.get $0
  i32.const 2
  i32.gt_s
  select
  local.set $1
  local.get $0
  local.get $1
  i32.sub
  local.tee $0
  i32.const 0
  local.get $0
  i32.const 0
  i32.gt_s
  select
  local.tee $0
  i32.const 2
  i32.const 59
  i32.const 0
  call $~lib/rt/__newArray
  local.tee $5
  i32.load offset=4
  local.set $6
  local.get $4
  i32.load offset=4
  local.get $1
  i32.const 2
  i32.shl
  i32.add
  local.set $4
  i32.const 0
  local.set $1
  local.get $0
  i32.const 2
  i32.shl
  local.set $0
  loop $while-continue|00
   local.get $0
   local.get $1
   i32.gt_u
   if
    local.get $1
    local.get $6
    i32.add
    local.get $1
    local.get $4
    i32.add
    i32.load
    i32.store
    local.get $1
    i32.const 4
    i32.add
    local.set $1
    br $while-continue|00
   end
  end
  local.get $5
  i32.load offset=12
  local.tee $4
  i32.const 2
  i32.const 6
  i32.const 0
  call $~lib/rt/__newArray
  local.tee $6
  i32.load offset=4
  local.set $7
  i32.const 0
  local.set $1
  loop $for-loop|01
   local.get $1
   local.get $4
   local.get $5
   i32.load offset=12
   local.tee $0
   local.get $0
   local.get $4
   i32.gt_s
   select
   i32.lt_s
   if
    local.get $1
    i32.const 2
    i32.shl
    local.tee $8
    local.get $5
    i32.load offset=4
    i32.add
    i32.load
    local.set $0
    i32.const 3
    global.set $~argumentsLength
    local.get $7
    local.get $8
    i32.add
    local.get $0
    local.get $1
    local.get $5
    i32.const 11040
    i32.load
    call_indirect (type $2)
    i32.store
    local.get $1
    i32.const 1
    i32.add
    local.set $1
    br $for-loop|01
   end
  end
  local.get $2
  local.get $6
  i32.store offset=8
  local.get $2
  local.get $3
  call $assembly/indexer/tables/protorune/ProtoruneTable.for
  i32.store offset=12
  local.get $2
 )
 (func $assembly/indexer/Protostone/ProtostoneTable#burns (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  local.get $0
  i32.load
  local.set $3
  i32.const 0
  i32.const 2
  i32.const 130
  i32.const 0
  call $~lib/rt/__newArray
  local.set $0
  local.get $3
  i32.load offset=12
  local.set $4
  loop $for-loop|0
   local.get $1
   local.get $4
   local.get $3
   i32.load offset=12
   local.tee $5
   local.get $4
   local.get $5
   i32.lt_s
   select
   i32.lt_s
   if
    local.get $3
    i32.load offset=4
    local.get $1
    i32.const 2
    i32.shl
    i32.add
    i32.load
    local.set $5
    i32.const 3
    global.set $~argumentsLength
    local.get $5
    local.get $1
    local.get $3
    i32.const 11008
    i32.load
    call_indirect (type $2)
    if
     local.get $0
     local.get $5
     call $~lib/array/Array<~lib/array/Array<u8>>#push
     drop
    end
    local.get $1
    i32.const 1
    i32.add
    local.set $1
    br $for-loop|0
   end
  end
  local.get $0
  i32.load offset=12
  local.tee $3
  i32.const 2
  i32.const 132
  i32.const 0
  call $~lib/rt/__newArray
  local.tee $4
  i32.load offset=4
  local.set $5
  loop $for-loop|00
   local.get $2
   local.get $3
   local.get $0
   i32.load offset=12
   local.tee $1
   local.get $1
   local.get $3
   i32.gt_s
   select
   i32.lt_s
   if
    local.get $2
    i32.const 2
    i32.shl
    local.tee $1
    local.get $0
    i32.load offset=4
    i32.add
    i32.load
    local.set $6
    i32.const 3
    global.set $~argumentsLength
    local.get $1
    local.get $5
    i32.add
    local.get $6
    local.get $2
    local.get $0
    i32.const 11104
    i32.load
    call_indirect (type $2)
    i32.store
    local.get $2
    i32.const 1
    i32.add
    local.set $2
    br $for-loop|00
   end
  end
  local.get $4
 )
 (func $"~lib/map/Map<u32,bool>#constructor" (result i32)
  (local $0 i32)
  i32.const 24
  i32.const 137
  call $~lib/rt/stub/__new
  local.tee $0
  i32.const 16
  call $~lib/arraybuffer/ArrayBuffer#constructor
  i32.store
  local.get $0
  i32.const 3
  i32.store offset=4
  local.get $0
  i32.const 48
  call $~lib/arraybuffer/ArrayBuffer#constructor
  i32.store offset=8
  local.get $0
  i32.const 4
  i32.store offset=12
  local.get $0
  i32.const 0
  i32.store offset=16
  local.get $0
  i32.const 0
  i32.store offset=20
  local.get $0
 )
 (func $"~lib/map/Map<u32,bool>#set" (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  local.get $0
  i32.load
  local.get $1
  local.tee $2
  i32.const -1028477379
  i32.mul
  i32.const 374761397
  i32.add
  i32.const 17
  i32.rotl
  i32.const 668265263
  i32.mul
  local.tee $1
  i32.const 15
  i32.shr_u
  local.get $1
  i32.xor
  i32.const -2048144777
  i32.mul
  local.tee $1
  i32.const 13
  i32.shr_u
  local.get $1
  i32.xor
  i32.const -1028477379
  i32.mul
  local.tee $1
  i32.const 16
  i32.shr_u
  local.get $1
  i32.xor
  local.tee $7
  local.get $0
  i32.load offset=4
  i32.and
  i32.const 2
  i32.shl
  i32.add
  i32.load
  local.set $1
  block $"__inlined_func$~lib/map/Map<u32,~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet>#find$3488"
   loop $while-continue|0
    local.get $1
    if
     local.get $1
     i32.load offset=8
     local.tee $3
     i32.const 1
     i32.and
     if (result i32)
      i32.const 0
     else
      local.get $1
      i32.load
      local.get $2
      i32.eq
     end
     br_if $"__inlined_func$~lib/map/Map<u32,~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet>#find$3488"
     local.get $3
     i32.const -2
     i32.and
     local.set $1
     br $while-continue|0
    end
   end
   i32.const 0
   local.set $1
  end
  local.get $1
  if
   local.get $1
   i32.const 1
   i32.store8 offset=4
  else
   local.get $0
   i32.load offset=12
   local.tee $1
   local.get $0
   i32.load offset=16
   i32.eq
   if
    local.get $0
    i32.load offset=20
    local.get $1
    i32.const 3
    i32.mul
    i32.const 4
    i32.div_s
    i32.lt_s
    if (result i32)
     local.get $0
     i32.load offset=4
    else
     local.get $0
     i32.load offset=4
     i32.const 1
     i32.shl
     i32.const 1
     i32.or
    end
    local.tee $5
    i32.const 1
    i32.add
    local.tee $1
    i32.const 2
    i32.shl
    call $~lib/arraybuffer/ArrayBuffer#constructor
    local.set $6
    local.get $1
    i32.const 3
    i32.shl
    i32.const 3
    i32.div_s
    local.tee $8
    i32.const 12
    i32.mul
    call $~lib/arraybuffer/ArrayBuffer#constructor
    local.set $3
    local.get $0
    i32.load offset=8
    local.tee $4
    local.get $0
    i32.load offset=16
    i32.const 12
    i32.mul
    i32.add
    local.set $9
    local.get $3
    local.set $1
    loop $while-continue|00
     local.get $4
     local.get $9
     i32.ne
     if
      local.get $4
      i32.load offset=8
      i32.const 1
      i32.and
      i32.eqz
      if
       local.get $1
       local.get $4
       i32.load
       local.tee $10
       i32.store
       local.get $1
       local.get $4
       i32.load8_u offset=4
       i32.store8 offset=4
       local.get $1
       local.get $6
       local.get $10
       i32.const -1028477379
       i32.mul
       i32.const 374761397
       i32.add
       i32.const 17
       i32.rotl
       i32.const 668265263
       i32.mul
       local.tee $10
       i32.const 15
       i32.shr_u
       local.get $10
       i32.xor
       i32.const -2048144777
       i32.mul
       local.tee $10
       i32.const 13
       i32.shr_u
       local.get $10
       i32.xor
       i32.const -1028477379
       i32.mul
       local.tee $10
       i32.const 16
       i32.shr_u
       local.get $10
       i32.xor
       local.get $5
       i32.and
       i32.const 2
       i32.shl
       i32.add
       local.tee $10
       i32.load
       i32.store offset=8
       local.get $10
       local.get $1
       i32.store
       local.get $1
       i32.const 12
       i32.add
       local.set $1
      end
      local.get $4
      i32.const 12
      i32.add
      local.set $4
      br $while-continue|00
     end
    end
    local.get $0
    local.get $6
    i32.store
    local.get $0
    local.get $5
    i32.store offset=4
    local.get $0
    local.get $3
    i32.store offset=8
    local.get $0
    local.get $8
    i32.store offset=12
    local.get $0
    local.get $0
    i32.load offset=20
    i32.store offset=16
   end
   local.get $0
   i32.load offset=8
   local.set $1
   local.get $0
   local.get $0
   i32.load offset=16
   local.tee $3
   i32.const 1
   i32.add
   i32.store offset=16
   local.get $1
   local.get $3
   i32.const 12
   i32.mul
   i32.add
   local.tee $1
   local.get $2
   i32.store
   local.get $1
   i32.const 1
   i32.store8 offset=4
   local.get $0
   local.get $0
   i32.load offset=20
   i32.const 1
   i32.add
   i32.store offset=20
   local.get $1
   local.get $0
   i32.load
   local.get $7
   local.get $0
   i32.load offset=4
   i32.and
   i32.const 2
   i32.shl
   i32.add
   local.tee $0
   i32.load
   i32.store offset=8
   local.get $0
   local.get $1
   i32.store
  end
 )
 (func $assembly/indexer/Indexer/BurnCycle#peek (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  i32.load offset=4
  local.get $1
  local.get $1
  call $~lib/util/hash/HASH<~lib/string/String>
  call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#find"
  i32.eqz
  if
   local.get $0
   i32.load offset=4
   local.get $1
   i32.const 0
   call $"~lib/map/Map<~lib/string/String,i32>#set"
  end
  local.get $0
  i32.load offset=4
  local.get $1
  call $"~lib/map/Map<~lib/string/String,i32>#get"
 )
 (func $assembly/indexer/Indexer/BurnCycle#next (param $0 i32) (param $1 i32)
  (local $2 i32)
  local.get $0
  i32.load offset=4
  local.get $1
  local.get $1
  call $~lib/util/hash/HASH<~lib/string/String>
  call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#find"
  i32.eqz
  if
   local.get $0
   i32.load offset=4
   local.get $1
   i32.const 0
   call $"~lib/map/Map<~lib/string/String,i32>#set"
  end
  local.get $0
  i32.load offset=4
  local.get $1
  call $"~lib/map/Map<~lib/string/String,i32>#get"
  local.set $2
  local.get $0
  i32.load offset=4
  local.get $1
  local.get $2
  i32.const 1
  i32.add
  local.get $0
  i32.load
  i32.rem_s
  call $"~lib/map/Map<~lib/string/String,i32>#set"
 )
 (func $assembly/indexer/Indexer/Protorune<assembly/indexer/protomessage/MessageContext/MessageContext>#processProtoburns<assembly/indexer/Protoburn/Protoburn> (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (param $4 i32) (param $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i64)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (local $12 i32)
  (local $13 i32)
  (local $14 i32)
  (local $15 i32)
  (local $16 i32)
  (local $17 i32)
  (local $18 i32)
  (local $19 i32)
  (local $20 i32)
  (local $21 i64)
  i32.const 12
  i32.const 57
  call $~lib/rt/stub/__new
  call $~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet#constructor
  local.set $9
  local.get $1
  i32.load
  local.get $1
  i32.load offset=4
  local.get $3
  local.tee $6
  i32.const -1028477379
  i32.mul
  i32.const 374761397
  i32.add
  i32.const 17
  i32.rotl
  i32.const 668265263
  i32.mul
  local.tee $3
  local.get $3
  i32.const 15
  i32.shr_u
  i32.xor
  i32.const -2048144777
  i32.mul
  local.tee $3
  local.get $3
  i32.const 13
  i32.shr_u
  i32.xor
  i32.const -1028477379
  i32.mul
  local.tee $3
  local.get $3
  i32.const 16
  i32.shr_u
  i32.xor
  i32.and
  i32.const 2
  i32.shl
  i32.add
  i32.load
  local.set $3
  block $"__inlined_func$~lib/map/Map<u32,~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet>#find$3205"
   loop $while-continue|0
    local.get $3
    if
     local.get $3
     i32.load offset=8
     local.tee $11
     i32.const 1
     i32.and
     if (result i32)
      i32.const 0
     else
      local.get $3
      i32.load
      local.get $6
      i32.eq
     end
     br_if $"__inlined_func$~lib/map/Map<u32,~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet>#find$3205"
     local.get $11
     i32.const -2
     i32.and
     local.set $3
     br $while-continue|0
    end
   end
   i32.const 0
   local.set $3
  end
  local.get $3
  if (result i32)
   local.get $1
   local.get $6
   call $"~lib/map/Map<u32,~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet>#get"
  else
   i32.const 12
   i32.const 57
   call $~lib/rt/stub/__new
   call $~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet#constructor
  end
  local.get $9
  call $~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet#pipe
  local.get $5
  i32.load offset=12
  call $~lib/array/Array<~lib/metashrew-runes/assembly/indexer/Edict/Edict>#constructor
  drop
  local.get $5
  i32.load offset=12
  call $~lib/array/Array<assembly/indexer/ProtoruneBalanceSheet/ProtoruneBalanceSheet>#constructor
  local.set $12
  local.get $5
  i32.load offset=12
  local.set $1
  i32.const 8
  i32.const 136
  call $~lib/rt/stub/__new
  local.tee $15
  i32.const 0
  i32.store
  local.get $15
  i32.const 0
  i32.store offset=4
  local.get $15
  local.get $1
  i32.store
  local.get $15
  call $"~lib/map/Map<~lib/string/String,i32>#constructor"
  i32.store offset=4
  loop $for-loop|0
   local.get $7
   local.get $5
   i32.load offset=12
   i32.lt_s
   if
    local.get $12
    local.get $7
    i32.const 12
    i32.const 57
    call $~lib/rt/stub/__new
    call $~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet#constructor
    call $~lib/array/Array<~lib/string/String>#__set
    local.get $7
    i32.const 1
    i32.add
    local.set $7
    br $for-loop|0
   end
  end
  call $"~lib/map/Map<u32,bool>#constructor"
  local.set $11
  loop $for-loop|1
   local.get $14
   local.get $5
   i32.load offset=12
   i32.lt_s
   if
    local.get $5
    local.get $14
    call $~lib/array/Array<~lib/array/Array<u8>>#__get
    i32.load offset=8
    i32.load offset=12
    i32.const 0
    i32.gt_s
    if
     local.get $5
     local.get $14
     call $~lib/array/Array<~lib/array/Array<u8>>#__get
     i32.load offset=8
     local.set $1
     i32.const 0
     local.set $3
     call $"~lib/map/Map<u32,bool>#constructor"
     local.set $17
     i32.const 0
     call $~lib/array/Array<u32>#constructor
     local.set $18
     loop $for-loop|00
      local.get $3
      local.get $1
      i32.load offset=12
      i32.lt_s
      if
       local.get $1
       local.get $3
       call $~lib/array/Array<u32>#__get
       local.tee $19
       i32.const -1028477379
       i32.mul
       i32.const 374761397
       i32.add
       i32.const 17
       i32.rotl
       i32.const 668265263
       i32.mul
       local.tee $7
       local.get $7
       i32.const 15
       i32.shr_u
       i32.xor
       i32.const -2048144777
       i32.mul
       local.tee $7
       local.get $7
       i32.const 13
       i32.shr_u
       i32.xor
       i32.const -1028477379
       i32.mul
       local.set $7
       local.get $17
       i32.load
       local.get $17
       i32.load offset=4
       local.get $7
       i32.const 16
       i32.shr_u
       local.get $7
       i32.xor
       i32.and
       i32.const 2
       i32.shl
       i32.add
       i32.load
       local.set $7
       block $"__inlined_func$~lib/map/Map<u32,~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet>#find$32050"
        loop $while-continue|01
         local.get $7
         if
          local.get $7
          i32.load offset=8
          local.tee $20
          i32.const 1
          i32.and
          if (result i32)
           i32.const 0
          else
           local.get $7
           i32.load
           local.get $19
           i32.eq
          end
          br_if $"__inlined_func$~lib/map/Map<u32,~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet>#find$32050"
          local.get $20
          i32.const -2
          i32.and
          local.set $7
          br $while-continue|01
         end
        end
        i32.const 0
        local.set $7
       end
       local.get $7
       i32.eqz
       if
        local.get $1
        local.get $3
        call $~lib/array/Array<u32>#__get
        local.set $7
        local.get $18
        local.get $18
        i32.load offset=12
        local.tee $19
        i32.const 1
        i32.add
        local.tee $20
        i32.const 2
        i32.const 1
        call $~lib/array/ensureCapacity
        local.get $18
        i32.load offset=4
        local.get $19
        i32.const 2
        i32.shl
        i32.add
        local.get $7
        i32.store
        local.get $18
        local.get $20
        i32.store offset=12
       end
       local.get $17
       local.get $1
       local.get $3
       call $~lib/array/Array<u32>#__get
       call $"~lib/map/Map<u32,bool>#set"
       local.get $3
       i32.const 1
       i32.add
       local.set $3
       br $for-loop|00
      end
     end
     i32.const 0
     local.set $3
     loop $for-loop|2
      local.get $3
      local.get $18
      i32.load offset=12
      i32.lt_s
      if
       local.get $18
       local.get $3
       call $~lib/array/Array<u32>#__get
       local.tee $7
       i32.const -1028477379
       i32.mul
       i32.const 374761397
       i32.add
       i32.const 17
       i32.rotl
       i32.const 668265263
       i32.mul
       local.tee $1
       local.get $1
       i32.const 15
       i32.shr_u
       i32.xor
       i32.const -2048144777
       i32.mul
       local.tee $1
       local.get $1
       i32.const 13
       i32.shr_u
       i32.xor
       i32.const -1028477379
       i32.mul
       local.set $1
       local.get $11
       i32.load
       local.get $11
       i32.load offset=4
       local.get $1
       i32.const 16
       i32.shr_u
       local.get $1
       i32.xor
       i32.and
       i32.const 2
       i32.shl
       i32.add
       i32.load
       local.set $1
       block $"__inlined_func$~lib/map/Map<u32,~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet>#find$32051"
        loop $while-continue|02
         local.get $1
         if
          local.get $1
          i32.load offset=8
          local.tee $17
          i32.const 1
          i32.and
          if (result i32)
           i32.const 0
          else
           local.get $1
           i32.load
           local.get $7
           i32.eq
          end
          br_if $"__inlined_func$~lib/map/Map<u32,~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet>#find$32051"
          local.get $17
          i32.const -2
          i32.and
          local.set $1
          br $while-continue|02
         end
        end
        i32.const 0
        local.set $1
       end
       local.get $1
       if (result i32)
        i32.const 0
       else
        local.get $18
        local.get $3
        call $~lib/array/Array<u32>#__get
        local.get $4
        i32.load offset=12
        i32.lt_u
       end
       if
        block $for-continue|2
         local.get $18
         local.get $3
         call $~lib/array/Array<u32>#__get
         local.set $7
         local.get $11
         local.get $18
         local.get $3
         call $~lib/array/Array<u32>#__get
         call $"~lib/map/Map<u32,bool>#set"
         local.get $4
         local.get $7
         call $~lib/array/Array<~lib/array/Array<u8>>#__get
         i32.load offset=12
         local.set $1
         i32.const 16
         i32.const 9
         call $~lib/rt/stub/__new
         local.tee $17
         local.get $6
         i64.extend_i32_s
         local.tee $8
         i64.store
         local.get $17
         local.get $8
         i64.const 63
         i64.shr_s
         i64.store offset=8
         local.get $1
         i64.load offset=8
         local.get $17
         i64.load offset=8
         i64.eq
         if (result i32)
          local.get $1
          i64.load
          local.get $17
          i64.load
          i64.eq
         else
          i32.const 0
         end
         if
          local.get $9
          i32.const 0
          local.get $4
          local.get $7
          call $~lib/array/Array<~lib/array/Array<u8>>#__get
          local.tee $1
          i32.load
          i64.load
          local.get $1
          i32.load offset=4
          i64.load
          i32.wrap_i64
          call $~lib/metashrew-runes/assembly/indexer/RuneId/RuneId#constructor
          call $~lib/metashrew-runes/assembly/indexer/RuneId/RuneId#toBytes
          local.tee $17
          call $~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet#get
          local.set $1
          local.get $4
          local.get $7
          call $~lib/array/Array<~lib/array/Array<u8>>#__get
          i32.load offset=8
          local.tee $7
          i64.load offset=8
          local.tee $8
          local.get $1
          i64.load offset=8
          local.tee $21
          i64.eq
          if (result i32)
           local.get $1
           i64.load
           local.get $7
           i64.load
           i64.gt_u
          else
           local.get $8
           local.get $21
           i64.lt_u
          end
          if
           local.get $7
           local.set $1
          end
          local.get $1
          i64.load
          local.get $1
          i64.load offset=8
          i64.or
          i64.eqz
          br_if $for-continue|2
          local.get $9
          local.get $17
          local.get $1
          call $~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet#decrease
          local.get $12
          local.get $14
          call $~lib/array/Array<~lib/array/Array<u8>>#__get
          local.get $17
          local.get $1
          call $~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet#increase
         end
        end
       end
       local.get $3
       i32.const 1
       i32.add
       local.set $3
       br $for-loop|2
      end
     end
    end
    local.get $14
    i32.const 1
    i32.add
    local.set $14
    br $for-loop|1
   end
  end
  loop $for-loop|3
   local.get $16
   local.get $4
   i32.load offset=12
   i32.lt_s
   if
    local.get $11
    i32.load
    local.get $11
    i32.load offset=4
    local.get $16
    i32.const -1028477379
    i32.mul
    i32.const 374761397
    i32.add
    i32.const 17
    i32.rotl
    i32.const 668265263
    i32.mul
    local.tee $1
    local.get $1
    i32.const 15
    i32.shr_u
    i32.xor
    i32.const -2048144777
    i32.mul
    local.tee $1
    local.get $1
    i32.const 13
    i32.shr_u
    i32.xor
    i32.const -1028477379
    i32.mul
    local.tee $1
    local.get $1
    i32.const 16
    i32.shr_u
    i32.xor
    i32.and
    i32.const 2
    i32.shl
    i32.add
    i32.load
    local.set $1
    block $"__inlined_func$~lib/map/Map<u32,~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet>#find$32052"
     loop $while-continue|03
      local.get $1
      if
       local.get $1
       i32.load offset=8
       local.tee $3
       i32.const 1
       i32.and
       if (result i32)
        i32.const 0
       else
        local.get $1
        i32.load
        local.get $16
        i32.eq
       end
       br_if $"__inlined_func$~lib/map/Map<u32,~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet>#find$32052"
       local.get $3
       i32.const -2
       i32.and
       local.set $1
       br $while-continue|03
      end
     end
     i32.const 0
     local.set $1
    end
    block $for-continue|3
     local.get $1
     br_if $for-continue|3
     local.get $4
     local.get $16
     call $~lib/array/Array<~lib/array/Array<u8>>#__get
     i32.load offset=12
     local.set $1
     i32.const 16
     i32.const 9
     call $~lib/rt/stub/__new
     local.tee $3
     local.get $6
     i64.extend_i32_s
     local.tee $8
     i64.store
     local.get $3
     local.get $8
     i64.const 63
     i64.shr_s
     i64.store offset=8
     local.get $1
     i64.load offset=8
     local.get $3
     i64.load offset=8
     i64.eq
     if (result i32)
      local.get $1
      i64.load
      local.get $3
      i64.load
      i64.eq
     else
      i32.const 0
     end
     if
      local.get $15
      i32.const 0
      local.get $4
      local.get $16
      call $~lib/array/Array<~lib/array/Array<u8>>#__get
      local.tee $1
      i32.load
      i64.load
      local.get $1
      i32.load offset=4
      i64.load
      i32.wrap_i64
      call $~lib/metashrew-runes/assembly/indexer/RuneId/RuneId#constructor
      call $~lib/metashrew-runes/assembly/indexer/RuneId/RuneId#toBytes
      local.tee $3
      call $assembly/indexer/Indexer/BurnCycle#peek
      local.set $7
      local.get $9
      local.get $3
      call $~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet#get
      local.set $1
      local.get $4
      local.get $16
      call $~lib/array/Array<~lib/array/Array<u8>>#__get
      i32.load offset=8
      local.tee $14
      i64.load offset=8
      local.tee $8
      local.get $1
      i64.load offset=8
      local.tee $21
      i64.eq
      if (result i32)
       local.get $1
       i64.load
       local.get $14
       i64.load
       i64.gt_u
      else
       local.get $8
       local.get $21
       i64.lt_u
      end
      if
       local.get $14
       local.set $1
      end
      local.get $1
      i64.load
      local.get $1
      i64.load offset=8
      i64.or
      i64.eqz
      br_if $for-continue|3
      local.get $15
      local.get $3
      call $assembly/indexer/Indexer/BurnCycle#next
      local.get $9
      local.get $3
      local.get $1
      call $~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet#decrease
      local.get $12
      local.get $7
      call $~lib/array/Array<~lib/array/Array<u8>>#__get
      local.get $3
      local.get $1
      call $~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet#increase
     end
    end
    local.get $16
    i32.const 1
    i32.add
    local.set $16
    br $for-loop|3
   end
  end
  local.get $0
  local.get $6
  i32.eq
  if
   loop $for-loop|4
    local.get $10
    local.get $9
    i32.load
    local.tee $0
    i32.load offset=12
    i32.lt_s
    if
     local.get $15
     local.get $0
     local.get $10
     call $~lib/array/Array<~lib/array/Array<u8>>#__get
     local.tee $0
     call $assembly/indexer/Indexer/BurnCycle#peek
     local.set $1
     local.get $9
     local.get $0
     call $~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet#get
     local.tee $3
     i64.load
     local.get $3
     i64.load offset=8
     i64.or
     i64.const 0
     i64.ne
     if
      local.get $15
      local.get $0
      call $assembly/indexer/Indexer/BurnCycle#next
      local.get $9
      local.get $0
      local.get $3
      call $~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet#decrease
      local.get $12
      local.get $1
      call $~lib/array/Array<~lib/array/Array<u8>>#__get
      local.get $0
      local.get $3
      call $~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet#increase
     end
     local.get $10
     i32.const 1
     i32.add
     local.set $10
     br $for-loop|4
    end
   end
  end
  loop $for-loop|5
   local.get $13
   local.get $5
   i32.load offset=12
   i32.lt_s
   if
    local.get $5
    local.get $13
    call $~lib/array/Array<~lib/array/Array<u8>>#__get
    drop
    i32.const 2
    global.set $~argumentsLength
    i32.const 11136
    i32.const 1
    call $~lib/string/String.UTF8.encode@varargs
    call $~lib/metashrew-as/assembly/utils/logging/__log
    local.get $5
    local.get $13
    call $~lib/array/Array<~lib/array/Array<u8>>#__get
    local.set $0
    local.get $12
    local.get $13
    call $~lib/array/Array<~lib/array/Array<u8>>#__get
    local.set $1
    local.get $2
    local.get $5
    local.get $13
    call $~lib/array/Array<~lib/array/Array<u8>>#__get
    i32.load offset=4
    call $~lib/metashrew-as/assembly/blockdata/transaction/OutPoint.from
    i32.load
    local.tee $3
    i32.load offset=4
    call $~lib/arraybuffer/ArrayBuffer#constructor
    local.tee $6
    local.get $3
    i32.load
    local.get $3
    i32.load offset=4
    memory.copy
    i32.const 0
    local.set $4
    loop $for-loop|01
     local.get $4
     local.get $1
     i32.load
     local.tee $3
     i32.load offset=12
     i32.lt_s
     if
      local.get $3
      local.get $4
      call $~lib/array/Array<~lib/array/Array<u8>>#__get
      local.set $3
      global.get $~lib/metashrew-runes/assembly/indexer/constants/index/RUNE_ID_TO_ETCHING
      local.get $3
      call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
      call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#get
      local.set $7
      local.get $0
      i32.load offset=12
      i32.load offset=28
      local.get $3
      call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
      local.tee $9
      call $~lib/metashrew-as/assembly/indexer/index/hash
      local.set $10
      global.get $~lib/metashrew-as/assembly/indexer/index/_updates
      local.get $10
      local.get $7
      call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set"
      global.get $~lib/metashrew-as/assembly/indexer/index/_updateKeys
      local.get $10
      local.get $9
      call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set"
      local.get $0
      i32.load offset=12
      i32.load offset=32
      local.get $7
      call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
      local.tee $9
      call $~lib/metashrew-as/assembly/indexer/index/hash
      local.set $10
      global.get $~lib/metashrew-as/assembly/indexer/index/_updates
      local.get $10
      local.get $3
      call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set"
      global.get $~lib/metashrew-as/assembly/indexer/index/_updateKeys
      local.get $10
      local.get $9
      call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set"
      local.get $0
      i32.load offset=12
      i32.load offset=16
      local.get $7
      call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
      local.set $3
      global.get $~lib/metashrew-runes/assembly/indexer/constants/index/SPACERS
      local.get $7
      call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
      call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#get
      local.set $9
      local.get $3
      call $~lib/metashrew-as/assembly/indexer/index/hash
      local.set $10
      global.get $~lib/metashrew-as/assembly/indexer/index/_updates
      local.get $10
      local.get $9
      call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set"
      global.get $~lib/metashrew-as/assembly/indexer/index/_updateKeys
      local.get $10
      local.get $3
      call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set"
      local.get $0
      i32.load offset=12
      i32.load offset=20
      local.get $7
      call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
      local.set $3
      global.get $~lib/metashrew-runes/assembly/indexer/constants/index/DIVISIBILITY
      local.get $7
      call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
      call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#get
      local.set $9
      local.get $3
      call $~lib/metashrew-as/assembly/indexer/index/hash
      local.set $10
      global.get $~lib/metashrew-as/assembly/indexer/index/_updates
      local.get $10
      local.get $9
      call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set"
      global.get $~lib/metashrew-as/assembly/indexer/index/_updateKeys
      local.get $10
      local.get $3
      call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set"
      local.get $0
      i32.load offset=12
      i32.load offset=12
      local.get $7
      call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
      local.set $3
      global.get $~lib/metashrew-runes/assembly/indexer/constants/index/SYMBOL
      local.get $7
      call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
      call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#get
      local.set $9
      local.get $3
      call $~lib/metashrew-as/assembly/indexer/index/hash
      local.set $10
      global.get $~lib/metashrew-as/assembly/indexer/index/_updates
      local.get $10
      local.get $9
      call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set"
      global.get $~lib/metashrew-as/assembly/indexer/index/_updateKeys
      local.get $10
      local.get $3
      call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set"
      local.get $0
      i32.load offset=12
      i32.load offset=24
      call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#extend
      local.tee $3
      call $~lib/metashrew-as/assembly/indexer/index/hash
      local.set $9
      global.get $~lib/metashrew-as/assembly/indexer/index/_updates
      local.get $9
      local.get $7
      call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set"
      global.get $~lib/metashrew-as/assembly/indexer/index/_updateKeys
      local.get $9
      local.get $3
      call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set"
      local.get $0
      i32.load offset=12
      i32.load offset=4
      local.get $6
      call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
      local.set $3
      i32.const 1
      global.set $~argumentsLength
      local.get $3
      i32.const 8592
      i32.const 0
      call $~lib/string/String.UTF8.encode@varargs
      call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
      local.set $7
      i32.const 1
      global.set $~argumentsLength
      local.get $3
      i32.const 8624
      i32.const 0
      call $~lib/string/String.UTF8.encode@varargs
      call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
      local.set $3
      local.get $1
      i32.load offset=4
      local.get $4
      call $~lib/array/Array<~lib/array/Array<u8>>#__get
      local.set $9
      i32.const 16
      i32.const 9
      call $~lib/rt/stub/__new
      local.tee $10
      i64.const 0
      i64.store
      local.get $10
      i64.const 0
      i64.store offset=8
      local.get $9
      i64.load offset=8
      local.get $10
      i64.load offset=8
      i64.eq
      if (result i32)
       local.get $9
       i64.load
       local.get $10
       i64.load
       i64.eq
      else
       i32.const 0
      end
      i32.eqz
      if
       local.get $1
       i32.load
       local.get $4
       call $~lib/array/Array<~lib/array/Array<u8>>#__get
       local.set $9
       local.get $7
       call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#extend
       local.tee $7
       call $~lib/metashrew-as/assembly/indexer/index/hash
       local.set $10
       global.get $~lib/metashrew-as/assembly/indexer/index/_updates
       local.get $10
       local.get $9
       call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set"
       global.get $~lib/metashrew-as/assembly/indexer/index/_updateKeys
       local.get $10
       local.get $7
       call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set"
       local.get $1
       i32.load offset=4
       local.get $4
       call $~lib/array/Array<~lib/array/Array<u8>>#__get
       local.set $7
       i32.const 16
       call $~lib/array/Array<u8>#constructor
       local.tee $9
       i32.load offset=4
       local.tee $10
       local.get $7
       i64.load
       i64.store
       local.get $10
       local.get $7
       i64.load offset=8
       i64.store offset=8
       local.get $9
       i32.load
       local.set $7
       local.get $3
       call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#extend
       local.tee $3
       call $~lib/metashrew-as/assembly/indexer/index/hash
       local.set $9
       global.get $~lib/metashrew-as/assembly/indexer/index/_updates
       local.get $9
       local.get $7
       call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set"
       global.get $~lib/metashrew-as/assembly/indexer/index/_updateKeys
       local.get $9
       local.get $3
       call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set"
      end
      local.get $1
      i32.load offset=4
      local.get $4
      call $~lib/array/Array<~lib/array/Array<u8>>#__get
      drop
      local.get $4
      i32.const 1
      i32.add
      local.set $4
      br $for-loop|01
     end
    end
    local.get $13
    i32.const 1
    i32.add
    local.set $13
    br $for-loop|5
   end
  end
 )
 (func $assembly/indexer/protomessage/ProtoMessage/ProtoMessage#constructor (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (param $4 i32) (result i32)
  (local $5 i32)
  (local $6 i64)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i64)
  i32.const 20
  i32.const 138
  call $~lib/rt/stub/__new
  local.tee $5
  i32.const 0
  i32.store
  local.get $5
  i32.const 0
  i32.store offset=4
  local.get $5
  i32.const 0
  i32.store offset=8
  local.get $5
  i32.const 0
  i32.store offset=12
  local.get $5
  i32.const 0
  i32.store offset=16
  local.get $5
  local.get $0
  i32.store
  local.get $5
  local.get $1
  i32.store offset=8
  local.get $5
  local.get $2
  i32.store offset=12
  local.get $3
  local.get $3
  i32.const 20
  i32.sub
  i32.load offset=16
  call $~lib/metashrew-as/assembly/utils/box/Box#constructor
  local.set $0
  loop $while-continue|0
   local.get $0
   i32.load offset=4
   local.tee $1
   if
    local.get $0
    i32.load
    local.get $1
    i32.add
    i32.const 1
    i32.sub
    i32.load8_u
    i32.eqz
    if
     local.get $0
     local.get $1
     i32.const 1
     i32.sub
     i32.store offset=4
     br $while-continue|0
    end
   end
  end
  local.get $0
  i32.load offset=4
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.tee $1
  local.get $0
  i32.load
  local.get $0
  i32.load offset=4
  memory.copy
  i32.const 1
  global.set $~argumentsLength
  local.get $1
  call $~lib/typedarray/Uint8Array.wrap@varargs
  local.tee $0
  i32.load offset=4
  local.set $2
  i32.const 0
  local.set $1
  local.get $0
  i32.load offset=8
  local.tee $3
  i32.const 1
  i32.gt_u
  if
   local.get $3
   i32.const 1
   i32.shr_u
   local.set $7
   local.get $3
   i32.const 8
   i32.sub
   local.set $8
   loop $while-continue|00
    local.get $1
    i32.const 7
    i32.add
    local.get $7
    i32.lt_u
    if
     local.get $1
     local.get $2
     i32.add
     local.tee $9
     i64.load
     local.tee $6
     i64.const 8
     i64.shr_u
     i64.const 71777214294589695
     i64.and
     local.get $6
     i64.const 71777214294589695
     i64.and
     i64.const 8
     i64.shl
     i64.or
     local.set $6
     local.get $9
     local.get $2
     local.get $8
     i32.add
     local.get $1
     i32.sub
     local.tee $9
     i64.load
     local.tee $10
     i64.const 8
     i64.shr_u
     i64.const 71777214294589695
     i64.and
     local.get $10
     i64.const 71777214294589695
     i64.and
     i64.const 8
     i64.shl
     i64.or
     local.tee $10
     i64.const 16
     i64.shr_u
     i64.const 281470681808895
     i64.and
     local.get $10
     i64.const 281470681808895
     i64.and
     i64.const 16
     i64.shl
     i64.or
     i64.const 32
     i64.rotr
     i64.store
     local.get $9
     local.get $6
     i64.const 16
     i64.shr_u
     i64.const 281470681808895
     i64.and
     local.get $6
     i64.const 281470681808895
     i64.and
     i64.const 16
     i64.shl
     i64.or
     i64.const 32
     i64.rotr
     i64.store
     local.get $1
     i32.const 8
     i32.add
     local.set $1
     br $while-continue|00
    end
   end
   local.get $3
   i32.const 1
   i32.sub
   local.set $3
   loop $while-continue|1
    local.get $1
    local.get $7
    i32.lt_u
    if
     local.get $1
     local.get $2
     i32.add
     local.tee $8
     i32.load8_u
     local.set $9
     local.get $8
     local.get $2
     local.get $3
     local.get $1
     i32.sub
     i32.add
     local.tee $8
     i32.load8_u
     i32.store8
     local.get $8
     local.get $9
     i32.store8
     local.get $1
     i32.const 1
     i32.add
     local.set $1
     br $while-continue|1
    end
   end
  end
  local.get $5
  local.get $0
  i32.load
  i32.store offset=4
  local.get $5
  local.get $4
  i32.store offset=16
  local.get $5
 )
 (func $assembly/indexer/protomessage/ProtoMessage/ProtoMessage.from (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  local.get $0
  i32.load
  local.tee $2
  i32.load
  local.get $2
  i32.load offset=4
  i32.const 1720617444
  i32.and
  i32.const 2
  i32.shl
  i32.add
  i32.load
  local.set $2
  block $"__inlined_func$~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#find$3513"
   loop $while-continue|0
    local.get $2
    if
     local.get $2
     i32.load offset=12
     local.tee $3
     i32.const 1
     i32.and
     if (result i32)
      i32.const 0
     else
      local.get $2
      i64.load
      i64.const 81
      i64.eq
     end
     br_if $"__inlined_func$~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#find$3513"
     local.get $3
     i32.const -2
     i32.and
     local.set $2
     br $while-continue|0
    end
   end
   i32.const 0
   local.set $2
  end
  local.get $2
  if
   block $"__inlined_func$~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#find$3514"
    local.get $0
    i32.load
    local.tee $2
    i32.load
    local.get $2
    i32.load offset=4
    i32.const 1816949183
    i32.and
    i32.const 2
    i32.shl
    i32.add
    i32.load
    local.set $2
    loop $while-continue|03
     local.get $2
     if
      local.get $2
      i32.load offset=12
      local.tee $3
      i32.const 1
      i32.and
      if (result i32)
       i32.const 0
      else
       local.get $2
       i64.load
       i64.const 91
       i64.eq
      end
      br_if $"__inlined_func$~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#find$3514"
      local.get $3
      i32.const -2
      i32.and
      local.set $2
      br $while-continue|03
     end
    end
    i32.const 0
    local.set $2
   end
  else
   i32.const 0
   local.set $2
  end
  local.get $2
  if (result i32)
   local.get $0
   i32.load
   local.tee $2
   i32.load
   local.get $2
   i32.load offset=4
   i32.const -178981092
   i32.and
   i32.const 2
   i32.shl
   i32.add
   i32.load
   local.set $2
   block $"__inlined_func$~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#find$3515"
    loop $while-continue|04
     local.get $2
     if
      local.get $2
      i32.load offset=12
      local.tee $3
      i32.const 1
      i32.and
      if (result i32)
       i32.const 0
      else
       local.get $2
       i64.load
       i64.const 93
       i64.eq
      end
      br_if $"__inlined_func$~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#find$3515"
      local.get $3
      i32.const -2
      i32.and
      local.set $2
      br $while-continue|04
     end
    end
    i32.const 0
    local.set $2
   end
   local.get $2
   i32.const 0
   i32.ne
  else
   i32.const 0
  end
  i32.eqz
  if
   i32.const 0
   return
  end
  local.get $0
  i32.load
  i64.const 81
  call $"~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#get"
  i32.const 8736
  call $~lib/array/Array<~lib/arraybuffer/ArrayBuffer>#map<~lib/metashrew-as/assembly/utils/box/Box>
  call $~lib/metashrew-as/assembly/utils/box/Box.concat
  local.set $2
  local.get $1
  local.get $0
  i32.load
  i64.const 91
  call $"~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#get"
  i32.const 0
  call $~lib/array/Array<~lib/array/Array<u8>>#__get
  i64.load
  i32.wrap_i64
  local.get $0
  i32.load
  i64.const 93
  call $"~lib/map/Map<u64,~lib/array/Array<~lib/as-bignum/assembly/integer/u128/u128>>#get"
  i32.const 0
  call $~lib/array/Array<~lib/array/Array<u8>>#__get
  i64.load
  i32.wrap_i64
  local.get $2
  local.get $0
  i32.load offset=16
  call $assembly/indexer/protomessage/ProtoMessage/ProtoMessage#constructor
 )
 (func $~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet#inspect (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  i32.const 11184
  local.set $1
  loop $for-loop|0
   local.get $2
   local.get $0
   i32.load
   local.tee $4
   i32.load offset=12
   i32.lt_s
   if
    local.get $1
    i32.const 11232
    local.get $4
    local.get $2
    call $~lib/array/Array<~lib/array/Array<u8>>#__get
    call $~lib/metashrew-runes/assembly/indexer/RuneId/RuneId.fromBytes
    local.tee $1
    i32.load
    call $~lib/as-bignum/assembly/integer/u128/u128#toString
    i32.const 11264
    call $~lib/string/String.__concat
    local.get $1
    i32.load offset=4
    call $~lib/as-bignum/assembly/integer/u128/u128#toString
    call $~lib/string/String.__concat
    call $~lib/string/String.__concat
    i32.const 11296
    call $~lib/string/String.__concat
    call $~lib/string/String.__concat
    local.set $1
    local.get $2
    i32.const 1
    i32.add
    local.set $2
    br $for-loop|0
   end
  end
  local.get $1
  i32.const 11328
  call $~lib/string/String.__concat
  local.set $1
  loop $for-loop|1
   local.get $3
   local.get $0
   i32.load offset=4
   local.tee $2
   i32.load offset=12
   i32.lt_s
   if
    local.get $1
    i32.const 11232
    local.get $2
    local.get $3
    call $~lib/array/Array<~lib/array/Array<u8>>#__get
    call $~lib/as-bignum/assembly/integer/u128/u128#toString
    call $~lib/string/String.__concat
    i32.const 11296
    call $~lib/string/String.__concat
    call $~lib/string/String.__concat
    local.set $1
    local.get $3
    i32.const 1
    i32.add
    local.set $3
    br $for-loop|1
   end
  end
  local.get $1
  i32.const 11376
  call $~lib/string/String.__concat
 )
 (func $"~lib/map/Map<~lib/arraybuffer/ArrayBuffer,i32>#set" (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  local.get $0
  i32.load
  local.get $1
  local.tee $3
  i32.const -1028477379
  i32.mul
  i32.const 374761397
  i32.add
  i32.const 17
  i32.rotl
  i32.const 668265263
  i32.mul
  local.tee $1
  local.get $1
  i32.const 15
  i32.shr_u
  i32.xor
  i32.const -2048144777
  i32.mul
  local.tee $1
  local.get $1
  i32.const 13
  i32.shr_u
  i32.xor
  i32.const -1028477379
  i32.mul
  local.tee $1
  local.get $1
  i32.const 16
  i32.shr_u
  i32.xor
  local.tee $8
  local.get $0
  i32.load offset=4
  i32.and
  i32.const 2
  i32.shl
  i32.add
  i32.load
  local.set $1
  block $"__inlined_func$~lib/map/Map<u32,~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet>#find$3525"
   loop $while-continue|0
    local.get $1
    if
     local.get $1
     i32.load offset=8
     local.tee $4
     i32.const 1
     i32.and
     if (result i32)
      i32.const 0
     else
      local.get $1
      i32.load
      local.get $3
      i32.eq
     end
     br_if $"__inlined_func$~lib/map/Map<u32,~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet>#find$3525"
     local.get $4
     i32.const -2
     i32.and
     local.set $1
     br $while-continue|0
    end
   end
   i32.const 0
   local.set $1
  end
  local.get $1
  if
   local.get $1
   local.get $2
   i32.store offset=4
  else
   local.get $0
   i32.load offset=12
   local.tee $1
   local.get $0
   i32.load offset=16
   i32.eq
   if
    local.get $0
    i32.load offset=20
    local.get $1
    i32.const 3
    i32.mul
    i32.const 4
    i32.div_s
    i32.lt_s
    if (result i32)
     local.get $0
     i32.load offset=4
    else
     local.get $0
     i32.load offset=4
     i32.const 1
     i32.shl
     i32.const 1
     i32.or
    end
    local.tee $6
    i32.const 1
    i32.add
    local.tee $1
    i32.const 2
    i32.shl
    call $~lib/arraybuffer/ArrayBuffer#constructor
    local.set $7
    local.get $1
    i32.const 3
    i32.shl
    i32.const 3
    i32.div_s
    local.tee $9
    i32.const 12
    i32.mul
    call $~lib/arraybuffer/ArrayBuffer#constructor
    local.set $4
    local.get $0
    i32.load offset=8
    local.tee $5
    local.get $0
    i32.load offset=16
    i32.const 12
    i32.mul
    i32.add
    local.set $10
    local.get $4
    local.set $1
    loop $while-continue|00
     local.get $5
     local.get $10
     i32.ne
     if
      local.get $5
      i32.load offset=8
      i32.const 1
      i32.and
      i32.eqz
      if
       local.get $1
       local.get $5
       i32.load
       local.tee $11
       i32.store
       local.get $1
       local.get $5
       i32.load offset=4
       i32.store offset=4
       local.get $1
       local.get $7
       local.get $11
       i32.const -1028477379
       i32.mul
       i32.const 374761397
       i32.add
       i32.const 17
       i32.rotl
       i32.const 668265263
       i32.mul
       local.tee $11
       i32.const 15
       i32.shr_u
       local.get $11
       i32.xor
       i32.const -2048144777
       i32.mul
       local.tee $11
       i32.const 13
       i32.shr_u
       local.get $11
       i32.xor
       i32.const -1028477379
       i32.mul
       local.tee $11
       i32.const 16
       i32.shr_u
       local.get $11
       i32.xor
       local.get $6
       i32.and
       i32.const 2
       i32.shl
       i32.add
       local.tee $11
       i32.load
       i32.store offset=8
       local.get $11
       local.get $1
       i32.store
       local.get $1
       i32.const 12
       i32.add
       local.set $1
      end
      local.get $5
      i32.const 12
      i32.add
      local.set $5
      br $while-continue|00
     end
    end
    local.get $0
    local.get $7
    i32.store
    local.get $0
    local.get $6
    i32.store offset=4
    local.get $0
    local.get $4
    i32.store offset=8
    local.get $0
    local.get $9
    i32.store offset=12
    local.get $0
    local.get $0
    i32.load offset=20
    i32.store offset=16
   end
   local.get $0
   i32.load offset=8
   local.set $1
   local.get $0
   local.get $0
   i32.load offset=16
   local.tee $4
   i32.const 1
   i32.add
   i32.store offset=16
   local.get $1
   local.get $4
   i32.const 12
   i32.mul
   i32.add
   local.tee $1
   local.get $3
   i32.store
   local.get $1
   local.get $2
   i32.store offset=4
   local.get $0
   local.get $0
   i32.load offset=20
   i32.const 1
   i32.add
   i32.store offset=20
   local.get $1
   local.get $0
   i32.load
   local.get $8
   local.get $0
   i32.load offset=4
   i32.and
   i32.const 2
   i32.shl
   i32.add
   local.tee $0
   i32.load
   i32.store offset=8
   local.get $0
   local.get $1
   i32.store
  end
 )
 (func $~lib/metashrew-as/assembly/indexer/atomic/AtomicTransaction#constructor (result i32)
  (local $0 i32)
  i32.const 16
  i32.const 51
  call $~lib/rt/stub/__new
  local.tee $0
  i32.const 0
  i32.store
  local.get $0
  i32.const 0
  i32.store offset=4
  local.get $0
  i32.const 0
  i32.store offset=8
  local.get $0
  i32.const 0
  i32.store offset=12
  local.get $0
  call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#constructor"
  i32.store
  local.get $0
  call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#constructor"
  i32.store offset=4
  local.get $0
  call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#constructor"
  i32.store offset=8
  local.get $0
  call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#constructor"
  i32.store offset=12
  local.get $0
 )
 (func $assembly/indexer/protomessage/MessageContext/MessageContext#constructor (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (param $4 i64) (param $5 i32) (param $6 i32) (param $7 i32) (param $8 i32) (param $9 i32) (result i32)
  (local $10 i32)
  (local $11 i32)
  (local $12 i64)
  local.get $0
  i32.eqz
  if
   i32.const 68
   i32.const 50
   call $~lib/rt/stub/__new
   local.set $0
  end
  local.get $0
  call $~lib/metashrew-as/assembly/indexer/atomic/AtomicTransaction#constructor
  i32.store
  i32.const 16
  i32.const 55
  call $~lib/rt/stub/__new
  local.tee $10
  i32.const 0
  i32.store
  local.get $10
  i32.const 0
  i32.store offset=4
  local.get $10
  i32.const 0
  i32.store offset=8
  local.get $10
  i32.const 0
  i32.store offset=12
  i32.const 32
  i32.const 1
  call $~lib/rt/stub/__new
  local.tee $11
  i32.const 0
  i32.const 32
  memory.fill
  local.get $10
  local.get $11
  i32.store
  local.get $10
  local.get $11
  i32.store offset=4
  local.get $10
  i32.const 32
  i32.store offset=8
  local.get $10
  i32.const 0
  i32.store offset=12
  local.get $0
  local.get $10
  i32.store offset=4
  local.get $0
  i32.const 0
  i32.store offset=8
  local.get $0
  i32.const 0
  i32.store offset=12
  local.get $0
  i64.const 0
  i64.store offset=16
  local.get $0
  i32.const 0
  i32.store offset=24
  local.get $0
  i32.const 0
  i32.store offset=28
  local.get $0
  i32.const 0
  i32.store offset=32
  local.get $0
  i32.const 0
  call $~lib/arraybuffer/ArrayBuffer#constructor
  i32.store offset=36
  local.get $0
  i32.const 0
  i32.store offset=40
  local.get $0
  i32.const 0
  i32.store offset=44
  i32.const 24
  i32.const 61
  call $~lib/rt/stub/__new
  local.tee $10
  i32.const 16
  call $~lib/arraybuffer/ArrayBuffer#constructor
  i32.store
  local.get $10
  i32.const 3
  i32.store offset=4
  local.get $10
  i32.const 48
  call $~lib/arraybuffer/ArrayBuffer#constructor
  i32.store offset=8
  local.get $10
  i32.const 4
  i32.store offset=12
  local.get $10
  i32.const 0
  i32.store offset=16
  local.get $10
  i32.const 0
  i32.store offset=20
  local.get $0
  local.get $10
  i32.store offset=48
  local.get $0
  i32.const 0
  i32.store offset=52
  local.get $0
  i32.const 0
  i32.store offset=56
  local.get $0
  i32.const 0
  i32.store offset=60
  local.get $0
  i32.const 0
  i32.store offset=64
  local.get $0
  local.get $5
  i32.store offset=60
  local.get $0
  local.get $2
  i32.store offset=8
  local.get $0
  local.get $3
  i32.store offset=12
  local.get $0
  local.get $4
  i64.store offset=16
  local.get $0
  local.get $2
  call $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#txid
  local.tee $2
  local.get $6
  call $~lib/metashrew-as/assembly/blockdata/transaction/OutPoint.from
  local.tee $3
  i32.store offset=24
  local.get $0
  local.get $2
  local.get $7
  call $~lib/metashrew-as/assembly/blockdata/transaction/OutPoint.from
  local.tee $5
  i32.store offset=28
  local.get $0
  local.get $2
  local.get $8
  call $~lib/metashrew-as/assembly/blockdata/transaction/OutPoint.from
  local.tee $10
  i32.store offset=32
  local.get $0
  local.get $9
  i32.store offset=36
  local.get $0
  local.get $2
  i32.store offset=40
  local.get $0
  i32.const 12
  i32.const 57
  call $~lib/rt/stub/__new
  call $~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet#constructor
  i32.store offset=44
  i32.const 24
  i32.const 62
  call $~lib/rt/stub/__new
  local.tee $2
  i32.const 16
  call $~lib/arraybuffer/ArrayBuffer#constructor
  i32.store
  local.get $2
  i32.const 3
  i32.store offset=4
  local.get $2
  i32.const 48
  call $~lib/arraybuffer/ArrayBuffer#constructor
  i32.store offset=8
  local.get $2
  i32.const 4
  i32.store offset=12
  local.get $2
  i32.const 0
  i32.store offset=16
  local.get $2
  i32.const 0
  i32.store offset=20
  local.get $0
  local.get $2
  i32.store offset=56
  local.get $0
  local.get $1
  call $assembly/indexer/tables/protorune/ProtoruneTable.for
  local.tee $1
  i32.store offset=52
  local.get $0
  local.get $1
  i32.load offset=36
  call $~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet.load
  i32.store offset=64
  local.get $1
  i32.load offset=4
  local.set $2
  local.get $3
  i32.load
  local.tee $3
  i32.load offset=4
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.tee $9
  local.get $3
  i32.load
  local.get $3
  i32.load offset=4
  memory.copy
  local.get $2
  local.get $9
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
  call $~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet.load
  local.tee $2
  call $~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet#inspect
  local.set $3
  i32.const 2
  global.set $~argumentsLength
  local.get $3
  i32.const 1
  call $~lib/string/String.UTF8.encode@varargs
  call $~lib/metashrew-as/assembly/utils/logging/__log
  local.get $0
  i32.load offset=56
  local.get $6
  local.get $2
  call $"~lib/map/Map<u32,~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet>#set"
  local.get $0
  i32.load offset=56
  local.set $3
  local.get $1
  i32.load offset=4
  local.set $6
  local.get $5
  i32.load
  local.tee $5
  i32.load offset=4
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.tee $9
  local.get $5
  i32.load
  local.get $5
  i32.load offset=4
  memory.copy
  local.get $3
  local.get $7
  local.get $6
  local.get $9
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
  call $~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet.load
  call $"~lib/map/Map<u32,~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet>#set"
  local.get $0
  i32.load offset=56
  local.set $3
  local.get $1
  i32.load offset=4
  local.set $1
  local.get $10
  i32.load
  local.tee $5
  i32.load offset=4
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.tee $6
  local.get $5
  i32.load
  local.get $5
  i32.load offset=4
  memory.copy
  local.get $3
  local.get $8
  local.get $1
  local.get $6
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
  call $~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet.load
  call $"~lib/map/Map<u32,~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet>#set"
  i32.const 0
  local.set $1
  loop $for-loop|0
   local.get $1
   local.get $2
   i32.load
   local.tee $3
   i32.load offset=12
   i32.lt_s
   if
    local.get $3
    local.get $1
    call $~lib/array/Array<~lib/array/Array<u8>>#__get
    call $~lib/metashrew-runes/assembly/indexer/RuneId/RuneId.fromBytes
    local.set $3
    local.get $0
    i32.load offset=48
    local.get $2
    i32.load
    local.get $1
    call $~lib/array/Array<~lib/array/Array<u8>>#__get
    local.get $1
    call $"~lib/map/Map<~lib/arraybuffer/ArrayBuffer,i32>#set"
    local.get $2
    i32.load offset=4
    local.get $1
    call $~lib/array/Array<~lib/array/Array<u8>>#__get
    local.set $5
    local.get $0
    i32.load offset=52
    local.set $6
    i32.const 40
    i32.const 52
    call $~lib/rt/stub/__new
    local.tee $7
    i32.const 0
    i32.store
    local.get $7
    i32.const 0
    i32.store offset=4
    local.get $7
    i32.const 0
    i32.store offset=8
    local.get $7
    i32.const 0
    i32.store offset=12
    local.get $7
    i32.const -1
    i32.store offset=16
    local.get $7
    i32.const -1
    i32.store offset=20
    local.get $7
    i32.const -1
    i32.store offset=24
    local.get $7
    call $~lib/metashrew-as/assembly/indexer/atomic/AtomicTransaction#constructor
    i32.store offset=28
    local.get $7
    i32.const 0
    i32.store offset=32
    local.get $7
    i32.const 0
    i32.store offset=36
    local.get $7
    local.get $0
    i32.store offset=32
    local.get $7
    local.get $3
    i32.store
    local.get $7
    local.get $5
    i32.store offset=12
    local.get $5
    i64.load
    local.set $4
    local.get $5
    i64.load offset=8
    local.set $12
    i32.const 16
    i32.const 9
    call $~lib/rt/stub/__new
    local.tee $3
    local.get $4
    i64.store
    local.get $3
    local.get $12
    i64.store offset=8
    local.get $7
    local.get $3
    i32.store offset=4
    i32.const 16
    i32.const 9
    call $~lib/rt/stub/__new
    local.tee $3
    i64.const 0
    i64.store
    local.get $3
    i64.const 0
    i64.store offset=8
    local.get $7
    local.get $3
    i32.store offset=8
    local.get $7
    local.get $6
    i32.store offset=36
    local.get $0
    i32.load offset=4
    local.get $7
    call $~lib/array/Array<~lib/array/Array<u8>>#push
    drop
    local.get $1
    i32.const 1
    i32.add
    local.set $1
    br $for-loop|0
   end
  end
  local.get $0
 )
 (func $"~lib/map/Map<~lib/arraybuffer/ArrayBuffer,i32>#get" (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  local.get $0
  i32.load
  local.get $0
  i32.load offset=4
  local.get $1
  i32.const -1028477379
  i32.mul
  i32.const 374761397
  i32.add
  i32.const 17
  i32.rotl
  i32.const 668265263
  i32.mul
  local.tee $0
  i32.const 15
  i32.shr_u
  local.get $0
  i32.xor
  i32.const -2048144777
  i32.mul
  local.tee $0
  i32.const 13
  i32.shr_u
  local.get $0
  i32.xor
  i32.const -1028477379
  i32.mul
  local.tee $0
  i32.const 16
  i32.shr_u
  local.get $0
  i32.xor
  i32.and
  i32.const 2
  i32.shl
  i32.add
  i32.load
  local.set $0
  block $"__inlined_func$~lib/map/Map<u32,~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet>#find$3585"
   loop $while-continue|0
    local.get $0
    if
     local.get $0
     i32.load offset=8
     local.tee $2
     i32.const 1
     i32.and
     if (result i32)
      i32.const 0
     else
      local.get $0
      i32.load
      local.get $1
      i32.eq
     end
     br_if $"__inlined_func$~lib/map/Map<u32,~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet>#find$3585"
     local.get $2
     i32.const -2
     i32.and
     local.set $0
     br $while-continue|0
    end
   end
   i32.const 0
   local.set $0
  end
  local.get $0
  i32.eqz
  if
   i32.const 5392
   i32.const 5456
   i32.const 105
   i32.const 17
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  i32.load offset=4
 )
 (func $~lib/metashrew-as/assembly/indexer/atomic/AtomicTransaction#get (param $0 i32) (param $1 i32) (result i32)
  local.get $1
  call $~lib/metashrew-as/assembly/indexer/index/hash
  local.set $1
  local.get $0
  i32.load
  local.get $1
  local.get $1
  call $~lib/util/hash/HASH<~lib/string/String>
  call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#find"
  if
   local.get $0
   i32.load
   local.get $1
   call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#get"
   return
  end
  i32.const 0
 )
 (func $~lib/metashrew-as/assembly/indexer/atomic/AtomicTransaction#getValue<u32> (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  local.get $1
  call $~lib/metashrew-as/assembly/indexer/atomic/AtomicTransaction#get
  local.set $0
  i32.const 4
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.tee $1
  local.get $0
  i32.load align=1
  i32.store align=1
  local.get $1
  i32.load
 )
 (func $~lib/metashrew-as/assembly/indexer/atomic/AtomicTransaction#set (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  local.get $1
  call $~lib/metashrew-as/assembly/indexer/index/hash
  local.set $3
  local.get $0
  i32.load
  local.get $3
  local.get $2
  call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set"
  local.get $0
  i32.load offset=4
  local.get $3
  local.get $1
  call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set"
 )
 (func $~lib/metashrew-as/assembly/indexer/atomic/AtomicTransaction#extendIndexPointerList (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  i32.const 1
  global.set $~argumentsLength
  local.get $1
  i32.const 6304
  i32.const 0
  call $~lib/string/String.UTF8.encode@varargs
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
  local.set $2
  local.get $0
  i32.load
  local.get $2
  call $~lib/metashrew-as/assembly/indexer/index/hash
  local.tee $3
  local.get $3
  call $~lib/util/hash/HASH<~lib/string/String>
  call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#find"
  if (result i32)
   local.get $0
   local.get $2
   call $~lib/metashrew-as/assembly/indexer/atomic/AtomicTransaction#getValue<u32>
  else
   local.get $2
   call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#getValue<u32>
  end
  local.set $3
  i32.const 4
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.tee $4
  local.get $3
  i32.const 1
  i32.add
  i32.store
  local.get $0
  local.get $2
  local.get $4
  call $~lib/metashrew-as/assembly/indexer/atomic/AtomicTransaction#set
  local.get $1
  local.get $3
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#selectIndex
 )
 (func $assembly/indexer/ProtoruneBalanceSheet/ProtoruneBalanceSheet#saveToAtomicTx (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  i32.const 1
  global.set $~argumentsLength
  local.get $1
  i32.const 8592
  i32.const 0
  call $~lib/string/String.UTF8.encode@varargs
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
  local.set $4
  i32.const 1
  global.set $~argumentsLength
  local.get $1
  i32.const 8624
  i32.const 0
  call $~lib/string/String.UTF8.encode@varargs
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
  local.set $6
  loop $for-loop|0
   local.get $3
   local.get $0
   i32.load
   local.tee $1
   i32.load offset=12
   i32.lt_s
   if
    local.get $1
    local.get $3
    call $~lib/array/Array<~lib/array/Array<u8>>#__get
    local.set $1
    local.get $2
    local.get $2
    local.get $4
    call $~lib/metashrew-as/assembly/indexer/atomic/AtomicTransaction#extendIndexPointerList
    local.get $1
    call $~lib/metashrew-as/assembly/indexer/atomic/AtomicTransaction#set
    local.get $0
    i32.load offset=4
    local.get $3
    call $~lib/array/Array<~lib/array/Array<u8>>#__get
    local.set $5
    i32.const 16
    call $~lib/array/Array<u8>#constructor
    local.tee $7
    i32.load offset=4
    local.tee $1
    local.get $5
    i64.load
    i64.store
    local.get $1
    local.get $5
    i64.load offset=8
    i64.store offset=8
    local.get $7
    i32.load
    local.set $1
    local.get $2
    local.get $2
    local.get $6
    call $~lib/metashrew-as/assembly/indexer/atomic/AtomicTransaction#extendIndexPointerList
    local.get $1
    call $~lib/metashrew-as/assembly/indexer/atomic/AtomicTransaction#set
    local.get $3
    i32.const 1
    i32.add
    local.set $3
    br $for-loop|0
   end
  end
 )
 (func $~lib/metashrew-as/assembly/indexer/atomic/AtomicTransaction#checkpoint (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  local.get $0
  i32.load
  call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#keys"
  local.set $2
  loop $for-loop|0
   local.get $1
   local.get $2
   i32.load offset=12
   i32.lt_s
   if
    local.get $0
    i32.load offset=8
    local.get $2
    local.get $1
    call $~lib/array/Array<~lib/array/Array<u8>>#__get
    local.get $0
    i32.load
    local.get $2
    local.get $1
    call $~lib/array/Array<~lib/array/Array<u8>>#__get
    call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#get"
    call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set"
    local.get $0
    i32.load offset=12
    local.get $2
    local.get $1
    call $~lib/array/Array<~lib/array/Array<u8>>#__get
    local.get $0
    i32.load offset=4
    local.get $2
    local.get $1
    call $~lib/array/Array<~lib/array/Array<u8>>#__get
    call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#get"
    call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set"
    local.get $1
    i32.const 1
    i32.add
    local.set $1
    br $for-loop|0
   end
  end
 )
 (func $assembly/indexer/ProtoruneBalanceSheet/ProtoruneBalanceSheet.loadFromAtomicTx (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  i32.const 1
  global.set $~argumentsLength
  local.get $0
  i32.const 8592
  i32.const 0
  call $~lib/string/String.UTF8.encode@varargs
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
  local.set $3
  i32.const 1
  global.set $~argumentsLength
  local.get $0
  i32.const 8624
  i32.const 0
  call $~lib/string/String.UTF8.encode@varargs
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
  local.set $5
  i32.const 1
  global.set $~argumentsLength
  local.get $1
  local.get $3
  i32.const 6304
  i32.const 0
  call $~lib/string/String.UTF8.encode@varargs
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
  call $~lib/metashrew-as/assembly/indexer/atomic/AtomicTransaction#getValue<u32>
  local.set $0
  i32.const 12
  i32.const 57
  call $~lib/rt/stub/__new
  call $~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet#constructor
  local.set $4
  loop $for-loop|0
   local.get $0
   local.get $2
   i32.gt_u
   if
    local.get $4
    local.get $1
    local.get $3
    local.get $2
    call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#selectIndex
    call $~lib/metashrew-as/assembly/indexer/atomic/AtomicTransaction#get
    local.get $1
    local.get $5
    local.get $2
    call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#selectIndex
    call $~lib/metashrew-as/assembly/indexer/atomic/AtomicTransaction#get
    call $~lib/metashrew-runes/assembly/utils/fromArrayBuffer
    call $~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet#set
    local.get $2
    i32.const 1
    i32.add
    local.set $2
    br $for-loop|0
   end
  end
  local.get $4
 )
 (func $assembly/indexer/protomessage/MessageContext/MessageContext#checkBalances (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i64)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i64)
  local.get $0
  i32.load offset=52
  i32.load offset=4
  local.set $3
  local.get $0
  i32.load offset=32
  i32.load
  local.tee $4
  i32.load offset=4
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.tee $5
  local.get $4
  i32.load
  local.get $4
  i32.load offset=4
  memory.copy
  local.get $3
  local.get $5
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
  local.get $0
  i32.load
  call $assembly/indexer/ProtoruneBalanceSheet/ProtoruneBalanceSheet.loadFromAtomicTx
  local.set $3
  i32.const 2
  global.set $~argumentsLength
  i32.const 11408
  i32.const 1
  call $~lib/string/String.UTF8.encode@varargs
  call $~lib/metashrew-as/assembly/utils/logging/__log
  local.get $3
  call $~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet#inspect
  local.set $4
  i32.const 2
  global.set $~argumentsLength
  local.get $4
  i32.const 1
  call $~lib/string/String.UTF8.encode@varargs
  call $~lib/metashrew-as/assembly/utils/logging/__log
  local.get $0
  i32.load offset=52
  i32.load offset=4
  local.set $4
  local.get $0
  i32.load offset=28
  i32.load
  local.tee $5
  i32.load offset=4
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.tee $6
  local.get $5
  i32.load
  local.get $5
  i32.load offset=4
  memory.copy
  local.get $4
  local.get $6
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
  local.get $0
  i32.load
  call $assembly/indexer/ProtoruneBalanceSheet/ProtoruneBalanceSheet.loadFromAtomicTx
  local.set $4
  i32.const 2
  global.set $~argumentsLength
  i32.const 11456
  i32.const 1
  call $~lib/string/String.UTF8.encode@varargs
  call $~lib/metashrew-as/assembly/utils/logging/__log
  local.get $4
  call $~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet#inspect
  local.set $5
  i32.const 2
  global.set $~argumentsLength
  local.get $5
  i32.const 1
  call $~lib/string/String.UTF8.encode@varargs
  call $~lib/metashrew-as/assembly/utils/logging/__log
  local.get $4
  local.get $3
  call $~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet#pipe
  local.get $0
  i32.load offset=52
  i32.load offset=4
  local.set $4
  local.get $0
  i32.load offset=24
  i32.load
  local.tee $5
  i32.load offset=4
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.tee $6
  local.get $5
  i32.load
  local.get $5
  i32.load offset=4
  memory.copy
  local.get $4
  local.get $6
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
  local.get $0
  i32.load
  call $assembly/indexer/ProtoruneBalanceSheet/ProtoruneBalanceSheet.loadFromAtomicTx
  local.get $3
  call $~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet#pipe
  local.get $0
  i32.load offset=64
  local.get $3
  call $~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet#pipe
  i32.const 2
  global.set $~argumentsLength
  i32.const 11504
  i32.const 1
  call $~lib/string/String.UTF8.encode@varargs
  call $~lib/metashrew-as/assembly/utils/logging/__log
  local.get $0
  i32.load offset=64
  call $~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet#inspect
  local.set $4
  i32.const 2
  global.set $~argumentsLength
  local.get $4
  i32.const 1
  call $~lib/string/String.UTF8.encode@varargs
  call $~lib/metashrew-as/assembly/utils/logging/__log
  local.get $0
  i32.load offset=44
  i32.load
  i32.load offset=12
  local.get $3
  i32.load
  i32.load offset=12
  i32.ne
  if
   i32.const 0
   return
  end
  loop $for-loop|0
   local.get $1
   local.get $0
   i32.load offset=44
   local.tee $4
   i32.load
   local.tee $5
   i32.load offset=12
   i32.lt_s
   if
    local.get $4
    local.get $5
    local.get $1
    call $~lib/array/Array<~lib/array/Array<u8>>#__get
    call $~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet#get
    local.set $4
    local.get $3
    local.get $0
    i32.load offset=44
    i32.load
    local.get $1
    call $~lib/array/Array<~lib/array/Array<u8>>#__get
    call $~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet#get
    local.set $5
    local.get $4
    i64.load offset=8
    local.get $5
    i64.load offset=8
    i64.eq
    if (result i32)
     local.get $4
     i64.load
     local.get $5
     i64.load
     i64.eq
    else
     i32.const 0
    end
    i32.eqz
    if
     local.get $0
     i32.load offset=44
     local.tee $4
     local.get $4
     i32.load
     local.get $1
     call $~lib/array/Array<~lib/array/Array<u8>>#__get
     call $~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet#get
     local.set $4
     local.get $3
     local.get $0
     i32.load offset=44
     i32.load
     local.get $1
     call $~lib/array/Array<~lib/array/Array<u8>>#__get
     call $~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet#get
     local.set $0
     local.get $4
     i64.load
     local.tee $7
     local.get $0
     i64.load
     i64.sub
     local.set $2
     local.get $4
     i64.load offset=8
     local.get $0
     i64.load offset=8
     i64.sub
     local.get $2
     local.get $7
     i64.gt_u
     i64.extend_i32_u
     i64.sub
     local.set $7
     i32.const 16
     i32.const 9
     call $~lib/rt/stub/__new
     local.tee $0
     local.get $2
     i64.store
     local.get $0
     local.get $7
     i64.store offset=8
     local.get $0
     call $~lib/as-bignum/assembly/integer/u128/u128#toString
     local.set $0
     i32.const 2
     global.set $~argumentsLength
     local.get $0
     i32.const 1
     call $~lib/string/String.UTF8.encode@varargs
     call $~lib/metashrew-as/assembly/utils/logging/__log
     i32.const 2
     global.set $~argumentsLength
     i32.const 11568
     i32.const 1
     call $~lib/string/String.UTF8.encode@varargs
     call $~lib/metashrew-as/assembly/utils/logging/__log
     i32.const 0
     return
    end
    local.get $1
    i32.const 1
    i32.add
    local.set $1
    br $for-loop|0
   end
  end
  i32.const 1
 )
 (func $assembly/indexer/protomessage/MessageContext/MessageContext#run (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  local.get $0
  i32.load offset=56
  local.tee $1
  i32.load
  local.get $1
  i32.load offset=4
  local.get $0
  i32.load offset=28
  i32.load offset=8
  local.tee $5
  i32.const -1028477379
  i32.mul
  i32.const 374761397
  i32.add
  i32.const 17
  i32.rotl
  i32.const 668265263
  i32.mul
  local.tee $1
  local.get $1
  i32.const 15
  i32.shr_u
  i32.xor
  i32.const -2048144777
  i32.mul
  local.tee $1
  local.get $1
  i32.const 13
  i32.shr_u
  i32.xor
  i32.const -1028477379
  i32.mul
  local.tee $1
  local.get $1
  i32.const 16
  i32.shr_u
  i32.xor
  i32.and
  i32.const 2
  i32.shl
  i32.add
  i32.load
  local.set $1
  block $"__inlined_func$~lib/map/Map<u32,~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet>#find$3205"
   loop $while-continue|0
    local.get $1
    if
     local.get $1
     i32.load offset=8
     local.tee $6
     i32.const 1
     i32.and
     if (result i32)
      i32.const 0
     else
      local.get $1
      i32.load
      local.get $5
      i32.eq
     end
     br_if $"__inlined_func$~lib/map/Map<u32,~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet>#find$3205"
     local.get $6
     i32.const -2
     i32.and
     local.set $1
     br $while-continue|0
    end
   end
   i32.const 0
   local.set $1
  end
  local.get $1
  if
   local.get $0
   i32.load offset=56
   local.get $0
   i32.load offset=28
   i32.load offset=8
   call $"~lib/map/Map<u32,~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet>#get"
   local.set $5
   loop $for-loop|0
    local.get $2
    local.get $5
    i32.load
    local.tee $1
    i32.load offset=12
    i32.lt_s
    if
     local.get $0
     i32.load offset=48
     local.set $6
     local.get $1
     local.get $2
     call $~lib/array/Array<~lib/array/Array<u8>>#__get
     local.tee $7
     i32.const -1028477379
     i32.mul
     i32.const 374761397
     i32.add
     i32.const 17
     i32.rotl
     i32.const 668265263
     i32.mul
     local.tee $1
     local.get $1
     i32.const 15
     i32.shr_u
     i32.xor
     i32.const -2048144777
     i32.mul
     local.tee $1
     local.get $1
     i32.const 13
     i32.shr_u
     i32.xor
     i32.const -1028477379
     i32.mul
     local.set $1
     local.get $6
     i32.load
     local.get $6
     i32.load offset=4
     local.get $1
     i32.const 16
     i32.shr_u
     local.get $1
     i32.xor
     i32.and
     i32.const 2
     i32.shl
     i32.add
     i32.load
     local.set $1
     block $"__inlined_func$~lib/map/Map<u32,~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet>#find$3584"
      loop $while-continue|00
       local.get $1
       if
        local.get $1
        i32.load offset=8
        local.tee $6
        i32.const 1
        i32.and
        if (result i32)
         i32.const 0
        else
         local.get $1
         i32.load
         local.get $7
         i32.eq
        end
        br_if $"__inlined_func$~lib/map/Map<u32,~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet>#find$3584"
        local.get $6
        i32.const -2
        i32.and
        local.set $1
        br $while-continue|00
       end
      end
      i32.const 0
      local.set $1
     end
     local.get $1
     if
      local.get $0
      i32.load offset=4
      local.get $0
      i32.load offset=48
      local.get $5
      i32.load
      local.get $2
      call $~lib/array/Array<~lib/array/Array<u8>>#__get
      call $"~lib/map/Map<~lib/arraybuffer/ArrayBuffer,i32>#get"
      call $~lib/array/Array<~lib/array/Array<u8>>#__get
      local.get $2
      i32.store offset=16
     end
     local.get $2
     i32.const 1
     i32.add
     local.set $2
     br $for-loop|0
    end
   end
   local.get $0
   i32.load offset=52
   i32.load offset=4
   local.set $1
   local.get $0
   i32.load offset=28
   i32.load
   local.tee $2
   i32.load offset=4
   call $~lib/arraybuffer/ArrayBuffer#constructor
   local.tee $6
   local.get $2
   i32.load
   local.get $2
   i32.load offset=4
   memory.copy
   local.get $5
   local.get $1
   local.get $6
   call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
   local.get $0
   i32.load
   call $assembly/indexer/ProtoruneBalanceSheet/ProtoruneBalanceSheet#saveToAtomicTx
   local.get $5
   local.get $0
   i32.load offset=44
   call $~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet#pipe
  end
  local.get $0
  i32.load offset=56
  local.tee $1
  i32.load
  local.get $1
  i32.load offset=4
  local.get $0
  i32.load offset=32
  i32.load offset=8
  local.tee $2
  i32.const -1028477379
  i32.mul
  i32.const 374761397
  i32.add
  i32.const 17
  i32.rotl
  i32.const 668265263
  i32.mul
  local.tee $1
  local.get $1
  i32.const 15
  i32.shr_u
  i32.xor
  i32.const -2048144777
  i32.mul
  local.tee $1
  local.get $1
  i32.const 13
  i32.shr_u
  i32.xor
  i32.const -1028477379
  i32.mul
  local.tee $1
  local.get $1
  i32.const 16
  i32.shr_u
  i32.xor
  i32.and
  i32.const 2
  i32.shl
  i32.add
  i32.load
  local.set $1
  block $"__inlined_func$~lib/map/Map<u32,~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet>#find$32050"
   loop $while-continue|01
    local.get $1
    if
     local.get $1
     i32.load offset=8
     local.tee $5
     i32.const 1
     i32.and
     if (result i32)
      i32.const 0
     else
      local.get $1
      i32.load
      local.get $2
      i32.eq
     end
     br_if $"__inlined_func$~lib/map/Map<u32,~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet>#find$32050"
     local.get $5
     i32.const -2
     i32.and
     local.set $1
     br $while-continue|01
    end
   end
   i32.const 0
   local.set $1
  end
  local.get $1
  if (result i32)
   local.get $0
   i32.load offset=56
   local.get $0
   i32.load offset=32
   i32.load offset=8
   call $"~lib/map/Map<u32,~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet>#get"
  else
   i32.const 12
   i32.const 57
   call $~lib/rt/stub/__new
   call $~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet#constructor
  end
  local.set $1
  local.get $0
  i32.load offset=56
  local.tee $2
  i32.load
  local.get $2
  i32.load offset=4
  local.get $0
  i32.load offset=24
  i32.load offset=8
  local.tee $5
  i32.const -1028477379
  i32.mul
  i32.const 374761397
  i32.add
  i32.const 17
  i32.rotl
  i32.const 668265263
  i32.mul
  local.tee $2
  local.get $2
  i32.const 15
  i32.shr_u
  i32.xor
  i32.const -2048144777
  i32.mul
  local.tee $2
  local.get $2
  i32.const 13
  i32.shr_u
  i32.xor
  i32.const -1028477379
  i32.mul
  local.tee $2
  local.get $2
  i32.const 16
  i32.shr_u
  i32.xor
  i32.and
  i32.const 2
  i32.shl
  i32.add
  i32.load
  local.set $2
  block $"__inlined_func$~lib/map/Map<u32,~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet>#find$32051"
   loop $while-continue|02
    local.get $2
    if
     local.get $2
     i32.load offset=8
     local.tee $6
     i32.const 1
     i32.and
     if (result i32)
      i32.const 0
     else
      local.get $2
      i32.load
      local.get $5
      i32.eq
     end
     br_if $"__inlined_func$~lib/map/Map<u32,~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet>#find$32051"
     local.get $6
     i32.const -2
     i32.and
     local.set $2
     br $while-continue|02
    end
   end
   i32.const 0
   local.set $2
  end
  local.get $2
  if
   local.get $0
   i32.load offset=56
   local.get $0
   i32.load offset=24
   i32.load offset=8
   call $"~lib/map/Map<u32,~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet>#get"
   local.get $1
   call $~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet#pipe
  end
  loop $for-loop|1
   local.get $3
   local.get $1
   i32.load
   local.tee $2
   i32.load offset=12
   i32.lt_s
   if
    local.get $0
    i32.load offset=48
    local.set $5
    local.get $2
    local.get $3
    call $~lib/array/Array<~lib/array/Array<u8>>#__get
    local.tee $6
    i32.const -1028477379
    i32.mul
    i32.const 374761397
    i32.add
    i32.const 17
    i32.rotl
    i32.const 668265263
    i32.mul
    local.tee $2
    local.get $2
    i32.const 15
    i32.shr_u
    i32.xor
    i32.const -2048144777
    i32.mul
    local.tee $2
    local.get $2
    i32.const 13
    i32.shr_u
    i32.xor
    i32.const -1028477379
    i32.mul
    local.set $2
    local.get $5
    i32.load
    local.get $5
    i32.load offset=4
    local.get $2
    i32.const 16
    i32.shr_u
    local.get $2
    i32.xor
    i32.and
    i32.const 2
    i32.shl
    i32.add
    i32.load
    local.set $2
    block $"__inlined_func$~lib/map/Map<u32,~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet>#find$35840"
     loop $while-continue|03
      local.get $2
      if
       local.get $2
       i32.load offset=8
       local.tee $5
       i32.const 1
       i32.and
       if (result i32)
        i32.const 0
       else
        local.get $2
        i32.load
        local.get $6
        i32.eq
       end
       br_if $"__inlined_func$~lib/map/Map<u32,~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet>#find$35840"
       local.get $5
       i32.const -2
       i32.and
       local.set $2
       br $while-continue|03
      end
     end
     i32.const 0
     local.set $2
    end
    local.get $2
    if
     local.get $0
     i32.load offset=4
     local.get $0
     i32.load offset=48
     local.get $1
     i32.load
     local.get $3
     call $~lib/array/Array<~lib/array/Array<u8>>#__get
     call $"~lib/map/Map<~lib/arraybuffer/ArrayBuffer,i32>#get"
     call $~lib/array/Array<~lib/array/Array<u8>>#__get
     local.get $3
     i32.store offset=20
    end
    local.get $3
    i32.const 1
    i32.add
    local.set $3
    br $for-loop|1
   end
  end
  local.get $0
  i32.load offset=52
  i32.load offset=4
  local.set $2
  local.get $0
  i32.load offset=32
  i32.load
  local.tee $3
  i32.load offset=4
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.tee $5
  local.get $3
  i32.load
  local.get $3
  i32.load offset=4
  memory.copy
  local.get $1
  local.get $2
  local.get $5
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
  local.get $0
  i32.load
  call $assembly/indexer/ProtoruneBalanceSheet/ProtoruneBalanceSheet#saveToAtomicTx
  local.get $1
  local.get $0
  i32.load offset=44
  call $~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet#pipe
  local.get $0
  i32.load
  call $~lib/metashrew-as/assembly/indexer/atomic/AtomicTransaction#checkpoint
  block $__inlined_func$assembly/indexer/protomessage/MessageContext/MessageContext#handle@override$2421 (result i32)
   block $default
    block $case3
     block $case2
      block $case1
       block $case0
        local.get $0
        i32.const 8
        i32.sub
        i32.load
        i32.const 117
        i32.sub
        br_table $case0 $default $default $case1 $default $default $case2 $default $default $case3 $default
       end
       local.get $0
       i32.load offset=4
       i32.const 11664
       call $~lib/array/Array<assembly/indexer/protomessage/IncomingRune/IncomingRune>#map<assembly/indexer/protomessage/IncomingRune/IncomingRune>
       i32.const 1
       br $__inlined_func$assembly/indexer/protomessage/MessageContext/MessageContext#handle@override$2421
      end
      local.get $0
      i32.load offset=4
      i32.const 11696
      call $~lib/array/Array<assembly/indexer/protomessage/IncomingRune/IncomingRune>#map<assembly/indexer/protomessage/IncomingRune/IncomingRune>
      i32.const 1
      br $__inlined_func$assembly/indexer/protomessage/MessageContext/MessageContext#handle@override$2421
     end
     local.get $0
     i32.load offset=4
     i32.const 11728
     call $~lib/array/Array<assembly/indexer/protomessage/IncomingRune/IncomingRune>#map<assembly/indexer/protomessage/IncomingRune/IncomingRune>
     i32.const 1
     br $__inlined_func$assembly/indexer/protomessage/MessageContext/MessageContext#handle@override$2421
    end
    local.get $0
    i32.load offset=4
    i32.const 12048
    call $~lib/array/Array<assembly/indexer/protomessage/IncomingRune/IncomingRune>#map<assembly/indexer/protomessage/IncomingRune/IncomingRune>
    i32.const 1
    br $__inlined_func$assembly/indexer/protomessage/MessageContext/MessageContext#handle@override$2421
   end
   i32.const 0
  end
  i32.eqz
  if
   local.get $0
   i32.load
   i32.load
   call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#clear"
  end
  local.get $0
  call $assembly/indexer/protomessage/MessageContext/MessageContext#checkBalances
  i32.eqz
  if
   local.get $0
   i32.load
   i32.load
   call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#clear"
  end
  local.get $0
  i32.load
  call $~lib/metashrew-as/assembly/indexer/atomic/AtomicTransaction#checkpoint
  local.get $0
  i32.load offset=64
  local.set $1
  local.get $0
  i32.load offset=52
  i32.load offset=36
  local.set $2
  i32.const 1
  global.set $~argumentsLength
  local.get $2
  i32.const 8592
  i32.const 0
  call $~lib/string/String.UTF8.encode@varargs
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
  local.set $3
  i32.const 1
  global.set $~argumentsLength
  local.get $3
  i32.const 6304
  i32.const 0
  call $~lib/string/String.UTF8.encode@varargs
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
  local.set $3
  i32.const 1
  global.set $~argumentsLength
  local.get $2
  i32.const 8624
  i32.const 0
  call $~lib/string/String.UTF8.encode@varargs
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
  local.set $5
  i32.const 1
  global.set $~argumentsLength
  local.get $5
  i32.const 6304
  i32.const 0
  call $~lib/string/String.UTF8.encode@varargs
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
  local.set $5
  i32.const 4
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.tee $6
  i32.const 0
  i32.store
  local.get $3
  call $~lib/metashrew-as/assembly/indexer/index/hash
  local.set $7
  global.get $~lib/metashrew-as/assembly/indexer/index/_updates
  local.get $7
  local.get $6
  call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set"
  global.get $~lib/metashrew-as/assembly/indexer/index/_updateKeys
  local.get $7
  local.get $3
  call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set"
  i32.const 4
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.tee $3
  i32.const 0
  i32.store
  local.get $5
  call $~lib/metashrew-as/assembly/indexer/index/hash
  local.set $6
  global.get $~lib/metashrew-as/assembly/indexer/index/_updates
  local.get $6
  local.get $3
  call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set"
  global.get $~lib/metashrew-as/assembly/indexer/index/_updateKeys
  local.get $6
  local.get $5
  call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set"
  local.get $1
  local.get $2
  i32.const 0
  call $~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet#save
  local.get $0
  i32.load
  local.tee $0
  i32.load offset=12
  call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#keys"
  local.tee $1
  i32.load offset=12
  call $~lib/util/number/itoa32
  local.set $2
  i32.const 2
  global.set $~argumentsLength
  local.get $2
  i32.const 1
  call $~lib/string/String.UTF8.encode@varargs
  call $~lib/metashrew-as/assembly/utils/logging/__log
  loop $for-loop|02
   local.get $4
   local.get $1
   i32.load offset=12
   i32.lt_s
   if
    local.get $0
    i32.load offset=12
    local.get $1
    local.get $4
    call $~lib/array/Array<~lib/array/Array<u8>>#__get
    call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#get"
    local.set $2
    local.get $0
    i32.load offset=8
    local.get $1
    local.get $4
    call $~lib/array/Array<~lib/array/Array<u8>>#__get
    call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#get"
    local.set $3
    local.get $2
    call $~lib/metashrew-as/assembly/indexer/index/hash
    local.set $5
    global.get $~lib/metashrew-as/assembly/indexer/index/_updates
    local.get $5
    local.get $3
    call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set"
    global.get $~lib/metashrew-as/assembly/indexer/index/_updateKeys
    local.get $5
    local.get $2
    call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#set"
    local.get $4
    i32.const 1
    i32.add
    local.set $4
    br $for-loop|02
   end
  end
  local.get $0
  i32.load offset=8
  call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#clear"
 )
 (func $assembly/indexer/Protostone/Protostone#loadBalanceSheet~anonymous|0 (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (result i32)
  (local $4 i32)
  (local $5 i32)
  local.get $0
  i32.load offset=4
  local.set $3
  local.get $0
  i32.load
  i32.load offset=4
  local.set $2
  local.get $1
  i32.load offset=4
  i32.load
  i32.const 32
  call $~lib/metashrew-as/assembly/utils/box/Box#constructor
  local.tee $4
  i32.load offset=4
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.tee $5
  local.get $4
  i32.load
  local.get $4
  i32.load offset=4
  memory.copy
  local.get $5
  call $~lib/metashrew-as/assembly/utils/utils/reverse
  local.get $1
  i32.load offset=8
  call $~lib/metashrew-as/assembly/blockdata/transaction/OutPoint.from
  i32.load
  local.tee $1
  i32.load offset=4
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.tee $4
  local.get $1
  i32.load
  local.get $1
  i32.load offset=4
  memory.copy
  local.get $3
  local.get $2
  local.get $4
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
  call $~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet.load
  call $~lib/array/Array<~lib/array/Array<u8>>#push
  drop
  local.get $0
 )
 (func $assembly/indexer/protomessage/IncomingRune/IncomingRune#deposit (param $0 i32) (param $1 i32) (result i32)
  (local $2 i64)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i64)
  local.get $0
  i32.load offset=36
  i32.load offset=4
  local.set $3
  local.get $0
  i32.load offset=32
  i32.load offset=32
  i32.load
  local.tee $4
  i32.load offset=4
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.tee $5
  local.get $4
  i32.load
  local.get $4
  i32.load offset=4
  memory.copy
  local.get $3
  local.get $5
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
  local.set $3
  i32.const 1
  global.set $~argumentsLength
  local.get $3
  i32.const 8624
  i32.const 0
  call $~lib/string/String.UTF8.encode@varargs
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
  local.set $3
  local.get $0
  i32.load offset=36
  i32.load offset=4
  local.set $4
  local.get $0
  i32.load offset=32
  i32.load offset=32
  i32.load
  local.tee $5
  i32.load offset=4
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.tee $6
  local.get $5
  i32.load
  local.get $5
  i32.load offset=4
  memory.copy
  local.get $4
  local.get $6
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
  local.set $4
  i32.const 1
  global.set $~argumentsLength
  local.get $4
  i32.const 8592
  i32.const 0
  call $~lib/string/String.UTF8.encode@varargs
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
  local.set $4
  local.get $0
  i32.load offset=20
  i32.const -1
  i32.eq
  if
   i32.const 0
   return
  end
  local.get $3
  local.get $0
  i32.load offset=20
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#selectIndex
  local.set $3
  local.get $0
  i32.load offset=32
  i32.load
  local.get $4
  local.get $0
  i32.load offset=20
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#selectIndex
  call $~lib/metashrew-as/assembly/indexer/atomic/AtomicTransaction#get
  local.set $4
  local.get $0
  i32.load offset=32
  i32.load
  local.get $3
  call $~lib/metashrew-as/assembly/indexer/atomic/AtomicTransaction#get
  call $~lib/metashrew-runes/assembly/utils/fromArrayBuffer
  local.set $5
  local.get $1
  i64.load offset=8
  local.tee $2
  local.get $0
  i32.load offset=4
  local.tee $6
  i64.load offset=8
  local.tee $7
  i64.eq
  if (result i32)
   local.get $1
   i64.load
   local.get $6
   i64.load
   i64.gt_u
  else
   local.get $2
   local.get $7
   i64.gt_u
  end
  if (result i32)
   i32.const 1
  else
   local.get $1
   i64.load offset=8
   local.tee $2
   local.get $5
   i64.load offset=8
   local.tee $7
   i64.eq
   if (result i32)
    local.get $1
    i64.load
    local.get $5
    i64.load
    i64.gt_u
   else
    local.get $2
    local.get $7
    i64.gt_u
   end
  end
  if
   i32.const 0
   return
  end
  local.get $5
  i64.load
  local.tee $2
  local.get $1
  i64.load
  i64.sub
  local.set $7
  local.get $5
  i64.load offset=8
  local.get $1
  i64.load offset=8
  i64.sub
  local.get $2
  local.get $7
  i64.lt_u
  i64.extend_i32_u
  i64.sub
  local.set $2
  i32.const 16
  i32.const 9
  call $~lib/rt/stub/__new
  local.tee $5
  local.get $7
  i64.store
  local.get $5
  local.get $2
  i64.store offset=8
  i32.const 16
  i32.const 9
  call $~lib/rt/stub/__new
  local.tee $6
  i64.const 0
  i64.store
  local.get $6
  i64.const 0
  i64.store offset=8
  local.get $5
  i64.load offset=8
  local.tee $2
  local.get $6
  i64.load offset=8
  local.tee $7
  i64.eq
  if (result i32)
   local.get $5
   i64.load
   local.get $6
   i64.load
   i64.gt_u
  else
   local.get $2
   local.get $7
   i64.gt_u
  end
  if
   local.get $0
   i32.load offset=32
   i32.load
   local.get $3
   local.get $5
   call $~lib/metashrew-runes/assembly/utils/toArrayBuffer
   call $~lib/metashrew-as/assembly/indexer/atomic/AtomicTransaction#set
  else
   local.get $0
   i32.load offset=32
   i32.load
   local.get $3
   i32.const 0
   call $~lib/arraybuffer/ArrayBuffer#constructor
   call $~lib/metashrew-as/assembly/indexer/atomic/AtomicTransaction#set
  end
  local.get $0
  i32.load offset=32
  i32.load offset=64
  local.get $4
  local.get $1
  call $~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet#increase
  local.get $0
  i32.load offset=4
  local.tee $3
  i64.load
  local.tee $2
  local.get $1
  i64.load
  i64.sub
  local.set $7
  local.get $3
  i64.load offset=8
  local.get $1
  i64.load offset=8
  i64.sub
  local.get $2
  local.get $7
  i64.lt_u
  i64.extend_i32_u
  i64.sub
  local.set $2
  i32.const 16
  i32.const 9
  call $~lib/rt/stub/__new
  local.tee $3
  local.get $7
  i64.store
  local.get $3
  local.get $2
  i64.store offset=8
  local.get $0
  local.get $3
  i32.store offset=4
  local.get $0
  i32.load offset=8
  local.tee $3
  i64.load
  local.tee $2
  local.get $1
  i64.load
  i64.add
  local.set $7
  local.get $2
  local.get $7
  i64.gt_u
  i64.extend_i32_u
  local.get $3
  i64.load offset=8
  local.get $1
  i64.load offset=8
  i64.add
  i64.add
  local.set $2
  i32.const 16
  i32.const 9
  call $~lib/rt/stub/__new
  local.tee $1
  local.get $7
  i64.store
  local.get $1
  local.get $2
  i64.store offset=8
  local.get $0
  local.get $1
  i32.store offset=8
  i32.const 1
 )
 (func $assembly/test/DepositAllContext#handle~anonymous|0 (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  local.get $0
  local.get $0
  i32.load offset=4
  call $assembly/indexer/protomessage/IncomingRune/IncomingRune#deposit
  drop
  local.get $0
 )
 (func $~lib/array/Array<assembly/indexer/protomessage/IncomingRune/IncomingRune>#map<assembly/indexer/protomessage/IncomingRune/IncomingRune> (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  local.get $0
  i32.load offset=12
  local.tee $3
  i32.const 2
  i32.const 55
  i32.const 0
  call $~lib/rt/__newArray
  i32.load offset=4
  local.set $4
  loop $for-loop|0
   local.get $2
   local.get $3
   local.get $0
   i32.load offset=12
   local.tee $5
   local.get $3
   local.get $5
   i32.lt_s
   select
   i32.lt_s
   if
    local.get $2
    i32.const 2
    i32.shl
    local.tee $5
    local.get $0
    i32.load offset=4
    i32.add
    i32.load
    local.set $6
    i32.const 3
    global.set $~argumentsLength
    local.get $4
    local.get $5
    i32.add
    local.get $6
    local.get $2
    local.get $0
    local.get $1
    i32.load
    call_indirect (type $2)
    i32.store
    local.get $2
    i32.const 1
    i32.add
    local.set $2
    br $for-loop|0
   end
  end
 )
 (func $assembly/indexer/protomessage/IncomingRune/IncomingRune#forward (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i64)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i64)
  local.get $0
  i32.load offset=36
  i32.load offset=4
  local.set $2
  local.get $0
  i32.load offset=32
  i32.load offset=32
  i32.load
  local.tee $4
  i32.load offset=4
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.tee $5
  local.get $4
  i32.load
  local.get $4
  i32.load offset=4
  memory.copy
  local.get $2
  local.get $5
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
  local.set $2
  i32.const 1
  global.set $~argumentsLength
  local.get $2
  i32.const 8624
  i32.const 0
  call $~lib/string/String.UTF8.encode@varargs
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
  local.set $2
  local.get $0
  i32.load offset=36
  i32.load offset=4
  local.set $4
  local.get $0
  i32.load offset=32
  i32.load offset=32
  i32.load
  local.tee $5
  i32.load offset=4
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.tee $6
  local.get $5
  i32.load
  local.get $5
  i32.load offset=4
  memory.copy
  local.get $4
  local.get $6
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
  local.set $4
  i32.const 1
  global.set $~argumentsLength
  local.get $4
  i32.const 8592
  i32.const 0
  call $~lib/string/String.UTF8.encode@varargs
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
  local.set $4
  local.get $0
  i32.load offset=36
  i32.load offset=4
  local.set $5
  local.get $0
  i32.load offset=32
  i32.load offset=28
  i32.load
  local.tee $6
  i32.load offset=4
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.tee $7
  local.get $6
  i32.load
  local.get $6
  i32.load offset=4
  memory.copy
  local.get $5
  local.get $7
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
  local.set $5
  i32.const 1
  global.set $~argumentsLength
  local.get $5
  i32.const 8624
  i32.const 0
  call $~lib/string/String.UTF8.encode@varargs
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
  local.set $5
  local.get $0
  i32.load offset=36
  i32.load offset=4
  local.set $6
  local.get $0
  i32.load offset=32
  i32.load offset=28
  i32.load
  local.tee $7
  i32.load offset=4
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.tee $8
  local.get $7
  i32.load
  local.get $7
  i32.load offset=4
  memory.copy
  local.get $6
  local.get $8
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
  local.set $6
  i32.const 1
  global.set $~argumentsLength
  local.get $6
  i32.const 8592
  i32.const 0
  call $~lib/string/String.UTF8.encode@varargs
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
  local.set $6
  local.get $0
  i32.load offset=20
  i32.const -1
  i32.eq
  if
   i32.const 0
   return
  end
  local.get $2
  local.get $0
  i32.load offset=20
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#selectIndex
  local.set $2
  local.get $0
  i32.load offset=32
  i32.load
  local.get $4
  local.get $0
  i32.load offset=20
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#selectIndex
  call $~lib/metashrew-as/assembly/indexer/atomic/AtomicTransaction#get
  local.set $4
  local.get $0
  i32.load offset=32
  i32.load
  local.get $2
  call $~lib/metashrew-as/assembly/indexer/atomic/AtomicTransaction#get
  call $~lib/metashrew-runes/assembly/utils/fromArrayBuffer
  local.set $7
  local.get $1
  i64.load offset=8
  local.tee $3
  local.get $0
  i32.load offset=4
  local.tee $8
  i64.load offset=8
  local.tee $9
  i64.eq
  if (result i32)
   local.get $1
   i64.load
   local.get $8
   i64.load
   i64.gt_u
  else
   local.get $3
   local.get $9
   i64.gt_u
  end
  if (result i32)
   i32.const 1
  else
   local.get $1
   i64.load offset=8
   local.tee $3
   local.get $7
   i64.load offset=8
   local.tee $9
   i64.eq
   if (result i32)
    local.get $1
    i64.load
    local.get $7
    i64.load
    i64.gt_u
   else
    local.get $3
    local.get $9
    i64.gt_u
   end
  end
  if
   i32.const 0
   return
  end
  local.get $7
  i64.load
  local.tee $3
  local.get $1
  i64.load
  i64.sub
  local.set $9
  local.get $7
  i64.load offset=8
  local.get $1
  i64.load offset=8
  i64.sub
  local.get $3
  local.get $9
  i64.lt_u
  i64.extend_i32_u
  i64.sub
  local.set $3
  i32.const 16
  i32.const 9
  call $~lib/rt/stub/__new
  local.tee $7
  local.get $9
  i64.store
  local.get $7
  local.get $3
  i64.store offset=8
  i32.const 16
  i32.const 9
  call $~lib/rt/stub/__new
  local.tee $8
  i64.const 0
  i64.store
  local.get $8
  i64.const 0
  i64.store offset=8
  local.get $7
  i64.load offset=8
  local.tee $3
  local.get $8
  i64.load offset=8
  local.tee $9
  i64.eq
  if (result i32)
   local.get $7
   i64.load
   local.get $8
   i64.load
   i64.gt_u
  else
   local.get $3
   local.get $9
   i64.gt_u
  end
  if
   local.get $0
   i32.load offset=32
   i32.load
   local.get $2
   local.get $7
   call $~lib/metashrew-runes/assembly/utils/toArrayBuffer
   call $~lib/metashrew-as/assembly/indexer/atomic/AtomicTransaction#set
  else
   local.get $0
   i32.load offset=32
   i32.load
   local.get $2
   i32.const 0
   call $~lib/arraybuffer/ArrayBuffer#constructor
   call $~lib/metashrew-as/assembly/indexer/atomic/AtomicTransaction#set
  end
  local.get $0
  i32.load offset=16
  i32.const -1
  i32.eq
  if
   i32.const 1
   global.set $~argumentsLength
   local.get $0
   local.get $5
   i32.const 6304
   i32.const 0
   call $~lib/string/String.UTF8.encode@varargs
   call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
   call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#getValue<u32>
   i32.store offset=16
   local.get $0
   i32.load offset=32
   i32.load
   local.get $5
   call $~lib/metashrew-as/assembly/indexer/atomic/AtomicTransaction#extendIndexPointerList
   local.set $2
   local.get $0
   i32.load offset=32
   i32.load
   local.get $0
   i32.load offset=32
   i32.load
   local.get $6
   call $~lib/metashrew-as/assembly/indexer/atomic/AtomicTransaction#extendIndexPointerList
   local.get $4
   call $~lib/metashrew-as/assembly/indexer/atomic/AtomicTransaction#set
  else
   local.get $5
   local.get $0
   i32.load offset=16
   call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#selectIndex
   local.set $2
  end
  local.get $0
  i32.load offset=32
  i32.load
  local.get $2
  local.get $1
  call $~lib/metashrew-runes/assembly/utils/toArrayBuffer
  call $~lib/metashrew-as/assembly/indexer/atomic/AtomicTransaction#set
  local.get $0
  i32.load offset=4
  local.tee $2
  i64.load
  local.tee $3
  local.get $1
  i64.load
  i64.sub
  local.set $9
  local.get $2
  i64.load offset=8
  local.get $1
  i64.load offset=8
  i64.sub
  local.get $3
  local.get $9
  i64.lt_u
  i64.extend_i32_u
  i64.sub
  local.set $3
  i32.const 16
  i32.const 9
  call $~lib/rt/stub/__new
  local.tee $2
  local.get $9
  i64.store
  local.get $2
  local.get $3
  i64.store offset=8
  local.get $0
  local.get $2
  i32.store offset=4
  local.get $1
  call $~lib/as-bignum/assembly/integer/u128/u128#toString
  local.set $0
  i32.const 2
  global.set $~argumentsLength
  local.get $0
  i32.const 1
  call $~lib/string/String.UTF8.encode@varargs
  call $~lib/metashrew-as/assembly/utils/logging/__log
  i32.const 1
 )
 (func $assembly/test/ForwardAllContext#handle~anonymous|0 (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  local.get $0
  local.get $0
  i32.load offset=4
  call $assembly/indexer/protomessage/IncomingRune/IncomingRune#forward
  drop
  local.get $0
 )
 (func $assembly/test/SimpleMessageContext#handle~anonymous|0 (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i64)
  (local $4 i64)
  local.get $0
  i32.load offset=4
  local.set $1
  i32.const 16
  i32.const 9
  call $~lib/rt/stub/__new
  local.tee $2
  i64.const 2
  i64.store
  local.get $2
  i64.const 0
  i64.store offset=8
  local.get $1
  i64.load
  local.get $1
  i64.load offset=8
  local.get $2
  i64.load
  local.get $2
  i64.load offset=8
  call $~lib/as-bignum/assembly/globals/__udivmod128
  local.set $3
  global.get $~lib/as-bignum/assembly/globals/__divmod_quot_hi
  local.set $4
  i32.const 16
  i32.const 9
  call $~lib/rt/stub/__new
  local.tee $2
  local.get $3
  i64.store
  local.get $2
  local.get $4
  i64.store offset=8
  local.get $0
  local.get $2
  call $assembly/indexer/protomessage/IncomingRune/IncomingRune#forward
  drop
  i32.const 16
  i32.const 9
  call $~lib/rt/stub/__new
  local.tee $2
  i64.const 4
  i64.store
  local.get $2
  i64.const 0
  i64.store offset=8
  local.get $1
  i64.load
  local.get $1
  i64.load offset=8
  local.get $2
  i64.load
  local.get $2
  i64.load offset=8
  call $~lib/as-bignum/assembly/globals/__udivmod128
  local.set $3
  global.get $~lib/as-bignum/assembly/globals/__divmod_quot_hi
  local.set $4
  i32.const 16
  i32.const 9
  call $~lib/rt/stub/__new
  local.tee $1
  local.get $3
  i64.store
  local.get $1
  local.get $4
  i64.store offset=8
  local.get $0
  local.get $1
  call $assembly/indexer/protomessage/IncomingRune/IncomingRune#deposit
  drop
  local.get $0
 )
 (func $assembly/indexer/protomessage/IncomingRune/IncomingRune#refund (param $0 i32) (param $1 i32) (result i32)
  (local $2 i64)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i64)
  (local $9 i32)
  local.get $0
  i32.load offset=36
  i32.load offset=4
  local.set $3
  local.get $0
  i32.load offset=32
  i32.load offset=32
  i32.load
  local.tee $4
  i32.load offset=4
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.tee $5
  local.get $4
  i32.load
  local.get $4
  i32.load offset=4
  memory.copy
  local.get $3
  local.get $5
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
  local.set $3
  i32.const 1
  global.set $~argumentsLength
  local.get $3
  i32.const 8624
  i32.const 0
  call $~lib/string/String.UTF8.encode@varargs
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
  local.set $5
  local.get $0
  i32.load offset=36
  i32.load offset=4
  local.set $3
  local.get $0
  i32.load offset=32
  i32.load offset=28
  i32.load
  local.tee $4
  i32.load offset=4
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.tee $6
  local.get $4
  i32.load
  local.get $4
  i32.load offset=4
  memory.copy
  local.get $3
  local.get $6
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
  local.set $3
  i32.const 1
  global.set $~argumentsLength
  local.get $3
  i32.const 8624
  i32.const 0
  call $~lib/string/String.UTF8.encode@varargs
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
  local.set $3
  local.get $0
  i32.load offset=16
  call $~lib/util/number/itoa32
  local.set $4
  i32.const 2
  global.set $~argumentsLength
  local.get $4
  i32.const 1
  call $~lib/string/String.UTF8.encode@varargs
  call $~lib/metashrew-as/assembly/utils/logging/__log
  local.get $0
  i32.load offset=16
  i32.const -1
  i32.eq
  if
   i32.const 0
   return
  end
  local.get $3
  local.get $0
  i32.load offset=16
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#selectIndex
  local.set $6
  local.get $0
  i32.load offset=32
  i32.load
  local.get $6
  call $~lib/metashrew-as/assembly/indexer/atomic/AtomicTransaction#get
  call $~lib/metashrew-runes/assembly/utils/fromArrayBuffer
  local.tee $7
  call $~lib/as-bignum/assembly/integer/u128/u128#toString
  i32.const 11920
  call $~lib/string/String.__concat
  local.get $1
  call $~lib/as-bignum/assembly/integer/u128/u128#toString
  call $~lib/string/String.__concat
  local.set $3
  i32.const 2
  global.set $~argumentsLength
  local.get $3
  i32.const 1
  call $~lib/string/String.UTF8.encode@varargs
  call $~lib/metashrew-as/assembly/utils/logging/__log
  local.get $1
  i64.load offset=8
  local.tee $2
  local.get $7
  i64.load offset=8
  local.tee $8
  i64.eq
  if (result i32)
   local.get $1
   i64.load
   local.get $7
   i64.load
   i64.gt_u
  else
   local.get $2
   local.get $8
   i64.gt_u
  end
  if (result i32)
   i32.const 1
  else
   local.get $7
   i64.load
   local.tee $2
   local.get $1
   i64.load
   i64.add
   local.set $8
   local.get $2
   local.get $8
   i64.gt_u
   i64.extend_i32_u
   local.get $7
   i64.load offset=8
   local.get $1
   i64.load offset=8
   i64.add
   i64.add
   local.set $2
   i32.const 16
   i32.const 9
   call $~lib/rt/stub/__new
   local.tee $3
   local.get $8
   i64.store
   local.get $3
   local.get $2
   i64.store offset=8
   local.get $0
   i32.load offset=12
   local.tee $4
   i64.load
   local.tee $2
   local.get $0
   i32.load offset=8
   local.tee $9
   i64.load
   i64.sub
   local.set $8
   local.get $4
   i64.load offset=8
   local.get $9
   i64.load offset=8
   i64.sub
   local.get $2
   local.get $8
   i64.lt_u
   i64.extend_i32_u
   i64.sub
   local.set $2
   i32.const 16
   i32.const 9
   call $~lib/rt/stub/__new
   local.tee $4
   local.get $8
   i64.store
   local.get $4
   local.get $2
   i64.store offset=8
   local.get $3
   i64.load offset=8
   local.tee $2
   local.get $4
   i64.load offset=8
   local.tee $8
   i64.eq
   if (result i32)
    local.get $3
    i64.load
    local.get $4
    i64.load
    i64.gt_u
   else
    local.get $2
    local.get $8
    i64.gt_u
   end
  end
  if
   i32.const 0
   return
  end
  local.get $7
  i64.load
  local.tee $2
  local.get $1
  i64.load
  i64.sub
  local.set $8
  local.get $7
  i64.load offset=8
  local.get $1
  i64.load offset=8
  i64.sub
  local.get $2
  local.get $8
  i64.lt_u
  i64.extend_i32_u
  i64.sub
  local.set $2
  i32.const 16
  i32.const 9
  call $~lib/rt/stub/__new
  local.tee $3
  local.get $8
  i64.store
  local.get $3
  local.get $2
  i64.store offset=8
  i32.const 16
  i32.const 9
  call $~lib/rt/stub/__new
  local.tee $4
  i64.const 0
  i64.store
  local.get $4
  i64.const 0
  i64.store offset=8
  local.get $3
  i64.load offset=8
  local.tee $2
  local.get $4
  i64.load offset=8
  local.tee $8
  i64.eq
  if (result i32)
   local.get $3
   i64.load
   local.get $4
   i64.load
   i64.gt_u
  else
   local.get $2
   local.get $8
   i64.gt_u
  end
  if
   local.get $0
   i32.load offset=32
   i32.load
   local.get $6
   local.get $3
   call $~lib/metashrew-runes/assembly/utils/toArrayBuffer
   call $~lib/metashrew-as/assembly/indexer/atomic/AtomicTransaction#set
  else
   local.get $0
   i32.load offset=32
   i32.load
   local.get $6
   i32.const 0
   call $~lib/arraybuffer/ArrayBuffer#constructor
   call $~lib/metashrew-as/assembly/indexer/atomic/AtomicTransaction#set
  end
  local.get $5
  local.get $0
  i32.load offset=20
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#selectIndex
  local.set $3
  local.get $0
  i32.load offset=4
  local.tee $4
  i64.load
  local.tee $2
  local.get $1
  i64.load
  i64.add
  local.set $8
  local.get $2
  local.get $8
  i64.gt_u
  i64.extend_i32_u
  local.get $4
  i64.load offset=8
  local.get $1
  i64.load offset=8
  i64.add
  i64.add
  local.set $2
  i32.const 16
  i32.const 9
  call $~lib/rt/stub/__new
  local.tee $4
  local.get $8
  i64.store
  local.get $4
  local.get $2
  i64.store offset=8
  local.get $0
  local.get $4
  i32.store offset=4
  local.get $0
  i32.load offset=32
  i32.load
  local.get $3
  local.get $0
  i32.load offset=4
  call $~lib/metashrew-runes/assembly/utils/toArrayBuffer
  call $~lib/metashrew-as/assembly/indexer/atomic/AtomicTransaction#set
  local.get $1
  call $~lib/as-bignum/assembly/integer/u128/u128#toString
  local.set $0
  i32.const 2
  global.set $~argumentsLength
  local.get $0
  i32.const 1
  call $~lib/string/String.UTF8.encode@varargs
  call $~lib/metashrew-as/assembly/utils/logging/__log
  i32.const 1
 )
 (func $assembly/test/RefundMessageContext#handle~anonymous|0 (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i64)
  (local $4 i64)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  local.get $0
  i32.load offset=4
  local.set $1
  i32.const 16
  i32.const 9
  call $~lib/rt/stub/__new
  local.tee $2
  i64.const 2
  i64.store
  local.get $2
  i64.const 0
  i64.store offset=8
  local.get $1
  i64.load
  local.get $1
  i64.load offset=8
  local.get $2
  i64.load
  local.get $2
  i64.load offset=8
  call $~lib/as-bignum/assembly/globals/__udivmod128
  local.set $3
  global.get $~lib/as-bignum/assembly/globals/__divmod_quot_hi
  local.set $4
  i32.const 16
  i32.const 9
  call $~lib/rt/stub/__new
  local.tee $2
  local.get $3
  i64.store
  local.get $2
  local.get $4
  i64.store offset=8
  i32.const 11760
  i32.const 11808
  i32.const 11840
  local.get $0
  local.get $2
  call $assembly/indexer/protomessage/IncomingRune/IncomingRune#forward
  select
  call $~lib/string/String.__concat
  local.set $2
  i32.const 2
  global.set $~argumentsLength
  local.get $2
  i32.const 1
  call $~lib/string/String.UTF8.encode@varargs
  call $~lib/metashrew-as/assembly/utils/logging/__log
  i32.const 16
  i32.const 9
  call $~lib/rt/stub/__new
  local.tee $2
  i64.const 4
  i64.store
  local.get $2
  i64.const 0
  i64.store offset=8
  local.get $1
  i64.load
  local.get $1
  i64.load offset=8
  local.get $2
  i64.load
  local.get $2
  i64.load offset=8
  call $~lib/as-bignum/assembly/globals/__udivmod128
  local.set $3
  global.get $~lib/as-bignum/assembly/globals/__divmod_quot_hi
  local.set $4
  i32.const 16
  i32.const 9
  call $~lib/rt/stub/__new
  local.tee $2
  local.get $3
  i64.store
  local.get $2
  local.get $4
  i64.store offset=8
  i32.const 11872
  i32.const 11808
  i32.const 11840
  local.get $0
  local.get $2
  call $assembly/indexer/protomessage/IncomingRune/IncomingRune#deposit
  select
  call $~lib/string/String.__concat
  local.set $2
  i32.const 2
  global.set $~argumentsLength
  local.get $2
  i32.const 1
  call $~lib/string/String.UTF8.encode@varargs
  call $~lib/metashrew-as/assembly/utils/logging/__log
  i32.const 16
  i32.const 9
  call $~lib/rt/stub/__new
  local.tee $2
  i64.const 8
  i64.store
  local.get $2
  i64.const 0
  i64.store offset=8
  local.get $1
  i64.load
  local.get $1
  i64.load offset=8
  local.get $2
  i64.load
  local.get $2
  i64.load offset=8
  call $~lib/as-bignum/assembly/globals/__udivmod128
  local.set $3
  global.get $~lib/as-bignum/assembly/globals/__divmod_quot_hi
  local.set $4
  i32.const 16
  i32.const 9
  call $~lib/rt/stub/__new
  local.tee $2
  local.get $3
  i64.store
  local.get $2
  local.get $4
  i64.store offset=8
  i32.const 11952
  i32.const 11808
  i32.const 11840
  local.get $0
  local.get $2
  call $assembly/indexer/protomessage/IncomingRune/IncomingRune#refund
  select
  call $~lib/string/String.__concat
  local.set $2
  i32.const 2
  global.set $~argumentsLength
  local.get $2
  i32.const 1
  call $~lib/string/String.UTF8.encode@varargs
  call $~lib/metashrew-as/assembly/utils/logging/__log
  i32.const 16
  i32.const 9
  call $~lib/rt/stub/__new
  local.tee $2
  i64.const 4
  i64.store
  local.get $2
  i64.const 0
  i64.store offset=8
  local.get $1
  i64.load
  local.get $1
  i64.load offset=8
  local.get $2
  i64.load
  local.get $2
  i64.load offset=8
  call $~lib/as-bignum/assembly/globals/__udivmod128
  local.set $3
  global.get $~lib/as-bignum/assembly/globals/__divmod_quot_hi
  local.set $4
  i32.const 16
  i32.const 9
  call $~lib/rt/stub/__new
  local.tee $2
  local.get $3
  i64.store
  local.get $2
  local.get $4
  i64.store offset=8
  i32.const 12000
  i32.const 11808
  i32.const 11840
  local.get $0
  local.get $2
  call $assembly/indexer/protomessage/IncomingRune/IncomingRune#refund
  select
  call $~lib/string/String.__concat
  local.set $2
  i32.const 2
  global.set $~argumentsLength
  local.get $2
  i32.const 1
  call $~lib/string/String.UTF8.encode@varargs
  call $~lib/metashrew-as/assembly/utils/logging/__log
  i32.const 16
  i32.const 9
  call $~lib/rt/stub/__new
  local.tee $2
  i64.const 4
  i64.store
  local.get $2
  i64.const 0
  i64.store offset=8
  local.get $1
  i64.load
  local.get $1
  i64.load offset=8
  local.get $2
  i64.load
  local.get $2
  i64.load offset=8
  call $~lib/as-bignum/assembly/globals/__udivmod128
  local.set $3
  global.get $~lib/as-bignum/assembly/globals/__divmod_quot_hi
  local.set $4
  i32.const 16
  i32.const 9
  call $~lib/rt/stub/__new
  local.tee $2
  local.get $3
  i64.store
  local.get $2
  local.get $4
  i64.store offset=8
  block $__inlined_func$assembly/indexer/protomessage/IncomingRune/IncomingRune#refundDeposit$208
   local.get $0
   i32.load offset=20
   i32.const -1
   i32.eq
   br_if $__inlined_func$assembly/indexer/protomessage/IncomingRune/IncomingRune#refundDeposit$208
   local.get $0
   i32.load offset=36
   i32.load offset=4
   local.set $1
   local.get $0
   i32.load offset=32
   i32.load offset=32
   i32.load
   local.tee $5
   i32.load offset=4
   call $~lib/arraybuffer/ArrayBuffer#constructor
   local.tee $6
   local.get $5
   i32.load
   local.get $5
   i32.load offset=4
   memory.copy
   local.get $1
   local.get $6
   call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
   local.set $1
   i32.const 1
   global.set $~argumentsLength
   local.get $1
   i32.const 8624
   i32.const 0
   call $~lib/string/String.UTF8.encode@varargs
   call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
   local.set $5
   local.get $0
   i32.load offset=36
   i32.load offset=4
   local.set $6
   local.get $0
   i32.load offset=32
   i32.load offset=32
   i32.load
   local.tee $1
   i32.load offset=4
   call $~lib/arraybuffer/ArrayBuffer#constructor
   local.tee $7
   local.get $1
   i32.load
   local.get $1
   i32.load offset=4
   memory.copy
   local.get $6
   local.get $7
   call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
   local.set $1
   i32.const 1
   global.set $~argumentsLength
   local.get $1
   i32.const 8592
   i32.const 0
   call $~lib/string/String.UTF8.encode@varargs
   call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
   local.get $0
   i32.load offset=20
   call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#selectIndex
   local.set $1
   local.get $0
   i32.load offset=32
   i32.load
   local.get $1
   call $~lib/metashrew-as/assembly/indexer/atomic/AtomicTransaction#get
   local.set $1
   local.get $0
   i32.load offset=32
   i32.load offset=64
   local.get $1
   call $~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet#get
   local.set $6
   local.get $2
   i64.load offset=8
   local.tee $3
   local.get $6
   i64.load offset=8
   local.tee $4
   i64.eq
   if (result i32)
    local.get $2
    i64.load
    local.get $6
    i64.load
    i64.gt_u
   else
    local.get $3
    local.get $4
    i64.gt_u
   end
   br_if $__inlined_func$assembly/indexer/protomessage/IncomingRune/IncomingRune#refundDeposit$208
   local.get $0
   i32.load offset=32
   i32.load offset=64
   local.get $1
   local.get $2
   call $~lib/metashrew-runes/assembly/indexer/BalanceSheet/BalanceSheet#decrease
   local.get $5
   local.get $0
   i32.load offset=20
   call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#selectIndex
   local.set $1
   local.get $0
   i32.load offset=4
   local.tee $5
   i64.load
   local.tee $3
   local.get $2
   i64.load
   i64.add
   local.set $4
   local.get $3
   local.get $4
   i64.gt_u
   i64.extend_i32_u
   local.get $5
   i64.load offset=8
   local.get $2
   i64.load offset=8
   i64.add
   i64.add
   local.set $3
   i32.const 16
   i32.const 9
   call $~lib/rt/stub/__new
   local.tee $5
   local.get $4
   i64.store
   local.get $5
   local.get $3
   i64.store offset=8
   local.get $0
   local.get $5
   i32.store offset=4
   local.get $0
   i32.load offset=8
   local.tee $5
   i64.load
   local.tee $3
   local.get $2
   i64.load
   i64.sub
   local.set $4
   local.get $5
   i64.load offset=8
   local.get $2
   i64.load offset=8
   i64.sub
   local.get $3
   local.get $4
   i64.lt_u
   i64.extend_i32_u
   i64.sub
   local.set $3
   i32.const 16
   i32.const 9
   call $~lib/rt/stub/__new
   local.tee $2
   local.get $4
   i64.store
   local.get $2
   local.get $3
   i64.store offset=8
   local.get $0
   local.get $2
   i32.store offset=8
   local.get $0
   i32.load offset=32
   i32.load
   local.get $1
   local.get $0
   i32.load offset=4
   call $~lib/metashrew-runes/assembly/utils/toArrayBuffer
   call $~lib/metashrew-as/assembly/indexer/atomic/AtomicTransaction#set
  end
  local.get $0
 )
 (func $~lib/metashrew-runes/assembly/proto/metashrew-runes/__proto.Decoder#varint@override (param $0 i32) (result i64)
  local.get $0
  i32.const 8
  i32.sub
  i32.load
  i32.const 92
  i32.eq
  if
   local.get $0
   call $~lib/metashrew-runes/assembly/proto/metashrew-runes/__proto.SafeDecoder#varint
   return
  end
  local.get $0
  call $~lib/metashrew-runes/assembly/proto/metashrew-runes/__proto.Decoder#varint
 )
 (func $assembly/proto/protorune/__proto.Decoder#varint@override (param $0 i32) (result i64)
  local.get $0
  i32.const 8
  i32.sub
  i32.load
  i32.const 105
  i32.eq
  if
   local.get $0
   call $~lib/metashrew-runes/assembly/proto/metashrew-runes/__proto.SafeDecoder#varint
   return
  end
  local.get $0
  call $assembly/proto/protorune/__proto.Decoder#varint
 )
 (func $~start
  (local $0 i32)
  (local $1 i32)
  i32.const 12636
  global.set $~lib/rt/stub/offset
  i32.const 0
  i32.const 5
  call $~lib/rt/stub/__new
  i32.eqz
  if
   i32.const 0
   i32.const 0
   call $~lib/rt/stub/__new
   drop
  end
  call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#constructor"
  global.set $~lib/metashrew-as/assembly/indexer/index/_updates
  call $"~lib/map/Map<~lib/string/String,~lib/arraybuffer/ArrayBuffer>#constructor"
  global.set $~lib/metashrew-as/assembly/indexer/index/_updateKeys
  i32.const 0
  i32.const 8
  call $~lib/rt/stub/__new
  i32.eqz
  if
   i32.const 0
   i32.const 0
   call $~lib/rt/stub/__new
   drop
  end
  i32.const 1
  global.set $~argumentsLength
  i32.const 2768
  i32.const 0
  call $~lib/string/String.UTF8.encode@varargs
  global.set $~lib/metashrew-as/assembly/utils/b32/ONE
  i32.const 0
  call $~lib/staticarray/StaticArray<u8>#__get
  global.set $~lib/metashrew-as/assembly/utils/b58/LEADER
  i32.const 1
  global.set $~argumentsLength
  i32.const 3472
  i32.const 0
  call $~lib/string/String.UTF8.encode@varargs
  global.set $~lib/metashrew-runes/assembly/indexer/constants/index/HEIGHT_TO_BLOCKHASH
  i32.const 1
  global.set $~argumentsLength
  i32.const 3536
  i32.const 0
  call $~lib/string/String.UTF8.encode@varargs
  global.set $~lib/metashrew-runes/assembly/indexer/constants/index/BLOCKHASH_TO_HEIGHT
  i32.const 1
  global.set $~argumentsLength
  i32.const 3600
  i32.const 0
  call $~lib/string/String.UTF8.encode@varargs
  global.set $~lib/metashrew-runes/assembly/indexer/constants/index/OUTPOINT_TO_RUNES
  i32.const 1
  global.set $~argumentsLength
  i32.const 3664
  i32.const 0
  call $~lib/string/String.UTF8.encode@varargs
  global.set $~lib/metashrew-runes/assembly/indexer/constants/index/OUTPOINT_TO_HEIGHT
  i32.const 1
  global.set $~argumentsLength
  i32.const 3728
  i32.const 0
  call $~lib/string/String.UTF8.encode@varargs
  global.set $~lib/metashrew-runes/assembly/indexer/constants/index/HEIGHT_TO_TRANSACTION_IDS
  i32.const 1
  global.set $~argumentsLength
  i32.const 3792
  i32.const 0
  call $~lib/string/String.UTF8.encode@varargs
  global.set $~lib/metashrew-runes/assembly/indexer/constants/index/SYMBOL
  i32.const 1
  global.set $~argumentsLength
  i32.const 3840
  i32.const 0
  call $~lib/string/String.UTF8.encode@varargs
  global.set $~lib/metashrew-runes/assembly/indexer/constants/index/CAP
  i32.const 1
  global.set $~argumentsLength
  i32.const 3888
  i32.const 0
  call $~lib/string/String.UTF8.encode@varargs
  global.set $~lib/metashrew-runes/assembly/indexer/constants/index/SPACERS
  i32.const 1
  global.set $~argumentsLength
  i32.const 3936
  i32.const 0
  call $~lib/string/String.UTF8.encode@varargs
  global.set $~lib/metashrew-runes/assembly/indexer/constants/index/OFFSETEND
  i32.const 1
  global.set $~argumentsLength
  i32.const 4000
  i32.const 0
  call $~lib/string/String.UTF8.encode@varargs
  global.set $~lib/metashrew-runes/assembly/indexer/constants/index/OFFSETSTART
  i32.const 1
  global.set $~argumentsLength
  i32.const 4064
  i32.const 0
  call $~lib/string/String.UTF8.encode@varargs
  global.set $~lib/metashrew-runes/assembly/indexer/constants/index/HEIGHTSTART
  i32.const 1
  global.set $~argumentsLength
  i32.const 4128
  i32.const 0
  call $~lib/string/String.UTF8.encode@varargs
  global.set $~lib/metashrew-runes/assembly/indexer/constants/index/HEIGHTEND
  i32.const 1
  global.set $~argumentsLength
  i32.const 4192
  i32.const 0
  call $~lib/string/String.UTF8.encode@varargs
  global.set $~lib/metashrew-runes/assembly/indexer/constants/index/AMOUNT
  i32.const 1
  global.set $~argumentsLength
  i32.const 4240
  i32.const 0
  call $~lib/string/String.UTF8.encode@varargs
  global.set $~lib/metashrew-runes/assembly/indexer/constants/index/MINTS_REMAINING
  i32.const 1
  global.set $~argumentsLength
  i32.const 4320
  i32.const 0
  call $~lib/string/String.UTF8.encode@varargs
  global.set $~lib/metashrew-runes/assembly/indexer/constants/index/PREMINE
  i32.const 1
  global.set $~argumentsLength
  i32.const 4384
  i32.const 0
  call $~lib/string/String.UTF8.encode@varargs
  global.set $~lib/metashrew-runes/assembly/indexer/constants/index/DIVISIBILITY
  i32.const 1
  global.set $~argumentsLength
  i32.const 4448
  i32.const 0
  call $~lib/string/String.UTF8.encode@varargs
  global.set $~lib/metashrew-runes/assembly/indexer/constants/index/RUNE_ID_TO_HEIGHT
  i32.const 1
  global.set $~argumentsLength
  i32.const 4512
  i32.const 0
  call $~lib/string/String.UTF8.encode@varargs
  global.set $~lib/metashrew-runes/assembly/indexer/constants/index/ETCHINGS
  i32.const 1
  global.set $~argumentsLength
  i32.const 4560
  i32.const 0
  call $~lib/string/String.UTF8.encode@varargs
  global.set $~lib/metashrew-runes/assembly/indexer/constants/index/RUNE_ID_TO_ETCHING
  i32.const 1
  global.set $~argumentsLength
  i32.const 4624
  i32.const 0
  call $~lib/string/String.UTF8.encode@varargs
  global.set $~lib/metashrew-runes/assembly/indexer/constants/index/ETCHING_TO_RUNE_ID
  i32.const 4688
  call $~lib/as-bignum/assembly/utils/atou128
  global.set $~lib/metashrew-runes/assembly/indexer/constants/index/MINIMUM_NAME
  i32.const 16
  i32.const 9
  call $~lib/rt/stub/__new
  local.tee $0
  i64.const 26
  i64.store
  local.get $0
  i64.const 0
  i64.store offset=8
  local.get $0
  global.set $~lib/metashrew-runes/assembly/indexer/constants/index/TWENTY_SIX
  i32.const 4976
  call $~lib/as-bignum/assembly/utils/atou128
  global.set $~lib/metashrew-runes/assembly/indexer/constants/index/RESERVED_NAME
  i32.const 4
  i32.const 15
  call $~lib/rt/stub/__new
  local.tee $0
  i32.eqz
  if
   i32.const 0
   i32.const 0
   call $~lib/rt/stub/__new
   local.set $0
  end
  i32.const 24
  i32.const 16
  call $~lib/rt/stub/__new
  local.tee $1
  i32.const 16
  call $~lib/arraybuffer/ArrayBuffer#constructor
  i32.store
  local.get $1
  i32.const 3
  i32.store offset=4
  local.get $1
  i32.const 32
  call $~lib/arraybuffer/ArrayBuffer#constructor
  i32.store offset=8
  local.get $1
  i32.const 4
  i32.store offset=12
  local.get $1
  i32.const 0
  i32.store offset=16
  local.get $1
  i32.const 0
  i32.store offset=20
  local.get $0
  local.get $1
  i32.store
  local.get $0
  global.set $assembly/indexer/tables/protorune/PROTOCOLS_TO_INDEX
  i32.const 1
  global.set $~argumentsLength
  i32.const 5072
  i32.const 0
  call $~lib/string/String.UTF8.encode@varargs
  global.set $~lib/metashrew-spendables/assembly/tables/OUTPOINTS_FOR_ADDRESS
  i32.const 1
  global.set $~argumentsLength
  i32.const 5136
  i32.const 0
  call $~lib/string/String.UTF8.encode@varargs
  global.set $~lib/metashrew-spendables/assembly/tables/OUTPOINT_SPENDABLE_BY
  i32.const 1
  global.set $~argumentsLength
  i32.const 5200
  i32.const 0
  call $~lib/string/String.UTF8.encode@varargs
  global.set $~lib/metashrew-spendables/assembly/tables/OUTPOINT_TO_OUTPUT
  i32.const 1
  global.set $~argumentsLength
  i32.const 5264
  i32.const 0
  call $~lib/string/String.UTF8.encode@varargs
  global.set $assembly/test/TEST_PROTORUNE_RUNEID
 )
)
