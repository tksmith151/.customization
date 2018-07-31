# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Source global definitions
if [ -f /etc/bashrc ]; then
    source /etc/bashrc
fi

# Load Modules
source ~/.customization/bashrc.d/environment
source ~/.customization/bashrc.d/options
source ~/.customization/bashrc.d/aliases
source ~/.customization/bashrc.d/prompt
