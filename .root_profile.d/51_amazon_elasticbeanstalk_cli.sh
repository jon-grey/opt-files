#!/bin/bash

if ! (which eb &> /dev/null); then
	
	pip install awsebcli --upgrade	
	#mkdir /opt/aws
	#apt install build-essential zlib1g-dev libssl-dev libncurses-dev libffi-dev libsqlite3-dev libreadline-dev libbz2-dev
	#git clone https://github.com/aws/aws-elastic-beanstalk-cli-setup.git /opt/aws/.aws-elastic-beanstalk-cli-setup
	#/bin/bash /opt/aws/.aws-elastic-beanstalk-cli-setup/scripts/bundled_installer 
	#mv /root/.ebcli-virtual-env /opt/aws/.ebcli-virtual-env/
	#mv /root/.pyenv /opt/aws/.pyenv
	#sudo find /opt/aws/.ebcli-virtual-env -type f -exec sed -i -e 's/root/opt\/aws/g' {} \;
	#sudo find /opt/aws/.pyenv             -type f -exec sed -i -e 's/root/opt\/aws/g' {} \;
						

fi



