# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
        . ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/bin:$HOME/.rbenv/bin
export PATH

#rbenv initを実行
eval "$(rbenv init -)"

#pyenv 環境変数設定
export PATH="$HOME/.pyenv/shims:$PATH"

#PYTHONSTARTUP
export PYTHONSTARTUP=~/.pythonrc.py

#awsコマンドなど
export PATH="$HOME/.pyenv/versions/3.4.3/bin:$PATH"

#nodebrew
export PATH=$HOME/.nodebrew/current/bin:$PATH

# Node.js
if [[ -s ~/.nvm/nvm.sh ]];then
  source ~/.nvm/nvm.sh
fi

# lsに色付け
export TERM=xterm-color
alias ls='ls -G'
