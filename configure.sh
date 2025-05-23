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

if [ -f ~/Library/Application Support/Code - Insiders/User/settings.json]; then
	rm ~/Library/Application\ Support/Code\ -\ Insiders/User/settings.json
fi
cp vscode.json ~/Library/Application\ Support/Code\ -\ Insiders/User/settings.json

if [ -f ~/Library/Application\ Support/Cursor/User/settings.json]; then
	rm ~/Library/Application\ Support/Cursor/User/settings.json
fi
cp vscode.json ~/Library/Application\ Support/Cursor/User/settings.json


source ~/.zshrc >/dev/null 2>&1
aerospace reload-config
