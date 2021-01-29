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
builder:	hyphop
date:		$DATE
link:		http://dl.khadas.com/Firmware
label:		$LABEL
match:		$MATCH
vars:		BOARD=$BOARDS
source:		.meta
source:		README*
duration:	70

desc:		LIBREELEC nightly test

## sub 2
sub:	2
data: 	BOOT/SYSTEM

## sub 1
sub:	1
source:	BOOT*
source:	STORAGE

## raw data block
block:  0
start:  0
sub:	1
data:   BOOT.%%BOARD%%/u-boot.%%BOARD%%.sd.bin

## partition + fs block
part:	1
#type:	e
type:	-
start:	100M
size:	200M
fstype:	vfat
label:	$PART1_LABEL
source:	BOOT
uuid:	-

## overlay
overlay: 1
part:	1
sub:	1
source:	BOOT.%%BOARD%%

## overlay
overlay: 2
part:  1
sub:   2
data:  /SYSTEM

## partition + fs block
part:	2
type:	-
start:  100M
fstype:	ext4
label:	$PART2_LABEL
size:	-

## overlay
overlay: 3
part:  2
sub:   1
source:  STORAGE

##END##
end
