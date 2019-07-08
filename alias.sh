# {{{ test for an interactive shell
case $- in
    !*i*) return
        ;;
esac
[[ -z "$PS1" ]] && return
#}}}

# {{{ default options for coreutils
# {{{ default options for ls
alias ls="ls --color=auto --classify --dereference-command-line-symlink-to-dir --hide-control-chars --sort=version"

# some alias for ls to makes things much easier
alias l="ls --human-readable --numeric-uid-gid -l --time-style=+'%Y-%m-%d %H:%m'"
alias la="ls --almost-all"
alias lB="la --ignore-backups"
alias lD="la --directory"
alias llD="ll --directory"
alias li="la --inode"
alias ll="l --almost-all"
alias lr="ll --reverse -t"
alias lZ="la --context"
#}}}

# {{{ default options for rm
alias rm="rm --interactive=once --verbose"
alias rm="rm --interactive=once --verbose"
#}}}

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
#}}}

# {{{ default options for df
alias df="df --human-readable --local --print-type"
#}}}
#}}}

# {{{ default options for cp
alias cp="cp -av"
#}}}

# {{{ grep
alias grep="grep --color=auto"
#}}}

# {{{ defaults parameter for wget
which wget > /dev/null 2>&1 && alias wget="wget --tries=10 --continue --timeout=30 --wait=30"
#}}}

# {{{ use htop as top replacement
which htop > /dev/null 2>&1 && alias top="htop"
#}}}

# {{{ default options for locate
which locate > /dev/null 2>&1 && alias locate="locate --ignore-case --existing --regex"
#}}}

# {{{ default options for txt2regex
which txt2regex > /dev/null 2>&1 && alias txt2regex="txt2regex --prog egrep,php,sed,vim"
#}}}

# {{{ default options for cal
if which ncal > /dev/null 2>&1; then
    alias cal="cal -A 1 -B 1"
else
    alias cal="cal -3m"
fi
#}}}

# {{{ default options for ping/ping6
which ping > /dev/null 2>&1  && alias ping="ping -c3 -w10"
which ping6 > /dev/null 2>&1 && alias ping6="ping6 -c3 -w10"
#}}}

# {{{ default options for bc
which bc > /dev/null 2>&1 && alias bc="bc -l"
#}}}

# {{{ default options for lsattr and chattr
which lsattr > /dev/null 2>&1 && alias lsattr="lsattr -a"
which chattr > /dev/null 2>&1 && alias chattr="chattr -R"
#}}}

# {{{ usefull aliases for tmux
if which tmux > /dev/null 2>&1; then
    alias tmux="tmux -2u"

    alias tattach="tmux attach-session || tmux new-session"
fi
#}}}

# {{{ default options for rsync
if which rsync > /dev/null 2>&1; then
    OPTS="--recursive --links --perms --times --owner --group --devices \
        --specials --hard-links --whole-file --delete --cvs-exclude \
        --prune-empty-dirs --compress --stats --human-readable --progress"
    alias rsync="rsync ${OPTS}"
    alias rsync_fat="rsync --chmod='u=rwX,go=' --chown=$(id -u):$(id -g) --size-only"
fi
#}}}

# {{{ easy use of vagrant
if which vagrant > /dev/null 2>&1; then
    alias vauto="vagrant rsync-auto"
    alias vblist="vagrant box list"
    alias vbup="vagrant box update; vagrant box outdated --global"
    alias vdestroy="vagrant destroy --force"
    alias vhalt="vagrant halt"
    alias vprop="vagrant provision"
    alias vrel="vagrant reload --provision"
    alias vsync="vagrant rsync"
    alias vssh="vagrant ssh"
    alias vstat="vagrant status"
    alias vsus="vagrant suspend"
    alias vup="vagrant up --provision"
fi
#}}}

# {{{ pwgen
if which pwgen > /dev/null 2>&1; then
    alias pwgen="pwgen -cns"
    alias pgen="pwgen 50 1"
fi
#}}}

# {{{ vim/view
if which nvim > /dev/null 2>&1; then
    alias ex="nvim -E"
    alias vi="nvim"
    alias view="nvim -R"
    alias vim="nvim"
    alias vimdiff="nvim -d"
elif which vim > /dev/null 2>&1; then
    alias vi="vim"
    alias ex="vim -E"
fi
#}}}

# {{{ keychain
if which keychain > /dev/null 2>&1; then
    alias kdefault="keychain --systemd"

    alias kadd="kdefault --timeout $((60 * 1))"
    alias knormal="kdefault --timeout $((60 * 12))"

    alias kansible="kadd keys/id_rsa.ansible"
    alias kclear="keychain --clear"
    alias kpveu="knormal keys/id_rsa.{bitbucket,github,hetzner,live,test}"
    alias krenatius="knormal keys/id_rsa.{git{,hub},himalia}"
fi
#}}}

# vim: filetype=sh foldmethod=marker textwidth=0
