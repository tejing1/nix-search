An attempt to recreate the former `nix search` functionality, which has been superceded by the new flakes-oriented cli.

It will check the nix configuration for whether flakes are enabled, and search the `nixpkgs` flake in the registry if so. If they are not enabled, it will search `<nixpkgs>`.

Basic installation (better to grab a stable url for a given commit and specify the hash):
```nix
{ pkgs, ... }:
{
  environment.systemPackages = [ (import (builtins.fetchTarball { url = "https://github.com/tejing1/nix-search/archive/refs/heads/master.tar.gz"; }) { inherit pkgs; }) ];
}
```

Use:
```
$ nix-search hello-unfree
* hello-unfree (1.0)
  An example package with unfree license (for testing)
```
