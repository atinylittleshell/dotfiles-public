{ config, pkgs, ... }:

{
  imports = [
    ./common.nix
  ];

  home.username = "atinylittleshell";
  home.homeDirectory = "/home/atinylittleshell";

  home.packages = with pkgs; [
    xsel
    xclip
    corretto21
    maven
  ];

  home.file = {
    ".wallpapers".source = ./files/.wallpapers;
    ".config/autostart/xset.desktop".source = ./files/.config/autostart/xset.desktop;
    ".config/rofi".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/github/atinylittleshell/dotfiles-public/home-manager/files/.config/rofi";
    ".config/nvim".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/github/atinylittleshell/dotfiles-public/home-manager/files/.config/nvim";
    ".config/TerminalOne".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/github/atinylittleshell/dotfiles-public/home-manager/files/.config/TerminalOne";
    ".config/discord/settings.json".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/github/atinylittleshell/dotfiles-public/home-manager/files/.config/discord/settings.json";
  };


  programs.git = {
    userName = "atinylittleshell";
    userEmail = "shell@atinylittleshell.me";
  };
}
