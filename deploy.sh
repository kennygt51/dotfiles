#!/bin/sh

MY_DIR=$(cd;pwd)
DOT_DIR="${MY_DIR}/dotfiles"
HOME_DIR="${HOME}"

echo "Deploy dotfiles start!"

# .zshrc
if [ ! -L "${HOME}/.zshrc" ];then
  echo "Create symbolic link of .zshrc"
  ln -s "${DOT_DIR}/.zshrc" "${HOME}/.zshrc"
fi

# .vimrc
if [ ! -L "${HOME}/.vimrc" ];then
  echo "Create symbolic link of .vimrc"
  ln -s "${DOT_DIR}/.vimrc" "${HOME}/.vimrc"
fi

# .alias
if [ ! -L "${HOME}/.alias" ];then
  echo "Create symbolic link of .alias"
  ln -s "${DOT_DIR}/.alias" "${HOME}/.alias"
fi

# .tmux.conf
if [ ! -L "${HOME}/.tmux.conf" ];then
  echo "Create symbolic link of .tmux.conf"
  ln -s "${DOT_DIR}/.tmux.conf" "${HOME}/.tmux.conf"
fi

echo "Deploy dotfiles complete!"
