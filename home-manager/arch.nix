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
    gnomeExtensions.tiling-assistant
    gnomeExtensions.fly-pie
  ];

  home.file = {
    ".config/autostart/xset.desktop".source = files/.config/autostart/xset.desktop;

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
