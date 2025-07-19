#!/bin/bash
# creates a new swap file of 8 Gb (previously 4 Gb)

# list existing swaps
cat /proc/swaps

# create empty file of specified size 
dd if=/dev/zero of=/swapfile8.img bs=1024 count=8M

# bake swap file
mkswap /swapfile8.img

# add new swap file to the boot system configuration
echo "/swapfile8.img swap swap sw 0 0" >> /etc/fstab

# activate new swap file
swapon -s /swapfile8.img

