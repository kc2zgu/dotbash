if [ "$PP_CMD" = "sudo" ]; then
    debug "Prompt context: found sudo from $SUDO_USER"
    PROMPT_CONTEXT="SUDO($SUDO_USER)"
fi
