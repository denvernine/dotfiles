# .profile
#
# environment variable
PATH="${HOME}/.local/bin:${HOME}/bin:/usr/bin:${PATH}"
export PATH

TERM="${TERM:=xterm}"
export TERM

DOCKER_HOST="unix://${XDG_RUNTIME_DIR}/docker.sock"
export DOCKER_HOST

HISTCONTROL=ignoreboth
HISTIGNORE='rm *:sudo rm *'
HISTSIZE=1000
HISTFILESIZE=2000

stty stop undef
stty start undef
