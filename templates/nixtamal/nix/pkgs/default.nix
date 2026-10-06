# Custom packages, that can be defined similarly to ones from Nixpkgs
# You can build them using:
#   - New CLI: `nix build --file . packages.PACKAG_NAME`
#   - Old CLI: `nix-build . --attr packages.PACKAG_NAME`
let
  inputs = import ../inputs.nix;
in
{
  pkgs ? inputs.pkgs,
}:
{
  # example = pkgs.callPackage ./example { };
}
