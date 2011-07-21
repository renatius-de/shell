#{{{ PATH
# path <S> <Z> (PATH <S>)
# An array (colon-separated list) of directories to search for commands. When
# this parameter is set, each directory is scanned and all files found are put
# in a hash table.
[[ -d /usr/share/surfraw ]]	&& PATH=${PATH}:/usr/share/surfraw
[[ -d ~/bin ]]		        && PATH=${PATH}:~/bin
export PATH #}}}

# {{{ STARTUP PROMPT
# using "birthday" and "calendar" to inform me about
# birthday and important events/anniversary with a
# modified look
builtin echo -e "--- `date '+%a %d %b %Y'` -------------------------------------------------------------"
uname -snro
uptime
if [[ -x /usr/bin/calendar && -x /usr/bin/cpp ]] ; then
    builtin echo "--------------------------------------------------------------------------------"
    calendar -A3 -B1
fi

# display birthdays on login
if [[ -x /usr/bin/birthday ]] ; then
    birthday -c -d3 -l3 -i80 -p1
fi

# display the message of the day
if [[ -x /usr/games/fortune || -x /usr/bin/fortune ]] ; then
    builtin echo "--------------------------------------------------------------------------------"
    fortune -s
fi

builtin echo "--------------------------------------------------------------------------------" #}}}

# {{{ EDITOR
# setting the EDITOR environment
export EDITOR="${EDITOR:-vim}" #}}}

# {{{ PAGER
# setting the PAGER environment
if [[ -x ~/.vim/bundle/vimpager/vimpager ]]; then
    export PAGER="~/.vim/bundle/vimpager/vimpager"
elif [[ -x /usr/bin/vimpager ]] ; then
    export PAGER="vimpager"
elif [[ -x /usr/share/vim/vimcurrent/macros/less.sh ]]; then
    export PAGER="/usr/share/vim/vimcurrent/macros/less.sh"
fi  #}}}

# {{{ VISUAL
# setting the VISUAL environment to the same es EDITOR
export VISUAL="${EDITOR:-vim}" #}}}

# {{{ MANWDTH
# setting the textwidth of manpages to 80 symbols, this make manpages more
# readable
export MANWIDTH="72" #}}}

# {{{ MANOPT
# If ${MANOPT} is set, it will be parsed prior to man’s command line and is
# expected to be in a similar format. As all of the other man specific
# environment variables can be expressed as command line options, and are thus
# candidates for being included in ${MANOPT} it is expected that they will become
# obsolete. N.B. All spaces that should be interpreted as part of an option’s
# argument must be escaped.
export MANOPT="--locale='C'" #}}}

# {{{ MANPAGER
# If MANPAGER is set, its value is used as the name of the program to use to
# display the man page. If not, then PAGER is used. If that has no value
# either, /usr/bin/less -is is used.
if [[ -x ~/.dotfiles/shell/vimmanpager ]] ; then
    export MANPAGER="${HOME:-~}/.dotfiles/shell/vimmanpager"
elif [[ -x /usr/bin/vimmanpager ]] ; then
    export MANPAGER="vimmanpager"
fi #}}}

# {{{ BROWSER
if [[ -x /usr/bin/lynx ]]; then
    export BROWSER=/usr/bin/lynx
elif [[ -x /usr/bin/links ]]; then
    export BROWSER=/usr/bin/links
elif [[ -x /usr/bin/elinks ]]; then
    export BROWSER=/usr/bin/elinks
fi #}}}

# {{{ PERLDOC
# Any switches in the "PERLDOC" environment variable will be used before the
# command line arguments.
#
# Useful values for "PERLDOC" include "-oman", "-otext", "-otk", "-ortf",
# "-oxml", and so on, depending on what modules you have on hand; or exactly
# specify the formatter class with "-MPod::Perldoc::ToMan" or the like.
#
# "perldoc" also searches directories specified by the "PERL5LIB" (or "PERLLIB"
# if "PERL5LIB" is not defined) and "PATH" environment variables. (The latter is
# so that embedded pods for executables, such as "perldoc" itself, are
# available.)
export PERLDOC="${PERLDOC} -oman -otext -otk -ortf -oxml -MPod::Perldoc::ToMan"
#}}}

# {{{ PERLDOC_PAGER
# "perldoc" will use, in order of preference, the pager defined in
# "PERLDOC_PAGER", "MANPAGER", or "PAGER" before trying to find a pager on its
# own. ("MANPAGER" is not used if "perldoc" was told to display plain text or
# unformatted pod.)
#
# One useful value for "PERLDOC_PAGER" is "less -+C -E".
export PERLDOC_PAGER="less -+C -E" #}}}

# {{{ GREP_COLOR
# give the output of grep a more usefull lock
export GREP_COLOR="31;01" #}}}

# {{{ GREP_OPTIONS
# additional options for grep
export GREP_OPTIONS="--color=auto" #}}}

# {{{ LESSCHARSET
# Selects a predefined character set.
export LESSCHARSET="UTF-8" #}}}

# {{{ LESSHISTFILE
# Name of the history file used to remember search commands and shell commands
# between invocations of less. If set to "-" or "/dev/null", a history file is
# not used. The default is "$HOME/.lesshst" on Unix systems, "$HOME/_lesshst" on
# DOS and Windows systems, or "$HOME/lesshst.ini" or "$INIT/lesshst.ini" on OS/2
# systems.
export LESSHISTFIE="-" #}}}

# {{{ color in less
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m']
#}}}

# {{{ CDDB_PATH
# settings for mcdp
export CDDB_PATH="~/.cddb/" #}}}

# {{{ GZIP BZIP2 LZMA XZ
# default options for gzip, bzip2, lzma and xz
[[ -x /bin/gzip ]] && export GZIP="--recursive -9"
[[ -x /bin/bzip2 ]] && export BZIP2="-9"
[[ -x /usr/bin/lzma ]] && export LZMA="-9"
[[ -x /usr/bin/xz ]] && export XZ_DEFAULTS="--check=sha256 -9"
#}}}

# {{{ TAR_OPTIONS
# The TAR_OPTIONS environment variable specifies default options to be placed in
# front of any explicit options.
export TAR_OPTIONS="--auto-compress --delay-directory-restore --exclude-backups --exclude-caches --no-overwrite-dir --numeric-owner --totals" #}}}

# {{{ TZ
# timzone settings for Europe/Berlin
export TZ="Europe/Berlin" #}}}

# {{{ GPG_TTY
# You should always add the following lines to your .bashrc or whatever
# initialization file is used for all shell invocations:
# GPG_TTY="tty"
# export GPG_TTY
# It is important that this environment variable always reflects the output of
# the tty command. For W32 systems this option is not required.
export GPG_TTY="${TTY:-`tty`}" #}}}

# {{{ SUDO_PROMPT
# Used as the default password prompt.
[[ -x /usr/bin/sudo ]] && export SUDO_PROMPT="[sudo] password for %p:" #}}}

# {{{ COLORTERM
# set terminal property (used e.g. by msgid-chooser)
export COLORTERM="yes" #}}}

# {{{ XSESSION
# start this session with startx
export XSESSION="fluxbox" #}}}

# {{{ DVDCSS_CACHE
# Specify a directory in which to store title key values. This will speed up
# descrambling of DVDs which are in the cache. The DVDCSS_CACHE directory is
# created if it does not exist, and a subdirectory is created named after the
# DVD's title or manufac‐ turing date. If DVDCSS_CACHE is not set or is empty,
# libdvdcss will use the default value which is "${HOME}/.dvdcss/" under Unix
# and "C:\Documents and Settings\$USER\Application Data\dvdcss\" under Win32.
# The special value "off" disables caching.
export DVDCSS_CACHE="/tmp/" #}}}

# {{{ DVDCSS_VERBOSE
# Sets the libdvdcss verbosity level.
#   0   Outputs no messages at all.
#   1   Outputs error messages to stderr.
#   2   Outputs error messages and debug messages to stderr.
export DVDCSS_VERBOSE=1 #}}}

# {{{ set ssh-agent and gpg-agent related variables
[[ -x /usr/bin/keychain ]] && \
    eval $(keychain --quiet --eval keys/id_rsa.git keys/id_rsa.server)
#}}}

# vim:filetype=sh textwidth=80 foldmethod=marker
