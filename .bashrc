#!/bin/bash

############################
### Main        Section  ###
############################

cleanpath() {
    p=:
    for d in $(IFS=:; echo $*); do [[ -n $d ]] && { [[ $p == *:$d:* ]] || p+=$d:; }; done
    echo ${p:1:${#p}-2}
}

# Add uniloc to path, pythonpath and manpath
export PATH="$HOME/local/bin:$HOME/bin:$PATH:$HOME/.local/bin"
PATH=$(cleanpath $PATH)

# Man path configuration
export MANPATH="/usr/local/share/man/:$MANPATH"
export MANPATH="/usr/share/man/:$MANPATH"
export MANPATH="$HOME/local/share/man/:$MANPATH"
MANPATH=$(cleanpath $MANPATH)

unset cleanpath

# Local file
[[ -f ~/.bashrc_local ]] && . ~/.bashrc_local

if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

############################
### Interactive Section  ###
############################

# Additional aliases and functions here
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Environment variables commonly used by programs

# Colors
#  set use_color if you want color, if not, can set to empty string or unset
case "$TERM" in
    xterm-color|*-256color)
        use_color=true;
esac;

if [[ -n $use_color && -f ~/.bash_colors ]]
then
    . ~/.bash_colors
else
	if [[ ${EUID} == 0 ]] ; then
		# show root@ when we don't have colors
		PS1='\u@\h \W \$ '
	else
		PS1='\u@\h \w \$ '
	fi
fi

unset use_color

# Shell options
shopt -s globstar               # turn on ** and **/ globing! (ex: echo **)

# Autocompletion configuration
[[ -r /usr/share/bash-completion/bash_completion   ]] && . /usr/share/bash-completion/bash_completion

# Chopping block
[[ -f ~/.bash_chopping_block  ]] && . ~/.bash_chopping_block

# Emacs related