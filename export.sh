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

    builtin echo "--- $(date '+%a %d %b %Y') --------------------------------------------------------------"
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
# of the TMOUT parameter, shell terminates. Otherwise a new alarm is scheduled
# to TMOUT seconds after the last key press.
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

# {{{ VISUAL
# setting the VISUAL environment to the same es EDITOR
export VISUAL="${EDITOR:-vim}"
#}}}

# {{{ MANWDTH
# setting the textwidth of manpages to 80 symbols, this make manpages more
# readable
export MANWIDTH="80"
#}}}

# {{{ TAR_OPTIONS
# The TAR_OPTIONS environment variable specifies default options to be placed in
# front of any explicit options.
export TAR_OPTIONS="--auto-compress --delay-directory-restore --exclude-backups --exclude-caches --no-overwrite-dir --numeric-owner --totals"
#}}}

# {{{ PATH
# add local rubygems installs
if which ruby > /dev/null 2>&1 && which gem > /dev/null 2>&1; then
    PATH="$(ruby -rubygems -e 'puts Gem.user_dir')/bin:$PATH"
fi

# /sbin for none root users
[ -d /sbin ]           && PATH="/sbin:${PATH}"
[ -d /usr/sbin ]       && PATH="/usr/sbin:${PATH}"
[ -d /usr/local/sbin ] && PATH="/usr/local/sbin:${PATH}"

# should be in system path, but isn't in Max OS X
[ -d /usr/local/bin ]  && PATH="/usr/local/bin:${PATH}"

# set PATH so it includes user's private bin if it exists
[ -d ${HOME}/bin ]     && PATH="${HOME}/bin:${PATH}"
export PATH
#}}}

# {{{ SUDO
[ -x /usr/bin/sudo ] && export SUDO_PROMPT="[sudo] password for %U@%H: "
#}}}

# {{{ TZ
export TZ="Europe/Berlin"
#}}}

# {{{ language variables
export LC_CTYPE=en_US.UTF-8
export LC_NUMERIC=en_US.UTF-8
export LC_TIME=de_DE.UTF-8
export LC_COLLATE=en_US.UTF-8
export LC_MONETARY=en_US.UTF-8
export LC_MESSAGES=en_US.UTF-8
export LC_PAPER=de_DE.UTF-8
export LC_NAME=en_US.UTF-8
export LC_ADDRESS=en_US.UTF-8
export LC_TELEPHONE=en_US.UTF-8
export LC_MEASUREMENT=de_DE.UTF-8
export LC_IDENTIFICATION=en_US.UTF-8
export LC_ALL=

export LANG=en_US.UTF-8

export LANGUAGE=en_GB:en_US:en:de_DE:de
#}}}

# vim: filetype=sh textwidth=80 foldmethod=marker
