#!/bin/bash

echo "Let's begin my Lord"
echo -n $'\E[31m'
echo $''
echo $'      _,.'
echo $'    ,` -.)'
echo $'   \'( _/\'-\\\\-.'
echo $'  /,|`--._,-^|          ,'
echo $'  \\_| |`-._/||          ,\'|'
echo $'    |  `-, / |         /  /'
echo $'    |     || |        /  /'
echo $'     `r-._||/   __   /  /'
echo $' __,-<_     )`-/  `./  /'
echo $'\'  \\   `---\'   \\   /  /'
echo $'    |           |./  /'
echo $'    /           //  /'
echo $'\\_/\' \\         |/  /'
echo $' |    |   _,^-\'/  /'
echo $' |    , ``  (\\/  /_'
echo $'  \\,.->._    \\X-=/^'
echo $'  (  /   `-._//^`'
echo $'   `Y-.____(__}'
echo $'    |     {__)'
echo $'          ()`'

#################
#   Homebrew    
#################

echo "Installing Homebrew... 🎉"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" </dev/null

echo "Updating Homebrew... "
brew update && printf " Done.\n"
echo "Installing Homebrew Cask... 🔥"
brew tap caskroom/cask

echo "Installing Applications With Homebrew... 🍺"
packages=(
  brew-cask
  node
  python
  python3
  autojump
  git
  macvim
  wget
)

########################
# Install Brew Packages 
########################

for pkg in $packages; do
  if brew list -1 | grep -q "^${pkg}\$"; then
    echo "Brew: Package '$pkg' is already installed"
  else
    echo "Brew: Installing '$pkg'"
    brew install $pkg 1>/dev/null
  fi
done

echo "Installing Homebrew Cask Applications... 🍟"
packages=(
  dropbox
  google-chrome
  heroku-toolbelt
  iterm2
  java
  caffeine
  skype
  ngrok
  slack
  spotify
  sublime-text3
  github-desktop
  evernote
  intellij-idea
  vlc
)

#####################
# Install Brew Casks
#####################

for pkg in $packages; do
  if brew cask info $pkg | grep -q "Not installed"; then
    echo "Brew Cask: Installing '$pkg'"
    brew cask install --appdir="/Applications" $pkg 1>/dev/null
  else
    echo "Brew Cask: Package '$pkg' is already installed"
  fi
done

brew cleanup

###################
# -- Git Setup -- #
###################

echo "Setting up Git configs 🍭"
git config --global user.name "Nauman Ahmad"
git config --global user.email "nauman-ahmad@outlook.com"

# -- Mac Preferences --
echo "Setting up Mac Preferences 🎉"

echo "Installing Mac CLI..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/guarinogabriel/mac-cli/master/mac-cli/tools/install)"

DevToolsSecurity -enable
# Automatically quit printer app once the print jobs complete
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# Disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Disable the warning before emptying the Trash
defaults write com.apple.finder WarnOnEmptyTrash -bool false

# Disabling the annoying backswipe in Chrome
defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool false

# Turn off keyboard illumination when computer is not used for 5 minutes
defaults write com.apple.BezelServices kDimTime -int 300

# Requiring password immediately after sleep or screen saver begins
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Speeding up Mission Control animations and grouping windows by application
defaults write com.apple.dock expose-animation-duration -float 0.1
defaults write com.apple.dock "expose-group-by-app" -bool true

# Enabling UTF-8 ONLY in Terminal.app and setting the Pro theme by default
defaults write com.apple.terminal StringEncodings -array 4
defaults write com.apple.Terminal "Default Window Settings" -string "Pro"
defaults write com.apple.Terminal "Startup Window Settings" -string "Pro"

# Disable Dashboard
defaults write com.apple.dashboard mcx-disabled -bool true

# Gen RSA Key if needed
if [[ ! -f $HOME/.ssh/id_rsa ]]; then
	ssh-keygen -t rsa -C "nauman-ahmad@outlook.com"
	chmod 600 $HOME/.ssh/id_rsa
fi

echo "Instaling oh my zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

#########################
# -- Python Installs -- #
#########################

packages=(
	virtualenvwrapper
	wheel
	green
	requests
)

for pkg in $packages; do
	pip install $pkg 1>/dev/null
done

#########################
# -- npm installs -- #
#########################

packages=(
	nodemon
	torrent
	trash-cli
	babel-cli
)

for pkg in $packages; do
	npm install $pkg 1>/dev/null
done
