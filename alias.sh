# {{{ test for an interactive shell
case $- in
    !*i*) return ;;
esac
#}}}

# {{{ default options for coreutils
if $(type dircolors >> /dev/null); then
    # {{{ default options for ls
    alias ls="ls --color=auto --classify --dereference-command-line-symlink-to-dir --hide-control-chars --sort=version"

    # some alias for ls to makes things much easier
    alias l="ls --human-readable --numeric-uid-gid -l --time-style=+'%Y-%m-%d %H:%m'"
    alias la="ls --almost-all"
    alias lB="la --ignore-backups"
    alias lD="la --directory"
    alias li="la --inode"
    alias ll="l --almost-all"
    alias lZ="la --context"
    #}}}

    # {{{ default options for rm
    alias rm="rm --interactive=once --verbose"
    alias rm="rm --interactive=once --verbose" #}}}

    # {{{ create a directory with permission only for the user
    alias md="mkdir --mode=0700 --parents --verbose"
    #}}}

    # {{{ delete directories
    alias rmdir="rmdir --verbose"
    alias rd="rmdir --parents --ignore-fail-on-non-empty"
    #}}}

    # {{{ default options for chmod, chown, chgrp,...
    alias chgrp="chgrp --changes"
    alias chmod="chmod --changes"
    alias chown="chown --changes"
    #}}}

    # {{{ default options for du
    alias du="du --human-readable --one-file-system --time --time-style=+'%Y-%m-%d' --total"
    alias da="du --summarize"
    alias di="da --inode"
    #}}}

    # {{{ default options for df
    alias df="df --human-readable --local --print-type"
    alias di="df --inodes"
    #}}}
else
    # {{{ default options for ls
    alias ls="ls -@FGL"

    # some alias for ls to makes things much easier
    alias l="ls -hln"
    alias la="ls -A"
    alias lD="la -d"
    alias li="la -i"
    alias ll="l -A"
    #}}}

    # {{{ default options for rm
    alias rm="rm -iv"
    #}}}

    # {{{ create a directory with permission only for the user
    alias md="mkdir -m 0700 -pv"
    #}}}

    # {{{ delete directories
    alias rd="rmdir -p"
    #}}}

    # {{{ default options for du
    alias du="du -hx"
    #}}}

    # {{{ default options for df
    alias df="df -h"
    #}}}
fi
#}}}

# {{{ default options for euses
[[ -x /usr/bin/euses ]] && alias euses="euses --colour --ignorecase"
#}}}

# {{{ default options for genlop
[[ -x /usr/bin/genlop ]] && alias genlop="genlop --info --time --unmerge"
#}}}

# {{{ defaults parameter for wget
[[ -x /usr/bin/wget ]] && alias wget="wget --tries=10 --continue --timeout=30 --wait=30"
#}}}

# {{{ default options for apg
if [[ -x /usr/bin/apg ]]; then
    alias apg="apg -a 1 -n 5 -m 10 -x 25"
    alias apgsncl="apg -M SNCL"
    alias apgncl="apg -M NCL"
fi
#}}}

# {{{ use vim insteat of less as pager, less sucks, if it exists
if [[ -x ~/.vim/bundle/Pager/vimpager ]]; then
    alias less=~/.vim/bundle/Pager/vimpager
    alias more=~/.vim/bundle/Pager/vimpager
    alias pager=~/.vim/bundle/Pager/vimpager
    alias pg=~/.vim/bundle/Pager/vimpager
elif [[ -x /usr/bin/vimpager ]]; then
    alias less="vimpager"
    alias more="vimpager"
    alias pager="vimpager"
    alias pg="vimpager"
fi
#}}}

# {{{ default options for vim
if [[ -x /usr/bin/vim ]]; then
    alias ex="vim -E"
    if $(command vim --serverlist >> /dev/null 2>&1); then
        alias servi="vim --servername ${USER}@${HOSTNAME}"
        alias edit="vim --servername ${USER}@${HOSTNAME} --remote-tab-silent"
        alias gedit="gvim --servername ${USER}@${HOSTNAME} --remote-tab-silent"
    fi

    alias vi="vim -v"
    alias view="vim -R"
    alias vimdiff="vim -d"
fi
#}}}

# {{{ use htop as top replacement
[[ -x /usr/bin/htop ]] && alias top="htop"
#}}}

# {{{ get rid of the leading /sbin/
# alternative: export PATH=${PATH}:/usr/local/sbin:/usr/sbin:/sbin
[[ -x /sbin/ifconfig ]]  && alias ifconfig="/sbin/ifconfig"
[[ -x /sbin/ip ]]        && alias ip="/sbin/ip"
[[ -x /usr/sbin/lspci ]] && alias lspci="/usr/sbin/lspci"
[[ -x /usr/sbin/lsusb ]] && alias lsusb="/usr/sbin/lsusb"
#}}}

# {{{ default options for locate
[[ -x /usr/bin/locate ]] && alias locate="locate --ignore-case --existing --regex"
#}}}

# {{{ default options for txt2regex
[[ -x /usr/bin/txt2regex ]] && alias txt2regex="txt2regex --prog egrep,php,sed,vim"
#}}}

# {{{ default options for cal
alias cal="cal -3m"
#}}}

# {{{ default options for bc
[[ -x /usr/bin/bc ]] && alias bc="bc -l"
#}}}

# {{{ default options fpr pdflatex
if [[ -x /usr/bin/pdflatex ]]; then
    alias pdflatex="pdflatex -file-line-error -halt-on-error -recorder"
    alias latex="pdflatex"
fi
#}}}

# {{{ default options for mp3gain
[[ -x /usr/bin/mp3gain ]] && alias mp3gain="mp3gain --auto -q"
#}}}

# {{{ default options for tidy
[[ -x /usr/bin/tidy ]] && alias tidy="tidy -indent -wrap 80 -errors"
#}}}

# {{{ default options for lsattr and chattr
[[ -x /usr/bin/lsattr ]] && alias lsattr="lsattr -a"
[[ -x /usr/bin/chattr ]] && alias chattr="chattr -RV"
#}}}

# {{{ default options for nmap
[[ -x /usr/bin/nmap ]] && alias nmap="nmap -A -T4 -p0-10240"
#}}}

# {{{ default options for netstat
[[ -x /bin/netstat ]] && alias netulpen="netstat -tulpen"
#}}}

#{{{ usefull aliases for Debian Linux systems
if [ -x /usr/bin/aptitude ]; then
    alias apc="aptitude changelog"
    alias apf="aptitude search"
    alias apl="aptitude show"
    alias apu="aptitude update"
fi
if [[ -x /usr/bin/apt-file ]]; then
    alias aff="apt-file find"
    alias afl="apt-file list"
    alias afu="apt-file update"
fi
if [[ -x /usr/bin/apt-cache ]]; then
    alias acd="apt-cache depends"
    alias acf="apt-cache search"
    alias acl="apt-cache show"
    alias acp="apt-cache policy"
    alias acr="apt-cache rdepends"
fi
#}}}

# {{{ usefull aliases for tmux
if [[ -x /usr/bin/tmux ]]; then
    alias tmux="tmux -2uq"

    alias tattach="tmux attach"
    alias tinfo="tmux info"
    alias tkill="tmux kill-server"
fi
#}}}

# {{{ default options for pmount
#[ -x /usr/bin/pmount ] && alias pmount="pmount -sAF -u 0022"
[ -x /usr/bin/pmount ] && alias pmount="pmount -sA -u 0022"
#}}}

# {{{ default switches for screen
if [[ -x /usr/bin/screen ]]; then
    alias scrn="screen -wipe; screen -d -RR -U"
fi
#}}}

# {{{ alias for rsync
if [[ -x /usr/bin/rsync ]]; then
    alias myrsync="rsync --archive --hard-links --acls --xattrs --delete \
        --prune-empty-dirs --compress --stats --progress"
fi
#}}}

# {{{ aliases for wvdial
if [[ -x /usr/bin/wvdial ]]; then
    alias wvdial="sudo /usr/bin/wvdial"
    alias pin="wvdial pin &> /dev/null"
    alias o2="(wvdial o2 &> /dev/null) &"
fi
#}}}

# {{{ defualt options for ssh-keyscan
[[ -x /usr/bin/ssh-keyscan ]] && alias ssh-keyscan="ssh-keyscan -H -t rsa,ecdsa"
#}}}

# {{{ default options for makepkg
[[ -x /usr/bin/makepkg ]] && alias makepkg="makepkg --check --clean --install --log --needed --noconfirm --syncdeps"
#}}}

# {{{ easy use of pacman
if [[ -x /usr/bin/pacman ]]; then
    alias pac="pacman"
    [[ -x /usr/bin/pacmatic ]] && alias pac="pacman_log=/var/log/pacman log_file=/var/log/arch-news pacmatic"
fi
#}}}

# {{{ easy use of task
[[ -x /usr/bin/task ]] && alias retask="reload; clear; task; task myOverview"
#}}}

# {{{ easy use of ctags
if [[ -x /usr/bin/ctags ]]; then
    alias ctags-php="ctags -R --languages=+PHP,+HTML,+JavaScript,+SQL --exclude=.git --exclude=.svn --exclude=.css --totals ."
fi
#}}}

# vim: filetype=sh foldmethod=marker textwidth=0
