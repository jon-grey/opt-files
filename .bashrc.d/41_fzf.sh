
#
## Use ag for feeding into fzf for searching files.
#export FZF_DEFAULT_COMMAND='ag -U --hidden --ignore .git -g ""'
## Color: https://github.com/junegunn/fzf/wiki/Color-schemes - Solarized Dark
## Bind F1 key to toggle preview window on/off
#export FZF_DEFAULT_OPTS='--bind "F1:toggle-preview" --preview "rougify {} 2> /dev/null || cat {} 2> /dev/null || tree -C {} 2> /dev/null | head -100" --color dark,hl:33,hl+:37,fg+:235,bg+:136,fg+:254 --color info:254,prompt:37,spinner:108,pointer:235,marker:235'
#
## Show long commands if needed
## From https://github.com/junegunn/fzf/wiki/Configuring-shell-key-bindings
## Bind F1 key to toggle preview window on/off
#export FZF_CTRL_R_OPTS='--bind "F1:toggle-preview" --preview "echo {}" --preview-window down:3:hidden:wrap'

something="xargs -I % sh -c 'git show --color=always %' | diff-so-fancy"
_viewGitLogline="echo {} | grep -o '[a-f0-9]\{7\}' | head -1 | $something"
_gitLogLineToHash="echo {} | grep -o '[a-f0-9]\{7\}' | head -1"

fg () {

  git log \
      --reverse \
      --color=always \
      --format="%C(cyan)%h %C(blue)%ar%C(auto)%d \
                %C(yellow)%s%+b %C(black)%ae" "$@" \
  | fzf -i -e +s \
    --reverse \
    --tiebreak=index \
    --no-multi \
    --ansi \
    --preview="$_viewGitLogline" \
    --header "enter: view, C-c copy hash" \
    --bind "enter:execute:$_viewGitLogLine | less -R" \
    --bind "ctrl-c:execute:$_gitLogLineToHash | 
            xclip -r -selection clipboard"
}


