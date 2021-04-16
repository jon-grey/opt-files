#!/bin/bash



#
#if (which lockfile &> /dev/null); then
#	if  (lockfile -r 0 ${OPT_PROFILE_LOCK} ); then
		. /opt/.bashrc || true
#	fi
#
#	if  (lockfile -r 0 ${OPT_BASHRC_LOCK} ); then
		. /opt/.profile || true
#	fi
#
#fi
