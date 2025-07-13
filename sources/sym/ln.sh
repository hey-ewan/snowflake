#!/usr/bin/env bash

mkdir -p "$HOME/.config/"

for item in "$PWD"/*; do
    if [ -e "$item" ]; then
        ln -rfsv "$item" "$HOME/.config/"
    fi
done
