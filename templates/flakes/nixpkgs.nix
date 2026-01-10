# A Nixpkgs instance that is grabbed from the pinned Nixpkgs commit in the lock file
# This is useful to avoid using channels when using legacy Nix commands
let
  lock = (builtins.fromJSON (builtins.readFile ./flake.lock)).nodes.nixpkgs.locked;
in
  import (fetchTarball {
    url = "https://github.com/nixos/nixpkgs/archive/${lock.rev}.tar.gz";
    sha256 = lock.narHash;
  })
