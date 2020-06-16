#!/bin/bash
function check {
find Win.iso || echo "You don't have Win.iso" && exit
}
function createfolders {
mkdir 1 && mkdir 2 && mkdir 3
}
function diskjob {
fdisk -l
echo "Set your usb drive" & mount Win.iso 1 
read drive
echo "Should i zero your drive?(yes/no)"
read answr
[ "$answr" == "yes" ] && dd if=/dev/zero of=$drive status=progress
cfdisk $drive
}
function copydatatousb {
clear
cp -rv 1/*  2  && umount 1 && rm -rfv 1
clear
lsblk $drive
echo "Set your partition"
read drive2
mkfs.exfat $drive2
mount $drive2 3 && cp -rv  2/*  3 && umount 3 && rm -rf 3 2
clear
}


 
