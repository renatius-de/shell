# {{{ test for an interactive shell
case $- in
    !*i*) return ;;
esac
#}}}

# {{{ STARTUP PROMPT
# using "birthday" and "calendar" to inform me about
# birthday and important events/anniversary with a
# modified look
if [[ -z $CYG_SYS_BASHRC ]]; then
    # clear screen once
    clear

    builtin echo "--- $(date '+%a %d %b %Y') -------------------------------------------------------------"
    uname -snr
    uptime
    builtin echo -e "---------------------------------------------------------------------------------"
fi
#}}}

# {{{ TMOUT
# If this parameter is nonzero, the shell will receive an ALRM signal if a
# command is not entered within the specified number of seconds after issuing a
# prompt. If there is a trap on SIGALRM, it will be executed and a new alarm is
# scheduled using the value of the TMOUT parameter after executing the trap. If
# no trap is set, and the idle time of the terminal is not less than the value
# of the TMOUT parameter, zsh terminates. Otherwise a new alarm is scheduled to
# TMOUT seconds after the last keypress.
if [[ ${TERM} = linux ]]; then
    export TMOUT="3600"
else
    unset TMOUT
fi
#}}}

# {{{ EDITOR
# setting the EDITOR environment
export EDITOR="${EDITOR:-vim}"
#}}}

# {{{ PAGER
# setting the PAGER environment
if [[ -x ~/.vim/bundle/Pager/vimpager ]]; then
    export PAGER=~/.vim/bundle/Pager/vimpager
elif [[ -x /usr/bin/vimpager ]]; then
    export PAGER=vimpager
elif [[ -x /usr/share/vim/vimcurrent/macros/less.sh ]]; then
    export PAGER=/usr/share/vim/vimcurrent/macros/less.sh
fi
#}}}

# {{{ VISUAL
# setting the VISUAL environment to the same es EDITOR
export VISUAL="${EDITOR:-vim}"
#}}}

# {{{ MANWDTH
# setting the textwidth of manpages to 80 symbols, this make manpages more
# readable
export MANWIDTH="80"
#}}}

# {{{ MANOPT
# If ${MANOPT} is set, it will be parsed prior to man’s command line and is
# expected to be in a similar format. As all of the other man specific
# environment variables can be expressed as command line options, and are thus
# candidates for being included in ${MANOPT} it is expected that they will become
# obsolete. N.B. All spaces that should be interpreted as part of an option’s
# argument must be escaped.
export MANOPT="--locale='C'"
#}}}

# {{{ MANPAGER
# If MANPAGER is set, its value is used as the name of the program to use to
# display the man page. If not, then PAGER is used. If that has no value
# either, /usr/bin/less -is is used.
if [[ -x /usr/bin/vimmanpager ]]; then
    export MANPAGER=vimmanpager
elif [[ -x /usr/bin/less ]]; then
    export MANPAGER=/usr/bin/less
fi
#}}}

# {{{ GREP_COLOR
# give the output of grep a more usefull lock
export GREP_COLOR="31;01"
#}}}

# {{{ GREP_OPTIONS
# additional options for grep
export GREP_OPTIONS="--color=auto"
#}}}

# {{{ GZIP BZIP2 LZMA XZ
# default options for gzip, bzip2, lzma and xz
[[ -x /bin/gzip ]]     && export GZIP="--recursive -9"
[[ -x /bin/bzip2 ]]    && export BZIP2="-9"
[[ -x /usr/bin/lzma ]] && export LZMA="-9"
[[ -x /usr/bin/xz ]]   && export XZ_DEFAULTS="--check=sha256 -9"
#}}}

# {{{ TAR_OPTIONS
# The TAR_OPTIONS environment variable specifies default options to be placed in
# front of any explicit options.
export TAR_OPTIONS="--auto-compress --delay-directory-restore --exclude-backups --exclude-caches --no-overwrite-dir --numeric-owner --totals"
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

# {{{ source keychain files if exists
if $(which keychain > /dev/null 2>&1); then
    eval $(keychain --eval --quick --quiet)
fi
#}}}

# {{{ source virtualenvwrapper
if [ -r /etc/bash_completion.d/virtualenvwrapper ]; then
    source /etc/bash_completion.d/virtualenvwrapper
fi
#}}}

# vim: filetype=sh textwidth=80 foldmethod=marker
