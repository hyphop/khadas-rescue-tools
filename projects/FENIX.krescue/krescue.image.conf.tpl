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

# partition 0 clear part table
#block:	-
#start: 0x00000000
#data:	@zero:512

# partition 1 reserved
block:	-
start: 0x02400000
size:  0x04000000
data:	@zero:8M

# dtb 
block:  -
start: 0x02800000
sub:	1
data:   .boot/_aml_dtb.PARTITION

# dtb2
block:  -
start: 0x02840000
sub:	1
data:   .boot/_aml_dtb.PARTITION

# ENV
block: -
start: 0x06c00000
size:  0x00800000
end:  0x07400000
data:  @zero:128B

# LOGO
block: -
start: 0x07c00000
size:  0x00800000
#end:  0x08400000
data:  @zero:8M

# LOGO 
block:	-
start: 0x07c00000
size:  0x00800000
#end:  0x08400000
sub:	1
data:	.boot/logo.PARTITION

# RAMDISK
block:	-
start: 0x08c00000
size:  0x02000000
#end:  0x0ac00000
data:  @zero:1M

# partition 5 rootfs
#part:	1
#start:	0x0b400000
#type:	-
#size:	-
#fstype: $BLK_TYPE
#args:   -m 2 -O ^64bit,^metadata_csum
#label:  $BLK_LABEL
#uuid:   $BLK_UUID

block: -
start: 0x0b400000
sub:    1
data:	&.boot/rootfs.PARTITION.xz

##END##
# parts: 6
[h] NN         partname 0xhex_offs 0xhex_size 0xhex_end_ -      offset        size -  512off  512_sz 512_end
----------------------------------------------------------------------------------------------------
[i] 00       bootloader 0x00000000 0x00400000 0x00400000 -           0     4194304 -       0    8192    8192
[i] 01         reserved 0x02400000 0x04000000 0x06400000 -    37748736    67108864 -   73728  131072  204800
[i] 02              env 0x06c00000 0x00800000 0x07400000 -   113246208     8388608 -  221184   16384  237568
[i] 03             logo 0x07c00000 0x00800000 0x08400000 -   130023424     8388608 -  253952   16384  270336
[i] 04          ramdisk 0x08c00000 0x02000000 0x0ac00000 -   146800640    33554432 -  286720   65536  352256
[i] 05           rootfs 0x0b400000 0x00000000 0x0b400000 -   188743680           0 -  368640       0  368640

end

