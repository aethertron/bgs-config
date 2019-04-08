# Defined in /home/wgs/.config/fish/config.fish @ line 1
function fish_user_key_bindings
    fish_default_key_bindings
    bind \em beginning-of-line
    bind \eK kill-whole-line
    bind \ek backward-kill-word
    bind \e\cf forward-bigword
    bind \e\cb backward-bigword
    bind \e\cd kill-bigword
    bind \e\ch backward-kill-bigword
    bind \e\ck backward-kill-bigword
end
