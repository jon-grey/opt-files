
apt update -y -q
apt upgrade -y -q

apps="curl wget procmail"
for a in $apps; do
	if ! (which $a >> /dev/null); then
		apt install $a -y -q 
	fi
done
unset a
