{ config, pkgs, ... }:

{
  imports = [
    ./common.nix
  ];

  home.username = "kchen6";
  home.homeDirectory = "/Users/kchen6";

  home.packages = with pkgs; [
  ];

  home.file = {
  };

  programs.git = {
    userName = "Kun Chen";
    userEmail = "kchen6@atlassian.com";
  };
}
