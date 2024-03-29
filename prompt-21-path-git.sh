git_prompt()
{
    if git branch --show-current > /dev/null 2>&1; then
        local GITBRANCH="$(git branch --show-current 2> /dev/null)"
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
        if [ -z $GITBRANCH ]; then # detached HEAD
            GITBRANCH="</>"
        fi
        echo "[git:$GITBRANCH$GITCHANGES] "
    fi
}

export -f git_prompt

PROMPT_PATH="${PROMPT_PATH}\$(git_prompt)"
