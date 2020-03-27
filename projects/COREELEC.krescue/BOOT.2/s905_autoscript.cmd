## hyphop ##

#= multy boot script

test "$MB" = "1" && exit # from loop

echo start s905_autoscript multiboot

SCRIPTS="s905_autoscript boot.scr.uimg boot.scr cfgload"
MB=1

load=fatload

DEVS="0 1 2 3"
TYPES="usb mmc"

usb reset

for devtype in $TYPES ; do
for devnum in $DEVS ; do
for script in $SCRIPTS; do
if test -e $devtype $devnum $script; then
    device=$devtype
    devnr=$devnum
    partnr=1
    echo "[i] try boot up => $load $devtype $devnum <= $script"
    test -e $devtype $devnum LABEL && ce_on_emmc=yes
    $load $devtype $devnum $loadaddr $script && autoscr $loadaddr
    sleep 1
fi
done
done
done

ce_on_emmc=yes
script=cfgload
device=mmc
devnr=1
partnr=1
load=fatload

$load $devtype $devnum $loadaddr $script && autoscr $loadaddr