#! /usr/bin/env bash
BASEDIR=$(dirname $0)

files=( "bashrc" "inputrc" "vimrc" )

echo "Taking backup of existing files"
for file in "${files[@]}"
do
  if [ ! -f ~/.$file.old ]; then
    mv ~/.$file ~/.$file.old
  else
    echo "Backup for .$file already exists"
  fi  
done

echo "Setting up dotfiles"
for file in "${files[@]}"
do
  ln -s $BASEDIR/$file ~/.$file
done

echo "Done :)"