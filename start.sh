# modular dotbash - main startup file

# paths

BASHD="${HOME}/.bash.d"

# get logging functions

if [ -f /lib/gentoo/functions.sh ]; then
    . /lib/gentoo/functions.sh
    einfo "Found gentoo functions.sh"
else
    echo "No gentoo functions"
fi

# read shell config bits

SHCONFD="${BASHD}/config-*.sh"

for CONF in $SHCONFD; do
    if [ -f $CONF ]; then
        einfo "Running $CONF"
        . $CONF
    fi
done

unset SHCONFD

# read environment bits

ENVD="${BASHD}/env-*.sh"

for ENV in $ENVD; do
    if [ -f $ENV ]; then
        einfo "Running $ENV"
        . $ENV
    fi
done

unset ENVD

# read prompt bits

PROMPTD="${BASHD}/prompt-*.sh"
PROMPT_FINAL=0

for PROMPT in $PROMPTD; do
    if [ $PROMPT_FINAL = 0 ]; then
        if [ -f $PROMPT ]; then
            einfo "Running $PROMPT"
            . $PROMPT
        fi
    fi
done

unset PROMPTD
