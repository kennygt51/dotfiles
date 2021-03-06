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
export ZPLUG_HOME=/usr/local/opt/zplug
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
# kubectl
export PATH="${PATH}:${HOME}/.krew/bin"

## rbenv
export PATH="$HOME/.rbenv/bin:$HOME/.rbenv/shims:$PATH"

## MySQL
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"

# git
export PATH="/usr/local/git/bin:$PATH"

# python
#set PATH $HOME/.pyenv/shims $PATH
#set PATH $HOME/Library/Python/3.7/bin $PATH
eval "$(pyenv init -)"

# golang
## goenvを利用する為に必要なPath
export GOENV_ROOT="$HOME/.goenv"
export PATH="$GOENV_ROOT/bin:$PATH"
export GOENV_DISABLE_GOPATH=1

## goenv init処理（go envなど生成される）
eval "$(goenv init -)"

## GOPATH
export GOPATH="$HOME/.go"
export PATH="$GOPATH/bin:$PATH"

## Java
export SDKMAN_DIR="${HOME}/.sdkman"
[[ -s "${HOME}/.sdkman/bin/sdkman-init.sh" ]] && source "${HOME}/.sdkman/bin/sdkman-init.sh"

# docker
## BuildKit active
export DOCKER_BUILDKIT=1

##############################
### alias
##############################
# git
alias g='git'
alias ga='git add'
alias gd='git diff'
alias gs='git status'
alias gp='git push'
alias gpo='git push origin'
alias gpoh='git push origin head'
alias gb='git branch'
alias gst='git status'
alias gco='git checkout'
alias gf='git fetch'
alias gc='git commit'

# command alias
alias tf='terraform' # terraform command alias
alias d='docker'     # docker command alias
alias k='kubectl'    # kubectl command alias

# fzf
alias fzfc='find . | fzf'

# ghq
alias gcl='ghq get'
alias gl='cd `ghq root`/`ghq list | peco`'

# Ruby
alias be='bundle exec'


##############################
### etc
##############################
# source credentials
source ~/.credentials/env_val_zsh
