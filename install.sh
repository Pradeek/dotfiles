#! /usr/bin/env bash
BASEDIR=$(dirname $0)

echo "Taking backup of existing files"
if [ ! -f ~/.bashrc.old ]; then
  mv ~/.bashrc ~/.bashrc.old
else
  echo "Backup for .bashrc already exists"
fi
if [ ! -f ~/.inputrc.old ]; then
  mv ~/.inputrc ~/.inputrc.old
else
  echo "Backup for .inputrc already exists"
fi

echo "Setting up dotfiles"
ln -s $BASEDIR/bashrc ~/.bashrc
ln -s $BASEDIR/inputrc ~/.inputrc

echo "Done :)"