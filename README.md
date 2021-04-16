
# My super opt files. 

What I really care in here is aliases, terminal look, auto updates, config and installation of some soft.

## Todo

[ ] - Oneday add submodules. 

# Why I did it?

Each time I was doing something repetable, I thought to maybe automate it. 

And then?

Then one day this baby was born! Awesome...

From this day, each time I do something repetable, I'm also putting it as script in dirs such as `.bashrc.d`, `.profile.d`, `.root_bashrc.d`, or `.root_profile.d.`. 

So that next time I open my terminal, some script `/opt/{.bashrc.d,.profile.d}/dd_something.sh` will source some stuff for me.

Next time I login as root, some script `/opt/{.root_bashrc.d,.root_profile.d}/dd_something_elsevhere.sh` will also install some stuff for me.

# How to set it up

To make it auto install/update, please clone files from 
https://github.com/jon-grey/opt-files-root to /root

After unpacking those files to /opt (ie. /opt/.root_profile.d) simply do

```sh
sudo -i
. /opt/.root_profile
```

# How does it work?

## As normal user
Its sourcing files in `/opt/.profile*` and `/opt/.bashrc*`

![image](https://user-images.githubusercontent.com/70474131/115073821-25040d80-9ef9-11eb-8da9-611d3eff6f02.png)

## sudo su

![image](https://user-images.githubusercontent.com/70474131/115073859-32b99300-9ef9-11eb-9b52-5a080d07050b.png)


## sudo -i

![image](https://user-images.githubusercontent.com/70474131/115073886-3ea55500-9ef9-11eb-917a-2114b4abb64b.png)

![image](https://user-images.githubusercontent.com/70474131/115073924-46fd9000-9ef9-11eb-9036-22c761b69f46.png)

> here some update
 
![image](https://user-images.githubusercontent.com/70474131/115073953-5250bb80-9ef9-11eb-8d38-c5cd8f70fce6.png)


# What it does?

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

