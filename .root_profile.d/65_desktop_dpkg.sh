#!/bin/bash


for a in /opt/dpkg/*; do
    if ! (dpkg -s $a &> /dev/null); then
	echo "[INFO] dpkg install $a"
        dpkg -i $a >> /dev/null
    fi
done
