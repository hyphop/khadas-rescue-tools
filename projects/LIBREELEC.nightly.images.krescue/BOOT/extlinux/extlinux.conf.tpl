cat <<end
LABEL LibreELEC
  LINUX /$UBOOT_KERNEL
  FDT /$FDT
  APPEND boot=LABEL=$PART1_LABEL disk=LABEL=$PART2_LABEL quiet systemd.debug_shell=ttyAML0 console=ttyAML0,115200n8 console=tty0
end