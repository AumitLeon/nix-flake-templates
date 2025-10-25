{
  description = "Java development environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            # JDK
            jdk17

            # Build tools
            maven
            gradle

            # Language server and development tools
            jdt-language-server

            # Additional utilities
            jq  # Useful for working with JSON
          ];

          shellHook = ''
            echo "Java development environment"
            echo "Java version: $(java -version 2>&1 | head -n1)"
            echo "Maven version: $(mvn --version | head -n1)"
            echo "Gradle version: $(gradle --version | grep '^Gradle' | head -n1)"
          '';
        };
      }
    );
}
