#!/bin/bash
#
# ref: https://qiita.com/b4b4r07/items/24872cdcbec964ce2178

echo 'deplying...'

cd "${dotfiles_directory:-$HOME/dotfiles}"
if [ $? -ne 0 ]; then
  exit 1
fi

for dotfile in .??*
do
  [ "$dotfile" = '.git' ] && continue

  ln -snfv "${dotfiles_directory:-$HOME/dotfiles}/$dotfile" "$HOME/$dotfile"
done

curl -fLo "$HOME/.vim/colors/base16-railscasts.vim" --create-dirs https://raw.githubusercontent.com/chrishunt/color-schemes/master/railscasts/base16-railscasts.vim
curl -fLo "$HOME/.vim/autoload/plug.vim" --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo 'done.'

unset dotfile
