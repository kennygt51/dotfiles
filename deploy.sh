#!/bin/bash

MY_DIR=$(cd;pwd)
DOT_DIR="${MY_DIR}/dotfiles"

echo "Deploy dotfiles start!"

for f in .??*
do
  [[ ${f} = ".git" ]] && continue
  [[ ${f} = ".gitignore" ]] && continue
  ln -snfv ${DOT_DIR}/${f} ${HOME}/${f}
  echo "deploy done!(${f})"
done

echo "Deploy dotfiles complete!"
