#!/usr/bin/env bash

for a in "xterm tmux screen"; do
  if ! (command -v $a); then
    apt install $a -y -q 
  fi
  unset a
done

