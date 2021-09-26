let
  sources = import ./nix/sources.nix;
  nixpkgs-mozilla = import sources.nixpkgs-mozilla;
  pkgs = import sources.nixpkgs {
    overlays = [
      nixpkgs-mozilla
    ];
  };
in
  with pkgs;
  stdenv.mkDerivation {
    name = "rust-nix-template";
    src = ./.;

    nativeBuildInputs = [
      pkgconfig
      pkgs.latest.rustChannels.stable.rust
    ];
    
    builder = ./builder.sh;
  }