#
# ~/.bash_profile
#

# Program Configuration
# ---------------------

# Konsole and other terminal program configuration
export SHELL=/bin/bash

# Firefox configuration
#   activate touch screen input (I'm guessing this won't affect non-touchscreen devices)
#   confirm touch_events>0 in about:config in firefox
export MOZ_USE_XINPUT2=1

# Path configuration
# ------------------

if [[ -d ~/local/bin && "$PATH" != *~/local/bin* ]]; then
    PATH=~/local/bin:"$PATH"
fi

if [[ -d ~/bin && "$PATH" != *~/bin* ]]; then
    PATH=~/bin:"$PATH"
fi

# Call bashrc file
# ----------------
# This is mainly interactive stuff but might include non-interactive stuff
if [[ -f ~/.bashrc ]]; then
    source ~/.bashrc
fi

# Interactive Mode Only from Here
# -------------------------------
# Let's try to avoid doing anything here
if [[ $- != *i* ]]; then
    return
fi
