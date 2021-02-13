# set a basic prompt to not interfere with tools expecting a simple one
# this is mainly to make emacs TRAMP work; TERM=dumb is the only obvious way to detect it
if [ $TERM = dumb ]; then
    export PS1="\u@\h \w \\$"
    # inhibit future prompt settings
    PROMPT_FINAL=1
fi
