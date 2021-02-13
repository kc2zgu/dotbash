# set prompt context for SSH connections
if [ -n "$SSH_CLIENT" ]; then
    PROMPT_CONTEXT="SSH"
fi
