# .profile
#
# environment variable
if [ -d "${HOME}/bin" ] ; then
  PATH="${HOME}/bin:${PATH}"
fi

if [ -d "${HOME}/.local/bin" ] ; then
  PATH="${HOME}/.local/bin:${PATH}"
fi

export PATH

TERM="${TERM:=xterm}"
export TERM

DOCKER_HOST="unix://${XDG_RUNTIME_DIR}/docker.sock"
export DOCKER_HOST

HISTCONTROL=ignoreboth
HISTIGNORE='rm *:sudo rm *'
HISTSIZE=1000
HISTFILESIZE=2000
export HISTCONTROL
export HISTIGNORE
export HISTSIZE
export HISTFILESIZE

GNUPGHOME="${HOME}/.gnupg"
export GNUPGHOME

if [ -x /usr/bin/lesskey ] && [ -f "${HOME}/.lesskey" ]; then
  lesskey -- "${HOME}/.lesskey"
fi

auto_attach_screen=off  # on/off

if [ "${auto_attach_screen}" = on ]; then
  [[ -z "${STY}" ]] && screen -RD "${USER}";
fi;

unset auto_attach_screen
