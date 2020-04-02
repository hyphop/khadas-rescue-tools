#!script

## hyphop ##

#= multy boot script

test "$MB" = "1" && exit # from loop

echo start boot.ini multiboot

SCRIPTS="s905_autoscript boot.scr.uimg boot.scr cfgload"
MB=1

load=fatload
DEVS="0 1 2 3"
TYPES="usb mmc"

Cdtb=dtb.img

test "$boardname" = "kvim"     && Cdtb=device_trees/gxl_p212_2g_kvim.dtb
test "$hostname"  = "arm_gxbb" && Cdtb=device_trees/gxm_kvim2.dtb
test "$hostname"  = "KVIM3"    && Cdtb=device_trees/g12b_a311d_khadas_vim3.dtb
test "$hostname"  = "KVIM3L"   && Cdtb=device_trees/sm1_s905d3_khadas_vim3l.dtb
echo "!!! $Cdtb"

usb reset

for devtype in $TYPES ; do
for devnum in $DEVS ; do
#if test -e $devtype $devnum / ; then
if $devtype $devnum ; then
for script in $SCRIPTS; do
    device=$devtype
    devnr=$devnum
    partnr=1
    ce_on_emmc=no
if test -e $devtype $devnum $script; then
    echo "[i] try boot up => $load $devtype $devnum <= $script"
    ## emmc
    if test -e $devtype $devnum LABEL ; then
    ce_on_emmc=yes
    else
    ## sd/usb scan dtb
    for a in $Cdtb dtb.img ; do
	test -e $devtype $devnum $a && $load $devtype $devnum $dtb_mem_addr $a
    done
    fi
    ## try
    $load $devtype $devnum $loadaddr $script && autoscr $loadaddr

fi

done ## scripts missed or fail

if test -e $devtype $devnum SYSTEM && test -e $devtype $devnum kernel.img; then
    echo "[i] try boot coreelec from $devtype $devnum without scripts ($device-$devnr-$partnr) + $Cdtb"
    for a in dtb.img $Cdtb; do
	if test -e $devtype $devnum $a && $load $devtype $devnum $dtb_mem_addr $a; then
	$load mmc 1 $loadaddr cfgload && autoscr $loadaddr
	fi
    done
fi

fi

done
done
