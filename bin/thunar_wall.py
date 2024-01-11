#!/usr/bin/python

import os
import argparse

ap = argparse.ArgumentParser()
ap.add_argument("-i", "--image", required=True, help="path to input image")
args = vars(ap.parse_args())

image_path = args["image"]

os.system(f'swww img -t wipe --transition-duration 3 {image_path}')
# Generarte Pywal colorscheme
os.system(f'wal -i {image_path} --cols16')
# Make a hard copy of the colorscheme
os.system(f'cp ~/.cache/wal/colors-dunst ~/.config/dunst/dunstrc')  # dunst
# hyprland
os.system(f'cp ~/.cache/wal/colors-hyprland.conf ~/.config/hypr/colors-hyprland.conf')
# restart dunst to apply new theme
os.system(f'killall dunst && dunst & disown')
os.system(f'cp ~/.cache/wal/colors-waybar.css ~/.config/waybar/colors-waybar.css')  # waybar
# kitty also needed to apply the colorscheme to all new windows after wallpaper change
os.system(f'cp ~/.cache/wal/colors-kitty.conf ~/.config/kitty/colors-kitty.conf')
# wlogout
os.system(f'cp ~/.cache/wal/color-wlogout.css ~/.config/wlogout/color-wlogout.css')
os.system(f'cp ~/.cache/wal/colors-rofi.rasi ~/.config/rofi/launchers/type-1/shared/colors.rasi')  # rofi
os.system(f'cp ~/.cache/wal/colors-btop.theme ~/.config/btop/themes/wal.theme')  # btop
os.system(f'pywalfox update')  # apply firefox theme
# Reload waybar to apply colorscheme
os.system(f'pkill waybar && waybar &')
# Send a notification
os.system(f'notify-send -h string:x-canonical-private-synchronous:hypr-cfg -u low "Wallpaper changed to {image_path}"')