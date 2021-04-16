
PYGTK2="
python-gtk2      
python-gtk2-dbg  
python-gtk2-dev  
python-gtk2-doc
"

for a in $PYGTK2; do
	if ! (dpkg -s $a &> /dev/null); then
		apt install $a -y -q 
	fi
done
