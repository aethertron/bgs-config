#
# ~/.bash_profile
#

# Program Configuration
# ---------------------

# Konsole and other terminal program configuration
export SHELL=/bin/bash

# Emacs configuration
#   opt into heavy-duty version of my emacs config
export EMACS_HEAVY=1

# Firefox configuration
#   activate touch screen input (I'm guessing this won't affect non-touchscreen devices)
#   confirm touch_events>0 in about:config in firefox
export MOZ_USE_XINPUT2=1

# Path configuration
# ------------------

if [[ -d ~/local/bin && ! PATH =~ .*~/local/bin.* ]]; then
    PATH=~/local/bin:$PATH
fi

# Call bashrc file
# ----------------

if [[ -f ~/.bashrc ]]; then
    source ~/.bashrc
fi

