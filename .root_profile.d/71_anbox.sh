
if (anbox version &> /dev/null); then

	ppa="ppa:morphis/anbox-support"
	if ! grep -q "^deb .*$ppa" /etc/apt/sources.list /etc/apt/sources.list.d/*; then
		add-apt-repository $ppa -y -qq &> /dev/null

		sudo apt-get update -y -qq &> /dev/null
		sudo apt-get upgrade -y -qq &> /dev/null
		sudo apt autoremove -y -qq &> /dev/null
	fi

	apps="
	linux-headers-generic 
	anbox-modules-dkms 
	wget lzip unzip squashfs-tools
	"


	for a in $apps; do
		if ! (dpkg -s $a &> /dev/null); then
			apt install $a -y -qq &> /dev/null
		fi
	done


	wget https://raw.githubusercontent.com/geeks-r-us/anbox-playstore-installer/master/install-playstore.sh -O /opt/.config/playstore_install.sh
	chmod +x /opt/.config/playstore_install.sh
	/opt/.config/playstore_install.sh

fi

