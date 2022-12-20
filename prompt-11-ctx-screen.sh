# set a prompt context with screen window number
if [[ $TERM = screen* ]]; then
    debug "Prompt context: found screen"
    PROMPT_CONTEXT="SC:$WINDOW"
fi
