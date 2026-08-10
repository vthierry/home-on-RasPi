# Login bash commands

## Starts the ssh agent and adds the main user ssh key
/usr/bin/ssh-agent | grep '^SSH_' > .ssh/SSH_ENV
chmod 600  .ssh/SSH_ENV ; . .ssh/SSH_ENV
lxterminal --profile=xterm --geometry=120x1 --command="bash -c 'ssh-add .ssh/id_rsa ; sleep 2'"






