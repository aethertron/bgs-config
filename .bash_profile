#
# ~/.bash_profile
#

# == Profile-only Stuff! ==

# I3-related
export TERMINAL=konsole

# Env Variables
export SHELL=/bin/bash
export EDITOR='EMACS_HEAVY= emacs -nw'

# Program Configuration
# ---------------------

# Emacs configuration
#   opt into heavy-duty version of my emacs config
export EMACS_HEAVY=1

# Firefox configuration
#   activate touch screen input (I'm guessing this won't affect non-touchscreen devices)
#   confirm touch_events>0 in about:config in firefox
export MOZ_USE_XINPUT2=1

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



