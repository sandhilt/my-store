
{
  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:NixOS/nixpkgs?ref=nixos-24.11";
  };

  outputs =
    inputs:
    inputs.flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = (import (inputs.nixpkgs) { inherit system; });
      in
      {
        formatter = pkgs.nixfmt-rfc-style;
        devShell = pkgs.mkShell {
          buildInputs = with pkgs; [
            nodejs_18
          ];

          shellHook = ''
            echo "Welcome to the development shell!"
          '';
        };
      }
    );
}
