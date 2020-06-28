#!/bin/bash
dir(){
  mkdir 1
  mkdir 2
  mkdir 3
}
copy(){
  clear
  cp -r 1/* 2 && umount 1
}
tousb(){
  clear
  mount $drive2 3
  cp -r 2/* 3
  umount 3
}
dirrm(){
  rm -rf 1 2 3
}
find Win.iso || exit
clear
dir
mount Win.iso 1
clear
lsblk -f
echo "Set your usb drive"
read drive
clear
echo "Should i erase your usb drive(yes/no)?"
read answr
[ "$answr" == "yes" ] && dd if=/dev/zero of=$drive status=progress
cfdisk $drive
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
