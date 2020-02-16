#!/bin/bash

if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi

# Environment Variabls for Interactive Mode
# -----------------------------------------

export EDITOR='EMACS_HEAVY= emacs -nw'

# Aliases and functions
# ---------------------

# LS related
alias ll='ls -lh --color=auto --group-directories-first'
alias lla='ls -alh --color=auto --group-directories-first'
alias ls='ls --color=auto --group-directories-first'
alias ld='ls -d */'
alias lf='find . -maxdepth 1 -type f  | cut -d / -f 2  | xargs ls --color=auto --group-directories-first'
# Grep (note GREP_COLOR is deprecated so we need these silly aliases)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
# Emacs
alias ec='emacsclient'
alias en='emacsclient -n'
alias et="$EDITOR"
# Other
alias echo='echo -e'
alias less='less -RX'                     # keep text around by default
alias duh='du -h --time --max-depth 1'
alias diffstat='diffstat -C'

open () {
    if [[ "$1" =~ .*.xlsx ]]; then
	libreoffice "$@" &> /dev/null
    else
	xdg-open "$@"
    fi
}

# Bash shell (non-exported) variables
PROMPT_DIRTRIM=3  # number of directories to show


# Colors
# ------

#  Set use_color if you want color even if TERM is not set appropriately!
case "$TERM" in
    xterm-color|*-256color)
        use_color=true
esac

if [[ -n $use_color ]]; then
    # Enable colors for ls, etc.  Prefer ~/.dir_colors #64489
    if type -P dircolors >/dev/null ; then # check to see if the dircolors prog exists
	if [[ -f ~/.dir_colors ]] ; then   # source custom dir colors if defined
	    eval $(dircolors -b ~/.dir_colors)
	elif [[ -f /etc/DIR_COLORS ]] ; then # if no custom dir colors, check /etc
	    eval $(dircolors -b /etc/DIR_COLORS)
	fi  # don't need to `eval dircolors -b` if no custom files, bc it should have run
    fi

    BLACK="\[$(tput setaf 0)\]"
    RED="\[$(tput setaf 1)\]"
    GREEN="\[$(tput setaf 2)\]"
    YELLOW="\[$(tput setaf 3)\]"
    BLUE="\[$(tput setaf 4)\]"
    PURPLE="\[$(tput setaf 5)\]"
    CYAN="\[$(tput setaf 6)\]"
    MAGENTA="\[$(tput setaf 7)\]"
    GRAY="\[$(tput setaf 8)\]"
    BOLD="\[$(tput bold)\]"
    RESET="\[$(tput sgr0)\]"
    # export PS1="${GREEN}my prompt${RESET}> "

    if [[ ${EUID} != 0 ]] ; then
	PS1="${GRAY}\t${RESET} \w >> "
    else
	PS1='\[\033[01;32m\][\t]\[\033[00m\]\# '
    fi
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
# -------------

shopt -s globstar               # turn on ** and **/ globing! (ex: echo **)
# Bash won't get SIGWINCH if another process is in the foreground.
# Enable checkwinsize so that bash will check the terminal size when
# it regains control.  #65623
# http://cnswww.cns.cwru.edu/~chet/bash/FAQ (E11)
shopt -s checkwinsize
shopt -s expand_aliases
# Enable history appending instead of overwriting.  #139609
shopt -s histappend

# the following is slow on some machines, probably after initializing bash_completion
complete -cf sudo
# something also root-related, might remove
xhost +local:root > /dev/null 2>&1


# Chopping block
if [[ -f ~/.bash_chopping_block  ]]; then
    source ~/.bash_chopping_block
fi

# Program Configuration (Interactive Programs Only)
# -------------------------------------------------

profiles=('/usr/share/bash-completion/bash_completion' "$HOME/.fzf.bash")
if [[ -r "/usr/share/bash-completion/bash_completion" ]]; then
    source "/usr/share/bash-completion/bash_completion"
    complete -cf sudo
fi
if [[ -r ~/.fzf/.bash ]]; then
    source ~/.fzf/.bash
    complete -cf sudo
fi
for profile in "${profiles[@]}"; do
    if [[ -r "$profile" ]]; then
	source "$profile"
    fi
done

if [[ -f ~/anaconda3/etc/profile.d/conda.sh ]]; then
    source ~/anaconda3/etc/profile.d/conda.sh
fi

