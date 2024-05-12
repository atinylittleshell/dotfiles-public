{ config, lib, pkgs, ... }:

{
  services.xserver.enable = true;

  services.gnome.gnome-keyring.enable = true;
  security.pam.services.sddm.enableGnomeKeyring = true;

  services.displayManager.sddm = {
    enable = true;
    package = pkgs.kdePackages.sddm;
    extraPackages = [
      pkgs.qt6.qt5compat
    ];
    theme = "where_is_my_sddm_theme";
    wayland = {
      enable = true;
    };
  };

  environment.systemPackages = with pkgs; [
    where-is-my-sddm-theme
  ];

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  programs.thunar.enable = true;
  programs.xfconf.enable = true;

  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
