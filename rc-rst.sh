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

function restore_apt() {
    echo "Restoring Backup"
    if [[ -e $HOME/.backup/sources.list ]]
    then
        cp -r $HOME/.backup/sources.list $PREFIX/etc/apt/sources.list
        apt-get update
        echo "Done"
        sleep 2
        bash rcmenu.sh
    else
        echo "No Backup Data Found, Aborting.."
        sleep 2
        bash rcmenu.sh
    fi
}

clear 
echo "$blue_f$bold$barrier$norm$colnorm"
read -r -p "$yellow_f$bold Do you want to restore Last sources.list backup? (Y/N) > ~$ " vi
case $vi in
    [Yy]*)
        restore_apt ;;
    [Nn]*)
        bash rcmenu.sh ;;
    *)
    echo "Try Again.." ; sleep 2 ; bash rc-rst.sh ;;
esac
