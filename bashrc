source ~/dotfiles/bash/config
source ~/dotfiles/bash/aliases
source ~/dotfiles/bash/functions
source ~/dotfiles/bash/env

if [ `uname` == "Darwin" ]; then
  source ~/dotfiles/bash/mac
fi

# System specific stuff that shouldn't be in git
if [ -f ~/.bashrc.local ]; then
  source ~/.bashrc.local
fi
