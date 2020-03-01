# MANJARO bootup setup

## fix up ethernet hw mac addr to permament

goto uboot command line and `saveenv && print ethaddr`

## manual video resolution

jsut change kernel boot args `/boot/uEnv.ini` and reboot

    nano /boot/uEnv.ini
    bootargs=.... video=HDMI-A-1:1280x720@60e ...

+ [BOOT](BOOT)        - boot up scripts and configs


