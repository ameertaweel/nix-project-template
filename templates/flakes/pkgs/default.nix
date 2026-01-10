# Custom packages, that can be defined similarly to ones from Nixpkgs
# You can build them using:
#   - New CLI: `nix build .#PACKAG_NAME`
#   - Old CLI: `nix-build ./pkgs --attr PACKAG_NAME`
{
  pkgs ? (import ../nixpkgs.nix) { },
}:
{
  # example = pkgs.callPackage ./example { };
}
