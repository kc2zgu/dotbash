# modular dotbash - main startup file

# paths

BASHD="${HOME}/.bash.d"

# check if interactive
IS_INTERACTIVE=0
if [[ $- = *i* ]] ; then
    IS_INTERACTIVE=1
fi
PP_CMD=`ps --no-headers -o comm $PPID`

# get logging functions

if [ -f /lib/gentoo/functions.sh ]; then
    . /lib/gentoo/functions.sh
    #einfo "Found gentoo functions.sh"
else
    # hard-coded standard color codes (skip tput detection)
    GOOD=$(printf '\033[32;01m')
    WARN=$(printf '\033[33;01m')
    BAD=$(printf '\033[31;01m')
    NORMAL=$(printf '\033[0m')

    # Display an informational message
    einfo()
    {
        echo " ${GOOD}*${NORMAL} $*"
    }

    # Display a warning message
    ewarn()
    {
        echo " ${WARN}*${NORMAL} $*"
    }

    # Display an erorr message, and return failure
    eerror()
    {
        echo " ${BAD}*${NORMAL} $*"
        return 1
    }

    # Start an operation, displaying a message
    ebegin()
    {
        echo -n " ${GOOD}*${NORMAL} $* ... "
    }

    # Display the status of the operation started with ebegin
    eend()
    {
        if [ "${1:-0}" = "0" ]; then
            echo "${GOOD}[ ok ]${NORMAL}"
        else
            echo "${BAD}[ !! ]${NORMAL}"
        fi
    }
fi

debug()
{
    echo "[bash:$$] $*" >> /tmp/bash.$$.log
}

dumpdebug()
{
    cat /tmp/bash.$$.log
}

debug "parent command: $PPID $PP_CMD"
debug "interactive: $IS_INTERACTIVE"

HAVE_X=0
if [ -n "$DISPLAY" ]; then
    HAVE_X=1
fi
HAVE_TTY=0
if tty > /dev/null; then
    HAVE_TTY=1
fi

# read shell config bits

SHCONFD="${BASHD}/config-*.sh"

for CONF in $SHCONFD; do
    if [ -f $CONF ]; then
        debug "Running $CONF"
        . $CONF
    fi
done

unset SHCONFD

# read environment bits

ENVD="${BASHD}/env-*.sh"

for ENV in $ENVD; do
    if [ -f $ENV ]; then
        debug "Running $ENV"
        . $ENV
    fi
done

unset ENVD

# read prompt bits

if [ $IS_INTERACTIVE = 1 ]; then
    PROMPTD="${BASHD}/prompt-*.sh"
    PROMPT_FINAL=0

    for PROMPT in $PROMPTD; do
        if [ $PROMPT_FINAL = 0 ]; then
            if [ -f $PROMPT ]; then
                debug "Running $PROMPT"
                . $PROMPT
            fi
        fi
    done

    unset PROMPTD
fi

# read application bits

APPD="${BASHD}/app-*.sh"

for APP in $APPD; do
    if [ -f $APP ]; then
        debug "Running $APP"
        . $APP
    fi
done

unset APPD
