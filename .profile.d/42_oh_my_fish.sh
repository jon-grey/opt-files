

if [ -d /opt/oh-my-fish ]; then
  if [ ! -h $HOME/.local/oh-my-fish ]; then
    mkdir -p $HOME/.local
    ln -s /opt/oh-my-fish $HOME/.local/oh-my-fish
  fi
fi

if [ ! -h $HOME/.config/oh-my-fish.conf ]; then
  ln -s /opt/.config/oh-my-fish.conf $HOME/.config/oh-my-fish.conf
fi
