# If not running interactively, don't do anything (leave this at the top of this file)
[[ $- != *i* ]] && return

# All the default Omarchy aliases and functions
# (don't mess with these directly, just overwrite them here!)
source ~/.local/share/omarchy/default/bash/rc

# Add your own exports, aliases, and functions here.
#
# Make an alias for invoking commands you use constantly
# alias p='python'
#
# Use VSCode instead of neovim as your default editor
# export EDITOR="code"
#
# Set a custom prompt with the directory revealed (alternatively use https://starship.rs)
# PS1="\W \[\e]0;\w\a\]$PS1"


export PATH="$HOME/.local/scripts:$PATH"
export PATH="$HOME/.local/love:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"

# set vi mode
set -o vi

# set up fzf shell integration
eval "$(fzf --bash)"

alias gs='git status'

# notes picker
alias np="eza -1 --absolute --colour=never ~/notes | fzf --preview 'cat {-1}' \
	--bind 'enter:become(nvim {-1})' \
	--layout reverse"

eval "$(starship init bash)"

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

. "$HOME/.local/share/../bin/env"
source /opt/miniconda3/etc/profile.d/conda.sh
