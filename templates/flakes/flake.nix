{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };

  outputs =
    {
      self,
      nixpkgs,
    }:
    let
      inherit (self) outputs;
      forAllSystems = nixpkgs.lib.genAttrs [
        "aarch64-linux"
        "aarch64-darwin"
        "x86_64-darwin"
        "x86_64-linux"
      ];
      mkPkgs =
        system:
        import nixpkgs {
          inherit system;
          # config.allowUnfree = true;
          overlays = [
            # Add overlays our own flake exports (from overlays and pkgs dir):
            outputs.overlays.modifications
            outputs.overlays.additions
          ];
        };
    in
    {
      # Custom packages, that can be defined similarly to ones from Nixpkgs
      # You can build them using:
      #   - New CLI: `nix build .#PACKAG_NAME`
      #   - Old CLI: `nix-build ./pkgs --attr PACKAG_NAME`
      packages = forAllSystems (
        system:
        import ./pkgs {
          pkgs = mkPkgs system;
        }
      );

      # Development Environment
      # You can activate it through:
      #   - New CLI: `nix develop`
      #   - Old CLI: `nix-shell -A default`
      devShells = forAllSystems (
        system:
        import ./shell.nix {
          pkgs = mkPkgs system;
        }
      );

      # Custom packages and modifications, exported as overlays
      overlays = import ./overlays;

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
