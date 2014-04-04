# ~/.profile: executed by the command interpreter for login shells.

# the default umask is set in /etc/profile
umask 022

# extend PATH variable
extendPath() {
    if [ ! -d "${1}" ]; then
        echo "given argument should be a directory"
        return 1 # not a directory, break
    fi

    for d in $(echo ${PATH} | tr ":" " "); do
        # already in $PATH, nothing to do, quit silently
        [ "$d" = "${1}" ] && return 0
    done

    PATH="${1}:${PATH}"
}

# /sbin for none root users
[ -d /sbin ]           && extendPath "/sbin"
[ -d /usr/sbin ]       && extendPath "/usr/sbin"
[ -d /usr/local/sbin ] && extendPath "/usr/local/sbin"

# should be in system path, but isn't in Max OS X
[ -d /usr/local/bin ] && extendPath "/usr/local/bin"

# set PATH so it includes user's private bin if it exists
[ -d "~/bin" ] && extendPath "~/bin"

# unset function
unset -f extendPath

# vim: filetype=sh textwidth=80
