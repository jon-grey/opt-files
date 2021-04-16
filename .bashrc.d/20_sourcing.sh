


# SOURCING

source_completion() {

	this="$1"
	if command -v $this &>/dev/null; then
		source <($this completion bash) || true
	fi
}

echo_src_safe() {
	echo "$1"
	if [ -f "$1" ]; then
		source "$1" || true
	fi
}

echo_src_completion_safe() {
	echo "$1"
	if [ -f "$1" ]; then
		source_completion $1 || true
	fi
}


