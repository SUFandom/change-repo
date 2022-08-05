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

#Code 
tput setaf 2 ; cat assets/rcico.txt ; tput sgr0
echo ""
echo -E "$cyan_f 2022 SUFandom$colnorm"
echo "Github"

echo -E "$green_f Hello, $user!$norm"
echo "$barrier"
echo -E "$green_f $bold A tool to change your termux Repository \!$norm"
echo "$barrier"
sleep 2
echo "$green_f $bold System Info$norm"
echo "$barrier"
echo "$cyan_f Kernel: $kernel_nme$norm"
echo "$magenta_f Version: $kernel_ver$norm"
echo "$blue_f Release Date: $kernel_rel. $norm"
echo "$green_f Operating System: $opsys$norm"
echo "$yellow_f Linux Host: $host $norm"
echo "$ref_f CPU Architecture: $machine$norm"
echo "$white_f Device Uptime: $upt$norm"
echo "$red_f Date: $cal$norm"
echo "$barrier"
echo ""
echo "Search Help on Wiki of Repository"
echo ""
echo "$barrier"
sleep 3
while true ; do
echo "$cyan_f$uline Select Menu here$norm$cyan_f: $norm$colnorm"
echo "1 - Change Main Repository "
echo "2 - Change X11 Repository"
echo "3 - Change Root Repository"
echo "4 - Insert Custom Repository"
echo "5 - Restore Last Modifications"
echo "0 - Exit"
echo "$barrier"
read -p "$bold$green_f>Insert Choice: $norm$colnorm$uline" ans 
case $ans in 
 1) tput cnorm ; tput sgr0 ; bash rcrepo.sh ; break ;;
 2) tput cnorm ; tput sgr0 ; bash rcx11.sh  ; break ;;
 3) tput cnorm ; tput sgr0 ; bash rcroot.sh ; break ;;
 4) tput cnorm ; tput sgr0 ; bash rc-cstm.sh ; break ;;
 5) tput cnorm ; tput sgr0 ; bash rc-rst.sh ;;
 0) tput cnorm ; tput sgr0 ; exit 0 ; break ;;
 *) tput cnorm ; tput sgr0 ; echo "$bold$red_f>TRY AGAIN$colnorm$norm" ;;
 esac
done