#!/bin/bash

#append_line_to_file "/opt/snapd /var/lib/snapd none rbind 0 0" /etc/fstab
#
#if [ $? == 1 ]; then
#	if [ ! -d /opt/snapd ]; then
#		rsync -qazP /var/lib/snapd/ /opt/snapd
#	fi
#	
#	if [ -d /var/lib/snapd ]; then
#		umount /var/lib/snapd &> /dev/null
#		if [ ! -z /var/lib/snapd ]; then
#			mv /var/lib/snapd /var/lib/snapd.bkp
#		fi
#	fi
#	
#	mkdir -p /var/lib/snapd
#	mount /var/lib/snapd &> /dev/null
#fi

snaps="opera chromium drawio vlc youtube-dl inkscape e-tools postman"
for app in $snaps; do
	snap install $app --no-wait &> /dev/null
done

snaps_classic="multipass code"
for app in $snaps_classic; do
	snap install $app --classic --no-wait &> /dev/null
done

snaps_beta_devmode="anbox "


snap install anabox --beta --devmode --no-wait &> /dev/null
