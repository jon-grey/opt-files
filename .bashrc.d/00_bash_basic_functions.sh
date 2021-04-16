
# TIME

timestamp() {
	date +"%s"
}

timenow() {
	date +"%T"
}

datetime(){
	date "+%Y%m%d-%H%M%S" #add %3N as we want millisecond too
}

# VARIABLES MANIPULATION

tailstr() {
	if [ $# != 2 ]; then
		return 1;
	fi

	local n="$1"
	local str="$2"

	echo "${str:${#str} - $n}"

}

isempty() {
	if [ -z "$@" ]; then
		return 1
	else
		return 0
	fi

}

# STRING

_R() {
	if [ -f "/opt/bin/underscorer.py" ]; then
		local dirname=$(python3.7 /opt/bin/underscorer.py "$@")
		echo $dirname
	fi
}

_r() {
	_R $(lower $@)
}

lower() {
	echo $@ | tr 'A-Z' 'a-z'
}


# FILE MANIPULATION


_touch() {
	local fname="$(_r $@)"
	touch $fname
}

_TOUCH() {
	local fname="$(_R $@)"
	touch $fname
}

_MKDIR() {
	local dirname=$(_R $@)
	if [[ -n $dirname ]]; then
		mkdir -p $dirname
	fi
}

_mkdir() {
	_MKDIR $(lower $@)
}

_mv() {
	local newpath=$(_r $@)
	mv "$@" $newpath
}

_MV() {
	local NEWPATH=$(_R $@)
	mv "$@" $NEWPATH
}

lowercase_all() {
	if [ $# != 1 ]; then
		return 1;
	fi


	local indir="$1"
	if [ -z "$indir" ]; then
		indir="."
	fi

	#change name of dirs
	for i in $(find $indir -type d | grep [A-Z] | sort -f -r); do mv -i $i `echo $i | tr 'A-Z' 'a-z'`; done
	#change name of files
	for i in $(find $indir -type f | grep [A-Z] | sort -f -r); do mv -i $i `echo $i | tr 'A-Z' 'a-z'`; done

}


# FILE CONTENT 

is_line_in_file() {
	if [ $# != 2 ]; then
		return 1;
	fi

	local line="$1"
	local fileName="$2"
	if grep -Fxq "$line" "$fileName"; then return 0; else return 1; fi
}

append_line_to_file() {
	if [ $# != 2 ]; then
		return 1;
	fi

	local line="$1"
	local fileName="$2"
	if is_line_in_file "$line" "$fileName"; then
		echo [INFO] Line "$line" is present in "$fileName"
		return 0
	else
		echo -e "\n" >> "$fileName"
		echo $line >> "$fileName"
		echo -e "\n" >> "$fileName"
		return 1
	fi
}


# SYSTEM MANIPULATION

bashinfo() {
	echo '# BASH BUILTINS #'
	compgen -b 
	echo '# BASH KEYWORDS #'
	compgen -k
}

mkdevnull() { 
	mknod /dev/null c 1 3
	chmod 666 /dev/null
}

resetperms() {
	chmod -Rf 644 *
	find -type d -exec chmod 0755 {} \;
	find . -type f -name  "*.sh" -exec chmod +x {} \;
	find . -type f -name  "*.py" -exec chmod +x {} \;
}

asudo() {
	type -a $@ | grep -o -P "(?<=\`).*(?=')" | xargs sudo
}

