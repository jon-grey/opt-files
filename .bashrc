#!/bin/bash -e


echo "Executable $0, source $BASH_SOURCE"

alias show_script_info='
__shell__=$0
__main__=$_
__file__=${BASH_SOURCE[0]}
(return 0 2>/dev/null) && __sourced__="True" || __sourced__="False"
echo "Executing FILE $__file__ by SHELL $__shell__ (main : $__main__, source: $__sourced__) with UID $UID"
'

echo "[INFO] Executing FILE ${BASH_SOURCE[0]} LOCKING"

if [ "$BASHRC_LOCKED" == 'true' ]; then 
  return
else
  BASHRC_LOCKED='true'
fi


echo "[INFO] Executing FILE ${BASH_SOURCE[0]} BEGIN"

if [ -d /opt/.bashrc.d ]; then
  for i in /opt/.bashrc.d/*.sh; do
    if [ -r $i ]; then
      echo $i
      . $i || true

    fi
  done
  unset i
fi

# If not running interactively, don't do anything
if [ -z "$PS1" ]; then
  echo "[INFO] Bash in non-interactive mode, return..."
  return
fi

# bash functions are not available before this line <-

echo "[INFO] Source additional bash settings"

echo_src_safe /opt/.bashrc.bare || echo "Failed bash.bare"
echo_src_safe /opt/.bashrc.bashit || echo "Failed bashit"

echo "[INFO] Executing FILE ${BASH_SOURCE[0]} HOOKS"


echo "[INFO] Executing FILE ${BASH_SOURCE[0]} END"
