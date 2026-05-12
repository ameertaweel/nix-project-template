let
  sources = import ./npins;

  pkgs = import sources.nixpkgs-unstable {
    config.allowUnfree = false;
    overlays = [
      # Add overlays our own project exports (from overlays and pkgs dir):
      overlays.modifications
      overlays.additions
    ];
  };

  overlays = import ./overlays;
in
pkgs
