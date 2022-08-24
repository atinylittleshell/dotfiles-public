#!/usr/bin/env bash

export DOT_FILES_HOME="$(realpath "$(dirname "${BASH_SOURCE[0]}")")"

ln -nsf "$DOT_FILES_HOME/.zshrc" ~/.zshrc

if [[ ! -d "$DOT_FILES_HOME/.tmux/plugins/tpm" ]]
then
  git clone https://github.com/tmux-plugins/tpm "$DOT_FILES_HOME/.tmux/plugins/tpm"
fi
