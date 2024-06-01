{ config, lib, pkgs, ... }:

{
  services.xserver = {
    enable = true;

    resolutions = [
      {
        x = 5120;
        y = 1440;
      }
    ];

    dpi = 109;

    windowManager.awesome = {
      enable = true;
      luaModules = with pkgs.luaPackages; [
        luarocks
      ];
    };
  };

  services.picom = {
    enable = true;
    settings = {
      blur = {
        method = "gaussian";
        size = 10;
        deviation = 5.0;
      };
      corner-radius = 8.0;
      round-borders = 1;
    };
  };

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
      enable = false;
    };
  };

  environment.systemPackages = with pkgs; [
    where-is-my-sddm-theme
  ];

  services.keyd = {
    enable = true;
    keyboards.default = {
      ids = [ "*" ];
      settings = {
        main = {
          leftmeta = "leftcontrol";
        };
      };
    };
  };

  services.ollama = {
    enable = true;
    acceleration = "cuda";
  };

  programs.thunar.enable = true;
  programs.xfconf.enable = true;
  programs.dconf.enable = true;
}
