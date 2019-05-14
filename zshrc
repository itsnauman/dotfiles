# Plugin Setup
plugin=(git, autojump, sublime)

# Path to your oh-my-zsh installation.
export ZSH=/Users/naumanahmad/.oh-my-zsh

# let the system know how cool we are
set TERM xterm-256color; export TERM

# default editor
export EDITOR="subl"

# Set name of the theme to load.
ZSH_THEME="bira"

# Change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=7

# Disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Enable command auto-correction.
ENABLE_CORRECTION="true"

# Display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# User configuration
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

source $ZSH/oh-my-zsh.sh
# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
fi

# autojump export
[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

# aliases
alias zshconfig="mvim ~/.zshrc"
alias ohmyzsh="mvim ~/.oh-my-zsh"
alias cl="clear"
alias del="trash"
alias vim="mvim"

# Go back n directories
function back {
  num=$1
  while [ $num -ne 0  ];do
    cd ..
    num=$( expr $num - 1   )
  done
}

# Kill process running on port
function killp {
    kill -9 $(lsof -i :@ | awk '{l=$2} END {print l}')
}

function ubuntu() {
    docker run -v /Users/naumanahmad/Developer:/home/devuser/workspace --rm -it ubuntu:nauman
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# heroku autocomplete setup
HEROKU_AC_ZSH_SETUP_PATH=/Users/naumanahmad/Library/Caches/heroku/autocomplete/zsh_setup && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH;

export WORKON_HOME=$HOME/.virtualenvs

export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv
source /usr/local/bin/virtualenvwrapper.sh

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export SSH_KEY_PATH="~/.ssh/dsa_id"
export TZ=UTC
