#!/bin/bash

##Caching
TITLE="Change Repo"
MENU="Menu"
INPUT="Choose your domain"
RESTORE="Revert any Changes"
SPLASH="ChangeRepo v.0.1"


# File Dir
apt_main=$PREFIX/etc/apt/sources.list
apt_root=$PREFIX/etc/apt/sources.list.d/root.list
apt_x11=$PREFIX/etc/apt/sources.list.d/x11.list

##Exit Operations
: ${DIALOG_OK=0}
: ${DIALOG_CANCEL=1}
: ${DIALOG_ESC=255}

##Color and Styles, etc
red_f=$(tput setaf 1)
red_b=$(tput setab 1)
green_f=$(tput setaf 2)
green_b=$(tput setab 2)
yellow_f=$(tput setaf 3)
yellow_b=$(tput setab 3)
blue_f=$(tput setaf 4)
blue_b=$(tput setab 4)
magenta_f=$(tput setaf 5)
magenta_b=$(tput setab 5)
cyan_f=$(tput setaf 6)
cyan_b=$(tput setab 6)
white_f=$(tput setaf 7)
white_b=$(tput setab 7)

#TextForm
bold=$(tput bold)
uline=$(tput smul)
blink=$(tput blink)
reverse=$(tput rev)
standout=$(tput smso)
norm=$(tput cnorm)
colnorm=$(tput sgr0)

#Others
barrier="====================================================="
user=$(whoami)
host=$(uname -n)
opsys=$(uname -o)
machine=$(uname -m)
kernel_nme=$(uname -s)
kernel_rel=$(uname -r)
kernel_ver=$(uname -v)
upt=$(uptime -p)
cal=$(date)

# Code

function main_apt() {
  if [[ -e $apt_main ]] 
  then
    mkdir $HOME/.backup/
    cp -r $apt_main $HOME/.backup/
    echo "Backup Complete"
  else
    echo "Missing APT sources.list file, Aborting backup...."
    sleep 2
  fi
}

function check_apt() {
 
  echo "Checking"
  sleep 1
  apt-get update 
  break
  bash rcmenu.sh
}

clear
echo "$blue_f Insert Custom Link$colnorm"
echo "$barrier"
echo ""
echo "Remind you that this script doesnt use 'add-apt-repository' feature"
echo "It just directly injects the input to $PREFIX/etc/apt/sources.list"
echo "You can override the apt to use the repo link if unsecured by adding:"
echo ""
echo "deb [trusted=yes]"
echo ""
echo "Also, unlike the dialog version, you have to type 'deb <link>' to add repo"
echo ""
echo "$barrier"
echo ""
read -p "Repo Link: " rpl 
clear ; main_apt ; echo "$rpl" > $PREFIX/etc/apt/sources.list ; check_apt ; bash rcmenu.sh