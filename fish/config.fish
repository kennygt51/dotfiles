## Environment
### Docker buildkit
set -x DOCKER_BUILDKIT "1"

### fish FZF
set -U FZF_LEGACY_KEYBINDINGS 0

## PATH
# Visual Studio Code
set -x PATH "/Applications/Visual Studio Code.app/Contents/Resources/app/bin" $PATH
# nodebrew
set -x PATH "$HOME/.nodebrew/current/bin" $PATH
# rbenv
eval (rbenv init - | source)
# gcloud
set -x PATH "/usr/local/bin/google-cloud-sdk/bin" $PATH

## Aliases
source ~/dotfiles/.alias
if test -f ~/.office_alias
    source ~/.office_alias
end

## Credentials
source ~/.credentials/env_val_fish

## MySQL
set -g fish_user_paths "/usr/local/opt/mysql@5.7/bin" $fish_user_paths

## python
set PATH $HOME/.pyenv/shims $PATH
eval (pyenv init - | source)

## golang
set -x GOPATH $HOME/.go
set -x PATH $GOPATH/bin $PATH

# vi mode
fish_vi_key_bindings

set fish_theme taktoa
