# {{{ test for an interactive shell
case $- in
    !*i*) return ;;
esac
#}}}

# {{{ HOSTNAME
[ -z "${HOSTNAME}" ] && HOSTNAME="$(uname -n)"
#}}}

# {{{ PATH
# /sbin for none root users
[ -d /sbin ]                 && PATH="/sbin:${PATH}"
[ -d /usr/sbin ]             && PATH="/usr/sbin:${PATH}"
[ -d /usr/local/sbin ]       && PATH="/usr/local/sbin:${PATH}"

# adding software specific PATHs
[ -d /usr/share/surfraw ]    && PATH="/usr/share/surfraw:${PATH}"
[ -d /usr/local/zend/bin ]   && PATH="/usr/local/zend/bin:${PATH}"

# should be in system path, but isn't in Max OS X
[ -d /usr/local/bin ]        && PATH="/usr/local/bin:${PATH}"

# set PATH so it includes user's private bin if it exists
[ -d ${HOME}/bin ]           && PATH="${HOME}/bin:${PATH}"
export PATH
#}}}

# {{{ BROWSER
if [ -n "${DISPLAY}" ]; then
    if [ -x /usr/bin/chromium ]; then
        export BROWSER=/usr/bin/chromium
    elif [ -x /usr/bin/chrome ]; then
        export BROWSER=/usr/bin/chrome
    elif [ -x /usr/bin/firefox ]; then
        export BROWSER=/usr/bin/firefox
    elif [ -x /usr/bin/firefox-bin ]; then
        export BROWSER=/usr/bin/firefox-bin
    elif [ -x /usr/bin/iceweasel ]; then
        export BROWSER=/usr/bin/iceweasel
    fi
else
    if [ -x /usr/bin/lynx ]; then
        export BROWSER=/usr/bin/lynx
    elif [ -x /usr/bin/links ]; then
        export BROWSER=/usr/bin/links
    elif [ -x /usr/bin/elinks ]; then
        export BROWSER=/usr/bin/elinks
    fi
fi
#}}}

# {{{ SUDO
[ -x /usr/bin/sudo ] && export SUDO_PROMPT="[sudo] password for %U@%H: "
#}}}

# {{{ SSH
[ -x /usr/bin/ssh-askpass-fullscreen ] &&
    export SSH_ASKPASS=ssh-askpass-fullscreen
#}}}

# {{{ CDDB_PATH
export CDDB_PATH="~/.cddb/"
#}}}

# {{{ DVDCSS
export DVDCSS_CACHE="off"
export DVDCSS_VERBOSE=1
#}}}

# {{{ GPG
export GPG_TTY="${TTY:-`tty`}"
#}}}

# {{{ TZ
export TZ="Europe/Berlin"
#}}}

# {{{ language variables
export LC_CTYPE=en_US.UTF-8
export LC_NUMERIC=en_US.UTF-8
export LC_TIME=en_US.UTF-8
export LC_COLLATE=en_US.UTF-8
export LC_MONETARY=en_US.UTF-8
export LC_MESSAGES=en_US.UTF-8
export LC_PAPER=en_US.UTF-8
export LC_NAME=en_US.UTF-8
export LC_ADDRESS=en_US.UTF-8
export LC_TELEPHONE=en_US.UTF-8
export LC_MEASUREMENT=en_US.UTF-8
export LC_IDENTIFICATION=en_US.UTF-8
export LC_ALL=

export LANG=en_US
#}}}

# vim: filetype=sh textwidth=80 foldmethod=marker
