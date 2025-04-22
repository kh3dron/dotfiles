#!/bin/zsh

# Check if desktoppr is installed
if ! command -v desktoppr &> /dev/null; then
    echo "Error: desktoppr is not installed. Please install it with 'brew install desktoppr'"
    exit 1
fi

# Check if a wallpaper name was provided
if [ $# -eq 0 ]; then
    echo "Usage: $0 <wallpaper-name>"
    echo "Available wallpapers:"
    for file in "$(dirname "$0")"/wallpapers/*; do
        basename "$file" | sed 's/\.[^.]*$//'
    done
    exit 1
fi

# Find the wallpaper file regardless of extension
wallpaper_name=$1
wallpaper_path=""
for file in "$(dirname "$0")"/wallpapers/*; do
    name_without_ext=$(basename "$file" | sed 's/\.[^.]*$//')
    if [ "$name_without_ext" = "$wallpaper_name" ]; then
        wallpaper_path="$file"
        break
    fi
done

# Check if the wallpaper file exists
if [ ! -f "$wallpaper_path" ]; then
    echo "Error: Wallpaper '$1' not found in wallpapers directory"
    exit 1
fi

# Set the wallpaper
desktoppr "$wallpaper_path"
echo "Wallpaper set to: $1"