
My super opt files. Each time I was installing something, I have put it in .root_profile.d 
so that next time, some script dd__something.sh will do it for me.

Some of my configs are here too, ie. for tmux where im using F1 as trigger instead of ctrl+b or ctrl+a.

To make it auto install/update, please clone files from 
https://github.com/jon-grey/opt-files-root to /root

After unpacking those files to /opt (ie. /opt/.root_profile.d) simply do

```sh
sudo -i
. /opt/.root_profile
```
