{
  description = "Simple Nix Project Templates";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };

  outputs =
    {
      self,
      nixpkgs,
    }:
    let
      forAllSystems = nixpkgs.lib.genAttrs [
        "aarch64-linux"
        "aarch64-darwin"
        "x86_64-darwin"
        "x86_64-linux"
      ];
      mkPkgs = system: import nixpkgs { inherit system; };
    in
    {
      templates = {
        default = self.outputs.templates.flakes;
        flakes = {
          path = ./templates/flakes;
          description = "Simple Nix flake project template.";
        };
        no-flakes = {
          path = ./templates/no-flakes;
          description = "Simple Nix non-flake project template.";
        };
      };

      # Nix files formatter (alejandra, nixfmt or nixpkgs-fmt)
      # Run with `nix fmt`
      formatter = forAllSystems (
        system:
        let
          pkgs = mkPkgs system;
        in
        pkgs.nixfmt-tree
      );
    };
}
