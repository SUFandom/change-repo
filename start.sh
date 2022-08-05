#!/bin/bash
# Check Linux
uname -r > ver.txt
if (grep -i "faked" ver.txt) ; then
echo "You are running a Fake Linux Environment, Aborting..."
sleep 3
rm -rf ver.txt
exit 0
else
rm -rf ver.txt
fi

#Additional Keys

if [ "$1" == "--clear-key-cache" ] || [ "$1" == "--clear-cache" ] || [ "$1" == "--del-key" ] || [ "$1" == "--remove-key" ] || [ "$1" == "-rmk" ]
then
rm -rf $HOME/.keyring
echo "Cleared"
exit 0
fi

if [ "$1" == "--help" ] || [ "$1" == "-h" ] ; then
echo "Read the Termux Guide of changing repositories"
echo "here" 
echo "https://github.com/termux/termux-packages/wiki/Mirrors"
echo ""
echo "Usage:"
echo "--help -h > Help"
echo "            Shows Help Page"
echo "--readline -r > Readline mode"
echo ""
echo "--clear-key-cache , --clear-cache , --del-key, "
echo "--remove-key , -rmk"
echo "                    Remove Key, leading to see the warn-"
echo "                    ing info, about its perms.."
echo ""
echo "Contact The Author for more."
exit 0
fi
if [ "$1" == "--readline" ] || [ "$1" == "-r" ]
then
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

##Init code

echo "Repo Change (Readline Mode)!"
sleep 1
echo "Changing Repos with better functionality "
if [[ -e "$HOME/.keyring/key.k" ]]
then
echo ""

else
cat assets/agree.txt
echo ""
echo "Please Read the manual to continue"
sleep 3
while true ; do
read -r -p "Type Y/N > " answ
case $answ in
    [Yy]*) echo "$green_f>Ok! You have Agreed to the terms..$colnorm" ; sleep 3 ; mkdir $HOME/.keyring ; touch $HOME/.keyring/key.k ; echo $RANDOM > $HOME/.keyring/key.k ; break ;;
    [Nn]*) echo "$red_f>Exiting...$colnorm" ; sleep 3 ; exit 1 ;;
    * ) echo "$bold$blue_f>Try Again$colnorm$norm" ;;
esac
done
fi
## Clear install
apt-get install ncurses-utils -y >> /dev/null

clear 
echo -e "\t Change Repo!"
echo -e "\t Initializing!"
sleep 3
clear
bash rcmenu.sh
exit 0
fi



if [ "$1" == "-" ] || [ "$1" == "--" ] || [ "$1" == "-*" ] || [ "$1" == "--*" ] || [ "$1" == "-g" ]
then
echo "You are using additional var wrong,"
echo "  Usage:"
echo "  --help -h > Help"
echo "  --readline -r > Readline mode"
echo ""
echo "--clear-key-cache , --clear-cache , --del-key, "
echo "--remove-key , -rmk"
echo "                    Remove Key, leading to see the warn-"
echo "                    ing info, about its perms.."
echo ""
echo "Contact The Author for more."
exit 0



## Clear install
apt-get install ncurses-utils -y >> /dev/null

dialog --backtitle "$SPLASH" --title "$TITLE" --infobox "欢迎。" 0 0
sleep 2
bash cn-men.sh
fi
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

##Init code

echo "Repo Change!"
sleep 1
echo "Changing Repos with better functionality "
if [[ -e "$HOME/.keyring/key.k" ]]
then
echo ""
else
cat assets/agree.txt
echo ""
echo "Please Read the manual to continue"
sleep 3
while true ; do
read -r -p "Type Y/N > " answ
case $answ in
    [Yy]*) echo "$green_f>Ok! You have Agreed to the terms..$colnorm" ; mkdir $HOME/.keyring ; touch $HOME/.keyring/key.k ; echo $RANDOM > $HOME/.keyring/key.k ; sleep 3 ; break ;;
    [Nn]*) echo "$red_f>Exiting...$colnorm" ; sleep 3 ; exit 1 ;;
    * ) echo "$bold$blue_f>Try Again$colnorm$norm" ;;
esac
done
fi
## Clear install
apt-get install ncurses-utils -y >> /dev/null

dialog --backtitle "Change-Repo 0.1" --title "Change Repo" --infobox "Welcome" 0 0
sleep 2
bash mendlg.sh
