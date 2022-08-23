#!/usr/bin/env bash

export DOT_FILES_HOME="$(realpath "$(dirname "${BASH_SOURCE[0]}")")"

ln -nsf "$DOT_FILES_HOME/.zshrc" ~/.zshrc
