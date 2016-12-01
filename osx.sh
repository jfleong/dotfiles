#!/bin/bash

# XXX TODO: Prompt user to go install alfred

# XXX TODO: Prompt user to download some fonts
# hack font https://github.com/chrissimpkins/Hack
# m+1m font https://www.fontsquirrel.com/fonts/m-1m

# XXX TODO: Prompt user if they installed their fonts, or install with cli if possible

# Everything below this was taken from the following gist
# osx for hackers: https://gist.github.com/brandonb927/3195465

# show Hidden files
echo "default to show hidden files"
defaults write com.apple.finder AppleShowAllFiles YES
killall Finder

echo ""
echo "Hide the Spotlight icon?"
sudo chmod 600 /System/Library/CoreServices/Search.bundle/Contents/MacOS/Search

echo ""
echo "Enabling full keyboard access for all controls (enable Tab in modal dialogs, menu windows, etc.)"
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

echo ""
echo "Disabling press-and-hold for special keys in favor of key repeat"
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

echo ""
echo "Setting a blazingly fast keyboard repeat rate"
defaults write NSGlobalDomain KeyRepeat -float 0.0000001

echo ""
echo "Disable display from automatically adjusting brightness?"
sudo defaults write /Library/Preferences/com.apple.iokit.AmbientLightSensor "Automatic Display Enabled" -bool false

echo ""
echo "Disable keyboard from automatically adjusting backlight brightness in low light"
sudo defaults write /Library/Preferences/com.apple.iokit.AmbientLightSensor "Automatic Keyboard Enabled" -bool false

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
