# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

# User specific environment and startup programs

PATH=$HOME/.local/bin:$HOME/bin:$PATH

export PATH
export TERM=xterm
export GIT_SSH_COMMAND="ssh -i ~/.ssh/id_ed25519"

[[ -e ~/.lesskey ]] && lesskey;
[[ -e ~/.dircolors ]] && eval `dircolors ~/.dircolors`
