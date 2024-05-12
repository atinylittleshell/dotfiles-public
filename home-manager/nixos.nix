{ config, pkgs, ... }:

let
  terminal-one = pkgs.callPackage ./pkgs/terminal-one.nix { };
in
{
  imports = [
    ./common.nix
  ];

  home.username = "atinylittleshell";
  home.homeDirectory = "/home/atinylittleshell";

  home.packages = with pkgs; [
    killall
    waybar
    hyprpaper
    dunst
    wlogout
    pavucontrol
    nodejs_22
    bun
    kitty
    google-chrome
    discord
    obsidian
    lutris
    terminal-one
  ];

  home.file = {
    ".wallpapers".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/github/atinylittleshell/dotfiles-public/home-manager/files/.wallpapers";
    ".config/hypr".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/github/atinylittleshell/dotfiles-public/home-manager/files/.config/hypr";
    ".config/waybar".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/github/atinylittleshell/dotfiles-public/home-manager/files/.config/waybar";
    ".config/nvim".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/github/atinylittleshell/dotfiles-public/home-manager/files/.config/nvim";
    ".config/TerminalOne/config.js".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/github/atinylittleshell/dotfiles-public/home-manager/files/.config/TerminalOne/config.js";
  };

  programs.git = {
    userName = "atinylittleshell";
    userEmail = "shell@atinylittleshell.me";
  };
}
