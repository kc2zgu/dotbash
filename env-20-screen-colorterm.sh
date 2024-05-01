# screen v4 does not support truecolor. clear COLORTERM if it's set
if [[ $TERM = screen* ]]; then
    if [ $COLORTERM = "truecolor" ]; then
        debug "Detected screen, clearing COLORTERM"
        unset COLORTERM
    fi
fi
