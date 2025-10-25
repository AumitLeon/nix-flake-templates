{
  description = "Scala development environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = nixpkgs.legacyPackages.${system};
      in {
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            # Scala toolchain
            scala
            sbt

            # JDK
            jdk21
          ];

          shellHook = ''
            echo "Scala development environment"
            echo "Scala version: $(scala -version 2>&1)"
            echo "sbt version: $(sbt --version 2>&1 | head -n1)"
            echo "Java version: $(java -version 2>&1 | head -n1)"
          '';
        };
      }
    );
}
