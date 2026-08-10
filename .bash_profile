# Login bash commands

## Starts the ssh agent and adds the main user ssh key
/usr/bin/ssh-agent | grep '^SSH_' > /tmp/.ssh_env
chmod 600 /tmp/.ssh_env ; . /tmp/.ssh_env ;  /bin/rm  /tmp/.ssh_env
lxterminal --profile=xterm --geometry=120x1 --command="bash -c 'ssh-add .ssh/id_rsa ; read cont'"






