# Defined in - @ line 0
function xclip --description 'alias xclip xsel --clipboard'
	xsel --clipboard $argv;
end
