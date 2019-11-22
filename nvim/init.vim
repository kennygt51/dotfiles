let OS = system("uname")

set mouse=a             "マウス有効化
set number              "行数をセット
set clipboard=unnamed   "clipboardを共有
set expandtab         	"タブ入力を空白に変換

"deni
if &compatible
  set nocompatible
endif
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')
  call dein#end()
  call dein#save_state()
endif
filetype plugin indent on
syntax enable

