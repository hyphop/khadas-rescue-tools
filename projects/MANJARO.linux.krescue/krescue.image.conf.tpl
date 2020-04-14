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
args:		-comp zstd -Xcompression-level 22 -b 1M
#args:		-comp xz -Xdict-size 100% -b 1M -Xbcj arm
builder:	hyphop
date:		$DATE
link:		http://dl.khadas.com/Firmware
label:		MANJARO
vars:		BOARD=VIM1 VIM2 VIM3 VIM3L
match:		$MATCH
source:		.meta
source:		README*
duration:	70
desc:		Manjaro is a free and open-source Linux distribution based on the Arch Linux operating system.
    Manjaro has a focus on user friendliness and accessibility, and the system itself is designed 
    to work fully "straight out of the box" with its variety of pre-installed software...

# sub 1
sub:	1
source:	BOOT
source:	BOOT.vim*
source:	ROOT.*

## raw data block
block:  0
start:  0
sub:	1
data:   BOOT.%%BOARD%%/u-boot.%%BOARD%%.sd.bin

## partition + fs block
part:	1
type:	
start:	62496B
size:	409600B
fstype:	vfat
label:	BOOT
source:	BOOT

## overlay
overlay: 1
part:	1
#match:	BOARD=VIM2
#match:	BOARD=VIM1
sub:	1
source:	BOOT.%%BOARD%%

## partition + fs block
part:	2
type:	-
start:  62496B
size:	-

# sub 2
sub:	2
args:	-comp zstd -Xcompression-level 1 -b 1M
#data: 	ROOT/rootfs.img.xz.sfs
source: ROOT

block:  1
start:  62496B
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
