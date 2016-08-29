#!/bin/bash

# Install my dotfiles
# 0) install ZSH
# 1) update submodules (mainly vim plugins
# 2) move dotfiles if they existed and symlink mine
# 3) Run other shit that i do other than dotfiles

# XXX TODO: install zsh
# Don't forget to delete the standard zshrc file (even though we handle that)

DOTFILES_DIR=$( cd $(dirname $0) ; pwd -P )
echo "dotfiles dir = $DOTFILES_DIR"

echo "changing into dotfiles dir..."
cd $DOTFILES_DIR

echo "update our submodules"
git submodule init
git submodule update --recursive


echo "symlink my files"
for dotfile in .aliases .vim .vimrc .zshrc; do
  if [ -e ~/$dotfile ]; then
    if [ ! -h ~/$dotfile ]; then
      mv ~/$dotfile ~/$dotfile.before-dot-files
    fi
  fi
  ln -s $DOTFILES_DIR/$dotfile ~/$dotfile
done

# Git global configs
# XXX TODO: figure out how i want to do this
echo -n "Enter your github username and press [ENTER]: "
read gh_user_name
echo -n "Enter your github email and press [ENTER]: "
read gh_user_email
gh_user_name=${GH_USER_NAME}
gh_user_email=${GH_USER_EMAIL}
# git config --global core.editor $(which vim)
# git config --global user.name "${gh_user_name}"
# git config --global user.email $gh_user_email

# # show Hidden files
# defaults write com.apple.finder AppleShowAllFiles YES
# killall Finder

# OTher things I do
# install scm breeze
# link bundle/vim-solarized/colors/solarized.vim to colors/solarized.vim
# hack font https://github.com/chrissimpkins/Hack
# m+1m font https://www.fontsquirrel.com/fonts/m-1m

# take the shit i need from here...
# osx for hackers: https://gist.github.com/brandonb927/3195465
