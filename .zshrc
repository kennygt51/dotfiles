##############################
### base config
##############################
# Environment Variables
export DOT_DIR="${HOME}/dotfiles"
# alias
source "${DOT_DIR}/.alias"
# source credentials
source "${HOME}/.credentials/env_val"

##############################
### zsh plugin
##############################
# for vcs_info
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }

# for zsh-completrions
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

  autoload -Uz compinit
  compinit
fi

# for zplug
#export ZPLUG_HOME=/usr/local/opt/zplug
#source $ZPLUG_HOME/init.zsh
export ZPLUG_HOME=/opt/homebrew/opt/zplug
source $ZPLUG_HOME/init.zsh

# install plugin
zplug "zsh-users/zsh-autosuggestions", defer:2
zplug "zsh-users/zsh-syntax-highlighting", defer:2

if ! zplug check --verbose; then
    printf 'Install? [y/N]: '
    if read -q; then
        echo; zplug install
    fi
fi
zplug load

##############################
### zsh config
##############################
# vim key bind
bindkey -e

# zsh history
export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=10000
export SAVEHIST=500000
setopt hist_ignore_dups
setopt EXTENDED_HISTORY

# interactive search by peco
function peco-history-selection() {
    BUFFER=`history -n 1 | tail -r  | awk '!a[$0]++' | peco`
    CURSOR=$#BUFFER
    zle reset-prompt
}
zle -N peco-history-selection
bindkey '^R' peco-history-selection

# PROMPT
autoload colors
colors
local p_cdir='${vcs_info_msg_0_} '"%B%F{green}[%~] [%*]%f%b"$'\n'
PROMPT="$p_cdir%B%F{blue}>%f%b "

# beep
setopt no_beep

# to color `ls` command
autoload -U compinit
compinit
export LSCOLORS=exfxcxdxbxegedabagacad
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
alias ls="ls -G"
alias gls="gls --color"
zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'

##############################
### command line tools
##############################
# asdf
. /opt/homebrew/opt/asdf/libexec/asdf.sh

# git
export PATH="/usr/local/git/bin:$PATH"

# Go
## GOPATH
export PATH="$(go env GOPATH)/bin:$PATH"

# Java
export SDKMAN_DIR="${HOME}/.sdkman"
[[ -s "${HOME}/.sdkman/bin/sdkman-init.sh" ]] && source "${HOME}/.sdkman/bin/sdkman-init.sh"

# kubectl
export PATH="${PATH}:${HOME}/.krew/bin"

# docker
export DOCKER_BUILDKIT=1

# MySQL
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"
export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"

# direnv
eval "$(direnv hook zsh)"

# Added by serverless binary installer
export PATH="$HOME/.serverless/bin:$PATH"

# Serverless Framework
export PATH="$HOME/.serverless/bin:$PATH"

# asdf
source "${HOME}"/.docker/init-zsh.sh || true # Added by Docker Desktop
