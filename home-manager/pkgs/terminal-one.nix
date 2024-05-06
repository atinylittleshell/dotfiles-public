{ stdenv, fetchurl, lib }:

stdenv.mkDerivation rec {
  pname = "terminal-one";
  version = "1.6.3";

  src = fetchurl {
    url = "https://github.com/atinylittleshell/TerminalOne/releases/download/v${version}/TerminalOne-${version}-x86_64.AppImage";
    sha256 = "sha256-uJ0IEPWjy0W6Uz55UAKJDhdYCTuU0T1Yr/YFFyv5hQ4=";
  };

  dontUnpack = true;

  installPhase = ''
    mkdir -p $out/bin
    cp $src $out/bin/${pname}
    chmod +x $out/bin/${pname}
  '';

  meta = with lib; {
    description = "Terminal One";
    homepage = "https://github.com/atinylittleshell/TerminalOne";
    license = licenses.mit;
  };
}
