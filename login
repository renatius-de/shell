# {{{ load ssh and gpg keys
if [[ ${SHLVL} -eq 1 ]] && [[ -x /usr/bin/keychain ]]; then
    keychain keys/id_rsa.git keys/id_rsa.github F91E87BC
fi
#}}}

# vim:filetype=sh foldmethod=marker textwidth=0
