#!/bin/bash

# exit the script if any command fails
set -e

DOTFILES_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && cd .. && pwd )
sudo pacman -S --needed base-devel

yay_if_needed() {
  if command -v $1 &> /dev/null; then
    echo "$1 is already installed. skipping..."
  else
    yay -S --needed $1
  fi
}

# install yay
if command -v yay &> /dev/null; then
  echo "yay is already installed. skipping..."
else
  rm -rf ~/yay || true
  git clone https://aur.archlinux.org/yay.git ~/yay
  cd ~/yay
  makepkg -si
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

  nvm install 22
fi

# install terminal one
if command -v terminal-one &> /dev/null; then
  echo "terminal one is already installed. skipping..."
else
  wget -P $DOTFILES_DIR/bin https://github.com/atinylittleshell/TerminalOne/releases/download/v1.6.3/TerminalOne-1.6.3-x86_64.AppImage
  chmod +x $DOTFILES_DIR/bin/TerminalOne-1.6.3-x86_64.AppImage
  sudo ln -sf $DOTFILES_DIR/bin/TerminalOne-1.6.3-x86_64.AppImage /usr/local/bin/terminal-one
fi

# install wow arena logs
if command -v wowarenalogs &> /dev/null; then
  echo "wowarenalogs is already installed. skipping..."
else
  wget -P $DOTFILES_DIR/bin https://github.com/wowarenalogs/wowarenalogs/releases/download/v4.8.4/WoW-Arena-Logs-4.8.4.AppImage
  chmod +x $DOTFILES_DIR/bin/WoW-Arena-Logs-4.8.4.AppImage
  sudo ln -sf $DOTFILES_DIR/bin/WoW-Arena-Logs-4.8.4.AppImage /usr/local/bin/wowarenalogs
fi

# install apps with yay
yay_if_needed flatpak
yay_if_needed qt5-base
yay_if_needed qt5-graphicaleffects
yay_if_needed qt6-base
yay_if_needed qt6-5compat
yay_if_needed discord
yay_if_needed obsidian
yay_if_needed google-chrome
yay_if_needed rofi
yay_if_needed pavucontrol
yay_if_needed steam
yay_if_needed wowup-cf-bin
yay_if_needed picom
yay_if_needed ollama

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

rustup default stable
