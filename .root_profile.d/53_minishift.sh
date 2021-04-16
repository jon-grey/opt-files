#!/bin/bash

MINISHIFT_DIR="minishift-1.34.3-linux-amd64"
MINISHIFT_TGZ="${MINISHIFT_DIR}.tgz"
MINISHIFT_PATH="/opt/minishift"

(
if ! ($MINISHIFT_PATH/minishift version &> /dev/null); then
	echo "[INFO] START Installing minishift."
	if ! (file /opt/tgz/$MINISHIFT_TGZ | grep 'gzip compressed data' -q); then 
		curl -L https://github.com/minishift/minishift/releases/download/v1.34.3/$MINISHIFT_TGZ -o /opt/tgz/$MINISHIFT_TGZ
	fi
	ls -la /opt/tgz
	rm -Rf /opt/$MINISHIFT_DIR
	rm -Rf /opt/minishift
	tar -xzf "/opt/tgz/$MINISHIFT_TGZ" --directory "/opt"
	ln -s "/opt/$MINISHIFT_DIR" /opt/minishift
	$MINISHIFT_PATH/minishift start
	echo "[INFO] Done installing minishift."
fi


if ($MINISHIFT_PATH/minishift version &> /dev/null); then
	echo "[INFO] Add minishift to PATH."
	export PATH="$MINISHIFT_PATH:$PATH"
  export PATH="/home/jag/.minishift/cache/oc/v3.11.0/linux:$PATH"

	#$MINISHIFT_PATH/minishift start || true
	#export MINISHIFT_OC_ENV=$($MINISHIFT_PATH/minishift oc-env || true)
	#if [[ "$MINISHIFT_OC_ENV" == *"export"* ]]; then
	#	eval $MINISHIFT_OC_ENV
	#fi
fi
) &
