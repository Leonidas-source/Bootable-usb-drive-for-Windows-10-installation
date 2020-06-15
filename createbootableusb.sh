#!/bin/bash
fdisk -l
echo "Set your usb drive"
read drive
dd if=/dev/zero of=$drive
parted $drive mklable gpt
parted $drive mkpart ext4 ext4 1 6001 
mkdir part1
mkdir iso
mount Win.iso iso
cp -r iso/*  WINDOWS\(exfat\)/
umount iso
rm -rf iso
mount $drive2 part1
cp -r WINDOWS\(exfat\)/*   part1
umount part2
rm -rf part2



 
