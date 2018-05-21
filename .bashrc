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

alias ll="ls -lhsaF"
alias fig="docker-compose"
alias screen="screen -U"
alias vim="vim -o"

COLOR_PROMPT=1
AUTO_ATTACH_SCREEN=0
USE_SSH_AGENT=0

if [ "$COLOR_PROMPT" -eq 1 ]; then
  function gitBranch() {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/:\1/';
  }

  TERM=xterm-256color
  PS1='\[\e[1;32m\]\u@\h\[\e[m\] \[\e[38;5;39m\]$(pwd)\[\e[m\]$(gitBranch) \[\e[38;5;39m\]\$\[\e[m\] '
else
  TERM=xterm
  PS1="[\u@\h \W]\$ ";
fi;
unset COLOR_PROMPT

if [ "$AUTO_ATTACH_SCREEN" -eq 1 ]; then
  [[ -z $STY ]] && screen -RD $USER;
fi;
unset AUTO_ATTACH_SCREEN

if [ "$USE_SSH_AGENT" -eq 1 ]; then
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
unset USE_SSH_AGENT
