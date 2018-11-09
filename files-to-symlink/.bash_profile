#
# ~/.bash_profile
#

# == Profile-only Stuff! ==

# Run xmodmaprc if it exists
[[ -f ~/.xmodmaprc ]] && . ~/.xmodmaprc

# Path stuff that we can get away with doing for every shell!! ==
[[ -f ~/.bashrc ]] && . ~/.bashrc


# Pyenv: might resurrect at some point
# export PATH="$HOME/.pyenv/bin:$PATH"
# no pyenv for now
# eval "$(pyenv init -)"
# eval "$(pyenv virtualenv-init -)"
