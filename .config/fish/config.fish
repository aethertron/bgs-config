
# add
for path in ~/bin ~/local/bin ~/.local/bin
    if not contains $path $PATH
        set PATH $path $PATH
    end;
end;

# env
set --export EDITOR nano
set --export PAGER "less -R"
set --export PYTHONSTARTUP ~/.pythonrc

# local config
if [ -f ~/.config/fish/config_local.fish ]
    source ~/.config/fish/config_local.fish
end
