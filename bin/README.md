# This is my personal home directory on RaspberryPi

- My goal is to use a nano-computer for ecological impact parsimony.
-  This git repositoty is used to backup and also to share if it may help.

## File organization

- `~/.gitignore` defines private directories that must not be shared.
- `~/.bashrc` and `~/bin` contain useful user defined command.

## Installing the repository 

Very simply
- (i) Fork the home-on-RasPi.git on github.
- (ii) Then executes these commands allowing to get the `.git` data base.

- `git clone git@github.com:$USERNAME/home-on-RasPi.git /tmp`
- `mv /tmp/home-on-RasPi.git/.git $HOME` 
- `cd $HOME ; git checkout .`
- `/bin/rm -rf /tmp/home-on-RasPi`

Yout home directroy is now under git control with all useful elements.




