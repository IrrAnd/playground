# Use /bin/bash instead of bin/sh:
SHELL := /bin/bash

# Defines the default target that `make` will to try to make, or in the case of a phony target, execute the specified commands.
.DEFAULT_GOAL := help

# .PHONY defines parts of the Makefile that are not dependent on any specific file (https://www.gnu.org/software/make/manual/html_node/Phony-Targets.html.
.PHONY: help
help:
# The @ ensures that the command itself is not echoed in the terminal:
	@echo "Available targets:"
	@echo "  make docs: Generate project documentation"
	@echo "  make test: Execute all tests"

.PHONY: docs
docs:
	(cd docs && uv run --cache-dir ../.uv_cache --group docs -- make clean html)

.PHONY: test
test: test_commit_message

.PHONY: test_commit_message
test_commit_message:
	@echo "Testing adherence to conventional commit style"
	@while read -r line; do scripts/ensure_conventional_commit_style.sh <(echo "$$line"); done < <(git log origin/main..HEAD --format=%s)
