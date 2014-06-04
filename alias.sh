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

    # {{{ default options for cp
    alias cp="cp -av"
    #}}}
else
    # {{{ default options for ls
    alias ls="ls -@FG"

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
$(which euses > /dev/null 2>&1) && alias euses="euses --colour --ignorecase"
#}}}

# {{{ default options for genlop
$(which genlop > /dev/null 2>&1) && alias genlop="genlop --info --time --unmerge"
#}}}

# {{{ defaults parameter for wget
$(which wget > /dev/null 2>&1) && alias wget="wget --tries=10 --continue --timeout=30 --wait=30"
#}}}

# {{{ default options for apg
if $(which apg > /dev/null 2>&1); then
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
elif $(which vimpager > /dev/null 2>&1); then
    alias less="vimpager"
    alias more="vimpager"
    alias pager="vimpager"
    alias pg="vimpager"
fi
#}}}

# {{{ default options for vim
if $(which vim > /dev/null 2>&1); then
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
$(which htop > /dev/null 2>&1) && alias top="htop"
#}}}

# {{{ default options for locate
$(which locate > /dev/null 2>&1) && alias locate="locate --ignore-case --existing --regex"
#}}}

# {{{ default options for txt2regex
$(which txt2regex > /dev/null 2>&1) && alias txt2regex="txt2regex --prog egrep,php,sed,vim"
#}}}

# {{{ default options for cal
if $(which ncal > /dev/null 2>&1); then
    alias cal="cal -A 1 -B 1"
else
    alias cal="cal -3m"
fi
#}}}

# {{{ default options for grc
if $(which grc > /dev/null 2>&1); then
    alias grc="grc --stderr --stdout --colour=auto"

    # default options for netstat, ping, traceroute
    $(which netstat > /dev/null 2>&1)    && alias netstat="grc netstat"
    $(which ping > /dev/null 2>&1)       && alias ping="grc ping -c5 -w10"
    $(which ping6 > /dev/null 2>&1)      && alias ping6="grc ping6 -c6 -w10"
    $(which traceroute > /dev/null 2>&1) && alias traceroute="grc traceroute"
else
    # default options for ping/ping6
    $(which ping > /dev/null 2>&1)       && alias ping="ping -c5 -w10"
    $(which ping6 > /dev/null 2>&1)      && alias ping6="ping6 -c5 -w10"
fi
#}}}

# {{{ default options for bc
$(which bc > /dev/null 2>&1) && alias bc="bc -l"
#}}}

# {{{ default options fpr pdflatex
if $(which pdflatex > /dev/null 2>&1); then
    alias pdflatex="pdflatex -file-line-error -halt-on-error -recorder"
    alias latex="pdflatex"
fi
#}}}

# {{{ default options for tidy
$(which tidy > /dev/null 2>&1) && alias tidy="tidy -indent -wrap 80 -errors"
#}}}

# {{{ default options for lsattr and chattr
$(which lsattr > /dev/null 2>&1) && alias lsattr="lsattr -a"
$(which chattr > /dev/null 2>&1) && alias chattr="chattr -RV"
#}}}

# {{{ default options for nmap
$(which nmap > /dev/null 2>&1) && alias nmap="nmap -A -T4 -p0-10240"
#}}}

# {{{ default options for netstat
$(which netstat > /dev/null 2>&1) && alias netulpen="netstat -tulpen"
#}}}

#{{{ usefull aliases for Debian Linux systems
if $(which aptitude > /dev/null 2>&1); then
    alias apc="aptitude changelog"
    alias apf="aptitude search"
    alias apl="aptitude show"
    alias apu="aptitude update"
fi
if $(which apt-file > /dev/null 2>&1); then
    alias aff="apt-file find"
    alias afl="apt-file list"
    alias afu="apt-file update"
fi
if $(which apt-cache > /dev/null 2>&1); then
    alias acd="apt-cache depends"
    alias acf="apt-cache search"
    alias acl="apt-cache show"
    alias acp="apt-cache policy"
    alias acr="apt-cache rdepends"
fi
#}}}

# {{{ usefull aliases for tmux
if $(which tmux > /dev/null 2>&1); then
    alias tmux="tmux -2uq"

    alias tattach="(tmux has-session -t Main && tmux attach-session -t Main ) || (tmux has-session && tmux attach-session) || tmux new-session -A"
    alias tinfo="tmux info"
    alias tkill="tmux kill-server"
    alias tlist="tmux list-sessions && tmux list-windows"
fi
#}}}

# {{{ default options for pmount
#$(which pmount > /dev/null 2>&1) && alias pmount="pmount -sAF -u 0022"
$(which pmount > /dev/null 2>&1) && alias pmount="pmount -sA -u 0022"
#}}}

# {{{ default switches for screen
if $(which screen > /dev/null 2>&1); then
    alias scrn="screen -wipe; screen -d -RR -U"
fi
#}}}

# {{{ default options for rsync
if $(which rsync > /dev/null 2>&1); then
    alias myrsync="rsync --recursive --links --perms --times --owner --group \
        --devices --specials --hard-links --whole-file --delete --cvs-exclude \
        --prune-empty-dirs --compress --stats --human-readable --progress"
    alias rsync_fat="myrsync --size-only"
    alias rsync_vagrant="myrsync --exclude 'vagrant'"

    if $(which chacl > /dev/null 2>&1); then
        alias myrsync="myrsync --acls"
    fi
    if $(which chattr > /dev/null 2>&1); then
        alias myrsync="myrsync --xattrs"
    fi
fi
#}}}

# {{{ aliases for wvdial
if $(which wvdial > /dev/null 2>&1); then
    alias wvdial="sudo /usr/bin/wvdial"
    alias pin="wvdial pin &> /dev/null"
    alias o2="(wvdial o2 &> /dev/null) &"
fi
#}}}

# {{{ defualt options for ssh-keyscan
$(which ssh-keyscan > /dev/null 2>&1) && alias ssh-keyscan="ssh-keyscan -H -t rsa,ecdsa"
#}}}

# {{{ default options for makepkg
$(which makepkg > /dev/null 2>&1) && alias makepkg="makepkg --check --clean --install --log --needed --noconfirm --syncdeps"
#}}}

# {{{ easy use of task
$(which task > /dev/null 2>&1) && alias retask="reload; clear; task"
#}}}

# {{{ easy use of pacman
if $(which pacman > /dev/null 2>&1); then
    alias pac="pacman --verbose --color auto"
    $(which pacmatic > /dev/null 2>&1) && alias pac="pacmatic --verbose --color auto"
fi
#}}}

# {{{ easy use of ctags
if $(which ctags > /dev/null 2>&1); then
    alias ctags-php="ctags -R --languages=+PHP,+HTML,+JavaScript,+SQL --exclude=.git --exclude=.svn --exclude=.css --totals ."
fi
#}}}

# vim: filetype=sh foldmethod=marker textwidth=0
