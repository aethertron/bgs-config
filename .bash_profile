#
# ~/.bash_profile
#

# == Profile-only Stuff! ==

# I3-related
export TERMINAL=konsole

# Env Variables
export SHELL=/bin/bash

# Initialization, mainly for user programs (conda, etc)
[[ -f ~/anaconda3/etc/profile.d/conda.sh ]] && source ~/anaconda3/etc/profile.d/conda.sh

# == Call bashrc file ==

# Path stuff that we can get away with doing for every shell!! ==
[[ -f ~/.bashrc ]] && source ~/.bashrc

# == Junk that might come back again ==

# Pyenv: might resurrect at some point
# export PATH="$HOME/.pyenv/bin:$PATH"
# no pyenv for now
# eval "$(pyenv init -)"
# eval "$(pyenv virtualenv-init -)"
