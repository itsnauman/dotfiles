# Path to your oh-my-zsh installation.
export ZSH=/Users/naumanahmad/.oh-my-zsh

# Name of the theme to load.
ZSH_THEME="cloud"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Plugins
plugins=(git cp virtualenvwrapper virtualenv autojump)

# User configuration
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='mvim'
fi

# ssh
export SSH_KEY_PATH="~/.ssh/dsa_id"

# aliases
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="subl ~/.oh-my-zsh"
alias vim="mvim"
alias vimrc="vim ~/.vimrc"
alias desktop="~/desktop"
alias proj="~/developer/github"
