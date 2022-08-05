#!/bin/bash

##Caching
TITLE="Change Repo"
MENU="Menu"
INPUT="Choose your domain"
RESTORE="Revert any Changes"
SPLASH="ChangeRepo v.0.1"

## Var
apt_loc=$PREFIX/etc/apt/sources.list

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
user=$(whoami)
host=$(uname -n)
opsys=$(uname -o)
machine=$(uname -m)
kernel_nme=$(uname -s)
kernel_rel=$(uname -r)
kernel_ver=$(uname -v)
upt=$(uptime -p)
cal=$(date)

## function
function  backup () {
  if [[ -e $apt_loc  ]]
  then
  mkdir $HOME/.backup/
    cp -r $apt_main $HOME/.backup/
    echo "Backup Complete"
  else
    echo "Missing APT sources.list file, Aborting backup...."
    sleep 2
  fi
}

function check_apt () {
  echo "Checking"
  sleep 5
  apt-get update
}

##code

if ( dialog --backtitle "WARNING" --title "ALERT" --yes-label "Proceed" --no-label "Go Back" --yesno "WARNING, YOU ARE ATTEMPTING, POSSIBLY ADDING UNTRUSTED SOURCES, PLEASE REFER TO TERMUX WIKI ABOUT ADDING CUSTOM REPOS, also you can add: [trusted=yes] variable first then the link..." 0 0 )
then
echo ""
clear
else
bash mendlg.sh
fi
exec 3>&1
input=$(
  dialog --backtitle "$SPLASH" --title "Input Custom Repo" --inputbox "Input the Link here, (add [trusted=yes] if its untrusted and you like your termux to feel funny)" 0 0 \
  3>&1 1>&2 2>&3
  )
exitvar=$?
exec 3>&-
case $exitvar in 
 $DIALOG_OK)
  backup ; echo "deb $input # custom input by change-repo" > $apt_loc ; check_apt ; sleep 3 ; bash mendlg.sh ;;
 $DIALOG_CANCEL)
  bash mendlg.sh ;;
esac
