

apps="python python3 python-pip python3-pip python-argcomplete"
for a in $apps; do
    if ! (dpkg -s $a &> /dev/null); then
        apt install $a -y -qq 
    fi
done
