#!/bin/bash

############################
### Main        Section  ###
############################

# Add uniloc to path, pythonpath and manpath
export PATH="$HOME/local/bin:$HOME/bin:$PATH"

# Python path configuration
export PYTHONPATH="$HOME/local/lib64/python2.7/site-packages/:$PYTHONPATH"
export PYTHONPATH="$HOME/local/lib/python2.7/site-packages/:$PYTHONPATH"

# Man path configuration
export MANPATH="$HOME/local/share/man/:$MANPATH"

# Local file
[[ -f ~/.bashrc_local ]] && . ~/.bashrc_local

if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi

############################
### Interactive Section  ###
############################

# Additional aliases and functions here
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Functions
if [ -f ~/.bash_functions ]; then
    . ~/.bash_functions
fi

# Environment variables commonly used by programs
export PAGER=cat
export EDITOR='emacsclient -nc'

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

# Autocompletion configuration
[[ -r /usr/share/bash-completion/bash_completion   ]] && . /usr/share/bash-completion/bash_completion

# Chopping block
[[ -f ~/.bash_chopping_block  ]] && . ~/.bash_chopping_block
