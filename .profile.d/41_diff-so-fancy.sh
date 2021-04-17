
#if ! test /opt/diff-so-fancy; then
#  git clone https://github.com/so-fancy/diff-so-fancy /opt/diff-so-fancy
#done
#chmod +x /opt/diff-so-fancy/diff-so-fancy

if [[ ! "$PATH" == */opt/diff-so-fancy* ]]; then
    export PATH="$PATH:/opt/diff-so-fancy"
fi

