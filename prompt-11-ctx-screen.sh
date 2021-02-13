# set a prompt context with screen window number
if [[ $TERM = screen* ]]; then
    PROMPT_CONTEXT="SC:$WINDOW"
fi
