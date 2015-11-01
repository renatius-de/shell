# {{{ load SSH and GPG keys
if [[ ${SHLVL} -le 1 ]]; then
    $(which keychain > /dev/null 2>&1) && \
        keychain --agents gpg,ssh --quiet --timeout 1440 \
        keys/id_rsa.{bitbucket,git{,hub}} F91E87BC
    reset
fi
#}}}

# {{{ unburden home
[[ ${SHLVL} -le 1 ]] && $(which unburden-home-dir > /dev/null 2>&1) && \
    unburden-home-dir
#}}}

# vim: filetype=sh foldmethod=marker textwidth=80
