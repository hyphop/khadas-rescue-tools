# CoreELEC VIMx https://coreelec.org/

VIMx.COREELEC.19.2-Matrix_rc2.emmc.kresq

rebuilded by ## hyphop ##

# DEVICES

+ khadas VIM1 VIM3 VIM3L

# ISSUES

+ display resolution FULLHD ok
+ display resolution 4k fail

# FEATURES

+ multiboot from USB -> SD -> EMMC
+ special optimized for VIM1 VIM3 VIM3L
+ hardware video decoders - OK
+ onboard wifi OK
+ khadas rc/ir control suppported OK
+ bluetooth - OK
+ fs: ntfs + exfat + fat + ext2/3/4
+ serial console (UART) - OK
+ simple install to emmc from sd
+ simple install to emmc via Krescue
+ boot from emmc OK
+ boot from sd OK

# SSH

+ activation Services/SSH

    user	root
    passw	coreelec

# DOWNLOAD IMAGES

+ https://dl.khadas.com/Firmware/Krescue/images/
+ https://dl.khadas.com/Firmware/Krescue/dump/

# KRESCUE shell - mega online install

    curl -sfL dl.khadas.com/.mega | sh -s - -A VIMx.COREELEC.19.2-Matrix_rc2.emmc.kresq

# LINKS

+ https://github.com/hyphop/khadas-rescue-tools/tree/master/projects/COREELEC.krescue
+ https://coreelec.org/
+ https://github.com/CoreELEC/CoreELEC/releases/

