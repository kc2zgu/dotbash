# base prompt assembly script

CTX_PS1=
TAG_PS1=
PATH_PS1=

if [ -n "$PROMPT_CONTEXT" ]; then
    CTX_PS1="\[\033[01;35m\][$PROMPT_CONTEXT] "
fi
if [ -n "$PROMPT_TAG" ]; then
    TAG_PS1="$PROMPT_TAG "
fi
if [ -n "$PROMPT_PATH" ]; then
    PATH_PS1="$PROMPT_PATH"
fi
if [ $UID = 0 ]; then
    export PS1="\[\033[01;34m\]$PATH_PS1[\w]\n${CTX_PS1}\[\033[01;36m\]\D{%H:%M:%S} \[\033[01;31m\]\h\[\033[01;34m\] ${TAG_PS1}\$(if [ \$PROMPT_STATUS != 0 ]; then echo '\[\033[01;31m\]:( '; fi)\\$\[\033[00m\] "
else
    export PS1="\[\033[01;34m\]$PATH_PS1[\w]\n${CTX_PS1}\[\033[01;36m\]\D{%H:%M:%S} \[\033[01;32m\]\u@\h\[\033[01;34m\] ${TAG_PS1}\$(if [ \$PROMPT_STATUS != 0 ]; then echo '\[\033[01;31m\]:( '; fi)\\$\[\033[00m\] "
fi

unset PROMPT_CONTEXT
unset PROMPT_TAG
unset PROMPT_PATH
unset CTX_PS1
unset TAG_PS1
unset PATH_PS1
