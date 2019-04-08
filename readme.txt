Cross-machine linux configuration
Kept on a public github repository
As of late on a simplification streak

One directory per machine, use diff to sync them, crude but workable!

#### CentOs 7 Loaded  #####
login shell:       bash
shell used mainly: fish, be it user local or otherwise
teminal emulator:  kitty
window manager:    i3wm

### CentOs 7 Epel ####
login shell:       bash
shell used mainly: fish
terminal emulator: konsole
window manager:    kde plasma
notes:             Plain CentOs 7 + whatever is in the epel repo

### CentOs 7 Vanilla ###
login shell:       bash
shell used mainly: bash
terminal emulator: konsole
window manager:    kde plasma
notes:             Plain CentOs 7

#### Manjaro I3  #####
login shell: bash, this might change to fish








Only supporting one shell as the login shell: `bash`!

Will probably host fish config, however we assume bash is the login shell

Config calling order

Graphical Login (to my knowledge):
- 1. .Xmodmap (I assume)
- 2. .Xresources (I assume)
- 3. .bash_profile
  - 1. .bash_{aliases,chopping_block,functions,colors}
  - 2. .bashrc
    - 1. .dir_colors
- 4. .inputrc
-





The great purge of init files has begun
Init files I purposely do not want:
- .xprofile -> doesn't run on my machine anyway!
- .profile -> bash is primary login shell, bash does something weird and intricate with .profile, let's ditch it
- .login -> (t)csh-only I believe, we're ditching (t)csh as a login shell, so sayonara
