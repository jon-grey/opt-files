#!/usr/bin/env bash

if [ ! -d "/opt/miniconda3" ]; then

  INSTALLER="Miniconda3-latest-Linux-x86_64.sh"
  INSTALLER_DIR="/opt/.install"
  INSTALLER_PATH=$INSTALLER_DIR/$INSTALLER 
  INSTALLER_TARGET_PATH="/opt/miniconda3"

  if [ ! -d "$INSTALLER_DIR" ]; then
    mkdir -p $INSTALLER_DIR
    if [ ! -f "$INSTALLER_PATH" ]; then
      curl https://repo.continuum.io/miniconda/$INSTALLER -O
    fi
  fi
 
  chmod +x $INSTALLER_PATH
  $INSTALLER_PATH -u -b -p "$INSTALLER_TARGET_PATH"

fi


