# {{{ load ssh and gpg keys
[[ ${SHLVL} -eq 1 ]] && [[ -x /usr/bin/keychain ]] &&
    keychain --clear --nogui --quiet keys/id_rsa.git keys/id_rsa.github
#}}}

# vim:filetype=sh foldmethod=marker textwidth=0
