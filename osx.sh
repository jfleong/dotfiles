#!/bin/bash

# XXX TODO: Prompt user to go install alfred

# XXX TODO: Prompt user to download some fonts
# hack font https://github.com/chrissimpkins/Hack
# m+1m font https://www.fontsquirrel.com/fonts/m-1m

# XXX TODO: Prompt user if they installed their fonts, or install with cli if possible

# XXX TODO: install homebrew
# /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
# brew install scmpuff

# Everything below this was taken from the following gist
# osx for hackers: https://gist.github.com/brandonb927/3195465

# show Hidden files
echo "default to show hidden files"
defaults write com.apple.finder AppleShowAllFiles YES
killall Finder

echo ""
echo "Enabling full keyboard access for all controls (enable Tab in modal dialogs, menu windows, etc.)"
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

echo ""
echo "Disabling press-and-hold for special keys in favor of key repeat"
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

echo ""
echo "Setting a blazingly fast keyboard repeat rate"
defaults write NSGlobalDomain KeyRepeat -int 1;
defaults read NSGlobalDomain KeyRepeat

echo "Set a shorter Delay until key repeat"
defaults write NSGlobalDomain InitialKeyRepeat -int 12
defaults read NSGlobalDomain InitialKeyRepeat

echo ""
echo "Requiring password immediately after sleep or screen saver begins"
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

echo ""
echo "Use column view in all Finder windows by default? (y/n)"
defaults write com.apple.finder FXPreferredViewStyle Clmv

echo ""
echo "Set Dock to auto-hide and remove the auto-hiding delay? (y/n)"
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0
