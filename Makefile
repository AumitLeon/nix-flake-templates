.PHONY: help lock-all lock-main lock-scala lock-python lock-java

help:
	@echo "Available targets:"
	@echo "  lock-all     - Generate lock files for all flakes"
	@echo "  lock-main    - Generate lock file for main flake"
	@echo "  lock-scala   - Generate lock file for Scala template"
	@echo "  lock-python  - Generate lock file for Python template"
	@echo "  lock-java    - Generate lock file for Java template"

lock-main:
	@echo "Generating lock file for main flake..."
	nix flake update

lock-scala:
	@echo "Generating lock file for Scala template..."
	cd nix/dev/scala && nix flake update

lock-python:
	@echo "Generating lock file for Python template..."
	cd nix/dev/python && nix flake update

lock-java:
	@echo "Generating lock file for Java template..."
	cd nix/dev/java && nix flake update

lock-all: lock-main lock-scala lock-python lock-java
	@echo "All lock files generated!"
