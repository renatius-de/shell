# {{{ keychain
# load ssh and gpg keys into agents
[[ -x /usr/bin/keychain ]] && eval $(keychain --eval id_rsa.git F91E87BC)
#}}}

# vim:filetype=sh foldmethod=marker textwidth=0
