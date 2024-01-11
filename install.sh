#!/usr/bin/env bash

echo "Do You Have Yay installed?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) break;;
        No ) sudo pacman -S --needed git base-devel && cd ~ && git clone https://aur.archlinux.org/paru.git && cd paru && makepkg -si && cd ~ && break;;
    esac
done

echo Installation may take some time

sleep 3

echo INSTALLING PACKAGES...

paru -S hyprland wlogout kitty xdg-desktop-portal-hyprland xdg-user-dirs qt5-wayland qt6-wayland networkmanager network-manager-applet bluez blueman dunst waybar rofi swww ly polkit-kde-agent nwg-look pywal-16-colors image-magick kvantum qt5ct zsh eza qview slurp grim swappy wl-clipboard pipewire pipewire-audio pipewire-jack pipewire-pulse pipewire-alsa pavucontrol pamixer thunar thunar-volman thunar-archive-plugin gvfs tumbler ttf-iosevka-nerd noto-fonts-emoji noto-fontsd-cjk otf-font-awesome firefox python-pywalfox

echo MOVING FILES...

cd ~/Gxro-dots

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" && git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting && git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions && mv .p10k.zsh ~/.p10k.zsh && mv .zshrc ~/.zshrc

cp -r .config/dunst ~/.config
cp -r .config/hypr ~/.config
cp -r .config/rofi ~/.config
cp -r .config/btop ~/.config
cp -r .config/Thunar ~/.config
cp -r .config/waybar ~/.config
cp -r .config/wlogout ~/.config
cp -r .config/wal ~/.config
cp -r .config/kitty ~/.config
mkdir -p ~/Pictures/Wallpapers
mkdir ~/Pictures/Screenshots

sudo chmod +x bin/wallswitcher.py
sudo chmod +x bin/thunar_wall.py
sudo mv bin/wallswitcher.py /bin/wallswitcher.py
sudo mv bin/thunar_wall.py /bin/thunar_wall.py 

echo Refer back to github page to complete.
