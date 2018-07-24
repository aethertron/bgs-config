#!/bin/bash

# currently pilfering from default .bashrc file in latest kubuntu (18.4)

# ls-related
alias l='ls -CF'
alias la='ls -alF'
alias ld='ls -d */'
alias lf='find . -maxdepth 1 -type f  | cut -d / -f 2  | xargs ls --color=auto'
alias ll='ls - alF'

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
alias ec="emacsclient -c"
alias vim=emacs
alias vi=emacs
