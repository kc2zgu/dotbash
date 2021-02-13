if [ $IS_INTERACTIVE = 0 ]; then
    return
fi

OS=`uname -s`
KERN=`uname -r`
TTY=`tty`
UP=`uptime -p`
einfo "Welcome to $HOSTNAME running $OS $KERN"
einfo "on $TTY, $UP"
unset OS
unset KERN
unset TTY
unset UP
