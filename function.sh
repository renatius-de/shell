# {{{ test for an interactive shell
case $- in
    !*i*) return ;;
esac
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

# {{{ install and use php composer
function getComposer() {
    if $(which php > /dev/null 2>&1) && [[ -e composer.json ]]; then
        mkdir -p bin
        curl -sS https://getcomposer.org/installer | php -- --install-dir=bin --filename=composer
        php bin/composer install --prefer-source --optimize-autoloader --no-interaction
    else
        echo "php not installed or no composer.json file"
    fi
}

function updateComposer() {
    if $(which php > /dev/null 2>&1) && [[ -e composer.json ]]; then
        mkdir -p bin
        curl -sS https://getcomposer.org/installer | php -- --install-dir=bin --filename=composer
        php bin/composer update --prefer-source --optimize-autoloader --no-interaction
    else
        echo "php not installed or no composer.json file"
    fi
}
#}}}

# vim: filetype=sh foldmethod=marker textwidth=0
