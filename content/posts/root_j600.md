---
title: "Rooting Galaxy J6 with Magisk and Heimdall"
date: 2023-04-23T10:30:29+05:30
draft: false
tags: [Android,Rooting]
---
_This is the steps I followed to root my old Samsung Galaxy J6 device. The procedure might vary slightly for other devices_
# Requirements
- Stock ROM of the current device OS
- Android Development Bridge (ADB) installed in computer
- [Heimdall](https://github.com/Benjamin-Dobell/Heimdall) in computer
- [Magisk](https://github.com/topjohnwu/Magisk) app installed in device

# Process
1. Extract `boot.img` from the current ROM
	1. Download the ROM online from [SamFW](samfw.org) or [GalaxyFirmware](galaxyfirmware.com). It'll be a .tar.md5 file
	2. extract the `AP` the file using `tar -xvf`.
	3. From the extracted `AP` get the `boot.img.lz4` by the same method
	4. `lz4 -d boot.img.lz4` to get `boot.img`
	_Instead of getting the whole ROM, one can just download the `AP` file to start with._
2. Connect the android device to the computer via ADB
3. Send the `boot.img` to the Android device. Can use `adb push boot.img /sdcard`
4. Select Install in the Magisk app and select `boot.img` and get a patched boot image
5. get the patched boot image back to the computer `adb pull /sdcard/Download/Magisk-...img`
6. Install heimdall/Odin in computer
7. Put the device to download mode by `adb reboot bootloader`
8. When the device boots into bootloader mode, verify heimdall detects it by `heimdall detect`
9. When the device boots into bootloader, flash the boot image using heimdall `heimdall flash --BOOT Magisk-...img`
10. The android device will auto reboot. If Samsung Knox triggers and ask to factory reset, proceed with it and reinstall Magisk app.
11. Follow the instructions in the Magisk app.
