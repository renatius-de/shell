function buildArchPackages() {
    local repo=~/norepositories/arch/aur
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

# vim: filetype=sh foldmethod=marker textwidth=0
