git_prompt()
{
    local GITBRANCH="$(git branch --show-current 2> /dev/null)"
    if [ -n "$GITBRANCH" ]; then
        local GITSTATUS="$(git status --porcelain 2> /dev/null)"
        local GITCHANGES
        local GITCHANGECOUNT="$(grep -c '^.M' <<< $GITSTATUS)"
        if [ $GITCHANGECOUNT != 0 ]; then
            GITCHANGES="$GITCHANGES ${GITCHANGECOUNT}*"
        fi
        local GITADDCOUNT="$(grep -c '^[AM] ' <<< $GITSTATUS)"
        if [ $GITADDCOUNT != 0 ]; then
            GITCHANGES="$GITCHANGES ${GITADDCOUNT}+"
        fi
        echo "[git:$GITBRANCH$GITCHANGES] "
    fi
}

PROMPT_PATH="${PROMPT_PATH}\$(git_prompt)"
