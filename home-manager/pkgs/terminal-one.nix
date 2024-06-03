{ stdenv, fetchurl, lib, appimageTools }:

let
  pname = "terminal-one";
  version = "1.6.3";
  name = "${pname}-${version}";

  src = fetchurl {
    url = "https://github.com/atinylittleshell/TerminalOne/releases/download/v${version}/TerminalOne-${version}-x86_64.AppImage";
    sha256 = "sha256-uJ0IEPWjy0W6Uz55UAKJDhdYCTuU0T1Yr/YFFyv5hQ4=";
  };

  appimageContents = appimageTools.extractType2 { inherit name src; };
in appimageTools.wrapType2 rec {
  inherit name src;

  extraInstallCommands = ''
    mv $out/bin/${name} $out/bin/${pname}
    install -m 444 -D ${appimageContents}/@terminalonemonorepo.desktop $out/share/applications/TerminalOne.desktop
    install -m 444 -D ${appimageContents}/usr/share/icons/hicolor/512x512/apps/@terminalonemonorepo.png \
      $out/share/icons/hicolor/512x512/apps/@terminalonemonorepo.png
    substituteInPlace $out/share/applications/TerminalOne.desktop \
      --replace 'Exec=AppRun' 'Exec=${pname}'
  '';

  meta = with lib; {
    description = "Terminal One";
    homepage = "https://github.com/atinylittleshell/TerminalOne";
    license = licenses.mit;
  };
}
