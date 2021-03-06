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

alias ll='ls -lhsaFv'
alias fig='docker-compose'
alias vim='vim -o'
alias mysql='mysql --pager=less'

function rand() {
  cat /dev/random | tr -dc 'a-zA-Z0-9' | fold -w $(echo -n ${1:-16}) | head -n 1;                                                                                                                                               
}

COLOR_PROMPT=on  # on/off
AUTO_ATTACH_SCREEN=on  # on/off
USE_SSH_AGENT=off  # on/off

function gitBranch() {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/:\1/';
}

if [ "${COLOR_PROMPT}" = on ]; then
  TERM=xterm-256color
  PS1='\[\e[32m\]\u@\h\[\e[m\] \[\e[34m\]\w\[\e[m\]$(gitBranch) \[\e[34m\]\$\[\e[m\] '
else
  TERM=xterm
  PS1='[\u@\h \W$(gitBranch)]\$ '
fi;
unset COLOR_PROMPT

if [ "${AUTO_ATTACH_SCREEN}" = on ]; then
  [[ -z "${STY}" ]] && screen -RD "${USER}";
fi;
unset AUTO_ATTACH_SCREEN

if [ "${USE_SSH_AGENT}" = on ]; then
  readonly SSH_AGENT_KEY="${HOME}/.ssh/id_ed25519"
  SSH_AGENT_KEY_TTL_SECOND=32400 # 9hours
  SSH_AGENT_FILE="${HOME}/.ssh-agent_info"

  test -f "${SSH_AGENT_FILE}" && source "${SSH_AGENT_FILE}" &> /dev/null

  if ssh-add -l &> /dev/null && [ "$?" -eq 0 ]; then
      echo "ssh-agent still runnig. pid: ${SSH_AGENT_PID}"
  else
      echo 'ssh-agent not running.'
      ssh-agent -t "${SSH_AGENT_KEY_TTL_SECOND}" > "${SSH_AGENT_FILE}"
      source "${SSH_AGENT_FILE}" &> /dev/null
      ssh-add "${SSH_AGENT_KEY}"
  fi

  unset SSH_AGENT_FILE
  unset SSH_AGENT_KEY_TTL_SECOND
fi;
unset USE_SSH_AGENT
