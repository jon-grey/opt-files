
# My super opt files. 

What I really care in here is aliases, terminal look, auto updates, config and installation of some soft.

# Why I did it?

Each time I was doing something repetable, I have also put it in .root_profile.d 
So that next time, some script dd__something.sh will do it for me.

# How to set it up

To make it auto install/update, please clone files from 
https://github.com/jon-grey/opt-files-root to /root

After unpacking those files to /opt (ie. /opt/.root_profile.d) simply do

```sh
sudo -i
. /opt/.root_profile
```

# What is does?

## Aliases

### git

![image](https://user-images.githubusercontent.com/70474131/115072575-110bdc00-9ef8-11eb-82aa-26877c581c22.png)

### docker

![image](https://user-images.githubusercontent.com/70474131/115072678-1d903480-9ef8-11eb-9769-eaa79f3ff1a0.png)

### maven

![image](https://user-images.githubusercontent.com/70474131/115073395-92fc0500-9ef8-11eb-98f5-d00b08222ac8.png)

## Terminal look

### normal user

![image](https://user-images.githubusercontent.com/70474131/115072512-fe91a280-9ef7-11eb-8469-5974128f9a65.png)

### sudo 

![image](https://user-images.githubusercontent.com/70474131/115072488-f76a9480-9ef7-11eb-9f2a-14bb94a144b7.png)

## Configs

Some of my configs are here too, ie. `.config/.tmux.conf` for tmux where im using F1 as trigger instead of ctrl+b or ctrl+a.

