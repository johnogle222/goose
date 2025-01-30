{
  description = "goose-ai";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
  };

  outputs = {
    self,
    nixpkgs,
    ...
  }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in {
      devShell.${system} = pkgs.callPackage ./nix/devShell.nix {};
      packages.${system} = rec {
        goose-cli = pkgs.callPackage ./nix/package.nix {};
        default = goose-cli;
      };
    };
}
