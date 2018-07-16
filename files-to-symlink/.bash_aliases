#!/bin/bash

alias ld='ls -d */'
alias lf='find . -maxdepth 1 -type f  | cut -d / -f 2  | xargs ls --color=auto'

# * aliases
alias cp="cp -i"                          # confirm before overwriting something
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias np='nano -w PKGBUILD'
alias more=less
# --- application aliases ---

# -- emacs --
alias ec='emacsclient -nc'
alias em="emacsclient -n"
alias vim=emacs
alias vi=emacs
