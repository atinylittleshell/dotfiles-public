{ pkgs }:

pkgs.writeTextFile {
  name = "configure-gtk";
  destination = "/bin/configure-gtk";
  executable = true;
  text = let
    schema = pkgs.gsettings-desktop-schemas;
    datadir = "${schema}/share/gsettings-schemas/${schema.name}";
  in ''
    export XDG_DATA_DIRS=${datadir}:$XDG_DATA_DIRS
    gsettings set org.gnome.desktop.interface cursor-theme "BreezeX-RosePine-Linux"
    gsettings set org.gnome.desktop.interface cursor-size 24
    gsettings set org.gnome.desktop.interface font-name "Noto Sans"
    gsettings set org.gnome.desktop.interface document-font-name "Noto Serif"
    gsettings set org.gnome.desktop.interface monospace-font-name "Hack Nerd Font"
    gsettings set org.gnome.desktop.interface font-antialiasing "rgba"
    gsettings set org.gnome.desktop.interface font-hinting "full"
    gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"
  '';
}
