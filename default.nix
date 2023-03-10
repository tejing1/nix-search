{ pkgs ? import <nixpkgs> {}
, resholve ? pkgs.resholve
, bash ? pkgs.bash
, coreutils ? pkgs.coreutils
, gnugrep ? pkgs.gnugrep
, gnused ? pkgs.gnused
, util-linux ? pkgs.util-linux
}:

resholve.mkDerivation {
  pname = "nix-search";
  version = "0.0.1";
  src = ./.;

  dontConfigure = true;
  dontBuild = true;

  installPhase = ''
    mkdir -p $out/bin
    cp nix-search $out/bin
  '';

  solutions.default = {
    scripts = [ "bin/nix-search" ];
    interpreter = "${bash}/bin/bash";
    inputs = [
      coreutils
      gnugrep
      gnused
      util-linux
    ];
  };
}
