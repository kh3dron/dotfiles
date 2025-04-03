# !/bin/bash

if [ -f "~/.config/starship.omp.json" ]; then
	rm ~/.config/starship.omp.json
fi
cp starship.omp.json ~/.config/starship.omp.json

if [ -f "~/.wezterm.lua" ]; then
	rm ~/.wezterm.lua
fi
cp wezterm.lua ~/.wezterm.lua

if [ -f "~/.aerospace.toml" ]; then
	rm ~/.aerospace/toml
fi
cp aerospace.toml ~/.aerospace.toml

if [ -f "~/.zshrc" ]; then
	rm ~/.zshrc
fi
cp zshrc ~/.zshrc
cat work.zshrc >>~/.zshrc

source ~/.zshrc >/dev/null 2>&1
aerospace reload-config
