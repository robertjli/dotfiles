#!/bin/sh

for file in *; do
    target="$HOME/.$file"
    echo "-$target-$file-"
    if [ -e "$target" ]; then
        if [ ! -L "$target" ]; then
            echo "WARNING: $target exists but is not a symlink!"
        fi
    else
        if [ "$file" != 'install.sh' ] && [ "$file" != 'README.md' ]; then
            echo "Creating $target"
            ln -s "$PWD/$file" "$target"
        else
            echo "Skipping $file"
        fi
    fi
done
