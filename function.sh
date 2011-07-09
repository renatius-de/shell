# {{{ uni-vpn
function vpn-uni (){
    if [[ ${1} == "open" ]] ; then
        sudo vpnc ~/Uni-Marburg/vpn.zug
        sudo route add default gw cvrzrz0102.hrz.uni-marburg.de dev tun0
    elif [[ ${1} == "close" ]] ; then
        sudo route del default gw cvrzrz0102.hrz.uni-marburg.de dev tun0
        sudo vpnc-disconnect
    else
        echo -e "usage: ${0} open/ ${0} close"
    fi
} #}}}

# {{{ clean unnessesary latex output file
function latex-clean (){
    find . -name '*.aux' -delete
    find . -name '*.bak' -delete
    find . -name '*.bbl' -delete
    find . -name '*.bib' -delete
    find . -name '*.blg' -delete
    find . -name '*.fls' -delete
    find . -name '*.idx' -delete
    find . -name '*.ilg' -delete
    find . -name '*.ind' -delete
    find . -name '*.log' -delete
    find . -name '*.nav' -delete
    find . -name '*.out' -delete
    find . -name '*.snm' -delete
    find . -name '*.toc' -delete
} #}}}

# {{{ clean git tree
function gitclean() {
    if [ -d .git ] ; then
        git gc

        find . -type f -name '*.orig' -delete
        find . -type f -name '*.BASE.*' -delete
        find . -type f -name '*.LOCAL.*' -delete
        find . -type f -name '*.REMOTE.*' -delete

        git fsck --unreachable
        git fsck --full
        git prune

        if [ -r .gitignore ] ; then
            while read line ; do
                find . -type f -name "${line}" -delete
            done < .gitignore
        fi
    fi
} #}}}

# vim:filetype=sh textwidth=80 foldmethod=marker
