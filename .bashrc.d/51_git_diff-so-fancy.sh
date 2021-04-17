
skg () {
	git log \
        --color=always \
        --format="%C(auto)%h%d %s %C(black)%C(bold)%cr% C(auto)%an" \
        "$@" \
    | sk \
        --ansi \
        --reverse \
        --tiebreak=index \
        --no-multi \
        --preview $_viewGitLogLine \
        --header "enter to view, alt-y to copy hash" \
        --bind "enter:execute:$_viewGitLogLine | less -R" \
        --bind "alt-y:execute:$_gitLogLineToHash | xclip"
}

_viewGitLogLine="echo {} | grep -o '[a-f0-9]\{7\}' | head -1 | xargs -I % sh -c 'git show --color=always %' | diff-so-fancy"

_gitLogLineToHash="echo {} | grep -o '[a-f0-9]\{7\}' | head -1"