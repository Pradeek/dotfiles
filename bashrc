# Calling it here as well since I'm setting up some important PATHs
# TODO: Move common dependant envs into this folder
# System specific stuff that shouldn't be in git
if [ -f ~/.bashrc.local ]; then
  source ~/.bashrc.local
fi


source ~/dotfiles/bash/config
source ~/dotfiles/bash/aliases
source ~/dotfiles/bash/functions
source ~/dotfiles/bash/env

if [ `uname` == "Darwin" ]; then
  source ~/dotfiles/bash/mac
fi

# Calling it here as well since I'm setting up some important PATHs
# TODO: Move common dependant envs into this folder
# System specific stuff that shouldn't be in git
if [ -f ~/.bashrc.local ]; then
  source ~/.bashrc.local
fi

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
