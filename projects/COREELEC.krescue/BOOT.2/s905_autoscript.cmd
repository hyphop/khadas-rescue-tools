#!script

echo start universal emmc script

load=load

#muliboot
usb reset

echo "scan $script on usb or sd (multiboot)"

script=s905_autoscript

$load usb 0 $loadaddr $script && autoscr $loadaddr
$load usb 1 $loadaddr $script && autoscr $loadaddr
$load usb 2 $loadaddr $script && autoscr $loadaddr
$load usb 3 $loadaddr $script && autoscr $loadaddr
$load mmc 0 $loadaddr $script && autoscr $loadaddr

#coreelec boot

ce_on_emmc=yes
script=cfgload
device=mmc
devnr=1
partnr=1

echo "start coreelec from $decice $devnr:$partnr $script"

$load $device $devnr $loadaddr $script && autoscr $loadaddr

