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
  apt-get update 
  break
  bash rcmenu.sh
}


while true ; do
clear
echo "$barrier"
echo ""
echo "$bold$green_f Choose one Repository service. $norm$colnorm"
echo ""
echo "$barrier"
echo ""
echo "Default Repository"
echo "Input: (d)"
echo "        Default Repository of Termux-United States"
echo ""
echo "Cloudflare Global Repo"
echo "Input: (cf)"
echo "          Global Repository of Termux (Cloudflare Edition)"
echo ""
echo "Albatross Repo"
echo "Input: (abs)"
echo "          Termux Albatross Repository"
echo ""
echo "Astra (UA) Repo"
echo "Input: (aua)"
echo "          Astra (UA) Repository"
echo ""
echo "Bardia-Moshiri Repo"
echo "Input: (bm)"
echo "          Bardia-Moshiri Repo"
echo ""
echo "$red_f(FOR CHINA)$colnorm-BFSU-CHINA REPO"
echo "Input: (bfsu)"
echo "          BFSU CHINA REPOSITORY"
echo ""
echo "Grimler24 Repo"
echo "Input: (g24)"
echo "          Grimler24 Repository Service"
echo ""
echo "KCubeTerm Repo"
echo "Input: (kct)"
echo "          KCubeterm Repository service"
echo ""
echo "LibreHat Repo"
echo "Input: (lh)"
echo "          Librehat Repository Service"
echo ""
echo "$red_f(FOR CHINA)$colnorm-NJU REPO"
echo "Input: (nju)"
echo "          NJU Chinese Termux Repository"
echo ""
echo "$red_f(FOR CHINA)$colnorm-Tsinghua University Repo"
echo "Input: (tu)"
echo "           Tsinghua University Repository Service"
echo ""
echo "$red_f(FOR CHINA)$colnorm-USTC Repo"
echo "Input: (ustc)"
echo "           USTC Repository Service"
echo ""
echo "$barrier"
echo ""
read -p "Type Input to modify repo: " ans
case $ans in 
    d) 
        clear ; echo "Backing up file." ; x11_apt ; rm -rf "$apt_x11" ; cp -r assets/repl/Root/default.txt $apt_x11 ; check_apt ;;
    cf)
        clear ; echo "Backing up file." ; x11_apt ; rm -rf "$apt_x11" ; cp -r assets/repl/Root/cloudflare.txt $apt_x11 ; check_apt ;;
    abs)
        clear ; echo "Backing Up File." ; x11_apt ; rm -rf "$apt_x11" ; cp -r assets/repl/Root/albatross.txt $apt_x11 ; check_apt ;;
    aua)
        clear ; echo "Backing Up File." ; x11_apt ; rm -rf "$apt_x11" ; cp -r assets/repl/Root/astra-isp.txt $apt_x11 ; check_apt ;;
    bm)
        clear ; echo "Backing Up File." ; x11_apt ; rm -rf "$apt_x11" ; cp -r assets/repl/Root/bardia-moshiri $apt_x11 ; check_apt ;;
    bfsu)
        clear ; echo "Backing Up File " ; x11_apt ; rm -rf "$apt_x11" ; cp -r assets/repl/Root/bfsu-cn.txt $apt_x11 ; check_apt ;;
    g24)
        clear ; echo "Backing Up File." ; x11_apt ; rm -rf "$apt_x11" ; cp -r assets/repl/Root/grimler.txt $apt_x11 ; check_apt ;;
    kct)
        clear ; echo "Backing Up File." ; x11_apt ; rm -rf "$apt_x11" ; cp -r assets/repl/Root/kcubeterm.txt $apt_x11 ; check_apt ;;
    lh)
        clear ; echo "Backing up File." ; x11_apt ; rm -rf "$apt_x11" ; cp -r assets/repl/Root/librehat.txt $apt_x11 ; check_apt ;;
    nju)
        clear ; echo "Backing up File." ; x11_apt ; rm -rf "$apt_x11" ; cp -r assets/repl/Root/nju-cn.txt $apt_x11 ; check_apt ;;
    tu)
        clear ; echo "Backing up File." ; x11_apt ; rm -rf "$apt_x11" ; cp -r assets/repl/Root/tsinghua-univ-cn.txt $apt_x11 ; check_apt ;;
    ustc) 
        clear ; echo "Backing up File." ; x11_apt ; rm -rf "$apt_x11" ; cp -r assets/repl/Root/ustc-cn.txt $apt_x11 ; check_apt ;;
    0)
      break ;;
    *)
      echo "$ans is not in the list, Try again." ; sleep 3 ; clear ;;
esac
done
bash rcmenu.sh