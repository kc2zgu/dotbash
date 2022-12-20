if [ -d ~/perl5 ]; then
    LL_VARS=$(perl -Mlocal::lib 2>/dev/null)
    if [ $? -eq 0 ]; then
        eval "$LL_VARS"
    else
        ewarn "~/perl5 found but local::lib not installed"
    fi

    unset LL_VARS
fi
