#
# ~/.bash_profile
#

# == Profile-only Stuff! ==
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# == Path stuff that we can get away with doing for every shell!! ==
[[ -f ~/.bashrc ]] && . ~/.bashrc
