let OS = system("uname")

set mouse=a             "マウス有効化
set number              "行数をセット
set clipboard=unnamed   "clipboardを共有
set expandtab         	"タブ入力を空白に変換

"dein(plugin manager)
"Ref:https://github.com/Shougo/dein.vim/blob/master/README.md#unixlinux-or-mac-os-x
if &compatible
  set nocompatible
endif
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')
  "Neovimを起動した時にloadされる
  call dein#load_toml('~/.config/nvim/dein.toml', {'lazy': 0})
  "pluginを使用する際にloadされる
  call dein#load_toml('~/.config/nvim/dein_lazy.toml', {'lazy': 1})
  call dein#end()
  call dein#save_state()
endif
" plugin installの自動化
if dein#check_install()
 call dein#install()
endif
filetype plugin indent on
syntax enable

