# Color Pallete
BLACK='\[\033[1;30m\]'
BLUE='\[\033[1;34m\]'
CYAN='\[\033[1;36m\]'
YELLOW='\[\033[1;33m\]'

RESET_ESC='\[\033[0m\]'

GREEN='\033[1;32m'
RED='\033[1;31m'

RESET='\033[0m'

# State Variables
FIRST_PROMPT=1
AT_PROMPT=1
unset AT_PROMPT

trap BuildOutput DEBUG
PROMPT_COMMAND=BuildPromptCommand

BuildPromptCommand(){
    EXIT=$?
    AT_PROMPT=1

    PS1=''
    BuildTime
    BuildLocation
    BuildSystemInformation
    BuildPrompt

    if [ -n "$FIRST_PROMPT" ]; then
        unset FIRST_PROMPT
        return
    fi

    BuildExitStatus
}

BuildStart(){
    PS1+="${BLACK}( ${RESET_ESC}"
}

BuildConnection(){
    PS1+="${BLACK} )-( ${RESET_ESC}"
}

BuildEnd(){
    PS1+="${BLACK} )${RESET_ESC}"
}

BuildTime(){
    PS1+="${BLUE}\d \t${RESET_ESC}"
}

BuildLocation(){
    PS1+="${CYAN}\u@\h:\w${RESET_ESC}"
}

BuildSystemInformation(){
    PS1+=""
}

BuildPrompt(){
    PS1+="${BLACK}->${RESET_ESC}${YELLOW} "
    PS2="${BLACK}|->${RESET_ESC}${YELLOW} "
}

BuildOutput(){
    if [ -z "$AT_PROMPT" ]; then
        return
    fi
    unset AT_PROMPT

    printf "${RESET}"
}

BuildExitStatus(){
    if [ $EXIT != 0 ]; then
        printf "${RED} Error ${EXIT} ${RESET}"
    else
        printf "${GREEN} Success ${RESET}"
    fi
    printf ""
}