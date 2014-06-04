#!/usr/bin/env bash
cd "$(dirname "$0")"

git pull

function doIt() {
  rsync --exclude ".git/" --exclude ".DS_Store" --exclude "update" --exclude "install.sh" --exclude "install_linux.sh" --exclude "README.md" -av . ~
  cd ~/.vim && rake
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
  doIt
else
  read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " reply
  [[ $reply =~ ^[Yy]$ ]] && doIt
fi

unset doIt
. ~/.bash_profile
