#
# ~/.bash_profile
#

# == Profile-only Stuff! ==

# I3-related

export TERMINAL=konsole

# == Call bashrc file ==

# Path stuff that we can get away with doing for every shell!! ==
[[ -f ~/.bashrc ]] && . ~/.bashrc

# == Junk that might come back again ==

# Pyenv: might resurrect at some point
# export PATH="$HOME/.pyenv/bin:$PATH"
# no pyenv for now
# eval "$(pyenv init -)"
# eval "$(pyenv virtualenv-init -)"
