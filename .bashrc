# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
stty stop undef
stty start undef

HISTIGNORE='rm *:sudo rm *'

alias ll='ls -lhsaF'
alias fig='docker-compose'
alias vim='vim -o'
alias mysql='mysql --pager=less'

color_prompt=1
auto_attach_screen=0
use_ssh_agent=0


function gitBranch() {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/:\1/';
}

if [ "$color_prompt" -eq 1 ]; then
  TERM=xterm-256color
  PS1='\[\e[32m\]\u@\h\[\e[m\] \[\e[34m\]\w\[\e[m\]$(gitBranch) \[\e[34m\]\$\[\e[m\] '
else
  PS1='[\u@\h \W$(gitBranch)]\$ '
fi;
unset color_prompt

if [ "$auto_attach_screen" -eq 1 ]; then
  [[ -z $STY ]] && screen -RD $USER;
fi;
unset auto_attach_screen

if [ "$use_ssh_agent" -eq 1 ]; then
  SSH_KEY_TTL_SECOND=32400 # 9hours
  SSH_KEY=$HOME/.ssh/id_ed25519
  SSH_AGENT_FILE=$HOME/.ssh-agent_info

  test -f $SSH_AGENT_FILE && source $SSH_AGENT_FILE > /dev/null 2>&1

  if ssh-add -l > /dev/null 2>&1 && [ $? -eq 0 ]; then
      echo "ssh-agent still runnig. pid: $SSH_AGENT_PID"
  else
      echo 'ssh-agent not running.'
      ssh-agent -t $SSH_KEY_TTL_SECOND > $SSH_AGENT_FILE
      source $SSH_AGENT_FILE > /dev/null 2>&1
      ssh-add $SSH_KEY
  fi

  unset SSH_AGENT_FILE
  unset SSH_KEY_TTL_SECOND
fi;
unset use_ssh_agent
