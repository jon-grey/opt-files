
if [ ! -f "/opt/bin/kompose" ]; then
	# Linux
	curl -L https://github.com/kubernetes/kompose/releases/download/v1.19.0/kompose-linux-amd64 -o kompose
	chmod +x kompose
	sudo mv ./kompose /opt/bin/kompose
fi

