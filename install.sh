#!/bin/bash

cd $(dirname ${BASH_SOURCE:-$0});
SOURCE_DIR=$(pwd);

read -p "This may overwrite existing files in your home directory. Are you sure? (y/n): ";
if [[ $REPLY =~ ^[Yy]$ ]]; then
  for DOTFILE in .??*
  do
    [ ${DOTFILE} = ".git" ] && continue
    [ ${DOTFILE} = ".ssh" ] && continue

    ln -snfv ${SOURCE_DIR}/${DOTFILE} ${HOME}/${DOTFILE}
  done
  echo "done."
else
  echo "abort."
fi

unset DOTFILE;
unset SOURCE_DIR;
