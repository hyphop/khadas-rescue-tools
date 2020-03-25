cat <<end # krescie image script config template
# krescue image script config

#    __ _____                      
#   / //_/ _ \___ ___ ______ _____ 
#  / ,< / , _/ -_|_-</ __/ // / -_)
# /_/|_/_/|_|\__/___/\__/\_,_/\__/ 
#                                  
# krescue advanced install system  

#
# INFO:  https://github.com/hyphop/khadas-rescue-tools/tree/master/image
#

## header block
image:		$NAME
type:		emmc
format:		kresq
args:		-comp zstd -Xcompression-level 3 -b 1M
builder:	hyphop
date:		$DATE
link:		http://dl.khadas.com/Firmware
label:		$LABEL
match:		BOARD=VIM3L
match:		BOARD=VIM3
match:		BOARD=VIM2
match:		BOARD=VIM1
vars:		BOARD=VIM1 VIM2 VIM3 VIM3L
source:		.meta
source:		README*
duration:	70
desc:		$LABEL $IMG converted from $LINK0 ( balbes150 )
    user: root, password: 1234

## sub 1
sub:    1
source: BOOT*
source: ROOT.*

## raw data block
block:  0
start:  0
sub:    1
data:   BOOT.%%BOARD%%/u-boot.%%BOARD%%.sd.bin

## partition + fs block
part:    1
type:    -
start:   100M
size:    300M
fstype:  vfat
#label:  BOOT
#label:   $LABEL1
#uuid:    $UUID1
label:   BOOT_EMMC
source:  BOOT.org

## overlay
overlay: 1
part:    1
#match:  BOARD=VIM2
#match:  BOARD=VIM1
sub:     1
source:  BOOT.%%BOARD%%

## partition + fs block
part:	2
type:	-
start:  400M
size:	-

# sub 2
sub:	2
args:	-comp zstd -Xcompression-level 1 -b 1M
#data: 	ROOT/rootfs.img.xz.sfs
source: ROOT

block:  1
start:  400M
sub:    2
#data:  &rootfs.img.xz
data:   &ROOT/rootfs.img.xz

## overlay
overlay: 2
part:	2
sub:	1
source: ROOT.overlay

## overlay
overlay: 3
part:	2
match:	BOARD=VIM3L
match:	BOARD=VIM3
match:	BOARD=VIM2
match:	BOARD=VIM1
sub:	1
source:	ROOT.%%BOARD%%

##END##
end
