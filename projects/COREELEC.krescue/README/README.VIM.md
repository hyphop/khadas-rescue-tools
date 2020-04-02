# CoreELEC VIMx https://coreelec.org/

rebuilded by ## hyphop ##

# DEVICES

+ khadas VIM1 VIM2 VIM3 VIM3L

# FEATURES

+ multiboot from USB -> SD -> EMMC
+ special optimized for VIM1 VIM2 VIM3 VIM3L
+ hardware video decoders - OK
+ khadas fan OK - work in auto mode
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

    curl -sfL dl.khadas.com/.mega | sh -s - -A VIM1  VIM12.COREELEC.9.2.1.emmc.kresq
    curl -sfL dl.khadas.com/.mega | sh -s - -A VIM2  VIM12.COREELEC.9.2.1.emmc.kresq
    curl -sfL dl.khadas.com/.mega | sh -s - -A VIM3  VIM3.COREELEC.9.2.1.emmc.kresq
    curl -sfL dl.khadas.com/.mega | sh -s - -A VIM3  VIM3x.COREELEC.9.2.nightly.emmc.kresq
    curl -sfL dl.khadas.com/.mega | sh -s - -A VIM3L VIM3x.COREELEC.9.2.nightly.emmc.kresq

# LINKS

+ https://github.com/hyphop/khadas-rescue-tools/tree/master/projects/COREELEC.krescue
+ https://coreelec.org/

