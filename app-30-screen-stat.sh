if which screen > /dev/null; then
    if screen -ls |grep 'Dead' >/dev/null; then
        ewarn "There are dead screen sessions; use 'screen -wipe' to clean them up"
    fi
    if [ $TERM != "screen" ]; then
        if screen -ls |grep 'Detached' >/dev/null; then
            einfo "Detached screen sessions: " $(screen -ls |grep 'Detached' |grep -oE '[0-9+][^[:space:]]+')
        fi
    fi
fi
