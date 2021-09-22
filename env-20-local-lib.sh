if [ -d ~/perl5 ]; then
    LL_VARS=$(perl -Mlocal::lib)
    eval "$LL_VARS"

    unset LL_VARS
fi
