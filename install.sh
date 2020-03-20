#!/bin/bash

main () {
    printf "Hello!\n"
    check_pwd
    if [[ "$?" == 1 ]]; then
        printf "ERROR: run ./install.sh from the root of the repo\n"
        return 1
    fi

    install_shell_files
    install_dotfiles
    install_fonts

    printf "Goodbye!\n"
}

check_pwd () {
    if [[ $(dirname "$0") != "." ]]; then
        return 1
    fi
}

link () {
    local src="$1"
    local dest="$2"

    if [[ -e "$dest" ]]; then
        if [[ ! -L "$dest" ]]; then
            printf "WARNING: $dest exists but is not a symlink! Skipping...\n"
        fi
    else
        ln -s "$src" "$dest"
    fi
}

install_shell_files () {
    if [[ "$SHELL" == *"zsh"* ]]; then
        install_zsh_files
    elif [[ "$SHELL" == *"bash"* ]]; then
        install_bash_files
    else
        printf "WARNING: unrecognized \$SHELL $SHELL! Skipping shell-specific files\n"
    fi
}

install_zsh_files () {
    printf "zsh shell found, installing zsh-specific files\n"
    pushd zsh

    for file in *; do
        link "$PWD/$file" "$HOME/.$file"
    done

    popd
}

install_bash_files () {
    printf "bash shell found, installing bash-specific files\n"
    pushd bash

    for file in *; do
        link "$PWD/$file" "$HOME/.$file"
    done

    popd
}

install_dotfiles () {
    printf "Installing general dotfiles\n"
    pushd dotfiles

    for file in *; do
        link "$PWD/$file" "$HOME/.$file"
    done

    popd
}

install_fonts () {
    if [[ ! -d "fonts" ]]; then
        printf "WARNING: fonts directory missing! Skipping fonts\n"
        return 1
    fi

    if [[ "$OSTYPE" == "darwin"* ]]; then
        install_fonts_osx
    else
        printf "WARNING: unrecognized \$OSTYPE $OSTYPE! Skipping fonts\n"
    fi
}

install_fonts_osx () {
    local dest="$HOME/Library/Fonts"
    printf "OS X found, installing fonts to $dest\n"
    cp -R fonts/* "$dest"
}

main "$@"
