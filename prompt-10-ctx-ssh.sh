# set prompt context for SSH connections
if [ -n "$SSH_CLIENT" ]; then
    debug "Prompt context: found SSH"
    PROMPT_CONTEXT="SSH"
fi
