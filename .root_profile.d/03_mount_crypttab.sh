
NAMES="$(awk -F' ' '{print $1}' /etc/crypttab)"

#for n in $NAMES; do
#	if [[ "$n" != "#"* ]]; then
#		if [[ "$n" == "luks"* ]]; then
#			cryptdisks_start $n
#			if [ $? != 0 ]; then
#				cryptsetup luksOpen /dev/md0 luks-23d95fd0-93eb-453d-8fe2-df724ebd81d1 --key-file /etc/luks-keys/luks-23d95fd0-93eb-453d-8fe2-df724ebd81d1
#			fi
#		fi
#	fi
#done
