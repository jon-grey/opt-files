

ppa="ppa:papirus/papirus"
app="papirus-icon-theme"


if ! (dpkg -s $app &> /dev/null); then

	if ! (grep -q "^deb .*$ppa" /etc/apt/sources.list /etc/apt/sources.list.d/*); then
		add-apt-repository $ppa -y -qq &> /dev/null

		sudo apt-get update -y -qq &> /dev/null
		sudo apt-get upgrade -y -qq &> /dev/null
		sudo apt autoremove -y -qq &> /dev/null




	fi

	if ! (dpkg -s $a &> /dev/null); then
		apt install $a -y -qq &> /dev/null
	fi


fi
