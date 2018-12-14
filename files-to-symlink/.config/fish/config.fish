function fish_user_key_bindings
         fish_default_key_bindings
         bind \em beginning-of-line
         bind \eK kill-whole-line
end

# env
set --export EDITOR "emacsclient -c --alternate-editor=nano"

alias run="xdg-open"
