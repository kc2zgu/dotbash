if [ $IS_INTERACTIVE = 0 ]; then
    return
fi

OS=`uname -s`
KERN=`uname -r`
TTY=`tty`
if [ $OS = "FreeBSD" ]; then
    UP=`uptime |grep -oE 'up [^,]+'`
else
    UP=`uptime -p`
fi
einfo "Welcome to $HOSTNAME running $OS $KERN"
einfo "on $TTY, $UP"
unset OS
unset KERN
unset TTY
unset UP
