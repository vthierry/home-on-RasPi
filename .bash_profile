## Starts the ssh-agent to ease git manipulations
ssh-agent &
### Adds the user main key
(sleep 2 ; lxterminal --profile=xterm --geometry=120x1 --command="bash -c 'ssh-add .ssh/id_rsa ; read cont'") &




