# remove existing keys
if [[ ${SHLVL} -eq 1 ]] && hash keychain >> /dev/null 2>&1; then
    keychain --clear --quiet
fi

# the default umask is set in /etc/profile
umask 022

# vim: filetype=sh textwidth=80
