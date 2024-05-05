{ ... }:

{
  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
    };
    grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
      useOSProber = true;
      gfxpayloadEfi = "3840x1080x32";
      gfxmodeEfi = "auto";
    };
  };
}
