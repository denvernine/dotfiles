# .profile
#
# environment variable
if [ -d '/sbin' ] ; then
  PATH="${PATH}:/sbin"
fi

if [ -d "${HOME}/bin" ] ; then
  PATH="${HOME}/bin:${PATH}"
fi

if [ -d "${HOME}/.local/bin" ] ; then
  PATH="${HOME}/.local/bin:${PATH}"
fi

export PATH

TERM="${TERM:=xterm}"
export TERM

HISTCONTROL=ignoreboth
HISTIGNORE='rm *:sudo rm *'
HISTSIZE=1000
HISTFILESIZE=2000
export HISTCONTROL
export HISTIGNORE
export HISTSIZE
export HISTFILESIZE

if [ -x /usr/bin/lesskey ] && [ -f "${HOME}/.lesskey" ]; then
  lesskey -- "${HOME}/.lesskey"
fi

if [ -x "${HOME}/.local/bin/anyenv" ]; then
  eval "$(anyenv init -)"
fi

auto_attach_screen=off  # on/off

if [ "${auto_attach_screen}" = on ]; then
  [[ -z "${STY}" ]] && screen -RD "${USER}";
fi;

unset auto_attach_screen

if command -v git &> /dev/null \
  && [[ -e /usr/share/bash-completion/completions/git ]]; then
  # curl -sSL -- 'https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash' > /usr/share/bash-completion/completions/git
  . /usr/share/bash-completion/completions/git
fi

if command -v docker &> /dev/null \
  && [[ -e /usr/share/bash-completion/completions/docker ]]; then
  # curl -sSL -- "https://raw.githubusercontent.com/docker/compose/$(docker-compose version --short)/contrib/completion/bash/docker-compose" > /usr/share/bash-completion/completions/docker
  . /usr/share/bash-completion/completions/docker
fi
