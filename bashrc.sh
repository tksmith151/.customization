# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Source global definitions
if [ -f /etc/bashrc ]; then
    source /etc/bashrc
fi

# Load Modules
for module in bashrc.d/*.sh
do
    if [ -x "${script}" ]; then
        source ${script}
    fi
done
