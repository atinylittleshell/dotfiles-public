#!/bin/bash

# exit the script if any command fails
set -e

DOTFILES_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && cd .. && pwd )

rm -rf ~/.config/nvim || true
ln -s $DOTFILES_DIR/home-manager/files/.config/nvim ~/.config/nvim

rm -rf ~/.config/wezterm || true
ln -s $DOTFILES_DIR/home-manager/files/.config/wezterm ~/.config/wezterm

rm -rf ~/.config/TerminalOne || true
ln -s $DOTFILES_DIR/home-manager/files/.config/TerminalOne ~/.config/TerminalOne

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

# install nix and home manager
if command -v nix-shell &> /dev/null; then
  echo "nix is already installed. skipping..."
else
  sh <(curl -L https://nixos.org/nix/install)
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
ln -sf $DOTFILES_DIR/home-manager/mac-work.nix ~/.config/home-manager/home.nix

home-manager switch
