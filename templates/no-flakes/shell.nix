# Development Environment
# You can activate it through:
#   - New CLI: `nix develop --file shell.nix default`
#   - Old CLI: `nix-shell -A default`
{pkgs ? (import ./nixpkgs.nix)}: {
  default = pkgs.mkShell {
    nativeBuildInputs = with pkgs; [
    ];
  };
}
