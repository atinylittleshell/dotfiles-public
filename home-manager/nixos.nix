{ config, pkgs, ... }:

let
  terminal-one = pkgs.callPackage ./pkgs/terminal-one.nix { };
  wowarenalogs = pkgs.callPackage ./pkgs/wowarenalogs.nix { };
  configure-gtk = pkgs.callPackage ./pkgs/configure-gtk.nix { };
in
{
  imports = [
    ./common.nix
  ];

  home.username = "atinylittleshell";
  home.homeDirectory = "/home/atinylittleshell";

  home.packages = with pkgs; [
    configure-gtk
    xsel
    xclip
    gnumake
    corretto21
    maven
    nodejs_22
    python3
    pavucontrol
    rofi
    google-chrome
    discord
    obsidian
    lutris
    wowup-cf
    terminal-one
    wowarenalogs
  ];

  home.file = {
    ".wallpapers".source = ./files/.wallpapers;
    ".config/awesome".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/github/atinylittleshell/dotfiles-public/home-manager/files/.config/awesome";
    ".config/rofi".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/github/atinylittleshell/dotfiles-public/home-manager/files/.config/rofi";
    ".config/nvim".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/github/atinylittleshell/dotfiles-public/home-manager/files/.config/nvim";
    ".config/TerminalOne/config.js".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/github/atinylittleshell/dotfiles-public/home-manager/files/.config/TerminalOne/config.js";
  };

  home.pointerCursor = {
    package = pkgs.rose-pine-cursor;
    name = "BreezeX-RosePine-Linux";
    size = 24;
    gtk.enable = true;
  };

  gtk = {
    enable = true;

    theme = {
      package = pkgs.rose-pine-gtk-theme;
      name = "rose-pine";
    };

    iconTheme = {
      package = pkgs.rose-pine-icon-theme;
      name = "rose-pine";
    };
  };

  programs.git = {
    userName = "atinylittleshell";
    userEmail = "shell@atinylittleshell.me";
  };
}
