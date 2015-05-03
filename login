# {{{ load SSH and GPG keys
[[ ${SHLVL} -lt 1 ]] && $(which keychain > /dev/null 2>&1) && \
    keychain --quiet --timeout 1440 keys/id_rsa.{bitbucket,git{,hub}}
#}}}

# {{{ unburden homw
[[ ${SHLVL} -lt 1 ]] && $(which unburden-home-dir > /dev/null 2>&1) && \
    unburden-home-dir
#}}}

# vim: filetype=sh foldmethod=marker textwidth=80
