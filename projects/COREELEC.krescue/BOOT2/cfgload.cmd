echo "Using device ${device}, number ${devnr}, partition ${partnr}, CoreELEC on eMMC: ${ce_on_emmc}"

setenv remotewakeup "0xeb14ff00"
setenv decode_type "0"
setenv remotewakeupmask "0xffffffff"
setenv wol "1"
# comment for debug next line
setenv coreelec "quiet"
setenv gpiopower "503"

setenv rootopt "BOOT_IMAGE=kernel.img"

#setenv rootopt "${rootopt} boot=LABEL=CE_FLASH disk=LABEL=CE_STORAGE"

if test "${ce_on_emmc}" = "no"; then
  setenv rootopt "${rootopt} boot=LABEL=COREELEC disk=LABEL=STORAGE"
else
#  setenv rootopt "${rootopt} boot=LABEL=CE_FLASH disk=FOLDER=/dev/CE_STORAGE"
#  setenv rootopt "${rootopt} boot=LABEL=CE_FLASH disk=LABEL=CE_STORAGE"
  setenv rootopt "${rootopt} boot=LABEL=CE_FLASH disk=FOLDER=LABEL=CE_STORAGE"
fi


if fatload ${device} ${devnr}:${partnr} ${loadaddr} config.ini; then env import -t ${loadaddr} ${filesize}; fi

# UART main console
setenv consoleopt "console=tty0 console=ttyS0,115200 no_console_suspend"
# HDMI main console
setenv consoleopt "console=ttyS0,115200 console=tty0 no_console_suspend"

setenv displayopt "hdmimode=1080p60hz logo=osd0,loaded,${fb_addr}"

if test "${cec_func_config}" != ""; then setenv cec "hdmitx=cec${cec_func_config}"; fi
if test "${gpiopower}" != ""; then setenv gpiopower "gpiopower=${gpiopower}"; fi
if test "${use_rgb_to_yuv}" != ""; then setenv use_rgb_to_yuv "use_rgb_to_yuv=${use_rgb_to_yuv}"; fi
if test "${max_freq_a53}" != ""; then setenv max_freq_a53 "max_freq_a53=${max_freq_a53}"; fi
if test "${max_freq_a73}" != ""; then setenv max_freq_a73 "max_freq_a73=${max_freq_a73}"; fi
if test "${remotewakeup}" != ""; then setenv irsetup "remotewakeup=${remotewakeup} decode_type=${decode_type} remotewakeupmask=${remotewakeupmask}"; fi
if test "${usbpower}" != ""; then setenv usbpower "enable_system_power=${usbpower}"; fi
if test "${modeline}" != ""; then setenv cmode "modeline=${modeline}"; fi
setenv initargs "${rootopt} ${consoleopt} ${max_freq_a53} ${max_freq_a73} enable_wol=${wol} ${cec} ${irsetup} ${gpiopower} ${usbopts} ${usbpower} ${cmode} ${use_rgb_to_yuv}"
setenv bootargs "${bootargs} ${initargs} ${displayopt} ${coreelec}"

#echo "BOOTARGS: "
#printenv bootargs

fatload ${device} ${devnr}:${partnr} ${loadaddr} kernel.img
fatload ${device} ${devnr}:${partnr} ${dtb_mem_addr} dtb.img

fdt addr ${dtb_mem_addr};
fdt resize 65536
#fdt set /adc_keypad key_val <120>
fdt rm /partitions;

bootm ${loadaddr}
bootm start
bootm loados
bootm prep
bootm go
