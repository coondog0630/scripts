#!/usr/bin/env bash

# Set NVRAM to boot into 64 bit mode
sudo nvram boot-args="arch=x86_64";

# setup plist apple boot to x86_64
sudo systemsetup -setkernelbootarchitecture x86_64;

# Should print out the modified value in plist conf from systemsetup changes
cat /Library/Preferences/SystemConfiguration/com.apple.Boot.plist | grep -i x86_64;