# Path to your oh-my-zsh installation.
export ZSH=/Users/itsnauman/.oh-my-zsh

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

# Plugin Setup
plugins=(git, autojump, sublime, virtualenvwrapper)

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
# export MANPATH="/usr/local/man:$MANPATH"

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
alias ssh-overlord="ssh api@162.209.4.226"
alias git=hub
alias unittest="green -vvv --run-coverage"
alias m="mac"

# API Keys
export TNYU_API_KEY=uBjeu7D4KPspcw
export TYPEFORM_API_KEY=ed9a8985f1b41168fe4aa24b24263731
export CLARIFAI=EJJYQJn3yNICboh2yMeTC3B3w7Y6fE
export TWILIO_AUTH_TOKEN=25bcffcd91199b32eb93e9e64732c607
export typeform_api_key='dcd306fca67e7af713b2edb0de1868f8d02d6fb8'
export tnyu_api_key='uBjeu7D4KPspcw'
export tnyu_api_admin_key='Ek8cis5oNt8Og3vop'
export tnyu_typeform_key='3ae7b3efb99eae2c8c8e49b46a5b0577507c2896'

export TNYU_EMAIL_PASSWORD="Fart6pgdWAfTo2"
export TNYU_EMAIL="feedback@techatnyu.org"

export GOOGLE_MAPS=AI
