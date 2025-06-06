# Use /bin/bash instead of bin/sh:
SHELL := /bin/bash

# Defines the default target that `make` will to try to make, or in the case of a phony target, execute the specified commands.
.DEFAULT_GOAL := help

# .PHONY defines parts of the Makefile that are not dependent on any specific file (https://www.gnu.org/software/make/manual/html_node/Phony-Targets.html.
.PHONY: help
help:
# The @ ensures that the command itself is not echoed in the terminal:
	@echo "Available targets:"
	@echo "  make docs ............... Generate project documentation"
	@echo "  make git-hooks .......... Install Git hooks"
	@echo "  make pre-commit-check ... Check whether pre-commit is installed"
	@echo "  make pre-commit-tests ... Execute pre-commit tests"
	@echo "  make test ............... Execute all tests"

.PHONY: docs
docs:
	(cd docs && uv run --cache-dir ../.uv_cache --group docs -- make clean html)

.PHONY: test
test: pre-commit-tests

.PHONY: pre-commit-tests
pre-commit-tests: pre-commit-check
	@pre-commit run --hook-stage pre-commit --all-files
	@tmpfile=$$(mktemp) && trap 'rm -f "$$tmpfile"' EXIT && \
	git log origin/main..HEAD --format=%s | \
	while read -r line; do \
		echo "$$line" > "$$tmpfile" && \
		if ! pre-commit run --hook-stage commit-msg --commit-msg-filename "$$tmpfile"; then \
		  exit 1; \
		fi; \
	done

.PHONY: pre-commit-check
pre-commit-check:
	@if ! command -v pre-commit &> /dev/null; then \
		echo "Error: pre-commit (https://pre-commit.com) is not installed. Use, e.g., uv (https://docs.astral.sh/uv/guides/tools/#installing-tools), to install it via: uv tool install pre-commit."; \
		exit 1; \
	fi

.PHONY: git-hooks
git-hooks: pre-commit-check
	@pre-commit install # https://pre-commit.com/#3-install-the-git-hook-scripts