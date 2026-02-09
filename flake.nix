{
  description = "Generate license text from templates";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      nixpkgs,
      utils,
    }:
    utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
      {
        packages.default = pkgs.callPackage ./package.nix { };
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            perl
          ];
        };
      }
    );
}
