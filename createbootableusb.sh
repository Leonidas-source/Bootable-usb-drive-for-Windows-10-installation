#!/bin/bash
mkdir 1
mkdir 2
mkdir 3
fdisk -l
echo "Set your usb drive"
read drive
dd if=/dev/zero of=$drive status=progress
cfdisk $drive
mount Win.iso 1
cp -r 1/*  2
umount 1
rm -rf 1
fdisk -l
echo "Set your partition"
read drive2
mkfs.exfat $drive2
mount $drive2 3
cp -r  2/*   3
umount 3 
rm -rf 3 2



 
