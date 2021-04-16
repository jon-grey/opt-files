#!/bin/bash


apps="xclip rename clipit 
gnome-tweaks gnome-shell 
chrome-gnome-shell 
ubuntu-gnome-desktop 
ncdu htop wget lzip unzip
slop
"

for a in $apps; do
	if ! (dpkg -s $a &> /dev/null); then
		apt install $a -y -qq 
	fi
done

