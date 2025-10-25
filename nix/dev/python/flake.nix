{
  description = "Python development environment with uv";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        python = pkgs.python312;
      in
      {
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            # Python and uv package management
            python
            uv

            # Development tools
            ruff  # Fast Python linter and formatter

            # Language server
            python.pkgs.python-lsp-server
          ];

          shellHook = ''
            echo "Python development environment with uv"
            echo "Python version: $(python --version)"
            echo "uv version: $(uv --version)"
            echo ""
            echo "Quick start:"
            echo "  uv venv                    # Create virtual environment"
            echo "  source .venv/bin/activate  # Activate venv"
            echo "  uv pip install <package>   # Install packages"
            echo "  uv pip compile requirements.in -o requirements.txt  # Generate lockfile"
          '';
        };
      }
    );
}
