# Use /bin/bash instead of bin/sh:
SHELL := /bin/bash

# Defines the default target that `make` will to try to make, or in the case of a phony target, execute the specified commands.
.DEFAULT_GOAL := help

# .PHONY defines parts of the Makefile that are not dependent on any specific file (https://www.gnu.org/software/make/manual/html_node/Phony-Targets.html.
.PHONY: help
help:
# The @ ensures that the command itself is not echoed in the terminal:
	@echo "Available targets:"
	@echo "  make docs ........ Generate project documentation"
	@echo "  make git-hooks ... Install Git hooks"
	@echo "  make test ........ Execute all tests"

.PHONY: docs
docs:
	(cd docs && uv run --cache-dir ../.uv_cache --group docs -- make clean html)

.PHONY: test
test: test_commit_message

.PHONY: test_commit_message
test_commit_message:
	@tmpfile=$$(mktemp) && trap 'rm -f "$$tmpfile"' EXIT && \
	git log origin/main..HEAD --format=%s | \
	while read -r line; do \
		echo "$$line" > "$$tmpfile" && \
		if ! pre-commit run --hook-stage commit-msg --commit-msg-filename "$$tmpfile"; then \
		  exit 1; \
		fi; \
	done

.PHONY: git-hooks
git-hooks:
ifeq ($(shell command -v pre-commit 2>/dev/null),)
	@echo "Pre-commit command (https://pre-commit.com) does not exist"
	@echo "Use, e.g., uv (https://docs.astral.sh/uv/guides/tools/#installing-tools), to install it via: uv tool install pre-commit"
else
	@pre-commit install # https://pre-commit.com/#3-install-the-git-hook-scripts
endif
