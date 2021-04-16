#!/bin/bash +e

echo "[INFO] Executing FILE ${BASH_SOURCE[0]} LOCKING"

if [ "${PROFILE_SOURCED}" == 'true' ]; then
  return
else
  PROFILE_SOURCED='true'
fi


echo "[INFO] Executing FILE ${BASH_SOURCE[0]} HOOKS"


if [ -f /opt/.bashrc ]; then
  . /opt/.bashrc
fi

echo "[INFO] Executing FILE ${BASH_SOURCE[0]} BEGIN"
if [ -d /opt/.profile.d ]; then
  for i in /opt/.profile.d/*.sh; do
    if [ -r $i ]; then
      echo $i
      . $i || true
    fi
  done
  unset i
fi


echo "[INFO] Executing FILE ${BASH_SOURCE[0]} END"
unset VERBOSE
