#!/bin/bash

if [ ! -h "$HOME/.vim" ]; then
  if [ -d "$HOME/.vim" ]; then
    mv $HOME/.vim $HOME/.vim.bkp.$(datetime)
  fi
  ln -s "/opt/.SpaceVim" $HOME/.vim
fi



if [ ! -h "$HOME/.SpaceVim" ]; then
  if [ -d "$HOME/.SpaceVim" ]; then
    mv $HOME/.SpaceVim $HOME/.SpaceVim.bkp.$(datetime)
  fi
  ln -s "/opt/.SpaceVim" $HOME/.SpaceVim
fi



if [ ! -h "$HOME/.SpaceVim.d" ]; then
  if [ -d "$HOME/.SpaceVim.d" ]; then
    mv $HOME/.SpaceVim.d $HOME/.SpaceVim.d.bkp.$(datetime)
  fi
  ln -s "/opt/.config/.SpaceVim.d" $HOME/.SpaceVim.d
fi
