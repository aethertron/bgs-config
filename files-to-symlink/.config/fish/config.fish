function fish_user_key_bindings
         fish_default_key_bindings
         bind \ep history-search-backward
         bind \em beginning-of-line
         bind \eK kill-whole-line
end

alias run="xdg-open"
