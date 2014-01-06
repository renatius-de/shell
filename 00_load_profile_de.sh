if test -d /etc/profile.d/; then
    for profile in /etc/profile.d/*.sh; do
        test -r "$profile" && . "$profile"
    done
    unset profile
fi

if [[ ${TERM} = screen* ]]; then
    unset TMOUT
else
    export TMOUT="3600"
fi

# vim:filetype=sh foldmethod=marker textwidth=0
