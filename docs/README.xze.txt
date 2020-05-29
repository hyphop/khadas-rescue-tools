
    xze - advanced xz + suitable for mt decompression & padding

USAGE

    xze [ARGS] FILE
    
    -T#thread
    -B#blocksize in M

META USAGE

    ./xze rootfs_stage.sh -M INFO="any strings" VAR=val

META USAGE EXAMPLE (Krescue images)

    IN=FreeBSD-aarch64-13.0-Khadas-EDGE-V-361468M-20200528.img
    ./xze "$IN" \
    -M \
    \##KRESCUE-META## \
    LABEL=FreeBSD \
    IMAGE="${IN%.*}" \
    BUILDER=Serega \
    DATE="$(date)" \
    MATCH=board=EDGE \
    LINK=http://dev.kubsu.ru/images/ \
    DURATION=60 \
    DESC="FreeBSD 13.0 for Khadas EDGE board aarch64...." \
    \##KRESCUE_META## \
    \##KRESCUE##END

READ META

    tail -c4096 FILE.xz | xz -dc

# MORE EXAMPLES 

default XZ compress file by one block

    du -b FreeBSD-aarch64-13.0-Khadas-EDGE-V-361468M-20200528.img.xz

    # 183496704	bytes

# DECOMPRESS single-thread (x86 4cores)

    time pixz -d < FreeBSD-aarch64-13.0-Khadas-EDGE-V-361468M-20200528.img.xz > /dev/null

    real	0m21.184s
    user	0m19.157s
    sys		0m1.208s

# COMPRESS mutly-thread by blocks 

    ./xze FreeBSD-aarch64-13.0-Khadas-EDGE-V-361468M-20200528.img
    # or same
    xz -T4 --block-size 90M -k -c FreeBSD-aarch64-13.0-Khadas-EDGE-V-361468M-20200528.img \
	> FreeBSD-aarch64-13.0-Khadas-EDGE-V-361468M-20200528.img.xz

    # 2m49 sec (x86 4cores)
    # 183496704 bytes

# DECOMPRESS multy-thread ( 4x faster)

time pixz -d < FreeBSD-aarch64-13.0-Khadas-EDGE-V-361468M-20200528.img.xz > /dev/null

    real	0m5.898s
    user	0m20.367s
    sys		0m0.360s

# ZX info

    Strms  Blocks   Compressed Uncompressed  Ratio  Check   Filename
	2      35    175.0 MiB  3,051.8 MiB  0.057  CRC64   FreeBSD-aarch64-13.0-Khadas-EDGE-V-361468M-20200528.img.xz

# KRESCUE usage example 

## Write xz image by networks

    curl krescue/shell/write | sh -s - F*.xz

    ...

    [i] FreeBSD-aarch64-13.0-Khadas-EDGE-V-361468M-20200528.img.xz (.xz) write => krescue // mmc
    % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
	                             Dload  Upload   Total   Spent    Left  Speed
    100  174M    0   175  100  174M      4  4106k  0:00:43  0:00:43 --:--:--    45

    # IMAGE WAS WRITED

    to       : /dev/mmcblk2
    bytes    : 183496704
    format   : xz
    duration : 43
    status   : 0

    # PARTS

    /dev/mmcblk2p1: LABEL="EFI" UUID="43E7-170C" TYPE="vfat"

