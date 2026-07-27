# This is my personal home directory framework on Raspberry-Pi

- My goal is to use a nano-computer for ecological impact parsimony.
-  This git repository is used for backup and also to share if it may help.

## Building a RasPi workstation and configuring it

- Please refer to [this documentation](https://github.com/vthierry/home-on-RasPi/raw/main/bin/RasPi-as-tiny-workstation.pdf]

## Installing the home directory

Very simply:
- (i) Fork the [home-on-RasPi.git](https://github.com/vthierry/home-on-RasPi) on github.
     We assume you have a free GitHub account and is a bit familiar with the platform.
- (ii) Then executes these commands allowing to get the `.git` data base.

- `git clone git@github.com:$USERNAME/home-on-RasPi.git /tmp`
- `mv /tmp/home-on-RasPi/.git $HOME` 
- `cd $HOME ; git checkout .`
- `/bin/rm -rf /tmp/home-on-RasPi`

Your home directory is now under git control with all useful elements.

## File organization

- `~/.gitignore` defines private directories that must not be shared.
- `~/.bashrc` and `~/bin` contain useful user defined command.

## Updating all elements

- Carefully edit the  `~/bin/update` script at your own convinience.
  - In particular the removed and installed packages you want.
  - Consider this script as (i) an installation script (ii) a reminder of what has been installed.
  - It is strongly advised to update this `update` script if you add or remove packages in order to maintain your installation reproducible.
  



