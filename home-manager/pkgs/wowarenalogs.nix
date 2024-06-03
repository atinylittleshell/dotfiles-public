{ stdenv, fetchurl, lib, appimageTools }:

let
  pname = "wowarenalogs";
  version = "4.8.4";
  name = "${pname}-${version}";

  src = fetchurl {
    url = "https://github.com/wowarenalogs/wowarenalogs/releases/download/v${version}/Wow-Arena-Logs-${version}.AppImage";
    sha512 = "CRn1jqCXLxyaUUdrHAduXtCPAOMAXSWY0ezlcWw8HB7T1XOVPTQNr4c0z2+qSIRtIloXE4UE3QoJ8kBBcWCudA==";
  };

  appimageContents = appimageTools.extractType2 { inherit name src; };
in appimageTools.wrapType2 rec {
  inherit name src;

  extraInstallCommands = ''
    mv $out/bin/${name} $out/bin/${pname}
    install -m 444 -D ${appimageContents}/wowarenalogs.desktop $out/share/applications/WoWArenaLogs.desktop
    install -m 444 -D ${appimageContents}/usr/share/icons/hicolor/512x512/apps/wowarenalogs.png \
      $out/share/icons/hicolor/512x512/apps/wowarenalogs.png
    substituteInPlace $out/share/applications/WoWArenaLogs.desktop \
      --replace 'Exec=AppRun' 'Exec=${pname}'
  '';

  meta = with lib; {
    description = "WoW Arena Logs";
    homepage = "https://github.com/wowarenalogs/wowarenalogs";
    license = licenses.mit;
  };
}
