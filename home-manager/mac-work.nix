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


  programs.zsh = {
    shellAliases = {
      "acrastart" = "./gradlew :applications:autofix-service:nebulaeStart";
      "acrastop" = "./gradlew :applications:autofix-service:nebulaeStop";
      "acrac" = "./gradlew :applications:autofix-service:clean";
      "acrab" = "./gradlew :applications:autofix-service:build";
      "acrar" = "./gradlew :applications:autofix-service:bootRun";
      "acracb" = "./gradlew :applications:autofix-service:clean :applications:autofix-service:build";
      "acracbr" = "./gradlew :applications:autofix-service:clean :applications:autofix-service:build :applications:autofix-service:bootRun";
      "autodevit" = "./gradlew :applications:autofix-service:integrationTest --tests io.atlassian.micros.autofix.apps.acra.workflows.EvalItemsIT";
    };
  };
}
