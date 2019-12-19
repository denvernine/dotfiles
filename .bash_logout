# ~/.bash_logout

eval `ssh-agent -k`
ssh-add -D
unset SSH_AGENT_KEY
