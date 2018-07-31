# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Source global definitions
if [ -f /etc/bashrc ]; then
    source /etc/bashrc
fi

# Load Modules
source bashrc.d/environment
source bashrc.d/options
source bashrc.d/aliases
source bashrc.d/prompt
