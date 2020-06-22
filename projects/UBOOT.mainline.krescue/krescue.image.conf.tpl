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
#args:		-comp zstd -Xcompression-level 22 -b 1M
#args:		-comp xz -Xdict-size 100% -b 1M -Xbcj arm
builder:	hyphop
date:		$DATE
link:		http://dl.khadas.com/Firmware
label:		$LABEL
match:		BOARD=VIM3L
match:		BOARD=VIM3
match:		BOARD=VIM2
match:		BOARD=VIM1
match:		BOARD=Edge
vars:		BOARD=VIM1 VIM2 VIM3 VIM3L Edge
source:		.meta
source:		README*
duration:	2
desc:		mainline uboot for VIMx and Edge khadas boards.
    just single uboot usefull for boot up system from sd or USB / PCIe or DHCP TFTP

# sub 1
sub:	1
source:	BOOT*

## raw data block
#block:  -
#part:	boot0
#start:  0
#sub:	1
#data:   BOOT.%%BOARD%%/u-boot.%%BOARD%%.spi.bin

## raw data block
#block:  -
#part:	boot1
#start:  0
#sub:	1
#data:   BOOT.%%BOARD%%/u-boot.%%BOARD%%.spi.bin

## raw data block
block:  -
start:  0
sub:	1
data:   BOOT/%%BOARD%%.u-boot.sd.bin

## partition + fs block
#part:	1
#type:	
#start:	100M
#size:	200M
#fstype:	vfat
#label:	UBOOT
#source:	BOOT

## overlay
#overlay: 1
#part:	1
#sub:	1
#source:BOOT.%%BOARD%%

##END##
end
