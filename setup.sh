#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# symlink config files
mkdir -p ~/.config

rm ~/.zshrc
ln -s $SCRIPT_DIR/.zshrc ~/.zshrc

rm ~/.config/starship.toml
ln -s $SCRIPT_DIR/starship.toml ~/.config/starship.toml

if [ "$(uname)" == "Darwin" ]; then
  mkdir -p ~/Library/"Application Support"/"Terminal One"/

  rm ~/Library/"Application Support"/"Terminal One"/config.js
  ln -s $SCRIPT_DIR/terminal_one.config.js ~/Library/"Application Support"/"Terminal One"/config.js
else
  mkdir -p ~/.config/"Terminal One"/

  rm ~/.config/"Terminal One"/config.js
  ln -s $SCRIPT_DIR/terminal_one.config.js ~/.config/"Terminal One"/config.js
fi

rm ~/.config/nvim
ln -s $SCRIPT_DIR/nvim ~/.config/nvim

# install zsh extensions
mkdir -p ~/.zsh
git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.zsh/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting

# ktfmt
curl -o /usr/local/bin/ktfmt.jar https://repo1.maven.org/maven2/com/facebook/ktfmt/0.46/ktfmt-0.46-jar-with-dependencies.jar

# install os packages
if [ "$(uname)" == "Darwin" ]; then
  brew tap homebrew/cask-versions
  brew install git
  brew install zsh
  brew install ripgrep
  brew install neovim
  brew install starship
else
  sudo apt update
  sudo apt install git curl zsh fd-find ripgrep zip unzip gcc build-essential

  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash

  sudo rm /usr/bin/nvim
  sudo ln -s $SCRIPT_DIR/nvim.appimage /usr/bin/nvim

  curl -sS https://starship.rs/install.sh | sh
fi
