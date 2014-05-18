# {{{ load SSH and GPG keys
if [[ -z ${DISPLAY} ]]; then
    [[ ${SHLVL} -eq 1  ]] && [[ -x /usr/bin/keychain ]] && \
        eval $(keychain --eval --quiet keys/id_rsa.{git,himalia} \
            keys/id_rsa.stauzebach.{backup,git,host_system,mail,samba,webserver} \
            keys/id_rsa.{bitbucket,github,hidrive} \
            keys/id_rsa.cbn.puck \
            F91E87BC
        )
else
    [[ -x /usr/bin/gnome-keyring-daemon ]] && eval $(gnome-keyring-daemon)
fi
#}}}

# {{{ reset terminal
reset
#}}}

# vim: filetype=sh foldmethod=marker textwidth=0
