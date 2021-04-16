
git_completion_download() {
  if [ ! -d /opt/.completion ]; then
    mkdir /opt/.completion
  fi

  if [ ! -f /opt/.completion/.git-completion.bash ]; then
    echo Download /opt/.completion/.git-completion.bash
    #curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash > $HOME/.completion/.git-completion.bash
    curl https://raw.githubusercontent.com/git/git/v$GIT_V_NEW/contrib/completion/git-completion.bash > /opt/.completion/.git-completion.bash
  fi
}


GIT_V=$(git --version)
GIT_V_NEW=2.28.0

if (python3 /opt/bin/cmp_versions.py $GIT_V gt $GIT_V_NEW); then
  echo "[INFO] Git VERSION ${GIT_V} is gt $GIT_V_NEW. Abort"
  exit
else


  (
	  apt install -y make libssl-dev libghc-zlib-dev libcurl4-gnutls-dev libexpat1-dev gettext unzip
	
	  if [ ! -d /opt/src/git ]; then
	    mkdir -p /opt/src
	    git clone -b v$GIT_V_NEW --single-branch https://github.com/git/git.git /opt/src/git
	  fi 
	
	  cd /opt/src/git
	  make prefix=/usr/local all
	  make prefix=/usr/local install
	
	  apt remove git -y
	
	  if [ ! -f /usr/bin/git ]; then
	    ln -s /usr/local/bin/git /usr/bin/git
	  fi
	
	  git_completion_download 

   )

fi




