# Color Pallete
BLACK_ESC='\[\033[1;30m\]'
BLUE='\[\033[1;34m\]'
CYAN='\[\033[1;36m\]'
WHITE='\[\033[1;37m\]'
YELLOW='\[\033[1;33m\]'

RESET_ESC='\[\033[0m\]'

BLACK='\033[1;30m'
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
    EXIT="${?}"
    AT_PROMPT=1

    if [[ -z "${PROMPT_SIZE}" ]]; then
        LOCAL_PROMPT_SIZE="min"
    else
        LOCAL_PROMPT_SIZE="${PROMPT_SIZE}"
    fi

    PS1=''
    BuildTime
    BuildLocation
    BuildSystemInformation
    BuildPrompt

    if [[ -n "$FIRST_PROMPT" ]]; then
        unset FIRST_PROMPT
        return
    fi

    BuildExitStatus
}

BuildStart(){
    PS1+="${BLACK_ESC}|-( ${RESET_ESC}"
}

BuildConnection(){
    if [[ "${LOCAL_PROMPT_SIZE}" == "max" ]]; then
        PS1+="${BLACK_ESC} )\n|-( ${RESET_ESC}"
    else
        PS1+="${BLACK_ESC} )-( ${RESET_ESC}"
    fi
}

BuildEnd(){
    if [[ "${LOCAL_PROMPT_SIZE}" == "min" ]]; then
        PS1+="${BLACK_ESC} )${RESET_ESC}"
    else
        PS1+="${BLACK_ESC} )\n|${RESET_ESC}"
    fi
}

BuildTime(){
    BuildStart
    if [[ "${LOCAL_PROMPT_SIZE}" == "min" ]]; then
        PS1+="${BLUE}\A${RESET_ESC}"
    else
        PS1+="${BLUE}\d \t${RESET_ESC}"
    fi
}

BuildLocation(){
    BuildConnection
    if [[ "${LOCAL_PROMPT_SIZE}" == "min" ]]; then
        PS1+="${CYAN}\u@\h:\W${RESET_ESC}"
    else
        PS1+="${CYAN}\u@\h:\w${RESET_ESC}"
    fi
}

BuildSystemInformation(){
    if [[ "${LOCAL_PROMPT_SIZE}" != "min" ]]; then
        BuildConnection
        PS1+="${WHITE}SYS${RESET_ESC}"
    fi
}

BuildPrompt(){
    BuildEnd
    PS1+="${BLACK_ESC}->${RESET_ESC}${YELLOW} "
    PS2="${BLACK_ESC}|->${RESET_ESC}${YELLOW} "
}

BuildOutput(){
    if [[ -z "$AT_PROMPT" ]]; then
        return
    fi
    unset AT_PROMPT

    printf "${RESET}"
}

BuildExitStatus(){
    if [[ "${EXIT}" != 0 ]]; then
        printf "${BLACK}|== ${RESET}${RED}Error ${EXIT}${RESET}\n"
    else
        if [[ "${LOCAL_PROMPT_SIZE}" != "min" ]]; then
            printf "${BLACK}|== ${RESET}${GREEN}Success${RESET}\n"
        fi
    fi
    
    if [[ "${LOCAL_PROMPT_SIZE}" != "min" ]]; then
        printf "${BLACK}|\n|\n${RESET}"
    fi
}