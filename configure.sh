# !/bin/bash

if [ ! -d "~/.config/starship" ]; then
    mkdir -p ~/.config/starship
fi

if [ -f "~/.wezterm.lua" ]; then
    rm ~/.wezterm.lua
fi

cp wezterm.lua ~/.wezterm.lua

if [ -f "~/.config/starship.toml" ]; then
    rm ~/.config/starship.toml
fi

cp starship.omp.json ~/.config/starship.omp.json

if [ -f "~/.zshrc" ]; then
    rm ~/.zshrc
fi
cp zshrc ~/.zshrc

source ~/.zshrc > /dev/null 2>&1
