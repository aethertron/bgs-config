
# add
for path in ~/bin ~/local/bin ~/.local/bin
    if not contains $path $PATH
        set PATH $path $PATH
    end;
end;

# env
set --export EDITOR vim
set --export PAGER "less -R"
set --export PYTHONSTARTUP ~/.pythonrc

# if fish exists, set SHELL env to point to it (for tmux)
if which fish 1> /dev/null 2>&1
    set -x SHELL (which fish)
end

# local config
if [ -f ~/.config/fish/config_local.fish ]
    source ~/.config/fish/config_local.fish
end
