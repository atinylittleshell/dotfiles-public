{ config, pkgs, ... }:

{
  imports = [
    ./common.nix
  ];

  home.username = "atinylittleshell";
  home.homeDirectory = "/home/atinylittleshell";

  home.packages = with pkgs; [
    # gnome tools
    gnome.gnome-tweaks
  ];

  home.file = {
    ".config/autostart/xset.desktop".source = files/.config/autostart/xset.desktop;
    ".wallpapers".source = files/.wallpapers;
    ".config/hypr".source = files/.config/hypr;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  programs.git = {
    userName = "atinylittleshell";
    userEmail = "shell@atinylittleshell.me";
  };
}
