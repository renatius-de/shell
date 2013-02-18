# {{{ PATH
[ -d /usr/share/surfraw ]  && PATH=${PATH}:/usr/share/surfraw
[ -d /usr/local/zend/bin ] && PATH=${PATH}:/usr/local/zend/bin
[ -d ~/bin ]               && PATH=${PATH}:~/bin
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

# vim:filetype=sh textwidth=80 foldmethod=marker