# {{{ load SSH and GPG keys
if [[ -z ${DISPLAY} ]]; then
    [[ ${SHLVL} -eq 1  ]] && [[ -x /usr/bin/keychain ]] && \
        eval $(keychain --eval --quiet keys/id_rsa.git \
            keys/id_rsa.stauzebach.git \
            keys/id_rsa.{github,hidrive})
else
    [[ -x /usr/bin/gnome-keyring-daemon ]] && \
        eval $(gnome-keyring-daemon --start --components=pkcs11,secrets,ssh,gpg)
fi
#}}}

# vim: filetype=sh foldmethod=marker textwidth=0
