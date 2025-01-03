# Use /bin/bash instead of bin/sh:
SHELL := /bin/bash

# .PHONY defines parts of the Makefile that are not dependent on any specific file.
.PHONY = help test test_commit_message

# Defines the default target that `make` will to try to make, or in the case of a phony target, execute the specified commands.
.DEFAULT_GOAL := help

# The @ ensures that the command itself is not echoed in the terminal:
help:
	@echo "Available targets:"
	@echo "  make docs: Generate project documentation"
	@echo "  make test: Execute all tests"

docs:
	(cd docs && uv run --cache-dir ../.uv_cache --group docs -- make clean html)

test: test_commit_message

test_commit_message:
	@echo "Testing adherence to conventional commit style"
	@while read -r line; do scripts/ensure_conventional_commit_style.sh <(echo "$$line"); done < <(git log origin/main..HEAD --format=%s)
