#
# ~/.bash_profile
#

# == Profile-only Stuff! ==

# I3-related
export TERMINAL=konsole

# Env Variables
export SHELL=/bin/bash
export EDITOR='emacs -Q -nw'

# Initialization, mainly for user programs (conda, etc)
if [[ -f ~/anaconda3/etc/profile.d/conda.sh ]]; then
    source ~/anaconda3/etc/profile.d/conda.sh
fi

# Path configuration
if [[ -d ~/local/bin && ! PATH =~ .*~/local/bin.* ]]; then
    PATH=~/local/bin:$PATH
fi

# == Call bashrc file ==

# Path stuff that we can get away with doing for every shell!! ==
if [[ -f ~/.bashrc ]]; then
    source ~/.bashrc
fi



