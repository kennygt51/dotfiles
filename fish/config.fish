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

## Aliases
source ~/dotfiles/.alias

## Credentials
source ~/.credentials/env_val_fish

## MySQL
set -g fish_user_paths "/usr/local/opt/mysql@5.7/bin" $fish_user_paths
