# update terminal window title

case $TERM in
    xterm*|rxvt*|Eterm|aterm|kterm|gnome*|interix)
        PROMPT_COMMAND+=('echo -ne "\033]0;" $([ $? = 0 ] || echo [!] ) "${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\007"')
    ;;
    screen*)
        PROMPT_COMMAND+=('echo -ne "\033k" $([ $? = 0 ] || echo [!] ) "${PWD/#$HOME/\~}\033\\"')
    ;;
esac
