# Plugin Setup
plugins=(git, autojump, sublime, virtualenvwrapper)

# Path to your oh-my-zsh installation.
export ZSH=/Users/itsnauman/.oh-my-zsh

# let the system know how cool we are
set TERM xterm-256color; export TERM

# default editor
export EDITOR="sublime"

# Set name of the theme to load.
ZSH_THEME="dracula"

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
alias zshconfig="atom ~/.zshrc"
alias ohmyzsh="atom ~/.oh-my-zsh"
alias cl="clear"
alias unittest="green -vvv --run-coverage"
alias m="mac"
alias SimpleServer='open http://localhost:8000; python -m SimpleHTTPServer'
alias ssh-cso='ssh na1668@i6.cims.nyu.edu'

# All all files and commit
function c() {
    if [ -z "$@" ]; then
        echo "ERROR: NO COMMIT MESSAGE"
    else
        git add .
    	git commit -m "$@"
    fi
}

# Compile and run Java programs with a single command
function javar() {
    if [ -z "$@" ]; then
        echo "ERROR: NO JAVA CLASS NAME"
    else
        javac *.java
        java $@
    fi
}

# API Keys
export TNYU_API_KEY=uBjeu7D4KPspcw
export TYPEFORM_API_KEY=ed9a8985f1b41168fe4aa24b24263731
export CLARIFAI=EJJYQJn3yNICboh2yMeTC3B3w7Y6fE
export TWILIO_AUTH_TOKEN=25bcffcd91199b32eb93e9e64732c607
export typeform_api_key=dcd306fca67e7af713b2edb0de1868f8d02d6fb8
export tnyu_api_key=uBjeu7D4KPspcw
export tnyu_api_admin_key=Ek8cis5oNt8Og3vop
export tnyu_typeform_key=3ae7b3efb99eae2c8c8e49b46a5b0577507c2896

export TNYU_EMAIL_PASSWORD=Fart6pgdWAfTo2
export TNYU_EMAIL=feedback@techatnyu.org
export GOOGLE_MAPS=AIzaSyCBLvCvf9AiJZzSKXaBRgGZ22BNf_FJ6qQ
