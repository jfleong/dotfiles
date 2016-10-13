#!/bin/bash

# XXX TODO: install zsh
# echo "installing oh-my-zsh"
# https://github.com/robbyrussell/oh-my-zsh
# XXX TODO: install scm breeze
# echo "installing scm breeze"
# https://github.com/scmbreeze/scm_breeze

DOTFILES_DIR=$( cd $(dirname $0) ; pwd -P )
echo "dotfiles dir = $DOTFILES_DIR"

echo "changing into dotfiles dir..."
cd $DOTFILES_DIR

echo "update our submodules (mainly vim plugins and what not...)"
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

# link bundle/vim-solarized/colors/solarized.vim to colors/solarized.vim so it works with vim

echo "Configuring git globals"
echo "Setting default editor to vim"
git config --global core.editor $(which vim)
if grep "name" ~/.gitconfig; then
    echo "git global username is set"
else
    echo -n "Enter your github username and press [ENTER]: "
    read gh_user_name
    echo "Setting github username to: ${gh_user_name}"
    git config --global user.name "${gh_user_name}"
    echo -n "Enter your github email and press [ENTER]: "
    read gh_user_email
    echo "Setting github email to: ${gh_user_email}"
    git config --global user.email ${gh_user_email}
fi

if grep -q darwin <<<$OSTYPE; then
  echo "OSX detected..."
  echo "thank you for you money -Apple"
  $DOTFILES_DIR/osx.sh
fi
