# 1st! variant 

## erase bootup logo from Android

just goto **uart** serial console, **press any key** when device powered and **stop normal bootup process**

```
Hit Enter or space or Ctrl+C key to stop autoboot -- :  0 
kvim#
```
OK ! lets erase logo partition

```
store erase partition logo
```

OK! we dont have bootup logo anymore , done! now we can reboot and check

```
reset
```

PS: