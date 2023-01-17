#!/usr/bin/env bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

brew install git
brew install zsh
brew install neovim
brew install starship

rm ~/.zshrc
ln -s $SCRIPT_DIR/.zshrc ~/.zshrc

mkdir -p ~/.config
rm ~/.config/starship.toml
ln -s $SCRIPT_DIR/starship.toml ~/.config/starship.toml

rm ~/.config/nvim
ln -s $SCRIPT_DIR/nvim ~/.config/nvim
