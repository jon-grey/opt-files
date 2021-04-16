

export NVM_DIR="/opt/nvm"
if [ -s "$NVM_DIR/nvm.sh" ]; then
	echo "[INFO] Load $NVM_DIR/nvm.sh" 
	. "$NVM_DIR/nvm.sh"  # This loads nvm
else
	echo "[ERROR] Can not found $NVM_DIR/nvm.sh" 
fi

if [ -s "$NVM_DIR/bash_completion" ]; then
	echo "[INFO] Load $NVM_DIR/bash_completion" 
	. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
else
	echo "[ERROR] Can not found $NVM_DIR/bash_completion"
fi
