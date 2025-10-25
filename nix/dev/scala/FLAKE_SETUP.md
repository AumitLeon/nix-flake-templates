# Scala Development Flake

On NixOS, When using this flake with `direnv`, in order for `sbt` to use the correct version of Java, you need to specify it in your .envrc, as follows:

```
use flake

# Create an sbt wrapper that uses the correct Java
mkdir -p .direnv/bin

cat > .direnv/bin/sbt << 'EOF'
#!/usr/bin/env bash
# Find the real sbt by temporarily removing this wrapper's directory from PATH
WRAPPER_DIR="$(cd "$(dirname "$0")" && pwd)"
ORIG_PATH="$PATH"
PATH="${PATH//$WRAPPER_DIR:/}"
PATH="${PATH//:$WRAPPER_DIR/}"
REAL_SBT="$(command -v sbt)"
PATH="$ORIG_PATH"

if [[ -z "$REAL_SBT" ]]; then
  echo "Error: Could not find real sbt executable" >&2
  exit 1
fi

exec "$REAL_SBT" --java-home "$JAVA_HOME" "$@"
EOF

chmod +x .direnv/bin/sbt

# Add our wrapper to PATH
PATH_add .direnv/bin
```
