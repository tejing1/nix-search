An attempt to recreate the former `nix search` functionality, which has been superceded by the new flakes-oriented cli.

Basic installation:
```nix
{ pkgs, ... }:
{
  environment.systemPackages = [ (import (builtins.fetchTarball { url = ""; }) { inherit pkgs; }) ];
}
```
