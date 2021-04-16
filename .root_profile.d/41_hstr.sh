
##!/bin/bash

if ! (which hstr >> /dev/null); then
	echo -e "\n" | add-apt-repository ppa:ultradvorka/ppa -y 2> /dev/null
	apt-get update -y -qq 2> /dev/null
	sudo apt-get install hstr -y -qq 2> /dev/null
fi

if (which hstr >> /dev/null); then
	str_hstr_config=$(hstr --show-configuration)
	
	if [ ! -f /opt/.bashrc.d/41_hstr.sh ]; then 
		echo -e "\n" > /opt/.bashrc.d/41_setup_bash.sh
		echo "$str_hstr_config" >> /opt/.bashrc.d/41_setup_bash.sh
		echo -e "\n" >> /opt/.bashrc.d/41_setup_bash.sh
	fi 
	. /opt/.bashrc.d/41_setup_bash.sh
fi

