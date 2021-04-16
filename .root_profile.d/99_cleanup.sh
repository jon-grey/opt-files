

for l in /tmp/opt.*.lock.*; do
	if [ -f $l ]; then
    echo "[INFO] removing lock $l"
		rm -rf $l
	fi
done
