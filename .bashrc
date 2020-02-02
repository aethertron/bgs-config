#!/bin/bash

if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi

# 1. Additional aliases and functions here
# LS related
alias ll='ls -lh --color=auto --group-directories-first'
alias lla='ls -alh --color=auto --group-directories-first'
alias ls='ls --color=auto --group-directories-first'
alias ld='ls -d */'
alias lf='find . -maxdepth 1 -type f  | cut -d / -f 2  | xargs ls --color=auto --group-directories-first'

# Grep (note GREP_COLOR is deprecated so we need this silly aliases)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
# Emacs
alias en='emacsclient -n'
alias ec='emacsclient'
alias et='emacs -Q -nw'
# Other
alias less='less -RX'                     # keep text around by default
alias duh='du -h --time --max-depth 1'
alias na='nano'
alias diffstat='diffstat -C'
alias spectacle='spectacle -r --background  --nonotify -o '
alias open='xdg-open'
alias et='EMACS_HEAVY= emacs -nw'
alias en='emacsclient -n'
alias ec='emacsclient'

# Bash shell (non-exported) variables
PROMPT_DIRTRIM=3  # number of directories to show

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

# Chopping block
if [[ -f ~/.bash_chopping_block  ]]; then
    source ~/.bash_chopping_block
fi

# Emacs related

# initialization for utilities that are only needed in interactive mode!
profiles=('/usr/share/bash-completion/bash_completion' "$HOME/.fzf.bash")
for profile in "${profiles[@]}"; do
    if [[ -r "$profile" ]]; then
	source "$profile"
    fi
done
