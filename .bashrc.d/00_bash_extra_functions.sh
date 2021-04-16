#!/bin/bash



# LOGGING

export MY_LOGS=$HOME/var/log
export VIM_LOG_DIR=$MY_LOGS/vim_history
export BASH_LOG_DIR=$MY_LOGS/bash_history
export TMUX_LOG_DIR=$MY_LOGS/tmux_history

mkdir -p $MY_LOGS $VIM_LOG_DIR $BASH_LOG_DIR $TMUX_LOG_DIR >> /dev/null

export TMUX_LOG=$TMUX_LOG_DIR/tmux_history.log
export BASH_LOG=$BASH_LOG_DIR/bash_history.log
export VIM_LOG=$VIM_LOG_DIR/vim_history.log

touch $TMUX_LOG $BASH_LOG $VIM_LOG

vimlogger() {
	if [ ! -f "$VIM_LOG" ]; then
		touch $VIM_LOG
	fi 

	while true; do
		sleep 0.1
		local out="$(tail -n 1 $VIM_LOG)"
		if [ ! -z "$out" ]; then
			echo  >>  $VIM_LOG
		fi
	done
}

viml() {
	# still broken,
	# vimlogger &
	# VIMLOGGER_PID=$!
	vim -w $VIM_LOG "$@"
	# pkill -9 vimlogger || kill -9 $VIMLOGGER_PID

}

