# Development Environment
# You can activate it through:
#   - New CLI: `nix develop --file shell.nix default`
#   - Old CLI: `nix-shell -A default`
let
  inputs = import ./nix/inputs.nix;
in
{
  pkgs ? inputs.pkgs,
}:
{
  default = pkgs.mkShell {
    nativeBuildInputs = [
      # This project uses npins for input pinning
      pkgs.npins
    ];

    # Custom npins directory
    NPINS_DIRECTORY = "nix/npins";
  };
}
