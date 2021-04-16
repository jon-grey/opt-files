
for d in {.tmux.conf,.tmux}; do
	if [ ! -h $HOME/$d ]; then
		if [ -f $HOME/$d ]; then
			mv $HOME/$d $HOME/$d.bkp
		fi
		ln -s /opt/.config/$d $HOME/$d
	fi
done

alias tls='tmux list-sessions'
alias tsog='tmux show-options -g'
alias tsos='tmux show-options -s'
alias tsow='tmux show-options -w'

alias .tc='vim ~/.tmux.conf'
alias .td='vim ~/.tmuxp/default.yaml'
alias .twu='vim ~/.tmuxp/mwwu.yaml'
alias .twp='vim ~/.tmuxp/mwwp.yaml'
alias .tmy='vim ~/.tmuxp/mstuff.yaml'

alias tld='tmuxp load $HOME/.tmuxp/default.yaml -y'
alias tlwp='tmuxp load $HOME/.tmuxp/mwwp.yaml -y'
alias tlwu='tmuxp load $HOME/.tmuxp/mwwu.yaml -y'
alias tlmy='tmuxp load $HOME/.tmuxp/mstuff.yaml -y' 

alias ttw='gnome-terminal.real --tab -- tmuxp load $HOME/.tmuxp/mwwp.yaml && tmuxp load $HOME/.tmuxp/mwwu.yaml'
alias twd='gnome-terminal.real --window -- tmuxp load $HOME/.tmuxp/default.yaml'
alias twu='gnome-terminal.real --window -- tmuxp load $HOME/.tmuxp/mwwu.yaml'
alias twp='gnome-terminal.real --window -- tmuxp load $HOME/.tmuxp/mwwp.yaml'
alias twmy='gnome-terminal.real --window -- tmuxp load $HOME/.tmuxp/mstuff.yaml'
alias tww='gnome-terminal.real \
	--window -e "tmuxp load $HOME/.tmuxp/mwwp.yaml" \
	--tab -e "tmuxp load $HOME/.tmuxp/mwwu.yaml"'
alias twa='gnome-terminal.real \
	--window -e "tmuxp load $HOME/.tmuxp/mwwp.yaml" \
	--tab -e "tmuxp load $HOME/.tmuxp/mwwu.yaml" \
	--tab -e "tmuxp load $HOME/.tmuxp/mstuff.yaml" \
	'


alias t9t='tmux kill-session -t'
alias t9a='tmux kill-session -a'
alias t9s='tmux kill-server'

#############################################################################################################
############ Open tmuxp sessions at the same time for wwu wwp and mstuff ####################################


tall1() { # open all in one window, 3 tabs
	twa
}

tall2() { # open wwp and wwu in one window tabs, mstuff in other window
	tww
	tmy	
}

tall3() { # open in 3 different windows
	twwu
	twwp
	tmy
}

tall() { # as default is to open wwp and wwu in same window, mstuff in other
	tall2
}
