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
      gfxpayloadEfi = "auto";
      gfxmodeEfi = "3840x1080x32";
    };
  };
}
