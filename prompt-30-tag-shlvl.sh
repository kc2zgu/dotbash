# add a tag if $SHLVL > 1
if [[ "$TERM" = screen* ]]; then
    # skip the first SHLVL for screen
    if [ $SHLVL '>' 2 ]; then
        PROMPT_TAG="($SHLVL)"
    fi
else
    if [ $SHLVL '>' 1 ]; then
        PROMPT_TAG="($SHLVL)"
    fi
fi
