echo "Removing current files"
rm ~/.inputrc
rm ~/.bashrc

if [ -f ~/.bashrc.old ]; then
  echo "Restoring .bashrc from .bashrc.old"
  mv ~/.bashrc.old ~/.bashrc
fi

echo "Done :)"