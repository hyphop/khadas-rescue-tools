echo "[i] template run args
DATE=\"$DATE\" LABEL=$LABEL VBOOT=$VBOOT VIMAGE=$VIMAGE VDATA=$VDATA \
LABEL1=$LABEL1 UUID1=$UUID1 LABEL2=$LABEL2 UUID2=$UUID2 LABEL3=$LABEL3 UUID3=$UUID3 \
sh krescue.image.conf.tpl">&2

cat <<end # krescue image script config template
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
args:		-b 1M
#args:		-comp zstd -b 1M -Xcompression-level 18
builder:	hyphop
date:		$DATE
link:		http://dl.khadas.com/Firmware
label:		$LABEL
match:		BOARD=VIM1
match:		BOARD=VIM2
match:		BOARD=VIM3
match:		BOARD=VIM3L
vars:		BOARD=VIM1 VIM2 VIM3 VIM3L
source:		README*
source:		.meta
duration:	60
desc:		Volumio - The Audiophile Music Player.
    All your music in one place.
    With bit-perfect audio quality.
    Free and Open Source Forever.
    https://volumio.org/

## ask user block
ask:     choose mainline uboot?
type:    yesno
tag:     UBOOTML
default: NO
desc:    press YES for mainline uboot and NO for legacy uboot

## sub archive already packed squash
sub:    2
data:   VIMAGE/volumio_current.sqsh

# sub 
sub:    1
source: .boot
source: $VBOOT
source: $VIMAGE
source: $VDATA

## raw data block
block:  -
start:  0
sub:    1
#data:   .boot/%%BOARD%%/bootloader
data:   $VBOOT/uboot/u-boot.%%BOARD%%.sd.bin

## raw data block
block:  -
start:  0
match:  UBOOTML=1
sub:    1
data:   $VBOOT/uboot-mainline/u-boot.%%BOARD%%.sd.bin

## raw data blocks

block:  -
start:  0x02400000
size:   0x4000000
sub:    1
data:   @zero:8M

#block:  2
#start:  0x02400000
#size:   0x04000000
#sub:    1
#data:   .boot/reserved

block:  -
start:  0x02800000
sub:    1
data:   .boot/%%BOARD%%/dtb

block:  -
start:  0x02840000
sub:    1
data:   .boot/%%BOARD%%/dtb

block:  -
start:  0x06c00000
sub:    1
data:   @zero:128B
#data:   .boot/%%BOARD%%/env

block:  -
start:  0x07c00000
sub:    1
data:   @zero:8M
#data:   .boot/logo

block:  6
start:  0x08c00000
size:   0x02000000
sub:    1
data:   @zero

## partition + fs block
part:   1
type:   -
start:  0x0b400000
size:   100M
fstype: vfat
source: $VBOOT
label:  $LABEL1
uuid:   $UUID1

## partition
part:   2
type:   -
# write same offset for continue
start:  0x0b400000
size:   2G
fstype: ext4
source: $VIMAGE
args:   -m 2 -O ^64bit,^metadata_csum
label:  $LABEL2
uuid:   $UUID2

## overlay data back
overlay: 1
# source
sub:     2
# destination
part:    2
data:    volumio_current.sqsh

## partition
part:   3
type:   -
# write same offset for continue
start:  0x0b400000
size:   -
fstype: ext4
source: $VDATA
args:   -m 2 -O ^64bit,^metadata_csum
label:  $LABEL3
uuid:   $UUID3

##END##
end
