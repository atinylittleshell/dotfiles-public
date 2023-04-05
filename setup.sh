#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

if [ "$(uname)" == "Darwin" ]; then
	brew install git
	brew install zsh
  brew install ripgrep
  brew install neovim
  mkdir ~/.zsh
  git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.zsh/zsh-autosuggestions
	brew install starship
else
	sudo apt update
	sudo apt install git
	sudo apt install zsh
  sudo apt install fd-find
  sudo apt-get install ripgrep zip unzip
  mkdir ~/.zsh
  git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.zsh/zsh-autosuggestions
	curl -sS https://starship.rs/install.sh | sh
fi

rm ~/.zshrc
ln -s $SCRIPT_DIR/.zshrc ~/.zshrc

mkdir -p ~/.config
rm ~/.config/starship.toml
ln -s $SCRIPT_DIR/starship.toml ~/.config/starship.toml

rm ~/.config/nvim
ln -s $SCRIPT_DIR/nvim ~/.config/nvim

sudo rm /usr/bin/nvim
sudo ln -s $SCRIPT_DIR/nvim.appimage /usr/bin/nvim
