
apt install vim -y -qq &> /dev/null

#VIMDIR="/opt/.config/.vim"
#
#if [ ! -d "$VIMDIR/autoload" ] || [ ! -d "$VIMDIR/plugged" ]; then
#	mkdir -p $VIMDIR/{autoload,plugged}
#	git clone https://github.com/junegunn/vim-plug.git $VIMDIR/plugged/vim-plug
#	
#	if [ -f $VIMDIR/autoload ]; then
#		rm $VIMDIR/autoload
#	fi
#
#	ln -s $VIMDIR/plugged/vim-plug/plug.vim $VIMDIR/autoload
#fi
