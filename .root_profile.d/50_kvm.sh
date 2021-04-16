#!/bin/bash

if [ $UID != 0 ]; then 
        exit 0
fi

if ! (virsh --version &> /dev/null); then 
        echo "[INFO] Libvirt and qemu-kvm installing"
	apt install qemu-kvm libvirt-daemon libvirt-daemon-system -y
	echo "[INFO] Add yourself to the libvirt(d) group:"
	usermod -a -G libvirt $(whoami)
	echo "[INFO] Add jag to the libvirt(d) group:"
	usermod -a -G libvirt jag || true
	echo "[INFO] Set sudo as main group of yourself:"
	usermod -g sudo $(whoami)
	echo "[INFO] Set sudo as main group of jag:"
	usermod -g sudo jag || true
	#echo "[INFO] Update your current session to apply the group change:"
	#newgrp libvirt 	
	echo "[INFO] As root, install the KVM driver binary and make it executable as follows:"
	curl -L https://github.com/dhiltgen/docker-machine-kvm/releases/download/v0.10.0/docker-machine-driver-kvm-ubuntu16.04 -o /usr/local/bin/docker-machine-driver-kvm
	chmod +x /usr/local/bin/docker-machine-driver-kvm
	echo "[INFO] If libvirtd is not active, start the libvirtd service:"
	systemctl start libvirtd
	echo "[INFO] Check the status of libvirtd:"
	systemctl is-active libvirtd
	echo "[INFO] Start the default libvirt network:"
	virsh net-start default
	echo "[INFO] Now mark the default network as autostart:"
	virsh net-autostart default


fi
