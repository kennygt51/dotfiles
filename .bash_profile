### .bash_profile
# iTerm2 configulation
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# Visual Studio Code PATH(`code` commabd)
export PATH="${PATH}:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# rbenv
eval "$(rbenv init -)"

# nodebrew path
export PATH="${PATH}:/${HOME}/.nodebrew/current/bin"

# credentials
source ~/.credentials/env_val_bash

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
        . ~/.bashrc
fi

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="${PATH}/.sdkman"
[[ -s "${PATH}/.sdkman/bin/sdkman-init.sh" ]] && source "${PATH}/.sdkman/bin/sdkman-init.sh"
