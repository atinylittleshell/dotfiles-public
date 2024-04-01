#!/bin/bash

# exit the script if any command fails
set -e

DOTFILES_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && cd .. && pwd )
sudo pacman -S --needed base-devel curl

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

# install chrome
if command -v google-chrome-stable &> /dev/null; then
  echo "chrome is already installed. skipping..."
else
  yay -S google-chrome
fi

# install discord
if command -v discord &> /dev/null; then
  echo "discord is already installed. skipping..."
else
  yay -S discord
fi

# install obsidian
if command -v obsidian &> /dev/null; then
  echo "obsidian is already installed. skipping..."
else
  yay -S obsidian
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
if command -v nvm &> /dev/null; then
  echo "nvm is already installed. skipping..."
else
  PROFILE=/dev/null bash -c 'curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash'

  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

  nvm install 21
fi

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

ln -sf $DOTFILES_DIR/home-manager/files ~/.config/home-manager/files
ln -sf $DOTFILES_DIR/home-manager/common.nix ~/.config/home-manager/common.nix
ln -sf $DOTFILES_DIR/home-manager/arch.nix ~/.config/home-manager/home.nix

home-manager switch
