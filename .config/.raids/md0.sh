
yes | mdadm --create --verbose /dev/md0 --quiet --force --assume-clean --level=0 --raid-devices=2 /dev/sda /dev/sdb

