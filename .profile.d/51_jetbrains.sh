
export JETBRAINS_HOME='/opt/JetBrains'
export JETBRAINS_BIN=$JETBRAINS_HOME/bin
export JETBRAINS_TOOLBOX_BIN=$JETBRAINS_HOME/Toolbox/bin
export JETBRAINS_PATH="$JETBRAINS_BIN:$JETBRAINS_TOOLBOX_BIN"

if [[ "$PATH" != *"$JETBRAINS_PATH"* ]]; then
	export PATH="$PATH:$JETBRAINS_PATH"
fi

if [[ "$PATH" != *"$JETBRAINS_BIN"* ]]; then
	export PATH="$PATH:$JETBRAINS_BIN"
fi

if [ ! -h $HOME/.local/share/JetBrains ]; then
	if [ -d $HOME/.local/share/JetBrains ]; then
		rm $HOME/.local/share/JetBrains
	fi
	if [ -d $HOME/.local/share ]; then
		ln -s /opt/JetBrains $HOME/.local/share/JetBrains
	fi
fi


