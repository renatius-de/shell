# {{{ test for an interactive shell
case $- in
    !*i*) return
        ;;
esac
[[ -z "$PS1" ]] && return
#}}}

# {{{ default options for coreutils
if hash dircolors >> /dev/null 2>&1; then
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
    alias llD="ll -d"
    alias li="la -i"
    alias ll="l -A"
    alias lr="ll -rt"
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

# {{{ grep
alias grep="grep --color=auto"
#}}}

# {{{ defaults parameter for wget
hash wget > /dev/null 2>&1 && alias wget="wget --tries=10 --continue --timeout=30 --wait=30"
#}}}

# {{{ use htop as top replacement
hash htop > /dev/null 2>&1 && alias top="htop"
#}}}

# {{{ default options for locate
hash locate > /dev/null 2>&1 && alias locate="locate --ignore-case --existing --regex"
#}}}

# {{{ default options for txt2regex
hash txt2regex > /dev/null 2>&1 && alias txt2regex="txt2regex --prog egrep,php,sed,vim"
#}}}

# {{{ default options for cal
if hash ncal > /dev/null 2>&1; then
    alias cal="cal -A 1 -B 1"
else
    alias cal="cal -3m"
fi
#}}}

# {{{ default options for grc
if hash grc > /dev/null 2>&1; then
    alias grc="grc --stderr --stdout --colour=auto"

    # default options for netstat, ping, traceroute
    hash netstat > /dev/null 2>&1    && alias netstat="grc netstat"
    hash ping > /dev/null 2>&1       && alias ping="grc ping -c5 -w10"
    hash ping6 > /dev/null 2>&1      && alias ping6="grc ping6 -c6 -w10"
    hash traceroute > /dev/null 2>&1 && alias traceroute="grc traceroute"
else
    # default options for ping/ping6
    hash ping > /dev/null 2>&1       && alias ping="ping -c5 -w10"
    hash ping6 > /dev/null 2>&1      && alias ping6="ping6 -c5 -w10"
fi
#}}}

# {{{ default options for bc
hash bc > /dev/null 2>&1 && alias bc="bc -l"
#}}}

# {{{ default options fpr pdflatex
if hash pdflatex > /dev/null 2>&1; then
    alias pdflatex="pdflatex -file-line-error -halt-on-error -recorder"
    alias latex="pdflatex"
fi
#}}}

# {{{ default options for lsattr and chattr
hash lsattr > /dev/null 2>&1 && alias lsattr="lsattr -a"
hash chattr > /dev/null 2>&1 && alias chattr="chattr -R"
#}}}

# {{{ usefull aliases for tmux
if hash tmux > /dev/null 2>&1; then
    alias tmux="tmux -2uq"

    alias tattach="(tmux has-session -t Main && tmux attach-session -t Main ) || (tmux has-session && tmux attach-session) || tmux new-session"
    alias tinfo="tmux info"
    alias tkill="tmux kill-server"
    alias tlist="tmux list-sessions && tmux list-windows"
fi
#}}}

# {{{ default options for pmount
#hash pmount > /dev/null 2>&1 && alias pmount="pmount -sAF -u 0022"
hash pmount > /dev/null 2>&1 && alias pmount="pmount -sA -u 0022"
#}}}

# {{{ default options for rsync
if hash rsync > /dev/null 2>&1; then
    OPTS="--recursive --links --perms --times --owner --group --devices \
        --specials --hard-links --whole-file --delete --cvs-exclude \
        --prune-empty-dirs --compress --stats --human-readable --progress"
    alias rsync="rsync ${OPTS}"
    alias rsync_fat="rsync --chmod='u=rwX,go=' --chown=$(id -u):$(id -g) --size-only"
    alias rsync_vagrant="rsync --chmod=ug=rwX,o=rX --exclude 'vagrant'"
    if hash chattr > /dev/null 2>&1; then
        OPTS="${OPTS} --xattrs"
    fi
    alias rsync="rsync ${OPTS}"
fi
#}}}

# {{{ easy use of ctags
if hash ctags > /dev/null 2>&1; then
    alias ctags-php="ctags -R --languages=PHP --exclude=*Test.php --exclude=*tests* --exclude=vendor/*/vendor ."
    alias ctags-python="ctags --languages=Python ."
fi
#}}}

# {{{ easy use of vagrant
if hash vagrant > /dev/null 2>&1; then
    alias vblist="vagrant box list"
    alias vbup="vagrant box update; vagrant box outdated --global"
    alias vdestroy="vagrant destroy --force; rm -rf .vagrant"
    alias vhalt="vagrant halt; rm -f .vagrant/ssh_config"
    alias vprop="vagrant provision; vagrant ssh-config --host vagrant >| .vagrant/ssh_config"
    alias vrel="vagrant reload --provision; vagrant ssh-config --host vagrant >| .vagrant/ssh_config"
    alias vssh="vagrant ssh"
    alias vstart="vagrant up --provision; vagrant ssh-config --host vagrant >| .vagrant/ssh_config"
    alias vstat="vagrant status"
    alias vstop="vhalt"
    alias vup="vstart"
fi
#}}}

# {{{ default options for phpunit, behat, and php
if hash php > /dev/null 2>&1; then
    alias psp='php -d "date.timezone=UTC" -d "error_reporting=E_ALL|E_STRICT" -d "memory_limit=1G"'
    alias behat='php ./bin/behat --verbose'
    alias phpunit='php ./bin/phpunit --no-coverage --colors --verbose'
fi
#}}}

# {{{ pwgen
if hash pwgen > /dev/null 2>&1; then
    alias pwgen="pwgen -cnys"
fi
#}}}

# {{{ maven
if hash mvn > /dev/null 2>&1; then
    alias maven="mvn clean validate compile test integration-test verify install package"
fi
#}}}

# vim: filetype=sh foldmethod=marker textwidth=0
