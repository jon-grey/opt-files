#!/bin/bash


if [ ! -d "/opt/Bash-Snippets" ]; then
	mkdir -p /opt/install
	cd /opt/install
	git clone https://github.com/alexanderepstein/Bash-Snippets
	cd Bash-Snippets
	git checkout v1.23.0
	./install.sh --prefix=/opt/Bash-Snippets all
fi
