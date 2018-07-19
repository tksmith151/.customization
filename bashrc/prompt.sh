# Color Pallete
RESET='\033[0m'

CYAN='\033[1;36m'
YELLOW='\033[1;33m'

BG_BLUE='\033[1;37;44m'
BG_CYAN='\033[1;37;46m'
BG_GRAY='\033[1;37;47m'
BG_GREEN='\033[1;37;42m'
BG_RED='\033[1;37;41m'
BG_YELLOW='\033[1;37;43m'

# State Variables
#FIRST_PROMPT=1
AT_PROMPT=1
unset AT_PROMPT

trap BuildStart DEBUG
PROMPT_COMMAND=BuildPromptCommand

BuildPromptCommand(){
    EXIT=$?
    AT_PROMPT=1

    PS1=''
    BuildHeader
    BuildSystemInformation
    BuildPrompt

    #if [ -n $FIRST_PROMPT ]; then
    #    unset FIRST_PROMPT
    #    return
    #fi

    BuildFooter
}

BuildHeader(){
    PS1+="${BG_BLUE} \d \t ${RESET}\n"
}

BuildSystemInformation(){
    PS1+="${BG_CYAN} @ ${RESET}${CYAN} \u@\h:\w${RESET}\n"
}

BuildPrompt(){
    PS1+="${BG_YELLOW} > ${RESET}${YELLOW} "
    PS2="${BG_YELLOW} > ${RESET}${YELLOW} "
}

BuildStart(){
    if [ -z $AT_PROMPT ]; then
        return
    fi
    unset AT_PROMPT

    printf "${BG_GRAY}                     ${RESET}\n"
}

BuildFooter(){
    if [ $EXIT != 0 ]; then
        printf "${BG_RED}                     "
    else
        printf "${BG_GREEN}                     "
    fi
    printf "${RESET}\n\n\n\n"
}