
# add
for path in ~/bin ~/local/bin ~/.local/bin
    if not contains $path $PATH
        set PATH $path $PATH
    end;
end;

if [ -f ~/.config/fish/local_config.fish ]
    source ~/.config/fish/local_config.fish
end

# env
set --export EDITOR vim
set --export PAGER "less -R"
set --export PYTHONSTARTUP ~/.pythonrc
