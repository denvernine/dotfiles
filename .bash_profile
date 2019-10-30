# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

# User specific environment and startup programs

PATH=$HOME/.local/bin:$HOME/bin:$PATH

NVM_DIR="$HOME/.nvm"
[[ -s $NVM_DIR/nvm.sh ]] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[[ -s $NVM_DIR/bash_completion ]] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
PATH=$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH

PATH=/usr/local/erlang/bin:$PATH

export PATH
export TERM=xterm
export GIT_SSH_COMMAND="ssh -i ~/.ssh/id_ed25519"

[[ -e ~/.lesskey ]] && lesskey;
