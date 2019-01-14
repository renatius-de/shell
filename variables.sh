# {{{ test for an interactive shell
case $- in
    !*i*)
        return
        ;;
esac
[[ -z "$PS1" ]] && return
#}}}

# {{{ TMOUT
# If this parameter is nonzero, the shell will receive an ALRM signal if a
# command is not entered within the specified number of seconds after issuing a
# prompt. If there is a trap on SIGALRM, it will be executed and a new alarm is
# scheduled using the value of the TMOUT parameter after executing the trap. If
# no trap is set, and the idle time of the terminal is not less than the value
# of the TMOUT parameter, shell terminates. Otherwise a new alarm is scheduled
# to TMOUT seconds after the last key press.

if [[ ${TERM} = linux || ${SHLVL} -eq 1 ]]; then
    export TMOUT="900"
else
    unset TMOUT
fi
#}}}

# {{{ add SSH and GPG agent
which keychain > /dev/null 2>&1 && eval $(keychain --agents gpg,ssh --eval --quiet)
#}}}

# vim: filetype=sh textwidth=80 foldmethod=marker
