# Nix Flake Templates

This is a collection of nix flake templates that I use to power my development environments.

## Available Templates

### Python Development
Python development environment with uv package manager.

```bash
nix flake init --template "github:aumitleon/nix-flake-templates#python-dev"
```

### Java Development
Java development environment with JDK and build tools.

```bash
nix flake init --template "github:aumitleon/nix-flake-templates#java-dev"
```

### Scala Development
Scala development environment with sbt and JVM.

```bash
nix flake init --template "github:aumitleon/nix-flake-templates#scala-dev"
```

## Usage

1. Navigate to your project directory
2. Run one of the template commands above
3. Run `nix develop` to enter the development environment
