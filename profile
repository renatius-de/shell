# remove existing keys
hash keychain >> /dev/null 2>&1 && keychain --clear --quiet

# the default umask is set in /etc/profile
umask 022

# vim: filetype=sh textwidth=80
