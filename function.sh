# {{{ test for an interactive shell
case $- in
    !*i*) return ;;
esac
#}}}

# {{{ build packages from AUR for arch linux
function buildArchPackages() {
    local repo=~/norepositories/arch-aur
    local curpath="$(pwd)"
    cd ${repo}
    git fm
    git re
    git cf master
    git total-clean
    git ri

    for i in $(pacman -Qqm); do
        cd "${repo}"/${i}
        makepkg --check --clean --install --log --needed --noconfirm --syncdeps
    done

    cd ${curpath}
}
#}}}

# {{{ reload configuration
function reload() {
    if [ -n ${ZSH_NAME} ]; then
        while (( $# )); do
            unfunction $1
            autoload -U $1
            shift
        done

        [[ -r ~/.profile ]]  && source ~/.profile
        [[ -r ~/.zshenv ]]   && source ~/.zshenv
        [[ -r ~/.zprofile ]] && source ~/.zprofile
        [[ -r ~/.zshrc ]]    && source ~/.zshrc

        return 0
    elif [ -n ${BASH} ]; then
        [[ -r ~/.profile ]]      && source ~/.profile
        [[ -r ~/.bash_profile ]] && source ~/.bash_profile
        [[ -r ~/.bashrc ]]       && source ~/.bashrc

        return 0
    fi
}
#}}}

# vim: filetype=sh foldmethod=marker textwidth=0
