cat <<end # krescie image script config template
# krescue image script config

#    __ _____                      
#   / //_/ _ \___ ___ ______ _____ 
#  / ,< / , _/ -_|_-</ __/ // / -_)
# /_/|_/_/|_|\__/___/\__/\_,_/\__/ 
#                                  
# krescue advanced install system  

## header block
image:		$NAME
type:		emmc
format:		kresq
args:		-comp zstd -Xcompression-level 1
builder:	hyphop
date:		$DATE
link:		http://dl.khadas.com/Firmware
label:		$LABEL
match:		$MATCH
vars:		BOARD=$BOARDS
source:		.meta
source:		README*
duration:	110
desc:		$DESC

## ask user block
ask:     store bootup logo YES or without logo NO
type:    yesno
tag:     LOGO
default: NO
desc:    press YES - khadas logo and NO - blank logo

# sub 1
sub:	1
source:	.boot

# partition 0 bootloader
block:	-
start: 0x00000000
size:  0x00400000
#end:  0x00400000
sub:	1
data:	.boot/aml_sdc_burn.UBOOT

# partition 1 reserved
block:	-
start: 0x02400000
size:  0x04000000
sub:	1
data:	@zero:8M

block:  -
start: 0x02800000
sub:	1
data:   .boot/_aml_dtb.PARTITION

block:  -
start: 0x02840000
sub:	1
data:   .boot/_aml_dtb.PARTITION

# partition 2 cache
block:	-
start: 0x06c00000
size:  0x46000000
#end:  0x4cc00000
data:	@zero:8M

## partition
part:   -
type:   noop
start: 0x06c00000
size:  0x46000000
fstype: ext4
label:	METADATA
uuid:	
args:   -m 2 -O ^64bit,^metadata_csum

# partition 3 env
block:	-
start: 0x4d400000
size:  0x00800000
end:  0x4dc00000
sub:	1
data:	@zero:128B

# partition 4 logo
block:	-
start: 0x4e400000
size:  0x00800000
#end:  0x4ec00000
sub:	1
data:	@zero:8M

# partition 4 logo
block:	-
match:	LOGO=1
start: 0x4e400000
size:  0x00800000
#end:  0x4ec00000
sub:	1
data:	.boot/logo.PARTITION

# partition 5 recovery
block:	-
start: 0x4f400000
size:  0x01800000
#end:  0x50c00000
sub:	1
data:	.boot/recovery.PARTITION

# partition 6 misc
block:	-
start: 0x51400000
size:  0x00800000
#end:  0x51c00000
data:  @zero:1M

# partition 7 dtbo
block:	-
start: 0x52400000
size:  0x00800000
#end:  0x52c00000
sub:	1
data:	.boot/dtbo.PARTITION

# partition 8 cri_data
block:	-
start: 0x53400000
size:  0x00800000
#end:  0x53c00000
data:	@zero:1M

# partition 9 param
block:	-
start: 0x54400000
size:  0x01000000
#end:  0x55400000
data:	@zero:8M

## partition
part:   -
type:   noop
start: 0x54400000
size:  0x01000000
fstype: ext4
label:	PARAM
uuid:	
args:   -m 2 -O ^64bit,^metadata_csum

# partition 10 boot
block:	-
start: 0x55c00000
size:  0x01000000
#end:  0x56c00000
sub:	1
data:	.boot/boot.PARTITION

# partition 11 rsv
block:	-
start: 0x57400000
size:  0x01000000
#end:  0x58400000
data:	@zero:1M

# partition 12 metadata
block:	-
start: 0x58c00000
size:  0x01000000
#end:  0x59c00000
data:	@zero:8M

## partition
part:   -
type:   noop
start: 0x58c00000
size:  0x01000000
fstype: ext4
label:	METADATA
uuid:	
args:   -m 2 -O ^64bit,^metadata_csum

# partition 13 vbmeta
block:	-
start: 0x5a400000
size:  0x00200000
#end:  0x5a600000
sub:	1
data:	.boot/vbmeta.PARTITION

# partition 14 tee
block:	-
start: 0x5ae00000
size:  0x02000000
#end:  0x5ce00000
data:	@zero:32M

## partition
part:   -
type:   noop
start: 0x5ae00000
size:  0x02000000
fstype: ext4
label:	TEE
uuid:	
args:   -m 2 -O ^64bit,^metadata_csum

# partition 15 vendor
block:	-
start: 0x5d600000
size:  0x14000000
#end:  0x71600000
sub:	1
data:	&.boot/vendor.PARTITION.raw.xz

# partition 16 odm
block:	-
start: 0x71e00000
size:  0x08000000
#end:  0x79e00000
sub:	1
data:	&.boot/odm.PARTITION.raw.xz

# partition 17 system
block:	-
start: 0x7a600000
size:  0x50000000
#end:  0xca600000
sub:	1
data:	&.boot/system.PARTITION.raw.xz

# partition 18 product
block:	-
start: 0xcae00000
size:  0x08000000
#end:  0xd2e00000
sub:	1
data:	&.boot/product.PARTITION.raw.xz

# partition 19 data
block:	-
start: 0xd3600000
data:	@zero:64M

## partition
part:   -
type:   noop
start: 0xd3600000
size:   -
fstype: ext4
label:	DATA
uuid:	
args:   -m 2 -O ^64bit,^metadata_csum

##END##
end