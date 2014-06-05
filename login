# {{{ load SSH and GPG keys
[[ ${SHLVL} -eq 1  ]] && [[ -x /usr/bin/keychain ]] && \
    eval $(keychain --eval --quiet keys/id_rsa.git \
        keys/id_rsa.stauzebach.git \
        keys/id_rsa.{bitbucket,github})
#}}}

# vim: filetype=sh foldmethod=marker textwidth=0
