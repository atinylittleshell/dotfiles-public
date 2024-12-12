{ config, pkgs, ... }:

{
  imports = [
    ./common.nix
  ];

  home.username = "kunchen";
  home.homeDirectory = "/Users/kunchen";

  home.packages = with pkgs; [
    jdk
    maven
  ];

  home.file = {
  };

  programs.git = {
    userName = "atinylittleshell";
    userEmail = "shell@atinylittleshell.me";
  };
}
