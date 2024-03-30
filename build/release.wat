(module
 (type $0 (func (param i32) (result i32)))
 (type $1 (func (param i32 i32) (result i32)))
 (type $2 (func (param i32 i32 i32 i32) (result i32)))
 (type $3 (func (result i32)))
 (type $4 (func (param i32 i32 i32) (result i32)))
 (type $5 (func (param i32 i32)))
 (type $6 (func (param i32 i32 i32)))
 (type $7 (func))
 (type $8 (func (param i32) (result i64)))
 (type $9 (func (param i32)))
 (type $10 (func (param i32 i32 i32 i32)))
 (type $11 (func (param i32 i64) (result i32)))
 (type $12 (func (param i32 i32 i64)))
 (type $13 (func (param i32 i32) (result i64)))
 (type $14 (func (param i64) (result i32)))
 (import "env" "abort" (func $~lib/builtins/abort (param i32 i32 i32 i32)))
 (import "env" "__host_len" (func $~lib/metashrew-as/assembly/indexer/index/__host_len (result i32)))
 (import "env" "__load_input" (func $~lib/metashrew-as/assembly/indexer/index/__load_input (param i32)))
 (import "env" "__get_len" (func $~lib/metashrew-as/assembly/indexer/index/__get_len (param i32) (result i32)))
 (import "env" "__get" (func $~lib/metashrew-as/assembly/indexer/index/__get (param i32 i32)))
 (import "env" "__flush" (func $~lib/metashrew-as/assembly/indexer/index/__flush (param i32)))
 (global $~lib/rt/stub/offset (mut i32) (i32.const 0))
 (global $~lib/metashrew-as/assembly/indexer/index/_updates (mut i32) (i32.const 0))
 (global $~lib/metashrew-as/assembly/indexer/index/_updateKeys (mut i32) (i32.const 0))
 (global $~lib/metashrew-as/assembly/utils/sha256/kPtr (mut i32) (i32.const 0))
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
 (global $~lib/metashrew-as/assembly/utils/sha256/mLength (mut i32) (i32.const 0))
 (global $~lib/metashrew-as/assembly/utils/sha256/bytesHashed (mut i32) (i32.const 0))
 (global $~argumentsLength (mut i32) (i32.const 0))
 (global $~lib/metashrew-as/assembly/blockdata/epoch/Epoch.STARTING_SATS (mut i32) (i32.const 0))
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
 (memory $0 1 65335)
 (data $0 (i32.const 1036) "\1c\02")
 (data $0.1 (i32.const 1048) "\04\00\00\00\00\02\00\00000102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f202122232425262728292a2b2c2d2e2f303132333435363738393a3b3c3d3e3f404142434445464748494a4b4c4d4e4f505152535455565758595a5b5c5d5e5f606162636465666768696a6b6c6d6e6f707172737475767778797a7b7c7d7e7f808182838485868788898a8b8c8d8e8f909192939495969798999a9b9c9d9e9fa0a1a2a3a4a5a6a7a8a9aaabacadaeafb0b1b2b3b4b5b6b7b8b9babbbcbdbebfc0c1c2c3c4c5c6c7c8c9cacbcccdcecfd0d1d2d3d4d5d6d7d8d9dadbdcdddedfe0e1e2e3e4e5e6e7e8e9eaebecedeeeff0f1f2f3f4f5f6f7f8f9fafbfcfdfeff")
 (data $1 (i32.const 1580) "<")
 (data $1.1 (i32.const 1592) "\02\00\00\00(\00\00\00A\00l\00l\00o\00c\00a\00t\00i\00o\00n\00 \00t\00o\00o\00 \00l\00a\00r\00g\00e")
 (data $2 (i32.const 1644) "<")
 (data $2.1 (i32.const 1656) "\02\00\00\00\1e\00\00\00~\00l\00i\00b\00/\00r\00t\00/\00s\00t\00u\00b\00.\00t\00s")
 (data $3 (i32.const 1708) ",")
 (data $3.1 (i32.const 1720) "\02\00\00\00\1c\00\00\00I\00n\00v\00a\00l\00i\00d\00 \00l\00e\00n\00g\00t\00h")
 (data $4 (i32.const 1756) "<")
 (data $4.1 (i32.const 1768) "\02\00\00\00&\00\00\00~\00l\00i\00b\00/\00a\00r\00r\00a\00y\00b\00u\00f\00f\00e\00r\00.\00t\00s")
 (data $5 (i32.const 1820) "\1c\01")
 (data $5.1 (i32.const 1832) "\01\00\00\00\00\01\00\00\98/\8aB\91D7q\cf\fb\c0\b5\a5\db\b5\e9[\c2V9\f1\11\f1Y\a4\82?\92\d5^\1c\ab\98\aa\07\d8\01[\83\12\be\851$\c3}\0cUt]\ber\fe\b1\de\80\a7\06\dc\9bt\f1\9b\c1\c1i\9b\e4\86G\be\ef\c6\9d\c1\0f\cc\a1\0c$o,\e9-\aa\84tJ\dc\a9\b0\\\da\88\f9vRQ>\98m\c61\a8\c8\'\03\b0\c7\7fY\bf\f3\0b\e0\c6G\91\a7\d5Qc\ca\06g))\14\85\n\b7\'8!\1b.\fcm,M\13\r8STs\ne\bb\njv.\c9\c2\81\85,r\92\a1\e8\bf\a2Kf\1a\a8p\8bK\c2\a3Ql\c7\19\e8\92\d1$\06\99\d6\855\0e\f4p\a0j\10\16\c1\a4\19\08l7\1eLwH\'\b5\bc\b04\b3\0c\1c9J\aa\d8NO\ca\9c[\f3o.h\ee\82\8ftoc\a5x\14x\c8\84\08\02\c7\8c\fa\ff\be\90\eblP\a4\f7\a3\f9\be\f2xq\c6")
 (data $6 (i32.const 2108) ",")
 (data $6.1 (i32.const 2120) "\07\00\00\00\10\00\00\000\07\00\000\07\00\00\00\01\00\00@")
 (data $7 (i32.const 2156) "\1c\01")
 (data $7.1 (i32.const 2168) "\01\00\00\00\00\01\00\00\98/\8a\c2\91D7q\cf\fb\c0\b5\a5\db\b5\e9[\c2V9\f1\11\f1Y\a4\82?\92\d5^\1c\ab\98\aa\07\d8\01[\83\12\be\851$\c3}\0cUt]\ber\fe\b1\de\80\a7\06\dc\9bt\f3\9b\c1\c1i\9bd\86G\fe\f0\c6\ed\e1\0fT\f2\0c$o4\e9O\be\84\c9l\1eA\b9a\fa\88\f9\16RQ\c6\f2mZ\8e\a8e\fc\19\b0\c7\9e\d9\b9\c31\12\9a\a0\ea\0e\e7+#\b1\fd\b0>5\c7\d5\bai0_m\97\cb\8f\11\0fZ\fd\ee\1e\dc\89\b65\n\04z\0b\de\9d\ca\f4X\16[]\e1\86>\7f\00\80\89\0872\ea\07\a57\95\abo\10a@\17\f1\d6\8c\rm;\aa\cd7\be\bb\c0\da;a\83c\a3H\db1\e9\02\0b\a7\\\d1o\ca\fa\1aR1\8431\95\1a\d4n\90xCm\f2\91\9c\c3\bd\ab\cc\9e\e6\a0\c9\b5<\b6/S\c6A\c7\d2\a3~#\07hK\95\a4v\1d\19L")
 (data $8 (i32.const 2444) ",")
 (data $8.1 (i32.const 2456) "\07\00\00\00\10\00\00\00\80\08\00\00\80\08\00\00\00\01\00\00@")
 (data $9 (i32.const 2492) ",")
 (data $9.1 (i32.const 2504) "\02\00\00\00\14\00\00\00u\00s\00e\00 \00s\00t\00r\00i\00c\00t")
 (data $10 (i32.const 2540) "\1c")
 (data $10.1 (i32.const 2552) "\02\00\00\00\02\00\00\001")
 (data $11 (i32.const 2572) "<")
 (data $11.1 (i32.const 2584) "\02\00\00\00$\00\00\00U\00n\00p\00a\00i\00r\00e\00d\00 \00s\00u\00r\00r\00o\00g\00a\00t\00e")
 (data $12 (i32.const 2636) ",")
 (data $12.1 (i32.const 2648) "\02\00\00\00\1c\00\00\00~\00l\00i\00b\00/\00s\00t\00r\00i\00n\00g\00.\00t\00s")
 (data $13 (i32.const 2684) "\1c\01")
 (data $13.1 (i32.const 2696) "\04\00\00\00\00\01")
 (data $13.2 (i32.const 2752) "\0f\00\n\11\15\14\1a\1e\07\05")
 (data $13.3 (i32.const 2801) "\1d\00\18\r\19\t\08\17\00\12\16\1f\1b\13\00\01\00\03\10\0b\1c\0c\0e\06\04\02")
 (data $14 (i32.const 2972) "<")
 (data $14.1 (i32.const 2984) "\04\00\00\00 \00\00\00qpzry9x8gf2tvdw0s3jn54khce6mua7l")
 (data $15 (i32.const 3036) "L")
 (data $15.1 (i32.const 3048) "\04\00\00\00:\00\00\00123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz")
 (data $16 (i32.const 3116) "<")
 (data $16.1 (i32.const 3128) "\02\00\00\00$\00\00\00I\00n\00d\00e\00x\00 \00o\00u\00t\00 \00o\00f\00 \00r\00a\00n\00g\00e")
 (data $17 (i32.const 3180) "<")
 (data $17.1 (i32.const 3192) "\02\00\00\00&\00\00\00~\00l\00i\00b\00/\00s\00t\00a\00t\00i\00c\00a\00r\00r\00a\00y\00.\00t\00s")
 (data $18 (i32.const 3244) ",")
 (data $18.1 (i32.const 3256) "\02\00\00\00\1a\00\00\00~\00l\00i\00b\00/\00a\00r\00r\00a\00y\00.\00t\00s")
 (data $19 (i32.const 3292) "<")
 (data $19.1 (i32.const 3304) "\02\00\00\00*\00\00\00/\00o\00u\00t\00p\00o\00i\00n\00t\00/\00b\00y\00s\00a\00t\00r\00a\00n\00g\00e\00/")
 (data $20 (i32.const 3356) "<")
 (data $20.1 (i32.const 3368) "\02\00\00\00\"\00\00\00/\00s\00a\00t\00/\00b\00y\00/\00o\00u\00t\00p\00o\00i\00n\00t\00/")
 (data $21 (i32.const 3420) "<")
 (data $21.1 (i32.const 3432) "\02\00\00\00$\00\00\00/\00v\00a\00l\00u\00e\00/\00b\00y\00o\00u\00t\00p\00o\00i\00n\00t\00/")
 (data $22 (i32.const 3484) "L")
 (data $22.1 (i32.const 3496) "\02\00\00\006\00\00\00/\00s\00e\00q\00u\00e\00n\00c\00e\00n\00u\00m\00b\00e\00r\00s\00/\00b\00y\00o\00u\00t\00p\00o\00i\00n\00t")
 (data $23 (i32.const 3564) "<")
 (data $23.1 (i32.const 3576) "\02\00\00\00(\00\00\00/\00b\00l\00o\00c\00k\00h\00a\00s\00h\00/\00b\00y\00h\00e\00i\00g\00h\00t\00/")
 (data $24 (i32.const 3628) "<")
 (data $24.1 (i32.const 3640) "\02\00\00\00(\00\00\00/\00h\00e\00i\00g\00h\00t\00/\00b\00y\00b\00l\00o\00c\00k\00h\00a\00s\00h\00/")
 (data $25 (i32.const 3692) ",")
 (data $25.1 (i32.const 3704) "\02\00\00\00\18\00\00\00/\00s\00t\00a\00r\00t\00i\00n\00g\00s\00a\00t")
 (data $26 (i32.const 3740) "<")
 (data $26.1 (i32.const 3752) "\02\00\00\00$\00\00\00/\00i\00n\00s\00c\00r\00i\00p\00t\00i\00o\00n\00/\00b\00y\00i\00d\00/")
 (data $27 (i32.const 3804) "L")
 (data $27.1 (i32.const 3816) "\02\00\00\002\00\00\00/\00i\00n\00s\00c\00r\00i\00p\00t\00i\00o\00n\00i\00d\00/\00b\00y\00s\00a\00t\00p\00o\00i\00n\00t")
 (data $28 (i32.const 3884) "<")
 (data $28.1 (i32.const 3896) "\02\00\00\00\1e\00\00\00/\00s\00a\00t\00/\00b\00y\00s\00a\00t\00p\00o\00i\00n\00t")
 (data $29 (i32.const 3948) "L")
 (data $29.1 (i32.const 3960) "\02\00\00\004\00\00\00/\00s\00a\00t\00p\00o\00i\00n\00t\00/\00b\00y\00i\00n\00s\00c\00r\00i\00p\00t\00i\00o\00n\00i\00d\00/")
 (data $30 (i32.const 4028) "<")
 (data $30.1 (i32.const 4040) "\02\00\00\00,\00\00\00/\00h\00e\00i\00g\00h\00t\00/\00b\00y\00i\00n\00s\00c\00r\00i\00p\00t\00i\00o\00n\00/")
 (data $31 (i32.const 4092) "L")
 (data $31.1 (i32.const 4104) "\02\00\00\002\00\00\00/\00i\00n\00s\00c\00r\00i\00p\00t\00i\00o\00n\00i\00d\00s\00/\00b\00y\00h\00e\00i\00g\00h\00t\00/")
 (data $32 (i32.const 4172) ",")
 (data $32.1 (i32.const 4184) "\02\00\00\00\1a\00\00\00/\00n\00e\00x\00t\00s\00e\00q\00u\00e\00n\00c\00e")
 (data $33 (i32.const 4220) "L")
 (data $33.1 (i32.const 4232) "\02\00\00\004\00\00\00/\00i\00n\00s\00c\00r\00i\00p\00t\00i\00o\00n\00i\00d\00/\00b\00y\00s\00e\00q\00u\00e\00n\00c\00e\00/")
 (data $34 (i32.const 4300) "L")
 (data $34.1 (i32.const 4312) "\02\00\00\004\00\00\00/\00s\00e\00q\00u\00e\00n\00c\00e\00/\00b\00y\00i\00n\00s\00c\00r\00i\00p\00t\00i\00o\00n\00i\00d\00/")
 (data $35 (i32.const 4380) "|")
 (data $35.1 (i32.const 4392) "\02\00\00\00^\00\00\00E\00l\00e\00m\00e\00n\00t\00 \00t\00y\00p\00e\00 \00m\00u\00s\00t\00 \00b\00e\00 \00n\00u\00l\00l\00a\00b\00l\00e\00 \00i\00f\00 \00a\00r\00r\00a\00y\00 \00i\00s\00 \00h\00o\00l\00e\00y")
 (data $36 (i32.const 4508) "\1c")
 (data $36.1 (i32.const 4520) "\1c\00\00\00\08\00\00\00\01")
 (data $37 (i32.const 4540) "\1c")
 (data $37.1 (i32.const 4552) "\1d\00\00\00\08\00\00\00\02")
 (data $38 (i32.const 4572) "\1c")
 (data $38.1 (i32.const 4584) "\1f\00\00\00\08\00\00\00\03")
 (data $39 (i32.const 4604) "<")
 (data $39.1 (i32.const 4616) "\02\00\00\00$\00\00\00K\00e\00y\00 \00d\00o\00e\00s\00 \00n\00o\00t\00 \00e\00x\00i\00s\00t")
 (data $40 (i32.const 4668) ",")
 (data $40.1 (i32.const 4680) "\02\00\00\00\16\00\00\00~\00l\00i\00b\00/\00m\00a\00p\00.\00t\00s")
 (data $41 (i32.const 4716) "\1c")
 (data $41.1 (i32.const 4728) "\02\00\00\00\n\00\00\00/\00m\00a\00s\00k")
 (data $42 (i32.const 4748) ",")
 (data $42.1 (i32.const 4760) "\02\00\00\00\0e\00\00\00/\00l\00e\00n\00g\00t\00h")
 (data $43 (i32.const 4796) "\1c")
 (data $43.1 (i32.const 4808) "\02\00\00\00\02\00\00\00/")
 (data $44 (i32.const 4828) "|")
 (data $44.1 (i32.const 4840) "\02\00\00\00d\00\00\00t\00o\00S\00t\00r\00i\00n\00g\00(\00)\00 \00r\00a\00d\00i\00x\00 \00a\00r\00g\00u\00m\00e\00n\00t\00 \00m\00u\00s\00t\00 \00b\00e\00 \00b\00e\00t\00w\00e\00e\00n\00 \002\00 \00a\00n\00d\00 \003\006")
 (data $45 (i32.const 4956) "<")
 (data $45.1 (i32.const 4968) "\02\00\00\00&\00\00\00~\00l\00i\00b\00/\00u\00t\00i\00l\00/\00n\00u\00m\00b\00e\00r\00.\00t\00s")
 (data $46 (i32.const 5020) "\1c")
 (data $46.1 (i32.const 5032) "\02\00\00\00\02\00\00\000")
 (data $47 (i32.const 5052) "0\000\000\001\000\002\000\003\000\004\000\005\000\006\000\007\000\008\000\009\001\000\001\001\001\002\001\003\001\004\001\005\001\006\001\007\001\008\001\009\002\000\002\001\002\002\002\003\002\004\002\005\002\006\002\007\002\008\002\009\003\000\003\001\003\002\003\003\003\004\003\005\003\006\003\007\003\008\003\009\004\000\004\001\004\002\004\003\004\004\004\005\004\006\004\007\004\008\004\009\005\000\005\001\005\002\005\003\005\004\005\005\005\006\005\007\005\008\005\009\006\000\006\001\006\002\006\003\006\004\006\005\006\006\006\007\006\008\006\009\007\000\007\001\007\002\007\003\007\004\007\005\007\006\007\007\007\008\007\009\008\000\008\001\008\002\008\003\008\004\008\005\008\006\008\007\008\008\008\009\009\000\009\001\009\002\009\003\009\004\009\005\009\006\009\007\009\008\009\009")
 (data $48 (i32.const 5452) "\1c\04")
 (data $48.1 (i32.const 5464) "\02\00\00\00\00\04\00\000\000\000\001\000\002\000\003\000\004\000\005\000\006\000\007\000\008\000\009\000\00a\000\00b\000\00c\000\00d\000\00e\000\00f\001\000\001\001\001\002\001\003\001\004\001\005\001\006\001\007\001\008\001\009\001\00a\001\00b\001\00c\001\00d\001\00e\001\00f\002\000\002\001\002\002\002\003\002\004\002\005\002\006\002\007\002\008\002\009\002\00a\002\00b\002\00c\002\00d\002\00e\002\00f\003\000\003\001\003\002\003\003\003\004\003\005\003\006\003\007\003\008\003\009\003\00a\003\00b\003\00c\003\00d\003\00e\003\00f\004\000\004\001\004\002\004\003\004\004\004\005\004\006\004\007\004\008\004\009\004\00a\004\00b\004\00c\004\00d\004\00e\004\00f\005\000\005\001\005\002\005\003\005\004\005\005\005\006\005\007\005\008\005\009\005\00a\005\00b\005\00c\005\00d\005\00e\005\00f\006\000\006\001\006\002\006\003\006\004\006\005\006\006\006\007\006\008\006\009\006\00a\006\00b\006\00c\006\00d\006\00e\006\00f\007\000\007\001\007\002\007\003\007\004\007\005\007\006\007\007\007\008\007\009\007\00a\007\00b\007\00c\007\00d\007\00e\007\00f\008\000\008\001\008\002\008\003\008\004\008\005\008\006\008\007\008\008\008\009\008\00a\008\00b\008\00c\008\00d\008\00e\008\00f\009\000\009\001\009\002\009\003\009\004\009\005\009\006\009\007\009\008\009\009\009\00a\009\00b\009\00c\009\00d\009\00e\009\00f\00a\000\00a\001\00a\002\00a\003\00a\004\00a\005\00a\006\00a\007\00a\008\00a\009\00a\00a\00a\00b\00a\00c\00a\00d\00a\00e\00a\00f\00b\000\00b\001\00b\002\00b\003\00b\004\00b\005\00b\006\00b\007\00b\008\00b\009\00b\00a\00b\00b\00b\00c\00b\00d\00b\00e\00b\00f\00c\000\00c\001\00c\002\00c\003\00c\004\00c\005\00c\006\00c\007\00c\008\00c\009\00c\00a\00c\00b\00c\00c\00c\00d\00c\00e\00c\00f\00d\000\00d\001\00d\002\00d\003\00d\004\00d\005\00d\006\00d\007\00d\008\00d\009\00d\00a\00d\00b\00d\00c\00d\00d\00d\00e\00d\00f\00e\000\00e\001\00e\002\00e\003\00e\004\00e\005\00e\006\00e\007\00e\008\00e\009\00e\00a\00e\00b\00e\00c\00e\00d\00e\00e\00e\00f\00f\000\00f\001\00f\002\00f\003\00f\004\00f\005\00f\006\00f\007\00f\008\00f\009\00f\00a\00f\00b\00f\00c\00f\00d\00f\00e\00f\00f")
 (data $49 (i32.const 6508) "\\")
 (data $49.1 (i32.const 6520) "\02\00\00\00H\00\00\000\001\002\003\004\005\006\007\008\009\00a\00b\00c\00d\00e\00f\00g\00h\00i\00j\00k\00l\00m\00n\00o\00p\00q\00r\00s\00t\00u\00v\00w\00x\00y\00z")
 (data $50 (i32.const 6604) "\1c")
 (data $50.1 (i32.const 6616) "\02")
 (data $51 (i32.const 6636) "\1c")
 (data $51.1 (i32.const 6648) "&\00\00\00\08\00\00\00\04")
 (data $52 (i32.const 6668) "\1c")
 (data $52.1 (i32.const 6680) "\02\00\00\00\06\00\00\00o\00r\00d")
 (data $53 (i32.const 6700) "\1c")
 (data $53.1 (i32.const 6712) "+\00\00\00\08\00\00\00\05")
 (data $54 (i32.const 6732) "\1c")
 (data $54.1 (i32.const 6744) ".\00\00\00\08\00\00\00\06")
 (data $55 (i32.const 6764) "\1c")
 (data $55.1 (i32.const 6776) "/\00\00\00\08\00\00\00\07")
 (data $56 (i32.const 6796) "\1c")
 (data $56.1 (i32.const 6808) "0\00\00\00\08\00\00\00\08")
 (data $57 (i32.const 6828) "\1c")
 (data $57.1 (i32.const 6840) "1\00\00\00\08\00\00\00\t")
 (data $58 (i32.const 6860) "\1c")
 (data $58.1 (i32.const 6872) "1\00\00\00\08\00\00\00\n")
 (data $59 (i32.const 6892) "\1c")
 (data $59.1 (i32.const 6904) "\02\00\00\00\02\00\00\00.")
 (table $0 11 11 funcref)
 (elem $0 (i32.const 1) $~lib/metashrew-as/assembly/utils/box/Box.concat~anonymous|0 $~lib/metashrew-as/assembly/utils/box/Box.concat~anonymous|1 $~lib/metashrew-as/assembly/utils/utils/concat~anonymous|0 $assembly/index/SatRanges.fromInputs~anonymous|0 $~lib/metashrew-as/assembly/blockdata/inscription/Inscription#toArrayBuffer~anonymous|0 $~lib/metashrew-as/assembly/indexer/index/_flush~anonymous|0 $~lib/metashrew-as/assembly/utils/rlp/toRLP~anonymous|0 $~lib/metashrew-as/assembly/utils/rlp/toRLP~anonymous|1 $~lib/metashrew-as/assembly/utils/rlp/toRLP~anonymous|2 $~lib/metashrew-as/assembly/utils/rlp/toRLP~anonymous|2)
 (export "_start" (func $assembly/index/_start))
 (export "sat" (func $assembly/index/sat))
 (export "inscription" (func $assembly/index/inscription))
 (export "content" (func $assembly/index/inscription))
 (export "inscriptionsfrom" (func $assembly/index/inscription))
 (export "inscriptionsforblock" (func $assembly/index/inscriptionsforblock))
 (export "output" (func $assembly/index/output))
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
   i32.const 1728
   i32.const 1776
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
 (func $"~lib/map/Map<u32,~lib/arraybuffer/ArrayBuffer>#constructor" (result i32)
  (local $0 i32)
  i32.const 24
  i32.const 6
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
 (func $~lib/string/String.UTF8.encode@varargs (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  block $2of2
   block $outOfRange
    global.get $~argumentsLength
    i32.const 1
    i32.sub
    br_table $2of2 $2of2 $2of2 $outOfRange
   end
   unreachable
  end
  local.get $0
  local.set $2
  local.get $0
  local.get $0
  i32.const 20
  i32.sub
  i32.load offset=16
  i32.add
  local.set $3
  loop $while-continue|0
   local.get $2
   local.get $3
   i32.lt_u
   if
    local.get $2
    i32.load16_u
    local.tee $4
    i32.const 128
    i32.lt_u
    if (result i32)
     local.get $1
     i32.const 1
     i32.add
    else
     local.get $4
     i32.const 2048
     i32.lt_u
     if (result i32)
      local.get $1
      i32.const 2
      i32.add
     else
      local.get $4
      i32.const 64512
      i32.and
      i32.const 55296
      i32.eq
      local.get $2
      i32.const 2
      i32.add
      local.get $3
      i32.lt_u
      i32.and
      if
       local.get $2
       i32.load16_u offset=2
       i32.const 64512
       i32.and
       i32.const 56320
       i32.eq
       if
        local.get $1
        i32.const 4
        i32.add
        local.set $1
        local.get $2
        i32.const 4
        i32.add
        local.set $2
        br $while-continue|0
       end
      end
      local.get $1
      i32.const 3
      i32.add
     end
    end
    local.set $1
    local.get $2
    i32.const 2
    i32.add
    local.set $2
    br $while-continue|0
   end
  end
  local.get $1
  i32.const 1
  call $~lib/rt/stub/__new
  local.set $2
  local.get $0
  local.tee $1
  local.get $0
  i32.const 20
  i32.sub
  i32.load offset=16
  i32.const -2
  i32.and
  i32.add
  local.set $4
  local.get $2
  local.set $0
  loop $while-continue|00
   local.get $1
   local.get $4
   i32.lt_u
   if
    local.get $1
    i32.load16_u
    local.tee $3
    i32.const 128
    i32.lt_u
    if (result i32)
     local.get $0
     local.get $3
     i32.store8
     local.get $0
     i32.const 1
     i32.add
    else
     local.get $3
     i32.const 2048
     i32.lt_u
     if (result i32)
      local.get $0
      local.get $3
      i32.const 6
      i32.shr_u
      i32.const 192
      i32.or
      local.get $3
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
      local.get $3
      i32.const 63488
      i32.and
      i32.const 55296
      i32.eq
      if
       local.get $3
       i32.const 56320
       i32.lt_u
       local.get $1
       i32.const 2
       i32.add
       local.get $4
       i32.lt_u
       i32.and
       if
        local.get $1
        i32.load16_u offset=2
        local.tee $5
        i32.const 64512
        i32.and
        i32.const 56320
        i32.eq
        if
         local.get $0
         local.get $3
         i32.const 1023
         i32.and
         i32.const 10
         i32.shl
         i32.const 65536
         i32.add
         local.get $5
         i32.const 1023
         i32.and
         i32.or
         local.tee $3
         i32.const 63
         i32.and
         i32.const 128
         i32.or
         i32.const 24
         i32.shl
         local.get $3
         i32.const 6
         i32.shr_u
         i32.const 63
         i32.and
         i32.const 128
         i32.or
         i32.const 16
         i32.shl
         i32.or
         local.get $3
         i32.const 12
         i32.shr_u
         i32.const 63
         i32.and
         i32.const 128
         i32.or
         i32.const 8
         i32.shl
         i32.or
         local.get $3
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
         local.get $1
         i32.const 4
         i32.add
         local.set $1
         br $while-continue|00
        end
       end
      end
      local.get $0
      local.get $3
      i32.const 12
      i32.shr_u
      i32.const 224
      i32.or
      local.get $3
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
      local.get $3
      i32.const 63
      i32.and
      i32.const 128
      i32.or
      i32.store8 offset=2
      local.get $0
      i32.const 3
      i32.add
     end
    end
    local.set $0
    local.get $1
    i32.const 2
    i32.add
    local.set $1
    br $while-continue|00
   end
  end
  local.get $2
 )
 (func $~lib/rt/__newArray (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  local.get $0
  i32.const 2
  i32.shl
  local.tee $3
  i32.const 1
  call $~lib/rt/stub/__new
  local.set $2
  i32.const 16
  local.get $1
  call $~lib/rt/stub/__new
  local.tee $1
  local.get $2
  i32.store
  local.get $1
  local.get $2
  i32.store offset=4
  local.get $1
  local.get $3
  i32.store offset=8
  local.get $1
  local.get $0
  i32.store offset=12
  local.get $1
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
    i32.const 1728
    i32.const 3264
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
 (func $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/sat/Sat>#__set (param $0 i32) (param $1 i32) (param $2 i32)
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
    i32.const 3136
    i32.const 3264
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
 (func $start:assembly/index
  (local $0 i32)
  (local $1 i32)
  i32.const 6924
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
  call $"~lib/map/Map<u32,~lib/arraybuffer/ArrayBuffer>#constructor"
  global.set $~lib/metashrew-as/assembly/indexer/index/_updates
  call $"~lib/map/Map<u32,~lib/arraybuffer/ArrayBuffer>#constructor"
  global.set $~lib/metashrew-as/assembly/indexer/index/_updateKeys
  i32.const 2132
  i32.load
  global.set $~lib/metashrew-as/assembly/utils/sha256/kPtr
  i32.const 2468
  i32.load
  drop
  i32.const 64
  call $~lib/arraybuffer/ArrayBuffer#constructor
  global.set $~lib/metashrew-as/assembly/utils/sha256/M
  global.get $~lib/metashrew-as/assembly/utils/sha256/M
  global.set $~lib/metashrew-as/assembly/utils/sha256/mPtr
  i32.const 256
  call $~lib/arraybuffer/ArrayBuffer#constructor
  global.set $~lib/metashrew-as/assembly/utils/sha256/W
  global.get $~lib/metashrew-as/assembly/utils/sha256/W
  global.set $~lib/metashrew-as/assembly/utils/sha256/wPtr
  i32.const 512
  call $~lib/arraybuffer/ArrayBuffer#constructor
  drop
  i32.const 32
  call $~lib/arraybuffer/ArrayBuffer#constructor
  drop
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
  i32.const 2560
  call $~lib/string/String.UTF8.encode@varargs
  drop
  i32.const 3052
  i32.load
  i32.eqz
  if
   i32.const 3136
   i32.const 3200
   i32.const 78
   i32.const 41
   call $~lib/builtins/abort
   unreachable
  end
  i32.const 3056
  i32.load8_u
  drop
  i32.const 34
  i32.const 10
  call $~lib/rt/__newArray
  local.tee $0
  i32.load offset=4
  drop
  i32.const 8
  i32.const 9
  call $~lib/rt/stub/__new
  local.tee $1
  i64.const 0
  i64.store
  local.get $1
  i64.const 0
  i64.store
  local.get $0
  i32.const 0
  local.get $1
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/sat/Sat>#__set
  i32.const 8
  i32.const 9
  call $~lib/rt/stub/__new
  local.tee $1
  i64.const 0
  i64.store
  local.get $1
  i64.const 1050000000000000
  i64.store
  local.get $0
  i32.const 1
  local.get $1
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/sat/Sat>#__set
  i32.const 8
  i32.const 9
  call $~lib/rt/stub/__new
  local.tee $1
  i64.const 0
  i64.store
  local.get $1
  i64.const 1575000000000000
  i64.store
  local.get $0
  i32.const 2
  local.get $1
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/sat/Sat>#__set
  i32.const 8
  i32.const 9
  call $~lib/rt/stub/__new
  local.tee $1
  i64.const 0
  i64.store
  local.get $1
  i64.const 1837500000000000
  i64.store
  local.get $0
  i32.const 3
  local.get $1
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/sat/Sat>#__set
  i32.const 8
  i32.const 9
  call $~lib/rt/stub/__new
  local.tee $1
  i64.const 0
  i64.store
  local.get $1
  i64.const 1968750000000000
  i64.store
  local.get $0
  i32.const 4
  local.get $1
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/sat/Sat>#__set
  i32.const 8
  i32.const 9
  call $~lib/rt/stub/__new
  local.tee $1
  i64.const 0
  i64.store
  local.get $1
  i64.const 2034375000000000
  i64.store
  local.get $0
  i32.const 5
  local.get $1
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/sat/Sat>#__set
  i32.const 8
  i32.const 9
  call $~lib/rt/stub/__new
  local.tee $1
  i64.const 0
  i64.store
  local.get $1
  i64.const 2067187500000000
  i64.store
  local.get $0
  i32.const 6
  local.get $1
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/sat/Sat>#__set
  i32.const 8
  i32.const 9
  call $~lib/rt/stub/__new
  local.tee $1
  i64.const 0
  i64.store
  local.get $1
  i64.const 2083593750000000
  i64.store
  local.get $0
  i32.const 7
  local.get $1
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/sat/Sat>#__set
  i32.const 8
  i32.const 9
  call $~lib/rt/stub/__new
  local.tee $1
  i64.const 0
  i64.store
  local.get $1
  i64.const 2091796875000000
  i64.store
  local.get $0
  i32.const 8
  local.get $1
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/sat/Sat>#__set
  i32.const 8
  i32.const 9
  call $~lib/rt/stub/__new
  local.tee $1
  i64.const 0
  i64.store
  local.get $1
  i64.const 2095898437500000
  i64.store
  local.get $0
  i32.const 9
  local.get $1
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/sat/Sat>#__set
  i32.const 8
  i32.const 9
  call $~lib/rt/stub/__new
  local.tee $1
  i64.const 0
  i64.store
  local.get $1
  i64.const 2097949218750000
  i64.store
  local.get $0
  i32.const 10
  local.get $1
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/sat/Sat>#__set
  i32.const 8
  i32.const 9
  call $~lib/rt/stub/__new
  local.tee $1
  i64.const 0
  i64.store
  local.get $1
  i64.const 2098974609270000
  i64.store
  local.get $0
  i32.const 11
  local.get $1
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/sat/Sat>#__set
  i32.const 8
  i32.const 9
  call $~lib/rt/stub/__new
  local.tee $1
  i64.const 0
  i64.store
  local.get $1
  i64.const 2099487304530000
  i64.store
  local.get $0
  i32.const 12
  local.get $1
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/sat/Sat>#__set
  i32.const 8
  i32.const 9
  call $~lib/rt/stub/__new
  local.tee $1
  i64.const 0
  i64.store
  local.get $1
  i64.const 2099743652160000
  i64.store
  local.get $0
  i32.const 13
  local.get $1
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/sat/Sat>#__set
  i32.const 8
  i32.const 9
  call $~lib/rt/stub/__new
  local.tee $1
  i64.const 0
  i64.store
  local.get $1
  i64.const 2099871825870000
  i64.store
  local.get $0
  i32.const 14
  local.get $1
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/sat/Sat>#__set
  i32.const 8
  i32.const 9
  call $~lib/rt/stub/__new
  local.tee $1
  i64.const 0
  i64.store
  local.get $1
  i64.const 2099935912620000
  i64.store
  local.get $0
  i32.const 15
  local.get $1
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/sat/Sat>#__set
  i32.const 8
  i32.const 9
  call $~lib/rt/stub/__new
  local.tee $1
  i64.const 0
  i64.store
  local.get $1
  i64.const 2099967955890000
  i64.store
  local.get $0
  i32.const 16
  local.get $1
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/sat/Sat>#__set
  i32.const 8
  i32.const 9
  call $~lib/rt/stub/__new
  local.tee $1
  i64.const 0
  i64.store
  local.get $1
  i64.const 2099983977420000
  i64.store
  local.get $0
  i32.const 17
  local.get $1
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/sat/Sat>#__set
  i32.const 8
  i32.const 9
  call $~lib/rt/stub/__new
  local.tee $1
  i64.const 0
  i64.store
  local.get $1
  i64.const 2099991988080000
  i64.store
  local.get $0
  i32.const 18
  local.get $1
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/sat/Sat>#__set
  i32.const 8
  i32.const 9
  call $~lib/rt/stub/__new
  local.tee $1
  i64.const 0
  i64.store
  local.get $1
  i64.const 2099995993410000
  i64.store
  local.get $0
  i32.const 19
  local.get $1
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/sat/Sat>#__set
  i32.const 8
  i32.const 9
  call $~lib/rt/stub/__new
  local.tee $1
  i64.const 0
  i64.store
  local.get $1
  i64.const 2099997995970000
  i64.store
  local.get $0
  i32.const 20
  local.get $1
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/sat/Sat>#__set
  i32.const 8
  i32.const 9
  call $~lib/rt/stub/__new
  local.tee $1
  i64.const 0
  i64.store
  local.get $1
  i64.const 2099998997250000
  i64.store
  local.get $0
  i32.const 21
  local.get $1
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/sat/Sat>#__set
  i32.const 8
  i32.const 9
  call $~lib/rt/stub/__new
  local.tee $1
  i64.const 0
  i64.store
  local.get $1
  i64.const 2099999497890000
  i64.store
  local.get $0
  i32.const 22
  local.get $1
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/sat/Sat>#__set
  i32.const 8
  i32.const 9
  call $~lib/rt/stub/__new
  local.tee $1
  i64.const 0
  i64.store
  local.get $1
  i64.const 2099999748210000
  i64.store
  local.get $0
  i32.const 23
  local.get $1
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/sat/Sat>#__set
  i32.const 8
  i32.const 9
  call $~lib/rt/stub/__new
  local.tee $1
  i64.const 0
  i64.store
  local.get $1
  i64.const 2099999873370000
  i64.store
  local.get $0
  i32.const 24
  local.get $1
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/sat/Sat>#__set
  i32.const 8
  i32.const 9
  call $~lib/rt/stub/__new
  local.tee $1
  i64.const 0
  i64.store
  local.get $1
  i64.const 2099999935950000
  i64.store
  local.get $0
  i32.const 25
  local.get $1
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/sat/Sat>#__set
  i32.const 8
  i32.const 9
  call $~lib/rt/stub/__new
  local.tee $1
  i64.const 0
  i64.store
  local.get $1
  i64.const 2099999967240000
  i64.store
  local.get $0
  i32.const 26
  local.get $1
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/sat/Sat>#__set
  i32.const 8
  i32.const 9
  call $~lib/rt/stub/__new
  local.tee $1
  i64.const 0
  i64.store
  local.get $1
  i64.const 2099999982780000
  i64.store
  local.get $0
  i32.const 27
  local.get $1
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/sat/Sat>#__set
  i32.const 8
  i32.const 9
  call $~lib/rt/stub/__new
  local.tee $1
  i64.const 0
  i64.store
  local.get $1
  i64.const 2099999990550000
  i64.store
  local.get $0
  i32.const 28
  local.get $1
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/sat/Sat>#__set
  i32.const 8
  i32.const 9
  call $~lib/rt/stub/__new
  local.tee $1
  i64.const 0
  i64.store
  local.get $1
  i64.const 2099999994330000
  i64.store
  local.get $0
  i32.const 29
  local.get $1
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/sat/Sat>#__set
  i32.const 8
  i32.const 9
  call $~lib/rt/stub/__new
  local.tee $1
  i64.const 0
  i64.store
  local.get $1
  i64.const 2099999996220000
  i64.store
  local.get $0
  i32.const 30
  local.get $1
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/sat/Sat>#__set
  i32.const 8
  i32.const 9
  call $~lib/rt/stub/__new
  local.tee $1
  i64.const 0
  i64.store
  local.get $1
  i64.const 2099999997060000
  i64.store
  local.get $0
  i32.const 31
  local.get $1
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/sat/Sat>#__set
  i32.const 8
  i32.const 9
  call $~lib/rt/stub/__new
  local.tee $1
  i64.const 0
  i64.store
  local.get $1
  i64.const 2099999997480000
  i64.store
  local.get $0
  i32.const 32
  local.get $1
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/sat/Sat>#__set
  i32.const 8
  i32.const 9
  call $~lib/rt/stub/__new
  local.tee $1
  i64.const 0
  i64.store
  local.get $1
  i64.const 2099999997690000
  i64.store
  local.get $0
  i32.const 33
  local.get $1
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/sat/Sat>#__set
  local.get $0
  global.set $~lib/metashrew-as/assembly/blockdata/epoch/Epoch.STARTING_SATS
  i32.const 4
  i32.const 12
  call $~lib/rt/stub/__new
  local.tee $0
  i32.const 0
  i32.store
  local.get $0
  i32.const 33
  i32.store
  i32.const 1
  global.set $~argumentsLength
  i32.const 3312
  call $~lib/string/String.UTF8.encode@varargs
  local.set $0
  i32.const 4
  i32.const 13
  call $~lib/rt/stub/__new
  local.tee $1
  i32.const 0
  i32.store
  local.get $1
  local.get $0
  i32.store
  local.get $1
  global.set $assembly/index/SAT_TO_OUTPOINT
  i32.const 1
  global.set $~argumentsLength
  i32.const 3376
  call $~lib/string/String.UTF8.encode@varargs
  global.set $assembly/index/OUTPOINT_TO_SAT
  i32.const 1
  global.set $~argumentsLength
  i32.const 3440
  call $~lib/string/String.UTF8.encode@varargs
  global.set $assembly/index/OUTPOINT_TO_VALUE
  i32.const 1
  global.set $~argumentsLength
  i32.const 3504
  call $~lib/string/String.UTF8.encode@varargs
  global.set $assembly/index/OUTPOINT_TO_SEQUENCE_NUMBERS
  i32.const 1
  global.set $~argumentsLength
  i32.const 3584
  call $~lib/string/String.UTF8.encode@varargs
  global.set $assembly/index/HEIGHT_TO_BLOCKHASH
  i32.const 1
  global.set $~argumentsLength
  i32.const 3648
  call $~lib/string/String.UTF8.encode@varargs
  global.set $assembly/index/BLOCKHASH_TO_HEIGHT
  i32.const 1
  global.set $~argumentsLength
  i32.const 3712
  call $~lib/string/String.UTF8.encode@varargs
  global.set $assembly/index/STARTING_SAT
  i32.const 1
  global.set $~argumentsLength
  i32.const 3760
  call $~lib/string/String.UTF8.encode@varargs
  global.set $assembly/index/INSCRIPTION_ID_TO_INSCRIPTION
  i32.const 1
  global.set $~argumentsLength
  i32.const 3824
  call $~lib/string/String.UTF8.encode@varargs
  global.set $assembly/index/SATPOINT_TO_INSCRIPTION_ID
  i32.const 1
  global.set $~argumentsLength
  i32.const 3904
  call $~lib/string/String.UTF8.encode@varargs
  global.set $assembly/index/SATPOINT_TO_SAT
  i32.const 1
  global.set $~argumentsLength
  i32.const 3968
  call $~lib/string/String.UTF8.encode@varargs
  global.set $assembly/index/INSCRIPTION_ID_TO_SATPOINT
  i32.const 1
  global.set $~argumentsLength
  i32.const 4048
  call $~lib/string/String.UTF8.encode@varargs
  global.set $assembly/index/INSCRIPTION_ID_TO_BLOCKHEIGHT
  i32.const 1
  global.set $~argumentsLength
  i32.const 4112
  call $~lib/string/String.UTF8.encode@varargs
  global.set $assembly/index/HEIGHT_TO_INSCRIPTION_IDS
  i32.const 1
  global.set $~argumentsLength
  i32.const 4192
  call $~lib/string/String.UTF8.encode@varargs
  global.set $assembly/index/NEXT_SEQUENCE_NUMBER
  i32.const 1
  global.set $~argumentsLength
  i32.const 4240
  call $~lib/string/String.UTF8.encode@varargs
  global.set $assembly/index/SEQUENCE_NUMBER_TO_INSCRIPTION_ID
  i32.const 1
  global.set $~argumentsLength
  i32.const 4320
  call $~lib/string/String.UTF8.encode@varargs
  global.set $assembly/index/INSCRIPTION_ID_TO_SEQUENCE_NUMBER
 )
 (func $~lib/metashrew-as/assembly/utils/box/Box#constructor (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  i32.const 8
  i32.const 14
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
  i32.const 23
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
 (func $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Output>#push (param $0 i32) (param $1 i32) (result i32)
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
 (func $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Input>#__get (param $0 i32) (param $1 i32) (result i32)
  local.get $1
  local.get $0
  i32.load offset=12
  i32.ge_u
  if
   i32.const 3136
   i32.const 3264
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
   i32.const 4400
   i32.const 3264
   i32.const 118
   i32.const 40
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
 )
 (func $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#constructor (param $0 i32) (result i32)
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
  (local $11 i32)
  (local $12 i32)
  (local $13 i32)
  i32.const 36
  i32.const 17
  call $~lib/rt/stub/__new
  local.tee $2
  i32.const 0
  i32.store
  local.get $2
  i32.const 0
  i32.store offset=4
  local.get $2
  i32.const 0
  i32.store8 offset=8
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
  local.get $2
  i32.const 0
  i32.store offset=32
  local.get $2
  i32.const 0
  i32.store
  i32.const 16
  i32.const 22
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
  local.get $2
  local.get $3
  i32.store offset=12
  i32.const 16
  i32.const 24
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
  local.get $2
  local.get $3
  i32.store offset=16
  local.get $2
  i32.const 0
  i32.store offset=24
  local.get $2
  i32.const 0
  i32.store offset=28
  local.get $2
  i32.const 0
  i32.store8 offset=8
  local.get $2
  i32.const 0
  call $~lib/arraybuffer/ArrayBuffer#constructor
  i32.store offset=32
  local.get $0
  i32.load
  local.tee $3
  local.set $4
  local.get $3
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
  local.get $2
  local.get $5
  i32.store offset=4
  local.get $0
  i32.load
  local.get $0
  i32.load offset=4
  call $~lib/metashrew-as/assembly/utils/box/Box#constructor
  local.set $3
  local.get $0
  i32.load
  i32.load8_u
  local.set $5
  local.get $0
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
  local.get $0
  i32.load
  i32.load8_u
  local.set $6
  local.get $0
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
  local.get $5
  i32.eqz
  local.get $6
  i32.const 1
  i32.eq
  i32.and
  if
   local.get $2
   i32.const 1
   i32.store8 offset=8
  else
   local.get $0
   local.get $3
   i32.load
   i32.store
   local.get $0
   local.get $3
   i32.load offset=4
   i32.store offset=4
  end
  local.get $0
  i32.load
  local.set $3
  local.get $0
  call $~lib/metashrew-as/assembly/utils/utils/parseVarInt
  i32.wrap_i64
  local.set $5
  loop $for-loop|0
   local.get $1
   local.get $5
   i32.lt_s
   if
    local.get $2
    i32.load offset=12
    local.get $1
    i32.const 24
    i32.const 18
    call $~lib/rt/stub/__new
    local.tee $6
    i32.const 0
    i32.store
    local.get $6
    i32.const 0
    i32.store offset=4
    local.get $6
    i32.const 0
    i32.store offset=8
    local.get $6
    i32.const 0
    i32.store offset=12
    local.get $6
    i32.const 0
    i32.store offset=16
    local.get $6
    i32.const 0
    i32.store offset=20
    local.get $0
    i32.load
    local.set $7
    local.get $6
    local.get $0
    i32.const 32
    call $~lib/metashrew-as/assembly/utils/utils/parseBytes
    i32.store offset=4
    local.get $0
    i32.load
    i32.load
    local.set $8
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
    local.get $6
    local.get $8
    i32.store offset=8
    local.get $6
    local.get $0
    local.get $0
    call $~lib/metashrew-as/assembly/utils/utils/parseVarInt
    i32.wrap_i64
    call $~lib/metashrew-as/assembly/utils/utils/parseBytes
    i32.store offset=12
    local.get $0
    i32.load
    i32.load
    local.set $8
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
    local.get $6
    local.get $8
    i32.store offset=16
    local.get $6
    i32.const 0
    i32.store offset=20
    local.get $6
    local.get $7
    local.get $0
    i32.load
    local.get $7
    i32.sub
    call $~lib/metashrew-as/assembly/utils/box/Box#constructor
    i32.store
    local.get $6
    call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/sat/Sat>#__set
    local.get $1
    i32.const 1
    i32.add
    local.set $1
    br $for-loop|0
   end
  end
  local.get $0
  call $~lib/metashrew-as/assembly/utils/utils/parseVarInt
  i32.wrap_i64
  local.set $6
  i32.const 0
  local.set $1
  loop $for-loop|1
   local.get $1
   local.get $6
   i32.lt_s
   if
    local.get $2
    i32.load8_u offset=8
    if (result i32)
     local.get $2
     i32.load offset=16
     local.get $0
     i32.const 1
     call $~lib/metashrew-as/assembly/blockdata/transaction/Output#constructor
     call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Output>#push
    else
     local.get $2
     i32.load offset=16
     local.get $0
     i32.const 0
     call $~lib/metashrew-as/assembly/blockdata/transaction/Output#constructor
     call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Output>#push
    end
    drop
    local.get $1
    i32.const 1
    i32.add
    local.set $1
    br $for-loop|1
   end
  end
  local.get $2
  local.get $3
  local.get $0
  i32.load
  local.get $3
  i32.sub
  call $~lib/metashrew-as/assembly/utils/box/Box#constructor
  i32.store offset=28
  local.get $2
  i32.load8_u offset=8
  if
   local.get $0
   i32.load
   local.set $6
   i32.const 0
   local.set $1
   loop $for-loop|2
    local.get $1
    local.get $5
    i32.lt_s
    if
     local.get $2
     i32.load offset=12
     local.get $1
     call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Input>#__get
     i32.const 8
     i32.const 19
     call $~lib/rt/stub/__new
     local.tee $9
     i32.const 0
     i32.store
     local.get $9
     i32.const 0
     i32.store offset=4
     local.get $9
     i32.const 0
     i32.store
     local.get $0
     i32.load
     local.set $10
     local.get $0
     call $~lib/metashrew-as/assembly/utils/utils/parseVarInt
     i32.wrap_i64
     local.set $11
     i32.const 16
     i32.const 21
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
      i32.const 1728
      i32.const 3264
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
     local.tee $7
     i32.const 1
     call $~lib/rt/stub/__new
     local.tee $8
     i32.const 0
     local.get $7
     memory.fill
     local.get $3
     local.get $8
     i32.store
     local.get $3
     local.get $8
     i32.store offset=4
     local.get $3
     local.get $7
     i32.store offset=8
     local.get $3
     local.get $11
     i32.store offset=12
     local.get $9
     local.get $3
     i32.store offset=4
     i32.const 0
     local.set $3
     loop $for-loop|00
      local.get $3
      local.get $11
      i32.lt_s
      if
       local.get $9
       i32.load offset=4
       local.get $3
       i32.const 7
       i32.const 20
       call $~lib/rt/stub/__new
       local.tee $7
       i32.const 0
       i32.store
       local.get $7
       i32.const 0
       i32.store8 offset=4
       local.get $7
       i32.const 0
       i32.store8 offset=5
       local.get $7
       i32.const 0
       i32.store8 offset=6
       local.get $7
       local.get $0
       local.get $0
       call $~lib/metashrew-as/assembly/utils/utils/parseVarInt
       i32.wrap_i64
       call $~lib/metashrew-as/assembly/utils/utils/parseBytes
       i32.store
       local.get $7
       i32.load
       local.tee $8
       i32.load
       local.get $8
       i32.load offset=4
       call $~lib/metashrew-as/assembly/utils/box/Box#constructor
       local.tee $8
       i32.load
       local.tee $12
       i32.load8_u
       local.set $13
       local.get $8
       local.get $12
       i32.const 1
       i32.add
       i32.store
       local.get $8
       local.get $8
       i32.load offset=4
       i32.const 1
       i32.sub
       i32.store offset=4
       local.get $7
       local.get $13
       i32.store8 offset=4
       block $break|0
        block $case2|0
         block $case1|0
          local.get $7
          i32.load8_u offset=4
          local.tee $8
          i32.const 80
          i32.ne
          if
           local.get $8
           i32.const 48
           i32.eq
           br_if $case1|0
           br $case2|0
          end
          local.get $7
          i32.const 1
          i32.store8 offset=6
          local.get $7
          i32.const 0
          i32.store8 offset=5
          br $break|0
         end
         local.get $7
         i32.const 0
         i32.store8 offset=5
         local.get $7
         i32.const 0
         i32.store8 offset=6
         br $break|0
        end
        local.get $7
        i32.const 0
        i32.store8 offset=6
        local.get $7
        i32.const 1
        i32.store8 offset=5
       end
       local.get $7
       i32.load
       i32.load offset=4
       i32.const 1
       i32.le_u
       if
        local.get $7
        i32.const 0
        i32.store8 offset=5
       end
       local.get $7
       call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/sat/Sat>#__set
       local.get $3
       i32.const 1
       i32.add
       local.set $3
       br $for-loop|00
      end
     end
     local.get $9
     local.get $10
     local.get $0
     i32.load
     local.get $10
     i32.sub
     call $~lib/metashrew-as/assembly/utils/box/Box#constructor
     i32.store
     local.get $9
     i32.store offset=20
     local.get $1
     i32.const 1
     i32.add
     local.set $1
     br $for-loop|2
    end
   end
   local.get $2
   local.get $6
   local.get $0
   i32.load
   local.get $6
   i32.sub
   call $~lib/metashrew-as/assembly/utils/box/Box#constructor
   i32.store offset=24
  end
  local.get $0
  i32.load
  local.tee $1
  i32.load
  local.set $3
  local.get $0
  local.get $1
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
  local.get $3
  i32.store offset=20
  local.get $2
  local.get $4
  local.get $0
  i32.load
  local.get $4
  i32.sub
  call $~lib/metashrew-as/assembly/utils/box/Box#constructor
  i32.store
  local.get $2
 )
 (func $~lib/metashrew-as/assembly/blockdata/block/Block#constructor (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i64)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  i32.const 20
  i32.const 15
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
  i32.store offset=8
  local.get $2
  i32.const 0
  i32.store offset=12
  local.get $2
  i32.const 0
  i32.store offset=16
  local.get $0
  i32.load
  local.set $3
  i32.const 28
  i32.const 16
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
  local.get $5
  i32.const 0
  i32.store offset=24
  local.get $0
  i32.load
  local.tee $6
  i32.load
  local.set $7
  local.get $0
  local.get $6
  i32.const 4
  i32.add
  i32.store
  local.get $0
  local.get $0
  i32.load offset=4
  i32.const 4
  i32.sub
  i32.store offset=4
  local.get $5
  local.get $7
  i32.store
  local.get $5
  local.get $0
  i32.const 32
  call $~lib/metashrew-as/assembly/utils/utils/parseBytes
  i32.store offset=4
  local.get $5
  local.get $0
  i32.const 32
  call $~lib/metashrew-as/assembly/utils/utils/parseBytes
  i32.store offset=8
  local.get $0
  i32.load
  i32.load
  local.set $7
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
  local.get $5
  local.get $7
  i32.store offset=12
  local.get $0
  i32.load
  i32.load
  local.set $7
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
  local.get $5
  local.get $7
  i32.store offset=16
  local.get $0
  i32.load
  i32.load
  local.set $7
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
  local.get $5
  local.get $7
  i32.store offset=20
  local.get $5
  local.get $6
  local.get $0
  i32.load
  local.get $6
  i32.sub
  call $~lib/metashrew-as/assembly/utils/box/Box#constructor
  i32.store offset=24
  local.get $2
  local.get $5
  i32.store offset=4
  local.get $0
  call $~lib/metashrew-as/assembly/utils/utils/parseVarInt
  local.tee $4
  i32.wrap_i64
  local.set $6
  i32.const 16
  i32.const 25
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
  local.get $6
  i32.const 268435455
  i32.gt_u
  if
   i32.const 1728
   i32.const 3264
   i32.const 70
   i32.const 60
   call $~lib/builtins/abort
   unreachable
  end
  i32.const 8
  local.get $6
  local.get $6
  i32.const 8
  i32.le_u
  select
  i32.const 2
  i32.shl
  local.tee $5
  i32.const 1
  call $~lib/rt/stub/__new
  local.tee $8
  i32.const 0
  local.get $5
  memory.fill
  local.get $7
  local.get $8
  i32.store
  local.get $7
  local.get $8
  i32.store offset=4
  local.get $7
  local.get $5
  i32.store offset=8
  local.get $7
  local.get $6
  i32.store offset=12
  loop $for-loop|0
   local.get $1
   local.get $4
   i32.wrap_i64
   i32.lt_s
   if
    local.get $7
    local.get $1
    local.get $0
    call $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#constructor
    call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/sat/Sat>#__set
    local.get $1
    i32.const 1
    i32.add
    local.set $1
    br $for-loop|0
   end
  end
  local.get $2
  local.get $7
  i32.store offset=8
  local.get $2
  local.get $3
  local.get $0
  i32.load
  local.get $3
  i32.sub
  call $~lib/metashrew-as/assembly/utils/box/Box#constructor
  i32.store
  local.get $2
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
    i32.const 4528
    i32.load
    call_indirect (type $2)
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
    i32.const 4560
    i32.load
    call_indirect (type $2)
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
 (func $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  i32.const 2
  i32.const 27
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
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/sat/Sat>#__set
  local.get $2
  i32.const 1
  local.get $1
  local.get $1
  i32.const 20
  i32.sub
  i32.load offset=16
  call $~lib/metashrew-as/assembly/utils/box/Box#constructor
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/sat/Sat>#__set
  local.get $2
  call $~lib/metashrew-as/assembly/utils/box/Box.concat
 )
 (func $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#selectValue<u32> (param $0 i32) (param $1 i32) (result i32)
  (local $2 i64)
  (local $3 i32)
  i32.const 4
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.tee $3
  local.get $1
  i64.extend_i32_u
  local.tee $2
  i64.const 8
  i64.shr_u
  i64.const 71777214294589695
  i64.and
  local.get $2
  i64.const 71777214294589695
  i64.and
  i64.const 8
  i64.shl
  i64.or
  local.tee $2
  i64.const 16
  i64.shr_u
  i64.const 281470681808895
  i64.and
  local.get $2
  i64.const 281470681808895
  i64.and
  i64.const 16
  i64.shl
  i64.or
  i64.const 32
  i64.rotr
  i64.store32
  local.get $0
  local.get $3
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
 )
 (func $~lib/metashrew-as/assembly/utils/utils/concat~anonymous|0 (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  local.get $0
  local.get $0
  i32.const 20
  i32.sub
  i32.load offset=16
  call $~lib/metashrew-as/assembly/utils/box/Box#constructor
 )
 (func $~lib/array/Array<~lib/arraybuffer/ArrayBuffer>#map<~lib/metashrew-as/assembly/utils/box/Box> (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  local.get $0
  i32.load offset=12
  local.tee $2
  i32.const 27
  call $~lib/rt/__newArray
  local.tee $3
  i32.load offset=4
  local.set $4
  loop $for-loop|0
   local.get $1
   local.get $2
   local.get $0
   i32.load offset=12
   local.tee $5
   local.get $2
   local.get $5
   i32.lt_s
   select
   i32.lt_s
   if
    local.get $1
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
    local.get $1
    local.get $0
    i32.const 4592
    i32.load
    call_indirect (type $4)
    i32.store
    local.get $1
    i32.const 1
    i32.add
    local.set $1
    br $for-loop|0
   end
  end
  local.get $3
 )
 (func $~lib/metashrew-as/assembly/utils/sha256/hashBlocks (param $0 i32) (param $1 i32)
  (local $2 i32)
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
    local.get $0
    global.get $~lib/metashrew-as/assembly/utils/sha256/i
    i32.const 2
    i32.shl
    local.tee $2
    i32.add
    local.get $1
    local.get $2
    i32.const 3
    i32.add
    i32.add
    i32.load8_u
    local.get $1
    local.get $2
    i32.add
    i32.load8_u
    i32.const 24
    i32.shl
    local.get $1
    local.get $2
    i32.const 1
    i32.add
    i32.add
    i32.load8_u
    i32.const 16
    i32.shl
    i32.or
    local.get $1
    local.get $2
    i32.const 2
    i32.add
    i32.add
    i32.load8_u
    i32.const 8
    i32.shl
    i32.or
    i32.or
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
    local.get $0
    global.get $~lib/metashrew-as/assembly/utils/sha256/i
    i32.const 2
    i32.shl
    i32.add
    local.get $0
    global.get $~lib/metashrew-as/assembly/utils/sha256/i
    i32.const 16
    i32.sub
    i32.const 2
    i32.shl
    i32.add
    i32.load
    local.get $0
    global.get $~lib/metashrew-as/assembly/utils/sha256/i
    i32.const 7
    i32.sub
    i32.const 2
    i32.shl
    i32.add
    i32.load
    local.get $0
    global.get $~lib/metashrew-as/assembly/utils/sha256/i
    i32.const 2
    i32.sub
    i32.const 2
    i32.shl
    i32.add
    i32.load
    local.tee $1
    i32.const 17
    i32.rotr
    local.get $1
    i32.const 19
    i32.rotr
    i32.xor
    local.get $1
    i32.const 10
    i32.shr_u
    i32.xor
    i32.add
    local.get $0
    global.get $~lib/metashrew-as/assembly/utils/sha256/i
    i32.const 15
    i32.sub
    i32.const 2
    i32.shl
    i32.add
    i32.load
    local.tee $1
    i32.const 7
    i32.rotr
    local.get $1
    i32.const 18
    i32.rotr
    i32.xor
    local.get $1
    i32.const 3
    i32.shr_u
    i32.xor
    i32.add
    i32.add
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
    local.get $0
    global.get $~lib/metashrew-as/assembly/utils/sha256/i
    i32.const 2
    i32.shl
    local.tee $1
    i32.add
    i32.load
    local.get $1
    global.get $~lib/metashrew-as/assembly/utils/sha256/kPtr
    i32.add
    i32.load
    global.get $~lib/metashrew-as/assembly/utils/sha256/h
    global.get $~lib/metashrew-as/assembly/utils/sha256/e
    local.tee $1
    i32.const 6
    i32.rotr
    local.get $1
    i32.const 11
    i32.rotr
    i32.xor
    local.get $1
    i32.const 25
    i32.rotr
    i32.xor
    i32.add
    global.get $~lib/metashrew-as/assembly/utils/sha256/e
    local.tee $1
    global.get $~lib/metashrew-as/assembly/utils/sha256/f
    i32.and
    global.get $~lib/metashrew-as/assembly/utils/sha256/g
    local.get $1
    i32.const -1
    i32.xor
    i32.and
    i32.xor
    i32.add
    i32.add
    i32.add
    global.set $~lib/metashrew-as/assembly/utils/sha256/t1
    global.get $~lib/metashrew-as/assembly/utils/sha256/a
    local.tee $1
    i32.const 2
    i32.rotr
    local.get $1
    i32.const 13
    i32.rotr
    i32.xor
    local.get $1
    i32.const 22
    i32.rotr
    i32.xor
    global.get $~lib/metashrew-as/assembly/utils/sha256/b
    local.tee $1
    global.get $~lib/metashrew-as/assembly/utils/sha256/c
    local.tee $2
    i32.and
    local.get $1
    global.get $~lib/metashrew-as/assembly/utils/sha256/a
    local.tee $1
    i32.and
    local.get $1
    local.get $2
    i32.and
    i32.xor
    i32.xor
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
 (func $~lib/metashrew-as/assembly/utils/sha256/final (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/metashrew-as/assembly/utils/sha256/bytesHashed
  i32.const 63
  i32.and
  i32.const 63
  i32.lt_u
  if
   global.get $~lib/metashrew-as/assembly/utils/sha256/mPtr
   global.get $~lib/metashrew-as/assembly/utils/sha256/mLength
   i32.add
   i32.const 128
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
  i32.ge_u
  if
   global.get $~lib/metashrew-as/assembly/utils/sha256/mPtr
   global.get $~lib/metashrew-as/assembly/utils/sha256/mLength
   i32.add
   local.tee $1
   i32.const 64
   global.get $~lib/metashrew-as/assembly/utils/sha256/mLength
   i32.sub
   i32.add
   local.set $2
   loop $while-continue|0
    local.get $1
    local.get $2
    i32.lt_u
    if
     local.get $1
     i32.const 0
     i32.store8
     local.get $1
     i32.const 1
     i32.add
     local.set $1
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
  i32.ge_u
  if
   global.get $~lib/metashrew-as/assembly/utils/sha256/mPtr
   global.get $~lib/metashrew-as/assembly/utils/sha256/mLength
   i32.add
   i32.const 128
   i32.store8
   global.get $~lib/metashrew-as/assembly/utils/sha256/mLength
   i32.const 1
   i32.add
   global.set $~lib/metashrew-as/assembly/utils/sha256/mLength
  end
  global.get $~lib/metashrew-as/assembly/utils/sha256/mPtr
  global.get $~lib/metashrew-as/assembly/utils/sha256/mLength
  i32.add
  local.tee $1
  i32.const 56
  global.get $~lib/metashrew-as/assembly/utils/sha256/mLength
  i32.sub
  i32.add
  local.set $2
  loop $while-continue|1
   local.get $1
   local.get $2
   i32.lt_u
   if
    local.get $1
    i32.const 0
    i32.store8
    local.get $1
    i32.const 1
    i32.add
    local.set $1
    br $while-continue|1
   end
  end
  global.get $~lib/metashrew-as/assembly/utils/sha256/mPtr
  global.get $~lib/metashrew-as/assembly/utils/sha256/bytesHashed
  i32.const 536870912
  i32.div_s
  local.tee $1
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
  i32.store offset=56
  global.get $~lib/metashrew-as/assembly/utils/sha256/mPtr
  global.get $~lib/metashrew-as/assembly/utils/sha256/bytesHashed
  i32.const 3
  i32.shl
  local.tee $1
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
  i32.store offset=60
  global.get $~lib/metashrew-as/assembly/utils/sha256/wPtr
  global.get $~lib/metashrew-as/assembly/utils/sha256/mPtr
  call $~lib/metashrew-as/assembly/utils/sha256/hashBlocks
  local.get $0
  global.get $~lib/metashrew-as/assembly/utils/sha256/H0
  local.tee $1
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
  global.get $~lib/metashrew-as/assembly/utils/sha256/H1
  local.tee $1
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
  i32.store offset=4
  local.get $0
  global.get $~lib/metashrew-as/assembly/utils/sha256/H2
  local.tee $1
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
  i32.store offset=8
  local.get $0
  global.get $~lib/metashrew-as/assembly/utils/sha256/H3
  local.tee $1
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
  i32.store offset=12
  local.get $0
  global.get $~lib/metashrew-as/assembly/utils/sha256/H4
  local.tee $1
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
  i32.store offset=16
  local.get $0
  global.get $~lib/metashrew-as/assembly/utils/sha256/H5
  local.tee $1
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
  i32.store offset=20
  local.get $0
  global.get $~lib/metashrew-as/assembly/utils/sha256/H6
  local.tee $1
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
  i32.store offset=24
  local.get $0
  global.get $~lib/metashrew-as/assembly/utils/sha256/H7
  local.tee $0
  i32.const -16711936
  i32.and
  i32.const 8
  i32.rotl
  local.get $0
  i32.const 16711935
  i32.and
  i32.const 8
  i32.rotr
  i32.or
  i32.store offset=28
 )
 (func $~lib/metashrew-as/assembly/utils/sha256/sha256 (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  i32.const 32
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.set $2
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
  local.get $0
  i32.const 20
  i32.sub
  i32.load offset=16
  local.tee $4
  global.set $~lib/metashrew-as/assembly/utils/sha256/bytesHashed
  loop $for-loop|0
   local.get $3
   local.get $4
   i32.const 64
   i32.div_s
   i32.lt_s
   if
    global.get $~lib/metashrew-as/assembly/utils/sha256/wPtr
    local.get $0
    local.get $1
    i32.add
    call $~lib/metashrew-as/assembly/utils/sha256/hashBlocks
    local.get $3
    i32.const 1
    i32.add
    local.set $3
    local.get $1
    i32.const -64
    i32.sub
    local.set $1
    br $for-loop|0
   end
  end
  local.get $4
  i32.const 63
  i32.and
  local.tee $3
  if
   global.get $~lib/metashrew-as/assembly/utils/sha256/mPtr
   global.get $~lib/metashrew-as/assembly/utils/sha256/mLength
   i32.add
   local.get $0
   local.get $1
   i32.add
   local.get $3
   memory.copy
   global.get $~lib/metashrew-as/assembly/utils/sha256/mLength
   local.get $3
   i32.add
   global.set $~lib/metashrew-as/assembly/utils/sha256/mLength
  end
  local.get $2
  call $~lib/metashrew-as/assembly/utils/sha256/final
  local.get $2
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
  i32.const 30
  call $~lib/rt/__newArray
  local.tee $0
  i32.load offset=4
  drop
  local.get $0
  i32.const 0
  local.get $2
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/sat/Sat>#__set
  local.get $0
  i32.const 1
  local.get $3
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/sat/Sat>#__set
  local.get $0
  i32.const 2
  local.get $4
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/sat/Sat>#__set
  local.get $0
  i32.const 3
  local.get $5
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/sat/Sat>#__set
  local.get $0
  i32.const 4
  local.get $6
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/sat/Sat>#__set
  local.get $0
  i32.const 5
  local.get $1
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/sat/Sat>#__set
  local.get $0
  call $~lib/array/Array<~lib/arraybuffer/ArrayBuffer>#map<~lib/metashrew-as/assembly/utils/box/Box>
  call $~lib/metashrew-as/assembly/utils/box/Box.concat
  call $~lib/metashrew-as/assembly/utils/sha256/sha256
  call $~lib/metashrew-as/assembly/utils/sha256/sha256
  call $~lib/metashrew-as/assembly/utils/utils/reverse
 )
 (func $~lib/metashrew-as/assembly/utils/xxh32/xxh32 (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  local.get $0
  i32.eqz
  if
   i32.const 0
   return
  end
  local.get $0
  local.tee $1
  i32.const 20
  i32.sub
  i32.load offset=16
  i32.const 1
  i32.shl
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
 )
 (func $"~lib/map/Map<u32,~lib/arraybuffer/ArrayBuffer>#set" (param $0 i32) (param $1 i32) (param $2 i32)
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
  block $"__inlined_func$~lib/map/Map<u32,~lib/arraybuffer/ArrayBuffer>#find$731"
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
     br_if $"__inlined_func$~lib/map/Map<u32,~lib/arraybuffer/ArrayBuffer>#find$731"
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
 (func $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#set (param $0 i32) (param $1 i32)
  (local $2 i32)
  local.get $0
  local.get $0
  i32.const 20
  i32.sub
  i32.load offset=16
  call $~lib/metashrew-as/assembly/utils/box/Box#constructor
  local.tee $0
  i32.load offset=4
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.tee $2
  local.get $0
  i32.load
  local.get $0
  i32.load offset=4
  memory.copy
  local.get $2
  call $~lib/metashrew-as/assembly/utils/xxh32/xxh32
  local.set $0
  global.get $~lib/metashrew-as/assembly/indexer/index/_updates
  local.get $0
  local.get $1
  call $"~lib/map/Map<u32,~lib/arraybuffer/ArrayBuffer>#set"
  global.get $~lib/metashrew-as/assembly/indexer/index/_updateKeys
  local.get $0
  local.get $2
  call $"~lib/map/Map<u32,~lib/arraybuffer/ArrayBuffer>#set"
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/utils/box/Box>#constructor (result i32)
  (local $0 i32)
  (local $1 i32)
  i32.const 16
  i32.const 27
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
   call $~lib/array/Array<~lib/metashrew-as/assembly/utils/box/Box>#constructor
   local.tee $0
   local.get $2
   call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Output>#push
   drop
   local.get $0
   local.get $1
   i32.load offset=28
   call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Output>#push
   drop
   local.get $0
   local.get $3
   call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Output>#push
   drop
  else
   call $~lib/array/Array<~lib/metashrew-as/assembly/utils/box/Box>#constructor
   local.tee $0
   local.get $1
   i32.load
   call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Output>#push
   drop
  end
  local.get $1
  local.get $0
  call $~lib/metashrew-as/assembly/utils/box/Box.concat
  call $~lib/metashrew-as/assembly/utils/sha256/sha256
  call $~lib/metashrew-as/assembly/utils/sha256/sha256
  call $~lib/metashrew-as/assembly/utils/utils/reverse
  i32.store offset=32
  local.get $1
  i32.load offset=32
 )
 (func $~lib/metashrew-as/assembly/blockdata/transaction/OutPoint.from (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  i32.const 4
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.tee $2
  local.get $1
  i32.store
  i32.const 2
  i32.const 30
  call $~lib/rt/__newArray
  local.tee $1
  i32.load offset=4
  drop
  local.get $1
  i32.const 0
  local.get $0
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/sat/Sat>#__set
  local.get $1
  i32.const 1
  local.get $2
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/sat/Sat>#__set
  local.get $1
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
  i32.const 32
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
 (func $"~lib/map/Map<u32,~lib/arraybuffer/ArrayBuffer>#get" (param $0 i32) (param $1 i32) (result i32)
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
  block $"__inlined_func$~lib/map/Map<u32,~lib/arraybuffer/ArrayBuffer>#find$750"
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
     br_if $"__inlined_func$~lib/map/Map<u32,~lib/arraybuffer/ArrayBuffer>#find$750"
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
   i32.const 4624
   i32.const 4688
   i32.const 105
   i32.const 17
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  i32.load offset=4
 )
 (func $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#get (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  local.get $0
  local.tee $1
  call $~lib/metashrew-as/assembly/utils/xxh32/xxh32
  local.set $2
  global.get $~lib/metashrew-as/assembly/indexer/index/_updates
  local.tee $0
  i32.load
  local.get $0
  i32.load offset=4
  local.get $2
  i32.const -1028477379
  i32.mul
  i32.const 374761397
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
  block $"__inlined_func$~lib/map/Map<u32,~lib/arraybuffer/ArrayBuffer>#find$749"
   loop $while-continue|0
    local.get $0
    if
     local.get $0
     i32.load offset=8
     local.tee $3
     i32.const 1
     i32.and
     if (result i32)
      i32.const 0
     else
      local.get $0
      i32.load
      local.get $2
      i32.eq
     end
     br_if $"__inlined_func$~lib/map/Map<u32,~lib/arraybuffer/ArrayBuffer>#find$749"
     local.get $3
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
  if
   global.get $~lib/metashrew-as/assembly/indexer/index/_updates
   local.get $2
   call $"~lib/map/Map<u32,~lib/arraybuffer/ArrayBuffer>#get"
   local.set $0
  else
   local.get $1
   local.get $1
   call $~lib/metashrew-as/assembly/indexer/index/__get_len
   call $~lib/arraybuffer/ArrayBuffer#constructor
   local.tee $0
   call $~lib/metashrew-as/assembly/indexer/index/__get
   global.get $~lib/metashrew-as/assembly/indexer/index/_updates
   local.get $2
   local.get $0
   call $"~lib/map/Map<u32,~lib/arraybuffer/ArrayBuffer>#set"
   global.get $~lib/metashrew-as/assembly/indexer/index/_updateKeys
   local.get $2
   local.get $0
   call $"~lib/map/Map<u32,~lib/arraybuffer/ArrayBuffer>#set"
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
 (func $assembly/index/Index.totalOutputs (param $0 i32) (result i64)
  (local $1 i32)
  (local $2 i64)
  (local $3 i32)
  loop $for-loop|0
   local.get $1
   local.get $0
   i32.load offset=16
   local.tee $3
   i32.load offset=12
   i32.lt_s
   if
    local.get $2
    local.get $3
    local.get $1
    call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Input>#__get
    i64.load offset=8
    i64.add
    local.set $2
    local.get $1
    i32.const 1
    i32.add
    local.set $1
    br $for-loop|0
   end
  end
  local.get $2
 )
 (func $~lib/metashrew-as/assembly/blockdata/transaction/Input#previousOutput (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  local.get $0
  i32.load offset=4
  i32.load
  i32.const 32
  call $~lib/metashrew-as/assembly/utils/box/Box#constructor
  local.set $1
  local.get $0
  i32.load offset=4
  i32.load
  i32.const 32
  i32.add
  i32.const 4
  call $~lib/metashrew-as/assembly/utils/box/Box#constructor
  local.set $2
  local.get $1
  i32.load offset=4
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.tee $0
  local.get $1
  i32.load
  local.get $1
  i32.load offset=4
  memory.copy
  local.get $0
  call $~lib/metashrew-as/assembly/utils/utils/reverse
  local.set $1
  local.get $2
  i32.load
  local.tee $3
  i32.load
  local.set $0
  local.get $2
  local.get $3
  i32.const 4
  i32.add
  i32.store
  local.get $2
  local.get $2
  i32.load offset=4
  i32.const 4
  i32.sub
  i32.store offset=4
  local.get $1
  local.get $0
  call $~lib/metashrew-as/assembly/blockdata/transaction/OutPoint.from
 )
 (func $~lib/array/Array<u64>#constructor (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  i32.const 16
  i32.const 35
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
  i32.const 134217727
  i32.gt_u
  if
   i32.const 1728
   i32.const 3264
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
  i32.const 3
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
 (func $~lib/array/Array<u64>#__set (param $0 i32) (param $1 i32) (param $2 i64)
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
    i32.const 3136
    i32.const 3264
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
   i32.const 3
   i32.const 1
   call $~lib/array/ensureCapacity
   local.get $0
   local.get $3
   i32.store offset=12
  end
  local.get $0
  i32.load offset=4
  local.get $1
  i32.const 3
  i32.shl
  i32.add
  local.get $2
  i64.store
 )
 (func $assembly/index/SatSource#constructor (param $0 i32) (result i32)
  (local $1 i32)
  i32.const 16
  i32.const 33
  call $~lib/rt/stub/__new
  local.tee $1
  i32.const 0
  i32.store
  local.get $1
  i32.const 0
  i32.store offset=4
  local.get $1
  i64.const 0
  i64.store offset=8
  local.get $1
  local.get $0
  i32.store
  local.get $1
 )
 (func $assembly/index/SatRanges#constructor (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  i32.const 8
  i32.const 34
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
 (func $assembly/index/SatSink#constructor (param $0 i32) (result i32)
  (local $1 i32)
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
  i64.const 0
  i64.store offset=8
  local.get $1
  local.get $0
  i32.store
  local.get $1
 )
 (func $~lib/array/Array<u64>#__get (param $0 i32) (param $1 i32) (result i64)
  local.get $1
  local.get $0
  i32.load offset=12
  i32.ge_u
  if
   i32.const 3136
   i32.const 3264
   i32.const 114
   i32.const 42
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  i32.load offset=4
  local.get $1
  i32.const 3
  i32.shl
  i32.add
  i64.load
 )
 (func $assembly/index/SatSource#consumed (param $0 i32) (result i32)
  (local $1 i32)
  local.get $0
  i32.load offset=4
  local.get $0
  i32.load
  i32.load
  i32.load offset=12
  i32.ge_s
  if (result i32)
   i32.const 1
  else
   local.get $0
   i32.load offset=4
   local.get $0
   i32.load
   local.tee $1
   i32.load
   i32.load offset=12
   i32.const 1
   i32.sub
   i32.eq
   if (result i32)
    local.get $0
    i64.load offset=8
    local.get $1
    i32.load offset=4
    local.tee $0
    local.get $0
    i32.load offset=12
    i32.const 1
    i32.sub
    call $~lib/array/Array<u64>#__get
    i64.ge_u
   else
    i32.const 0
   end
  end
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
    i32.const 5052
    i32.add
    i64.load32_u
    local.get $3
    i32.const 100
    i32.rem_u
    i32.const 2
    i32.shl
    i32.const 5052
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
   i32.const 5052
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
   i32.const 5052
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
   i32.const 5040
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
  i32.const 6624
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
 (func $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#extend (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  i32.const 1
  global.set $~argumentsLength
  local.get $0
  i32.const 4768
  call $~lib/string/String.UTF8.encode@varargs
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
  local.tee $3
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#getValue<u32>
  local.set $2
  i32.const 4
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.tee $1
  local.get $2
  i32.const 1
  i32.add
  i32.store
  local.get $3
  local.get $1
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#set
  i32.const 4816
  local.get $2
  call $~lib/util/number/utoa32
  call $~lib/string/String.__concat
  local.set $1
  i32.const 1
  global.set $~argumentsLength
  local.get $0
  local.get $1
  call $~lib/string/String.UTF8.encode@varargs
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
 )
 (func $assembly/index/SatSink#consume (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i64)
  (local $6 i64)
  (local $7 i64)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i64)
  (local $12 i32)
  (local $13 i32)
  (local $14 i32)
  (local $15 i32)
  loop $while-continue|0
   local.get $1
   call $assembly/index/SatSource#consumed
   if (result i32)
    i32.const 1
   else
    local.get $0
    i32.load offset=4
    local.get $0
    i32.load
    i32.load offset=16
    i32.load offset=12
    i32.ge_s
    if (result i32)
     i32.const 1
    else
     local.get $0
     i32.load
     i32.load offset=16
     local.tee $2
     i32.load offset=12
     i32.const 1
     i32.sub
     local.tee $3
     local.get $0
     i32.load offset=4
     i32.eq
     if (result i32)
      local.get $0
      i64.load offset=8
      local.get $2
      local.get $3
      call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Input>#__get
      i64.load offset=8
      i64.ge_u
     else
      i32.const 0
     end
    end
   end
   i32.eqz
   if
    local.get $1
    i32.load
    i32.load offset=4
    local.get $1
    i32.load offset=4
    call $~lib/array/Array<u64>#__get
    local.get $1
    i64.load offset=8
    i64.sub
    local.set $6
    local.get $0
    i32.load
    i32.load offset=16
    local.get $0
    i32.load offset=4
    call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Input>#__get
    i64.load offset=8
    local.get $0
    i64.load offset=8
    i64.sub
    local.set $7
    local.get $0
    i32.load
    call $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#txid
    local.get $0
    i32.load offset=4
    call $~lib/metashrew-as/assembly/blockdata/transaction/OutPoint.from
    i32.load
    local.tee $2
    i32.load offset=4
    call $~lib/arraybuffer/ArrayBuffer#constructor
    local.tee $10
    local.get $2
    i32.load
    local.get $2
    i32.load offset=4
    memory.copy
    local.get $1
    i32.load
    i32.load
    local.get $1
    i32.load offset=4
    call $~lib/array/Array<u64>#__get
    local.get $1
    i64.load offset=8
    i64.add
    local.set $5
    global.get $assembly/index/SAT_TO_OUTPOINT
    local.set $8
    i32.const 8
    call $~lib/arraybuffer/ArrayBuffer#constructor
    local.tee $9
    local.get $5
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
    local.tee $11
    i64.const 16
    i64.shr_u
    i64.const 281470681808895
    i64.and
    local.get $11
    i64.const 281470681808895
    i64.and
    i64.const 16
    i64.shl
    i64.or
    i64.const 32
    i64.rotr
    local.tee $11
    i64.store
    local.get $10
    i32.const 20
    i32.sub
    i32.load offset=16
    if
     i32.const 0
     local.set $3
     i32.const 8
     call $~lib/arraybuffer/ArrayBuffer#constructor
     local.tee $4
     local.get $11
     i64.store
     loop $for-loop|0
      local.get $3
      i32.const 8
      i32.lt_s
      if
       local.get $3
       call $~lib/arraybuffer/ArrayBuffer#constructor
       local.set $2
       local.get $3
       if
        local.get $2
        local.get $4
        local.get $3
        memory.copy
       end
       local.get $8
       i32.load
       local.get $2
       call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
       local.set $2
       i32.const 1
       global.set $~argumentsLength
       local.get $2
       i32.const 4736
       call $~lib/string/String.UTF8.encode@varargs
       call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
       local.tee $12
       call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#get
       local.tee $2
       i32.const 20
       i32.sub
       i32.load offset=16
       i32.eqz
       if
        i32.const 32
        call $~lib/arraybuffer/ArrayBuffer#constructor
        local.set $2
       end
       local.get $3
       local.get $4
       i32.add
       i32.load8_u
       local.tee $13
       i32.const 3
       i32.shr_u
       local.get $2
       i32.add
       local.set $14
       i32.const 1
       i32.const 7
       local.get $13
       i32.const 7
       i32.and
       i32.sub
       i32.const 7
       i32.and
       i32.shl
       local.tee $13
       local.get $14
       i32.load8_u
       local.tee $15
       i32.and
       i32.eqz
       if
        local.get $14
        local.get $13
        local.get $15
        i32.or
        i32.store8
        local.get $12
        local.get $2
        call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#set
       end
       local.get $3
       i32.const 1
       i32.add
       local.set $3
       br $for-loop|0
      end
     end
    else
     i32.const 8
     call $~lib/arraybuffer/ArrayBuffer#constructor
     local.tee $12
     local.get $5
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
     local.tee $11
     i64.const 16
     i64.shr_u
     i64.const 281470681808895
     i64.and
     local.get $11
     i64.const 281470681808895
     i64.and
     i64.const 16
     i64.shl
     i64.or
     i64.const 32
     i64.rotr
     i64.store
     i32.const 7
     local.set $3
     loop $for-loop|00
      local.get $3
      i32.const 0
      i32.ge_s
      if
       block $for-break0
        local.get $3
        call $~lib/arraybuffer/ArrayBuffer#constructor
        local.set $2
        local.get $3
        if
         local.get $2
         local.get $12
         local.get $3
         memory.copy
        end
        local.get $8
        i32.load
        local.get $2
        call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
        local.set $2
        i32.const 1
        global.set $~argumentsLength
        local.get $2
        i32.const 4736
        call $~lib/string/String.UTF8.encode@varargs
        call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
        local.tee $13
        call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#get
        local.tee $2
        i32.const 20
        i32.sub
        i32.load offset=16
        i32.eqz
        if
         i32.const 32
         call $~lib/arraybuffer/ArrayBuffer#constructor
         local.set $2
        end
        local.get $3
        local.get $12
        i32.add
        i32.load8_u
        local.tee $4
        i32.const 3
        i32.shr_u
        local.get $2
        i32.add
        local.tee $14
        i32.load8_u
        local.tee $15
        i32.const 1
        i32.const 7
        local.get $4
        i32.const 7
        i32.and
        i32.sub
        i32.const 7
        i32.and
        local.tee $4
        i32.shl
        i32.and
        if
         local.get $14
         local.get $15
         i32.const -2
         local.get $4
         i32.rotl
         i32.and
         i32.store8
        end
        block $__inlined_func$~lib/metashrew-as/assembly/indexer/bst/isZeroU256$384 (result i32)
         i32.const 0
         local.set $4
         loop $for-loop|001
          local.get $4
          i32.const 4
          i32.lt_s
          if
           i32.const 0
           local.get $2
           i32.const -64
           i32.sub
           i64.load
           i64.const 0
           i64.ne
           br_if $__inlined_func$~lib/metashrew-as/assembly/indexer/bst/isZeroU256$384
           drop
           local.get $4
           i32.const 1
           i32.add
           local.set $4
           br $for-loop|001
          end
         end
         i32.const 1
        end
        if
         local.get $13
         i32.const 0
         call $~lib/arraybuffer/ArrayBuffer#constructor
         call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#set
         br $for-break0
        else
         local.get $13
         local.get $2
         call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#set
        end
        local.get $3
        i32.const 1
        i32.sub
        local.set $3
        br $for-loop|00
       end
      end
     end
    end
    local.get $8
    i32.load
    local.get $9
    call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
    local.get $10
    call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#set
    global.get $assembly/index/OUTPOINT_TO_SAT
    local.get $10
    call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
    call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#extend
    local.set $2
    i32.const 8
    call $~lib/arraybuffer/ArrayBuffer#constructor
    local.tee $3
    local.get $5
    i64.store
    local.get $2
    local.get $3
    call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#set
    local.get $6
    local.get $7
    i64.gt_u
    if
     local.get $0
     local.get $0
     i32.load offset=4
     i32.const 1
     i32.add
     i32.store offset=4
     local.get $0
     i64.const 0
     i64.store offset=8
     local.get $1
     local.get $1
     i64.load offset=8
     local.get $7
     i64.add
     i64.store offset=8
    else
     local.get $6
     local.get $7
     i64.lt_u
     if
      local.get $1
      local.get $1
      i32.load offset=4
      i32.const 1
      i32.add
      i32.store offset=4
      local.get $1
      i64.const 0
      i64.store offset=8
      local.get $0
      local.get $0
      i64.load offset=8
      local.get $6
      i64.add
      i64.store offset=8
     else
      local.get $1
      i64.const 0
      i64.store offset=8
      local.get $1
      local.get $1
      i32.load offset=4
      i32.const 1
      i32.add
      i32.store offset=4
      local.get $0
      i64.const 0
      i64.store offset=8
      local.get $0
      local.get $0
      i32.load offset=4
      i32.const 1
      i32.add
      i32.store offset=4
     end
    end
    br $while-continue|0
   end
  end
 )
 (func $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#getListValues<u64> (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  i32.const 1
  global.set $~argumentsLength
  local.get $0
  i32.const 4768
  call $~lib/string/String.UTF8.encode@varargs
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#getValue<u32>
  call $~lib/array/Array<u64>#constructor
  local.set $2
  loop $for-loop|0
   local.get $1
   local.get $2
   i32.load offset=12
   i32.lt_s
   if
    i32.const 4816
    local.get $1
    call $~lib/util/number/utoa32
    call $~lib/string/String.__concat
    local.set $3
    i32.const 1
    global.set $~argumentsLength
    local.get $2
    local.get $1
    local.get $0
    local.get $3
    call $~lib/string/String.UTF8.encode@varargs
    call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
    call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#getValue<u64>
    call $~lib/array/Array<u64>#__set
    local.get $1
    i32.const 1
    i32.add
    local.set $1
    br $for-loop|0
   end
  end
  local.get $2
 )
 (func $assembly/index/SatRanges.fromInputs~anonymous|0 (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  global.get $assembly/index/OUTPOINT_TO_SAT
  local.set $1
  local.get $0
  call $~lib/metashrew-as/assembly/blockdata/transaction/Input#previousOutput
  i32.load
  local.tee $0
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
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#getListValues<u64>
 )
 (func $~lib/metashrew-as/assembly/indexer/bst/maskGreaterThan (param $0 i32) (param $1 i32)
  (local $2 i64)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  i32.const 4
  call $~lib/array/Array<u64>#constructor
  local.tee $3
  i32.const 0
  local.get $0
  i64.load
  local.tee $2
  i64.const 8
  i64.shr_u
  i64.const 71777214294589695
  i64.and
  local.get $2
  i64.const 71777214294589695
  i64.and
  i64.const 8
  i64.shl
  i64.or
  local.tee $2
  i64.const 16
  i64.shr_u
  i64.const 281470681808895
  i64.and
  local.get $2
  i64.const 281470681808895
  i64.and
  i64.const 16
  i64.shl
  i64.or
  i64.const 32
  i64.rotr
  call $~lib/array/Array<u64>#__set
  local.get $3
  i32.const 1
  local.get $0
  i64.load offset=8
  local.tee $2
  i64.const 8
  i64.shr_u
  i64.const 71777214294589695
  i64.and
  local.get $2
  i64.const 71777214294589695
  i64.and
  i64.const 8
  i64.shl
  i64.or
  local.tee $2
  i64.const 16
  i64.shr_u
  i64.const 281470681808895
  i64.and
  local.get $2
  i64.const 281470681808895
  i64.and
  i64.const 16
  i64.shl
  i64.or
  i64.const 32
  i64.rotr
  call $~lib/array/Array<u64>#__set
  local.get $3
  i32.const 2
  local.get $0
  i64.load offset=16
  local.tee $2
  i64.const 8
  i64.shr_u
  i64.const 71777214294589695
  i64.and
  local.get $2
  i64.const 71777214294589695
  i64.and
  i64.const 8
  i64.shl
  i64.or
  local.tee $2
  i64.const 16
  i64.shr_u
  i64.const 281470681808895
  i64.and
  local.get $2
  i64.const 281470681808895
  i64.and
  i64.const 16
  i64.shl
  i64.or
  i64.const 32
  i64.rotr
  call $~lib/array/Array<u64>#__set
  local.get $3
  i32.const 3
  local.get $0
  i64.load offset=24
  local.tee $2
  i64.const 8
  i64.shr_u
  i64.const 71777214294589695
  i64.and
  local.get $2
  i64.const 71777214294589695
  i64.and
  i64.const 8
  i64.shl
  i64.or
  local.tee $2
  i64.const 16
  i64.shr_u
  i64.const 281470681808895
  i64.and
  local.get $2
  i64.const 281470681808895
  i64.and
  i64.const 16
  i64.shl
  i64.or
  i64.const 32
  i64.rotr
  call $~lib/array/Array<u64>#__set
  local.get $3
  local.get $1
  i32.const 255
  i32.and
  local.tee $6
  i32.const 6
  i32.shr_u
  local.tee $1
  local.get $3
  local.get $1
  call $~lib/array/Array<u64>#__get
  i64.const 1
  local.get $6
  i32.const 63
  i32.and
  local.tee $6
  i32.const 1
  i32.add
  i64.extend_i32_u
  i64.shl
  i64.const 1
  i64.sub
  i64.const 63
  local.get $6
  i64.extend_i32_u
  i64.sub
  i64.shl
  i64.const -1
  i64.xor
  i64.and
  call $~lib/array/Array<u64>#__set
  loop $for-loop|0
   local.get $1
   local.get $5
   i32.gt_u
   if
    local.get $3
    local.get $5
    i64.const 0
    call $~lib/array/Array<u64>#__set
    local.get $5
    i32.const 1
    i32.add
    local.set $5
    br $for-loop|0
   end
  end
  loop $for-loop|1
   local.get $4
   i32.const 4
   i32.lt_s
   if
    local.get $0
    local.get $4
    i32.const 3
    i32.shl
    i32.add
    local.get $3
    local.get $4
    call $~lib/array/Array<u64>#__get
    local.tee $2
    i64.const 8
    i64.shr_u
    i64.const 71777214294589695
    i64.and
    local.get $2
    i64.const 71777214294589695
    i64.and
    i64.const 8
    i64.shl
    i64.or
    local.tee $2
    i64.const 16
    i64.shr_u
    i64.const 281470681808895
    i64.and
    local.get $2
    i64.const 281470681808895
    i64.and
    i64.const 16
    i64.shl
    i64.or
    i64.const 32
    i64.rotr
    i64.store
    local.get $4
    i32.const 1
    i32.add
    local.set $4
    br $for-loop|1
   end
  end
 )
 (func $~lib/metashrew-as/assembly/indexer/bst/binarySearchU16 (param $0 i32) (result i32)
  (local $1 i32)
  local.get $0
  i32.const 65535
  i32.and
  i32.const 8
  i32.shr_u
  local.tee $1
  if (result i32)
   block $__inlined_func$~lib/metashrew-as/assembly/indexer/bst/binarySearchU8$47 (result i32)
    local.get $1
    i32.const 4
    i32.shr_u
    local.tee $0
    if
     block $__inlined_func$~lib/metashrew-as/assembly/indexer/bst/binarySearchU4$31 (result i32)
      local.get $0
      i32.const 2
      i32.shr_u
      local.tee $1
      if
       local.get $1
       i32.const 1
       i32.shr_u
       i32.eqz
       br $__inlined_func$~lib/metashrew-as/assembly/indexer/bst/binarySearchU4$31
      end
      i32.const 2
      i32.const 3
      local.get $0
      i32.const 3
      i32.and
      i32.const 1
      i32.shr_u
      select
     end
     br $__inlined_func$~lib/metashrew-as/assembly/indexer/bst/binarySearchU8$47
    end
    block $__inlined_func$~lib/metashrew-as/assembly/indexer/bst/binarySearchU4$32 (result i32)
     local.get $1
     i32.const 15
     i32.and
     local.tee $0
     i32.const 2
     i32.shr_u
     local.tee $1
     if
      local.get $1
      i32.const 1
      i32.shr_u
      i32.eqz
      br $__inlined_func$~lib/metashrew-as/assembly/indexer/bst/binarySearchU4$32
     end
     i32.const 2
     i32.const 3
     local.get $0
     i32.const 3
     i32.and
     i32.const 1
     i32.shr_u
     select
    end
    i32.const 4
    i32.add
   end
  else
   block $__inlined_func$~lib/metashrew-as/assembly/indexer/bst/binarySearchU8$48 (result i32)
    local.get $0
    i32.const 255
    i32.and
    local.tee $0
    i32.const 15
    i32.and
    local.set $1
    local.get $0
    i32.const 4
    i32.shr_u
    local.tee $0
    if
     block $__inlined_func$~lib/metashrew-as/assembly/indexer/bst/binarySearchU4$310 (result i32)
      local.get $0
      i32.const 2
      i32.shr_u
      local.tee $1
      if
       local.get $1
       i32.const 1
       i32.shr_u
       i32.eqz
       br $__inlined_func$~lib/metashrew-as/assembly/indexer/bst/binarySearchU4$310
      end
      i32.const 2
      i32.const 3
      local.get $0
      i32.const 3
      i32.and
      i32.const 1
      i32.shr_u
      select
     end
     br $__inlined_func$~lib/metashrew-as/assembly/indexer/bst/binarySearchU8$48
    end
    block $__inlined_func$~lib/metashrew-as/assembly/indexer/bst/binarySearchU4$321 (result i32)
     local.get $1
     i32.const 2
     i32.shr_u
     local.tee $0
     if
      local.get $0
      i32.const 1
      i32.shr_u
      i32.eqz
      br $__inlined_func$~lib/metashrew-as/assembly/indexer/bst/binarySearchU4$321
     end
     i32.const 2
     i32.const 3
     local.get $1
     i32.const 3
     i32.and
     i32.const 1
     i32.shr_u
     select
    end
    i32.const 4
    i32.add
   end
   i32.const 8
   i32.add
  end
 )
 (func $~lib/metashrew-as/assembly/indexer/bst/binarySearchU32 (param $0 i32) (result i32)
  (local $1 i32)
  local.get $0
  i32.const 16
  i32.shr_u
  local.tee $1
  if (result i32)
   local.get $1
   call $~lib/metashrew-as/assembly/indexer/bst/binarySearchU16
  else
   local.get $0
   i32.const 65535
   i32.and
   call $~lib/metashrew-as/assembly/indexer/bst/binarySearchU16
   i32.const 16
   i32.add
  end
 )
 (func $~lib/metashrew-as/assembly/indexer/bst/binarySearchU64 (param $0 i64) (result i32)
  (local $1 i32)
  local.get $0
  i64.const 32
  i64.shr_u
  i64.const 4294967295
  i64.and
  i32.wrap_i64
  local.tee $1
  if
   local.get $1
   call $~lib/metashrew-as/assembly/indexer/bst/binarySearchU32
   return
  end
  local.get $0
  i64.const 4294967295
  i64.and
  i32.wrap_i64
  call $~lib/metashrew-as/assembly/indexer/bst/binarySearchU32
  i32.const 32
  i32.add
 )
 (func $~lib/metashrew-as/assembly/indexer/bst/binarySearchU256 (param $0 i32) (result i32)
  (local $1 i64)
  (local $2 i64)
  (local $3 i64)
  (local $4 i64)
  (local $5 i64)
  local.get $0
  i64.load
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
  local.tee $1
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
  local.tee $1
  local.get $0
  i64.load offset=8
  local.tee $2
  i64.const 8
  i64.shr_u
  i64.const 71777214294589695
  i64.and
  local.get $2
  i64.const 71777214294589695
  i64.and
  i64.const 8
  i64.shl
  i64.or
  local.tee $2
  i64.const 16
  i64.shr_u
  i64.const 281470681808895
  i64.and
  local.get $2
  i64.const 281470681808895
  i64.and
  i64.const 16
  i64.shl
  i64.or
  i64.const 32
  i64.rotr
  local.tee $3
  i64.or
  local.tee $2
  local.get $0
  i64.load offset=16
  local.tee $4
  i64.const 8
  i64.shr_u
  i64.const 71777214294589695
  i64.and
  local.get $4
  i64.const 71777214294589695
  i64.and
  i64.const 8
  i64.shl
  i64.or
  local.tee $4
  i64.const 16
  i64.shr_u
  i64.const 281470681808895
  i64.and
  local.get $4
  i64.const 281470681808895
  i64.and
  i64.const 16
  i64.shl
  i64.or
  i64.const 32
  i64.rotr
  local.tee $4
  local.get $0
  i64.load offset=24
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
  local.tee $5
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
  local.tee $5
  i64.or
  i64.or
  i64.eqz
  if
   i32.const -1
   return
  end
  local.get $2
  i64.const 0
  i64.ne
  if (result i32)
   local.get $1
   i64.const 0
   i64.ne
   if (result i32)
    local.get $1
    call $~lib/metashrew-as/assembly/indexer/bst/binarySearchU64
   else
    local.get $3
    call $~lib/metashrew-as/assembly/indexer/bst/binarySearchU64
    i32.const -64
    i32.sub
   end
  else
   local.get $4
   i64.const 0
   i64.ne
   if (result i32)
    local.get $4
    call $~lib/metashrew-as/assembly/indexer/bst/binarySearchU64
   else
    local.get $5
    call $~lib/metashrew-as/assembly/indexer/bst/binarySearchU64
    i32.const -64
    i32.sub
   end
   i32.const 128
   i32.add
  end
 )
 (func $assembly/index/SatRanges.fromInputs (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i64)
  (local $3 i64)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i64)
  local.get $0
  i32.load offset=12
  local.tee $7
  i32.const 37
  call $~lib/rt/__newArray
  local.tee $8
  i32.load offset=4
  local.set $9
  loop $for-loop|0
   local.get $1
   local.get $7
   local.get $0
   i32.load offset=12
   local.tee $4
   local.get $4
   local.get $7
   i32.gt_s
   select
   i32.lt_s
   if
    local.get $1
    i32.const 2
    i32.shl
    local.tee $10
    local.get $0
    i32.load offset=4
    i32.add
    i32.load
    local.set $4
    i32.const 3
    global.set $~argumentsLength
    local.get $9
    local.get $10
    i32.add
    local.get $4
    local.get $1
    local.get $0
    i32.const 6656
    i32.load
    call_indirect (type $4)
    i32.store
    local.get $1
    i32.const 1
    i32.add
    local.set $1
    br $for-loop|0
   end
  end
  i32.const 0
  call $~lib/array/Array<u64>#constructor
  local.set $4
  loop $for-loop|00
   local.get $6
   local.get $8
   i32.load offset=12
   i32.lt_s
   if
    i32.const 0
    local.set $1
    loop $for-loop|1
     local.get $1
     local.get $8
     local.get $6
     call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Input>#__get
     i32.load offset=12
     i32.lt_s
     if
      local.get $8
      local.get $6
      call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Input>#__get
      local.get $1
      call $~lib/array/Array<u64>#__get
      local.set $2
      local.get $4
      local.get $4
      i32.load offset=12
      local.tee $0
      i32.const 1
      i32.add
      local.tee $7
      i32.const 3
      i32.const 1
      call $~lib/array/ensureCapacity
      local.get $4
      i32.load offset=4
      local.get $0
      i32.const 3
      i32.shl
      i32.add
      local.get $2
      i64.store
      local.get $4
      local.get $7
      i32.store offset=12
      local.get $1
      i32.const 1
      i32.add
      local.set $1
      br $for-loop|1
     end
    end
    local.get $6
    i32.const 1
    i32.add
    local.set $6
    br $for-loop|00
   end
  end
  local.get $4
  i32.load offset=12
  call $~lib/array/Array<u64>#constructor
  local.set $6
  loop $for-loop|02
   local.get $5
   local.get $4
   i32.load offset=12
   i32.lt_s
   if
    global.get $assembly/index/SAT_TO_OUTPOINT
    local.set $7
    local.get $4
    local.get $5
    call $~lib/array/Array<u64>#__get
    local.set $3
    block $__inlined_func$~lib/metashrew-as/assembly/indexer/bst/BST<u64>#seekGreater$33 (result i64)
     i32.const 8
     call $~lib/arraybuffer/ArrayBuffer#constructor
     local.tee $1
     local.get $3
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
     local.tee $2
     i64.const 16
     i64.shr_u
     i64.const 281470681808895
     i64.and
     local.get $2
     i64.const 281470681808895
     i64.and
     i64.const 16
     i64.shl
     i64.or
     i64.const 32
     i64.rotr
     i64.store
     loop $do-loop|0
      local.get $1
      local.get $1
      i32.const 20
      i32.sub
      i32.load offset=16
      call $~lib/metashrew-as/assembly/utils/box/Box#constructor
      local.tee $8
      local.get $8
      i32.load offset=4
      i32.const 1
      i32.sub
      i32.store offset=4
      local.get $8
      i32.load offset=4
      call $~lib/arraybuffer/ArrayBuffer#constructor
      local.tee $0
      local.get $8
      i32.load
      local.get $8
      i32.load offset=4
      memory.copy
      local.get $7
      i32.load
      local.get $0
      call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
      local.set $8
      i32.const 1
      global.set $~argumentsLength
      local.get $8
      i32.const 4736
      call $~lib/string/String.UTF8.encode@varargs
      call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
      call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#get
      local.tee $8
      i32.const 20
      i32.sub
      i32.load offset=16
      if
       local.get $8
       local.get $1
       local.get $0
       i32.const 20
       i32.sub
       i32.load offset=16
       i32.add
       i32.load8_u
       call $~lib/metashrew-as/assembly/indexer/bst/maskGreaterThan
       local.get $8
       call $~lib/metashrew-as/assembly/indexer/bst/binarySearchU256
       local.tee $1
       i32.const -1
       i32.ne
       if
        i32.const 2
        i32.const 27
        call $~lib/rt/__newArray
        local.tee $8
        i32.load offset=4
        drop
        local.get $8
        i32.const 0
        local.get $0
        local.get $0
        i32.const 20
        i32.sub
        i32.load offset=16
        call $~lib/metashrew-as/assembly/utils/box/Box#constructor
        call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/sat/Sat>#__set
        i32.const 1
        call $~lib/arraybuffer/ArrayBuffer#constructor
        local.tee $0
        local.get $1
        i32.store8
        local.get $8
        i32.const 1
        local.get $0
        local.get $0
        i32.const 20
        i32.sub
        i32.load offset=16
        call $~lib/metashrew-as/assembly/utils/box/Box#constructor
        call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/sat/Sat>#__set
        local.get $8
        call $~lib/metashrew-as/assembly/utils/box/Box.concat
        local.set $0
        loop $while-continue|0
         local.get $0
         i32.const 20
         i32.sub
         i32.load offset=16
         local.tee $1
         i32.const 8
         i32.ne
         if
          local.get $1
          i32.const 1
          i32.add
          call $~lib/arraybuffer/ArrayBuffer#constructor
          local.tee $1
          local.get $0
          local.get $0
          i32.const 20
          i32.sub
          i32.load offset=16
          memory.copy
          local.get $1
          local.get $0
          i32.const 20
          i32.sub
          i32.load offset=16
          i32.add
          local.set $8
          local.get $7
          i32.load
          local.get $0
          call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
          local.set $0
          i32.const 1
          global.set $~argumentsLength
          local.get $8
          local.get $0
          i32.const 4736
          call $~lib/string/String.UTF8.encode@varargs
          call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
          call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#get
          call $~lib/metashrew-as/assembly/indexer/bst/binarySearchU256
          i32.store8
          local.get $1
          local.set $0
          br $while-continue|0
         end
        end
        local.get $0
        i64.load
        local.tee $2
        i64.const 8
        i64.shr_u
        i64.const 71777214294589695
        i64.and
        local.get $2
        i64.const 71777214294589695
        i64.and
        i64.const 8
        i64.shl
        i64.or
        local.tee $2
        i64.const 16
        i64.shr_u
        i64.const 281470681808895
        i64.and
        local.get $2
        i64.const 281470681808895
        i64.and
        i64.const 16
        i64.shl
        i64.or
        i64.const 32
        i64.rotr
        br $__inlined_func$~lib/metashrew-as/assembly/indexer/bst/BST<u64>#seekGreater$33
       end
      end
      local.get $0
      local.tee $1
      i32.const 20
      i32.sub
      i32.load offset=16
      br_if $do-loop|0
     end
     i64.const 0
    end
    local.set $11
    local.get $6
    local.get $5
    global.get $assembly/index/STARTING_SAT
    call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#getValue<u64>
    local.tee $2
    local.get $11
    local.get $3
    i64.sub
    local.tee $3
    i64.ge_u
    if (result i64)
     local.get $3
    else
     local.get $2
    end
    call $~lib/array/Array<u64>#__set
    local.get $5
    i32.const 1
    i32.add
    local.set $5
    br $for-loop|02
   end
  end
  local.get $4
  local.get $6
  call $assembly/index/SatRanges#constructor
 )
 (func $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/witness/WitnessPart>#slice (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  local.get $0
  i32.load offset=12
  local.tee $3
  i32.const 0
  local.get $3
  i32.const 0
  i32.le_s
  select
  local.set $4
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
  local.get $4
  i32.sub
  local.tee $1
  i32.const 0
  local.get $1
  i32.const 0
  i32.gt_s
  select
  local.tee $3
  i32.const 21
  call $~lib/rt/__newArray
  local.tee $1
  i32.load offset=4
  local.set $5
  local.get $0
  i32.load offset=4
  local.get $4
  i32.const 2
  i32.shl
  i32.add
  local.set $0
  local.get $3
  i32.const 2
  i32.shl
  local.set $3
  loop $while-continue|0
   local.get $2
   local.get $3
   i32.lt_u
   if
    local.get $2
    local.get $5
    i32.add
    local.get $0
    local.get $2
    i32.add
    i32.load
    i32.store
    local.get $2
    i32.const 4
    i32.add
    local.set $2
    br $while-continue|0
   end
  end
  local.get $1
 )
 (func $~lib/metashrew-as/assembly/utils/utils/parsePushOp (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  local.get $0
  i32.load
  local.tee $2
  i32.load8_u
  local.set $1
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
  block $folding-inner0
   local.get $1
   i32.const 77
   i32.eq
   if
    local.get $0
    i32.load
    i32.load16_u
    local.set $1
    local.get $0
    local.get $0
    i32.load
    i32.const 2
    i32.add
    i32.store
    local.get $0
    local.get $0
    i32.load offset=4
    i32.const 2
    i32.sub
    i32.store offset=4
    br $folding-inner0
   end
   local.get $1
   i32.const 78
   i32.eq
   if
    local.get $0
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
    br $folding-inner0
   end
   local.get $1
   i32.const 79
   i32.eq
   if
    i32.const 0
    i32.const 0
    call $~lib/metashrew-as/assembly/utils/box/Box#constructor
    return
   end
   local.get $1
   i32.const 81
   i32.eq
   if
    i32.const 0
    i32.const 0
    call $~lib/metashrew-as/assembly/utils/box/Box#constructor
    return
   end
   local.get $1
   i32.const 96
   i32.le_u
   local.get $1
   i32.const 82
   i32.ge_u
   i32.and
   if
    i32.const 0
    local.get $1
    i32.const 80
    i32.sub
    call $~lib/metashrew-as/assembly/utils/box/Box#constructor
    return
   end
   local.get $1
   i32.const 75
   i32.le_u
   i32.const 0
   local.get $1
   select
   br_if $folding-inner0
   local.get $1
   i32.eqz
   if
    local.get $0
    i32.load
    local.get $0
    i32.load offset=4
    call $~lib/metashrew-as/assembly/utils/box/Box#constructor
    local.tee $0
    i32.const 0
    i32.store offset=4
    local.get $0
    return
   end
   local.get $0
   return
  end
  local.get $0
  local.get $1
  call $~lib/metashrew-as/assembly/utils/utils/parseBytes
 )
 (func $~lib/metashrew-as/assembly/utils/utils/decodeTag (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  local.get $0
  i32.load
  local.tee $2
  i32.eqz
  if
   local.get $0
   i32.load offset=4
   return
  end
  local.get $0
  i32.load offset=4
  i32.eqz
  if
   i32.const 0
   return
  end
  i32.const 4
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.set $1
  local.get $0
  i32.load offset=4
  local.get $1
  i32.const 20
  i32.sub
  i32.load offset=16
  i32.gt_u
  if
   i32.const 0
   return
  end
  local.get $1
  local.get $2
  local.get $0
  i32.load offset=4
  memory.copy
  local.get $1
  i32.load
 )
 (func $~lib/metashrew-as/assembly/blockdata/inscription/Field#constructor (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  i32.const 8
  i32.const 40
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
 (func $~lib/metashrew-as/assembly/blockdata/inscription/Inscription#constructor (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  i32.const 8
  i32.const 39
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
  local.get $5
  local.get $1
  i32.store offset=4
  local.get $0
  i32.load
  local.get $0
  i32.load offset=4
  call $~lib/metashrew-as/assembly/utils/box/Box#constructor
  local.tee $1
  i32.load
  local.tee $0
  local.get $1
  i32.load offset=4
  local.tee $6
  i32.add
  local.set $2
  loop $while-continue|0
   local.get $0
   local.get $2
   i32.const 1
   i32.sub
   i32.lt_u
   if
    block $while-break|0
     local.get $0
     i32.load8_u
     if (result i32)
      i32.const 0
     else
      local.get $0
      i32.load8_u offset=1
      i32.const 99
      i32.eq
     end
     if
      local.get $0
      i32.const 2
      i32.add
      local.set $0
      local.get $6
      i32.const 2
      i32.sub
      local.set $6
      br $while-break|0
     end
     local.get $0
     i32.const 1
     i32.add
     local.set $0
     local.get $6
     i32.const 1
     i32.sub
     local.set $6
     br $while-continue|0
    end
   end
  end
  loop $while-continue|1
   local.get $0
   local.get $2
   i32.lt_u
   if
    local.get $2
    i32.load8_u
    i32.const 104
    i32.ne
    if
     local.get $2
     i32.const 1
     i32.sub
     local.set $2
     local.get $6
     i32.const 1
     i32.sub
     local.set $6
     br $while-continue|1
    end
   end
  end
  local.get $5
  local.get $0
  local.get $6
  call $~lib/metashrew-as/assembly/utils/box/Box#constructor
  local.tee $4
  i32.load
  local.get $4
  i32.load offset=4
  call $~lib/metashrew-as/assembly/utils/box/Box#constructor
  i32.store
  block $__inlined_func$~lib/string/String.__eq$910 (result i32)
   i32.const 6688
   local.set $3
   local.get $4
   call $~lib/metashrew-as/assembly/utils/utils/parsePushOp
   local.tee $0
   i32.load offset=4
   call $~lib/arraybuffer/ArrayBuffer#constructor
   local.tee $6
   local.get $0
   i32.load
   local.get $0
   i32.load offset=4
   memory.copy
   local.get $6
   i32.const 20
   i32.sub
   i32.load offset=16
   local.tee $0
   local.get $6
   i32.add
   local.tee $7
   local.get $6
   i32.lt_u
   if
    i32.const 0
    i32.const 2656
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
   local.tee $1
   local.set $0
   loop $while-continue|00
    local.get $6
    local.get $7
    i32.lt_u
    if
     block $while-break|01
      local.get $6
      i32.load8_u
      local.set $2
      local.get $6
      i32.const 1
      i32.add
      local.set $6
      local.get $2
      i32.const 128
      i32.and
      if
       local.get $6
       local.get $7
       i32.eq
       br_if $while-break|01
       local.get $6
       i32.load8_u
       i32.const 63
       i32.and
       local.set $8
       local.get $6
       i32.const 1
       i32.add
       local.set $6
       local.get $2
       i32.const 224
       i32.and
       i32.const 192
       i32.eq
       if
        local.get $0
        local.get $2
        i32.const 31
        i32.and
        i32.const 6
        i32.shl
        local.get $8
        i32.or
        i32.store16
       else
        local.get $6
        local.get $7
        i32.eq
        br_if $while-break|01
        local.get $6
        i32.load8_u
        i32.const 63
        i32.and
        local.set $9
        local.get $6
        i32.const 1
        i32.add
        local.set $6
        local.get $2
        i32.const 240
        i32.and
        i32.const 224
        i32.eq
        if
         local.get $2
         i32.const 15
         i32.and
         i32.const 12
         i32.shl
         local.get $8
         i32.const 6
         i32.shl
         i32.or
         local.get $9
         i32.or
         local.set $2
        else
         local.get $6
         local.get $7
         i32.eq
         br_if $while-break|01
         local.get $6
         i32.load8_u
         i32.const 63
         i32.and
         local.get $2
         i32.const 7
         i32.and
         i32.const 18
         i32.shl
         local.get $8
         i32.const 12
         i32.shl
         i32.or
         local.get $9
         i32.const 6
         i32.shl
         i32.or
         i32.or
         local.set $2
         local.get $6
         i32.const 1
         i32.add
         local.set $6
        end
        local.get $2
        i32.const 65536
        i32.lt_u
        if
         local.get $0
         local.get $2
         i32.store16
        else
         local.get $0
         local.get $2
         i32.const 65536
         i32.sub
         local.tee $2
         i32.const 10
         i32.shr_u
         i32.const 55296
         i32.or
         local.get $2
         i32.const 1023
         i32.and
         i32.const 56320
         i32.or
         i32.const 16
         i32.shl
         i32.or
         i32.store
         local.get $0
         i32.const 2
         i32.add
         local.set $0
        end
       end
      else
       local.get $0
       local.get $2
       i32.store16
      end
      local.get $0
      i32.const 2
      i32.add
      local.set $0
      br $while-continue|00
     end
    end
   end
   i32.const 1
   local.get $1
   local.get $0
   local.get $1
   i32.sub
   call $~lib/rt/stub/__renew
   local.tee $2
   i32.const 6688
   i32.eq
   br_if $__inlined_func$~lib/string/String.__eq$910
   drop
   i32.const 0
   local.get $2
   i32.eqz
   br_if $__inlined_func$~lib/string/String.__eq$910
   drop
   i32.const 0
   local.get $2
   i32.const 20
   i32.sub
   i32.load offset=16
   i32.const 1
   i32.shr_u
   local.tee $0
   i32.const 6684
   i32.load
   i32.const 1
   i32.shr_u
   i32.ne
   br_if $__inlined_func$~lib/string/String.__eq$910
   drop
   i32.const 1
   local.get $2
   i32.const 7
   i32.and
   local.get $0
   i32.const 4
   i32.lt_u
   select
   i32.eqz
   if
    loop $do-loop|0
     local.get $2
     i64.load
     local.get $3
     i64.load
     i64.eq
     if
      local.get $2
      i32.const 8
      i32.add
      local.set $2
      local.get $3
      i32.const 8
      i32.add
      local.set $3
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
   block $__inlined_func$~lib/util/string/compareImpl$492
    loop $while-continue|11
     local.get $0
     local.tee $1
     i32.const 1
     i32.sub
     local.set $0
     local.get $1
     if
      local.get $2
      i32.load16_u
      local.tee $1
      local.get $3
      i32.load16_u
      local.tee $7
      i32.sub
      local.set $6
      local.get $1
      local.get $7
      i32.ne
      br_if $__inlined_func$~lib/util/string/compareImpl$492
      local.get $2
      i32.const 2
      i32.add
      local.set $2
      local.get $3
      i32.const 2
      i32.add
      local.set $3
      br $while-continue|11
     end
    end
    i32.const 0
    local.set $6
   end
   local.get $6
   i32.eqz
  end
  i32.eqz
  if
   local.get $5
   return
  end
  i32.const 16
  i32.const 30
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
  local.tee $0
  i32.const 0
  i32.const 32
  memory.fill
  local.get $1
  local.get $0
  i32.store
  local.get $1
  local.get $0
  i32.store offset=4
  local.get $1
  i32.const 32
  i32.store offset=8
  local.get $1
  i32.const 0
  i32.store offset=12
  local.get $4
  call $~lib/metashrew-as/assembly/utils/utils/parsePushOp
  local.set $0
  loop $for-loop|2
   local.get $4
   i32.load offset=4
   if
    block $for-break2
     local.get $0
     call $~lib/metashrew-as/assembly/utils/utils/decodeTag
     if (result i32)
      local.get $0
      call $~lib/metashrew-as/assembly/utils/utils/decodeTag
      i32.const 11
      i32.le_u
     else
      i32.const 0
     end
     if
      local.get $0
      call $~lib/metashrew-as/assembly/utils/utils/decodeTag
      local.set $0
      local.get $5
      i32.load offset=4
      local.set $2
      local.get $4
      call $~lib/metashrew-as/assembly/utils/utils/parsePushOp
      local.tee $3
      i32.load offset=4
      call $~lib/arraybuffer/ArrayBuffer#constructor
      local.tee $6
      local.get $3
      i32.load
      local.get $3
      i32.load offset=4
      memory.copy
      local.get $2
      local.get $0
      local.get $6
      call $~lib/metashrew-as/assembly/blockdata/inscription/Field#constructor
      call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Output>#push
      drop
     else
      local.get $0
      call $~lib/metashrew-as/assembly/utils/utils/decodeTag
      i32.eqz
      br_if $for-break2
     end
     local.get $4
     call $~lib/metashrew-as/assembly/utils/utils/parsePushOp
     local.set $0
     br $for-loop|2
    end
   end
  end
  loop $while-continue|3
   local.get $4
   i32.load offset=4
   if
    local.get $4
    call $~lib/metashrew-as/assembly/utils/utils/parsePushOp
    local.tee $0
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
    call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Output>#push
    drop
    br $while-continue|3
   end
  end
  local.get $1
  call $~lib/array/Array<~lib/arraybuffer/ArrayBuffer>#map<~lib/metashrew-as/assembly/utils/box/Box>
  call $~lib/metashrew-as/assembly/utils/box/Box.concat
  local.set $0
  local.get $5
  i32.load offset=4
  i32.const 0
  local.get $0
  call $~lib/metashrew-as/assembly/blockdata/inscription/Field#constructor
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Output>#push
  drop
  local.get $5
 )
 (func $~lib/metashrew-as/assembly/blockdata/sat/SatPoint#constructor (param $0 i32) (param $1 i64) (result i32)
  (local $2 i32)
  i32.const 12
  i32.const 42
  call $~lib/rt/stub/__new
  local.tee $2
  i64.const 0
  i64.store
  local.get $2
  i32.const 0
  i32.store offset=8
  local.get $2
  local.get $0
  i32.store offset=8
  local.get $2
  local.get $1
  i64.store
  local.get $2
 )
 (func $~lib/metashrew-as/assembly/blockdata/sat/SatPoint#toArrayBuffer (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  local.get $0
  i32.load offset=8
  local.tee $1
  i32.const 20
  i32.sub
  i32.load offset=16
  i32.const 8
  i32.add
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.tee $2
  local.get $0
  i64.load
  i64.store
  i32.const 2
  i32.const 27
  call $~lib/rt/__newArray
  local.tee $0
  i32.load offset=4
  drop
  local.get $0
  i32.const 0
  local.get $1
  local.get $1
  i32.const 20
  i32.sub
  i32.load offset=16
  call $~lib/metashrew-as/assembly/utils/box/Box#constructor
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/sat/Sat>#__set
  local.get $0
  i32.const 1
  local.get $2
  local.get $2
  i32.const 20
  i32.sub
  i32.load offset=16
  call $~lib/metashrew-as/assembly/utils/box/Box#constructor
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/sat/Sat>#__set
  local.get $0
  call $~lib/metashrew-as/assembly/utils/box/Box.concat
 )
 (func $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#selectValue<u64> (param $0 i32) (param $1 i64) (result i32)
  (local $2 i32)
  i32.const 8
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.tee $2
  local.get $1
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
  local.tee $1
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
  local.get $2
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
 )
 (func $~lib/metashrew-as/assembly/blockdata/inscription/Inscription#toArrayBuffer~anonymous|0 (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (result i32)
  i32.const 2
  i32.const 27
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
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/sat/Sat>#__set
  local.get $2
  i32.const 1
  local.get $1
  i32.load offset=4
  local.tee $0
  local.get $0
  i32.const 20
  i32.sub
  i32.load offset=16
  call $~lib/metashrew-as/assembly/utils/box/Box#constructor
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/sat/Sat>#__set
  local.get $2
  call $~lib/metashrew-as/assembly/utils/box/Box.concat
 )
 (func $assembly/index/Index.indexTransactionInscriptions (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i64)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i64)
  (local $9 i64)
  (local $10 i32)
  (local $11 i32)
  (local $12 i32)
  (local $13 i32)
  (local $14 i32)
  loop $for-loop|0
   local.get $7
   local.get $0
   i32.load offset=12
   local.tee $4
   i32.load offset=12
   i32.lt_s
   if
    block $__inlined_func$~lib/metashrew-as/assembly/blockdata/witness/Witness#tapscript$42 (result i32)
     i32.const 0
     local.get $4
     local.get $7
     call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Input>#__get
     i32.load offset=20
     local.tee $4
     i32.load offset=4
     local.tee $5
     i32.load offset=12
     local.tee $10
     i32.eqz
     br_if $__inlined_func$~lib/metashrew-as/assembly/blockdata/witness/Witness#tapscript$42
     drop
     local.get $10
     i32.const 2
     i32.ge_s
     if
      i32.const 0
      local.get $5
      local.get $10
      i32.const 1
      i32.sub
      local.tee $5
      call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Input>#__get
      i32.load8_u offset=6
      if (result i32)
       local.get $4
       i32.load offset=4
       local.get $5
       call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/witness/WitnessPart>#slice
      else
       local.get $4
       i32.load offset=4
       local.set $4
       i32.const 1
       global.set $~argumentsLength
       local.get $4
       i32.const 2147483647
       call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/witness/WitnessPart>#slice
      end
      local.tee $4
      i32.load offset=12
      local.tee $5
      i32.const 1
      i32.eq
      br_if $__inlined_func$~lib/metashrew-as/assembly/blockdata/witness/Witness#tapscript$42
      drop
      local.get $5
      i32.const 2
      i32.ge_s
      if
       i32.const 0
       local.get $4
       local.get $5
       i32.const 2
       i32.sub
       call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Input>#__get
       i32.load8_u offset=5
       i32.eqz
       br_if $__inlined_func$~lib/metashrew-as/assembly/blockdata/witness/Witness#tapscript$42
       drop
       i32.const 0
       local.get $4
       local.get $5
       i32.const 1
       i32.sub
       call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Input>#__get
       i32.load
       local.tee $10
       i32.load offset=4
       i32.const 33
       i32.lt_u
       if (result i32)
        i32.const 1
       else
        local.get $10
        i32.load offset=4
        i32.const 33
        i32.sub
        i32.const 31
        i32.and
       end
       br_if $__inlined_func$~lib/metashrew-as/assembly/blockdata/witness/Witness#tapscript$42
       drop
       local.get $4
       local.get $5
       i32.const 2
       i32.sub
       call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Input>#__get
       i32.load
       local.tee $4
       i32.load
       local.get $4
       i32.load offset=4
       call $~lib/metashrew-as/assembly/utils/box/Box#constructor
       br $__inlined_func$~lib/metashrew-as/assembly/blockdata/witness/Witness#tapscript$42
      end
     end
     i32.const 0
    end
    local.tee $4
    if (result i32)
     local.get $4
     call $~lib/metashrew-as/assembly/blockdata/inscription/Inscription#constructor
    else
     i32.const 0
    end
    local.tee $4
    if
     global.get $assembly/index/NEXT_SEQUENCE_NUMBER
     call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#getValue<u64>
     local.set $8
     local.get $1
     local.get $6
     call $~lib/metashrew-as/assembly/blockdata/transaction/OutPoint.from
     i32.load
     local.tee $5
     i32.load offset=4
     call $~lib/arraybuffer/ArrayBuffer#constructor
     local.tee $10
     local.get $5
     i32.load
     local.get $5
     i32.load offset=4
     memory.copy
     local.get $10
     local.get $3
     call $~lib/metashrew-as/assembly/blockdata/sat/SatPoint#constructor
     call $~lib/metashrew-as/assembly/blockdata/sat/SatPoint#toArrayBuffer
     local.set $5
     local.get $3
     i64.const 1
     i64.add
     local.tee $3
     local.get $0
     i32.load offset=16
     local.get $6
     call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Input>#__get
     i64.load offset=8
     i64.ge_u
     if
      local.get $6
      i32.const 1
      i32.add
      local.set $6
      i64.const 0
      local.set $3
     end
     global.get $assembly/index/OUTPOINT_TO_SAT
     local.set $11
     i32.const 4816
     i32.const 0
     call $~lib/util/number/utoa32
     call $~lib/string/String.__concat
     local.set $12
     i32.const 1
     global.set $~argumentsLength
     local.get $11
     local.get $12
     call $~lib/string/String.UTF8.encode@varargs
     call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
     call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#getValue<u64>
     local.set $9
     i32.const 2
     i32.const 27
     call $~lib/rt/__newArray
     local.tee $11
     i32.load offset=4
     drop
     local.get $11
     i32.const 0
     local.get $5
     local.get $5
     i32.const 20
     i32.sub
     i32.load offset=16
     call $~lib/metashrew-as/assembly/utils/box/Box#constructor
     call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/sat/Sat>#__set
     i32.const 4
     call $~lib/arraybuffer/ArrayBuffer#constructor
     local.tee $12
     i32.const 0
     i32.store
     local.get $11
     i32.const 1
     local.get $12
     local.get $12
     i32.const 20
     i32.sub
     i32.load offset=16
     call $~lib/metashrew-as/assembly/utils/box/Box#constructor
     call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/sat/Sat>#__set
     local.get $11
     call $~lib/metashrew-as/assembly/utils/box/Box.concat
     local.set $11
     global.get $assembly/index/SATPOINT_TO_SAT
     local.get $5
     call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
     local.set $12
     i32.const 8
     call $~lib/arraybuffer/ArrayBuffer#constructor
     local.tee $13
     local.get $9
     i64.store
     local.get $12
     local.get $13
     call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#set
     global.get $assembly/index/SATPOINT_TO_INSCRIPTION_ID
     local.get $5
     call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
     local.get $11
     call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#set
     global.get $assembly/index/INSCRIPTION_ID_TO_SATPOINT
     local.get $11
     call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
     local.get $5
     call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#set
     global.get $assembly/index/INSCRIPTION_ID_TO_BLOCKHEIGHT
     local.get $11
     call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
     local.set $5
     i32.const 4
     call $~lib/arraybuffer/ArrayBuffer#constructor
     local.tee $12
     local.get $2
     i32.store
     local.get $5
     local.get $12
     call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#set
     global.get $assembly/index/HEIGHT_TO_INSCRIPTION_IDS
     local.get $2
     call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#selectValue<u32>
     call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#extend
     local.get $11
     call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#set
     global.get $assembly/index/SEQUENCE_NUMBER_TO_INSCRIPTION_ID
     local.get $8
     call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#selectValue<u64>
     local.get $11
     call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#set
     global.get $assembly/index/INSCRIPTION_ID_TO_SEQUENCE_NUMBER
     local.get $11
     call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
     local.set $5
     i32.const 8
     call $~lib/arraybuffer/ArrayBuffer#constructor
     local.tee $12
     local.get $8
     i64.store
     local.get $5
     local.get $12
     call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#set
     global.get $assembly/index/INSCRIPTION_ID_TO_INSCRIPTION
     local.get $11
     call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
     local.set $11
     local.get $4
     i32.load offset=4
     local.set $12
     i32.const 0
     call $~lib/arraybuffer/ArrayBuffer#constructor
     local.set $5
     i32.const 0
     local.set $4
     local.get $12
     i32.load offset=12
     local.set $13
     loop $for-loop|00
      local.get $4
      local.get $13
      local.get $12
      i32.load offset=12
      local.tee $14
      local.get $13
      local.get $14
      i32.lt_s
      select
      i32.lt_s
      if
       local.get $12
       i32.load offset=4
       local.get $4
       i32.const 2
       i32.shl
       i32.add
       i32.load
       local.set $14
       i32.const 4
       global.set $~argumentsLength
       local.get $5
       local.get $14
       local.get $4
       local.get $12
       i32.const 6720
       i32.load
       call_indirect (type $2)
       local.set $5
       local.get $4
       i32.const 1
       i32.add
       local.set $4
       br $for-loop|00
      end
     end
     local.get $11
     local.get $5
     call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#set
     global.get $assembly/index/OUTPOINT_TO_SEQUENCE_NUMBERS
     local.get $10
     call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
     call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#extend
     local.set $4
     i32.const 8
     call $~lib/arraybuffer/ArrayBuffer#constructor
     local.tee $5
     local.get $8
     i64.store
     local.get $4
     local.get $5
     call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#set
    else
     local.get $0
     i32.load offset=12
     local.get $7
     call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Input>#__get
     call $~lib/metashrew-as/assembly/blockdata/transaction/Input#previousOutput
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
     global.get $assembly/index/OUTPOINT_TO_SEQUENCE_NUMBERS
     local.get $5
     call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
     call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#getListValues<u64>
     local.set $5
     i32.const 0
     local.set $4
     loop $for-loop|1
      local.get $4
      local.get $5
      i32.load offset=12
      i32.lt_s
      if
       global.get $assembly/index/SEQUENCE_NUMBER_TO_INSCRIPTION_ID
       local.get $5
       local.get $4
       call $~lib/array/Array<u64>#__get
       call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#selectValue<u64>
       call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#get
       local.set $10
       local.get $1
       local.get $6
       call $~lib/metashrew-as/assembly/blockdata/transaction/OutPoint.from
       i32.load
       local.tee $11
       i32.load offset=4
       call $~lib/arraybuffer/ArrayBuffer#constructor
       local.tee $12
       local.get $11
       i32.load
       local.get $11
       i32.load offset=4
       memory.copy
       local.get $12
       local.get $3
       call $~lib/metashrew-as/assembly/blockdata/sat/SatPoint#constructor
       call $~lib/metashrew-as/assembly/blockdata/sat/SatPoint#toArrayBuffer
       local.set $11
       global.get $assembly/index/SATPOINT_TO_INSCRIPTION_ID
       local.get $11
       call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
       local.get $10
       call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#set
       global.get $assembly/index/INSCRIPTION_ID_TO_SATPOINT
       local.get $10
       call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
       local.get $11
       call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#set
       local.get $3
       i64.const 1
       i64.add
       local.tee $3
       local.get $0
       i32.load offset=16
       local.get $6
       call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Input>#__get
       i64.load offset=8
       i64.ge_u
       if
        local.get $6
        i32.const 1
        i32.add
        local.set $6
        i64.const 0
        local.set $3
       end
       local.get $4
       i32.const 1
       i32.add
       local.set $4
       br $for-loop|1
      end
     end
    end
    local.get $7
    i32.const 1
    i32.add
    local.set $7
    br $for-loop|0
   end
  end
 )
 (func $assembly/index/Index.indexBlock (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i64)
  (local $5 i64)
  (local $6 i64)
  (local $7 i64)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (local $12 i32)
  global.get $assembly/index/HEIGHT_TO_BLOCKHASH
  local.get $0
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#selectValue<u32>
  local.get $1
  call $~lib/metashrew-as/assembly/blockdata/block/Block#blockhash
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#set
  global.get $assembly/index/BLOCKHASH_TO_HEIGHT
  local.get $1
  call $~lib/metashrew-as/assembly/blockdata/block/Block#blockhash
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
  local.set $2
  i32.const 4
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.tee $8
  local.get $0
  i32.store
  local.get $2
  local.get $8
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#set
  loop $for-loop|0
   local.get $3
   local.get $1
   i32.load offset=8
   local.tee $8
   i32.load offset=12
   i32.lt_s
   if
    i32.const 0
    local.set $2
    local.get $8
    local.get $3
    call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Input>#__get
    local.tee $8
    call $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#txid
    local.set $9
    loop $for-loop|00
     local.get $2
     local.get $8
     i32.load offset=16
     i32.load offset=12
     i32.lt_s
     if
      global.get $assembly/index/OUTPOINT_TO_VALUE
      local.set $10
      local.get $9
      local.get $2
      call $~lib/metashrew-as/assembly/blockdata/transaction/OutPoint.from
      i32.load
      local.tee $11
      i32.load offset=4
      call $~lib/arraybuffer/ArrayBuffer#constructor
      local.tee $12
      local.get $11
      i32.load
      local.get $11
      i32.load offset=4
      memory.copy
      local.get $10
      local.get $12
      call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
      local.set $10
      local.get $8
      i32.load offset=16
      local.get $2
      call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Input>#__get
      i64.load offset=8
      local.set $4
      i32.const 8
      call $~lib/arraybuffer/ArrayBuffer#constructor
      local.tee $11
      local.get $4
      i64.store
      local.get $10
      local.get $11
      call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#set
      local.get $2
      i32.const 1
      i32.add
      local.set $2
      br $for-loop|00
     end
    end
    local.get $3
    i32.const 1
    i32.add
    local.set $3
    br $for-loop|0
   end
  end
  local.get $1
  i32.load offset=8
  i32.const 0
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Input>#__get
  local.set $8
  global.get $assembly/index/STARTING_SAT
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#getValue<u64>
  local.set $5
  local.get $8
  call $assembly/index/Index.totalOutputs
  local.set $7
  i32.const 1
  local.set $2
  loop $for-loop|01
   local.get $2
   local.get $1
   i32.load offset=8
   local.tee $3
   i32.load offset=12
   i32.lt_s
   if
    local.get $3
    local.get $2
    call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Input>#__get
    local.set $9
    i64.const 0
    local.set $4
    i32.const 0
    local.set $3
    loop $for-loop|003
     local.get $3
     local.get $9
     i32.load offset=12
     local.tee $10
     i32.load offset=12
     i32.lt_s
     if
      global.get $assembly/index/OUTPOINT_TO_VALUE
      local.set $11
      local.get $10
      local.get $3
      call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Input>#__get
      call $~lib/metashrew-as/assembly/blockdata/transaction/Input#previousOutput
      i32.load
      local.tee $10
      i32.load offset=4
      call $~lib/arraybuffer/ArrayBuffer#constructor
      local.tee $12
      local.get $10
      i32.load
      local.get $10
      i32.load offset=4
      memory.copy
      local.get $11
      local.get $12
      call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#select
      call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#getValue<u64>
      local.get $4
      i64.add
      local.set $4
      local.get $3
      i32.const 1
      i32.add
      local.set $3
      br $for-loop|003
     end
    end
    local.get $6
    local.get $4
    local.get $9
    call $assembly/index/Index.totalOutputs
    i64.sub
    i64.add
    local.set $6
    local.get $2
    i32.const 1
    i32.add
    local.set $2
    br $for-loop|01
   end
  end
  global.get $assembly/index/STARTING_SAT
  local.set $2
  i32.const 8
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.tee $3
  local.get $7
  local.get $6
  i64.sub
  local.tee $4
  local.get $5
  i64.add
  i64.store
  local.get $2
  local.get $3
  call $~lib/metashrew-as/assembly/indexer/tables/IndexPointer#set
  i32.const 1
  call $~lib/array/Array<u64>#constructor
  local.tee $2
  i32.const 0
  local.get $5
  call $~lib/array/Array<u64>#__set
  i32.const 1
  call $~lib/array/Array<u64>#constructor
  local.tee $3
  i32.const 0
  local.get $4
  call $~lib/array/Array<u64>#__set
  local.get $2
  local.get $3
  call $assembly/index/SatRanges#constructor
  call $assembly/index/SatSource#constructor
  local.set $2
  local.get $8
  call $assembly/index/SatSink#constructor
  local.tee $3
  local.get $2
  call $assembly/index/SatSink#consume
  i32.const 1
  local.set $2
  loop $for-loop|016
   local.get $2
   local.get $1
   i32.load offset=8
   local.tee $8
   i32.load offset=12
   i32.lt_s
   if
    local.get $8
    local.get $2
    call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Input>#__get
    local.tee $8
    call $assembly/index/SatSink#constructor
    local.get $8
    i32.load offset=12
    call $assembly/index/SatRanges.fromInputs
    call $assembly/index/SatSource#constructor
    local.tee $9
    call $assembly/index/SatSink#consume
    local.get $8
    call $~lib/metashrew-as/assembly/blockdata/transaction/Transaction#txid
    local.set $10
    local.get $9
    call $assembly/index/SatSource#consumed
    i32.eqz
    if
     local.get $3
     local.get $9
     call $assembly/index/SatSink#consume
    end
    local.get $8
    local.get $10
    local.get $0
    call $assembly/index/Index.indexTransactionInscriptions
    local.get $2
    i32.const 1
    i32.add
    local.set $2
    br $for-loop|016
   end
  end
 )
 (func $~lib/metashrew-as/assembly/utils/rlp/RLPItem#constructor (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  i32.const 8
  i32.const 44
  call $~lib/rt/stub/__new
  local.tee $2
  i32.const 0
  i32.store
  local.get $2
  i32.const 0
  i32.store offset=4
  local.get $2
  local.get $0
  i32.store offset=4
  local.get $2
  local.get $1
  i32.store
  local.get $2
 )
 (func $~lib/metashrew-as/assembly/indexer/index/_flush~anonymous|0 (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (result i32)
  local.get $0
  global.get $~lib/metashrew-as/assembly/indexer/index/_updateKeys
  local.get $1
  call $"~lib/map/Map<u32,~lib/arraybuffer/ArrayBuffer>#get"
  i32.const 1
  call $~lib/metashrew-as/assembly/utils/rlp/RLPItem#constructor
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Output>#push
  drop
  local.get $0
  global.get $~lib/metashrew-as/assembly/indexer/index/_updates
  local.get $1
  call $"~lib/map/Map<u32,~lib/arraybuffer/ArrayBuffer>#get"
  i32.const 1
  call $~lib/metashrew-as/assembly/utils/rlp/RLPItem#constructor
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Output>#push
  drop
  local.get $0
 )
 (func $~lib/metashrew-as/assembly/utils/rlp/toRLP~anonymous|0 (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  local.get $0
  call $~lib/metashrew-as/assembly/utils/rlp/toRLP
 )
 (func $~lib/metashrew-as/assembly/utils/rlp/toRLP~anonymous|1 (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (result i32)
  local.get $0
  local.get $1
  i32.const 20
  i32.sub
  i32.load offset=16
  i32.add
 )
 (func $~lib/metashrew-as/assembly/utils/rlp/toRLP~anonymous|2 (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (result i32)
  local.get $0
  local.get $1
  local.get $1
  i32.const 20
  i32.sub
  i32.load offset=16
  memory.copy
  local.get $0
  local.get $1
  i32.const 20
  i32.sub
  i32.load offset=16
  i32.add
 )
 (func $~lib/metashrew-as/assembly/utils/rlp/toRLP (param $0 i32) (result i32)
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
  i32.load
  i32.const 3
  i32.eq
  if
   local.get $0
   i32.load offset=4
   local.tee $5
   i32.load offset=12
   local.tee $8
   i32.const 30
   call $~lib/rt/__newArray
   local.tee $6
   i32.load offset=4
   local.set $0
   loop $for-loop|0
    local.get $2
    local.get $8
    local.get $5
    i32.load offset=12
    local.tee $7
    local.get $7
    local.get $8
    i32.gt_s
    select
    i32.lt_s
    if
     local.get $2
     i32.const 2
     i32.shl
     local.tee $7
     local.get $5
     i32.load offset=4
     i32.add
     i32.load
     local.set $9
     i32.const 3
     global.set $~argumentsLength
     local.get $0
     local.get $7
     i32.add
     local.get $9
     local.get $2
     local.get $5
     i32.const 6784
     i32.load
     call_indirect (type $4)
     i32.store
     local.get $2
     i32.const 1
     i32.add
     local.set $2
     br $for-loop|0
    end
   end
   local.get $6
   i32.load offset=12
   local.set $0
   loop $for-loop|00
    local.get $3
    local.get $0
    local.get $6
    i32.load offset=12
    local.tee $2
    local.get $0
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
     i32.const 4
     global.set $~argumentsLength
     local.get $1
     local.get $2
     local.get $3
     local.get $6
     i32.const 6816
     i32.load
     call_indirect (type $2)
     local.set $1
     local.get $3
     i32.const 1
     i32.add
     local.set $3
     br $for-loop|00
    end
   end
   local.get $1
   i32.const 55
   i32.le_s
   if
    local.get $1
    i32.const 1
    i32.add
    call $~lib/arraybuffer/ArrayBuffer#constructor
    local.tee $0
    local.get $1
    i32.const 192
    i32.add
    i32.store8
    local.get $0
    i32.const 1
    i32.add
    local.set $1
    local.get $6
    i32.load offset=12
    local.set $2
    loop $for-loop|01
     local.get $4
     local.get $2
     local.get $6
     i32.load offset=12
     local.tee $3
     local.get $2
     local.get $3
     i32.lt_s
     select
     i32.lt_s
     if
      local.get $6
      i32.load offset=4
      local.get $4
      i32.const 2
      i32.shl
      i32.add
      i32.load
      local.set $3
      i32.const 4
      global.set $~argumentsLength
      local.get $1
      local.get $3
      local.get $4
      local.get $6
      i32.const 6848
      i32.load
      call_indirect (type $2)
      local.set $1
      local.get $4
      i32.const 1
      i32.add
      local.set $4
      br $for-loop|01
     end
    end
   else
    block $__inlined_func$~lib/metashrew-as/assembly/utils/rlp/byteLengthForLength$591 (result i32)
     i32.const 4
     local.get $1
     i32.const 24
     i32.shr_s
     br_if $__inlined_func$~lib/metashrew-as/assembly/utils/rlp/byteLengthForLength$591
     drop
     i32.const 3
     local.get $1
     i32.const 16
     i32.shr_s
     br_if $__inlined_func$~lib/metashrew-as/assembly/utils/rlp/byteLengthForLength$591
     drop
     i32.const 2
     local.get $1
     i32.const 8
     i32.shr_s
     br_if $__inlined_func$~lib/metashrew-as/assembly/utils/rlp/byteLengthForLength$591
     drop
     i32.const 1
    end
    local.tee $2
    local.get $1
    i32.add
    i32.const 1
    i32.add
    call $~lib/arraybuffer/ArrayBuffer#constructor
    local.tee $0
    local.get $2
    i32.const 247
    i32.add
    i32.store8
    local.get $2
    i32.const 1
    i32.eq
    if
     local.get $0
     local.get $1
     i32.store8 offset=1
    else
     local.get $2
     i32.const 2
     i32.eq
     if
      local.get $0
      local.get $1
      i32.const 65280
      i32.and
      i32.const 8
      i32.shr_u
      i32.store8 offset=1
      local.get $0
      local.get $1
      i32.store8 offset=2
     else
      local.get $2
      i32.const 3
      i32.eq
      if
       local.get $0
       local.get $1
       i32.const 16711680
       i32.and
       i32.const 16
       i32.shr_u
       i32.store8 offset=1
       local.get $0
       local.get $1
       i32.const 65280
       i32.and
       i32.const 8
       i32.shr_u
       i32.store8 offset=2
       local.get $0
       local.get $1
       i32.store8 offset=3
      else
       local.get $2
       i32.const 4
       i32.eq
       if
        local.get $0
        local.get $1
        i32.const -16777216
        i32.and
        i32.const 24
        i32.shr_s
        i32.store8 offset=1
        local.get $0
        local.get $1
        i32.const 16711680
        i32.and
        i32.const 16
        i32.shr_u
        i32.store8 offset=2
        local.get $0
        local.get $1
        i32.const 65280
        i32.and
        i32.const 8
        i32.shr_u
        i32.store8 offset=3
        local.get $0
        local.get $1
        i32.store8 offset=4
       end
      end
     end
    end
    local.get $0
    i32.const 1
    i32.add
    local.get $2
    i32.add
    local.set $1
    local.get $6
    i32.load offset=12
    local.set $2
    loop $for-loop|02
     local.get $4
     local.get $2
     local.get $6
     i32.load offset=12
     local.tee $3
     local.get $2
     local.get $3
     i32.lt_s
     select
     i32.lt_s
     if
      local.get $6
      i32.load offset=4
      local.get $4
      i32.const 2
      i32.shl
      i32.add
      i32.load
      local.set $3
      i32.const 4
      global.set $~argumentsLength
      local.get $1
      local.get $3
      local.get $4
      local.get $6
      i32.const 6880
      i32.load
      call_indirect (type $2)
      local.set $1
      local.get $4
      i32.const 1
      i32.add
      local.set $4
      br $for-loop|02
     end
    end
   end
  else
   local.get $0
   i32.load
   i32.const 1
   i32.eq
   if (result i32)
    local.get $0
    i32.load offset=4
    local.tee $2
    i32.const 20
    i32.sub
    i32.load offset=16
   else
    local.get $0
    i32.load
    i32.const 2
    i32.eq
    if (result i32)
     local.get $0
     i32.load offset=4
     local.tee $0
     i32.load
     local.set $2
     local.get $0
     i32.load offset=4
    else
     i32.const 0
    end
   end
   local.tee $1
   i32.const 1
   i32.eq
   if
    local.get $2
    i32.load8_u
    local.tee $0
    i32.const 127
    i32.le_u
    if
     i32.const 1
     call $~lib/arraybuffer/ArrayBuffer#constructor
     local.tee $1
     local.get $0
     i32.store8
     local.get $1
     return
    end
   end
   local.get $1
   i32.const 55
   i32.le_s
   local.get $1
   i32.const 0
   i32.ge_s
   i32.and
   if
    local.get $1
    i32.const 1
    i32.add
    call $~lib/arraybuffer/ArrayBuffer#constructor
    local.tee $0
    local.get $1
    i32.const 128
    i32.add
    i32.store8
    local.get $0
    i32.const 1
    i32.add
    local.get $2
    local.get $1
    memory.copy
   else
    local.get $1
    block $__inlined_func$~lib/metashrew-as/assembly/utils/rlp/byteLengthForLength$597 (result i32)
     i32.const 4
     local.get $1
     i32.const 24
     i32.shr_s
     br_if $__inlined_func$~lib/metashrew-as/assembly/utils/rlp/byteLengthForLength$597
     drop
     i32.const 3
     local.get $1
     i32.const 16
     i32.shr_s
     br_if $__inlined_func$~lib/metashrew-as/assembly/utils/rlp/byteLengthForLength$597
     drop
     i32.const 2
     local.get $1
     i32.const 8
     i32.shr_s
     br_if $__inlined_func$~lib/metashrew-as/assembly/utils/rlp/byteLengthForLength$597
     drop
     i32.const 1
    end
    local.tee $3
    i32.add
    i32.const 1
    i32.add
    call $~lib/arraybuffer/ArrayBuffer#constructor
    local.tee $0
    local.get $3
    i32.const 183
    i32.add
    i32.store8
    local.get $3
    i32.const 1
    i32.eq
    if
     local.get $0
     local.get $1
     i32.store8 offset=1
    else
     local.get $3
     i32.const 2
     i32.eq
     if
      local.get $0
      local.get $1
      i32.const 65280
      i32.and
      i32.const 8
      i32.shr_u
      i32.store8 offset=1
      local.get $0
      local.get $1
      i32.store8 offset=2
     else
      local.get $3
      i32.const 3
      i32.eq
      if
       local.get $0
       local.get $1
       i32.const 16711680
       i32.and
       i32.const 16
       i32.shr_u
       i32.store8 offset=1
       local.get $0
       local.get $1
       i32.const 65280
       i32.and
       i32.const 8
       i32.shr_u
       i32.store8 offset=2
       local.get $0
       local.get $1
       i32.store8 offset=3
      else
       local.get $3
       i32.const 4
       i32.eq
       if
        local.get $0
        local.get $1
        i32.const -16777216
        i32.and
        i32.const 24
        i32.shr_s
        i32.store8 offset=1
        local.get $0
        local.get $1
        i32.const 16711680
        i32.and
        i32.const 16
        i32.shr_u
        i32.store8 offset=2
        local.get $0
        local.get $1
        i32.const 65280
        i32.and
        i32.const 8
        i32.shr_u
        i32.store8 offset=3
        local.get $0
        local.get $1
        i32.store8 offset=4
       end
      end
     end
    end
    local.get $0
    i32.const 1
    i32.add
    local.get $3
    i32.add
    local.get $2
    local.get $1
    memory.copy
   end
  end
  local.get $0
 )
 (func $~lib/metashrew-as/assembly/indexer/index/_flush
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  global.get $~lib/metashrew-as/assembly/indexer/index/_updates
  local.tee $0
  i32.load offset=8
  local.set $5
  local.get $0
  i32.load offset=16
  local.set $2
  i32.const 16
  i32.const 7
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
  local.get $2
  i32.const 268435455
  i32.gt_u
  if
   i32.const 1728
   i32.const 3264
   i32.const 70
   i32.const 60
   call $~lib/builtins/abort
   unreachable
  end
  i32.const 8
  local.get $2
  local.get $2
  i32.const 8
  i32.le_u
  select
  i32.const 2
  i32.shl
  local.tee $0
  i32.const 1
  call $~lib/rt/stub/__new
  local.tee $6
  i32.const 0
  local.get $0
  memory.fill
  local.get $3
  local.get $6
  i32.store
  local.get $3
  local.get $6
  i32.store offset=4
  local.get $3
  local.get $0
  i32.store offset=8
  local.get $3
  local.get $2
  i32.store offset=12
  loop $for-loop|0
   local.get $2
   local.get $4
   i32.gt_s
   if
    local.get $5
    local.get $4
    i32.const 12
    i32.mul
    i32.add
    local.tee $0
    i32.load offset=8
    i32.const 1
    i32.and
    i32.eqz
    if
     local.get $0
     i32.load
     local.set $6
     local.get $1
     local.tee $0
     i32.const 1
     i32.add
     local.set $1
     local.get $0
     local.get $3
     i32.load offset=12
     i32.ge_u
     if
      local.get $0
      i32.const 0
      i32.lt_s
      if
       i32.const 3136
       i32.const 3264
       i32.const 130
       i32.const 22
       call $~lib/builtins/abort
       unreachable
      end
      local.get $3
      local.get $0
      i32.const 1
      i32.add
      local.tee $7
      i32.const 2
      i32.const 1
      call $~lib/array/ensureCapacity
      local.get $3
      local.get $7
      i32.store offset=12
     end
     local.get $3
     i32.load offset=4
     local.get $0
     i32.const 2
     i32.shl
     i32.add
     local.get $6
     i32.store
    end
    local.get $4
    i32.const 1
    i32.add
    local.set $4
    br $for-loop|0
   end
  end
  local.get $3
  local.get $1
  i32.const 2
  i32.const 0
  call $~lib/array/ensureCapacity
  local.get $3
  local.get $1
  i32.store offset=12
  i32.const 16
  i32.const 45
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
  local.tee $0
  i32.const 0
  i32.const 32
  memory.fill
  local.get $2
  local.get $0
  i32.store
  local.get $2
  local.get $0
  i32.store offset=4
  local.get $2
  i32.const 32
  i32.store offset=8
  local.get $2
  i32.const 0
  i32.store offset=12
  local.get $2
  local.set $0
  i32.const 0
  local.set $1
  local.get $3
  i32.load offset=12
  local.set $4
  loop $for-loop|00
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
    i32.const 4
    global.set $~argumentsLength
    local.get $0
    local.get $5
    local.get $1
    local.get $3
    i32.const 6752
    i32.load
    call_indirect (type $2)
    local.set $0
    local.get $1
    i32.const 1
    i32.add
    local.set $1
    br $for-loop|00
   end
  end
  local.get $2
  i32.const 3
  call $~lib/metashrew-as/assembly/utils/rlp/RLPItem#constructor
  call $~lib/metashrew-as/assembly/utils/rlp/toRLP
  call $~lib/metashrew-as/assembly/indexer/index/__flush
 )
 (func $assembly/index/_start
  (local $0 i32)
  (local $1 i32)
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
  i32.load
  local.set $1
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
  local.get $0
  call $~lib/metashrew-as/assembly/blockdata/block/Block#constructor
  call $assembly/index/Index.indexBlock
  call $~lib/metashrew-as/assembly/indexer/index/_flush
 )
 (func $~lib/metashrew-as/assembly/blockdata/sat/Sat#epoch (param $0 i32) (result i32)
  (local $1 i32)
  loop $while-continue|0
   local.get $1
   i32.const 33
   i32.lt_s
   local.get $0
   i64.load
   global.get $~lib/metashrew-as/assembly/blockdata/epoch/Epoch.STARTING_SATS
   local.get $1
   call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Input>#__get
   i64.load
   i64.gt_u
   i32.and
   if
    local.get $1
    i32.const 1
    i32.add
    local.set $1
    br $while-continue|0
   end
  end
  i32.const 4
  i32.const 12
  call $~lib/rt/stub/__new
  local.tee $0
  i32.const 0
  i32.store
  local.get $0
  local.get $1
  i32.store
  local.get $0
 )
 (func $~lib/metashrew-as/assembly/blockdata/sat/Sat#epochPosition (param $0 i32) (result i64)
  local.get $0
  i64.load
  block $__inlined_func$~lib/metashrew-as/assembly/blockdata/epoch/Epoch#startingSat$859 (result i32)
   local.get $0
   call $~lib/metashrew-as/assembly/blockdata/sat/Sat#epoch
   local.tee $0
   i32.load
   i32.const 33
   i32.gt_u
   if
    global.get $~lib/metashrew-as/assembly/blockdata/epoch/Epoch.STARTING_SATS
    i32.const 33
    call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Input>#__get
    br $__inlined_func$~lib/metashrew-as/assembly/blockdata/epoch/Epoch#startingSat$859
   end
   global.get $~lib/metashrew-as/assembly/blockdata/epoch/Epoch.STARTING_SATS
   local.get $0
   i32.load
   call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/transaction/Input>#__get
  end
  i64.load
  i64.sub
 )
 (func $~lib/metashrew-as/assembly/blockdata/sat/Sat#height (param $0 i32) (result i32)
  (local $1 i64)
  (local $2 i32)
  (local $3 i32)
  local.get $0
  call $~lib/metashrew-as/assembly/blockdata/sat/Sat#epoch
  i32.load
  i32.const 210000
  i32.mul
  local.set $3
  i32.const 4
  i32.const 50
  call $~lib/rt/stub/__new
  local.tee $2
  i32.const 0
  i32.store
  local.get $2
  local.get $3
  i32.store
  local.get $0
  call $~lib/metashrew-as/assembly/blockdata/sat/Sat#epochPosition
  local.set $1
  local.get $0
  call $~lib/metashrew-as/assembly/blockdata/sat/Sat#epoch
  local.set $0
  local.get $2
  i32.load
  local.get $1
  local.get $0
  i32.load
  i32.const 33
  i32.gt_u
  if (result i64)
   i64.const 0
  else
   i64.const 5000000000
   local.get $0
   i64.load32_u
   i64.shr_u
  end
  i64.div_u
  i32.wrap_i64
  i32.add
  local.set $0
  i32.const 4
  i32.const 50
  call $~lib/rt/stub/__new
  local.tee $2
  i32.const 0
  i32.store
  local.get $2
  local.get $0
  i32.store
  local.get $2
 )
 (func $assembly/index/sat (result i32)
  (local $0 i32)
  (local $1 i64)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
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
  i32.const 8
  i32.const 9
  call $~lib/rt/stub/__new
  local.tee $4
  i64.const 0
  i64.store
  local.get $4
  local.get $1
  i64.store
  i32.const 7
  i32.const 45
  call $~lib/rt/__newArray
  local.tee $6
  i32.load offset=4
  drop
  local.get $6
  i32.const 0
  local.get $4
  i64.load
  i32.wrap_i64
  i32.const 4
  call $~lib/metashrew-as/assembly/utils/rlp/RLPItem#constructor
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/sat/Sat>#__set
  local.get $4
  call $~lib/metashrew-as/assembly/blockdata/sat/Sat#height
  i32.load
  call $~lib/util/number/utoa32
  i32.const 6912
  call $~lib/string/String.__concat
  local.set $3
  block $__inlined_func$~lib/util/number/utoa64$68
   local.get $4
   call $~lib/metashrew-as/assembly/blockdata/sat/Sat#epochPosition
   local.get $4
   call $~lib/metashrew-as/assembly/blockdata/sat/Sat#epoch
   local.tee $0
   i32.load
   i32.const 33
   i32.gt_u
   if (result i64)
    i64.const 0
   else
    i64.const 5000000000
    local.get $0
    i64.load32_u
    i64.shr_u
   end
   i64.rem_u
   local.tee $1
   i64.eqz
   if
    i32.const 5040
    local.set $2
    br $__inlined_func$~lib/util/number/utoa64$68
   end
   local.get $1
   i64.const 4294967295
   i64.le_u
   if
    local.get $1
    i32.wrap_i64
    local.tee $0
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
    local.tee $5
    i32.const 1
    i32.shl
    i32.const 2
    call $~lib/rt/stub/__new
    local.tee $2
    local.get $0
    local.get $5
    call $~lib/util/number/utoa32_dec_lut
   else
    local.get $1
    i64.const 1000000000000000
    i64.lt_u
    if (result i32)
     local.get $1
     i64.const 1000000000000
     i64.lt_u
     if (result i32)
      local.get $1
      i64.const 100000000000
      i64.ge_u
      i32.const 10
      i32.add
      local.get $1
      i64.const 10000000000
      i64.ge_u
      i32.add
     else
      local.get $1
      i64.const 100000000000000
      i64.ge_u
      i32.const 13
      i32.add
      local.get $1
      i64.const 10000000000000
      i64.ge_u
      i32.add
     end
    else
     local.get $1
     i64.const 100000000000000000
     i64.lt_u
     if (result i32)
      local.get $1
      i64.const 10000000000000000
      i64.ge_u
      i32.const 16
      i32.add
     else
      local.get $1
      i64.const -8446744073709551616
      i64.ge_u
      i32.const 18
      i32.add
      local.get $1
      i64.const 1000000000000000000
      i64.ge_u
      i32.add
     end
    end
    local.tee $0
    i32.const 1
    i32.shl
    i32.const 2
    call $~lib/rt/stub/__new
    local.set $2
    loop $while-continue|0
     local.get $1
     i64.const 100000000
     i64.ge_u
     if
      local.get $2
      local.get $0
      i32.const 4
      i32.sub
      local.tee $0
      i32.const 1
      i32.shl
      i32.add
      local.get $1
      local.get $1
      i64.const 100000000
      i64.div_u
      local.tee $1
      i64.const 100000000
      i64.mul
      i64.sub
      i32.wrap_i64
      local.tee $5
      i32.const 10000
      i32.rem_u
      local.tee $7
      i32.const 100
      i32.div_u
      i32.const 2
      i32.shl
      i32.const 5052
      i32.add
      i64.load32_u
      local.get $7
      i32.const 100
      i32.rem_u
      i32.const 2
      i32.shl
      i32.const 5052
      i32.add
      i64.load32_u
      i64.const 32
      i64.shl
      i64.or
      i64.store
      local.get $2
      local.get $0
      i32.const 4
      i32.sub
      local.tee $0
      i32.const 1
      i32.shl
      i32.add
      local.get $5
      i32.const 10000
      i32.div_u
      local.tee $5
      i32.const 100
      i32.div_u
      i32.const 2
      i32.shl
      i32.const 5052
      i32.add
      i64.load32_u
      local.get $5
      i32.const 100
      i32.rem_u
      i32.const 2
      i32.shl
      i32.const 5052
      i32.add
      i64.load32_u
      i64.const 32
      i64.shl
      i64.or
      i64.store
      br $while-continue|0
     end
    end
    local.get $2
    local.get $1
    i32.wrap_i64
    local.get $0
    call $~lib/util/number/utoa32_dec_lut
   end
  end
  local.get $3
  local.get $2
  call $~lib/string/String.__concat
  local.set $0
  i32.const 1
  global.set $~argumentsLength
  local.get $6
  i32.const 1
  local.get $0
  call $~lib/string/String.UTF8.encode@varargs
  i32.const 1
  call $~lib/metashrew-as/assembly/utils/rlp/RLPItem#constructor
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/sat/Sat>#__set
  local.get $6
  i32.const 2
  local.get $4
  call $~lib/metashrew-as/assembly/blockdata/sat/Sat#height
  i32.load
  i32.const 4
  call $~lib/metashrew-as/assembly/utils/rlp/RLPItem#constructor
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/sat/Sat>#__set
  local.get $6
  i32.const 3
  local.get $4
  call $~lib/metashrew-as/assembly/blockdata/sat/Sat#epoch
  i32.load
  i32.const 6
  i32.div_u
  i32.const 4
  call $~lib/metashrew-as/assembly/utils/rlp/RLPItem#constructor
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/sat/Sat>#__set
  local.get $6
  i32.const 4
  local.get $4
  call $~lib/metashrew-as/assembly/blockdata/sat/Sat#epoch
  i32.load
  i32.const 4
  call $~lib/metashrew-as/assembly/utils/rlp/RLPItem#constructor
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/sat/Sat>#__set
  local.get $6
  i32.const 5
  local.get $4
  call $~lib/metashrew-as/assembly/blockdata/sat/Sat#height
  i32.load
  i32.const 2016
  i32.div_u
  i32.const 4
  call $~lib/metashrew-as/assembly/utils/rlp/RLPItem#constructor
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/sat/Sat>#__set
  local.get $6
  i32.const 6
  local.get $4
  call $~lib/metashrew-as/assembly/blockdata/sat/Sat#epochPosition
  local.get $4
  call $~lib/metashrew-as/assembly/blockdata/sat/Sat#epoch
  local.tee $0
  i32.load
  i32.const 33
  i32.gt_u
  if (result i64)
   i64.const 0
  else
   i64.const 5000000000
   local.get $0
   i64.load32_u
   i64.shr_u
  end
  i64.rem_u
  i32.wrap_i64
  i32.const 4
  call $~lib/metashrew-as/assembly/utils/rlp/RLPItem#constructor
  call $~lib/array/Array<~lib/metashrew-as/assembly/blockdata/sat/Sat>#__set
  local.get $6
  i32.const 3
  call $~lib/metashrew-as/assembly/utils/rlp/RLPItem#constructor
  call $~lib/metashrew-as/assembly/utils/rlp/toRLP
 )
 (func $assembly/index/inscription (result i32)
  (local $0 i32)
  call $~lib/metashrew-as/assembly/indexer/index/__host_len
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.tee $0
  call $~lib/metashrew-as/assembly/indexer/index/__load_input
  local.get $0
 )
 (func $assembly/index/inscriptionsforblock (result i32)
  (local $0 i32)
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
  i32.load
  drop
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
  i32.const 0
  call $~lib/arraybuffer/ArrayBuffer#constructor
 )
 (func $assembly/index/output (result i32)
  (local $0 i32)
  (local $1 i32)
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
  i32.const 32
  call $~lib/metashrew-as/assembly/utils/utils/parseBytes
  drop
  local.get $1
  i32.load
  local.tee $0
  i32.load
  drop
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
  i32.const 0
  call $~lib/arraybuffer/ArrayBuffer#constructor
 )
 (func $~start
  call $start:assembly/index
 )
)
