#!/bin/bash
##################################################################################################################
# Author    : plr
##################################################################################################################
#tput setaf 0 = black
#tput setaf 1 = red
#tput setaf 2 = green
#tput setaf 3 = yellow
#tput setaf 4 = dark blue
#tput setaf 5 = purple
#tput setaf 6 = cyan
#tput setaf 7 = gray
#tput setaf 8 = light blue
##################################################################################################################

tput setaf 3;
echo "################################################################"
echo "Update Repositories"
echo "################################################################"
echo;tput sgr0

sudo apt update

#starship Prompt
curl -sS https://starship.rs/install.sh | sh 

sudo apt update


func_install() {
	if dpkg -l | grep ^$1 &> /dev/null; then
		tput setaf 2
  		echo "###############################################################################"
  		echo "################## The package "$1" is already installed"
      	echo "###############################################################################"
      	echo
		tput sgr0
	else
    	tput setaf 3
    	echo "###############################################################################"
    	echo "##################  Installing package "  $1
    	echo "###############################################################################"
    	echo
    	tput sgr0
    	sudo apt -y install $1 
    fi
}


###############################################################################
echo "Installation of the all packages"
###############################################################################

list=(

#Application-List--------------------------------------------------------------	
libreoffice
mousepad
gdebi
geany
keepassxc
exa
flameshot
font-manager
geany-plugins
gpa
htop
qt5-style-kvantum
meld
qbittorrent
qutebrowser
redshift
syncthing
terminator
vlc
android-file-transfer
galculator
gnome-disk-utility
filezilla 
timeshift
stacer
yt-dlp
audacious
gimp
grsync
gnome-clocks
qemu
virtmanager
tor
npm
uvicorn
xclip
puddletag
stardict
ibus
caffeine
ibus-m17n

)

count=0

for name in "${list[@]}" ; do
	count=$[count+1]
	tput setaf 3;echo "Installing package nr.  "$count " " $name;tput sgr0;
	func_install $name
done

###############################################################################

tput setaf 2;
echo "################################################################"
echo "Packages has been installed"
echo "################################################################"
echo;tput sgr0
