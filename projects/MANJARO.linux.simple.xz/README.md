# MANJARO generate simple xz krescue image

simple example how to generate xz krescue image

+ download original image
+ rebuild partiotions
+ remove unused files from boot part
+ cleanup ext4 partition unused space
+ rebuild fat boot partition
+ add khadas uboot bootloader
+ replace boot scripts to extlinux
+ repack again with better compression level
  to xz krescue image which can used for krescue same as for normal usage via xz or pixz

NOTE: all kernel initramfs + rootfs content stay without any changes

```
./make.VIM1.xfce
./make.VIM2.mate
./make.VIM3.mate
./make.Edge.xfce

```

## Manjaro upgrade

```
sudo pacman -Syyu
```

## OUTPUT

```
../../img/MANJARO.linux.simple.xz/*.raw.img.xz

```

## LINKS

+ https://github.com/hyphop/khadas-rescue-tools/tree/master/projects/MANJARO.linux.simple.xz
+ https://forum.khadas.com/search?q=manjaro
+ https://manjaro.org/
+ https://forum.manjaro.org/
+ https://github.com/krescue/krescue/blob/master/docs/README_how_to_make_simple_krescue_image_xz.md
