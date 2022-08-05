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
user=$(whoami)
host=$(uname -n)
opsys=$(uname -o)
machine=$(uname -m)
kernel_nme=$(uname -s)
kernel_rel=$(uname -r)
kernel_ver=$(uname -v)
upt=$(uptime -p)
cal=$(date)

# Function

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

function root_apt() {
  if [[ -e $apt_root ]] 
  then
    mkdir $HOME/.backup/
    cp -r $apt_root $HOME/.backup
    echo "Backup Complete"
  else
    echo "Missing APT root.list file, Aborting backup...."
    sleep 2
  fi
}

function x11_apt() {
  if [[ -e $apt_x11 ]] 
  then
    mkdir $HOME/.backup/
    cp -r $apt_x11 $HOME/.backup
    echo "Backup Complete"
  else
    echo "Missing APT x11.list file, Aborting backup...." 
    sleep 2
  fi
}

function check_apt() {
  echo "Checking"
  sleep 1
  apt-get update | dialog --backtitle "$SPLASH" --title "Process" --programbox 30 65
  bash mendlg.sh
}

# Code
exec 3>&1
pickrepo=$(
  dialog \
  --backtitle "$SPLASH" \
  --title "Choose X11 Repository" \
  --menu "Pick one X11 Repo only.. (Don't worry, you can add more soon in lists.)" 0 0 0 \
  "Default Repo - US" "Termux America" \
  "Default Repo - World" "Termux CloudFlare Global" \
  "Albatross Repo" "Termux Albatross Repo" \
  "Astra  UA" "Astra - UA Repo Service" \
  "Bardia-Moshiri" "Termux Iran Repo Service" \
  "BFSU-CHINA" "FOR CHINESE ONLY - Termux Repo Service" \
  "Grimler24" "Termux Grimler24 Repo Service" \
  "KCubeTerm" "Termux KCubeTerm Repo Service" \
  "LibreHat" "Termux LibreHat Repo Service" \
  "NJU-CHINA" "FOR CHINESE ONLY - Termux Repo Service" \
  "TU-CHINA" "FOR CHINESE ONLY - TSINGHUA UNIV. REPO SERVICE" \
  "USTC-CHINA" "FOR CHINESE ONLY - USTC TERMUX REPO SERVICE" \
  2>&1 1>&3 \
  )
exitvar=$?
exec 3>&-
case $exitvar in
 $DIALOG_CANCEL)
 if ( dialog --backtitle "$SPLASH" --title "Notice" --yes-label "Continue" --no-label "Go Back" --yesno "Canceling Operations??" 0 0 )
 then
  bash mendlg.sh 
 else
  bash menx11.sh
 fi
esac
case $pickrepo in 
 "Default Repo - US")
  clear ; echo "$red_f>Copying Termux Default Repository.....$colnorm"  ; x11_apt ; rm -rf "$apt_x11" ; echo "$green_f$bold>Modifying..$colnorm$norm" ;cp -r assets/repl/X11/default.txt "$apt_x11" | echo "Code: $?" ; check_apt ;;
  "Default Repo - World")
    clear ; echo "$red_f>Copying Termux CloudFlare Repository...$colnorm" ; x11_apt ; rm -rf "$apt_x11" ; cp -r assets/repl/X11/cloudflare.txt $apt_x11 ; check_apt ;;
  "Albatross Repo")
    clear ; echo "$red_f>Copying Albatross Repo$colnorm" ; x11_apt ; rm -rf "$apt_x11" ; cp -r assets/repl/X11/albatross.txt $apt_x11 ; check_apt ;;
  "Astra UA")
    clear ; echo "$red_f>Copying Astra UA Repo$colnorm" ; x11_apt ; rm -rf "$apt_x11" ; cp -r assets/repl/X11/astra-isp.txt $apt_x11  ; check_apt ;;
  "Bardia-Moshiri")
    clear ; echo "$red_f>Copying Bardia Moshiri Repo$colnorm" ; x11_apt ; rm -rf "$apt_x11" ; cp -r assets/repl/X11/bardia-moshiri.txt $apt_x11 ; check_apt ;;
  "BFSU-CHINA")
    clear ; echo "$red_f>Copying BFSU-CHINA Repo" ; echo "$blink>WARNING, YOU ARE INJECTING A CHINESE REPOSITORY AREA$colnorm$norm" ; x11_apt ; rm -rf "$apt_x11" ; cp -r assets/repl/X11/bfsu-cn.txt $apt_x11 ; check_apt ;;
  "Grimler24")
    clear ; echo "$red_f>Copying Termux - Grimler Repo$colnorm" x11_apt ; rm -rf "$apt_x11" ; cp -r assets/repl/X11/grimler.txt $apt_x11 ; check_apt ;;
  "KCubeTerm")
    clear ; echo "$red_f>Copying Termux - KCubeTerm Repo$colnorm" ; x11_apt ; rm -rf "$apt_x11" ; cp -r assets/repl/X11/kcubeterm.txt $apt_x11 ; check_apt ;;
  "LibreHat")
    clear ; echo "$red_f>Copying Termux - Librehat Repo$colnorm" ; x11_apt ; rm -rf "$apt_x11" ; cp -r assets/repl/X11/librehat.txt ; check_apt ;;
  "NJU-CHINA")
    clear ; echo "$red_f>Copying NJU-CHINA Repo" ; echo "$blink>WARNING, YOU ARE INJECTING A CHINESE REPOSITORY AREA$colnorm$norm" ; x11_apt ; rm -rf "$apt_x11" ; cp -r assets/repl/X11/nju-cn.txt $apt_x11 ; check_apt ;;
  "TU-CHINA")
    clear ; echo "$red_f>Copying TU-CHINA Repo" ; echo "$blink>WARNING, YOU ARE INJECTING A CHINESE REPOSITORY AREA$colnorm$norm" ; x11_apt ; rm -rf "$apt_x11" ; cp -r assets/repl/X11/tshinghua-univ-cn.txt $apt_x11 ; check_apt ;;
  "USTC-CHINA")
    clear ; echo "$red_f>Copying USTC-CHINA Repo" ; echo "$blink>WARNING, YOU ARE INJECTING A CHINESE REPOSITORY AREA$colnorm$norm" ; x11_apt ; rm -rf "$apt_x11" ; cp -r assets/repl/X11/ustc-cn.txt $apt_x11 ; check_apt ;;
esac

