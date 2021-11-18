#!/bin/bash
#
# ref: https://qiita.com/b4b4r07/items/24872cdcbec964ce2178

echo 'This may overwrite existing files in your home directory. Are you sure? (y/n)'
read reply

if [ ${reply} = 'y' ] || [ ${reply} = 'Y' ]; then
    echo "install directory [${HOME}/dotfiles]:"
    read dotfiles_directory

    tarball_url='https://github.com/denvernine/dotfiles/archive/master.tar.gz'

    if [ type curl &> /dev/null ]; then
      curl -L "${tarball_url}"
    elif [ type wget &> /dev/null ]; then
      wget -O - "${tarball_url}"
    fi | tar zxv

    unset tarball_url
    mv -f dotfiles-master "${dotfiles_directory:=${HOME}/dotfiles}"

    . "${dotfiles_directory}/deploy.sh"
else
    echo 'curl or wget required.'
    exit 1
fi
