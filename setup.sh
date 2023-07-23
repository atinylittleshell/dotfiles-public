#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

rm ~/.zshrc
ln -s $SCRIPT_DIR/.zshrc ~/.zshrc

mkdir -p ~/.config
rm ~/.config/starship.toml
ln -s $SCRIPT_DIR/starship.toml ~/.config/starship.toml

rm ~/.config/nvim
ln -s $SCRIPT_DIR/nvim ~/.config/nvim

if [ "$(uname)" == "Darwin" ]; then
  brew tap homebrew/cask-versions
  brew install git
  brew install zsh
  brew install ripgrep
  brew install neovim
  mkdir -p ~/.zsh
  git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.zsh/zsh-autosuggestions
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
  brew install starship
else
  sudo apt update
  sudo apt install git curl zsh fd-find ripgrep zip unzip
  mkdir -p ~/.zsh
  git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.zsh/zsh-autosuggestions
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting

  sudo rm /usr/bin/nvim
  sudo ln -s $SCRIPT_DIR/nvim.appimage /usr/bin/nvim

  curl -sS https://starship.rs/install.sh | sh
fi
