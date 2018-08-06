# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Load ~/.bashrc settings
if [ -e ~/.bashrc ]; then
    source ~/.bashrc
fi