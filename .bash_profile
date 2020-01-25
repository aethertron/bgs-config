#
# ~/.bash_profile
#

# == Profile-only Stuff! ==

# I3-related
export TERMINAL=konsole

# Env Variables
export SHELL=/bin/bash

# Initialization, mainly for user programs (conda, etc)
if [[ -f ~/anaconda3/etc/profile.d/conda.sh ]]; then
    source ~/anaconda3/etc/profile.d/conda.sh
fi

# == Call bashrc file ==

# Path stuff that we can get away with doing for every shell!! ==
if [[ -f ~/.bashrc ]]; then
    source ~/.bashrc
fi



