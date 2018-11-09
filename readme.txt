Cross-machine linux configuration
Kept on a public github repository
As of late on a simplification streak

Only supporting one shell as the login shell: `bash`!

Will probably host fish config, however we assume bash is the login shell


The great purge of init files has begun
Init files I purposely do not want:
- .xprofile -> doesn't run on my machine anyway!
- .profile -> bash is primary login shell, bash does something weird and intricate with .profile, let's ditch it
- .login -> (t)csh-only I believe, we're ditching (t)csh as a login shell, so sayonara
