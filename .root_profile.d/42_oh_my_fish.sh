
PATH_INSTALL=/opt/.config/.oh-my-fish.install
PATH_TARGET=/opt/oh-my-fish
PATH_CONFIG=/opt/.config/.oh-my-fish.conf

if [ ! -f "$PATH_INSTALL" ]; then
	curl -L https://get.oh-my.fish > $PATH_INSTALL
fi

if [ ! -d "$PATH_TARGET" ] ||  [ ! -d "$PATH_CONFIG" ]; then
		fish $PATH_INSTALL \
			--path="$PATH_TARGET" \
			--config="$PATH_CONFIG" \
			--noninteractive \
			--yes
fi

