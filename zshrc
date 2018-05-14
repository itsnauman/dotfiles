# Plugin Setup
plugins=(git, autojump, sublime)

# Path to your oh-my-zsh installation.
export ZSH=/Users/naumanahmad/.oh-my-zsh

# let the system know how cool we are
set TERM xterm-256color; export TERM

# default editor
export EDITOR="sublime"

# Set name of the theme to load.
ZSH_THEME="cloud"

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
  export EDITOR='subl'
fi

# ssh
export SSH_KEY_PATH="~/.ssh/dsa_id"

# autojump export
[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

# aliases
alias zshconfig="mvim ~/.zshrc"
alias ohmyzsh="mvim ~/.oh-my-zsh"
alias cl="clear"
alias SimpleServer='open http://localhost:8000; python -m SimpleHTTPServer'

function back {
  num=$1
  while [ $num -ne 0  ];do
    cd ..
    num=$( expr $num - 1   )
  done
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
