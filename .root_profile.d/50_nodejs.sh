#!/usr/bin/env bash
              
export NVM_DIR="/opt/nvm"

if [ -z "$NVM_DIR" ]; then
	echo "[ERROR] NVM_DIR is not defined. Abort."
  return
fi

if ! (command -v nvm &> /dev/null ); then
  echo "[INFO] Installing node"
  git clone https://github.com/nvm-sh/nvm.git "$NVM_DIR"
  cd $NVM_DIR
  git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`
fi

if (command -v nvm &> /dev/null); then
	if ! (command -v node &> /dev/null); then
	  . "$NVM_DIR/nvm.sh"
	  nvm install node
	fi
fi

if (command -v node &> /dev/null); then
	if ! (command -v ng &> /dev/null); then
		echo "[INFO] Installing angular/cli@8 (ng)"
		echo -e "no\n" | npm install -g @angular/cli --scripts-prepend-node-path=true --no-audit
	fi

	if ! (command -v tns &> /dev/null); then 
		echo "[INFO] Installing nativescript (tns)"
		echo -e "no\n" | npm install -g nativescript --scripts-prepend-node-path
	fi

fi
