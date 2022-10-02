#!/usr/bin/env bash

export DOT_FILES_HOME="$(realpath "$(dirname "${BASH_SOURCE[0]}")")"

ln -nsf "$DOT_FILES_HOME/.zshrc" ~/.zshrc

if [[ ! -d "$DOT_FILES_HOME/.oh-my-zsh" ]]
then
  git clone https://github.com/ohmyzsh/ohmyzsh.git "$DOT_FILES_HOME/.oh-my-zsh"
fi
