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

if [ $'\x22'${gnupg_SSH_AUTH_SOCK_by:-0}$'\x22' = $$ ]; then
  GNUPGHOME="${HOME}/.gnupg"
  SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
  GPG_TTY=$(tty)
  export GNUPGHOME
  export SSH_AUTH_SOCK
  export GPG_TTY

  echo UPDATESTARTUPTTY | gpg-connect-agent
fi

if [ -x /usr/bin/lesskey ] && [ -f "${HOME}/.lesskey" ]; then
  lesskey -- "${HOME}/.lesskey"
fi

auto_attach_screen=off  # on/off

if [ "${auto_attach_screen}" = on ]; then
  [[ -z "${STY}" ]] && screen -RD "${USER}";
fi;

unset auto_attach_screen
