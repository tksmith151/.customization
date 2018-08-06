# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Source global definitions
if [ -f /etc/bashrc ]; then
    source /etc/bashrc
fi

# Load Modules
source ~/.dotfiles/bashrc.d/environment
source ~/.dotfiles/bashrc.d/options
source ~/.dotfiles/bashrc.d/aliases
source ~/.dotfiles/bashrc.d/prompt
