#!/bin/bash
dir(){
  mkdir 1
  mkdir 2
  mkdir 3
}
copy(){
  clear
  cp -rv 1/* 2 && umount 1
}
tousb(){
  clear
  mount $drive2 3
  cp -rv 2/* 3
  umount 3
}
dirrm(){
  rm -rf 1 2 3
}
find Win.iso || exit
clear
clear
lsblk -f
echo "Set your usb drive"
read drive
clear
echo "Should i erase your usb drive?
1) yes
2) no"
read answr
[ "$answr" == "1" ] && dd if=/dev/zero of=$drive status=progress
cfdisk $drive
clear
dir
mount Win.iso 1
clear
copy
clear
lsblk $drive
echo "Set your partition"
read drive2
clear
mkfs.exfat $drive2
clear
tousb
clear
dirrm
clear
