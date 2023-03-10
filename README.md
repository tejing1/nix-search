An attempt to recreate the former `nix search` functionality, which has been superceded by the new flakes-oriented cli.

It searches `<nixpkgs>`, rather than any flake, and cleans up output to list packages by attrpath.

# Installation
## NixOS
Integrate the minimal examples below into your nixos config:

Basic nixos installation (unpinned and thus not fully reproducible):
```nix
{ pkgs, ... }:
{
  environment.systemPackages = [ (import (builtins.fetchTarball {
    url = "https://github.com/tejing1/nix-search/archive/refs/heads/master.tar.gz";
  }) { inherit pkgs; }) ];
}
```

Better nixos installation (fill in the commit id and hash to pin properly):
```nix
{ pkgs, ... }:
{
  environment.systemPackages = [ (import (builtins.fetchTarball {
    url = "https://github.com/tejing1/nix-search/archive/<commit_id>.tar.gz";
    hash = "<content_hash>";
  }) { inherit pkgs; }) ];
}

```

## Home-manager
See above, but replace `environment.systemPackages` with `home.packages`.


# Usage
```
$ nix-search hello-unfree
* hello-unfree (1.0)
  An example package with unfree license (for testing)
```
