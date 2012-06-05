#{{{ PATH
# path <S> <Z> (PATH <S>)
# An array (colon-separated list) of directories to search for commands. When
# this parameter is set, each directory is scanned and all files found are put
# in a hash table.
[[ -d /usr/share/surfraw ]] && PATH=${PATH}:/usr/share/surfraw
[[ -d ~/bin ]]              && PATH=${PATH}:~/bin
export PATH
#}}}

# {{{ STARTUP PROMPT
# using "birthday" and "calendar" to inform me about
# birthday and important events/anniversary with a
# modified look
builtin echo -e "--- `date '+%a %d %b %Y'` -------------------------------------------------------------"
uname -snro
uptime
if [[ -x /usr/bin/calendar && -x /usr/bin/cpp ]]; then
    builtin echo "--------------------------------------------------------------------------------"
    calendar -A3 -B1
fi
builtin echo "--------------------------------------------------------------------------------"
#}}}

# {{{ EDITOR
# setting the EDITOR environment
export EDITOR="${EDITOR:-vim}"
#}}}

# {{{ PAGER
# setting the PAGER environment
if [[ -x ~/.vim/bundle/VimPager/vimpager ]]; then
    export PAGER=~/.vim/bundle/VimPager/vimpager
elif [[ -x /usr/bin/vimpager ]]; then
    export PAGER="vimpager"
elif [[ -x /usr/share/vim/vimcurrent/macros/less.sh ]]; then
    export PAGER="/usr/share/vim/vimcurrent/macros/less.sh"
fi 
#}}}

# {{{ VISUAL
# setting the VISUAL environment to the same es EDITOR
export VISUAL="${EDITOR:-vim}"
#}}}

# {{{ MANWDTH
# setting the textwidth of manpages to 80 symbols, this make manpages more
# readable
export MANWIDTH="72"
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
if [[ -x ~/.shell/vimmanpager ]]; then
    export MANPAGER=~/.shell/vimmanpager
elif [[ -x /usr/bin/vimmanpager ]]; then
    export MANPAGER="vimmanpager"
fi
#}}}

# {{{ BROWSER
if [[ -x /usr/bin/lynx ]]; then
    export BROWSER=/usr/bin/lynx
elif [[ -x /usr/bin/links ]]; then
    export BROWSER=/usr/bin/links
elif [[ -x /usr/bin/elinks ]]; then
    export BROWSER=/usr/bin/elinks
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

# {{{ CDDB_PATH
# settings for mcdp
export CDDB_PATH="~/.cddb/"
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

# {{{ TZ
# timzone settings for Europe/Berlin
export TZ="Europe/Berlin"
#}}}

# {{{ GPG_TTY
# You should always add the following lines to your .bashrc or whatever
# initialization file is used for all shell invocations:
# GPG_TTY="tty"
# export GPG_TTY
# It is important that this environment variable always reflects the output of
# the tty command. For W32 systems this option is not required.
export GPG_TTY="${TTY:-`tty`}"
#}}}

# {{{ SUDO_PROMPT
# Used as the default password prompt.
[[ -x /usr/bin/sudo ]] && export SUDO_PROMPT="[sudo] password for %p:"
#}}}

# {{{ DVDCSS_CACHE
# Specify a directory in which to store title key values. This will speed up
# descrambling of DVDs which are in the cache. The DVDCSS_CACHE directory is
# created if it does not exist, and a subdirectory is created named after the
# DVD's title or manufac‐ turing date. If DVDCSS_CACHE is not set or is empty,
# libdvdcss will use the default value which is "${HOME}/.dvdcss/" under Unix
# and "C:\Documents and Settings\$USER\Application Data\dvdcss\" under Win32.
# The special value "off" disables caching.
export DVDCSS_CACHE="off"
#}}}

# {{{ DVDCSS_VERBOSE
# Sets the libdvdcss verbosity level.
#   0   Outputs no messages at all.
#   1   Outputs error messages to stderr.
#   2   Outputs error messages and debug messages to stderr.
export DVDCSS_VERBOSE=1
#}}}

# vim:filetype=sh textwidth=80 foldmethod=marker
