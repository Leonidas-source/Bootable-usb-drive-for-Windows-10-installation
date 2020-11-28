#!/bin/bash
error3() {
  clear
  source=$(pwd)
  path=/usr/bin
  cd $path
  ls | cat >> $source/files
  cd $source
  grep -i "mkfs.exfat" files || error2
}
error2() {
  clear
  echo "Please install exfat-utils"
  rm files
  exit
}
remove_all_temporary_files() {
  clear
  rm -rfv 1 2 3
  menu
}
ready() {
  clear
  umount $drive2'1'
  umount $drive2'2'
  umount $drive2'3'
  umount $drive2'4'
  umount $drive2'5'
  umount $drive2'6'
  umount $drive2'7'
  umount $drive2'8'
  umount $drive2'9'
  umount $drive2'10'
  mkdir 1 2 3
  parted $drive2 -s mklabel gpt mkpart "WINDOWS" fat32 1MiB 10241MiB
  mkfs.exfat $drive2'1'
  mount $win 1
  mount $drive2'1' 3
  cp -rv 1/* 2 && umount 1
  cp -rv 2/* 3 && umount 3
  menu
}
windows_install() {
  clear
  echo "Are you sure(ALL DATA WILL BE LOST!!!)?
  1) yes
  2) no"
  read sure
  [ "$sure" == "1" ] && ready
}
drive() {
  clear
  echo "set drive to install"
  lsblk
  read drive2
  menu
}
img() {
  clear
  echo "set windows image"
  read -e win
  menu
}
menu() {
  clear
  echo "windows image="$win
  echo "drive="$drive2
  echo "
  1) set windows image
  2) set drive to install windows
  3) delete all data and install windows
  4) remove all temporary files
  5) exit"
  read answer
  [ "$answer" == "1" ] && img
  [ "$answer" == "2" ] && drive
  [ "$answer" == "3" ] && windows_install
  [ "$answer" == "4" ] && remove_all_temporary_files
  [ "$answer" == "5" ] && exit
}
error() {
  clear
  echo "You must be root to execute this script"
  exit
}
user_check() {
  clear
  [ `/usr/bin/whoami` != root ] && error
}
user_check
error3
rm files
win=none
drive2=none
menu
