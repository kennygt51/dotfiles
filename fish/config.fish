## PATH
# Visual Studio Code
set -x PATH "/Applications/Visual Studio Code.app/Contents/Resources/app/bin" $PATH
# nodebrew
set -x PATH "$HOME/.nodebrew/current/bin" $PATH
# rbenv
eval (rbenv init - | source)

## Aliases
alias tf='terraform'

## Credentials
source ~/.credentials/env_val_fish

