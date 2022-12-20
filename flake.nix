{
  description = "Unison GraphQL";

  inputs.flake-utils.url = "github:numtide/flake-utils";
  inputs.flake-compat.url = "github:edolstra/flake-compat";
  inputs.flake-compat.flake = false;
  inputs.unison.url = "github:ceedubs/unison-nix";

  outputs = { self, nixpkgs, flake-utils, flake-compat, unison }:
    flake-utils.lib.eachDefaultSystem
      (system:
        let
          pkgs = import nixpkgs { inherit system; };
        in
        {
          devShell =
            pkgs.mkShell {
              buildInputs = [
                unison.defaultPackage.${system}
              ];
            };
        }
      );
}
