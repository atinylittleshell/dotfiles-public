#!/bin/bash

# exit the script if any command fails
set -e

DOTFILES_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && cd .. && pwd )
sudo pacman -S --needed base-devel curl

rm -rf ~/.config/nvim || true
ln -s $DOTFILES_DIR/home-manager/files/.config/nvim ~/.config/nvim

rm ~/.config/discord/settings.json || true
ln -s $DOTFILES_DIR/home-manager/files/.config/discord/settings.json ~/.config/discord/settings.json

yay_if_needed() {
  if command -v $1 &> /dev/null; then
    echo "$1 is already installed. skipping..."
  else
    yay -S $1
  fi
}

# install git
if command -v git &> /dev/null; then
  echo "git is already installed. skipping..."
else
  sudo pacman -S git
fi

# install yay
if command -v yay &> /dev/null; then
  echo "yay is already installed. skipping..."
else
  rm -rf ~/yay || true
  git clone https://aur.archlinux.org/yay.git ~/yay
  cd ~/yay
  makepkg -si
fi

# install hyprland
if command -v Hyprland &> /dev/null; then
  echo "hyprland is already installed. skipping..."
else
  yay -S hyprland
  
  sudo systemctl enable nvidia-suspend.service
  sudo systemctl enable nvidia-hibernate.service
  sudo systemctl enable nvidia-resume.service

  rm -rf ~/.config/hypr || true
  ln -s $DOTFILES_DIR/home-manager/files/.config/hypr ~/.config/hypr
fi

# install waybar
if command -v waybar &> /dev/null; then
  echo "waybar is already installed. skipping..."
else
  yay -S waybar

  rm -rf ~/.config/waybar || true
  ln -s $DOTFILES_DIR/home-manager/files/.config/waybar ~/.config/waybar
fi

# install keyd and set up custom keymap
sudo mkdir -p /etc/keyd
sudo ln -sf $DOTFILES_DIR/keyd/default.conf /etc/keyd/default.conf

if systemctl is-enabled keyd &> /dev/null; then
  sudo keyd reload
else
  rm -rf ~/keyd || true
  git clone https://github.com/rvaiya/keyd.git ~/keyd
  cd ~/keyd
  make && sudo make install
  sudo systemctl enable keyd && sudo systemctl start keyd
fi

# install nvm and node
export NVM_DIR="$HOME/.nvm"
if [ -d $NVM_DIR ]; then
  echo "nvm is already installed. skipping..."
else
  PROFILE=/dev/null bash -c 'curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash'

  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

  nvm install 21
fi

# install terminal one
if command -v terminal-one &> /dev/null; then
  echo "terminal one is already installed. skipping..."
else
  sudo ln -sf $DOTFILES_DIR/bin/TerminalOne.AppImage /usr/local/bin/terminal-one

  rm -rf ~/.config/TerminalOne || true
  ln -s $DOTFILES_DIR/home-manager/files/.config/TerminalOne ~/.config/TerminalOne
fi

# install apps with yay
yay_if_needed google-chrome-stable
yay_if_needed discord
yay_if_needed obsidian
yay_if_needed hyprpaper
yay_if_needed dunst
yay_if_needed wlogout
yay_if_needed gnome-keyring

# install nix and home manager
if command -v nix-shell &> /dev/null; then
  echo "nix is already installed. skipping..."
else
  sh <(curl -L https://nixos.org/nix/install) --daemon
fi

if command -v home-manager &> /dev/null; then
  echo "home manager is already installed. skipping..."
else
  nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
  nix-channel --update
  nix-shell '<home-manager>' -A install
fi

rm ~/.config/home-manager/files || true
ln -s $DOTFILES_DIR/home-manager/files ~/.config/home-manager/files
ln -sf $DOTFILES_DIR/home-manager/common.nix ~/.config/home-manager/common.nix
ln -sf $DOTFILES_DIR/home-manager/arch.nix ~/.config/home-manager/home.nix

home-manager switch
