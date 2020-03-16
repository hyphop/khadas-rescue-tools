#mkimage -C none -A arm -T script -d cfgload.cmd cfgload
cat boot.ini.header cfgload.cmd > boot.ini
