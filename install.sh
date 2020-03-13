#!/bin/bash

main () {
    check_pwd
    if [[ "$?" == 1 ]]; then
        printf "ERROR: run ./install.sh from the root of the repo\n"
        return 1
    fi

    install_dotfiles
    install_fonts
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
            printf "WARNING: $dest exists but is not a symlink!\n"
        fi
    else
        ln -s "$src" "$dest"
    fi
}

install_dotfiles () {
    cd dotfiles

    for file in *; do
        link "$PWD/$file" "$HOME/.$file"
    done

    cd ..
}

install_fonts () {
    if [[ ! -d "fonts" ]]; then
        printf "WARNING: fonts directory missing!\n"
        return 1
    fi

    if [[ "$OSTYPE" == "darwin"* ]]; then
        install_fonts_osx
    else
        printf "WARNING: unrecognized \$OSTYPE $OSTYPE, skipping fonts\n"
    fi
}

install_fonts_osx () {
    cp -R fonts/* "$HOME"/Library/Fonts
}

main "$@"
