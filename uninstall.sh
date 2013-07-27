files=( "bashrc" "inputrc" "vimrc" "gvimrc" "tmux.conf" )

for file in "${files[@]}"
do
  echo "Removing current $file"
  rm ~/.$file

  if [ -f ~/.$file.old ]; then
    echo "Restoring .$file from .$file.old"
    mv ~/.$file.old ~/.$file
  fi
done
