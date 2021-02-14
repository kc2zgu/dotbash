# start the keychain ssh key manager

if [ -n "$SSH_AGENT_PID" ]; then
    debug "keychain: existing SSH agent $SSH_AGENT_PID ($(ps --no-headers -o comm $SSH_AGENT_PID))"
fi

KC_KEYS="id_rsa id_dsa id_ecdsa id_ecdsa-sk id_ed25519 id_ed25519-sk"
KC_TIMEOUT=360

if which keychain >/dev/null 2>&1; then
    KC_KEYS_VALID=""
    for KEY in $KC_KEYS; do
        if [ -f $HOME/.ssh/$KEY ]; then
            KC_KEYS_VALID="$KC_KEYS_VALID $KEY"
        fi
    done
    alias kc="keychain --timeout $KC_TIMEOUT $KC_KEYS_VALID --host $HOSTNAME"

    if [ $IS_INTERACTIVE = 1 ]; then
        keychain --timeout $KC_TIMEOUT $KC_KEYS_VALID --host $HOSTNAME
    else
        debug "non-interactive keychain start"
        keychain -q --host $HOSTNAME
    fi

    [ -f ~/.keychain/$HOSTNAME-sh ] && source ~/.keychain/$HOSTNAME-sh
fi
