#!/bin/bash
fdisk -l
echo "Set your usb drive"
read drive
cfdisk $drive
fdisk -l
echo "What is your first partition?"
read drive1
fdisk -l
echo "What is your second partition?"
read drive2
mkfs.vfat $drive1
mkfs.exfat $drive2
mkdir part1
mkdir part2
mkdir iso
mount Win.iso iso
cp -r iso/*  WINDOWS\(exfat\)/
umount iso
rm -rf iso
mount $drive1 part1
cp  -r UEFI_DRIVERS\(vfat\)/*  part1
umount part1
rm -rf part1
mount $drive2 part2
cp -r WINDOWS\(exfat\)/*   part2
umount part2
rm -rf part2



 
