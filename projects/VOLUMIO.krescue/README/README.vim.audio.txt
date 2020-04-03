# Volumio

## VIM3L 

### default fenix linux kernel config

```
volumio@volumio:~$ aplay -l | grep AML
card 0: AMLAUGESOUNDV [AML-AUGESOUND-V], device 0: SPDIF-B-dit-hifi-alsaPORT-spdifb dit-hifi-0 []
card 0: AMLAUGESOUNDV [AML-AUGESOUND-V], device 1: TDM-A-dummy-alsaPORT-pcm dummy-1 []
card 0: AMLAUGESOUNDV [AML-AUGESOUND-V], device 2: TDM-B-dummy-alsaPORT-i2s multicodec-2 []
card 0: AMLAUGESOUNDV [AML-AUGESOUND-V], device 3: TDM-C-dummy dummy-3 []
card 0: AMLAUGESOUNDV [AML-AUGESOUND-V], device 4: SPDIF-dit-hifi-alsaPORT-spdif dit-hifi-4 []
card 0: AMLAUGESOUNDV [AML-AUGESOUND-V], device 5: EARC/ARC-dummy-alsaPORT-earc dummy-5 []

volumio@volumio:~$ cat /proc/asound/pcm 
00-00: SPDIF-B-dit-hifi-alsaPORT-spdifb dit-hifi-0 :  : playback 1
00-01: TDM-A-dummy-alsaPORT-pcm dummy-1 :  : playback 1 : capture 1
00-02: TDM-B-dummy-alsaPORT-i2s multicodec-2 :  : playback 1 : capture 1
00-03: TDM-C-dummy dummy-3 :  : playback 1 : capture 1
00-04: SPDIF-dit-hifi-alsaPORT-spdif dit-hifi-4 :  : playback 1
00-05: EARC/ARC-dummy-alsaPORT-earc dummy-5 :  : playback 1 : capture 1
```

+ 00 - HDMI only
+ 01 - BT
+ 02 - HDMI SPDIF I2S
+ 03 - NOT_USED
+ 04 - HDMI SPDIF
+ 05 - NOT_USED

### dtb_fix order maybe more elegant

volumio@volumio:~$ aplay -l | grep AML
card 0: AMLAUGESOUNDV [AML-AUGESOUND-V], device 0: TDM-B-dummy-HDMI_SPDIF_I2S multicodec-0 []
card 0: AMLAUGESOUNDV [AML-AUGESOUND-V], device 1: SPDIF-B-dit-hifi-HDMI dit-hifi-1 []
card 0: AMLAUGESOUNDV [AML-AUGESOUND-V], device 2: SPDIF-dit-hifi-HDMI_SPDIF dit-hifi-2 []
card 0: AMLAUGESOUNDV [AML-AUGESOUND-V], device 3: TDM-A-dummy-BLUETOOTH dummy-3 []
.....
