#!script

## hyphop ##

##CONFIG_BEGIN

LABEL=MANJARO
UBOOT_KERNEL=Image
UBOOT_UINITRD=uInitrd
UBOOT_ENV_INIT=uEnv.ini

##

env_addr=0x10400000
kernel_addr=0x11000000
initrd_addr=0x13000000

##CONFIG_END

echo "[i] start $LABEL linux from $devtype:$devnum:$distro_bootpart"

test "$devtype" = ""           && devtype=mmc
#test "$devnum"  = ""          && devnum=2
#test "$distro_bootpart" = ""  && distro_bootpart=1
## scan boot part by distro LABEL
test "$devnum" = "" && for d in 2 1 0; do
for p in 1 2 3 4 5; do
test "$devnum" = "" && load $devtype $d:$p $loadaddr $LABEL.label && devnum=$d && distro_bootpart=$p
done
done

echo "[i] start $LABEL linux from $devtype:$devnum:$distro_bootpart fixed"

LOADER="load $devtype $devnum:$distro_bootpart"

DTB_ADDR=$dtb_mem_addr
test "X$DTB_ADDR" = "X" && DTB_ADDR=0x1000000

echo "[i] KERNEL: $LOADER $kernel_addr $UBOOT_KERNEL"
$LOADER $kernel_addr $UBOOT_KERNEL   || exit 1

echo "[i] INITRD: $LOADER $initrd_addr $UBOOT_UINITRD"
$LOADER $initrd_addr $UBOOT_UINITRD  || exit 1

echo "[i] ENV: $LOADER $env_addr $UBOOT_ENV_INIT"
$LOADER $env_addr    $UBOOT_ENV_INIT && env import -t $env_addr $filesize

DTB_NAME=$dtb_name
test "X$DTB_NAME" = "X" && DTB_NAME="dtbs/$fdtfile"

echo "[i] DTB: $LOADER $DTB_ADDR $DTB_NAME"
$LOADER $DTB_ADDR    $DTB_NAME       || exit 1

echo "[i] try linux bootup > bootargs: $bootargs"

echo "booti $kernel_addr $initrd_addr $DTB_ADDR"
booti $kernel_addr $initrd_addr $DTB_ADDR

##END##
