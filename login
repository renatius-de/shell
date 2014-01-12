# {{{ load ssh and gpg keys
[[ ${SHLVL} -eq 1 ]] && [[ -x /usr/bin/keychain ]] &&
    keychain --nogui --quiet \
        ~/.ssh/keys/id_rsa.git ~/.ssh/keys/id_rsa.github \
        ~/.ssh/keys/id_rsa.hidrive ~/.ssh/keys/id_rsa.stauzebach.git
#}}}

# vim: filetype=sh foldmethod=marker textwidth=0
