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
#args:		-comp gzip
builder:	hyphop
date:		$DATE
link:		http://dl.khadas.com/Firmware
label:		COREELEC
#match:		BOARD=VIM3
#match:		BOARD=VIM3L
#vars:		BOARD=VIM3 VIM3L
match:		$MATCH
vars:		$VARS
source:		README*
source:		.meta
duration:	17
desc:		$DESC_HEADER !
    CoreELEC is a 'Just enough OS' Linux distribution based on Kodi...

## sub archive already packed sfs
sub:	2
data:	COREELEC/SYSTEM

# sub 1
sub:	1
source:	.boot
source:	COREELEC
source:	STORAGE
source:	OVERLAY.*

## raw data block
block:  0
start:  0
sub:	1
data:   .boot/%%BOARD%%/bootloader

## raw data block
block:  1
start:  0x02400000
size:	0x4000000
sub:	1
data:   @zero

## raw data block
#block:  1
#start:  0x02400000
#size:	0x4000000
#sub:	1
#data:   .boot/reserved

block:  3
start:  0x02800000
sub:	1
data:   .boot/%%BOARD%%/dtb

block:  4
start:  0x02840000
sub:	1
data:   .boot/%%BOARD%%/dtb

## raw data block
block:  2
match:	BOARD=VIM1
match:	BOARD=VIM3
match:	BOARD=VIM3L
start:  0x06c00000
size:	128B
sub:	1
data:   @zero

## raw data block
#block:  2
#match:	BOARD=VIM1
#match:	BOARD=VIM3
#match:	BOARD=VIM3L
#start:  0x06c00000
#size:	128B
#sub:	1
#data:   .boot/%%BOARD%%/env.fix

## raw data block
block:  3
match:	BOARD=VIM1
match:	BOARD=VIM3
match:	BOARD=VIM3L
start:  0x07c00000
sub:	1
data:   .boot/logo

## raw data block
block:  2
match:	BOARD=VIM2
start:	0x27400000
size:	128B
sub:	1
data:   @zero

## raw data block
block:  2
match:	BOARD=VIM2
start:	0x27400000
size:	128B
sub:	1
data:   .boot/%%BOARD%%/env

## raw data block
block:  3
match:	BOARD=VIM2
start:  0x28400000
sub:	1
data:   .boot/logo

## partition + fs block
part:	1
#type:	e
type:	-
start:	0x08c00000
size:	0x30000000
match:	BOARD=VIM1
match:	BOARD=VIM3
match:	BOARD=VIM3L
fstype:	vfat
label:	CE_FLASH
source:	COREELEC
uuid:	-

## partition + fs block
part:	1
#type:	e
match:	BOARD=VIM2
type:	-
start:	0x50000000
size:	300M
fstype:	vfat
label:	CE_FLASH
source:	COREELEC
uuid:	-

## overlay data back
overlay: 1
part:    1
sub:     2
data:    /SYSTEM

## partition + fs block
part:	2
#type:	83
match:	BOARD=VIM1
match:	BOARD=VIM3
match:	BOARD=VIM3L
type:	-
start:	0x39400000
size:	-
fstype:	ext4
label:	CE_STORAGE
source:	STORAGE
uuid:	-

## partition + fs block
part:	2
#type:	83
match:	BOARD=VIM2
type:	-
start:	0x50000000
size:	-
fstype:	ext4
label:	CE_STORAGE
args:	-m 2 -O ^64bit,^metadata_csum
source:	STORAGE
uuid:	-

## overlay
overlay: 1
part:	1
#match:	BOARD=VIM3L
#match:	BOARD=VIM3
sub:	1
source:	OVERLAY.%%BOARD%%

##END##
end