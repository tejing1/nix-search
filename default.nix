{ pkgs ? import <nixpkgs> {}
, resholve ? pkgs.resholve
, bash ? pkgs.bash
, coreutils ? pkgs.coreutils
, gnugrep ? pkgs.gnugrep
, gnused ? pkgs.gnused
, faketty ? pkgs.faketty
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
      faketty
    ];
    execer = [
      "cannot:${faketty}/bin/faketty" # FALSE! But I only use it to call nix, which I wanted to get from PATH anyway.
    ];
  };
}
