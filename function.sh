# {{{ test for an interactive shell
case $- in
    !*i*) return
        ;;
esac
[[ -z "$PS1" ]] && return
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
    if hash php > /dev/null 2>&1 && [[ -e composer.json ]]; then
        php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"

        EXPECTED_SIGNATURE=$(wget https://composer.github.io/installer.sig -O - -q)
        ACTUAL_SIGNATURE=$(php -r "echo hash_file('SHA384', 'composer-setup.php');")

        if [ "${EXPECTED_SIGNATURE}" = "${ACTUAL_SIGNATURE}" ]; then
            php ./composer-setup.php --install-dir="bin" --filename=composer
        fi

        rm -f ./composer-setup.php

        php bin/composer install --no-interaction --optimize-autoloader --prefer-source
    else
        echo "php not installed or no composer.json file"
    fi
}

function updateComposer() {
    if hash php > /dev/null 2>&1 && [[ -e composer.json ]]; then
        php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"

        EXPECTED_SIGNATURE=$(wget https://composer.github.io/installer.sig -O - -q)
        ACTUAL_SIGNATURE=$(php -r "echo hash_file('SHA384', 'composer-setup.php');")

        if [ "${EXPECTED_SIGNATURE}" = "${ACTUAL_SIGNATURE}" ]; then
            php ./composer-setup.php --install-dir="bin" --filename=composer
        fi

        rm -f ./composer-setup.php

        php bin/composer update --no-interaction --optimize-autoloader --prefer-source
    else
        echo "php not installed or no composer.json file"
    fi
}
#}}}

# vim: filetype=sh foldmethod=marker textwidth=0
