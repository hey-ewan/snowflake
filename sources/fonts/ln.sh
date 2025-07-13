#!/usr/bin/env bash

mkdir -p "$HOME/.local/share/fonts"

for item in "$PWD"/*; do
    if [ -e "$item" ]; then
        ln -rfsv "$item" "$HOME/.local/share/fonts"
    fi
done

fc-cache -fv
