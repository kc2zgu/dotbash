# start the keychain ssh key manager

if [ -n "$SSH_AGENT_PID" ]; then
    debug "keychain: existing SSH agent $SSH_AGENT_PID ($(ps --no-headers -o comm $SSH_AGENT_PID))"
fi

KC_KEYS="id_ecdsa id_ed25519"
KC_TIMEOUT=360

if which keychain >/dev/null 2>&1; then
    alias kc="keychain --timeout $KC_TIMEOUT $KC_KEYS --host $HOSTNAME"

    if [ $IS_INTERACTIVE = 1 ]; then
        keychain --timeout $KC_TIMEOUT $KC_KEYS --host $HOSTNAME
    else
        debug "non-interactive keychain start"
        keychain -q --host $HOSTNAME
    fi

    [ -f ~/.keychain/$HOSTNAME-sh ] && source ~/.keychain/$HOSTNAME-sh
fi
