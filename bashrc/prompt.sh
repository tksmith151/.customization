# Color Pallete
RESET='\033[0m'

CYAN='\033[1;36m'
YELLOW='\033[1;33m'

BG_BLUE='\033[1;37;44m'
BG_CYAN='\033[1;37;46m'
BG_GREEN='\033[1;37;42m'
BG_RED='\033[1;37;41m'
BG_YELLOW='\033[1;37;43m'

PROMPT_COMMAND=BuildPromptCommand

BuildPromptCommand(){
    PS1=''
    BuildHeader
    BuildSystemInformation
    BuildPrompt
}

BuildHeader(){
    PS1+=" \d \t \n"
}

BuildSystemInformation(){
    PS1+=" \u@\h:\w\n"
}

BuildPrompt(){
    PS1+=" > "
}