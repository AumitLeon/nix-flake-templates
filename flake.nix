{
  description = "A collection of Nix flake templates for development environments";

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
            # Nix development tools
            nixpkgs-fmt # Nix code formatter
            nil # Nix language server
            nix-tree # Visualize Nix dependencies
          ];

          shellHook = ''
            echo "Nix flake templates repository"
            echo "Available templates:"
            echo "  - scala-dev:  Scala development environment"
            echo "  - python-dev: Python development environment with uv"
            echo "  - java-dev:   Java development environment"
          '';
        };
      }
    )
    // {
      templates = {
        scala-dev = {
          path = ./nix/dev/scala;
          description = "Scala development environment with sbt and JVM";
        };

        python-dev = {
          path = ./nix/dev/python;
          description = "Python development environment with uv";
        };

        java-dev = {
          path = ./nix/dev/java;
          description = "Java development environment with JDK and build tools";
        };
      };
    };
}
