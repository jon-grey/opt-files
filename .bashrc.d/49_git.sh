



githubinit() {

  echo "Do not forget to put ssh pub key to github settings"

  if [ "$#" -lt "2" ]; then
     echo "required [NEWREPO] USER EMAIL"
  fi

  local NEWREPO="$1"
  local USER="$2"
  local EMAIL="$3"

  if [ -z "$NEWREPO" ]; then
    NEWREPO="$PWD"
  fi;

  NEWREPO="$(basename $NEWREPO)"

  echo "Setting up git and github repo=$NEWREPO with USER=$USER EMAIL=$EMAIL"


  git init
  if [ $? -ne 0 ]; then
     echo "ERROR1"
     return $?
  fi

  git config --local user.email "$EMAIL"
  git config --local user.name "$USER"
  git config --local http.proxy ""

  if [ $? -ne 0 ]; then
     echo "ERROR2"
     return $?
  fi

  if ! (git lfs &>/dev/null); then 
     echo "GIT LFS not installed..." 
  else 
     git lfs install
     if [ $? -ne 0 ]; then
        echo "ERROR3"
        return $?
     fi
   
     git lfs track "*.a"
     if [ $? -ne 0 ]; then
        echo "ERROR4.1"
        return $?
     fi

     git lfs track "*.so"
     if [ $? -ne 0 ]; then
        echo "ERROR4.2"
        return $?
     fi
  fi

  git add -A
  git commit -m "First commit."
  git remote add origin git@github.com:${USER}/${NEWREPO}.git

  if [ $? -ne 0 ]; then
     echo "ERROR5"
     return $?
  fi

  echo "git remote -v..."
  git remote -v
  echo "git fetch..."
  git fetch
  echo "git pull origin master --allow-unrelated-histories..."
  git pull origin master --allow-unrelated-histories

  echo "git config -l"
  git config --local -l

  echo "git push --set-upstream origin master..."
  git push --set-upstream origin master

}

githubinit_dryrun() {
  local NEWREPO="$1"
  if [ -z "$NEWREPO" ]; then
    NEWREPO="$PWD"
  fi;

  echo githubinit "$NEWREPO" dryrun 'dryrun@dryrun.com'
}


git config --global alias.tree "log --graph --pretty=oneline --abbrev-commit"
git config --global alias.stree "!sh -c \"/opt/git-status-tree/bin/git-status-tree\""

alias g='git'
alias Gs='git submodule'
alias Gsa='git submodule add'

alias gS='git stash'

alias ga='git add'
alias gaa='git add -A'

alias gc='git commit'
alias gcm='git commit -m'
alias gca='git commit --amend'

alias gcl='git clone'

alias gp='git push'
alias gpm='git push origin HEAD:refs/for/master'
alias gpd='git push origin HEAD:refs/drafts/master'
alias gpb='git push origin $(gbc)'
alias gP='git pull'
alias gf='git fetch'

alias gC='git checkout'
alias gCm='git checkout master'
alias gCb='git checkout -b'

alias gb='git branch'
alias gbm='git branch master'
alias gbc='git rev-parse --abbrev-ref HEAD'

alias gs='git status'
alias gst='git stree'
alias gt='git tree'
alias gl='git log'
alias grl='git reflog'
alias gso='git show'
alias gg='git grep'

alias gr='git remote'
alias grso='git remote show origin'
alias grv='git remote -v'
alias grf='git remote fetch'
alias grsu='git remote set-url'
alias grsuo='git remote set-url origin'
alias gcgrou='git config --get remote.origin.url'
alias gcl='git config -l'

alias ag='alias | grep git'

echo_src_safe /opt/.completion/.git-completion.bash


