# HOWTO

project source https://github.com/hyphop/khadas-rescue-tools/tree/master/projects/VOLUMIO.krescue

## PREPARE

    git clone https://github.com/hyphop/khadas-rescue-tools.git
    cd khadas-rescue-tools
    ./scripts/prepare

## BUILD PROJECT

    cd projects/VOLUMIO.krescue
    ./make

    # generate project and output all files to ../../img/VOLUMIO.default
    # and start kresq image build script `../../image/make_image ../../img/VOLUMIO.default`

## FILES 

+ make.conf -> make.conf.default	# project config file
+ make					# project build script
+ krescue.image.conf.tpl		# kreq image config template (shell wrapped script)
					# (all variables starting from $ must be replace to valid values) 
+ blobs/				# binary bootloaders and some toher files
+ BOOT/boot.ini				# uboot script static file can use without modification
+ BOOT/env.txt				# uboot env file need define BOOT_PART IMG_PART DATA_PART vars before
+ BOOT/env.txt.header.tpl		# uboot env header template (shell wrapped script)
					# (all variables starting from $ must be replace to valid values) 

## templates usage

    [ VARS ] sh krescue.image.conf.tpl > krescue.image.conf

## templates usage examples

    DATE="Wed Mar 18 18:27:40 +09 2020" \
    LABEL=VOLUMIO \
    VBOOT=VBOOT VIMAGE=VIMAGE VDATA=VDATA \
    LABEL1=VBOOT UUID1=75E9-56B2 \
    LABEL2=VIMAGE UUID2=23d02900-0797-48f8-94bd-8828253cfd88 \
    LABEL3=VDATA UUID3=96762378-efb1-4eb2-9c7a-cd7512d38bb0 sh krescue.image.conf.tpl > krescue.image.conf

## OUTPUT PROJECT FILES

+ ../../img/VOLUMIO.default/.krescue.image.conf	# generated krescue image config 
+ ../../img/VOLUMIO.default/* 			# other file

NOTE: u can generate ../../img/VOLUMIO.default/ by yourself via your scripts
and u need only one `../../image/make_image` script file for generate kresq image

## ONLINE generator

    curl -sfL https://raw.githubusercontent.com/hyphop/khadas-rescue-tools/master/image/make_image | bash -s -

## OUTPUT kresq image

    /tmp/VIMx.Volumio.last.emmc.kresq

## GENERATE installation image for VIM3L

    curl -sfL dl.khadas.com/.mega | sh -s - VIM3L /tmp/VIMx.Volumio.last.emmc.kresq > /dev/mmcblk?

## GENERATE auto installation image for VIM3L

    curl -sfL dl.khadas.com/.mega | sh -s - -A VIM3L /tmp/VIMx.Volumio.last.emmc.kresq > /dev/mmcblk?

