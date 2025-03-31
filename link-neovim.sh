#!/bin/sh

src="$(pwd)/nvim"
dst="$HOME/.config/nvim"

rm -rf "$dst"

ln -s "$src" "$dst"
echo "Linked $src to $dst."