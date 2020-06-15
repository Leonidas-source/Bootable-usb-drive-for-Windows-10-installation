#!/bin/bash
fdisk -l
echo "Set your usb drive"
read drive
dd if=/dev/zero of=$drive status=progress
cfdisk $drive
mkdir part1
mkdir iso
mount Win.iso iso
cp -r iso/*  WINDOWS\(exfat\)/
umount iso
rm -rf iso
fdisk -l
echo "Set your partition"
read drive2
mkfs.exfat $drive2
mount $drive2 part1
cp -r WINDOWS\(exfat\)/*   part1
umount part2
rm -rf part2



 
