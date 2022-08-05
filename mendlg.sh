#!/bin/bash


##Caching
TITLE="Change Repo"
MENU="Menu"
INPUT="Choose your domain"
RESTORE="Revert any Changes"
SPLASH="ChangeRepo v.0.1"



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


# Code

exec 3>&1
inpts=$(
  dialog \
  --backtitle "$SPLASH" \
  --title "Menu" \
  --menu "Choose what to change, you may want to visit again if you want to change others (like: root and x11)" 0 0 0 \
  "Main Repo" "Termux's Main Repo" \
  "Root Repo" "Termux's Root Repo" \
  "X11 Repo" "Termux's X11 Repo" \
  "Custom" "Insert a Custom Repo Link (Are you crazy?)" \
   2>&1 1>&3 \
  )
exitvars=$?
exec 3>&-
case $exitvars in
  $DIALOG_CANCEL)
  dialog --backtitle "$SPLASH" --title "Exiting" --infobox "Exiting" 0 0 ; sleep 3 ; exit 1 ;;
  $DIALOG_ESC)
  clear ; echo "An Abrupt Exit was Executed because of 255 Exit Code..."  ; exit 255 ;;
esac
case $inpts in
  "Main Repo")
  dialog --backtitle "$SPLASH" --infobox "Loading Lists" 0 0 ; sleep 3 ; bash mrepo.sh ;;
  "Root Repo")
  dialog --backtitle "$SPLASH" --infobox "Loading Lists" 0 0 ;  sleep 3 ; bash menroot.sh ;;
  "X11 Repo")
  dialog --backtitle "$SPLASH" --infobox "Loading Lists" 0 0 ; sleep 3 ;  bash menx11.sh ;;
  "Custom")
  dialog --backtitle "$SPLASH" --infobox "Loading Option" 0 0 ; sleep 3 ; bash mencstm.sh ;;
esac
