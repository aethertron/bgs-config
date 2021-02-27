# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# just source .bash_profile if it exists, same profile graphical or tty
if [[ -f ~/.bash_profile ]]; then
    source ~/.bash_profile
fi

# dirty hack for programs that are acting strange
if [[ command -v conky ]]; then
   conky -q -d -c ~/conky/conky-grapes/conky_gen.conkyrc &
fi
