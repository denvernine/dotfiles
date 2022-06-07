# Bash Run Control
#
# set aliases, prompt setting, settings depending bash, etc.

# If not running interactively, don't do anything
case $- in
  *i*) ;;
  *) return;;
esac

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
stty stop undef
stty start undef

rand() {
  cat /dev/urandom | tr -dc ${2:-'[:graph:]'} | fold -w $(echo -n ${1:-16}) | head -n ${3:-1};
}

color_prompt=on  # on/off

gitBranch() {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/:\1/';
}

if [ "${color_prompt}" = on ]; then
  TERM=xterm-256color
  PS1='\[\e[32m\]\u@\h\[\e[m\] \[\e[34m\]\w\[\e[m\]$(gitBranch) \[\e[34m\]\$\[\e[m\] '

  alias ls='ls --color=auto'
  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'

  if [ -x /usr/bin/dircolors ] && [ -f ~/.dircolors ]; then
    eval "$(dircolors -b ~/.dircolors)"
  fi
else
  PS1='[\u@\h \W$(gitBranch)]\$ '
fi;

unset color_prompt

# Source aliases
if [ -f ${HOME}/.aliases.bash ]; then
  . ${HOME}/.aliases.bash
fi

# Source aliases
if [ -f ${HOME}/.gpgrc ]; then
  . ${HOME}/.gpgrc
fi
