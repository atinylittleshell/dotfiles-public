#!/usr/bin/env bash

# exit the script if any command fails
set -e

DOTFILES_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && cd .. && pwd )
cd $DOTFILES_DIR/nixos

sudo nixos-rebuild switch --flake .
