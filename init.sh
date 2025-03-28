# !/bin/bash

if [ -d "~/.config/starship" ]; then
    echo "Starship config directory exists. Copying configuration..."
else
    echo "Creating Starship config directory..."
    mkdir -p ~/.config/starship
fi
cp .wezterm.lua ~/.wezterm.lua

cp starship/starship.json ~/.config/starship/starship.json

cat zsh/work.sh zsh/global.sh >~/.zshrc
source ~/.zshrc
